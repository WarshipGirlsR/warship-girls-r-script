local co = require 'Co'
local homeFactory = require 'GoMission__home'
local networkFactory = require 'GoMission__network'
local pauseFactory = require 'GoMission__pause'
local loginFactory = require 'GoMission__login'
local battleOnceFactory = require 'GoMission__battleOnce'
local missionFactory = require 'GoMission__mission'
local expeditionRewardFactory = require 'GoMission__expeditionReward'
local expeditionOnceFactory = require 'GoMission__expeditionOnce'
local repairOnceFactory = require 'GoMission__repairOnce'
local exerciseOnceFactory = require 'GoMission__exerciseOnce'
local campaignOnceFactory = require 'GoMission__campaignOnce'


local c = coroutine




-- 保存整个GoMission共享的参数
local allOptions = {
  map = nil,
  settings = nil,
}

-- 运行时的变量，也是共享的
local stateTree = {}

-- 将分散在各个文件的任务集合到一起
local missions = {
  home = homeFactory(allOptions, stateTree),
  network = networkFactory(allOptions, stateTree),
  pause = pauseFactory(allOptions, stateTree),
  login = loginFactory(allOptions, stateTree),
  battleOnce = battleOnceFactory(allOptions, stateTree),
  mission = missionFactory(allOptions, stateTree),
  expeditionReward = expeditionRewardFactory(allOptions, stateTree),
  expeditionOnce = expeditionOnceFactory(allOptions, stateTree),
  repairOnce = repairOnceFactory(allOptions, stateTree),
  exerciseOnce = exerciseOnceFactory(allOptions, stateTree),
  campaignOnce = campaignOnceFactory(allOptions, stateTree),
}

return {
  init = function(map, settings)
    -- 定义需要全局监听状态
    allOptions.map = map
    allOptions.settings = settings

    return missions
  end,
  next = function(action, state)
    state = table.assign(stateTree, state)
    return co(c.create(function()
      for key, item in pairs(missions) do
        local newAction, newState = c.yield(item(action, state))
        if (newAction) then
          return newAction, newState
        end
      end
    end))
  end
}
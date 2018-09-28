-- 载入 lua-require
require('lua-require')({
  osExit = function()
    lua_exit()
    mSleep(1)
    mSleep(1)
    mSleep(1)
  end,
})

isPause = false
luaExisted = false
function beforeUserExit()
  luaExisted = true
end

-- 解锁手机屏幕
if (deviceIsLock() ~= 0) then
  unlockDevice()
end

initLog('warship-girls-r-script', 1)

require 'TSLib'
require './lib/table-polyfill'
require './lib/string-polyfill'
require './lib/console'
require './utils/keep-screen-hock'
require './utils/multi-color-hock'
require './utils/device-orient-hock'
require './utils/clear-log'

EventQuery = require './lib/event-query'
Promise = require './lib/promise'

local co = require './lib/co'
local socket = require 'socket'
local createChain = require('./lib/mission-chain').createChain
local missionsList = require './missions/index'
local stepLabel = (require './utils/step-label').init('stopbtn')
local optionsLabel = require './options-label'
local store = require './store'
local lfs = require './utils/lfs'
require './utils/clear-log'

console.log('version 20180506-1847')

Promise.setStackTraceback(setStackTraceback or false)

local c = coroutine


local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    EventQuery.setTimeout(resolve, ms)
  end)
end

stepLabel.setStepLabelContent('开始')

function closeStepLabel()
  fwCloseView('steplabel', 'text1')
end

stepLabel.setStepLabelContent('等待音量面板收起')
mSleep(500)


closeStepLabel()
local ret, settings = optionsLabel()
stepLabel.setStepLabelContent('正在载入...')
if (ret ~= 1) then
  stepLabel.setStepLabelContent('取消运行')
  mSleep(100000)
  lua_exit()
end

store.settings = settings

-- 注册按钮事件，目前只有暂停按钮
EventQuery.setButotnListener('stopbtn', function()
  if (isPause) then
    --    stepLabel.setPrefix('')
    --    isPause = false
  else
    stepLabel.setPrefix('即将暂停 ')
    isPause = true
  end
end)


co(c.create(function()

  local theMissionsQuery = {}

  table.insert(theMissionsQuery, { isBase = true, type = 'BATTLE_INIT' })

  local theChain = createChain(missionsList)

  -- 启动任务链
  c.yield(theChain.runMission({
    missionsQuery = theMissionsQuery,
    -- 在每次循环执行过 action 之后调用
    afterAction = function(res)
      local action = res.action
      local nextAction = res.nextAction
      local missionsQuery = res.missionsQuery
      local runStartTime = res.runStartTime

      return co(c.create(function()
        if (action.isEnd) then
          local diffTime = (socket.gettime() * 1000) - runStartTime
          if (diffTime < (settings.missionsInterval * 1000)) then
            local remainTime = (settings.missionsInterval * 1000) - diffTime
            stepLabel.setStepLabelContent('休息剩余时间' .. math.ceil(remainTime / 1000) .. '秒')
            while (remainTime > 0) do
              stepLabel.setStepLabelContent('休息剩余时间' .. math.ceil(remainTime / 1000) .. '秒', true)
              c.yield(sleepPromise(1000))
              remainTime = remainTime - 1000
            end
          end
        end
      end))
    end,
  }))
end)).catch(function(err)
  wLog("warship-girls-r-script", "[DATE] " .. err);
  nLog(err)
  EventQuery.setImmediate(function() error(err) end)
end)

EventQuery.run()

runCount = 1
isPause = false
luaExisted = false
function beforeUserExit()
  luaExisted = true
  --  vibrator(500)
  --  mSleep(500)
  --  vibrator(500)
end

if (deviceIsLock() ~= 0) then
  unlockDevice()
end
mSleep(true)
initLog('warship-girls-r-script', 1)

require 'TSLib'
require 'TableLib'
require 'StringLib'
require 'console'
require 'KeepScreenHock'
require 'MultiColorHock'
require 'DeviceOrientHock'
local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
local sz = require 'sz'
local socket = require 'szocket.core'
local mapMaker = require 'BaseOperate'
local gomission = require 'GoMission'
local stepLabel = (require 'StepLabel').init('stopbtn')
local optionsLabel = require 'optionsLabel'
local lfs = require 'lfs'

Promise.setStackTraceback(setStackTraceback or false)

-- 删除大于7天并且大于50条的log，避免日志过大
local _ = (function()
  local logPath = userPath() .. '/log'
  local dirs = lfs.dir(logPath)
  local sevenDayBeforeTime = os.time() - (7 * 24 * 60 * 60)
  local theTime = os.time()

  local dirsLen = #dirs

  dirs = table.filter(dirs, function(e, index)
    if (string.startWith(e, 'warship-girls-r-script_')) then
      local res = string.match(e, 'warship%-girls%-r%-script_(%d+)')
      res = tonumber(res) or theTime
      if ((index < (dirsLen - 50)) and (res < sevenDayBeforeTime)) then
        return true
      end
    end
    return false
  end)

  for k, v in ipairs(dirs) do
    lfs.rm(logPath .. '/' .. v)
  end
end)()

local c = coroutine


local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    eq.setTimeout(resolve, ms)
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

-- 注册按钮事件，目前只有暂停按钮
eq.setButotnListener('stopbtn', function()
  if (isPause) then
    --    stepLabel.setPrefix('')
    --    isPause = false
  else
    stepLabel.setPrefix('即将暂停 ')
    isPause = true
  end
end)

gomission.init(mapMaker(), settings)

local theMissionsQuery = {}

co(c.create(function()
  if (settings.missionEnable
    or settings.expeditionEnable
    or settings.battleEnable
    or settings.repairEnable
    or settings.exerciseEnable
    or settings.disintegrateShipEnable
    or settings.campaignEnable) then

    -- 插入一个特殊的任务表示这是队列的开头
    table.insert(theMissionsQuery, { isBase = true, isStart = true })
    -- 是否运行任务
    if (settings.missionEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'MISSION_START' })
    end
    -- 是否运行远征
    if (settings.expeditionEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_REWARD_START' })
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_ONCE_START' })
    end
    -- 是否运行出征
    if (settings.battleEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'BATTLE_INIT' })
    end
    -- 是否运行演习
    if (settings.exerciseEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'EXERCISE_START' })
    end
    -- 是否运行战役
    if (settings.campaignEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'CAMPAIGN_START' })
    end
    -- 是否运行修理
    if (settings.repairEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'REPAIR_ONCE_START' })
    end
    -- 是否运行解体
    if (settings.disintegrateShipEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'DISINTEGRATE_SHIP_INIT' })
    end
    -- 插入一个特殊任务表示这是队列的结尾
    table.insert(theMissionsQuery, { isBase = true, isEnd = true })

    runCount = 1
    local runStartTime = socket.gettime() * 1000
    while (true) do
      -- 任务队列里没有任务则停止运行
      local action = theMissionsQuery[1]
      if ((#theMissionsQuery == 0) or (not action)) then
        break
      end

      if (action.isStart) then
        runStartTime = socket.gettime() * 1000
      end

      -- 如果是队列原有任务则将其加入队列末尾，以保证能一直循环
      -- 如果是从原有任务衍生的下一步任务，则不加入队列末尾，会被新的下一步任务替换或者删除
      if (action.isBase) then
        table.insert(theMissionsQuery, action)
      end

      -- 执行一个action
      if (action.type) then
        local newAction = c.yield(gomission.next(action))
        if (type(newAction) == 'table') then
          if (newAction.addToStart) then
            table.insert(theMissionsQuery, 1, newAction)
          else
            theMissionsQuery[1] = newAction
          end
        else
          table.remove(theMissionsQuery, 1)
        end
      else
        table.remove(theMissionsQuery, 1)
      end

      -- 如果点了暂停按钮
      if (isPause) then
        stepLabel.setPrefix('')
        local lasttext = stepLabel.getText()
        stepLabel.setStepLabelContent('暂停')
        c.yield(Promise.new(function(resolve)
          local theEid
          theEid = eq.setButotnListener('stopbtn', function()
            isPause = false
            stepLabel.setPrefix('')
            eq.clearButotnListener(theEid)
            resolve()
          end)
        end))
        stepLabel.setStepLabelContent(lasttext)
      end

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

        if (luaExisted) then
          break
        end

        runCount = runCount + 1
      end

      -- 如果是任务队列结尾标志，则count+1
    end
  end
end)).catch(function(err)
  wLog("warship-girls-r-script", "[DATE] " .. err);
  console.log(err)
  eq.setImmediate(function()
    error(err)
  end)
end)

eq.run()

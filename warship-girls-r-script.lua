runCount = 1
local isPause = false
initLog('warship-girls-r-script', 0)

require 'console'
require 'KeepScreenHock'
require 'TSLib'
require 'DeviceOrientHock'
local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
local sz = require 'sz'
local json = sz.json
local socket = require 'szocket.core'
local mapMaker = require 'BaseOperate'
local gomission = require 'GoMission'
local stepLabel = require 'StepLabel'
require 'KeepScreenHock'
require 'TSLib'
require 'DeviceOrientHock'



local width, height = getScreenSize()

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



-- 设置
local settingTable = {
  ['style'] = 'default',
  ['width'] = height,
  ['height'] = height,
  ['config'] = 'save_shipr1-1.dat',
  ['timer'] = 5,
  ['orient'] = 1,
  ['pagetype'] = 'multi',
  ['title'] = '选项',
  ['cancelname'] = '取消',
  ['okname'] = '开始',
  ['rettype'] = 'table',
  ['pages'] = {
    {
      {
        ['type'] = 'Label',
        ['text'] = '第一次设置建议在竖屏下设置，设置好后再切换到游戏界面',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '向左滑动查看其他选项',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '任务',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'missionEnable',
        ['width'] = width / 2,
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '远征',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'expeditionEnable',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '出征',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'battleEnable',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '修理',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'repairEnable',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '演习',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'exerciseEnable',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '开启,关闭',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '每一轮的间隔时间(秒)',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'missionsInterval',
        ['type'] = 'Edit',
        ['width'] = width / 2,
        ['prompt'] = '最短间隔时间(秒)',
        ['text'] = '15',
        ['kbtype'] = 'number',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
    {
      {
        ['type'] = 'Label',
        ['text'] = '任务设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
    {
      {
        ['type'] = 'Label',
        ['text'] = '远征设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '收获和派遣是否连着',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'expeditionTogether',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '现在可以参加的远征章节',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionEnableChapter',
        ['type'] = 'CheckBoxGroup',
        ['list'] = '第一章,第二章,第三章,第四章,第五章,第六章,第七章',
        ['select'] = '0@1@2@3',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '远征使用快速修理',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'expeditionQuickRepair',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '自动参加的远征章节',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '1队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet1',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '2队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet2',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '3队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet3',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '4队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet4',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
    {
      {
        ['type'] = 'Label',
        ['text'] = '出征设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '章节',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleChapter',
        ['type'] = 'CheckBoxGroup',
        ['list'] = '1-1,1-2,1-3,1-4,1-5,2-1,2-2,2-3,2-4,2-5,2-6,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,5-5,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '舰队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1队,2队,3队,4队',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'battlePursue',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '追击Boss',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'battlePursueBoss',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '使用快速修理',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'battleQuickRepair',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '不能出征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'battleAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '最多几战',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'battleMaxBattleNum',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '1,2,3,4,5',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },

    {
      {
        ['type'] = 'Label',
        ['text'] = '挑战设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '舰队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1队,2队,3队,4队',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['width'] = width / 4,
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
        ['nowrap'] = 1,
      },
      {
        ['id'] = 'exercisePursue',
        ['type'] = 'RadioGroup',
        ['width'] = width / 2,
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },

    {
      {
        ['type'] = 'Label',
        ['text'] = '修理设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
  }
}
local settingTableStr = json.encode(settingTable);
closeStepLabel()
local ret, settings = showUI(settingTableStr);
if (ret ~= 1) then
  stepLabel.setStepLabelContent('取消运行')
  mSleep(100000)
  lua_exit()
end
stepLabel.setStepLabelContent('正在载入...')
-- --转换settings结果
local __tmp = (function(settings)
  function transStrToTable(str)
    local list = {}
    local strArr = {}
    if (type(str) == 'string') then
      strArr = strSplit(str, ',')
    elseif (type(str) == 'table') then
      strArr = str
    end
    for i, v in ipairs(strArr) do
      list['' .. (i - 1)] = v
    end
    return list
  end

  -- 出征
  settings.battleEnable = (function(battleEnable)
    local list = transStrToTable({ true, false, })
    return list[battleEnable] or false
  end)(settings.battleEnable)
  -- 修理
  settings.repairEnable = (function(repairEnable)
    local list = transStrToTable({ true, false, })
    return list[repairEnable] or false
  end)(settings.repairEnable)
  -- 任务
  settings.missionEnable = (function(missionEnable)
    local list = transStrToTable({ true, false, })
    return list[missionEnable] or false
  end)(settings.missionEnable)
  -- 远征
  settings.expeditionEnable = (function(expeditionEnable)
    local list = transStrToTable({ true, false, })
    return list[expeditionEnable] or false
  end)(settings.expeditionEnable)
  -- 演习
  settings.exerciseEnable = (function(exerciseEnable)
    local list = transStrToTable({ true, false, })
    return list[exerciseEnable] or false
  end)(settings.exerciseEnable)
  -- 总循环间隔时间
  settings.missionsInterval = tonumber(settings.missionsInterval) or 0
  -- 远征收获和派遣是否连续（否则先收获，再出征，再派遣），为了可以在远征的间隙出征一次
  settings.expeditionTogether = (function(expeditionTogether)
    local list = transStrToTable({ true, false, })
    return list[expeditionTogether] or false
  end)(settings.expeditionTogether)
  -- 选择远征可用关卡
  settings.expeditionEnableChapter = (function(expeditionEnableChapter)
    local tempArr = strSplit(expeditionEnableChapter, '@')
    local list = transStrToTable({ 1, 2, 3, 4, 5, 6, 7, })
    local result = {}
    for _, v in ipairs(tempArr) do
      if (type(list[v]) == 'number') then
        table.insert(result, list[v])
      end
    end
    return result
  end)(settings.expeditionEnableChapter)
  -- 选择远征要参加的章节
  settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 = (function(fleet1, fleet2, fleet3, fleet4)
    local list = transStrToTable({
      false, '1-1', '1-2', '1-3', '1-4',
      '2-1', '2-2', '2-3', '2-4',
      '3-1', '3-2', '3-3', '3-4',
      '4-1', '4-2', '4-3', '4-4',
      '5-1', '5-2', '5-3', '5-4',
      '6-1', '6-2', '6-3', '6-4',
      '7-1', '7-2', '7-3', '7-4',
    })
    return (list[fleet1] or false), (list[fleet2] or false), (list[fleet3] or false), (list[fleet4] or false)
  end)(settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4)
  settings.expeditionFleetToChapter = { settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 }
  -- 远征是否使用快速修理
  settings.expeditionQuickRepair = (function(expeditionQuickRepair)
    local list = transStrToTable({ true, false, })
    return list[expeditionQuickRepair] or false
  end)(settings.expeditionQuickRepair)
  -- 选择关卡
  settings.battleChapter = (function(battleChapter)
    local tempArr = strSplit(battleChapter, '@')
    local list = transStrToTable({
      '1-1', '1-2', '1-3', '1-4', '1-5',
      '2-1', '2-2', '2-3', '2-4', '2-5', '2-6',
      '3-1', '3-2', '3-3', '3-4',
      '4-1', '4-2', '4-3', '4-4',
      '5-1', '5-2', '5-3', '5-4', '5-5',
      '6-1', '6-2', '6-3', '6-4',
      '7-1', '7-2', '7-3', '7-4',
    })
    local result = {}
    for _, v in ipairs(tempArr) do
      if (type(list[v]) == 'string') then
        table.insert(result, list[v])
      end
    end
    return result
  end)(settings.battleChapter)
  -- 选择舰队
  settings.battleFleet = (function(battleFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[battleFleet] or 1
  end)(settings.battleFleet)
  -- 是否追击
  settings.battlePursue = (function(battlePursue)
    local list = transStrToTable({ true, false, })
    return list[battlePursue] or false
  end)(settings.battlePursue)
  -- 是否追击Boss
  settings.battlePursueBoss = (function(battlePursueBoss)
    local list = transStrToTable({ true, false, })
    return list[battlePursueBoss] or false
  end)(settings.battlePursueBoss)
  -- 是否使用快速修理
  settings.battleQuickRepair = (function(battleQuickRepair)
    local list = transStrToTable({ true, false, })
    return list[battleQuickRepair] or false
  end)(settings.battleQuickRepair)
  -- 当无法出征时是否跳过出征
  settings.battleAlertWhenNoHp = (function(battleAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[battleAlertWhenNoHp] or false
  end)(settings.battleAlertWhenNoHp)
  -- 出征最大战斗次数
  settings.battleMaxBattleNum = (function(battleMaxBattleNum)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[battleMaxBattleNum] or 1
  end)(settings.battleMaxBattleNum)


  -- 选择舰队
  settings.exerciseFleet = (function(exerciseFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[exerciseFleet] or 1
  end)(settings.exerciseFleet)
  -- 是否追击
  settings.exercisePursue = (function(exercisePursue)
    local list = transStrToTable({ true, false, })
    return list[exercisePursue] or false
  end)(settings.exercisePursue)
  -- 是否使用快速修理
  settings.exerciseQuickRepair = (function(exerciseQuickRepair)
    local list = transStrToTable({ true, false, })
    return list[exerciseQuickRepair] or false
  end)(settings.exerciseQuickRepair)
end)(settings)

-- --转换settings结果


gomission.init(mapMaker(), stepLabel, settings)

local theMissionsQuery = {}

co(c.create(function()
  if (settings.missionEnable or settings.expeditionEnable or settings.battleEnable or settings.repairEnable or settings.exerciseEnable) then

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
    -- 是否运行修理
    if (settings.repairEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'REPAIR_ONCE_START' })
    end
    -- 插入一个特殊任务表示这是队列的结尾
    table.insert(theMissionsQuery, { isBase = true, isEnd = true })



    runCount = 1
    local runStartTime = socket.gettime() * 1000
    while (true) do
      -- 任务队列里没有任务则停止运行
      local action = theMissionsQuery[1]
      if (not action) then
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

      if (action.type) then
        local newAction = c.yield(gomission.next(action))
        if (newAction) then
          theMissionsQuery[1] = newAction
        else
          table.remove(theMissionsQuery, 1)
        end
      else
        table.remove(theMissionsQuery, 1)
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

        runCount = runCount + 1
      end

      -- 如果是任务队列结尾标志，则count+1
    end
  end
end)).catch(nLog)

eq.run()

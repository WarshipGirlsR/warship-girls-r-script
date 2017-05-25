runCount = 1
isPause = false
luaExisted = false
function beforeUserExit()
  luaExisted = true
  vibrator(500)
  mSleep(500)
  vibrator(500)
end

if (deviceIsLock() ~= 0) then
  unlockDevice()
end

initLog('warship-girls-r-script', 1)

require 'TableLib'
require 'console'
require 'KeepScreenHock'
require 'TSLib'
require 'DeviceOrientHock'
local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
Promise.setStackTraceback(false)
local sz = require 'sz'
local json = sz.json
local socket = require 'szocket.core'
local mapMaker = require 'BaseOperate'
local gomission = require 'GoMission'
local stepLabel = (require 'StepLabel').init('stopbtn')
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
  ['config'] = 'save_warship-girls-r-script.dat',
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
        ['text'] = '任务',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'missionEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '远征',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '出征',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '修理',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'repairEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '演习',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '战役',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '决战无畏之海',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '每一轮的间隔时间(秒)',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'missionsInterval',
        ['type'] = 'Edit',
        ['prompt'] = '最短间隔时间(秒)',
        ['text'] = '15',
        ['kbtype'] = 'number',
      },
      {
        ['type'] = 'Label',
        ['text'] = '多长时间画面不变则重启游戏(秒)最少60秒',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'restartInterval',
        ['type'] = 'Edit',
        ['prompt'] = '多长时间画面不变则重启游戏(秒)最少60秒',
        ['text'] = '120',
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
        ['text'] = '收获和派遣是否连着',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionTogether',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '使用快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能远征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
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
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battlePursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击Boss',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battlePursueBoss',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '使用快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '迂回',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRoundabout',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能出征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '最多几战',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleMaxBattleNum',
        ['type'] = 'RadioGroup',
        ['list'] = '1,2,3,4,5',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '6-1a点遇到航母SL',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRebootAt6_1AMeetCV',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
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
        ['text'] = '演习设置',
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
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exercisePursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
        ['select'] = '1',
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
        ['text'] = '战役设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '关卡',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignChapter',
        ['type'] = 'RadioGroup',
        ['list'] = '驱逐,巡洋,战列,航母,潜艇',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '难度',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignDifficulty',
        ['type'] = 'RadioGroup',
        ['list'] = '普通,困难',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignPursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能出征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
        ['select'] = '1',
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

    {
      {
        ['type'] = 'Label',
        ['text'] = '决战无畏之海',
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
        ['id'] = 'activityChapter',
        ['type'] = 'CheckBoxGroup',
        ['list'] = '1,2,3,3.5,4',
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
        ['id'] = 'activityFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1队,2队,3队,4队',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityPursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击Boss',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityPursueBoss',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '使用快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '迂回',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityRoundabout',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能出征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '最多几战',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityMaxBattleNum',
        ['type'] = 'RadioGroup',
        ['list'] = '1,2,3,4,5',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
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
  -- 战役
  settings.campaignEnable = (function(campaignEnable)
    local list = transStrToTable({ true, false, })
    return list[campaignEnable] or false
  end)(settings.campaignEnable)
  -- 决战无畏之海
  settings.activityEnable = (function(activityEnable)
    local list = transStrToTable({ true, false, })
    return list[activityEnable] or false
  end)(settings.activityEnable)
  -- 总循环间隔时间
  settings.missionsInterval = tonumber(settings.missionsInterval) or 0
  -- 多长时间界面不变则重启，最少60秒
  settings.restartInterval = tonumber(settings.restartInterval) or 120
  settings.restartInterval = math.max(settings.restartInterval, 60)

  -- 远征收获和派遣是否连续（否则先收获，再出征，再派遣），为了可以在远征的间隙出征一次
  settings.expeditionTogether = (function(expeditionTogether)
    local list = transStrToTable({ true, false, })
    return list[expeditionTogether] or false
  end)(settings.expeditionTogether)
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
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[expeditionQuickRepair] or 2
  end)(settings.expeditionQuickRepair)
  -- 当无法远征时是否震动提示
  settings.expeditionAlertWhenNoHp = (function(expeditionAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[expeditionAlertWhenNoHp] or false
  end)(settings.expeditionAlertWhenNoHp)
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
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[battleQuickRepair] or 2
  end)(settings.battleQuickRepair)
  -- 迂回战术
  settings.battleRoundabout = (function(battleRoundabout)
    local list = transStrToTable({ true, false, })
    return list[battleRoundabout] or false
  end)(settings.battleRoundabout)
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
  -- 阵型
  settings.battleFormation = (function(battleFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[battleFormation] or 2
  end)(settings.battleFormation)
  -- 6-1a点遇到航母SL
  settings.battleRebootAt6_1AMeetCV = (function(battleRebootAt6_1AMeetCV)
    local list = transStrToTable({ true, false })
    return list[battleRebootAt6_1AMeetCV] or false
  end)(settings.battleRebootAt6_1AMeetCV)

  -- 演习
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
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[exerciseQuickRepair] or 2
  end)(settings.exerciseQuickRepair)
  -- 阵型
  settings.exerciseFormation = (function(exerciseFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[exerciseFormation] or 2
  end)(settings.exerciseFormation)

  -- 战役
  -- 选择关卡
  settings.campaignChapter = (function(campaignChapter)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignChapter] or 1
  end)(settings.campaignChapter)
  -- 选择难度
  settings.campaignDifficulty = (function(campaignDifficulty)
    local list = transStrToTable({ 'default', 'hard' })
    return list[campaignDifficulty] or 'default'
  end)(settings.campaignDifficulty)
  -- 是否追击
  settings.campaignPursue = (function(campaignPursue)
    local list = transStrToTable({ true, false, })
    return list[campaignPursue] or false
  end)(settings.campaignPursue)
  -- 是否使用快速修理
  settings.campaignQuickRepair = (function(campaignQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[campaignQuickRepair] or 2
  end)(settings.campaignQuickRepair)
  -- 不能出征则震动提示
  settings.campaignAlertWhenNoHp = (function(campaignAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[campaignAlertWhenNoHp] or false
  end)(settings.campaignAlertWhenNoHp)
  -- 阵型
  settings.campaignFormation = (function(campaignFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignFormation] or 2
  end)(settings.campaignFormation)
  -- 决战无畏之海
  -- 章节
  settings.activityChapter = (function(activityChapter)
    local list = transStrToTable({ 1, 2, 3, 3.5, 4 })
    return list[activityChapter] or 1
  end)(settings.activityChapter)
  -- 选择舰队
  settings.activityFleet = (function(activityFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[activityFleet] or 1
  end)(settings.activityFleet)
  -- 是否追击Boss
  settings.activityPursueBoss = (function(activityPursueBoss)
    local list = transStrToTable({ true, false, })
    return list[activityPursueBoss] or false
  end)(settings.activityPursueBoss)
  -- 是否使用快速修理
  settings.activityQuickRepair = (function(activityQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[activityQuickRepair] or 2
  end)(settings.activityQuickRepair)
  -- 迂回战术
  settings.activityRoundabout = (function(activityRoundabout)
    local list = transStrToTable({ true, false, })
    return list[activityRoundabout] or false
  end)(settings.activityRoundabout)
  -- 当无法出征时是否跳过出征
  settings.activityAlertWhenNoHp = (function(activityAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[activityAlertWhenNoHp] or false
  end)(settings.activityAlertWhenNoHp)
  -- 出征最大战斗次数
  settings.activityMaxBattleNum = (function(activityMaxBattleNum)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[activityMaxBattleNum] or 1
  end)(settings.activityMaxBattleNum)
  -- 阵型
  settings.activityFormation = (function(activityFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[activityFormation] or 2
  end)(settings.activityFormation)
end)(settings)

-- --转换settings结果

-- 注册按钮事件，目前只有暂停按钮
eq.setButotnListener('stopbtn', function()
  if (isPause) then
    stepLabel.setPrefix('')
    isPause = false
  else
    stepLabel.setPrefix('即将暂停 ')
    isPause = true
  end
end)

gomission.init(mapMaker(), stepLabel, settings)

local theMissionsQuery = {}

co(c.create(function()
  if (settings.missionEnable
      or settings.expeditionEnable
      or settings.battleEnable
      or settings.repairEnable
      or settings.exerciseEnable
      or settings.campaignEnable
      or settings.activityEnable) then

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
      table.insert(theMissionsQuery, { isBase = true, type = 'BATTLE_START' })
    end
    -- 是否运行演习
    if (settings.exerciseEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'EXERCISE_START' })
    end
    -- 是否运行战役
    if (settings.campaignEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'CAMPAIGN_START' })
    end
    -- 是否运行决战无畏之海
    if (settings.activityEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'ACTIVITY_START' })
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
            if (not isPause) then
              eq.clearButotnListener(theEid)
              resolve()
            end
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
  eq.setImmediate(function() error(err) end)
end)

eq.run()

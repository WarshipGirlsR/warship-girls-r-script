-- 设置默认方向为竖屏，之后自己计算旋转方向
local debug = false
runCount = 1
local isPause = false
initLog("shipr1-1", 0)

init(0)
require "KeepScreenHock"
require "TSLib"
require "DeviceOrientHock"
require "TableLib"
local sz = require "sz"
local socket = require "szocket.core"
local mapMaker = require "BaseOperate"
local gomissionMaker = require "GoMission"
local stepLabel = require "StepLabel"
local json = sz.json

local width, height = getScreenSize()

-- 循环监听方法，返回0表示监听超时，返回非0数字或者字符串表示监听器监听成功的key
local setOnceListener = (function()
  return function(...)
    local listenerList
    local timeoutTime
    local ms

    local needKeepScreenState = false
    local __keepScreenState = keepScreenState
    local endTime

    listenerList = select(1, ...)
    timeoutTime = (select(2, ...) or 1400000000000) / 1000
    ms = select(3, ...) or 500
    endTime = socket.gettime() + timeoutTime

    if (type(listenerList) == "function") then
      listenerList = { listenerList }
      needKeepScreenState = true
    end

    if ((type(listenerList) ~= "table")) then
      return 0
    end

    local result = 0;

    -- 循环本体
    local runFlag = true
    local count = 0
    while (runFlag) do
      count = count + 1

      -- 暂停功能
      local lastText = stepLabel:getText()
      repeat
        local btnval = fwGetPressedButton()
        if btnval == "stopbtn" then
          -- 清除按钮缓存次数
          while (fwGetPressedButton() == "stopbtn") do
          end
          -- 暂停
          if (isPause) then
            isPause = false
            stepLabel:setStepLabelContent(lastText)
          else
            isPause = true
            stepLabel:setStepLabelContent("暂停")
          end
        end
        if (isPause) then
          mSleep(1000)
        end
      until (not isPause)


      if ((needKeepScreenState) and (not __keepScreenState)) then keepScreen(true) end
      getDeviceOrient()
      for i, listener in ipairs(listenerList) do
        if runFlag == false then break end
        if (type(listener) == "function") then
          local res = listener()
          if (res) then
            runFlag = false
            result = i
            break
          end
        elseif (type(listener) == "table") then
          if ((#listener > 0) and (type(listener[2]) == "function")) then
            local res = listener[2]()
            if (res) then
              runFlag = false
              result = i[1]
              break
            end
          else
            for i, lsn in pairs(listener) do
              local res = lsn()
              if (res) then
                runFlag = false
                result = i
                break
              end
            end
          end
        end
      end
      if ((needKeepScreenState) and (not __keepScreenState)) then keepScreen(false) end
      mSleep(ms)
      if (endTime < socket.gettime()) then
        runFlag = false
        result = 0
        break
      end
    end

    return result
  end
end)()




















stepLabel:setStepLabelContent("开始")

function closeStepLabel()
  fwCloseView("steplabel", "text1")
end

stepLabel:setStepLabelContent("等待音量面板收起")
mSleep(500)


local gomission = gomissionMaker(mapMaker(), stepLabel, setOnceListener)




-- 设置
local settingTable = {
  ["style"] = "default",
  ["width"] = height,
  ["height"] = height,
  ["config"] = "save_shipr1-1.dat",
  ["timer"] = 15,
  ["orient"] = 1,
  ["pagetype"] = "multi",
  ["title"] = "选项",
  ["cancelname"] = "取消",
  ["okname"] = "开始",
  ["rettype"] = "table",
  ["pages"] = {
    {
      {
        ["type"] = "Label",
        ["text"] = "第一次设置建议在竖屏下设置，设置好后再切换到游戏界面",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["type"] = "Label",
        ["text"] = "向左滑动查看其他选项",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "任务",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "missionEnable",
        ["width"] = width / 2,
        ["type"] = "RadioGroup",
        ["list"] = "开启,关闭",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "远征",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "expeditionEnable",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "开启,关闭",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "出征",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "battleEnable",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "开启,关闭",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "修理",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "repairEnable",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "开启,关闭",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "演习",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "exerciseEnable",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "开启,关闭",
        ["select"] = "1",
      },
      {
        ["type"] = "Label",
        ["text"] = " \n \n \n \n \n \n \n \n \n \n",
        ["size"] = 50,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
    },
    {
      {
        ["type"] = "Label",
        ["text"] = "任务设置",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "间隔时间(秒)",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "missionInterval",
        ["type"] = "Edit",
        ["width"] = width / 2,
        ["prompt"] = "最短间隔时间(秒)",
        ["text"] = "15",
        ["kbtype"] = "number",
      },
    },
    {
      {
        ["type"] = "Label",
        ["text"] = "远征设置",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "间隔时间(秒)",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "expeditionInterval",
        ["type"] = "Edit",
        ["width"] = width / 2,
        ["prompt"] = "最短间隔时间(秒)",
        ["text"] = "30",
        ["kbtype"] = "number",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "收获和派遣是否连着",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "expeditionTogether",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "是,否",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["text"] = "现在可以参加的远征章节",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["id"] = "expeditionEnableChapter",
        ["type"] = "CheckBoxGroup",
        ["list"] = "第一章,第二章,第三章,第四章,第五章,第六章,第七章",
        ["select"] = "0@1@2@3",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "远征使用快速修理",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "expeditionQuickRepair",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "是,否",
        ["select"] = "1",
      },
      {
        ["type"] = "Label",
        ["text"] = "自动参加的远征章节",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["type"] = "Label",
        ["text"] = "1队",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["id"] = "expeditionFleet1",
        ["type"] = "RadioGroup",
        ["list"] = "不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["text"] = "2队",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["id"] = "expeditionFleet2",
        ["type"] = "RadioGroup",
        ["list"] = "不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4",
        ["select"] = "2",
      },
      {
        ["type"] = "Label",
        ["text"] = "3队",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["id"] = "expeditionFleet3",
        ["type"] = "RadioGroup",
        ["list"] = "不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4",
        ["select"] = "7",
      },
      {
        ["type"] = "Label",
        ["text"] = "4队",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["id"] = "expeditionFleet4",
        ["type"] = "RadioGroup",
        ["list"] = "不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4",
        ["select"] = "13",
      },
      {
        ["type"] = "Label",
        ["text"] = " \n \n \n \n \n \n \n \n \n \n",
        ["size"] = 50,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
    },
    {
      {
        ["type"] = "Label",
        ["text"] = "出征设置",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "间隔时间(秒)",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "battleInterval",
        ["type"] = "Edit",
        ["width"] = width / 2,
        ["prompt"] = "最短间隔时间(秒)",
        ["text"] = "30",
        ["kbtype"] = "number",
      },
      {
        ["type"] = "Label",
        ["text"] = "章节",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["id"] = "battleChapter",
        ["type"] = "CheckBoxGroup",
        ["list"] = "1-1,1-2,1-3,1-4,1-5,2-1,2-2,2-3,2-4,2-5,2-6,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["text"] = "舰队",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["id"] = "battleFleet",
        ["type"] = "RadioGroup",
        ["list"] = "1队,2队,3队,4队",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "追击",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "battlePursue",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "是,否",
        ["select"] = "1",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "追击Boss",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "battlePursueBoss",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "是,否",
        ["select"] = "1",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "使用快速修理",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "battleQuickRepair",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "是,否",
        ["select"] = "1",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "不能出征则震动提示",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "battleAlertWhenNoHp",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "是,否",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "最多几战",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "battleMaxBattleNum",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "1,2,3,4,5",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["text"] = " \n \n \n \n \n \n \n \n \n \n",
        ["size"] = 50,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
    },

    {
      {
        ["type"] = "Label",
        ["text"] = "挑战设置",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "间隔时间(秒)",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "exerciseInterval",
        ["type"] = "Edit",
        ["width"] = width / 2,
        ["prompt"] = "最短间隔时间(秒)",
        ["text"] = "30",
        ["kbtype"] = "number",
      },
      {
        ["type"] = "Label",
        ["text"] = "舰队",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["id"] = "exerciseFleet",
        ["type"] = "RadioGroup",
        ["list"] = "1队,2队,3队,4队",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "追击",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "exercisePursue",
        ["type"] = "RadioGroup",
        ["width"] = width / 2,
        ["list"] = "是,否",
        ["select"] = "0",
      },
      {
        ["type"] = "Label",
        ["text"] = " \n \n \n \n \n \n \n \n \n \n",
        ["size"] = 50,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
    },

    {
      {
        ["type"] = "Label",
        ["text"] = "修理设置",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
      },
      {
        ["type"] = "Label",
        ["width"] = width / 4,
        ["text"] = "间隔时间(秒)",
        ["size"] = 15,
        ["align"] = "left",
        ["color"] = "0,0,0",
        ["nowrap"] = 1,
      },
      {
        ["id"] = "repairInterval",
        ["type"] = "Edit",
        ["width"] = width / 2,
        ["prompt"] = "最短间隔时间(秒)",
        ["text"] = "30",
        ["kbtype"] = "number",
      },
    },
  }
}
local settingTableStr = json.encode(settingTable);
closeStepLabel()
local ret, settings = showUI(settingTableStr);
if (ret ~= 1) then
  stepLabel:setStepLabelContent("取消运行")
  mSleep(100000)
  lua_exit()
end
stepLabel:setStepLabelContent("正在载入...")
-- --转换settings结果
local __tmp = (function(settings)
  function transStrToTable(str)
    local list = {}
    local strArr = {}
    if (type(str) == "string") then
      strArr = strSplit(str, ",")
    elseif (type(str) == "table") then
      strArr = str
    end
    for i, v in ipairs(strArr) do
      list["" .. (i - 1)] = v
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
  -- 任务间隔时间
  settings.missionInterval = tonumber(settings.missionInterval) or 0
  -- 远征间隔时间
  settings.expeditionInterval = tonumber(settings.expeditionInterval) or 0
  -- 远征收获和派遣是否连续（否则先收获，再出征，再派遣），为了可以在远征的间隙出征一次
  settings.expeditionTogether = (function(expeditionTogether)
    local list = transStrToTable({ true, false, })
    return list[expeditionTogether] or false
  end)(settings.expeditionTogether)
  -- 选择远征可用关卡
  settings.expeditionEnableChapter = (function(expeditionEnableChapter)
    local tempArr = strSplit(expeditionEnableChapter, "@")
    local list = transStrToTable({ 1, 2, 3, 4, 5, 6, 7, })
    local result = {}
    for _, v in ipairs(tempArr) do
      if (type(list[v]) == "number") then
        table.insert(result, list[v])
      end
    end
    return result
  end)(settings.expeditionEnableChapter)
  -- 选择远征要参加的章节
  settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 = (function(fleet1, fleet2, fleet3, fleet4)
    local list = transStrToTable({
      false, "1-1", "1-2", "1-3", "1-4",
      "2-1", "2-2", "2-3", "2-4",
      "3-1", "3-2", "3-3", "3-4",
      "4-1", "4-2", "4-3", "4-4",
      "5-1", "5-2", "5-3", "5-4",
      "6-1", "6-2", "6-3", "6-4",
      "7-1", "7-2", "7-3", "7-4",
    })
    return (list[fleet1] or false), (list[fleet2] or false), (list[fleet3] or false), (list[fleet4] or false)
  end)(settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4)
  settings.expeditionFleetToChapter = { settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 }
  -- 远征是否使用快速修理
  settings.expeditionQuickRepair = (function(expeditionQuickRepair)
    local list = transStrToTable({ true, false, })
    return list[expeditionQuickRepair] or false
  end)(settings.expeditionQuickRepair)
  -- 出征间隔时间
  settings.battleInterval = tonumber(settings.battleInterval) or 0
  -- 选择关卡
  settings.battleChapter = (function(battleChapter)
    local tempArr = strSplit(battleChapter, "@")
    local list = transStrToTable({
      "1-1", "1-2", "1-3", "1-4", "1-5",
      "2-1", "2-2", "2-3", "2-4", "2-5", "2-6",
      "3-1", "3-2", "3-3", "3-4",
      "4-1", "4-2", "4-3", "4-4",
      "5-1", "5-2", "5-3", "5-4",
      "6-1", "6-2", "6-3", "6-4",
      "7-1", "7-2", "7-3", "7-4",
    })
    local result = {}
    for _, v in ipairs(tempArr) do
      if (type(list[v]) == "string") then
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


  -- 挑战间隔时间
  settings.exerciseInterval = tonumber(settings.exerciseInterval) or 0
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



  -- 修理间隔
  settings.repairInterval = tonumber(settings.repairInterval) or 0
end)(settings)
if (debug) then
  stepLabel:setStepLabelContent("debug退出")
  mSleep(10000000)
  lua_exit()
end
-- --转换settings结果

















local beginTime = {
  mission = os.time(),
  expedition = os.time(),
  battle = os.time(),
  repair = os.time(),
  exercise = os.time(),
}

local param = {
  needRepair = true
}


-- 开始流程
if (settings.missionEnable or settings.expeditionEnable or settings.battleEnable or settings.repairEnable or settings.exerciseEnable) then
  local battleChapterArr = (function(battleChapter)
    local newC = {}
    for _, v in ipairs(battleChapter) do
      table.insert(newC, v)
    end
    return newC
  end)(settings.battleChapter)


  stepLabel:setStepLabelContent("正在执行...")
  while (true) do
    local count = 0
    if (settings.missionEnable and (beginTime.mission <= os.time())) then
      count = count + 1
      local res = gomission.mission()
      if (not res) then
        break
      end
      beginTime.mission = os.time() + settings.missionInterval
      mSleep(500)
    end
    if (settings.expeditionEnable and (beginTime.expedition <= os.time())) then
      count = count + 1
      local res = gomission.expeditionReward(settings.expeditionEnableChapter, settings.expeditionTogether)
      if (not res) then
        break
      end
      mSleep(500)
    end
    if (settings.expeditionTogether and settings.expeditionEnable and (beginTime.expedition <= os.time())) then
      count = count + 1
      local res = gomission.expeditionOnce(settings.expeditionFleetToChapter, settings.expeditionQuickRepair)
      if (not res) then
        break
      end
      beginTime.expedition = os.time() + settings.expeditionInterval
      mSleep(500)
    end
    if (settings.battleEnable and (beginTime.battle <= os.time())) then
      count = count + 1
      if (#battleChapterArr > 0) then
        local battleChapter = battleChapterArr[1]
        table.remove(battleChapterArr, 1)
        table.insert(battleChapterArr, battleChapter)
        local res, HPIsSafe = gomission.battleOnce(battleChapter, settings.battlePursue, settings.battlePursueBoss, settings.battleQuickRepair, settings.battleFleet, settings.battleAlertWhenNoHp, settings.battleMaxBattleNum)
        if (not res) then
          break
        end
        if (not HPIsSafe) then
          param.needRepair = true
        end
        beginTime.battle = os.time() + settings.battleInterval
        mSleep(500)
      else
        stepLabel:setStepLabelContent("没有选中章节")
      end
    end
    if ((not settings.expeditionTogether) and settings.expeditionEnable and (beginTime.expedition <= os.time())) then
      count = count + 1
      local res = gomission.expeditionOnce(settings.expeditionFleetToChapter, settings.expeditionQuickRepair)
      if (not res) then
        break
      end
      beginTime.expedition = os.time() + settings.expeditionInterval
      mSleep(500)
    end
    if (settings.exerciseEnable and (beginTime.exercise <= os.time())) then
      count = count + 1
      local res, HPIsSafe = gomission.exerciseOnce(settings.exerciseChapter, settings.exercisePursue, settings.exerciseQuickRepair, settings.exerciseFleet, settings.exerciseMaxBattleNum)
      if (not res) then
        break
      end
      if (not HPIsSafe) then
        param.needRepair = true
      end
      beginTime.exercise = os.time() + settings.exerciseInterval
      mSleep(500)
    end
    if (settings.repairEnable and (beginTime.repair <= os.time()) and param.needRepair) then
      count = count + 1
      local res, needRepair = gomission.repairOnce()
      if (not res) then
        break
      end
      if (not needRepair) then
        param.needRepair = false
      end
      beginTime.repair = os.time() + settings.repairInterval
      mSleep(500)
    end

    if (count > 0) then
      runCount = runCount + 1
    end

    stepLabel:setStepLabelContent(os.date("%X"), true)
    mSleep(1000)
  end
else
  stepLabel:setStepLabelContent("没有需要执行的任务！")
end

for i = 1, 2 do
  vibrator();
  mSleep(1000);
end

closeLog("shipr1-1")
mSleep(100000000)

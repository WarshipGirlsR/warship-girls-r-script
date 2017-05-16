local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'

local c = coroutine

local isArray = table.isArray or function(tab)
  if (type(tab) ~= 'table') then return false end
  local length = #tab
  for key, value in pairs(tab) do
    if ((type(key) ~= 'number') or (key > length)) then
      return false
    end
  end
  return true
end

local assign = function(target, ...)
  local sources = { ... }
  if (type(target) ~= 'table') then target = {} end
  for _, source in ipairs(sources) do
    for key, value in pairs(source) do
      target[key] = value
    end
  end
  return target
end

local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    eq.setTimeout(resolve, ms)
  end)
end

local setScreenListenerPromise = function(actionType, tags, checker)
  return Promise.new(function(resolve)
    eq.setScreenListener(tags, checker, function() resolve(actionType) end)
  end)
end

local setScreenListenerListPromise = function(theArr)
  return co(c.create(function()
    local newArr = {}
    local tags = {}
    local done = false
    if (type(theArr) ~= 'table') then return {} end
    for key, value in ipairs(theArr) do
      if (type(value[2]) == 'table') then
        for _, tag in ipairs(value[2]) do
          table.insert(tags, tag)
        end
      else
        table.insert(tags, value[2])
      end

      if ((type(value[4]) == 'number') and (value[4] > 0)) then
        table.insert(newArr, co(c.create(function()
          c.yield(sleepPromise(value[4]))
          if (not done) then
            return c.yield(setScreenListenerPromise(value[1], value[2], value[3]))
          end
          return
        end)))
      else
        table.insert(newArr, co(c.create(function()
          local res = c.yield(setScreenListenerPromise(value[1], value[2], value[3]))
          done = true
          return res
        end)))
      end
    end
    local res = c.yield(Promise.race(newArr))
    eq.clearScreenListenerByTags(tags)
    return res
  end))
end

local missions = {--  home = function() end,
  --  battleOnce = function() end,
  --  mission = function() end,
  --  expeditionReward = function() end,
  --  expeditionOnce = function() end,
  --  repairOnce = function() end,
  --  exerciseOnce = function() end,
}

local stateTree = {
  expeditionReward = {
    enableChapter = {},
  },
  expedition = {
    expeditionFleetToChapter = {},
  },
  repair = {
    slot = nil,
  },
}

return {
  init = function(map, stepLabel, settings)
    missions.home = function(action, state)
      return co(c.create(function()
        if (action.type == 'HOME_HOME') then
          return nil, state
        elseif (action.type == 'HOME_MEDAL_MODAL') then
          stepLabel.setStepLabelContent("4-15.勋章取消")
          map.home.clickMedalModalCancelBtn()

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'HOME_MEDAL_MODAL', 'homeGroup', map.home.isMedalModal, 2000 },
            { 'HOME_HOME', 'homeGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state
        end

        return nil
      end))
    end

    -- 领取任务奖励
    missions.mission = function(action, state)

      return co(c.create(function()
        if (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then
          stepLabel.setStepLabelContent('2-1.检测是否有任务奖励')
          c.yield(sleepPromise(100))
          local res = map.mission.isUnreceivedMission()
          if (res) then
            return { type = 'MISSION_START_MISSION' }, state
          end
          stepLabel.setStepLabelContent('2-2.没有任务奖励')
          return { type = 'HOME_HOME' }, state

        elseif (action.type == 'MISSION_START_MISSION') then

          stepLabel.setStepLabelContent('2-3.点击任务按钮')
          map.mission.clickMission()
          stepLabel.setStepLabelContent('2-4.等待任务界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'HOME_HOME', 'missionGroup', map.home.isHome, 2000 },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionGroup', map.mission.isMission },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_PAGE') then

          stepLabel.setStepLabelContent('2-5.点击全部任务')
          map.missionClickAllMission()
          stepLabel.setStepLabelContent('2-6.等待任务全部任务界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'HOME_HOME', 'missionGroup', map.home.isHome, 2000 },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionGroup', map.mission.isMission, 2000 },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_IS_MISSION_ALL_MISSION') then

          c.yield(sleepPromise(100))
          local res = map.mission.isMissionUnreceivedReward()
          if (not res) then
            stepLabel.setStepLabelContent('2-7.没有任务奖励')
            return { type = 'MISSION_PAGE_NO_REWAR' }, state
          else
            stepLabel.setStepLabelContent('2-8.有任务奖励')
            map.mission.clickGetFirstReward()
            stepLabel.setStepLabelContent('2-9.等待获得面板')

            local newstateTypes = c.yield(setScreenListenerListPromise({
              { 'MISSION_IS_MISSION_ALL_MISSION', 'missionGroup', map.mission.isMissionAllMission, 2000 },
              { 'MISSION_REWAR_PANNEL', 'missionGroup', map.mission.isRewardPannel },
            }))

            return { type = newstateTypes }, state
          end

        elseif (action.type == 'MISSION_REWAR_PANNEL') then

          stepLabel.setStepLabelContent('2-10.点击确定')
          map.mission.clickRewardPannelOk()
          stepLabel.setStepLabelContent('2-11.等待新船，任务全部任务')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionGroup', map.mission.isMissionAllMission },
            { 'MISSION_REWAR_PANNEL', 'missionGroup', map.mission.isRewardPannel, 2000 },
            { 'HOME_HOME', 'missionGroup', map.home.isHome, 2000 },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_IS_NEW_SHIP') then

          stepLabel.setStepLabelContent('2-12.点击新船')
          map.mission.clickNewShip()
          stepLabel.setStepLabelContent('2-13.等待新船锁定，任务全部任务')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionGroup', map.mission.isMissionAllMission, 2000 },
            { 'MISSION_REWAR_PANNEL', 'missionGroup', map.mission.isRewardPannel, 2000 },
            { 'HOME_HOME', 'missionGroup', map.home.isHome, 2000 },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('2-14.点击新船')
          map.mission.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('2-15.等待任务全部任务')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'MISSION_IS_NEW_SHIP', 'missionGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionGroup', map.mission.isMissionAllMission },
            { 'MISSION_REWAR_PANNEL', 'missionGroup', map.mission.isRewardPannel, 2000 },
            { 'HOME_HOME', 'missionGroup', map.home.isHome, 2000 },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_PAGE_NO_REWAR') then

          stepLabel.setStepLabelContent('2-16.等待返回home')
          map.mission.clickBackToHome()

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'MISSION_PAGE_NO_REWAR', 'missionGroup', map.mission.isMission, 2000 },
            { 'HOME_HOME', 'missionGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state
        end

        return nil
      end))
    end

    -- 远征回收
    missions.expeditionReward = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXPEDITION_REWARD_START') then
          if (type(settings.enableChapter) ~= 'table') then
            settings.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }
          elseif (#settings.enableChapter < 1) then
            stepLabel.setStepLabelContent('3-1.没有远征任务！')
            return { type = 'HOME_HOME' }, state
          end

          -- 复制一份数组
          (function()
            local newC = {}
            for i, v in ipairs(settings.enableChapter) do
              table.insert(newC, v)
            end
            state.expeditionReward.enableChapter = newC
          end)()

          return { type = 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED' }, state

        elseif (action.type == 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED') then

          stepLabel.setStepLabelContent('3-3.检测是否有远征奖励')
          c.yield(sleepPromise(100))
          local res = map.expedition.isExpeditionCompleted()
          if (not res) then
            stepLabel.setStepLabelContent('3-4.没有远征奖励和任务')
            return { type = 'HOME_HOME' }, state
          end
          stepLabel.setStepLabelContent('3-5.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('3-6.等待出征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'expeditionGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'expeditionGroup', map.expedition.isBattle, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

          stepLabel.setStepLabelContent('3-7.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('3-8.等待远征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'expeditionGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'expeditionGroup', map.expedition.isBattle, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

          if (#state.expeditionReward.enableChapter > 0) then
            local chapter = state.expeditionReward.enableChapter[1]
            stepLabel.setStepLabelContent('3-9.移动到第' .. chapter .. '章')
            map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
            state.expedition.lastChapter = chapter
            stepLabel.setStepLabelContent('3-10.检测本页有可收获奖励')
            return { type = 'EXPEDITION_REWARD_CHECK_HAS_REWARD' }, state
          else
            return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }, state
          end

        elseif (action.type == 'EXPEDITION_REWARD_CHECK_HAS_REWARD') then

          local res, list = map.expedition.isThisExpeditionPageHasReward()
          if (res) then
            local v = list[1]
            stepLabel.setStepLabelContent('3-11.点击第' .. v .. '节')
            map.expedition.clickExpeditionBtn(v)
            stepLabel.setStepLabelContent('3-12.等待远征完成页面')

            local newstateTypes = c.yield(setScreenListenerListPromise({
              { 'EXPEDITION_REWARD_IS_BATTLE', 'expeditionGroup', map.expedition.isBattleExpedition, 2000 },
              { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'expeditionGroup', map.expedition.isExpeditionCompletedPage },
            }))
            return { type = newstateTypes }, state
          end

          stepLabel.setStepLabelContent('3-13.本页没有可收获的奖励')
          table.remove(state.expeditionReward.enableChapter, 1)
          return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }, state

        elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then

          map.expedition.clickRewardPannelOk()
          stepLabel.setStepLabelContent('3-14.等待远征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'expeditionGroup', map.expedition.isExpeditionCompletedPage, 2000 },
            { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'expeditionGroup', map.expedition.isBattleExpedition },
          }))
          return { type = newstateTypes }, state
        end

        return nil
      end))
    end

    -- 远征回收


    -- 远征派遣舰队
    missions.expeditionOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXPEDITION_ONCE_START') then
          stepLabel.setStepLabelContent('3-15.准备远征派遣舰队')
          -- 准备开始远征派遣舰队任务
          if (type(settings.expeditionFleetToChapter) ~= 'table') then
            state.expedition.expeditionFleetToChapter = { false, false, false, false }
          end

          if ((not settings.expeditionFleetToChapter[1])
            and (not settings.expeditionFleetToChapter[2])
            and (not settings.expeditionFleetToChapter[3])
            and (not settings.expeditionFleetToChapter[4])) then
            stepLabel.setStepLabelContent('3-16.没有远征任务！')
            return nil
          end
          -- 转换数组
          (function()
            local newC = {}
            for i, v in ipairs(settings.expeditionFleetToChapter) do
              if (v) then
                table.insert(newC, { i, v })
              end
            end
            state.expedition.expeditionFleetToChapter = newC
          end)()


          -- 此任务使用的变量恢复默认值
          state.expedition.lastChapter = nil
          state.expedition.fleet = nil
          state.expedition.chapters = nil
          state.expedition.quickSupplyChecked = nil
          state.expedition.quickRepairChecked = nil


          stepLabel.setStepLabelContent('3-17.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('3-18.等待出征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_ONCE_START', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'expeditionGroup', map.expedition.isBattle },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'expeditionGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then
          -- 进入出征大页面
          stepLabel.setStepLabelContent('3-19.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('3-20.等待远征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_ONCE_START', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'expeditionGroup', map.expedition.isBattle, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'expeditionGroup', map.expedition.isBattleExpedition },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_IS_EXPEDITION_PAGE') then
          -- 进入远征页面
          if (#state.expedition.expeditionFleetToChapter > 0) then
            state.expedition.quickSupplyChecked = nil
            state.expedition.quickRepairChecked = nil

            state.expedition.fleet, state.expedition.chapters = table.unpack(state.expedition.expeditionFleetToChapter[1])

            local chapter, section = table.unpack(strSplit(state.expedition.chapters, '-'))
            if (state.expedition.lastChapter ~= chapter) then
              stepLabel.setStepLabelContent('3-21.移动到第' .. chapter .. '章')
              map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
              state.expedition.lastChapter = chapter
              c.yield(sleepPromise(300))
            end
            stepLabel.setStepLabelContent('3-22.检测第' .. section .. '节能否远征')
            c.yield(sleepPromise(200))
            local res = map.expedition.isChapterCanExpedition(section)
            if (res) then
              stepLabel.setStepLabelContent('3-23.点击按钮' .. section)
              map.expedition.clickExpeditionBtn(section)
              stepLabel.setStepLabelContent('3-24.等待远征准备界面')

              local newstateTypes = c.yield(setScreenListenerListPromise({
                { 'EXPEDITION_IS_EXPEDITION_PAGE', 'expeditionGroup', map.expedition.isBattleExpedition, 2000 },
                { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'expeditionGroup', map.expedition.isExpeditionPrepare },
              }))
              return { type = newstateTypes }, state
            else
              stepLabel.setStepLabelContent('3-25.本章不能远征')
              -- 执行下一个章节
              table.remove(state.expedition.expeditionFleetToChapter, 1)
              return { type = 'EXPEDITION_IS_EXPEDITION_PAGE' }, state
            end
          else
            stepLabel.setStepLabelContent('3-26.没有远征')
            return { type = 'EXPEDITION_RETURN_TO_HOME' }, state
          end

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE') then
          -- 远征准备界面，进行状态是否最佳的检测，然后进行补给和维修
          stepLabel.setStepLabelContent('3-27.选择舰队' .. state.expedition.fleet)
          map.expedition.clickSelectFleet(state.expedition.fleet)
          stepLabel.setStepLabelContent('3-28.检测所有状态正常')
          c.yield(sleepPromise(300))
          -- 检测舰队是否在最佳状态
          local res = map.expedition.isReadyExpeditionShipStatus()
          if (not res) then
            -- 舰队不是最佳状态
            stepLabel.setStepLabelContent('3-29.状态不正常')

            if (not state.expedition.quickSupplyChecked) then
              -- 快速补给
              map.expedition.clickQuickSupply()
              stepLabel.setStepLabelContent('3-30.等待快速补给界面')

              local newstateTypes = c.yield(setScreenListenerListPromise({
                { 'EXPEDITION_QUICK_SUPPLY_PAGE', 'expeditionGroup', map.expedition.isQuickSupply },
                { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'expeditionGroup', map.expedition.isExpeditionPrepare, 2000 },
              }))

              return { type = newstateTypes }, state

            elseif (not state.expedition.quickRepairChecked) then
              -- 快速修理
              if (settings.expeditionQuickRepair) then
                map.expedition.clickQuickRepair()
                stepLabel.setStepLabelContent('3-31.等待快速修理界面')

                local newstateTypes = c.yield(setScreenListenerListPromise({
                  { 'EXPEDITION_QUICK_REPAIR_PAGE', 'expeditionGroup', map.expedition.isQuickRepair },
                  { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'expeditionGroup', map.expedition.isExpeditionPrepare, 2000 },
                }))

                return { type = newstateTypes }, state
              end
            end

            -- 快速补给和修理都完成了，还不是最佳状态，则跳转到能否出征检测
            return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO' }, state
          end

          -- 舰队是最佳状态，跳转到能否出征检测
          return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO' }, state

        elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_PAGE') then
          -- 快速补给界面
          map.expedition.clickQuickSupplyDo()
          stepLabel.setStepLabelContent('3-32.等待远征准备界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_QUICK_SUPPLY_PAGE', 'expeditionGroup', map.expedition.isQuickSupply, 2000 },
            { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'expeditionGroup', map.expedition.isExpeditionPrepare },
          }))

          -- 页面没有停留在本页说明快速补给完成
          if (newstateTypes ~= 'EXPEDITION_QUICK_SUPPLY_PAGE') then
            state.expedition.quickSupplyChecked = true
          end

          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_QUICK_REPAIR_PAGE') then
          -- 快速修理界面
          map.expedition.clickQuickRepairDo()
          stepLabel.setStepLabelContent('3-33.等待远征准备界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_QUICK_REPAIR_PAGE', 'expeditionGroup', map.expedition.isQuickRepair, 2000 },
            { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'expeditionGroup', map.expedition.isExpeditionPrepare },
          }))

          -- 页面没有停留在本页说明快速修理完成
          if (newstateTypes ~= 'EXPEDITION_QUICK_REPAIR_PAGE') then
            state.expedition.quickRepairChecked = true
          end

          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO') then
          -- 检测舰队是否可以远征
          stepLabel.setStepLabelContent('3-34.检测舰队可以远征')
          c.yield(sleepPromise(500))
          local fleetCanExpedition = map.expedition.isCanExpedition()
          if (not fleetCanExpedition) then
            return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO' }, state
          else
            stepLabel.setStepLabelContent('3-35.点击远征开始')
            map.expedition.clickBattleStart()
          end
          stepLabel.setStepLabelContent('3-36.等待远征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO', 'expeditionGroup', map.expedition.isExpeditionPrepare, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'expeditionGroup', map.expedition.isBattleExpedition },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO') then
          -- 舰队不能远征，准备返回远征页
          stepLabel.setStepLabelContent('3-37.点击返回远征界面')
          map.expedition.clickBackToExpedition()

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO', 'expeditionGroup', map.expedition.isExpeditionPrepare, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'expeditionGroup', map.expedition.isBattleExpedition },
          }))

          -- 如果离开这一页，则从远征队列里退出一个队伍
          if (newstateTypes ~= 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO') then
            table.remove(state.expedition.expeditionFleetToChapter, 1)
          end

          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_RETURN_TO_HOME') then

          stepLabel.setStepLabelContent('3-38.返回港口')
          map.expedition.clickBackToHome()

          return { type = 'HOME_HOME' }, state
        end
      end))
    end
    -- 远征派遣

    -- 修理
    missions.repairOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'REPAIR_ONCE_START') then
          state.repair.slot = nil

          stepLabel.setStepLabelContent('4-2.点击出征')
          c.yield(sleepPromise(100))
          map.repair.clickDockBtn()
          stepLabel.setStepLabelContent('4-3.等待船坞界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'REPAIR_REPAIR_PAGE', 'repairGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'repairGroup', map.repair.isDockPage },
            { 'HOME_MEDAL_MODAL', 'repairGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'repairGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'REPAIR_DOCK_PAGE') then

          stepLabel.setStepLabelContent('4-4.点击修理按钮')
          c.yield(sleepPromise(100))
          map.repair.clickRepairBtn()
          stepLabel.setStepLabelContent('4-5.等待修理界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'REPAIR_REPAIR_PAGE', 'repairGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'repairGroup', map.repair.isDockPage },
            { 'HOME_MEDAL_MODAL', 'repairGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'repairGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'REPAIR_REPAIR_PAGE') then

          stepLabel.setStepLabelContent('4-6.检测空闲槽位')
          c.yield(sleepPromise(500))
          local res, hasList = map.repair.hasEmptyRepairSlot()
          if (res) then
            state.repair.slot = hasList[1]
            stepLabel.setStepLabelContent('4-7.有空闲槽位')
            stepLabel.setStepLabelContent('4-8.点击第' .. state.repair.slot .. '个空闲槽位')
            c.yield(sleepPromise(100))
            map.repair.clickRepairSlotBtn(state.repair.slot)
            c.yield(sleepPromise(100))
            stepLabel.setStepLabelContent('4-9.检测修理界面，选船界面')

            -- 如果一没进入修船选船页面说明没有需要维修的船
            local newstateTypes = c.yield(setScreenListenerListPromise({
              { 'REPAIR_SELECT_SHIP_PAGE', 'repairGroup', map.repair.isSelectShipPage },
              { 'REPAIR_REPAIR_FINISH', 'repairGroup', map.repair.isRepairPage, 3000 },
              { 'HOME_MEDAL_MODAL', 'repairGroup', map.home.isMedalModal },
              { 'HOME_HOME', 'repairGroup', map.home.isHome },
            }))

            if (newstateTypes == 'REPAIR_REPAIR_FINISH') then
              stepLabel.setStepLabelContent('4-9.没有船需要维修')
            end

            return { type = newstateTypes }, state
          else
            stepLabel.setStepLabelContent('4-10.没有空位')

            local newstateTypes = c.yield(setScreenListenerListPromise({
              { 'REPAIR_REPAIR_FINISH', 'repairGroup', map.repair.isRepairPage },
              { 'HOME_MEDAL_MODAL', 'repairGroup', map.home.isMedalModal },
              { 'HOME_HOME', 'repairGroup', map.home.isHome },
            }))
            return { type = newstateTypes }, state
          end

        elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then

          stepLabel.setStepLabelContent('4-11.选择第一个船')
          c.yield(sleepPromise(200))
          map.repair.clickFirstShip()
          stepLabel.setStepLabelContent('4-12.等待返回修理界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'repairGroup', map.repair.isRepairPage },
            { 'REPAIR_SELECT_SHIP_PAGE', 'repairGroup', map.repair.isSelectShipPage, 2000 },
            { 'HOME_MEDAL_MODAL', 'repairGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'repairGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then

          stepLabel.setStepLabelContent('4-13.等待第' .. state.repair.slot .. '个槽位变成修理状态')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'REPAIR_REPAIR_PAGE', 'repairGroup', map.repair.isSlotNotEmpty(state.repair.slot) },
            { 'REPAIR_REPAIR_FINISH', 'repairGroup', map.repair.isRepairPage, 3000 },
            { 'HOME_MEDAL_MODAL', 'repairGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'repairGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'REPAIR_REPAIR_FINISH') then

          stepLabel.setStepLabelContent('4-14.完成维修')
          map.repair.clickBackToHomeBtn()

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'HOME_MEDAL_MODAL', 'repairGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'repairGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state
        end
      end))
    end
    -- 修理

    return missions
  end,
  next = function(action, state)
    state = assign(stateTree, state)
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
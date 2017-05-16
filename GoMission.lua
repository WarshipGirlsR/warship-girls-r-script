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
}

return {
  init = function(map, stepLabel, settings)
    missions.home = function(action, state)
      return co(c.create(function()
        if (action.type == 'HOME_HOME') then
          return { type = 'HOME_HOME' }, state
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
            { 'EXPEDITION_REWARD_BATTLE_EXPEDITION', 'expeditionGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'expeditionGroup', map.expedition.isBattle, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

          stepLabel.setStepLabelContent('3-7.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('3-8.等待远征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_REWARD_BATTLE_EXPEDITION', 'expeditionGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'expeditionGroup', map.expedition.isBattle, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

          if (#state.expeditionReward.enableChapter > 0) then
            local chapter = state.expeditionReward.enableChapter[1]
            stepLabel.setStepLabelContent('3-9.移动到第' .. chapter .. '章')
            map.expedition.moveToChapter(chapter, lastChapter)
            lastChapter = chapter
            stepLabel.setStepLabelContent('3-10.检测本页有可收获奖励')
          else
            return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }, state
          end

        elseif (action.type == 'EXPEDITION_REWARD_CHECK_HAS_REWARD') then

          local res, list = map.expedition.isThisExpeditionPageHasReward()
          if (res) then
            local v = list[1]
            stepLabel.setStepLabelContent('3-11.点击按钮' .. v)
            map.expedition.clickExpeditionBtn(v)
            stepLabel.setStepLabelContent('3-12.等待远征完成页面')

            local newstateTypes = c.yield(setScreenListenerListPromise({
              { 'EXPEDITION_REWARD_IS_BATTLE', 'expeditionGroup', map.expedition.isBattleExpedition },
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
          if (type(settings.expeditionFleetToChapter) ~= 'table') then
            stateTree.expedition.expeditionFleetToChapter = { false, false, false, false }
          end

          if ((not settings.expeditionFleetToChapter[1])
              and (not settings.expeditionFleetToChapter[2])
              and (not settings.expeditionFleetToChapter[3])
              and (not settings.expeditionFleetToChapter[4])) then
            stepLabel.setStepLabelContent('3-19.没有远征任务！')
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
            stateTree.expedition.expeditionFleetToChapter = newC
          end)()

          stepLabel.setStepLabelContent('3-20.等待home')

          -- 此任务使用的变量恢复默认值
          stateTree.expedition.lastChapter = nil
          stateTree.expedition.fleet = nil
          stateTree.expedition.chapters = nil
          stateTree.expedition.quickSupplyDone = nil
          stateTree.expedition.quickRepairDone = nil


          stepLabel.setStepLabelContent('3-21.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('3-22.等待出征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_ONCE_START', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'expeditionGroup', map.expedition.isBattle },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'expeditionGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('3-23.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('3-24.等待远征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_ONCE_START', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'expeditionGroup', map.expedition.isBattle, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'expeditionGroup', map.expedition.isBattleExpedition },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('3-23.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('3-24.等待远征界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'EXPEDITION_ONCE_START', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'expeditionGroup', map.expedition.isBattle, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'expeditionGroup', map.expedition.isBattleExpedition },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_IS_EXPEDITION_PAGE') then

          if (#stateTree.expedition.expeditionFleetToChapter > 0) then
            stateTree.expedition.fleet, stateTree.expedition.chapters = table.unpack(stateTree.expedition.expeditionFleetToChapter[1])

            local chapter, section = table.unpack(strSplit(stateTree.expedition.chapters, '-'))
            if (stateTree.expedition.lastChapter ~= chapter) then
              stepLabel.setStepLabelContent('3-25.移动到第' .. chapter .. '章')
              map.expedition.moveToChapter(chapter, lastChapter)
              stateTree.expedition.lastChapter = chapter
              c.yield(sleepPromise(300))
            end
            stepLabel.setStepLabelContent('3-26.检测第' .. section .. '节能否远征')
            c.yield(sleepPromise(200))
            local res = map.expedition.isChapterCanExpedition(section)
            if (res) then
              stepLabel.setStepLabelContent('3-27.点击按钮' .. section)
              map.expedition.clickExpeditionBtn(section)
              stepLabel.setStepLabelContent('3-28.等待远征准备界面')

              local newstateTypes = c.yield(setScreenListenerListPromise({
                { 'EXPEDITION_IS_EXPEDITION_PAGE', 'expeditionGroup', map.expedition.isBattleExpedition, 2000 },
                { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'expeditionGroup', map.expedition.isExpeditionPrepare },
              }))
              return { type = newstateTypes }, state
            else
              stepLabel.setStepLabelContent('3-29.本章不能远征')
              -- 执行下一个章节
              table.remove(stateTree.expedition.expeditionFleetToChapter, 1)
              return { type = 'EXPEDITION_IS_EXPEDITION_PAGE' }, state
            end
          else
            stepLabel.setStepLabelContent('3-30.没有远征')
            state = 'returnToHome'
          end

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE') then

          stepLabel.setStepLabelContent('3-31.选择舰队' .. stateTree.expedition.fleet)
          map.expedition.clickSelectFleet(stateTree.expedition.fleet)
          stepLabel.setStepLabelContent('3-32.检测所有状态正常')
          c.yield(sleepPromise(300))
          local res = map.expedition.isReadyExpeditionShipStatus()
          if (not res) then
            stepLabel.setStepLabelContent('3-33.状态不正常')

            if (not stateTree.expedition.quickSupplyDone) then
              map.expedition.clickQuickSupply()
              stepLabel.setStepLabelContent('3-34.等待快速补给界面')

              local newstateTypes = c.yield(setScreenListenerListPromise({
                { 'EXPEDITION_BATTLE_EXPENDITION_PREPARE_PAGE', 'expeditionGroup', map.expedition.isExpeditionPrepare, 2000 },
                { 'EXPEDITION_QUICK_SUPPLY_PAGE', 'expeditionGroup', map.expedition.isQuickSupply },
              }))
              return { type = newstateTypes }, state

            elseif (not stateTree.expedition.quickRepairDone) then
            end

          else
            return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE' }, state
          end
        end
      end))
    end
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
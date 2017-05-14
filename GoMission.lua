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
          stepLabel.setStepLabelContent('2-2.检测是否有任务奖励')
          local res = map.mission.isUnreceivedMission()
          if (res) then
            return { type = 'MISSION_START_MISSION' }, state
          end
          stepLabel.setStepLabelContent('2-3.没有任务奖励')
          return { type = 'HOME_HOME' }, state

        elseif (action.type == 'MISSION_START_MISSION') then

          stepLabel.setStepLabelContent('2-4.点击任务按钮')
          map.mission.clickMission()
          stepLabel.setStepLabelContent('2-5.等待任务界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'HOME_HOME', 'missionGroup', map.home.isHome, 2000 },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionGroup', map.mission.isMission },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_PAGE') then

          stepLabel.setStepLabelContent('2-6.点击全部任务')
          map.missionClickAllMission()
          stepLabel.setStepLabelContent('2-7.等待任务全部任务界面')

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
            stepLabel.setStepLabelContent('2-8.没有任务奖励')
            return { type = 'MISSION_PAGE_NO_REWAR' }, state
          else
            stepLabel.setStepLabelContent('2-9.有任务奖励')
            map.mission.clickGetFirstReward()
            stepLabel.setStepLabelContent('2-10.等待获得面板')

            local newstateTypes = c.yield(setScreenListenerListPromise({
              { 'MISSION_IS_MISSION_ALL_MISSION', 'missionGroup', map.mission.isMissionAllMission, 2000 },
              { 'MISSION_REWAR_PANNEL', 'missionGroup', map.mission.isRewardPannel },
            }))

            return { type = newstateTypes }, state
          end

        elseif (action.type == 'MISSION_REWAR_PANNEL') then

          stepLabel.setStepLabelContent('2-11.点击确定')
          map.mission.clickRewardPannelOk()
          stepLabel.setStepLabelContent('2-12.等待任务全部任务界面')

          local newstateTypes = c.yield(setScreenListenerListPromise({
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionGroup', map.mission.isMissionAllMission },
            { 'MISSION_REWAR_PANNEL', 'missionGroup', map.mission.isRewardPannel, 2000 },
            { 'HOME_HOME', 'missionGroup', map.home.isHome, 2000 },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == "MISSION_PAGE_NO_REWAR") then

          stepLabel.setStepLabelContent("2-13.等待返回home")
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
            { 'EXPEDITION_REWARD_BATTLE_EXPEDITION', 'sss', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'sss', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'sss', map.expedition.isBattle, 2000 },
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
        end

        return nil
      end))
    end

    -- 演习
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
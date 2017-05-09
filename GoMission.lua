local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'

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
  return co(coroutine.create(function()
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
        table.insert(newArr, co(coroutine.create(function()
          coroutine.yield(sleepPromise(value[4]))
          if (not done) then
            return coroutine.yield(setScreenListenerPromise(value[1], value[2], value[3]))
          end
          return
        end)))
      else
        table.insert(newArr, co(coroutine.create(function()
          local res = coroutine.yield(setScreenListenerPromise(value[1], value[2], value[3]))
          done = true
          return res
        end)))
      end
    end
    local res = coroutine.yield(Promise.race(newArr))
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

local state = {
  expeditionReward = {
    enableChapter = {},
  },
}

return {
  init = function(map, stepLabel, settings)
    missions.home = function(action)
      nLog(console.log(action))
      return co(coroutine.create(function()
        if (action.type == 'HOME_HOME') then
          return { type = 'HOME_HOME' }
        end

        return nil
      end))
    end

    -- 远征回收
    missions.expeditionReward = function(action)
      return co(coroutine.create(function()
        if (action.type == 'EXPEDITION_REWARD_START') then
          if (type(settings.enableChapter) ~= 'table') then
            settings.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }
          elseif (#settings.enableChapter < 1) then
            stepLabel.setStepLabelContent('3-1.没有远征任务！')
            return { type = 'HOME_HOME' }
          end

          -- 复制一份数组
          (function()
            local newC = {}
            for i, v in ipairs(settings.enableChapter) do
              table.insert(newC, v)
            end
            state.expeditionReward.enableChapter = newC
          end)()

          return { type = 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED' }

        elseif (action.type == 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED') then
          stepLabel.setStepLabelContent('3-3.检测是否有远征奖励')
          coroutine.yield(sleepPromise(100))
          local res = map.expedition.isExpeditionCompleted()
          if (not res) then
            stepLabel.setStepLabelContent('3-4.没有远征奖励和任务')
            return { type = 'HOME_HOME' }
          end
          stepLabel.setStepLabelContent('3-5.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('3-6.等待出征界面')

          local newActionTypes = coroutine.yield(setScreenListenerListPromise({
            { 'EXPEDITION_REWARD_BATTLE_EXPEDITION', 'expeditionGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'expeditionGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'expeditionGroup', map.expedition.isBattle, 2000 },
          }))
          return { type = newActionTypes }

        elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

          stepLabel.setStepLabelContent('3-7.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('3-8.等待远征界面')

          local newActionTypes = coroutine.yield(setScreenListenerListPromise({
            { 'EXPEDITION_REWARD_BATTLE_EXPEDITION', 'sss', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'sss', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'sss', map.expedition.isBattle, 2000 },
          }))
          return { type = newActionTypes }

        elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

          if (#state.expeditionReward.enableChapter > 0) then
            local chapter = state.expeditionReward.enableChapter[1]
            stepLabel.setStepLabelContent("3-9.移动到第" .. chapter .. "章")
            map.expedition.moveToChapter(chapter, lastChapter)
            lastChapter = chapter
            stepLabel.setStepLabelContent("3-10.检测本页有可收获奖励")
          else
            return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }
          end
        end

        return nil
      end))
    end

    -- 演习
    return missions
  end,
  next = function(action)
    return co(coroutine.create(function()
      for key, item in pairs(missions) do
        local res = coroutine.yield(item(action))
        if (res) then
          return res
        end
      end
    end))
  end
}
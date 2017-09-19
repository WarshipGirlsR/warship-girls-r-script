local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local commonListenerFactory = require 'GoMission__commonListener'
local allOptions = require 'GoMission__options'

local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener

local expeditionReward = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'EXPEDITION_REWARD_START') then

      stepLabel.setStepLabelContent('4-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'EXPEDITION_REWARD_INIT', 'missionsGroup', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_REWARD_INIT') then

      -- 远征章节
      state.expeditionReward.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }

      -- 此任务使用的变量恢复默认值
      state.expedition.lastChapter = nil

      return makeAction('EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED'), state

    elseif (action.type == 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED') then

      stepLabel.setStepLabelContent('4-3.检测是否有远征奖励')
      c.yield(sleepPromise(100))
      local res = map.expedition.isExpeditionCompleted()
      if (not res) then
        stepLabel.setStepLabelContent('4-4.没有远征奖励和任务')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'HOME_HOME', 'homeGroup', map.home.isHome },
        }))
        return makeAction(newstateTypes), state
      end
      stepLabel.setStepLabelContent('4-5.点击出征')
      map.expedition.clickBattle()
      stepLabel.setStepLabelContent('4-6.等待出征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
        { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 1000 },
        { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

      stepLabel.setStepLabelContent('4-7.点击远征')
      map.expedition.clickExpedition()
      stepLabel.setStepLabelContent('4-8.等待远征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
        { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
        { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

      if (#state.expeditionReward.enableChapter > 0) then
        local chapter = state.expeditionReward.enableChapter[1]
        stepLabel.setStepLabelContent('4-9.移动到第' .. chapter .. '章')
        c.yield(sleepPromise(300))
        map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
        state.expedition.lastChapter = chapter
        stepLabel.setStepLabelContent('4-10.检测本页有可收获奖励')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition, 1000 },
        }))
        return makeAction(newstateTypes), state
      else
        return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }, state
      end

    elseif (action.type == 'EXPEDITION_REWARD_CHECK_HAS_REWARD') then

      local res, list = map.expedition.isThisExpeditionPageHasReward()
      if (res) then
        local v = list[1]

        -- 当回收一个远征奖励时，就需要远征派遣
        state.expedition.needExpedition = true

        stepLabel.setStepLabelContent('4-11.点击第' .. v .. '节')
        map.expedition.clickExpeditionBtn(v)
        stepLabel.setStepLabelContent('4-12.等待远征完成页面')

        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage },
        }))
        return makeAction(newstateTypes), state
      end

      stepLabel.setStepLabelContent('4-13.本页没有可收获的奖励')
      table.remove(state.expeditionReward.enableChapter, 1)
      return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }, state

    elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then

      map.expedition.clickRewardPannelOk()
      stepLabel.setStepLabelContent('4-14.等待远征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage, 2000 },
        { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_REWARD_RETURN_TO_HOME') then

      map.expedition.clickBackToHome()
      stepLabel.setStepLabelContent('4-15.返回HOME')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'EXPEDITION_REWARD_RETURN_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil
  end))
end

return function(state)
  state.expeditionReward = {}
  return expeditionReward
end
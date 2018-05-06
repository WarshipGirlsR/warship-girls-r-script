local co = require '../lib/co'
local c = coroutine
local stepLabel = require '../utils/step-label'
local makeAction = (require './utils').makeAction
local sleepPromise = (require './utils').sleepPromise
local setScreenListeners = (require './utils').setScreenListeners
local commonListenerFactory = require './common-listener'

local getHomeListener = (require './common-listener').getHomeListener
local getLoginListener = (require './common-listener').getLoginListener
local getComListener = (require './common-listener').getComListener

local store = require '../store'

local moHome = require '../meta-operation/home'
local moExpedition = require '../meta-operation/expedition'

local o = {
  home = moHome,
  expedition = moExpedition,
}

store.expeditionReward = store.expeditionReward or {}

local expeditionReward = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'EXPEDITION_REWARD_START') then

      stepLabel.setStepLabelContent('4-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'EXPEDITION_REWARD_INIT', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_REWARD_INIT') then

      -- 远征章节
      store.expeditionReward.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }

      -- 此任务使用的变量恢复默认值
      store.expedition.lastChapter = nil

      return makeAction('EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED')

    elseif (action.type == 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED') then

      stepLabel.setStepLabelContent('4-3.检测是否有远征奖励')
      c.yield(sleepPromise(100))
      local res = o.expedition.isExpeditionCompleted()
      if (not res) then
        stepLabel.setStepLabelContent('4-4.没有远征奖励和任务')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { '', 'homeGroup', o.home.isHome },
        }))
        return makeAction(newstateTypes)
      end
      stepLabel.setStepLabelContent('4-5.点击出征')
      o.expedition.clickBattle()
      stepLabel.setStepLabelContent('4-6.等待出征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', o.expedition.isBattleExpedition },
        { 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED', o.home.isHome, 3000 },
        { 'EXPEDITION_REWARD_IS_BATTLE', o.expedition.isBattlePage, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

      stepLabel.setStepLabelContent('4-7.点击远征')
      o.expedition.clickExpedition()
      stepLabel.setStepLabelContent('4-8.等待远征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', o.expedition.isBattleExpedition },
        { 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED', o.home.isHome, 3000 },
        { 'EXPEDITION_REWARD_IS_BATTLE', o.expedition.isBattlePage, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

      c.yield(sleepPromise(500))
      if (#store.expeditionReward.enableChapter > 0) then
        local chapter = store.expeditionReward.enableChapter[1]
        stepLabel.setStepLabelContent('4-9.移动到第' .. chapter .. '章')
        c.yield(sleepPromise(500))
        o.expedition.moveToChapter(chapter, store.expedition.lastChapter)
        store.expedition.lastChapter = chapter
        stepLabel.setStepLabelContent('4-10.检测本页有可收获奖励')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', o.expedition.isBattleExpedition, 1000 },
        }))
        return makeAction(newstateTypes)
      else
        return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }
      end

    elseif (action.type == 'EXPEDITION_REWARD_CHECK_HAS_REWARD') then

      local res, list = o.expedition.isThisExpeditionPageHasReward()
      if (res) then
        local v = list[1]

        -- 当回收一个远征奖励时，就需要远征派遣
        store.expedition.needExpedition = true

        stepLabel.setStepLabelContent('4-11.点击第' .. v .. '节')
        o.expedition.clickExpeditionBtn(v)
        stepLabel.setStepLabelContent('4-12.等待远征完成页面')

        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', o.expedition.isBattleExpedition, 2000 },
          { 'EXPEDITION_REWARD_COMPLETED_PAGE', o.expedition.isExpeditionCompletedPage },
        }))
        return makeAction(newstateTypes)
      end

      stepLabel.setStepLabelContent('4-13.本页没有可收获的奖励')
      table.remove(store.expeditionReward.enableChapter, 1)
      return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }

    elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then

      o.expedition.clickRewardPannelOk()
      stepLabel.setStepLabelContent('4-14.等待远征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_REWARD_COMPLETED_PAGE', o.expedition.isExpeditionCompletedPage, 2000 },
        { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', o.expedition.isBattleExpedition },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_REWARD_RETURN_TO_HOME') then

      o.expedition.clickBackToHome()
      stepLabel.setStepLabelContent('4-15.返回HOME')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'EXPEDITION_REWARD_RETURN_TO_HOME', o.expedition.isBattleExpedition, 2000 },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)
    end

    return nil
  end))
end

return expeditionReward
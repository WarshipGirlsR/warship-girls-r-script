local co = require '../lib/co'
local c = coroutine
local stepLabel = require '../utils/step-label'
local makeAction = (require './utils').makeAction
local sleepPromise = (require './utils').sleepPromise
local setScreenListeners = (require './utils').setScreenListeners

local store = require '../store'
store.home = store.home or {}

local moHome = require '../meta-operation/home'

local o = {
  home = moHome,
}

local home = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'HOME_HOME') then

      return ''

    elseif (action.type == 'HOME_MEDAL_MODAL') then

      stepLabel.setStepLabelContent('1-2勋章取消')
      o.home.clickMedalModalCancelBtn()
      c.yield(sleepPromise(2000))
      local res = o.home.isMedalModal()
      if (res) then
        return makeAction('HOME_MEDAL_MODAL')
      end
      return ''

    elseif (action.type == 'HOME_NEWS_MODAL') then

      stepLabel.setStepLabelContent('1-3.关闭新闻')
      o.home.clickMewsModalClose()
      c.yield(sleepPromise(2000))
      local res = o.home.isNewsModal()
      if (res) then
        return makeAction('HOME_NEWS_MODAL')
      end
      return ''

    elseif (action.type == 'HOME_SIGN_MODAL') then

      stepLabel.setStepLabelContent('1-4.获取签到奖励')
      local res = o.home.isSignModalHasReward()
      if (res) then
        stepLabel.setStepLabelContent('1-5.有奖励，点击获取')
        o.home.clickSignModalGetReward()
        stepLabel.setStepLabelContent('1-6.等待获取确认')
        local newstateTypes = c.yield(setScreenListeners({
          { 'HOME_SIGN_CONFIRM_MODAL', o.home.isSignConfirmModal },
          { 'HOME_SIGN_MODAL', o.home.isSignModal, 2000 },
        }))
        return makeAction(newstateTypes)
      else
        stepLabel.setStepLabelContent('1-7.没有奖励')
        o.home.clickSignModalClose()
        c.yield(sleepPromise(2000))
        local res = o.home.isSignModal()
        if (res) then
          return makeAction('HOME_SIGN_MODAL')
        end
        return ''
      end

    elseif (action.type == 'HOME_SIGN_CONFIRM_MODAL') then

      stepLabel.setStepLabelContent('1-8.点击获取确认')
      o.home.clickSignConfirmModalGetReward()
      stepLabel.setStepLabelContent('1-9.等待获取签到奖励面板')
      c.yield(sleepPromise(2000))
      local newstateTypes = c.yield(setScreenListeners({
        { 'HOME_SIGN_CONFIRM_MODAL', o.home.isSignConfirmModal, 2000 },
        { 'HOME_SIGN_MODAL', o.home.isSignModal },
      }))
      return makeAction(newstateTypes)
    end

    return nil
  end))
end

return home
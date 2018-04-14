local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local allOptions = require 'GoMission__options'


local home = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'HOME_HOME') then

      return '', state

    elseif (action.type == 'HOME_MEDAL_MODAL') then

      stepLabel.setStepLabelContent('1-2勋章取消')
      map.home.clickMedalModalCancelBtn()
      c.yield(sleepPromise(2000))
      local res = map.home.isMedalModal()
      if (res) then
        return makeAction('HOME_MEDAL_MODAL'), state
      end
      return '', state

    elseif (action.type == 'HOME_NEWS_MODAL') then

      stepLabel.setStepLabelContent('1-3.关闭新闻')
      map.home.clickMewsModalClose()
      c.yield(sleepPromise(2000))
      local res = map.home.isNewsModal()
      if (res) then
        return makeAction('HOME_NEWS_MODAL'), state
      end
      return '', state

    elseif (action.type == 'HOME_SIGN_MODAL') then

      stepLabel.setStepLabelContent('1-4.获取签到奖励')
      local res = map.home.isSignModalHasReward()
      if (res) then
        stepLabel.setStepLabelContent('1-5.有奖励，点击获取')
        map.home.clickSignModalGetReward()
        stepLabel.setStepLabelContent('1-6.等待获取确认')
        local newstateTypes = c.yield(setScreenListeners({
          { 'HOME_SIGN_CONFIRM_MODAL', map.home.isSignConfirmModal },
          { 'HOME_SIGN_MODAL', map.home.isSignModal, 2000 },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('1-7.没有奖励')
        map.home.clickSignModalClose()
        c.yield(sleepPromise(2000))
        local res = map.home.isSignModal()
        if (res) then
          return makeAction('HOME_SIGN_MODAL'), state
        end
        return '', state
      end

    elseif (action.type == 'HOME_SIGN_CONFIRM_MODAL') then

      stepLabel.setStepLabelContent('1-8.点击获取确认')
      map.home.clickSignConfirmModalGetReward()
      stepLabel.setStepLabelContent('1-9.等待获取签到奖励面板')
      c.yield(sleepPromise(2000))
      local newstateTypes = c.yield(setScreenListeners({
        { 'HOME_SIGN_CONFIRM_MODAL', map.home.isSignConfirmModal, 2000 },
        { 'HOME_SIGN_MODAL', map.home.isSignModal },
      }))
      return makeAction(newstateTypes), state
    end

    return nil
  end))
end

return function(state)
  state.home = {}

  return home
end
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local allOptions = require 'GoMission__options'


local login = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'LOGIN_START_APP') then

      stepLabel.setStepLabelContent('1-11.启动游戏')
      map.login.restartApp()
      local newstateTypes = c.yield(setScreenListeners({
        { 'LOGIN_LOGIN', map.login.isLoginPage, 2000 },
        { 'LOGIN_SELECT_SERVER', map.login.isSelectServerPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'LOGIN_LOGIN') then

      stepLabel.setStepLabelContent('1-12.输入用户名界面')
      local newstateTypes = c.yield(setScreenListeners({
        { 'LOGIN_LOGIN', map.login.isLoginPage, 2000 },
        { 'LOGIN_SELECT_SERVER', map.login.isSelectServerPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'LOGIN_SELECT_SERVER') then

      stepLabel.setStepLabelContent('1-13.登录界面')
      map.login.clickLoginServerBtn()
      local newstateTypes = c.yield(setScreenListeners({
        { 'LOGIN_LOGIN', map.login.isLoginPage, 2000 },
        { 'LOGIN_SELECT_SERVER', map.login.isSelectServerPage, 2000 },
        { '', function() return true end, 6000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil, state
  end))
end

return function()
  return login
end
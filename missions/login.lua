local co = require '../lib/co'
local c = coroutine
local stepLabel = require '../utils/step-label'
local makeAction = (require './utils').makeAction
local sleepPromise = (require './utils').sleepPromise
local setScreenListeners = (require './utils').setScreenListeners

local store = require '../store'
store.login = store.login or {}

local moHome = require '../meta-operation/home'
local moLogin = require '../meta-operation/login'

local o = {
  home = moHome,
  login = moLogin,
}

local login = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'LOGIN_START_APP') then

      stepLabel.setStepLabelContent('1-11.启动游戏')
      o.login.restartApp()
      local newstateTypes = c.yield(setScreenListeners({
        { 'LOGIN_LOGIN', o.login.isLoginPage, 2000 },
        { 'LOGIN_SELECT_SERVER', o.login.isSelectServerPage, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'LOGIN_LOGIN') then

      stepLabel.setStepLabelContent('1-12.输入用户名界面')
      local newstateTypes = c.yield(setScreenListeners({
        { 'LOGIN_LOGIN', o.login.isLoginPage, 10000 },
        { 'LOGIN_SELECT_SERVER', o.login.isSelectServerPage, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'LOGIN_SELECT_SERVER') then

      stepLabel.setStepLabelContent('1-13.登录界面')
      o.login.clickLoginServerBtn()
      local newstateTypes = c.yield(setScreenListeners({
        { 'LOGIN_LOGIN', o.login.isLoginPage, 2000 },
        { 'LOGIN_SELECT_SERVER', o.login.isSelectServerPage, 10000 },
        { '', function() return true end, 6000 },
      }))
      return makeAction(newstateTypes)
    end

    return nil
  end))
end

return login
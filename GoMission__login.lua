local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners

local allOptions

local login = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'LOGIN_START_APP') then

      stepLabel.setStepLabelContent('1-11.启动游戏')
      map.login.restartApp()
      local newstateTypes = c.yield(setScreenListeners({
        { 'LOGIN_SELECT_SERVER', 'missionsGroup', map.login.isSelectServerPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'LOGIN_SELECT_SERVER') then

      stepLabel.setStepLabelContent('1-12.登录界面')
      map.login.clickLoginBtn()
      c.yield(sleepPromise(2000))
      local res = map.login.isSelectServerPage()
      if (res) then
        return makeAction('LOGIN_SELECT_SERVER'), state
      end
      return nil, state
    end

    return nil, state
  end))
end

return function(theAllOptions)
  allOptions = theAllOptions
  return login
end
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local allOptions = require 'GoMission__options'


local network = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'NETWORK_NETWORK_FAILURE_MODAL') then

      stepLabel.setStepLabelContent('1-10.网络不通，点击确认')
      state.network.networkFalureCount = state.network.networkFalureCount or 0
      state.network.networkFalureCount = state.network.networkFalureCount + 1
      if (state.network.networkFalureCount > 50) then
        return makeAction('LOGIN_START_APP'), state
      end
      map.network.clickNetworkFailureModalOk()
      c.yield(sleepPromise(2000))
      local res = map.network.isNetworkFailureModal()
      if (res) then
        return makeAction('NETWORK_NETWORK_FAILURE_MODAL'), state
      end
      return nil, state

    elseif (action.type == 'NETWORK_CHECK_NETWORK_MODAL') then

      stepLabel.setStepLabelContent('1-11.检查您的网络，点击确认')
      state.network.networkFalureCount = state.network.networkFalureCount or 0
      state.network.networkFalureCount = state.network.networkFalureCount + 1
      if (state.network.networkFalureCount > 50) then
        return makeAction('LOGIN_START_APP'), state
      end
      map.network.clickCheckNetworkModalOk()
      c.yield(sleepPromise(2000))
      local res = map.network.isCheckNetworkModal()
      if (res) then
        return makeAction('NETWORK_CHECK_NETWORK_MODAL'), state
      end
      return nil, state
    end

    return nil, state
  end))
end

return function(state)
  state.network = {}
  return network
end
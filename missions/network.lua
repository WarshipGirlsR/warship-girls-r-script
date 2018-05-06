local co = require '../lib/co'
local c = coroutine
local stepLabel = require '../utils/step-label'
local makeAction = (require './utils').makeAction
local sleepPromise = (require './utils').sleepPromise

local store = require '../store'
store.network = store.network or {}

local moHome = require '../meta-operation/home'
local moNetwork = require '../meta-operation/network'

local o = {
  home = moHome,
  network = moNetwork,
}

local network = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'NETWORK_NETWORK_FAILURE_MODAL') then

      stepLabel.setStepLabelContent('1-10.网络不通，点击确认')
      store.network.networkFalureCount = store.network.networkFalureCount or 0
      store.network.networkFalureCount = store.network.networkFalureCount + 1
      if (store.network.networkFalureCount > 50) then
        return makeAction('LOGIN_START_APP')
      end
      o.network.clickNetworkFailureModalOk()
      c.yield(sleepPromise(2000))
      local res = o.network.isNetworkFailureModal()
      if (res) then
        return makeAction('NETWORK_NETWORK_FAILURE_MODAL')
      end
      return ''

    elseif (action.type == 'NETWORK_CHECK_NETWORK_MODAL') then

      stepLabel.setStepLabelContent('1-11.检查您的网络，点击确认')
      store.network.networkFalureCount = store.network.networkFalureCount or 0
      store.network.networkFalureCount = store.network.networkFalureCount + 1
      if (store.network.networkFalureCount > 50) then
        return makeAction('LOGIN_START_APP')
      end
      o.network.clickCheckNetworkModalOk()
      c.yield(sleepPromise(2000))
      local res = o.network.isCheckNetworkModal()
      if (res) then
        return makeAction('NETWORK_CHECK_NETWORK_MODAL')
      end
      return ''
    end

    return nil
  end))
end

return network
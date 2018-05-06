local co = require '../lib/co'
local c = coroutine
local stepLabel = require '../utils/step-label'
local makeAction = (require './utils').makeAction
local sleepPromise = (require './utils').sleepPromise

local store = require '../store'
store.pause = store.pause or {}

local moHome = require '../meta-operation/home'

local o = {
  home = moHome,
  network = moNetwork,
}

local pause = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'PAUSE_PAUSE') then

      store.pause.lasttext = stepLabel.getText()
      stepLabel.setPrefix('')
      stepLabel.setStepLabelContent('暂停')
      c.yield(sleepPromise(500))
      if (o.home.isPause()) then
        return makeAction('PAUSE_PAUSE_CONTINUE')
      else
        return nil
      end
    elseif (action.type == 'PAUSE_PAUSE_CONTINUE') then
      c.yield(sleepPromise(500))
      if (o.home.isPause()) then
        return makeAction('PAUSE_PAUSE_CONTINUE')
      else
        stepLabel.setStepLabelContent(store.pause.lasttext)
        return nil
      end
    end

    return nil
  end))
end

return pause
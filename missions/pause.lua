local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local allOptions = require 'GoMission__options'


local pause = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'PAUSE_PAUSE') then

      state.pause.lasttext = stepLabel.getText()
      stepLabel.setPrefix('')
      stepLabel.setStepLabelContent('暂停')
      c.yield(sleepPromise(500))
      if (map.home.isPause()) then
        return makeAction('PAUSE_PAUSE_CONTINUE'), state
      else
        return nil, state
      end
    elseif (action.type == 'PAUSE_PAUSE_CONTINUE') then
      c.yield(sleepPromise(500))
      if (map.home.isPause()) then
        return makeAction('PAUSE_PAUSE_CONTINUE'), state
      else
        stepLabel.setStepLabelContent(state.pause.lasttext)
        return nil, state
      end
    end

    return nil, state
  end))
end

return function(state)
  state.pause = {}
  return pause
end
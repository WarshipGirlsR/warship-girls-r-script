local co = require 'Co'
local c = coroutine

return {
  createChain = function(missionList)
    assert(type(missionList) == "table", 'bad argument #1 "createChain" (table excepted, got ' .. type(missionList) .. ')')

    return {
      runMission = function(fn)
        return co(c.create(function()
          runCount = runCount or 1
          while true do
            c.yield(fn(runCount))
            runCount = runCount + 1
          end
        end))
      end,
      next = function(action)
        return co(c.create(function()
          if action.type and action.type ~= '' then
            local newAction
            for key = 1, #missionList do
              local item = missionList[key]
              local theAction = c.yield(item(action))
              if (theAction) then
                newAction = theAction
              end
            end
            if (not newAction) then
              error('Action "' .. action.type .. '" not found')
            end
          end
        end))
      end,
    }
  end,
}
local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
local gettimeFunc = require 'GetTime'
local c = coroutine

local combineListener = function(target, ...)
  local sources = { ... }
  if (type(target) ~= 'table') then target = {} end
  for k = 1, #sources do
    local source = sources[k]
    for key = 1, #source do
      local value = source[key]
      table.insert(target, value)
    end
  end
  local targetReverse = table.reverse(target)
  local resultIndex = {}
  local result = {}
  for key = 1, #targetReverse do
    local value = targetReverse[key]
    if (not resultIndex[value[3]]) then
      resultIndex[value[3]] = value
      table.insert(result, value)
    end
  end

  local resultReverse = table.reverse(result)
  return resultReverse
end

local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    eq.setTimeout(resolve, ms)
  end)
end

local setScreenListeners = function(theArr, ...)

  if ((type(theArr) ~= 'table') or (#theArr == 0)) then
    return Promise.resolve(nil)
  end

  theArr = table.merge(theArr, ...)

  local theArrUnique = table.uniqueLast(theArr, 2)
  for key = 1, #theArrUnique do
    local value = theArrUnique[key]
    value.isOnce = true
  end
  return co(c.create(function()
    local newArr = {}
    local ids = {}
    local done = false
    for key = 1, #theArrUnique do
      local listenerEvent = theArrUnique[key]

      if ((type(listenerEvent[3]) == 'number') and (listenerEvent[3] > 0)) then
        table.insert(newArr, Promise.new(function(resolve)
          local id = eq.setTimeout(resolve, listenerEvent[3])
          table.insert(ids, id)
        end).andThen(function()
          if (not done) then
            return Promise.new(function(resolve)
              local id = eq.setScreenListener(listenerEvent[2], function() resolve(listenerEvent[1]) end)
              table.insert(ids, id)
            end)
          end
        end))
      else
        table.insert(newArr, co(c.create(function()
          return Promise.new(function(resolve)
            local id = eq.setScreenListener(listenerEvent[2], function() resolve(listenerEvent[1]) end)
            table.insert(ids, id)
          end)
        end)))
      end
    end
    local res = c.yield(Promise.race(newArr))
    done = true
    for key = 1, #ids do
      eq.clearScreenListener(ids[key])
      eq.clearTimeout(ids[key])
    end
    console.log(res)
    return res
  end))
end

local makeAction = function(action)
  if (type(action) == 'table') then return action end
  return { type = action }
end

return {
  combineListener = combineListener,
  sleepPromise = sleepPromise,
  setScreenListeners = setScreenListeners,
  makeAction = makeAction,
}
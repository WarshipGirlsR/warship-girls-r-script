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

local setScreenListenerPromise = function(actionType, tags, checker)
  return Promise.new(function(resolve)
    eq.setScreenListener(tags, checker, function() resolve(actionType) end)
  end)
end

local setScreenListeners = function(theArr, ...)

  if ((type(theArr) ~= 'table') or (#theArr == 0)) then
    return Promise.resolve(nil)
  end

  theArr = table.merge(theArr, ...)

  local theArrUnique = table.uniqueLast(theArr, 3)
  for key = 1, #theArrUnique do
    local value = theArrUnique[key]
    value.isOnce = true
  end
  return co(c.create(function()
    local newArr = {}
    local tags = {}
    local done = false
    for key = 1, #theArrUnique do
      local listenerEvent = theArrUnique[key]
      if (type(listenerEvent[2]) == 'table') then
        tags = table.merge(tags, listenerEvent[2])
      else
        table.insert(tags, listenerEvent[2])
      end

      if ((type(listenerEvent[4]) == 'number') and (listenerEvent[4] > 0)) then
        table.insert(newArr, co(c.create(function()
          console.log(listenerEvent)
          c.yield(sleepPromise(listenerEvent[4]))
          if (not done) then
            return c.yield(setScreenListenerPromise(listenerEvent[1], listenerEvent[2], listenerEvent[3]))
          end
          return
        end)))
      else
        table.insert(newArr, co(c.create(function()
          local res = c.yield(setScreenListenerPromise(listenerEvent[1], listenerEvent[2], listenerEvent[3]))
          done = true
          return res
        end)))
      end
    end
    local res = c.yield(Promise.race(newArr))
    eq.clearScreenListenerByTags(tags)
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
  setScreenListenerPromise = setScreenListenerPromise,
  setScreenListeners = setScreenListeners,
  makeAction = makeAction,
}
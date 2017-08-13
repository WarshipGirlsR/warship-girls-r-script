local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
local gettimeFunc = require 'GetTime'
local c = coroutine

local combineListener = function(target, ...)
  local sources = { ... }
  if (type(target) ~= 'table') then target = {} end
  for _, source in ipairs(sources) do
    for key, value in ipairs(source) do
      table.insert(target, value)
    end
  end
  local targetReverse = table.reverse(target)
  local resultIndex = {}
  local result = {}
  for key, value in ipairs(targetReverse) do
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

local setScreenListeners = function(theArr, endMs)

  if ((type(theArr) ~= 'table') or (#theArr == 0)) then
    return Promise.resolve(nil)
  end

  local theArrUnique = table.uniqueLast(theArr, 3)
  for key, value in ipairs(theArrUnique) do
    value.isOnce = true
  end
  return co(c.create(function()
    local newArr = {}
    local tags = {}
    local done = false
    for key, listenerEvent in ipairs(theArrUnique) do
      if (type(listenerEvent[2]) == 'table') then
        tags = table.merge(tags, listenerEvent[2])
      else
        table.insert(tags, listenerEvent[2])
      end

      if ((type(listenerEvent[4]) == 'number') and (listenerEvent[4] > 0)) then
        table.insert(newArr, co(c.create(function()
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
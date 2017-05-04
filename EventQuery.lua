local sz
local socket

-- get the time
local gettimeFunc = function()
  return os.time() * 1000
end
-- sleep
local mSleep = mSleep

-- for touchsprite socket
local _ = (function()
  local pcallRes = pcall(function()
    sz = require 'sz'
    socket = require 'szocket.core'
    gettimeFunc = function()
      return socket.gettime() * 1000
    end
    mSleep = mSleep or function(n)
      socket.select(nil, nil, n / 1000)
    end
  end)
  if (pcallRes) then return end
  local pcallRes2 = pcall(function()
    socket = require 'socket'
    gettimeFunc = function()
      return socket.gettime() * 1000
    end
    mSleep = mSleep or function(n)
      socket.select(nil, nil, n / 1000)
    end
  end)
end)()


-- 封装了xpcall方法
function tryCatch(cb)
  return xpcall(cb, function(e)
    return stackTraceback and
        (e .. '\n' .. debug.traceback())
        or (e)
  end)
end

function bindSelf(func, self)
  return function(...) return func(self, ...) end
end

local getEventId = (function()
  local id = 0
  return function()
    id = id + 1
    return id
  end
end)()

-- 主队列
local eventQuery = {}
-- 各个小队列
local screenListenerQuery = {}
local buttonListenerQuery = {}
local timerQuery = {}

function getEventObj(func, time, isInterval, ms)
  return {
    id = getEventId() or 0,
    time = time or 0,
    func = func,
    isInterval = isInterval or false,
    ms = ms or 0
  }
end

function setimmediate(func)
  if (type(func) ~= 'function') then return 0 end
  local eventObj = getEventObj(func)
  table.insert(eventQuery, eventObj)
  return eventObj.id
end

function setTimeout(func, ms)
  if (type(func) ~= 'function') then return 0 end
  if ((type(ms) ~= 'number') or (ms < 4)) then ms = 4 end
  local time = gettimeFunc() + ms
  local eventObj = getEventObj(func, time)
  table.insert(timerQuery, eventObj)
  return eventObj.id
end

function setInterval(func, ms)
  if (type(func) ~= 'function') then return 0 end
  if ((type(ms) ~= 'number') or (ms < 4)) then ms = 4 end
  local time = gettimeFunc() + ms
  local eventObj = getEventObj(func, time, true, ms)
  table.insert(timerQuery, eventObj)
  return eventObj.id
end

function run()
  local continue = 0
  local thisTime = 0
  local sleepTime = 0

  repeat
    continue = 0
    sleepTime = 0

    -- run eventQuery
    for key, value in ipairs(eventQuery) do
      continue = continue + 1
      value.func()
      -- setInterval event
    end
    eventQuery = {}


    -- read event from other Query
    thisTime = gettimeFunc()

    -- timeQuery
    local newTimeQuery = {}
    for key, value in ipairs(timerQuery) do
      continue = continue + 1
      if (value.time <= thisTime) then
        table.insert(eventQuery, value)

        -- setInterval event
        if (value.isInterval) then
          repeat
            value.time = value.time + value.ms
          until (value.time > thisTime)
          sleepTime = math.min(sleepTime, value.time)
          table.insert(newTimeQuery, value)
        end

        console.log(value)
      else
        sleepTime = math.min(sleepTime, value.time)
        table.insert(newTimeQuery, value)
      end
    end
    timerQuery = newTimeQuery
    newTimeQuery = nil

    -- screenListenerQuery
    local newScreenListenerQuery = {}
    for key, value in ipairs(screenListenerQuery) do
      continue = continue + 1
      if (value.time < thisTime) then
        table.insert(eventQuery, value)
      else
        table.insert(newScreenListenerQuery, value)
      end
    end
    screenListenerQuery = newScreenListenerQuery
    newScreenListenerQuery = nil

    -- buttonListenerQuery
    local newButtonListenerQuery = {}
    for key, value in ipairs(buttonListenerQuery) do
      continue = continue + 1
      if (value.time < thisTime) then
        table.insert(eventQuery, value)
      else
        table.insert(newButtonListenerQuery, value)
      end
    end
    buttonListenerQuery = newButtonListenerQuery
    newButtonListenerQuery = nil

    if (#eventQuery <= 0) then
      mSleep(sleepTime)
    end
  until (continue <= 0)
end

return {
  setimmediate = setimmediate,
  setTimeout = setTimeout,
  setInterval = setInterval,
  run = run,
};
local sz
local socket

local gettimeFunc = function()
  return os.time() * 1000
end
-- for touchsprite
local _ = (function()
  local pcallRes = pcall(function()
    sz = require 'sz'
    socket = require 'szocket.core'
    gettimeFunc = function()
      return socket.gettime() * 1000
    end
  end)
  if (pcallRes) then return end
  local pcallRes2 = pcall(function()
    socket = require 'socket'
    gettimeFunc = function()
      return socket.gettime() * 1000
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

local screenListenerQuery = {}
local buttonListenerQuery = {}
local timerQuery = {}

function getEventObj(func, time, isInterval)
  return {
    id = getEventId(),
    time = time,
    func = func,
    isInterval = isInterval
  }
end

function setTimeout(func, ms)
  if (type(func) ~= 'function') then return 0 end
  local time = gettimeFunc() + ms
  local eventObj = getEventObj(func, time)
  table.insert(timerQuery, eventObj)
  return eventObj.id
end

function setInterval(func, ms)
  if (type(func) ~= 'function') then return 0 end
  local time = gettimeFunc() + ms
  local eventObj = getEventObj(func, time, true)
  table.insert(timerQuery, eventObj)
  return eventObj.id
end

function run()
  local continue = 0
  local thisTime = gettimeFunc()
  repeat
    continue = 0
    while (#timerQuery > 0) do
      continue = continue + 1
      local value = timerQuery { 1 }
      if (value.time < thisTime) then
        table.remove(timerQuery, pos)
        value.func()
      end
    end
    for key, value in iparis(screenListenerQuery) do
      continue = continue + 1
      if (value.time < thisTime) then
        value.func()
      end
    end
    for key, value in iparis(buttonListenerQuery) do
      continue = continue + 1
      if (value.time < thisTime) then
        value.func()
      end
    end
  until (continue <= 0)
end

return {
  setTimeout = setTimeout,
};
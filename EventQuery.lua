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


-- fwGetPressedButton
-- keepScreen(true);









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

-- main query
local eventQuery = {}
-- sub query
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

function getScreenEventObj(checker, func)
  return {
    id = getEventId() or 0,
    checker = checker,
    func = func,
  }
end

function getButtonEventObj(btnId, func)
  return {
    id = getEventId() or 0,
    btnId = btnId,
    func = func,
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

function clearTimeout(id)
  local newQuery = {}
  for key, value in ipairs(timerQuery) do
    if (value.id ~= id) then
      table.insert(newQuery, value)
    end
  end
  timerQuery = newQuery
end

function setInterval(func, ms)
  if (type(func) ~= 'function') then return 0 end
  if ((type(ms) ~= 'number') or (ms < 4)) then ms = 4 end
  local time = gettimeFunc() + ms
  local eventObj = getEventObj(func, time, true, ms)
  table.insert(timerQuery, eventObj)
  return eventObj.id
end

function setScreenListener(checker, func)
  if (type(checker) ~= 'function') then return 0 end
  if (type(func) ~= 'function') then return 0 end
  local screenEventObj = getScreenEventObj(checker, func)
  table.insert(screenListenerQuery, screenEventObj)
  return screenEventObj.id
end

function clearScreenListener(id)
  local newQuery = {}
  for key, value in ipairs(screenListenerQuery) do
    if (value.id ~= id) then
      table.insert(newQuery, value)
    end
  end
  screenListenerQuery = newQuery
end

function setButotnListener(btnid, func)
  if (type(func) ~= 'function') then return 0 end
  local btnEventObj = getButtonEventObj(func)
  table.insert(buttonListenerQuery, btnEventObj)
  return btnEventObj.id
end

function clearButotnListener(id)
  local newQuery = {}
  for key, value in ipairs(buttonListenerQuery) do
    if (value.id ~= id) then
      table.insert(newQuery, value)
    end
  end
  buttonListenerQuery = newQuery
end

function clearListenersOnButton(btnId)
  local newQuery = {}
  for key, value in ipairs(buttonListenerQuery) do
    if (value.btnId ~= btnId) then
      table.insert(newQuery, value)
    end
  end
  buttonListenerQuery = newQuery
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
      value.func()
      -- setInterval event
    end
    eventQuery = {}


    -- read event from other Query
    thisTime = gettimeFunc()

    -- timeQuery
    if (#timerQuery > 0) then
      continue = continue + 1
      local newTimeQuery = {}
      for key, value in ipairs(timerQuery) do
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
        else
          sleepTime = math.min(sleepTime, value.time)
          table.insert(newTimeQuery, value)
        end
      end
      timerQuery = newTimeQuery
      newTimeQuery = nil
    end

    -- screenListenerQuery
    if (#screenListenerQuery) then
      continue = continue + 1
      keepScreen(true);
      local newScreenListenerQuery = {}
      for key, value in ipairs(screenListenerQuery) do
        if (value.checker()) then
          table.insert(eventQuery, value)
          if (not value.isOnce) then
            table.insert(newScreenListenerQuery, value)
          end
        else
          table.insert(newScreenListenerQuery, value)
        end
      end
      screenListenerQuery = newScreenListenerQuery
      keepScreen(false);
    end

    -- buttonListenerQuery
    if (#buttonListenerQuery > 0) then
      continue = continue + 1
      local btnIdList = {}
      while (true) do
        local btnId = fwGetPressedButton()
        if (type(btnId) == 'nil') then break end
        btnIdList[btnId] = btnId
      end
      for key, value in ipairs(buttonListenerQuery) do
        if (btnIdList[value.btnId] == value.btnId) then
          table.insert(eventQuery, value)
        end
      end
    end


    if (#eventQuery <= 0) then
      mSleep(sleepTime)
    end
  until (continue <= 0)
end

return {
  setimmediate = setimmediate,
  setTimeout = setTimeout,
  clearTimeout = clearTimeout,
  setInterval = setInterval,
  clearInterval = clearTimeout,
  setScreenListener = setScreenListener,
  clearScreenListener = clearScreenListener,
  setButotnListener = setButotnListener,
  clearListenersOnButton = clearListenersOnButton,
  clearButotnListener = clearButotnListener,
  run = run,
};
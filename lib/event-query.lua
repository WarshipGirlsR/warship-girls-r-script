local socket = require 'socket'

-- get the time
local gettimeFunc = function()
  return socket.gettime() * 1000
end
-- sleep
local mSleep = mSleep or function(n)
  socket.select(nil, nil, n / 1000)
end

-- fwGetPressedButton
-- keepScreen(true);

local function isEmpty(tab)
  for _, v in pairs(tab) do
    return false
  end
  return true
end







local function tryCatch(cb)
  return xpcall(cb, function(e)
    return stackTraceback and
      (e .. '\n' .. debug.traceback())
      or (e)
  end)
end

local function bindSelf(func, self)
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
local screenListenerQueryIndex = {}
local buttonListenerQuery = {}
local buttonListenerQueryIndex = {}
local timerQuery = {}
local timerQueryIndex = {}


function getEventObj(func, time, isInterval, ms)
  return {
    id = getEventId() or 0,
    time = time or 0,
    func = func,
    isInterval = isInterval or false,
    ms = ms or 0,
    drop = false,
  }
end

function getScreenEventObj(checker, func)
  return {
    id = getEventId() or 0,
    checker = checker,
    func = func,
    drop = false,
  }
end

function getButtonEventObj(btnId, func)
  return {
    id = getEventId() or 0,
    btnId = btnId,
    func = func,
    drop = false,
  }
end




function setImmediate(func)
  if (type(func) ~= 'function') then return 0 end
  local eventObj = getEventObj(func)
  table.insert(timerQuery, eventObj)
  return eventObj.id
end

function setTimeout(func, ms)
  if (type(func) ~= 'function') then return 0 end
  if ((type(ms) ~= 'number') or (ms < 4)) then ms = 4 end
  local time = gettimeFunc() + ms
  local eventObj = getEventObj(func, time)
  table.insert(timerQuery, eventObj)
  timerQueryIndex[eventObj.id] = eventObj
  return eventObj.id
end

function clearTimeout(id)
  local theEventObj = timerQueryIndex[id]
  if (theEventObj) then
    theEventObj.drop = true
    timerQueryIndex[id] = nil
  end
end

function setInterval(func, ms)
  if (type(func) ~= 'function') then return 0 end
  if ((type(ms) ~= 'number') or (ms < 4)) then ms = 4 end
  local time = gettimeFunc() + ms
  local eventObj = getEventObj(func, time, true, ms)
  table.insert(timerQuery, eventObj)
  timerQueryIndex[eventObj.id] = eventObj
  return eventObj.id
end

-- param: checker, func
function setScreenListener(...)
  local args = { ... }
  local checker = table.remove(args, 1)
  local func = table.remove(args, 1)

  if (type(checker) ~= 'function') then return 0 end
  if (type(func) ~= 'function') then return 0 end
  local screenEventObj = getScreenEventObj(checker, func)
  table.insert(screenListenerQuery, screenEventObj)
  screenListenerQueryIndex[screenEventObj.id] = screenEventObj
  return screenEventObj.id
end

function clearScreenListener(id)
  local theEventObj = screenListenerQueryIndex[id]
  if (theEventObj) then
    theEventObj.drop = true
  end
end

function setButotnListener(btnId, func)
  if (type(func) ~= 'function') then return 0 end
  local btnEventObj = getButtonEventObj(btnId, func)
  table.insert(buttonListenerQuery, btnEventObj)
  buttonListenerQueryIndex[btnEventObj.id] = btnEventObj
  return btnEventObj.id
end

function clearButotnListener(id)
  local theEventObj = buttonListenerQueryIndex[id]
  if (theEventObj) then
    theEventObj.drop = true
  end
end

function clearListenersOnButton(btnId)
  for key = 1, #buttonListenerQuery do
    local value = buttonListenerQuery[key]
    if (value.btnId ~= btnId) then
      value.drop = true
    end
  end
end

function run()
  local continue = 0
  local thisTime = 0
  local sleepTime = 3600000


  repeat
    continue = 0
    sleepTime = 3600000

    -- run eventQuery
    if #eventQuery > 0 then
      for key = 1, #eventQuery do
        local value = eventQuery[key]
        value.func()
      end
      eventQuery = {}
    end


    -- read event from other Query
    thisTime = gettimeFunc()

    -- timeQuery
    if (#timerQuery > 0) then
      continue = continue + 1
      local hasDropEvent = false
      for key = 1, #timerQuery do
        local value = timerQuery[key]
        if (not value.drop) then
          if (value.time <= thisTime) then
            table.insert(eventQuery, value)

            -- setInterval event
            if (value.isInterval) then
              value.drop = false
              repeat
                value.time = value.time + value.ms
              until (value.time > thisTime)
              sleepTime = math.min(sleepTime, value.time - thisTime)
            else
              value.drop = true
              hasDropEvent = true
            end
          else
            sleepTime = math.min(sleepTime, value.time - thisTime)
          end
        else
          hasDropEvent = true
          timerQueryIndex[value.id] = nil
        end
      end

      if hasDropEvent then
        local newTimeQuery = {}
        for key = 1, #timerQuery do
          local value = timerQuery[key]
          if not value.drop then
            table.insert(newTimeQuery, value)
          else
            timerQueryIndex[value.id] = nil
          end
        end
        timerQuery = newTimeQuery
      end
    end

    -- screenListenerQuery
    if #screenListenerQuery > 0 then
      keepScreen(false);
      if type(getDeviceOrient) == 'function' then getDeviceOrient() end
      local hasDropEvent = false
      continue = continue + 1
      sleepTime = math.min(sleepTime, 200)
      getColor(0, 0)
      keepScreen(true);
      for key = 1, #screenListenerQuery do
        local value = screenListenerQuery[key]
        if not value.drop then
          if (value.checker()) then
            table.insert(eventQuery, value)
            if (value.isOnce) then
              value.drop = true
              hasDropEvent = true
            end
          end
        else
          hasDropEvent = true
        end
      end
      keepScreen(false);

      if (hasDropEvent) then
        local newScreenListenerQuery = {}
        for key = 1, #screenListenerQuery do
          local value = screenListenerQuery[key]
          if (not value.drop) then
            table.insert(newScreenListenerQuery, value)
          else
            screenListenerQueryIndex[value.id] = nil
          end
        end
        screenListenerQuery = newScreenListenerQuery
      end
    end

    -- buttonListenerQuery
    if (#buttonListenerQuery > 0) then
      sleepTime = math.min(sleepTime, 200)
      continue = continue + 1
      local btnIdList = {}
      local hasBtnClick = false
      local hasDropEvent = false
      while (true) do
        local btnId = fwGetPressedButton()
        if (type(btnId) ~= 'string') then break end
        btnIdList[btnId] = btnId
        hasBtnClick = true
      end
      if (hasBtnClick) then
        for key = 1, #buttonListenerQuery do
          local value = buttonListenerQuery[key]
          if (not value.drop) then
            if (btnIdList[value.btnId] == value.btnId) then
              table.insert(eventQuery, value)
            end
          else
            hasDropEvent = true
          end
        end

        if (hasDropEvent) then
          local newButtonListenerQuery = {}
          for key = 1, #buttonListenerQuery do
            local value = buttonListenerQuery[key]
            if (not value.drop) then
              table.insert(newButtonListenerQuery, value)
            else
              buttonListenerQueryIndex[value.id] = nil
            end
          end
          buttonListenerQuery = newButtonListenerQuery
        end
      end
    end

    if (luaExisted) then
      break
    end
    if (#eventQuery <= 0) then
      mSleep(sleepTime)
    end
  until (false)
end

return {
  setImmediate = setImmediate,
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
}
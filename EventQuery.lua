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
local screenListenerQueryGroup = {}
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

function getScreenEventObj(tags, checker, func)
  return {
    id = getEventId() or 0,
    tags = tags,
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
  table.insert(eventQuery, eventObj)
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

-- param: tags, checker, func
function setScreenListener(...)
  local args = { ... }
  local tags = {}
  if (type(args[1]) == 'table') then
    tags = table.remove(args, 1)
  elseif (type(args[1]) == 'string') then
    tags = { table.remove(args, 1) }
  end
  local checker = table.remove(args, 1)
  local func = table.remove(args, 1)


  if (type(checker) ~= 'function') then return 0 end
  if (type(func) ~= 'function') then return 0 end
  local screenEventObj = getScreenEventObj(tags, checker, func)
  table.insert(screenListenerQuery, screenEventObj)
  screenListenerQueryIndex[screenEventObj.id] = screenEventObj
  for _, tag in ipairs(tags) do
    screenListenerQueryGroup[tag] = screenListenerQueryGroup[tag] or {}
    screenListenerQueryGroup[tag][screenEventObj.id] = screenEventObj
  end
  return screenEventObj.id
end

function clearScreenListener(id)
  local theEventObj = screenListenerQueryIndex[id]
  if (theEventObj) then
    theEventObj.drop = true
    screenListenerQueryIndex[id] = nil
    for _, tag in ipairs(theEventObj.tags) do
      if (type(screenListenerQueryGroup[tag]) == 'table') then
        screenListenerQueryGroup[tag][theEventObj.id] = nil
        if (isEmpty(screenListenerQueryGroup[tag])) then
          screenListenerQueryGroup[tag] = nil
        end
      end
    end
  end
end

function clearScreenListenerByTags(tags)
  if (type(tags) ~= 'table') then
    tags = { tags }
  end
  for _, tag in pairs(tags) do
    local tagsEventObj = screenListenerQueryGroup[tag]
    if (type(tagsEventObj) == 'table') then
      for _, eventObj in pairs(tagsEventObj) do
        eventObj.drop = true
        screenListenerQueryIndex[eventObj.id] = nil
      end
    end
    screenListenerQueryGroup[tag] = nil
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
  if (not theEventObj) then
    theEventObj.drop = true
    buttonListenerQueryIndex[id] = nil
  end
end

function clearListenersOnButton(btnId)
  for key, value in ipairs(buttonListenerQuery) do
    if (value.btnId ~= btnId) then
      value.drop = true
      buttonListenerQueryIndex[value.id] = nil
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
        if (not value.drop) then
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
      end
      timerQuery = newTimeQuery
      newTimeQuery = nil
    end

    -- screenListenerQuery
    if (#screenListenerQuery > 0) then
      if (type(getDeviceOrient) == 'function') then getDeviceOrient() end
      local hasDropEvent = false
      continue = continue + 1
      sleepTime = math.min(sleepTime, 200)
      keepScreen(true);
      for key, value in ipairs(screenListenerQuery) do
        if (not value.drop) then
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

      if (hasDropEvent) then
        local newScreenListenerQuery = {}
        for key, value in ipairs(screenListenerQuery) do
          if (not value.drop) then
            table.insert(newScreenListenerQuery, value)
          end
        end
        screenListenerQuery = newScreenListenerQuery
      end
      keepScreen(false);
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
        for key, value in ipairs(buttonListenerQuery) do
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
          for key, value in ipairs(buttonListenerQuery) do
            if (not value.drop) then
              table.insert(newButtonListenerQuery, value)
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
  setimmediate = setImmediate,
  setTimeout = setTimeout,
  clearTimeout = clearTimeout,
  setInterval = setInterval,
  clearInterval = clearTimeout,
  setScreenListener = setScreenListener,
  clearScreenListener = clearScreenListener,
  clearScreenListenerByTags = clearScreenListenerByTags,
  setButotnListener = setButotnListener,
  clearListenersOnButton = clearListenersOnButton,
  clearButotnListener = clearButotnListener,
  run = run,
}
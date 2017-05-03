local sz = require 'sz'
local socket = require 'szocket.core'
require 'TableLib'

function bindSelf(func, self)
  return function(...) return func(self, ...) end
end

local eventQuery = {
  ['query'] = {},
  ['queryIndex'] = {},
  ['timeoutId'] = 0,
  __addQuery = bindSelf(__addQuery, eventQuery),
  __clearQuery = bindSelf(__clearQuery, eventQuery),
  setTimeout = bindSelf(setTimeout, eventQuery),
  clearTimeout = bindSelf(clearTimeout, eventQuery),
  setInterval = bindSelf(setInterval, eventQuery),
  clearInterval = bindSelf(clearInterval, eventQuery),
  setOneceListener = bindSelf(setOneceListener, eventQuery),
  clearOneceListener = bindSelf(clearOneceListener, eventQuery),
  run = bindSelf(run, eventQuery),
}

-- 增加定时任务，内部使用方法
function __addQuery(self, call, theTime, timeoutId, isInterval, ms)
  if (isInterval ~= true) then
    isInterval = false
  end
  if ((type(ms) ~= 'number')) then
    ms = 0
  end
  if (type(call) == 'function') then
    self.queryIndex[timeoutId] = call
    table.push(self.query, { theTime, timeoutId, call, isInterval, ms })
    table.sort(self.query,
      function(a, b)
        return a[1] < b[1]
      end)
  end
  return timeoutId
end

-- 清除定时任务，内部使用方法
function __clearQuery(self, clearid)
  if (self.queryIndex[clearid]) then
    for k, v in ipairs(self.query) do
      local id = v[2]
      if ((id == clearid)) then
        table.remove(self.query, k)
        self.queryIndex[clearid] = nil
        return true
      end
    end
  end
  return false
end

-- 设置计时器
function setTimeout(self, call, ms)
  if (type(call) ~= 'function') then
    return 0
  end
  ms = ms or 0
  self.timeoutId = self.timeoutId + 1
  local id = self.timeoutId
  local theTime = socket.gettime() * 1000 + ms
  nLog('the id is ' .. console.log(id))
  self.__addQuery(call, theTime, id)
  return id
end

-- 清除计时器
function clearTimeout(self, clearid)
  return self.__clearQuery(clearid)
end

-- 设置定时器
function setInterval(self, call, ms)
  if (type(call) ~= 'function') then
    return 0
  end

  self.timeoutId = self.timeoutId + 1
  local id = self.timeoutId

  local theTime = socket.gettime() * 1000
  self.queryIndex[id] = call

  self.__addQuery(call, theTime, id, true, ms)
  return self.timeoutId
end

-- 清除定时器
function clearInterval(self, clearid)
  return self.__clearquery(clearid)
end

-- 设置一次性监听器
-- listener是监听方法，每隔ms毫秒就会调用一次，如果返回true则执行call，之后就移出任务队列
-- 只输入listener不输入call则认为listener包含了执行方法，返回false会继续监听，返回true就移出任务队列
function setOneceListener(self, ...)
  local listener
  local call
  local ms
  if (select('#', ...) > 2) then
    listener = select(1, ...)
    call = select(2, ...)
    ms = select(3, ...)
  else
    listener = select(1, ...)
    ms = select(2, ...)
  end

  if (type(listener) ~= 'function') then
    return 0
  end

  self.timeoutId = self.timeoutId + 1
  local id = self.timeoutId

  local callBody

  if (type(call) == 'function') then
    callBody = function()
      local res = listener()
      if (res) then
        call()
        self.clearOneceListener(id)
      end
      return res
    end
  else
    callBody = function()
      local res = listener()
      if (res) then
        self.clearOneceListener(id)
      end
      return res
    end
  end

  local theTime = socket.gettime() * 1000 + ms
  self.__addQuery(callBody, theTime, id, true, ms)
  return self.timeoutId
end

-- 清除一次性监听器
function clearOneceListener(self, clearid)
  return self.__clearQuery(clearid)
end

-- 运行
-- maxMs：最长执行时间，0或nil表示无限
function run(self, maxMs)
  local infiniteTime = false
  local endTime = 0
  if ((type(maxMs) == 'nil') or maxMs == 0) then
    infiniteTime = true
  else
    endTime = socket.gettime() * 1000 + maxMs
  end
  while ((infiniteTime or (maxMs > socket.gettime() * 1000)) and ((#self.query > 0) or (#self.query > 0))) do
    while (#self.query > 0) do
      local v = table.first(self.query)
      if (socket.gettime() * 1000 > v[1]) then
        local v = table.shift(self.query)
        local theTime = v[1]
        local id = v[2]
        local call = v[3]
        local isInterval = v[4]
        local ms = v[5]
        self.queryIndex[id] = nil
        if (isInterval) then
          theTime = theTime + ms
          while (theTime < socket.gettime() * 1000) do
            theTime = theTime + ms
          end

          self.__addQuery(call, theTime, id, isInterval, ms)
        end
        call()
      else
        break
      end
    end

    -- 检测下一个任务的时间
    local f = table.first(self.query)
    if (f) then
      local nextTime = math.max(math.ceil(f[1]) - math.ceil(socket.gettime() * 1000), 0)
      mSleep(nextTime)
    end
  end
  return self
end

return eventQuery;
local sz = require "sz"
local socket = require "szocket.core"
require "TableLib"


local eventQuery = {
  ["query"] = {},
  ["queryIndex"] = {},
  ["timeoutId"] = 0,
}

-- 增加定时任务，内部使用方法
function eventQuery.__addQuery(call, theTime, timeoutId, isInterval, ms)
  if (isInterval ~= true) then
    isInterval = false
  end
  if ((type(ms) ~= "number")) then
    ms = 0
  end
  if (type(call) == "function") then
    eventQuery.queryIndex[timeoutId] = call
    table.push(eventQuery.query, { theTime, timeoutId, call, isInterval, ms })
    table.sort(eventQuery.query,
      function(a, b)
        return a[1] < b[1]
      end)
  end
  return timeoutId
end

-- 清除定时任务，内部使用方法
function eventQuery.__clearQuery(clearid)
  if (eventQuery.queryIndex[clearid]) then
    for k, v in ipairs(eventQuery.query) do
      local id = v[2]
      if ((id == clearid)) then
        table.remove(eventQuery.query, k)
        eventQuery.queryIndex[clearid] = nil
        return true
      end
    end
  end
  return false
end

-- 设置计时器
function eventQuery.setTimeout(call, ms)
  if (type(call) ~= "function") then
    return 0
  end
  ms = ms or 0
  eventQuery.timeoutId = eventQuery.timeoutId + 1
  local id = eventQuery.timeoutId
  local theTime = socket.gettime() * 1000 + ms
  nLog("the id is " .. console.log(id))
  eventQuery.__addQuery(call, theTime, id)
  return id
end

-- 清除计时器
function eventQuery.clearTimeout(clearid)
  return eventQuery.__clearQuery(clearid)
end

-- 设置定时器
function eventQuery.setInterval(call, ms)
  if (type(call) ~= "function") then
    return 0
  end

  eventQuery.timeoutId = eventQuery.timeoutId + 1
  local id = eventQuery.timeoutId

  local theTime = socket.gettime() * 1000
  eventQuery.queryIndex[id] = call

  eventQuery.__addQuery(call, theTime, id, true, ms)
  return eventQuery.timeoutId
end

-- 清除定时器
function eventQuery.clearInterval(clearid)
  return eventQuery.__clearquery(clearid)
end

-- 设置一次性监听器
-- listener是监听方法，每隔ms毫秒就会调用一次，如果返回true则执行call，之后就移出任务队列
-- 只输入listener不输入call则认为listener包含了执行方法，返回false会继续监听，返回true就移出任务队列
function eventQuery.setOneceListener(...)
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

  if (type(listener) ~= "function") then
    return 0
  end

  eventQuery.timeoutId = eventQuery.timeoutId + 1
  local id = eventQuery.timeoutId

  local callBody

  if (type(call) == "function") then
    callBody = function()
      local res = listener()
      if (res) then
        call()
        eventQuery.clearOneceListener(id)
      end
      return res
    end
  else
    callBody = function()
      local res = listener()
      if (res) then
        eventQuery.clearOneceListener(id)
      end
      return res
    end
  end

  local theTime = socket.gettime() * 1000 + ms
  eventQuery.__addQuery(callBody, theTime, id, true, ms)
  return eventQuery.timeoutId
end

-- 清除一次性监听器
function eventQuery.clearOneceListener(clearid)
  return eventQuery.__clearQuery(clearid)
end

-- 运行
-- maxMs：最长执行时间，0或nil表示无限
function eventQuery.run(maxMs)
  local infiniteTime = false
  local endTime = 0
  if ((type(maxMs) == "nil") or maxMs == 0) then
    infiniteTime = true
  else
    endTime = socket.gettime() * 1000 + maxMs
  end
  while ((infiniteTime or (maxMs > socket.gettime() * 1000)) and ((#eventQuery.query > 0) or (#eventQuery.query > 0))) do
    while (#eventQuery.query > 0) do
      local v = table.first(eventQuery.query)
      if (socket.gettime() * 1000 > v[1]) then
        local v = table.shift(eventQuery.query)
        local theTime = v[1]
        local id = v[2]
        local call = v[3]
        local isInterval = v[4]
        local ms = v[5]
        eventQuery.queryIndex[id] = nil
        if (isInterval) then
          theTime = theTime + ms
          while (theTime < socket.gettime() * 1000) do
            theTime = theTime + ms
          end

          eventQuery.__addQuery(call, theTime, id, isInterval, ms)
        end
        call()
      else
        break
      end
    end

    -- 检测下一个任务的时间
    local f = table.first(eventQuery.query)
    if (f) then
      local nextTime = math.max(math.ceil(f[1]) - math.ceil(socket.gettime() * 1000), 0)
      mSleep(nextTime)
    end
  end
  return eventQuery
end

return eventQuery;
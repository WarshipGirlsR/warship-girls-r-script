if type(Promise) ~= 'table' then
  error('SleepPromise need Promise module to work. Please require \'Promise\' as global variable.', 2)
end
if type(EventQuery) ~= 'table' then
  error('SleepPromise need EventQuery module to work. Please require \'EventQuery\' as global variableß .', 2)
end

local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    EventQuery.setTimeout(resolve, ms)
  end)
end

local vibratorPromise = function(num, ms)
  num = num or 1
  ms = ms or 500
  local res = Promise.resolve(1)
  for key = 1, num do
    res = res.andThen(function()
      return vibrator()
    end).andThen(function()
      return sleepPromise(ms)
    end)
  end
  return res
end
return vibratorPromise

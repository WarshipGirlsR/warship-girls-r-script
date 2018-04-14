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
return sleepPromise

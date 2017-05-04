local co = require 'Co'
local Promise = require 'Promise'
require 'console'
local eq = require 'EventQuery'


local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    eq.setTimeout(resolve, ms)
  end)
end

co(coroutine.create(function()
  console.log('start a')
  for i = 1, 15, 1 do
    coroutine.yield(sleepPromise(500))
    console.log('a' .. i)
  end
  console.log('end a')
end)).catch(function(err)
  console.log(err)
end)

co(coroutine.create(function()
  console.log('start b')
  for i = 1, 10, 1 do
    coroutine.yield(sleepPromise(700))
    console.log('b' .. i)
  end
  console.log('end b')
end)).catch(function(err)
  console.log(err)
end)


co(coroutine.create(function()
  console.log('start c')
  for i = 1, 23, 1 do
    coroutine.yield(sleepPromise(400))
    console.log('c' .. i)
  end
  console.log('end c')
end)).catch(function(err)
  console.log(err)
end)


eq.run()

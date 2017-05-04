local co = require 'Co'
local Promise = require 'Promise'
require 'console'
local eq = require 'EventQuery'

local runQ = {
  queue = {},
}
function runQ:add(value)
  table.insert(self.queue, value)
end

function runQ:run()
  local value = table.remove(self.queue, 1)
  if (type(value) == 'function') then
    value()
    return true
  end
  return false
end

local getNewPromise = function(text)
  return Promise.new(function(resolve, reject)
    runQ:add(function()
      resolve(text)
    end)
  end)
end

co(coroutine.create(function()
  console.log('start a')
  for i = 1, 3, 1 do
    coroutine.yield(getNewPromise(500))
    console.log('a' .. i)
  end
  console.log('end a')
end)).catch(function(err)
  console.log(err)
end)

co(coroutine.create(function()
  console.log('start b')
  for i = 1, 3, 1 do
    coroutine.yield(getNewPromise(1000))
    console.log('b' .. i)
  end
  console.log('end b')
end)).catch(function(err)
  console.log(err)
end)


while (runQ:run()) do
end

function case1()
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
end


function case3()
  local co = require 'Co'
  local Promise = require 'Promise'
  Promise.setStackTraceback(false)
  local eq = require 'EventQuery'

  local sleepPromise = function(ms)
    return Promise.new(function(resolve)
      eq.setTimeout(resolve, ms)
    end)
  end

  co(coroutine.create(function()
    local i = 0
    fwShowWnd("steplabel", 300, 50, 300, 100, 0)
    while (i < 10000) do
      i = i + 1
      if (i > 5) then error(2333) end
      nLog(12345)
      coroutine.yield(sleepPromise(100))
      nLog(1234522)
      local text = 'teststring' .. i
      fwShowButton("steplabel", "stopbtn", text, "90333333", "90FFFFFF", "", 7, 0, 0, 300, 100)
      nLog(" " .. text)
    end
  end)).catch(function(err)
    eq.setTimeout(function(err) error(err) end, ms)
  end)

  eq.run()
end

case3()

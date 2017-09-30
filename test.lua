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
    error(1231241225)
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
    eq.setImmediate(function() error(err) end)
  end)

  eq.run()
end

function case4()
  local co = require 'Co'
  local Promise = require 'Promise'
  Promise.setStackTraceback(false)
  local eq = require 'EventQuery'

  eq.setTimeout(function()
    error(12345)
  end, 0)


  eq.run()
end

function case5()
  require 'TableLib'
  require 'console'
  local result = {
    {
      {
        {
          { 1, 2, 3 },
          { 4, 5, 6 },
          { 7, 8, 9 },
        },
        {
          { 1, 2, 3 },
          { 4, 5, 6 },
          { 7, 8, 9 },
        },
      },
      {
        {
          { 1, 2, 3 },
          { 4, 5, 6 },
          { 7, 8, 9 },
        },
        {
          { 1, 2, 3 },
          { 4, 5, 6 },
          { 7, 8, 9 },
        },
      },
      {
        {
          [5] = { 1, 2, 3 },
          { 4, 5, 6 },
          { 7, 8, 9 },
        },
        {
          { 1, 2, 3 },
          { 4, 5, 6 },
          { 7, 8, 9 },
        },
      },
    }
  }

  console.log(result)
  local result2 = {
    [1] = 1,
    [2] = 2,
    [3] = 3,
    [6] = { 1, 2, 3, 4, 5 },
    [7] = {
      [1] = function() end,
      [4] = 4,
      [7] = 7,
    },
  }
  console.log(result2)
end

function case6()
  require 'TableLib'
  require 'console'
  require 'TSLib'
  init(1)
  local mapMaker = require 'BaseOperate'
  console.log(mapMaker().battle.isEnemyShipIsSS())
end

function case7()
  require 'TableLib'
  require 'StringLib'
  require 'console'

  local lfs = require 'lfs'
  local logPath = userPath() .. '/log'
  local dirs = lfs.dir(logPath)
  console.log(dirs)

  local sevenDayBeforeTime = os.time() - (7 * 24 * 60 * 60)
  local theTime = os.time()

  local dirsLen = #dirs

  dirs = table.filter(dirs, function(e, index)
    if (string.startWith(e, 'warship-girls-r-script_')) then
      local res = string.match(e, 'warship%-girls%-r%-script_(%d+)')
      res = tonumber(res) or theTime
      if ((index < (dirsLen - 50)) and (res < sevenDayBeforeTime)) then
        return true
      end
    end
    return false
  end)

  for k = 1, #dirs do
    lfs.rm(logPath .. '/' .. dirs[k])
  end
  local dirs = lfs.dir(logPath)
  console.log(dirs)
end

function case8()
  require 'TableLib'
  require 'StringLib'
  require 'console'
  console.log(string)
  local res, num = string.match('warship-girls-r-script_1495353138.log', 'warship%-girls%-r%-script_(%d+)')

  console.log(res)
  console.log(table.from(res))
  console.log(num)
end

case7()
local co = require 'Co'
require 'TableLib'
require 'console'
local EQ = require 'EventQuery'

local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    EQ.setTimeout(resolve, ms)
  end)
end

--co(coroutine.create(function()
--  local v1 = coroutine.yield(Promise.resolve(123))
--  nLog(console.log(v1))
--  local v2 = coroutine.yield(Promise.resolve(234))
--  nLog(console.log(v2))
--  local v3 = coroutine.yield(Promise.all({
--    Promise.resolve(534),
--    Promise.resolve(254),
--  }))
--  nLog(console.log(v3))
--end)):catch(function(err)
--  nLog(console.log(err))
--end)

nLog(os.date())
Promise.all({ sleepPromise(1000) }):andThen(function(res)
  nLog(os.date())
end)
EQ.run()
nLog("end")
function test1()
  useNlog = true
  require 'console'
  --获取外网ip地址
  local ts = require("ts")
  local json = ts.json
  local requestBody = {
    title = '1251261236',
    body = '123124124',
    type = 'note',
  }
  local requestHeader = {
    ['Access-Token'] = 'o.lqzD6x2wqvXHK6iI2CxHeXiVbj8mvZ7w',
    ['Content-Type'] = 'application/json';
    ['Content-Length'] = string.len(json.encode(requestBody));
  }
  console.log(requestHeader)
  console.log(requestBody)
  --local code, header_resp, responseBody = ts.httpsPost("https://api.pushbullet.com/v2/pushes", requestBody, requestBody)
  --local responseBody = {}
  --local res, code = https.request {
  --  url = 'https://api.pushbullet.com/v2/pushes',
  --  --    create = function()
  --  --      local req_sock = socket.tcp()
  --  --      req_sock:settimeout(1, 't')
  --  --      return req_sock
  --  --    end,
  --  method = 'POST',
  --  headers = requestHeader,
  --  source = ltn12.source.string(json.encode(requestBody)),
  --  sink = ltn12.sink.table(responseBody)
  --};
  local commandTable = {}
  for k, v in pairs(requestHeader) do
    table.insert(commandTable, '--header ' .. k .. ':' .. v)
  end
  table.insert(commandTable, '--data-binary ' .. json.encode(json.encode(requestBody)))
  table.insert(commandTable, '--request POST')
  table.insert(commandTable, 'https://api.pushbullet.com/v2/pushes')
  console.log('curl ' .. table.concat(commandTable, ' '))
  local res = io.popen('curl ' .. table.concat(commandTable, ' '));
  console.log(res)
  local responseBody = res:read('*a')
  console.log(responseBody)
  console.log(1333)
end

function test2()
  useNlog = true
  require 'console'
  local Promise = require 'Promise'
  Promise.new(function(resolve, reject)
    reject(123)
  end).catch(function(err)
    nLog(err)
    mSleep(123456)
  end)
end

test2()

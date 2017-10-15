local ts = require('ts')
local json = ts.json
local socket = require('socket')
local http = require('socket.http')

function sendToPushBullet(token, title, body)
  local requestBody = {
    title = title,
    body = body,
    type = 'note',
  }
  local requestHeader = {
    ['Access-Token'] = token,
    ['Content-Type'] = 'application/json';
    ['Content-Length'] = string.len(json.encode(requestBody));
  }
  local commandTable = {}
  table.insert(commandTable, '--connect-timeout 1')
  table.insert(commandTable, '-m 0')
  for k, v in pairs(requestHeader) do
    table.insert(commandTable, '--header ' .. k .. ':' .. v)
  end
  table.insert(commandTable, '--data-binary ' .. json.encode(json.encode(requestBody)))
  table.insert(commandTable, '--request POST')
  table.insert(commandTable, 'https://api.pushbullet.com/v2/pushes')
  local res = io.popen('curl ' .. table.concat(commandTable, ' '));
  local responseBody = res:read('*a')
  return responseBody
end

return sendToPushBullet

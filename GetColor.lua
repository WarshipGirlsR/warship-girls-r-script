init(1)
require 'console'
mSleep(1000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
  { 444, 643, 0x0069a4 },
  { 641, 643, 0x086dad },
  { 838, 643, 0x0869a4 },
  { 1035, 643, 0x086dad },
  { 1232, 643, 0x0069a4 },
  { 1428, 643, 0x0069a4 },
}

local resultStr = ''

for key, value in ipairs(list) do
  local color = getColor(value[1], value[2])
  local oldColor = value[3]
  local colorStr = string.format('0x%06x', color)
  local oldColorStr = string.format('0x%06x', oldColor)
  value[3] = oldColorStr
  if (color == oldColor) then
    resultStr = resultStr .. '\n' .. console.getJsStr(value)
  else
    value[3] = colorStr
    resultStr = resultStr .. '\n' .. console.getJsStr(value) .. '  old Color: ' .. oldColorStr
  end
end

console.log(resultStr)
keepScreen(false)
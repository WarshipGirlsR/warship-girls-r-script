init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 31, 86, 0xcecace },
  { 190, 9, 0xc5cac5 },
  { 142, 6, 0x085d94 },
  { 697, 44, 0x9ca63a },
  { 1379, 36, 0xfffbf7 },
  { 81, 85, 0xcecece },
  { 1855, 64, 0xb54d00 },
  { 1651, 1027, 0xcecece },
  { 1435, 443, 0xbd4d00 },
  { 1132, 532, 0x3abee6 },
  { 1749, 531, 0x3ac2e6 },
  { 1430, 862, 0x0092c5 },
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
mSleep(6000)
keepScreen(false)
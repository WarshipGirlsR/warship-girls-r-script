useNlog = true
init(2)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 92, 210, 0xd6cabd },
  { 931, 211, 0xd6cec5 },
  { 1824, 226, 0xd6cabd },
  { 84, 981, 0xcecabd },
  { 909, 994, 0xcecabd },
  { 1820, 993, 0xcecabd },
  { 1205, 942, 0xcecabd },
  { 1427, 951, 0xad4d08 },
  { 1180, 512, 0xd6cac5 },
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
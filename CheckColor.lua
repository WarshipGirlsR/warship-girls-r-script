init(2)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 264, 173, 0x0079bd }, { 1012, 214, 0x08619c },
  { 1412, 226, 0xd6cabd }, { 1439, 842, 0xc5b69c },
  { 285, 835, 0xd6cec5 }, { 1144, 764, 0x42ceef },
  { 1398, 806, 0x0096c5 }, { 1258, 779, 0xffffff },
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
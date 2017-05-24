init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
  { 143, 123, 0x0875bd }, { 165, 156, 0x0892ce }, { 881, 157, 0x0865a4 }, { 882, 119, 0x005994 },
  { 956, 157, 0xcecabd }, { 1320, 164, 0xd6cac5 }, { 1725, 160, 0xd6cabd }, { 1771, 481, 0xd6cec5 },
  { 1775, 645, 0xd6cec5 }, { 1787, 880, 0xcecabd }, { 1561, 898, 0xcecabd }, { 1327, 894, 0xc5b69c },
  { 101, 543, 0xd6cec5 }, { 1405, 647, 0xd6cec5 }, { 1414, 521, 0xcecabd },
  -- 出征按钮
  { 1476, 771, 0xef8a3a }, { 1493, 782, 0xa45d21 }, { 1517, 790, 0xf7fbff }, { 1534, 806, 0x522d10 },
  { 1547, 812, 0xefebe6 }, { 1553, 812, 0xfffbff }, { 1576, 811, 0xf7fbff }, { 1613, 771, 0xef8a42 },
  { 1705, 804, 0xd67119 }, { 1702, 833, 0xad4900 },
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
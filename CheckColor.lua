init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 505, 275, 0xcecece }, { 636, 260, 0xffffff }, { 658, 260, 0xffffff }, { 682, 262, 0xffffff },
  { 717, 258, 0xffffff }, { 755, 266, 0xffffff }, { 1035, 271, 0x105d94 }, { 524, 349, 0xcecabd },
  { 1390, 356, 0xd6cabd }, { 1390, 608, 0xd6cabd }, { 522, 671, 0xbdb69c }, { 1398, 772, 0xc5b69c },
  { 668, 731, 0x0096c5 }, { 1094, 730, 0xad1400 }, { 573, 435, 0xffffff }, { 636, 446, 0xffffff },
  { 825, 459, 0xffffff }, { 1053, 435, 0xffffff }, { 1254, 440, 0xffffff }, { 1331, 443, 0xffffff },
  { 836, 513, 0xffffff }, { 923, 509, 0xffffff }, { 1091, 503, 0xffffff }, { 555, 444, 0xcecabd },
  { 1292, 445, 0xcecabd }, { 1117, 516, 0xd6cabd }, { 781, 509, 0xd6cec5 },
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
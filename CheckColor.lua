init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
  { 659, 723, 0xe68131 },
  { 671, 725, 0xffffff },
  { 714, 750, 0xffffff },
  { 698, 765, 0x5a4129 },
  { 677, 765, 0xf7f3f7 },
  { 740, 733, 0xde7521 },
  { 779, 726, 0x4a2408 },
  { 780, 739, 0x422008 },
  { 787, 748, 0xf7fbff },
  { 798, 760, 0xa44500 },
  { 1109, 729, 0x42c2e6 },
  { 1122, 729, 0x636d73 },
  { 1143, 732, 0x6b868c },
  { 1144, 747, 0xe6efef },
  { 1163, 749, 0x3a5563 },
  { 1188, 748, 0x29b6de },
  { 1213, 729, 0xfffbff },
  { 1240, 725, 0x002d3a },
  { 1225, 755, 0xa4a6ad },
  { 1236, 771, 0x000408 },
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
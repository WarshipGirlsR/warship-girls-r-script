init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
  -- 前进
  { 659, 723, 0xe68131 },
  { 671, 725, 0x5a3d29 },
  { 714, 750, 0xffffff },
  { 698, 765, 0x4a2410 },
  { 677, 765, 0x633d29 },
  { 740, 733, 0xde7521 },
  { 779, 726, 0x633110 },
  { 780, 739, 0x4a2408 },
  { 787, 748, 0xf7fbff },
  { 798, 760, 0xbd5100 },
  -- 回港
  { 1109, 729, 0x4acaf7 },
  { 1122, 729, 0xf7f7f7 },
  { 1143, 732, 0x000c21 },
  { 1144, 747, 0x08313a },
  { 1163, 749, 0xffffff },
  { 1188, 748, 0x29b6de },
  { 1213, 729, 0xffffff },
  { 1240, 725, 0x31414a },
  { 1225, 755, 0x082031 },
  { 1236, 771, 0xffffff },
}

local resultStr = ''

for key, value in ipairs(list) do
  local color = getColor(value[1], value[2])
  local oldColor = value[3]
  local colorStr = string.format('0x%06x', color)
  local oldColorStr = string.format('0x%06x', oldColor)
  value[3] = oldColorStr
  resultStr = resultStr .. '\n' .. '{ ' .. value[1] .. ', ' .. value[2] .. ', ' .. colorStr .. ' },'
end
resultStr = resultStr .. '\n'
console.log(resultStr)
mSleep(6000)
keepScreen(false)
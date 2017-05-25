init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 517, 246, 0x0081c5 }, { 506, 331, 0xcecabd }, { 513, 781, 0xc5baa4 }, { 1407, 782, 0xc5b69c },
  { 1408, 296, 0xd6cac5 }, { 774, 471, 0xcecabd }, { 796, 470, 0x083942 }, { 810, 473, 0x9cb2b5 },
  { 849, 482, 0x638184 }, { 864, 476, 0x526d73 }, { 623, 261, 0x085994 }, { 652, 261, 0xf7fbf7 },
  { 664, 259, 0xadbebd }, { 682, 260, 0xffffff }, { 709, 262, 0xbdcace }, { 738, 268, 0x7b969c },
  { 758, 265, 0xd6e3de }, { 710, 252, 0xc5cece }, { 678, 252, 0x00558c }, { 705, 255, 0x084152 },
  { 773, 483, 0xd6cec5 }, { 795, 483, 0xeff3f7 }, { 833, 483, 0xb5c2c5 }, { 846, 483, 0x9ca29c },
  { 870, 485, 0x3a6163 }, { 894, 486, 0xd6cac5 }, { 931, 491, 0xf7f7f7 }, { 963, 498, 0x4a6973 },
  { 989, 499, 0x31555a }, { 1047, 483, 0x5a797b },
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
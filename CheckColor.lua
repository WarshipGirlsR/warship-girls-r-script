useNlog = true
init(2)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 216, 111, 0xefc2bd },
  { 528, 111, 0x84756b },
  { 993, 114, 0xf7caad },
  { 1248, 124, 0xffcab5 },
  { 1436, 264, 0xe1813a },
  { 1783, 241, 0xffdfd6 },
  { 1802, 773, 0xf0926b },
  { 1053, 895, 0x848e29 },
  { 576, 829, 0x525563 },
  { 387, 843, 0xad3d31 },
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
init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
  { 88, 38, 0x2181bd },
  { 306, 42, 0x10558c },
  { 24, 191, 0x314d73 },
  { 15, 625, 0x3a5173 },
  { 575, 1066, 0x425173 },
  { 957, 111, 0x085994 },
  { 575, 227, 0xc5baa4 },
  { 1649, 958, 0x42ceef },
  { 1734, 956, 0x42cef7 },
  { 1816, 1021, 0x008ebd },
  { 1651, 1008, 0x0096c5 },
  { 1705, 986, 0xffffff },
  { 1823, 1010, 0x0096c5 },
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
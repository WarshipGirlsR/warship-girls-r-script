init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 180, 632, 0x105984 },
  { 99, 963, 0xb5814a },
  { 241, 229, 0x4a6184 },
  { 250, 450, 0x5a718c },
  { 248, 756, 0x425d7b },
  { 103, 149, 0x0092c5 },
  { 101, 288, 0xad4900 },
  { 100, 431, 0x008ebd },
  { 105, 575, 0x008ec5 },
  { 1402, 138, 0xcecace },
  { 1572, 135, 0x7b7d7b },
  { 1791, 97, 0x848184 },
  { 1874, 137, 0xc5cac5 },
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
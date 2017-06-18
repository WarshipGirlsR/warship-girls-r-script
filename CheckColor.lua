init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 77, 125, 0x105d9c },
  { 51, 237, 0xd6cec5 },
  { 50, 842, 0xd6cac5 },
  { 1631, 823, 0xc5baa4 },
  { 1647, 243, 0xd6cec5 },
  { 517, 703, 0xd6cec5 },
  { 1837, 445, 0xdeaa3a },
  { 1828, 648, 0xd6a631 },
  { 1220, 86, 0xcecace },
  { 1647, 136, 0xcecace },
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
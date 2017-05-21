init(1)
require 'console'
mSleep(1000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
  { 277, 621, 0xefe310 },
  { 474, 621, 0xe6df08 },
  { 671, 621, 0xefe310 },
  { 868, 621, 0xe6df08 },
  { 1065, 621, 0xefe310 },
  { 1262, 621, 0xe6df08 },
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
keepScreen(false)
init(2)
require 'console'
require "DeviceOrientHock"
mSleep(1000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
  { 0, math.floor(0.333 * sideLength), 0xfefefe },
  { 0, math.floor(0.5 * sideLength), 0xfefefe },
  { 0, math.floor(0.667 * sideLength), 0xfefefe },
  { 0, math.floor(0.833 * sideLength), 0xfefefe },
  { 1, math.floor(0.333 * sideLength), 0x010101 },
  { 1, math.floor(0.5 * sideLength), 0x010101 },
  { 1, math.floor(0.667 * sideLength), 0x010101 },
  { 1, math.floor(0.833 * sideLength), 0x010101 },
}

local resultStr = ''

for key, value in ipairs(list) do
  local color = getColor(value[1], value[2])
  local oldColor = value[3]
  local colorStr = '0x' .. string.format('%x', color)
  local oldColorStr = '0x' .. string.format('%x', oldColor)
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
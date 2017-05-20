init(1)
require 'console'
mSleep(1000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
  { 110, 148, 0x008ebd },
  { 111, 290, 0x008ebd },
  { 107, 429, 0xb54d08 },
  { 111, 572, 0x008ebd },
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
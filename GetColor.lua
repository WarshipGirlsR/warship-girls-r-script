init(1)
require 'console'
mSleep(1000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
  { 347, 218, 0xb53129 },
  { 383, 274, 0x9c2021 },
  { 349, 325, 0x941419 },
  { 348, 357, 0xad2d29 },
  { 383, 414, 0x941819 },
  { 349, 464, 0x8c1410 },
  { 347, 495, 0xb53131 },
  { 383, 552, 0x942021 },
  { 349, 603, 0x8c1419 },
  { 347, 634, 0xad3131 },
  { 383, 691, 0x941c21 },
  { 349, 742, 0x8c1410 },
  { 347, 773, 0xb53131 },
  { 383, 830, 0x941c21 },
  { 349, 880, 0x8c1410 },
  { 347, 912, 0xad3129 },
  { 383, 969, 0x8c1419 },
  { 349, 1019, 0x941810 },
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
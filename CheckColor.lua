useNlog = true
init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 110, 865, 0xadaaad },
  { 114, 984, 0xcecace },
  { 1386, 1012, 0x085994 },
  { 1768, 964, 0x085994 },
  { 1803, 951, 0xcecece },
  { 1844, 949, 0x5a5d5a },
  {  114,  940, 0xcecace},
  {   73,  996, 0x636563},
  {  482, 1018, 0x0861a4},
  { 1805,  981, 0xcecece},
  { 1845,  975, 0x6b656b},
  { 1848,  921, 0x525552},
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
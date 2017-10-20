useNlog = true
init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 28, 29, 0x08456b }, { 170, 182, 0x105584 },
  { 34, 324, 0x104d73 }, { 178, 462, 0x105984 },
  { 178, 714, 0x085584 }, { 226, 557, 0xc5cac5 },
  { 251, 394, 0x5a758c }, { 252, 616, 0x5a7594 },
  { 252, 776, 0x4a6584 }, { 249, 956, 0x4a617b },
  { 269, 146, 0x0065a4 },

  { 510, 622, 0xc5bead }, { 1234, 645, 0xc5bead },
  { 1884, 721, 0xcecabd }, { 1874, 209, 0xbdb69c },
  { 1293, 204, 0xd6cabd }, { 1818, 952, 0xc5b69c },
  { 1079, 928, 0xbdb69c }, { 325, 954, 0xcecabd },
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
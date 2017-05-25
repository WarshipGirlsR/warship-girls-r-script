init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list2 = {
  -- 第一位是航母
  { 227, 333, 0xf7f7f7 }, { 252, 331, 0xdee3de }, { 287, 329, 0x84497b }, { 309, 328, 0x8c4984 },
  { 351, 323, 0x6b5d63 }, { 379, 321, 0xa4868c }, { 457, 326, 0x948e94 }, { 520, 348, 0x4a3d42 },
  { 448, 392, 0x943d6b }, { 348, 393, 0x63595a }, { 206, 398, 0x635d63 }, { 223, 394, 0xcecece },
  { 261, 390, 0xe6e7e6 }, { 268, 388, 0x08819c }, { 249, 362, 0x639aad }, { 310, 392, 0x8c4d84 },
  { 357, 396, 0x736973 }, { 400, 393, 0xd68694 }, { 455, 410, 0x734563 }, { 516, 413, 0xdecace },
}
local list = {-- 第二位是航母
}

for key, value in ipairs(list2) do
  table.insert(list, value)
end
for key, value in ipairs(list2) do
  table.insert(list, {
    value[1] + 390,
    value[2],
    value[3],
  })
end

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
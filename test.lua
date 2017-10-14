table.assign = table.assign or function(target, ...)
  local sources = { ... }
  if (type(target) ~= 'table') then target = {} end
  for k = 1, #sources do
    local source = sources[k]
    for key, value in pairs(source) do
      target[key] = value
    end
  end
  return target
end

local function transRelativePoint(tab, base)
  if not base then
    base = tab[1]
    table.remove(tab, 1)
  end
  local newTab = {}
  for key, value in ipairs(tab) do
    newTab[key] = table.assign(value, { value[1] - base[1], value[2] - base[2] })
  end
  local tmp = {}
  for _, value in ipairs(newTab) do
    value[3] = string.format('0x%06X', value[3])
    table.insert(tmp, table.concat(value, '|'))
  end

  return base, table.concat(tmp, ',')
end

local theParam = (function()
  local leftTop = { 185, 155 }
  local rightBotton = { 1899, 1022, }
  local basePoint, posandcolor = transRelativePoint({
    { 177, 1687, 0x00a8e9 },
    { 158, 1648, 0x00a8e9 },
    { 192, 1653, 0x00a8e9 },
    { 197, 1696, 0x00a8e9 },
    { 158, 1698, 0x00a8e9 },
    { 119, 1741, 0x1ec8ee },
    { 178, 1716, 0xf0f0f0 },
    { 184, 1657, 0xf0f0f0 },
  })
  return { basePoint[3], posandcolor, 85, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }
end)()

for i = 1, 100000 do
  local res = findMultiColorInRegionFuzzyExt(table.unpack(theParam))
  nLog(i .. ': res.length = ' .. #res)
end

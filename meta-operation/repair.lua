local repair = {}


-- -- 修理流程

-- 点击船坞按钮
repair.clickDockBtn = function()
  tap(1442, 743, 100)
  return true
end

-- 检测船坞界面
repair.isDockPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 180, 632, 0x105984 },
    { 99, 963, 0xb5814a },
    { 241, 229, 0x4a6184 },
    { 250, 450, 0x5a718c },
    { 248, 756, 0x425d7b },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击修理按钮
repair.clickRepairBtn = function()
  tap(101, 253, 100)
  return true
end

-- 检测修理界面
repair.isRepairPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
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
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 检测可用的修理槽位
repair.hasEmptyRepairSlot = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list1 = {
    { 691, 306, 0x0092c5 },
    { 952, 350, 0x52aaf7 },
  }
  local list2 = {
    { 691, 531, 0x0096c5 },
    { 952, 575, 0x52a6ef },
  }
  local list3 = {
    { 691, 755, 0x0096c5 },
    { 952, 805, 0x5aa6ef },
  }
  local list4 = {
    { 691, 980, 0x0092bd },
    { 952, 1035, 0x6baade },
  }

  local result1 = multiColorS(list1)
  local result2 = multiColorS(list2)
  local result3 = multiColorS(list3)
  local result4 = multiColorS(list4)
  local result = false
  if (result1 or result2 or result3 or result4) then
    result = true
  end
  local hasTable = {}
  if (result1) then table.insert(hasTable, 1) end
  if (result2) then table.insert(hasTable, 2) end
  if (result3) then table.insert(hasTable, 3) end
  if (result4) then table.insert(hasTable, 4) end
  if (not __keepScreenState) then keepScreen(false) end
  return result, hasTable
end

-- 检测第n个修理槽位可用
repair.isSlotEmpty = function(n)
  return function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local result = false
    if (n == 1) then
      local list = {
        { 691, 306, 0x0092c5 },
        { 952, 350, 0x52aaf7 },
      }
      result = multiColorS(list)
    elseif (n == 2) then
      local list = {
        { 691, 531, 0x0096c5 },
        { 952, 575, 0x52a6ef },
      }
      result = multiColorS(list)
    elseif (n == 3) then
      local list = {
        { 691, 751, 0x0096c5 },
        { 952, 794, 0x52a6f7 },
      }
      result = multiColorS(list)
    elseif (n == 4) then
      local list = {
        { 691, 976, 0x0096c5 },
        { 952, 1022, 0x52a6f7 },
      }
      result = multiColorS(list)
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end
end

-- 检测第n个修理槽位不可用
repair.isSlotNotEmpty = function(n)
  return function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local result = false
    if (n == 1) then
      local list = {
        { 691, 306, 0x0092c5 },
        { 952, 350, 0x52aaf7 },
      }
      result = not multiColorS(list)
    elseif (n == 2) then
      local list = {
        { 691, 531, 0x0096c5 },
        { 952, 575, 0x52a6ef },
      }
      result = not multiColorS(list)
    elseif (n == 3) then
      local list = {
        { 691, 751, 0x0096c5 },
        { 952, 794, 0x52a6f7 },
      }
      result = not multiColorS(list)
    elseif (n == 4) then
      local list = {
        { 691, 976, 0x0096c5 },
        { 952, 1022, 0x52a6f7 },
      }
      result = not multiColorS(list)
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end
end

-- 点击第n个修理按钮
repair.clickRepairSlotBtn = function(n)
  n = tonumber(n)
  if (n == 1) then
    tap(602, 283, 100)
  elseif (n == 2) then
    tap(602, 512, 100)
  elseif (n == 3) then
    tap(598, 733, 100)
  elseif (n == 4) then
    tap(601, 957, 100)
  end
  return true
end

-- 检测修理选船界面
repair.isSelectShipPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 75, 131, 0x085594 },
    { 304, 1059, 0x00558c },
    { 1035, 116, 0x3a556b },
    { 1658, 130, 0x4a617b },
    { 1765, 136, 0x1092e6 },
    { 1824, 463, 0x19a2e6 },
    { 1803, 815, 0x198ade },
    { 1749, 973, 0x42c2ef },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 寻找一个不在舰队里的船
local function transColorListToString(tab)
  local tmp = {}
  for key = 1, #tab do
    local value = tab[key]
    value[3] = string.format('0x%06X', value[3])
    table.insert(tmp, table.concat(value, '|'))
  end
  return table.concat(tmp, ',')
end

local function transRelativePoint(tab, basePoint)
  local newTab = {}
  for key = 1, #tab do
    local value = tab[key]
    newTab[key] = { value[1] - basePoint[1], value[2] - basePoint[2], value[3] }
  end
  return newTab
end

local function transPointList(tab)
  local newTab = {}
  for key = 1, #tab do
    local value = tab[key]
    table.insert(newTab, { value.x, value.y })
  end
  return newTab
end

local function subtractionList(target, ...)
  local sources = { ... }
  local sourcesMap = {}
  local newTab = {}
  for key = 1, #sources do
    local source = sources[key]
    for key2 = 1, #source do
      local value = source[key2]
      sourcesMap[value[1] .. ',' .. value[2]] = value
    end
  end
  for key = 1, #target do
    local value = target[key]
    if (not sourcesMap[value[1] .. ',' .. value[2]]) then
      table.insert(newTab, value)
    end
  end
  return newTab
end

-- 寻找一个不在舰队里的船。
-- 先找到所有船的位置，再找到所有在舰队里船的位置，将两个数组相差
repair.findFirstShipNotInFleet = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end

  local result = false
  local leftTop = { 33, 182 }
  local rightBotton = { 1000, 800 }

  local point1 = { 33, 799, 0x425d7b }
  local posandcolorBase = transRelativePoint({
    { 34, 799, 0x00203a },
    { 40, 722, 0x002042 },
    { 40, 724, 0xb5babd },
  }, { point1[1], point1[2], })
  local thePointBase = transPointList(findMultiColorInRegionFuzzyExt(point1[3], transColorListToString(posandcolorBase), 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2]))

  local posandcolorFleet = transRelativePoint({
    { 34, 799, 0x00203a },
    { 40, 722, 0x002042 },
    { 40, 724, 0xb5babd },

    { 48, 231, 0xffffff },
    { 52, 208, 0x193542 },
    { 65, 222, 0x193942 },
    { 79, 207, 0x193942 },
    { 65, 193, 0x21394a },
    { 89, 192, 0xffffff },
  }, { point1[1], point1[2], })
  local thePointFleet = transPointList(findMultiColorInRegionFuzzyExt(point1[3], transColorListToString(posandcolorFleet), 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2]))
  local posandcolorFleetFlatShip = transRelativePoint({
    { 34, 799, 0x00203a },
    { 40, 722, 0x002042 },
    { 40, 724, 0xb5babd },

    { 48, 231, 0xf7d773 },
    { 52, 208, 0x845500 },
    { 65, 222, 0x7b5100 },
    { 79, 207, 0x845908 },
    { 65, 193, 0x8c6108 },
    { 89, 192, 0xfff3ad },
  }, { point1[1], point1[2], })
  local thePointFleetFlatShip = transPointList(findMultiColorInRegionFuzzyExt(point1[3], transColorListToString(posandcolorFleetFlatShip), 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2]))

  local resultList = subtractionList(thePointBase, thePointFleet, thePointFleetFlatShip)

  if (not __keepScreenState) then keepScreen(false) end
  if (#resultList > 0) then
    local result = resultList[1]
    return { result[1] + 132, 393 }
  end
  return nil
end

-- 点击第一艘船
repair.clickFirstShip = function()
  tap(151, 432, 100)
  return true
end

-- 点击一搜船
repair.clickAShip = function(point)
  tap(point[1], point[2], 100)
end

-- 滑动到下一页
repair.moveToNextPage = function()
  local point = {
    { 1477, 824, 0x3a516b },
    { 265, 814, 0xcecabd },
  }
  moveTo(point[1][1], point[1][2], point[2][1], point[2][2], 100)
end

-- 检测修理页面是否还需要滑动到下一页
repair.isNeedMoveToNextPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 1557, 278, 0x4a6984 },
    { 1544, 505, 0x426584 },
    { 1542, 781, 0x3a516b },
  }
  local result = not multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击返回港口
repair.clickSelectShipPageBackBtn = function()
  tap(1819, 974, 100)
end

-- 点击返回港口
repair.clickBackToHomeBtn = function()
  tap(100, 1015, 100)
  return true
end

return repair
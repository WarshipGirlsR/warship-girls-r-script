

do

do
local _ENV = _ENV
package.preload[ "lib/TableLib" ] = function( ... ) local arg = _G.arg;
-- table方法添加
local __tmp = (function()
  table.isArray = table.isArray or function(tab)
    if (type(tab) ~= "table") then
      return false
    end
    local length = #tab
    for k, v in pairs(tab) do
      if ((type(k) ~= "number") or (k > length)) then
        return false
      end
    end
    return true
  end

  table.every = table.every or function(tab)
    for k, v in ipairs(tab) do
      if (v == false) then
        return false
      end
    end
    return true
  end

  table.some = table.some or function(tab)
    for k, v in ipairs(tab) do
      if (v == true) then
        return true
      end
    end
    return false
  end

  table.push = table.push or function(tab, element)
    table.insert(tab, element)
    local length = #tab
    return length
  end

  table.pop = table.pop or function(tab)
    local length = #tab
    local res = tab[length]
    table.remove(tab, length)
    return res
  end

  table.shift = table.shift or function(tab)
    local res = tab[1]
    table.remove(tab, 1)
    return res
  end

  table.unshift = table.unshift or function(tab, element)
    table.insert(tab, 1, element)
    local length = #tab
    return length
  end

  table.first = table.first or function(tab)
    return tab[1]
  end

  table.last = table.last or function(tab)
    return tab[#tab]
  end

  table.slice = table.slice or function(tab, startIndex, endIndex)
    local length = #tab
    if ((type(endIndex) == "nil") or (endIndex == 0)) then
      endIndex = length
    end
    if (endIndex < 0) then
      endIndex = length + 1 + endIndex
    end
    local newTab = {}

    for i = startIndex, endIndex do
      table.insert(newTab, tab[i])
    end

    return newTab
  end

  table.join = table.join or function(tab, exp)
    if (type(exp) == "nil") then exp = "," end
    return table.concat(tab, exp)
  end

  table.merge = table.merge or function(tab, ...)
    arg = { ... }
    for k, tabelement in ipairs(arg) do
      local length = #tabelement
      for k2, value in ipairs(tabelement) do
        if ((type(k2) == "number") and (k2 <= length)) then
          table.insert(tab, value)
        end
      end
      for k2, value in pairs(tabelement) do
        if ((type(k2) == "number") and (k2 <= length)) then
        else
          tab[k2] = value
        end
      end
    end
    return tab
  end

  table.values = table.values or function(tab)
    local values = {}
    for k, v in pairs(tab) do
      table.insert(values, v)
    end
    return values
  end

  table.keys = table.keys or function(tab)
    local keys = {}
    for k in pairs(tab) do
      table.insert(keys, k)
    end
    return keys
  end

  -- 将每一组键值对变成数组，再放入一个大数组中返回
  table.entries = table.entries or function(tab)
    local ent = {}
    for k, v in ipairs(tab) do
      table.insert(ent, { k, v })
    end
    return ent
  end

  -- 对key排序后放入数组中再返回，结果类似entries
  table.sortByKey = table.sortByKey or function(tab, call)
    local keys = table.keys(tab)
    if (type(call) == "function") then
      table.sort(keys, call)
    else
      table.sort(keys)
    end
    local newTable = {}
    for _, key in ipairs(keys) do
      table.insert(newTable, { key, tab[key] })
    end
    return newTable
  end

  table.toString = table.toString or function(tab, space)
    if ((type(tab) == "function")) then
      return "[function]"
    end
    if ((type(tab) == "number") or (type(tab) == "string")) then
      return "" .. tab
    end
    if (type(tab) == "boolean") then
      return tab and "true" or "false"
    end
    if (type(tab) == "nil") then
      return "no message"
    end
    if (type(tab) ~= "table") then
      return "[" .. type(tab) .. "]"
    end
    if (type(space) ~= "string") then
      space = ""
    end
    local newTab = {}
    local childSpace = space .. "  "
    for k, v in pairs(tab) do
      table.insert(newTab, childSpace .. k .. ": " .. table.toString(v, childSpace))
    end
    return "{\n" .. table.concat(newTab, ", \n") .. " \n" .. space .. "}"
  end

  table.toJsString = table.toJsString or function(tab, other, space)
    if ((type(tab) == "function")) then
      return "[function]"
    end
    if ((type(tab) == "number") or (type(tab) == "string")) then
      return "" .. tab
    end
    if (type(tab) == "boolean") then
      return tab and "true" or "false"
    end
    if (type(tab) == "nil") then
      return "no message"
    end
    if (type(tab) ~= "table") then
      return "[" .. type(tab) .. "]"
    end
    if (type(space) ~= "string") then
      space = ""
    end
    local isArray = table.isArray(tab)
    local newTab = {}
    local childSpace = space .. "  "
    if (isArray) then
      for k, v in ipairs(tab) do
        table.insert(newTab, table.toJsString(v, other, childSpace))
      end
      local childStr = table.concat(newTab, ", ")

      if (string.len(childStr) > 50) then
        newTab = {}
        for k, v in ipairs(tab) do
          table.insert(newTab, childSpace .. table.toJsString(v, other, childSpace))
        end
        childStr = table.concat(newTab, ", \n")
        return "[\n" .. childStr .. " \n" .. childSpace .. "]"
      end

      return space .. "[" .. childStr .. "]"
    else
      for k, v in pairs(tab) do
        if ((other == true) or (type(v) ~= "function")) then
          table.insert(newTab, childSpace .. k .. ": " .. table.toJsString(v, childSpace))
        end
      end
      return "{\n" .. table.concat(newTab, ", \n") .. " \n" .. space .. "}"
    end
  end
end)()
end
end

do
local _ENV = _ENV
package.preload[ "src/BaseOperate" ] = function( ... ) local arg = _G.arg;
-- 原子操作列表
return function()
  local map = {
    -- 主页
    home = {},
    -- 出征
    battle = {},

    -- 任务
    mission = {},

    -- 远征
    expedition = {},

    -- 修理
    repair = {},

    -- 演习
    exercise = {},
  }

  -- 检测主页
  map.home.isHome = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 18, 63, 0x10699c },
      { 58, 65, 0x1071a4 },
      { 120, 45, 0x10699c },
      { 81, 85, 0xcecece },
      { 1855, 64, 0xb54d00 },
      { 1651, 1027, 0xcecece },
      { 1435, 443, 0xbd4d00 },
      { 1132, 532, 0x3abee6 },
      { 1749, 531, 0x3ac2e6 },
      { 1430, 862, 0x0092c5 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 等待弹出勋章对话框
  map.home.isMedalModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 905, 276, 0x105d94 },
      { 512, 378, 0xd6cabd },
      { 1405, 400, 0xd6cabd },
      { 1400, 708, 0xc5b6a4 },
      { 521, 720, 0xc5b69c },
      { 743, 745, 0x0092c5 },
      { 1173, 749, 0xad1808 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击勋章取消
  map.home.clickMedalModalCancelBtn = function()
    tap(1169, 720, 100)
  end
  -- -- 出征流程
  -- 是否在主页


  -- 点击出征
  map.home.clickBattleBtn = function()
    tap(1440, 347, 100)
    return true
  end

  --  是否在出征界面
  map.battle.isBattlePage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 174, 629, 0x105573 },
      { 185, 726, 0x10597b },
      { 134, 995, 0xffffff },
      { 94, 961, 0xad7d42 },
      { 246, 285, 0x6b6963 },
      { 259, 570, 0x736963 },
      { 260, 798, 0x6b6963 },
      { 270, 995, 0x6b615a },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击回港
  map.battle.clickBackToHomeBtn = function()
    tap(98, 1016, 100)
    return true
  end

  -- 出征页面
  map.battle.battle = {}

  --  是否在出征的出征界面
  map.battle.battle.isBattlePage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 174, 629, 0x105573 },
      { 185, 726, 0x10597b },
      { 134, 995, 0xffffff },
      { 94, 961, 0xad7d42 },
      { 246, 285, 0x6b6963 },
      { 259, 570, 0x736963 },
      { 260, 798, 0x6b6963 },
      { 270, 995, 0x6b615a },
      { 114, 149, 0xad4900 },
      { 110, 285, 0x008ebd },
      { 108, 431, 0x008ebd },
      { 105, 576, 0x008abd },
      { 1021, 120, 0x10598c },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击出征
  map.battle.battle.clickBattleBtn = function()
    tap(101, 110, 100)
    return true
  end

  -- 移动到m-n章节
  map.battle.battle.moveToChapter = function(chapter)
    local chapterArr = strSplit(chapter, "-")
    local m = tonumber(chapterArr[1]) or 1
    local n = tonumber(chapterArr[2]) or 1
    -- 先移到第一章
    for i = 1, 8 do
      tap(360, 958, 100)
      mSleep(200)
    end
    -- 再移到第m章
    for i = 2, m do
      tap(1827, 961, 100)
      mSleep(200)
    end
    -- 先移到第一节
    for i = 1, 8 do
      tap(256, 493, 100)
      mSleep(200)
    end
    -- 再移到第n章
    for i = 2, n do
      tap(1889, 485, 100)
      mSleep(200)
    end
    return true
  end

  -- 点击准备出征
  map.battle.battle.clickReadyBattleBtn = function()
    tap(1061, 523, 100)
  end

  -- 等待出征准备界面
  map.battle.battle.isReadyBattlePage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 68, 247, 0xbdb69c },
      { 73, 825, 0xc5baa4 },
      { 498, 721, 0xcecabd },
      { 1576, 711, 0xcecabd },
      { 1570, 803, 0xbdb69c },
      { 1834, 379, 0xd6a631 },
      { 1803, 698, 0xd6a229 },
      { 1004, 177, 0x7b756b },
      { 1365, 912, 0x63615a },
      { 557, 913, 0x635d5a },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击选择舰队
  map.battle.battle.selectFleet = function(fleet)
    if (fleet == 1) then
      tap(707, 711, 100)
    elseif (fleet == 2) then
      tap(903, 725, 100)
    elseif (fleet == 3) then
      tap(1092, 723, 100)
    elseif (fleet == 4) then
      tap(1282, 724, 100)
    end
    return true
  end

  -- 检测所有状态正常
  map.battle.battle.isReadyBattlePageShipStatusAllRignt = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 477, 802, 0xbdb69c },
      { 490, 802, 0xc5b6a4 },
      { 514, 802, 0xc5b6a4 },
      { 541, 802, 0xbdb69c },
      { 566, 802, 0xc5b6a4 },
      { 594, 802, 0xc5b6a4 },
      { 622, 802, 0xc5b6a4 },
      { 649, 802, 0xbdb69c },
      { 674, 802, 0xc5b6a4 },
      { 706, 802, 0xc5b6a4 },
    }
    local result = multiColorS(list, 60)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 检测hp是否安全
  map.battle.battle.isReadyBattlePageShipHPSafe = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 634, 631, 0x085994 },
      { 829, 631, 0x105d94 },
      { 1029, 631, 0x105d94 },
      { 1229, 631, 0x105d94 },
      { 1419, 631, 0x105d94 },
      { 1619, 631, 0x105d94 },
    }
    local list2 = {
      { 565, 600, 0x31db31 },
      { 762, 600, 0x31db31 },
      { 959, 600, 0x31db31 },
      { 1156, 600, 0x3adb31 },
      { 1353, 600, 0x31db31 },
      { 1549, 600, 0x31db31 },
    }
    local result = true
    for i = 1, #list do
      local theList = table.merge({}, list[i], { 80 })
      local theList2 = table.merge({}, list2[i], { 80 })
      if (isColor(table.unpack(theList)) and (not isColor(table.unpack(theList2)))) then
        result = false
        break
      end
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 不满血，返回出征
  map.battle.battle.clickReadyBattlePageBackBtn = function()
    tap(1814, 974, 100)
  end

  -- 点击快速补给
  map.battle.battle.clickReadyBattlePageQuickSupplyBtn = function()
    tap(1812, 109, 100)
  end

  -- 等待快速补给界面
  map.battle.battle.isQuickSupplyModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 1817, 483, 0x423510 },
      { 1292, 224, 0xd6cac5 },
      { 315, 835, 0xd6cec5 },
      { 842, 189, 0x004d84 },
      { 1785, 541, 0x423510 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击快速补给
  map.battle.battle.clickReadyBattlePageQuickSupplyModalOkBtn = function()
    tap(1269, 785, 100)
  end

  -- 点击快速修理
  map.battle.battle.clickQuickRepairBtn = function()
    tap(1813, 252, 100)
  end

  -- 等待快速修理界面
  map.battle.battle.isQuickRepairModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 1817, 483, 0x423510 },
      { 1292, 224, 0xd6cac5 },
      { 315, 835, 0xd6cec5 },
      { 842, 189, 0x004d84 },
      { 1785, 541, 0x423510 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击快速修理
  map.battle.battle.clickQuickRepairModalOkBtn = function()
    tap(1269, 785, 100)
  end

  -- 点击快速补给关闭
  map.battle.battle.clickQuickSupplyModalCloseBtn = function()
    tap(1473, 195, 100)
  end

  -- 点击快速修理关闭
  map.battle.battle.clickQuickRepairModalCloseBtn = map.battle.battle.clickQuickSupplyModalCloseBtn

  -- 检测舰队可以出征
  map.battle.battle.isFleetsCanBattle = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 781, 999, 0xfff3e6 },
      { 968, 971, 0xfff7ef },
      { 1017, 971, 0xfffbf7 },
      { 1083, 990, 0xfff7ef },
    }
    local result = not multiColorS(list, 70)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击出征开始
  map.battle.battle.clickBattleStartBtn = function()
    tap(956, 987, 100)
  end

  -- 等待额外获得资源面板
  map.battle.battle.isExtraReceiveModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 491, 298, 0x087dbd },
      { 1473, 327, 0xd6cec5 },
      { 1090, 319, 0x0869a4 },
      { 1469, 771, 0xc5baa4 },
      { 455, 766, 0xc5b69c },
      { 956, 748, 0x008ebd },
      { 962, 655, 0xbdb69c },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击额外获得确定
  map.battle.battle.clickExtraReceiveModalOk = function()
    tap(957, 715, 100)
  end

  -- 等待快开始战斗界面
  map.battle.battle.isBattleStartPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 92, 210, 0xd6cabd },
      { 931, 211, 0xd6cec5 },
      { 1824, 226, 0xd6cabd },
      { 84, 981, 0xcecabd },
      { 909, 994, 0xcecabd },
      { 1820, 993, 0xcecabd },
      { 1205, 942, 0xb54900 },
      { 1427, 951, 0xad4d08 },
      { 1180, 512, 0xd6cac5 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end


  -- 点击开始战斗
  map.battle.battle.clickBattleStartModalStartBtn = function()
    tap(1327, 919, 100)
  end

  -- 等待阵型界面
  map.battle.battle.isFormationPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 771, 787, 0xffffff },
      { 1408, 880, 0x085994 },
      { 1537, 679, 0x085994 },
      { 1617, 487, 0x085d94 },
      { 1542, 293, 0x005994 },
      { 1410, 84, 0x005d9c },
      { 1520, 140, 0x7be794 },
      { 1638, 343, 0x6bdf84 },
      { 1706, 540, 0x73df8c },
      { 1631, 737, 0x6bd27b },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击阵型
  map.battle.battle.clickFormationPageStartBtn = function()
    tap(1685, 344, 100)
  end

  -- 等待追击页面
  map.battle.battle.isPursueModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 802, 338, 0x081c21 },
      { 629, 716, 0xe6813a },
      { 1274, 714, 0x42caf7 },
      { 1346, 759, 0xc5cac5 },
      { 570, 756, 0xcecace },
      { 615, 578, 0xadb652 },
      { 632, 520, 0xf7d2ad },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击追击
  map.battle.battle.clickPursueModalOk = function()
    tap(726, 746, 100)
  end

  -- 点击放弃
  map.battle.battle.clickPursuePageCancel = function()
    tap(1178, 754, 100)
  end

  -- 等待胜利界面
  map.battle.battle.isVictoryPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 158, 37, 0x085184 },
      { 66, 451, 0x31456b },
      { 53, 848, 0x314563 },
      { 1074, 890, 0x103552 },
      { 1073, 541, 0x193d5a },
      { 1446, 26, 0x3a5173 },
      { 1812, 532, 0x082d4a },
      { 1436, 1000, 0x1986b5 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 胜利界面检测船是否受损
  map.battle.battle.isVictoryPageShipDamaged = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 682, 246, 0xc5b6a4 },
      { 682, 390, 0xc5b6a4 },
      { 682, 530, 0xc5b6a4 },
      { 682, 674, 0xc5b6a4 },
      { 682, 810, 0xc5b6a4 },
      { 682, 950, 0xc5b6a4 },
    }
    local list2 = {
      { 697, 325, 0x5af752 },
      { 697, 465, 0x5af752 },
      { 697, 606, 0x52f34a },
      { 697, 747, 0x5af752 },
      { 697, 887, 0x5af752 },
      { 697, 1028, 0x52f34a },
    }
    local result = false
    for i = 1, #list do
      if ((isColor(table.unpack(list[i]))) and (not isColor(table.unpack(list2[i])))) then
        result = true
        break
      end
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 胜利界面检测船HP是否安全
  map.battle.battle.isVictoryPageShipHPSafe = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 682, 246, 0xc5b6a4 },
      { 682, 390, 0xc5b6a4 },
      { 682, 530, 0xc5b6a4 },
      { 682, 674, 0xc5b6a4 },
      { 682, 810, 0xc5b6a4 },
      { 682, 950, 0xc5b6a4 },
    }
    local list2 = {
      { 621, 325, 0x31db31 },
      { 621, 465, 0x31db31 },
      { 621, 606, 0x31d729 },
      { 621, 747, 0x31db31 },
      { 621, 887, 0x31db31 },
      { 621, 1028, 0x31d729 },
    }
    local result = true
    for i = 1, #list do
      if ((isColor(table.unpack(list[i]))) and (not isColor(table.unpack(list2[i])))) then
        result = false
        break
      end
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击胜利继续
  map.battle.battle.clickVictoryPageContinueBtn = function()
    tap(1650, 1020, 100)
  end

  -- 等待胜利继续面板
  map.battle.battle.isVictoryPage2 = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 1645, 955, 0x4ad2f7 },
      { 1824, 953, 0x42ceef },
      { 1820, 1029, 0x008abd },
      { 1640, 1028, 0x008ebd },
      { 956, 155, 0x085994 },
      { 839, 228, 0x085994 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end


  -- 点击胜利继续2
  map.battle.battle.clickVictoryPageContinueBtn2 = function()
    tap(1730, 993, 100)
  end

  -- 等待大破警告
  map.battle.battle.isShipSevereDamageModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 562, 289, 0xc5cac5 },
      { 550, 682, 0x083942 },
      { 1368, 681, 0x08353a },
      { 1063, 304, 0x001c19 },
      { 834, 771, 0xc51400 },
      { 1083, 774, 0x0092c5 },
      { 586, 336, 0xff2800 },
      { 725, 339, 0xff2800 },
      { 872, 354, 0xff2800 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 大破警告框点击回港
  map.battle.battle.clickShipSevereDamageModalBack = function()
    tap(1182, 753, 100)
  end

  -- 等待无法前进警告框
  map.battle.battle.isShipCantGoOnModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 1072, 281, 0x0081c5 },
      { 1636, 286, 0x0069ad },
      { 1815, 337, 0xd6cec5 },
      { 1811, 615, 0xd6cec5 },
      { 1069, 612, 0xd6cabd },
      { 1434, 507, 0xcecabd },
      { 1302, 790, 0x42cef7 },
      { 1544, 861, 0x008abd },
      { 1490, 824, 0xffffff },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 受损过重警告框点击回港
  map.battle.battle.clickShipCantGoOnModalBackBtn = function()
    tap(1449, 825, 100)
  end

  -- 等待新船
  map.battle.battle.isNewShipPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 110, 865, 0xadaaad },
      { 114, 984, 0xcecace },
      { 582, 1013, 0x00558c },
      { 1386, 1012, 0x085994 },
      { 1768, 964, 0x085994 },
      { 1803, 951, 0xcecece },
      { 1844, 949, 0x5a5d5a },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击新船
  map.battle.battle.clickNewShip = function()
    tap(972, 399, 100)
  end

  -- 等待新船锁定对话框
  map.battle.battle.isNewShipPageLockModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 839, 293, 0x1065a4 },
      { 1412, 296, 0xd6cac5 },
      { 503, 337, 0xd6cec5 },
      { 521, 772, 0xc5b69c },
      { 1396, 771, 0xbdb69c },
      { 743, 747, 0x0092c5 },
      { 1172, 745, 0xa41400 },
      { 959, 519, 0xd6cec5 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 船锁定对话框点击确认
  map.battle.battle.clickNewShipPageLockModalOkBtn = function()
    tap(741, 713, 100)
  end

  -- 等待前进对话框
  map.battle.battle.isNextLevelStepModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 578, 279, 0xc5cac5 },
      { 1081, 313, 0x081c21 },
      { 758, 341, 0x001819 },
      { 1176, 440, 0x10595a },
      { 953, 709, 0x103942 },
      { 827, 779, 0xb54d08 },
      { 1087, 785, 0x0092c5 },
      { 616, 576, 0xa4ae52 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 等待前进点击前进
  map.battle.battle.clickLevelStepModalContinueBtn = function()
    tap(727, 751, 100)
  end

  -- 等待前进点击回港
  map.battle.battle.clickLevelStepModalBackBtn = function()
    tap(1181, 748, 100)
  end

  -- -- 出征流程

  -- -- 任务流程

  -- 是否有没领取的任务
  map.mission.isUnreceivedMission = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 888, 970, 0xc51800 },
      { 924, 978, 0xc50800 },
      { 905, 961, 0xdec242 },
      { 675, 989, 0x4acef7 },
      { 760, 987, 0x42ceef },
      { 760, 1050, 0x008ebd },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击任务按钮
  map.mission.clickMission = function()
    tap(785, 1016, 100)
  end

  -- 等待任务界面
  map.mission.isMission = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 30, 35, 0x08456b },
      { 179, 39, 0x105584 },
      { 180, 761, 0x08557b },
      { 255, 259, 0x5a7194 },
      { 1869, 526, 0x42617b },
      { 1635, 190, 0xd6cabd },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击全部任务按钮
  map.missionClickAllMission = function()
    tap(785, 1016, 100)
  end

  -- 等待全部任务界面
  map.mission.isMissionAllMission = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 30, 35, 0x08456b },
      { 179, 39, 0x105584 },
      { 180, 761, 0x08557b },
      { 255, 259, 0x5a7194 },
      { 1869, 526, 0x42617b },
      { 1635, 190, 0xd6cabd },
      { 102, 150, 0xad4908 },
      { 102, 292, 0x008ebd },
      { 104, 435, 0x008abd },
      { 103, 571, 0x0092c5 },
      { 104, 711, 0x008ebd },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 检测全部任务界面是否有未领取的奖励
  map.mission.isMissionUnreceivedReward = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 288, 49, 0xcecabd },
      { 290, 208, 0xd6cabd },
      { 1824, 62, 0xc5b69c },
      { 1676, 172, 0xef863a },
      { 1673, 210, 0xad4900 },
      { 1824, 186, 0xde7521 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击领取第一个奖励
  map.mission.clickGetFirstReward = function()
    tap(1755, 190, 100)
  end

  -- 等待获得面板
  map.mission.isRewardPannel = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 487, 286, 0x0879bd },
      { 1086, 277, 0x0061a4 },
      { 463, 355, 0xd6cec5 },
      { 1454, 329, 0xcecabd },
      { 469, 753, 0xc5baa4 },
      { 1436, 755, 0xbdb69c },
      { 874, 733, 0x0092bd },
      { 1032, 727, 0x0096c5 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击获得面板确定
  map.mission.clickRewardPannelOk = function()
    tap(955, 717, 100)
  end

  -- 点击任务面板的返回港口
  map.mission.clickBackToHome = function()
    tap(136, 986, 100)
  end

  -- -- 任务流程


  -- -- 远征流程
  -- 检测有远征完成
  map.expedition.isExpeditionCompleted = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 1374, 135, 0xffffff },
      { 1609, 134, 0xffffff },
      { 1597, 208, 0xffffff },
      { 1390, 209, 0xffffff },
      { 1478, 173, 0xc52008 },
      { 1564, 165, 0xc52408 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击出征
  map.expedition.clickBattle = map.home.clickBattleBtn

  -- 检测在出征界面
  map.expedition.isBattle = map.battle.isBattlePage

  -- 点击远征
  map.expedition.clickExpedition = function()
    tap(108, 394, 100)
    return true
  end

  -- 检测在出征远征界面
  map.expedition.isBattleExpedition = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 178, 622, 0x10597b },
      { 265, 424, 0x6b6963 },
      { 224, 613, 0xc5cac5 },
      { 110, 148, 0x008ebd },
      { 111, 290, 0x008ebd },
      { 107, 429, 0xb54d08 },
      { 111, 572, 0x008ebd },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 从第m章移动到第n章
  map.expedition.moveToChapter = function(n, m)
    n = tonumber(n) or 1
    if (type(m) == "nil") then
      -- 先移动到第1章
      for i = 1, 7 do
        tap(358, 962, 100)
        mSleep(200)
      end
      -- 再移动到第n章
      for i = 2, n do
        tap(1835, 963, 100)
        mSleep(200)
      end
    else
      m = tonumber(m) or 1
      local diff = n - m
      -- 移动到第n章
      if (diff > 0) then
        -- 右移
        for i = 1, diff do
          tap(1835, 963, 100)
          mSleep(200)
        end
      elseif (diff < 0) then
        -- 左移
        for i = 1, (0 - diff) do
          tap(358, 962, 100)
          mSleep(200)
        end
      end
    end
    return true
  end

  -- 检测本页有收获奖励，同时获取哪条有奖励
  map.expedition.isThisExpeditionPageHasReward = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list1 = {
      { 821, 77, 0x9c5921 },
      { 1539, 149, 0xb54d08 },
    }
    local list2 = {
      { 821, 297, 0x9c5921 },
      { 1539, 369, 0xb54d08 },
    }
    local list3 = {
      { 821, 517, 0x9c5921 },
      { 1539, 589, 0xb54d08 },
    }
    local list4 = {
      { 821, 747, 0x9c5921 },
      { 1539, 819, 0xbd4d08 },
    }
    mSleep(50)
    local result1 = multiColorS(list1)
    mSleep(50)
    local result2 = multiColorS(list2)
    mSleep(50)
    local result3 = multiColorS(list3)
    mSleep(50)
    local result4 = multiColorS(list4)
    local result = false;
    if (result1 or result2 or result3 or result4) then
      result = true
    end
    local hasTable = {}
    if (result1) then table.insert(hasTable, 1) end
    if (result2) then table.insert(hasTable, 2) end
    if (result3) then table.insert(hasTable, 3) end
    if (result4) then table.insert(hasTable, 4) end
    if (not __keepScreenState) then keepScreen(false) end
    return result, hasTable;
  end

  -- 点击第n个按钮
  map.expedition.clickExpeditionBtn = function(n)
    n = tonumber(n) or 1
    if (n == 1) then
      tap(1668, 123, 100)
    elseif (n == 2) then
      tap(1674, 351, 100)
    elseif (n == 3) then
      tap(1675, 576, 100)
    elseif (n == 4) then
      tap(1676, 801, 100)
    end
    return true;
  end

  -- 检测在远征完成界面
  map.expedition.isExpeditionCompletedPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 919, 225, 0x085994 },
      { 1139, 44, 0x08558c },
      { 1072, 895, 0x082d4a },
      { 1696, 876, 0x298aad },
      { 1464, 374, 0xffffff },
      { 987, 589, 0x52698c },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击继续
  map.expedition.clickRewardPannelOk = function()
    tap(1644, 1022, 100)
    return true
  end

  -- 检测在远征准备界面
  map.expedition.isExpeditionPrepare = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 76, 822, 0xc5b69c },
      { 1628, 822, 0xc5b69c },
      { 1643, 247, 0xded2ce },
      { 71, 249, 0xc5baa4 },
      { 1610, 733, 0xcecabd },
      { 538, 706, 0xd6cac5 },
      { 1813, 416, 0xd6a631 },
      { 1792, 676, 0xd6a229 },
      { 1266, 91, 0xc5cac5 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 检测第n章能否远征
  map.expedition.isChapterCanExpedition = function(n)
    n = tonumber(n) or 1
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {}
    if (n == 1) then
      list = {
        { 821, 77, 0x0071b5 },
        { 1539, 149, 0x0092c5 },
      }
    elseif (n == 2) then
      list = {
        { 821, 297, 0x0071b5 },
        { 1539, 369, 0x0096c5 },
      }
    elseif (n == 3) then
      list = {
        { 821, 517, 0x0071b5 },
        { 1539, 589, 0x009ac5 },
      }
    elseif (n == 4) then
      list = {
        { 821, 747, 0x0071bd },
        { 1539, 819, 0x0096c5 },
      }
    end
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 选择舰队
  map.expedition.clickSelectFleet = map.battle.battle.selectFleet

  -- 检测所有状态正常
  map.expedition.isReadyExpeditionShipStatus = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 480, 802, 0xc5b69c },
      { 500, 802, 0xc5b69c },
      { 520, 802, 0xc5b69c },
      { 540, 802, 0xc5b69c },
      { 560, 802, 0xc5b69c },
      { 580, 802, 0xc5b69c },
      { 600, 802, 0xc5b69c },
      { 620, 802, 0xc5b69c },
      { 640, 802, 0xc5b69c },
    }
    local result = multiColorS(list, 60)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击快速补给
  map.expedition.clickQuickSupply = map.battle.battle.clickReadyBattlePageQuickSupplyBtn

  -- 检测快速补给界面
  map.expeditionIsQuickSupply = map.battle.battle.isQuickSupplyModal

  -- 点击快速补给确定
  map.expedition.clickQuickSupplyDo = map.battle.battle.clickReadyBattlePageQuickSupplyModalOkBtn

  -- 点击快速维修
  map.expedition.clickQuickRepair = map.battle.battle.clickQuickRepairBtn

  -- 等待快速维修界面
  map.expedition.isQuickRepair = map.battle.battle.isQuickRepairModal

  -- 点击快速维修确定
  map.expedition.clickQuickRepairDo = map.battle.battle.clickQuickRepairModalOkBtn

  -- 检测舰队可以远征
  map.expedition.isCanExpedition = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 810, 971, 0xfff7ef },
      { 913, 971, 0xfffbf7 },
      { 988, 973, 0xfff7ef },
      { 1071, 979, 0xfffbf7 },
    }
    local result = not multiColorS(list, 70)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击返回远征界面
  map.expedition.clickBackToExpeditionPrepare = function()
    tap(1812, 974, 100)
    return true
  end

  -- 点击远征开始
  map.expedition.clickBattleStart = map.battle.battle.clickBattleStartBtn

  -- 点击返回港口
  map.expedition.clickBackToHome = function()
    tap(101, 1015, 100)
    return true
  end

  -- -- 远征流程


  -- -- 修理流程

  -- 点击船坞按钮
  map.repair.clickDockBtn = function()
    tap(1442, 743, 100)
    return true
  end

  -- 检测船坞界面
  map.repair.isDockPage = function()
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
  map.repair.clickRepairBtn = function()
    tap(101, 253, 100)
    return true
  end

  -- 检测修理界面
  map.repair.isRepairPage = function()
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
  map.repair.hasEmptyRepairSlot = function()
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

    mSleep(50)
    local result1 = multiColorS(list1)
    mSleep(50)
    local result2 = multiColorS(list2)
    mSleep(50)
    local result3 = multiColorS(list3)
    mSleep(50)
    local result4 = multiColorS(list4)
    local result = false;
    if (result1 or result2 or result3 or result4) then
      result = true
    end
    local hasTable = {}
    if (result1) then table.insert(hasTable, 1) end
    if (result2) then table.insert(hasTable, 2) end
    if (result3) then table.insert(hasTable, 3) end
    if (result4) then table.insert(hasTable, 4) end
    if (not __keepScreenState) then keepScreen(false) end
    return result, hasTable;
  end

  -- 检测第n个修理槽位可用
  map.repair.isSlotEmpty = function(n)
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
  map.repair.isSlotNotEmpty = function(n)
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
  map.repair.clickRepairSlotBtn = function(n)
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
  map.repair.isSelectShipPage = function()
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

  -- 点击第一艘船
  map.repair.clickFirstShip = function()
    tap(151, 432, 100)
    return true
  end

  -- 点击返回港口
  map.repair.clickBackToHomeBtn = function()
    tap(100, 1015, 100)
    return true
  end

  -- 修理流程

  -- 演习流程

  -- 是否在出征页面
  map.exercise.isBattlePage = map.battle.isBattlePage

  -- 点击演习
  map.exercise.clickExerciseBtn = function()
    tap(103, 252, 100)
    return true
  end

  --  检测演习界面
  map.exercise.isExercisePage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 29, 625, 0x10496b },
      { 177, 665, 0x195984 },
      { 114, 964, 0xad8152 },
      { 223, 512, 0xcecace },
      { 111, 153, 0x008ec5 },
      { 109, 289, 0xb54d08 },
      { 107, 433, 0x008ec5 },
      { 107, 569, 0x0092c5 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  --  检测是否有演习
  map.exercise.isExercisePageHaveExercise = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 1799, 186, 0xc55100 },
      { 1799, 362, 0xc55100 },
      { 1799, 538, 0xc55100 },
      { 1799, 714, 0xc55100 },
      { 1799, 890, 0xc55100 },
    }
    local result = false
    local resList = {}
    for i, item in ipairs(list) do
      if (isColor(table.unpack(item))) then
        table.insert(resList, i)
        result = true
      end
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result, resList
  end

  --  点击第n个演习
  map.exercise.clickToNExerciseBtn = function(n)
    if (n == 1) then
      tap(1799, 186, 100)
    elseif (n == 2) then
      tap(1799, 362, 100)
    elseif (n == 3) then
      tap(1799, 538, 100)
    elseif (n == 4) then
      tap(1799, 714, 100)
    elseif (n == 5) then
      tap(1799, 890, 100)
    end
    return true
  end

  -- 等待出征准备界面
  map.exercise.isReadyBattlePage = map.battle.battle.isReadyBattlePage

  -- 点击选择舰队
  map.exercise.selectFleet = map.battle.battle.selectFleet

  -- 检测所有状态正常
  map.exercise.isReadyBattlePageShipStatusAllRignt = map.battle.battle.isReadyBattlePageShipStatusAllRignt

  -- 检测hp是否安全
  map.exercise.isReadyBattlePageShipHPSafe = map.battle.battle.isReadyBattlePageShipHPSafe

  -- 不满血，返回出征
  map.exercise.clickReadyBattlePageBackBtn = map.battle.battle.clickReadyBattlePageBackBtn

  -- 点击快速补给
  map.exercise.clickReadyBattlePageQuickSupplyBtn = map.battle.battle.clickReadyBattlePageQuickSupplyBtn

  -- 等待快速补给界面
  map.exercise.isQuickSupplyModal = map.battle.battle.isQuickSupplyModal

  -- 点击快速补给
  map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn = map.battle.battle.clickReadyBattlePageQuickSupplyModalOkBtn

  -- 点击快速修理
  map.exercise.clickQuickRepairBtn = map.battle.battle.clickQuickRepairBtn

  -- 等待快速修理界面
  map.exercise.isQuickRepairModal = map.battle.battle.isQuickRepairModal

  -- 点击快速修理
  map.exercise.clickQuickRepairModalOkBtn = map.battle.battle.clickQuickRepairModalOkBtn

  -- 点击快速补给关闭
  map.exercise.clickQuickSupplyModalCloseBtn = map.battle.battle.clickQuickSupplyModalCloseBtn

  -- 点击快速修理关闭
  map.exercise.clickQuickSupplyModalCloseBtn = map.battle.battle.clickQuickSupplyModalCloseBtn

  -- 检测舰队可以出征
  map.exercise.isFleetsCanBattle = map.battle.battle.isFleetsCanBattle

  -- 点击出征开始
  map.exercise.clickBattleStartBtn = map.battle.battle.clickBattleStartBtn

  -- 等待额外获得资源面板
  map.exercise.isExtraReceiveModal = map.battle.battle.isExtraReceiveModal

  -- 点击额外获得确定
  map.exercise.clickExtraReceiveModalOk = map.battle.battle.clickExtraReceiveModalOk

  -- 等待快开始战斗界面
  map.exercise.isBattleStartPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 81, 146, 0xcecabd },
      { 1836, 147, 0xcec6bd },
      { 1837, 928, 0xd6cabd },
      { 74, 931, 0xcecabd },
      { 1327, 891, 0xad4d08 },
      { 1116, 481, 0xcec6bd },
      { 153, 577, 0xd6cec5 },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end


  -- 点击开始战斗
  map.exercise.clickBattleStartModalStartBtn = function()
    tap(1326, 862, 100)
    return true
  end

  -- 等待阵型界面
  map.exercise.isFormationPage = map.battle.battle.isFormationPage

  -- 点击阵型
  map.exercise.clickFormationPageStartBtn = map.battle.battle.clickFormationPageStartBtn

  -- 等待追击页面
  map.exercise.isPursueModal = map.battle.battle.isPursueModal

  -- 点击追击
  map.exercise.clickPursueModalOk = map.battle.battle.clickPursueModalOk

  -- 点击放弃
  map.exercise.clickPursuePageCancel = map.battle.battle.clickPursuePageCancel

  -- 等待胜利界面
  map.exercise.isVictoryPage = map.battle.battle.isVictoryPage

  -- 胜利界面检测船是否受损
  map.exercise.isVictoryPageShipDamaged = map.battle.battle.isVictoryPageShipDamaged

  -- 胜利界面检测船HP是否安全
  map.exercise.isVictoryPageShipHPSafe = map.battle.battle.isVictoryPageShipHPSafe

  -- 点击胜利继续
  map.exercise.clickVictoryPageContinueBtn = map.battle.battle.clickVictoryPageContinueBtn

  -- 等待胜利继续面板
  map.exercise.isVictoryPage2 = map.battle.battle.isVictoryPage2

  -- 点击胜利继续2
  map.exercise.clickVictoryPageContinueBtn2 = map.battle.battle.clickVictoryPageContinueBtn2

  -- 检测胜利对手详情页面
  map.exercise.isVictoryOpponentDetailPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 185, 218, 0x0881bd },
      { 137, 863, 0xcecac5 },
      { 1772, 867, 0xc5c6b5 },
      { 1741, 243, 0xd6cec5 },
      { 1495, 837, 0xb54d08 },
      { 298, 204, 0xffffff },
      { 372, 204, 0xefefef },
      { 441, 208, 0xffffff },
    }
    local result = multiColorS(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击关闭挑战
  map.exercise.clickVictoryOpponentDetailPageClose = function()
    tap(1803, 217, 100)
    return true
  end

  -- 返回home
  map.exercise.clickBackToHomeBtn = map.battle.clickBackToHomeBtn

  -- 演习流程
  return map
end
end
end

do
local _ENV = _ENV
package.preload[ "src/Co_min" ] = function( ... ) local arg = _G.arg;


do

do
local _ENV = _ENV
package.preload[ "lib/Promise" ] = function( ... ) local arg = _G.arg;
-----------------------------------------------------------------------------
-- ES6 Promise in lua v1.1
-- Author: aimingoo@wandoujia.com
-- Copyright (c) 2015.11
--
-- The promise module from NGX_4C architecture
-- 1) N4C is programming framework.
-- 2) N4C = a Controllable & Computable Communication Cluster architectur.
--
-- Promise module, ES6 Promises full supported. @see:
-- 1) https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise
-- 2) http://liubin.github.io/promises-book/#ch2-promise-resolve
--
-- Usage:
-- promise = Promise.new(executor)
-- promise:andThen(onFulfilled1):andThen(onFulfilled2, onRejected2)
--
-- History:
-- 2015.10.29	release v1.1, fix some bugs and update testcases
-- 2015.08.10	release v1.0.1, full testcases, minor fix and publish on github
-- 2015.03		release v1.0.0
-----------------------------------------------------------------------------

local Promise, promise = {}, {}

-- andThen replacer
--  1) replace standard .then() when promised
local PENDING = {}
local nil_promise = {}

local function promised(value, action)
  local ok, result = pcall(action, value)
  return ok and Promise.resolve(result) or Promise.reject(result) -- .. '.\n' .. debug.traceback())
end

local function promised_s(self, onFulfilled)
  return onFulfilled and promised(self, onFulfilled) or self
end

local function promised_y(self, onFulfilled)
  return onFulfilled and promised(self[1], onFulfilled) or self
end

local function promised_n(self, _, onRejected)
  return onRejected and promised(self[1], onRejected) or self
end

-- inext() list all elementys in array
--	*) next() will list all members for table without order
--	*) @see iter(): http://www.lua.org/pil/7.3.html
local function inext(a, i)
  i = i + 1
  local v = a[i]
  if v then return i, v end
end

-- put resolved value to p[1], or push lazyed calls/object to p[]
--	1) if resolved a no pending promise, direct call promise.andThen()
local function nothing(x) return x end

local function resolver(this, resolved, sure)
  local typ = type(resolved)
  if (typ == 'table' and resolved.andThen) then
    local lazy = {
      this,
      function(value) return resolver(this, value, true) end,
      function(reason) return resolver(this, reason, false) end
    }
    if resolved[1] == PENDING then
      table.insert(resolved, lazy) -- lazy again
    else -- deep resolve for promise instance, until non-promise
      resolved:andThen(lazy[2], lazy[3])
    end
  else -- resolve as value
    this[1], this.andThen = resolved, sure and promised_y or promised_n
    for i, lazy, action in inext, this, 1 do -- 2..n
      action = sure and (lazy[2] or nothing) or (lazy[3] or nothing)
      pcall(resolver, lazy[1], promised(resolved, action), sure)
      this[i] = nil
    end
  end
end

-- for Promise.all/race, ding coroutine again and again
local function coroutine_push(co, promises)
  -- push once
  coroutine.resume(co)

  -- and try push all
  --	1) resume a dead coroutine is safe always.
  -- 	2) if promises[i] promised, skip it
  local resume_y = function(value) coroutine.resume(co, true, value) end
  local resume_n = function(reason) coroutine.resume(co, false, reason) end
  for i = 1, #promises do
    if promises[i][1] == PENDING then
      promises[i]:andThen(resume_y, resume_n)
    end
  end
end

-- promise as meta_table of all instances
promise.__index = promise
-- reset __len meta-method
--	1) lua 5.2 or LuaJIT 2 with LUAJIT_ENABLE_LUA52COMPAT enabled
--	2) need table-len patch in 5.1x, @see http://lua-users.org/wiki/LuaPowerPatches
-- promise.__len = function() return 0 end

-- promise for basetype
local number_promise = setmetatable({ andThen = promised_y }, promise)
local true_promise = setmetatable({ andThen = promised_y, true }, promise)
local false_promise = setmetatable({ andThen = promised_y, false }, promise)
number_promise.__index = number_promise
nil_promise.andThen = promised_y
getmetatable('').__index.andThen = promised_s
getmetatable('').__index.catch = function(self) return self end
setmetatable(nil_promise, promise)

------------------------------------------------------------------------------------------
-- instnace method
-- 1) promise:andThen(onFulfilled, onRejected)
-- 2) promise:catch(onRejected)
------------------------------------------------------------------------------------------
function promise:andThen(onFulfilled, onRejected)
  local lazy = { { PENDING }, onFulfilled, onRejected }
  table.insert(self, lazy)
  return setmetatable(lazy[1], promise) -- <lazy[1]> is promise2
end

function promise:catch(onRejected)
  return self:andThen(nil, onRejected)
end

------------------------------------------------------------------------------------------
-- class method
-- 1) Promise.resolve(value)
-- 2) Promise.reject(reason)
-- 3) Promise.all()
------------------------------------------------------------------------------------------

-- resolve() rules:
--	1) promise object will direct return
-- 	2) thenable (with/without string) object
-- 		- case 1: direct return, or
--		- case 2: warp as resolved promise object, it's current selected.
-- 	3) warp other(nil/boolean/number/table/...) as resolved promise object
function Promise.resolve(value)
  local valueType = type(value)
  if valueType == 'nil' then
    return nil_promise
  elseif valueType == 'boolean' then
    return value and true_promise or false_promise
  elseif valueType == 'number' then
    return setmetatable({ (value) }, number_promise)
  elseif valueType == 'string' then
    return value
  elseif (valueType == 'table') and (value.andThen ~= nil) then
    return value.catch ~= nil and value -- or, we can direct return value
        or setmetatable({ catch = promise.catch }, { __index = value })
  else
    return setmetatable({ andThen = promised_y, value }, promise)
  end
end

function Promise.reject(reason)
  return setmetatable({ andThen = promised_n, reason }, promise)
end

function Promise.all(arr)
  local this, promises, count = setmetatable({ PENDING }, promise), {}, #arr
  local co = coroutine.create(function()
    local i, result, sure, last = 1, {}, true, 0
    while i <= count do
      local promise, typ, reason, resolved = promises[i], type(promises[i])
      if typ == 'table' and promise.andThen and promise[1] == PENDING then
        sure, reason = coroutine.yield()
        if not sure then
          return resolver(this, { index = i, reason = reason }, sure)
        end
        -- dont inc <i>, continue and try pick again
      else
        -- check reject/resolve of promsied instance
        --	*) TODO: dont access promise[1] or promised_n
        sure = (typ == 'string') or (typ == 'table' and promise.andThen ~= promised_n)
        resolved = (typ == 'string') and promise or promise[1]
        if not sure then
          return resolver(this, { index = i, reason = resolved }, sure)
        end
        -- pick result from promise, and push once
        result[i] = resolved
        if result[i] ~= nil then last = i end
        i = i + 1
      end
    end
    -- becuse 'result[x]=nil' will reset length to first invalid, so need reset it to last
    -- 	1) invalid: setmetatable(result, {__len=function() retun count end})
    -- 	2) obsoleted: table.setn(result, count)
    resolver(this, sure and { unpack(result, 1, last) } or result, sure)
  end)

  -- init promises and push
  for i, item in ipairs(arr) do promises[i] = Promise.resolve(item) end
  coroutine_push(co, promises)
  return this
end

function Promise.race(arr)
  local this, result, count = setmetatable({ PENDING }, promise), {}, #arr
  local co = coroutine.create(function()
    local i, sure, resolved = 1
    while i < count do
      local promise, typ = result[i], type(result[i])
      if typ == 'table' and promise.andThen and promise[1] == PENDING then
        sure, resolved = coroutine.yield()
      else
        -- check reject/resolve of promsied instance
        --	*) TODO: dont access promise[1] or promised_n
        sure = (typ == 'string') or (typ == 'table' and promise.andThen ~= promised_n)
        resolved = typ == 'string' and promise or promise[1]
      end
      -- pick resolved once only
      break
    end
    resolver(this, resolved, sure)
  end)

  -- init promises and push
  for i, item in ipairs(arr) do promises[i] = Promise.resolve(item) end
  coroutine_push(co, promises)
  return this
end

------------------------------------------------------------------------------------------
-- constructor method
-- 1) Promise.new(func)
-- (*) new() will try execute <func>, but andThen() is lazyed.
------------------------------------------------------------------------------------------
function Promise.new(func)
  local this = setmetatable({ PENDING }, promise)
  local ok, result = pcall(func,
    function(value) return resolver(this, value, true) end,
    function(reason) return resolver(this, reason, false) end)
  return ok and this or Promise.reject(result) -- .. '.\n' .. debug.traceback())
end

return Promise

end
end

do
local _ENV = _ENV
package.preload[ "lib/TableLib" ] = function( ... ) local arg = _G.arg;
-- table方法添加
table.isArray = table.isArray or function(tab)
  if (type(tab) ~= "table") then
    return false
  end
  local length = #tab
  for k, v in pairs(tab) do
    if ((type(k) ~= "number") or (k > length)) then
      return false
    end
  end
  return true
end

table.every = table.every or function(tab)
  for k, v in ipairs(tab) do
    if (v == false) then
      return false
    end
  end
  return true
end

table.some = table.some or function(tab)
  for k, v in ipairs(tab) do
    if (v == true) then
      return true
    end
  end
  return false
end

table.push = table.push or function(tab, element)
  table.insert(tab, element)
  local length = #tab
  return length
end

table.pop = table.pop or function(tab)
  local length = #tab
  local res = tab[length]
  table.remove(tab, length)
  return res
end

table.shift = table.shift or function(tab)
  local res = tab[1]
  table.remove(tab, 1)
  return res
end

table.unshift = table.unshift or function(tab, element)
  table.insert(tab, 1, element)
  local length = #tab
  return length
end

table.first = table.first or function(tab)
  return tab[1]
end

table.last = table.last or function(tab)
  return tab[#tab]
end

table.slice = table.slice or function(tab, startIndex, endIndex)
  local length = #tab
  if ((type(endIndex) == "nil") or (endIndex == 0)) then
    endIndex = length
  end
  if (endIndex < 0) then
    endIndex = length + 1 + endIndex
  end
  local newTab = {}

  for i = startIndex, endIndex do
    table.insert(newTab, tab[i])
  end

  return newTab
end

table.join = table.join or function(tab, exp)
  if (type(exp) == "nil") then exp = "," end
  return table.concat(tab, exp)
end

table.merge = table.merge or function(tab, ...)
  arg = { ... }
  for k, tabelement in ipairs(arg) do
    local length = #tabelement
    for k2, value in ipairs(tabelement) do
      if ((type(k2) == "number") and (k2 <= length)) then
        table.insert(tab, value)
      end
    end
    for k2, value in pairs(tabelement) do
      if ((type(k2) == "number") and (k2 <= length)) then
      else
        tab[k2] = value
      end
    end
  end
  return tab
end

table.map = table.map or function(tab, callback)
  if (type(callback) ~= 'function') then return tab end
  local newTab = {}
  for k, v in ipairs(tab) do
    table.insert(newTab, callback(v))
  end
  return values
end

table.forEach = table.forEach or function(tab, callback)
  if (type(callback) ~= 'function') then return end
  for k, v in ipairs(tab) do
    callback(v)
  end
end

table.values = table.values or function(tab)
  local values = {}
  for k, v in pairs(tab) do
    table.insert(values, v)
  end
  return values
end

table.keys = table.keys or function(tab)
  local keys = {}
  for k in pairs(tab) do
    table.insert(keys, k)
  end
  return keys
end

-- 将每一组键值对变成数组，再放入一个大数组中返回
table.entries = table.entries or function(tab)
  local ent = {}
  for k, v in pairs(tab) do
    table.insert(ent, { k, v })
  end
  return ent
end

-- 对key排序后放入数组中再返回，结果类似entries
table.sortByKey = table.sortByKey or function(tab, call)
  local keys = table.keys(tab)
  if (type(call) == "function") then
    table.sort(keys, call)
  else
    table.sort(keys)
  end
  local newTable = {}
  for _, key in ipairs(keys) do
    table.insert(newTable, { key, tab[key] })
  end
  return newTable
end

table.toString = table.toString or function(tab, space)
  if ((type(tab) == "function")) then
    return "[function]"
  end
  if ((type(tab) == "number") or (type(tab) == "string")) then
    return "" .. tab
  end
  if (type(tab) == "boolean") then
    return tab and "true" or "false"
  end
  if (type(tab) == "nil") then
    return "no message"
  end
  if (type(tab) ~= "table") then
    return "[" .. type(tab) .. "]"
  end
  if (type(space) ~= "string") then
    space = ""
  end
  local newTab = {}
  local childSpace = space .. "  "
  for k, v in pairs(tab) do
    table.insert(newTab, childSpace .. k .. ": " .. table.toString(v, childSpace))
  end
  return "{\n" .. table.concat(newTab, ", \n") .. " \n" .. space .. "}"
end

table.toJsString = table.toJsString or function(tab, other, space)
  if ((type(tab) == "function")) then
    return "[function]"
  end
  if (type(tab) == "number") then
    return "" .. tab
  end
  if (type(tab) == "string") then
    return '"' .. tab .. '"'
  end
  if (type(tab) == "boolean") then
    return tab and "true" or "false"
  end
  if (type(tab) == "nil") then
    return "no message"
  end
  if (type(tab) ~= "table") then
    return "[" .. type(tab) .. "]"
  end
  if (type(space) ~= "string") then
    space = ""
  end
  local isArray = table.isArray(tab)
  local newTab = {}
  local childSpace = space .. "  "
  if (isArray) then
    for k, v in ipairs(tab) do
      table.insert(newTab, table.toJsString(v, other, childSpace))
    end
    local childStr = table.concat(newTab, ", ")

    if (string.len(childStr) > 50) then
      newTab = {}
      for k, v in ipairs(tab) do
        table.insert(newTab, childSpace .. table.toJsString(v, other, childSpace))
      end
      childStr = table.concat(newTab, ", \n")
      return "[\n" .. childStr .. " \n" .. childSpace .. "]"
    end

    return space .. "[" .. childStr .. "]"
  else
    for k, v in pairs(tab) do
      if ((other == true) or (type(v) ~= "function")) then
        table.insert(newTab, childSpace .. k .. ": " .. table.toJsString(v, childSpace))
      end
    end
    return "{\n" .. table.concat(newTab, ", \n") .. " \n" .. space .. "}"
  end
end

table.unpack = unpack or table.unpack
end
end

do
local _ENV = _ENV
package.preload[ "lib/TryCall" ] = function( ... ) local arg = _G.arg;
tryCall = tryCall or function(func, catchFunc)
  local errTraceBack

  local ret = xpcall(func, function(err)
    errTraceBack = debug.traceback()
  end)
  if (not ret) then
    if (type(catchFunc) == 'function') then
      catchFunc(ret, errTraceBack)
    end
    return ret, errTraceBack
  end
  return nil
end
end
end

end

-----------------------------------------------------------------------------
-- ES6 co lib in lua 5.1
-- Author: fgfg163@163.com
-- Copyright (c) 2015.11
--
-- This is a lib porting from Co v4 in JavaScript
-- It has some different before.
-- to see https://github.com/tj/co
-- Useage:
-- co(coroutine.create(function()
--     local v1 = coroutine.yield(Promise.resolve(123))
--     local v2 = coroutine.yield({
--     a = Promise.resolve(234),
--     b = Promise.resolve(456),
--   })
--   console.log(v1)
--   console.log(v2)
-- end)):catch(function(err)
--   print(err)
-- end)

-----------------------------------------------------------------------------

package.path = package.path .. ';..\\?.lua'
require 'lib/TableLib'
require 'lib/TryCall'


Promise = Promise or require 'lib/Promise'

local unpack = unpack or table.unpack


function new(gen, ...)
  local args = { ... }

  return Promise.new(function(resolve, reject)
    if (type(gen) == 'function') then
      gen = gen(args)
    end
    if (not isCoroutine(gen)) then
      return resolve(gen)
    end



    -- @param {Mixed} res
    -- @return {Promise}
    -- @api private
    function onFulfilled(res)
      local done, flag, ret

      local _, errMsg = tryCall(function()
        flag, ret = coroutine.resume(gen, res)
      end)
      if (errMsg) then
        return reject(errMsg)
      end
      done = coroutine.status(gen) == 'dead' and true or false
      next(done, ret)
      return nil
    end


    -- @param {Error} err
    -- @return {Promise}
    -- @api private
    function onRejected(err)
      local ret

      local _, errMsg = tryCall(function()
        ret = gen.throw(err)
      end)
      if (errMsg) then
        return reject(errMsg)
      end

      next(ret);
    end

    -- Get the next value in the generator,
    -- return a promise.
    --
    -- @param {Object} ret
    -- @return {Promise}
    -- @api private
    function next(done, ret)
      if (done) then return resolve(ret) end
      local value = toPromise(ret);
      if (value and isPromise(value)) then return value:andThen(onFulfilled, onRejected) end

      return onRejected(error('You may only yield a function, promise, generator, array, or object, '
          .. 'but the following object was passed: "' .. ret .. '"'))
    end

    onFulfilled();
  end)
end

-- Convert a `yield`ed value into a promise.
--
-- @param {Mixed} obj
-- @return {Promise}
-- @api private
function toPromise(obj)
  if (not obj) then return obj end

  if (isPromise(obj)) then return obj end
  if (isCoroutine(obj)) then return new(obj) end
  if (type(obj) == 'function') then return thunkToPromise(obj) end

  if (table.isArray(obj)) then
    return arrayToPromise(obj)
  elseif (type(obj) == 'table') then
    return objectToPromise(obj)
  end

  return obj
end

-- Check if `obj` is a promise.
--
-- @param {Object} obj
-- @return {Boolean}
-- @api private
function isPromise(obj)
  if ((type(obj) == 'table') and type(obj.andThen) == 'function') then
    return true
  end
  return false
end

-- Check if `obj` is a generator.
--
-- @param {Mixed} obj
-- @return {Boolean}
-- @api private
function isCoroutine(obj)
  if (type(obj) == 'thread') then
    return true
  end
  return false
end


-- Convert a thunk to a promise.
--
-- @param {Function}
-- @return {Promise}
-- @api private
function thunkToPromise(fn)
  return Promise.new(function(resolve, reject)
    fn(function(err, res)
      if (err) then return reject(err) end
      if (#res > 2) then
        res = table.slice(res, 0, 1)
      end
      resolve(res)
    end)
  end)
end

-- Convert an array of "yieldables" to a promise.
-- Uses `Promise.all()` internally.
--
-- @param {Array} obj
-- @return {Promise}
-- @api private
function arrayToPromise(obj)
  return Promise.all(table.map(obj, toPromise));
end

-- Convert an object of "yieldables" to a promise.
-- Uses `Promise.all()` internally.
--
-- @param {Object} obj
-- @return {Promise}
-- @api private
function objectToPromise(obj)
  local results = {}
  local promises = {}

  local function defer(promise, key)
    results[key] = nil
    table.push(promises, promise:andThen(function(res)
      results[key] = res
    end))
  end

  for _, it in ipairs(table.entries(obj)) do
    local key = it[1]
    local value = it[2]
    local promise = toPromise(value)
    if (promise and isPromise(promise)) then
      defer(promise, key)
    else
      results[key] = obj[key]
    end
  end

  return Promise.all(promises):andThen(function()
    return results
  end)
end

return setmetatable({
  new = new;
}, {
  __call = function(_, ...)
    return new(...)
  end
})
end
end

do
local _ENV = _ENV
package.preload[ "src/DeviceOrientHock" ] = function( ... ) local arg = _G.arg;
require "TSLib"

local __init = init

-- 0=竖屏，1=右旋（home键在右边），2=左旋（home键在左边），3=倒立
__init(0)
local w, h = getScreenSize()
local m = math.max(w, h)
local orient = 0;
local nextUpdateTime = os.time()

-- 计算方向辅助界面，一像素宽度的白色边界，一像素宽的黑色边界，用于检测方向
fwShowWnd("orientwid1", 0, 0, 2, m, 0)
fwShowTextView("orientwid1", "text1", "", "center", "000000", "FEFEFE", 15, 0, 0, 0, 1, m, 1)
fwShowTextView("orientwid1", "text2", "", "center", "000000", "010101", 15, 0, 1, 0, 2, m, 1)

mSleep(100)


-- 计算当前方向
function calOrient(_orient)
  __init(0)
  local result = _orient
  -- 寻找白色边界

  local checkOrder = { 0, 1, 2 }
  if (_orient == 0) then
    checkOrder = { 0, 1, 2 }
  elseif (_orient == 1) then
    checkOrder = { 1, 0, 2 }
  elseif (_orient == 2) then
    checkOrder = { 2, 0, 1 }
  end

  local checkPointList = {
    { 0, math.floor(0.333 * w), 0xfefefe },
    { 0, math.floor(0.5 * w), 0xfefefe },
    { 0, math.floor(0.667 * w), 0xfefefe },
    { 0, math.floor(0.833 * w), 0xfefefe },
    { 1, math.floor(0.333 * w), 0x010101 },
    { 1, math.floor(0.5 * w), 0x010101 },
    { 1, math.floor(0.667 * w), 0x010101 },
    { 1, math.floor(0.833 * w), 0x010101 },
  }

  for k, v in ipairs(checkOrder) do
    __init(v)
    if (multiColorS(checkPointList)) then
      return v
    end
  end
  __init(_orient)
  return _orient
end

local _orient = calOrient(orient)
orient = _orient

-- 获取当前方向
getDeviceOrient = function(useKeep)
  local newOrient = orient
  if (os.time() > nextUpdateTime) then
    local _keepScreenState = keepScreenState
    if (not _keepScreenState) then keepScreen(true) end
    newOrient = calOrient(orient)
    nextUpdateTime = os.time() + 1
    if (not _keepScreenState) then keepScreen(false) end
  end
  return newOrient
end


-- 设置当前方向，当然只能设置init的方向
setDeviceOrient = function(n)
  orient = n
  __init(n)
  nextUpdateTime = os.time() + 1
end
init = setDeviceOrient
end
end

do
local _ENV = _ENV
package.preload[ "src/GoMission" ] = function( ... ) local arg = _G.arg;
return function(map, stepLabel, setOnceListener)
  local gomission = {}
  -- 出征
  -- 参数：章节，追击，追击boss，快修，使用舰队，最大战斗次数
  gomission.battleOnce = function(chapter, pursue, pursueBoss, quickRepair, fleet, alertWhenNoHp, maxBattleNum)
    stepLabel:setStepLabelContent("1-1.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
      { battlePage = map.battle.battle.isBattlePage },
      { thePage = map.battle.isBattlePage },
      -- 检测是否已在战斗中
      { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
      { battleStartPage = map.battle.battle.isBattleStartPage },
      { formationPage = map.battle.battle.isFormationPage },
      { pursueModal = map.battle.battle.isPursueModal },
      { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
      { victoryPage = map.battle.battle.isVictoryPage },
      { medalModal = map.home.isMedalModal },
      { isHome2 = map.home.isHome },
    })

    local quickSupplyCount = 0
    local quickRepairCount = 0
    local HPIsSafe = true
    local battleNum = 1
    local cantBattle = true
    while (state ~= 0) do
      if (state == "isHome") then

        stepLabel:setStepLabelContent("1-2.点击出征")
        map.home.clickBattleBtn()
        stepLabel:setStepLabelContent("1-3.等待出征页面")

        state = setOnceListener({
          { battlePage = map.battle.battle.isBattlePage },
          { thePage = map.battle.isBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { battlePage = map.battle.battle.isBattlePage },
            { thePage = map.battle.isBattlePage },
          })
        end

      elseif (state == "thePage") then

        stepLabel:setStepLabelContent("1-4.出征页面")
        stepLabel:setStepLabelContent("1-5.点击出征的出征按钮")
        mSleep(500)
        map.battle.battle.clickBattleBtn()
        stepLabel:setStepLabelContent("1-6.等待出征的出征界面")
        state = setOnceListener({
          { battlePage = map.battle.battle.isBattlePage },
          { readyBattlePage = map.battle.battle.isReadyBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { battlePage = map.battle.battle.isBattlePage },
            { thePage = map.battle.isBattlePage },
            { readyBattlePage = map.battle.battle.isReadyBattlePage },
          })
        end

      elseif (state == "battlePage") then

        stepLabel:setStepLabelContent("1-7.出征的出征页面")
        stepLabel:setStepLabelContent("1-8.移动到章节" .. chapter)
        mSleep(300)
        map.battle.battle.moveToChapter(chapter)
        stepLabel:setStepLabelContent("1-9.进入章节")
        mSleep(300)
        map.battle.battle.clickReadyBattleBtn()
        mSleep(100)
        stepLabel:setStepLabelContent("1-10.等待出征准备界面")
        state = setOnceListener({
          { readyBattlePage = map.battle.battle.isReadyBattlePage },
          { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
          { quickRepairModal = map.battle.battle.isQuickRepairModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { battlePage = map.battle.battle.isBattlePage },
            { thePage = map.battle.isBattlePage },
            { readyBattlePage = map.battle.battle.isReadyBattlePage },
            { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
            { quickRepairModal = map.battle.battle.isQuickRepairModal },
          })
        end

      elseif (state == "readyBattlePage") then

        stepLabel:setStepLabelContent("1-11.选择舰队:" .. fleet)
        map.battle.battle.selectFleet(fleet)
        stepLabel:setStepLabelContent("1-12.检测所有状态正常")
        mSleep(500)
        local res = map.battle.battle.isReadyBattlePageShipStatusAllRignt()
        if (not res) then
          map.battle.battle.clickReadyBattlePageQuickSupplyBtn()
          stepLabel:setStepLabelContent("1-13.等待快速补给界面")
          state = setOnceListener({
            { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePage = map.battle.battle.isReadyBattlePage },
              { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
            })
          end
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "quickSupplyModal") then

        stepLabel:setStepLabelContent("1-14.快速补给界面")
        stepLabel:setStepLabelContent("1-15.快速补给界面点击确定")
        map.battle.battle.clickReadyBattlePageQuickSupplyModalOkBtn()
        stepLabel:setStepLabelContent("1-16.等待出征准备界面")
        quickSupplyCount = quickSupplyCount + 1
        if (quickSupplyCount < 3) then
          state = setOnceListener({
            { readyBattlePage2 = map.battle.battle.isReadyBattlePage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
              { readyBattlePage2 = map.battle.battle.isReadyBattlePage },
            })
          end
        else
          stepLabel:setStepLabelContent("1-17.资源数量不足")
          state = "quickSupplyModalFail"
        end

      elseif (state == "quickSupplyModalFail") then

        stepLabel:setStepLabelContent("1-18.点击快速补给关闭")
        mSleep(100)
        map.battle.battle.clickQuickSupplyModalCloseBtn()
        mSleep(300)
        cantBattle = false
        state = setOnceListener({
          { readyBattleFleetsCantBattle = map.battle.battle.isReadyBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickSupplyModalFail = map.battle.battle.isQuickSupplyModal },
            { readyBattleFleetsCantBattle = map.battle.battle.isReadyBattlePage },
          })
        end

      elseif (state == "readyBattlePage2") then

        stepLabel:setStepLabelContent("1-19.检测血量是否安全")
        mSleep(500)
        local res = map.battle.battle.isReadyBattlePageShipHPSafe()
        if (not res) then
          state = "readyBattlePageCheckHp"
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "readyBattlePageCheckHp") then

        if (quickRepair) then
          -- 如果快速修理
          stepLabel:setStepLabelContent("1-20.点击快速修理按钮")
          map.battle.battle.clickQuickRepairBtn()
          stepLabel:setStepLabelContent("1-21.等待快速修理界面")
          state = setOnceListener({
            { quickRepairModal = map.battle.battle.isQuickRepairModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePageCheckHp = map.battle.battle.isReadyBattlePage },
              { quickRepairModal = map.battle.battle.isQuickRepairModal },
            })
          end
        else
          stepLabel:setStepLabelContent("1-22.不允许快速维修，继续检测血量")
          state = "readyBattlePage4"
        end

      elseif (state == "quickRepairModal") then

        stepLabel:setStepLabelContent("1-23.点击快速修理确定")
        map.battle.battle.clickQuickRepairModalOkBtn()
        quickRepairCount = quickRepairCount + 1
        stepLabel:setStepLabelContent("1-24.等待出征准备界面")
        if (quickRepairCount < 3) then
          state = setOnceListener({
            { readyBattlePageCheckCanBattle = map.battle.battle.isReadyBattlePage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { quickRepairModal = map.battle.battle.isQuickRepairModal },
              { readyBattlePageCheckCanBattle = map.battle.battle.isReadyBattlePage },
            })
          end
        else
          stepLabel:setStepLabelContent("1-25.快速修理数量不足")
          state = "quickRepairModalFail"
        end

      elseif (state == "quickRepairModalFail") then

        stepLabel:setStepLabelContent("1-26.点击快速修理关闭")
        mSleep(100)
        map.battle.battle.clickQuickRepairModalCloseBtn()
        mSleep(300)
        cantBattle = false
        state = setOnceListener({
          { readyBattleFleetsCantBattle = map.battle.battle.isReadyBattlePage },
        })


      elseif (state == "readyBattlePage4") then

        stepLabel:setStepLabelContent("1-27.再次检测血量是否安全")
        mSleep(500)
        local res = map.battle.battle.isReadyBattlePageShipHPSafe()
        if (not res) then
          stepLabel:setStepLabelContent("1-28.血量不安全，返回")
          cantBattle = false
          state = "readyBattleFleetsCantBattle"
        else
          stepLabel:setStepLabelContent("1-29.血量安全，继续")
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "readyBattlePageCheckCanBattle") then

        stepLabel:setStepLabelContent("1-30.检测舰队可以出征")
        mSleep(500)
        local fleetCanBattle = map.battle.battle.isFleetsCanBattle()
        if (not fleetCanBattle) then
          cantBattle = false
          state = "readyBattleFleetsCantBattle"
        else
          stepLabel:setStepLabelContent("1-23.等待出征准备界面，...")
          state = setOnceListener({
            { readyBattlePageCanBattle = map.battle.battle.isReadyBattlePage },
            { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
            { battleStartPage = map.battle.battle.isBattleStartPage },
            { formationPage = map.battle.battle.isFormationPage },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { medalModal = map.home.isMedalModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { isHome = map.home.isHome },
              { battlePage = map.battle.battle.isBattlePage },
              { thePage = map.battle.isBattlePage },
              { readyBattlePageCanBattle = map.battle.battle.isReadyBattlePage },
              { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
              { battleStartPage = map.battle.battle.isBattleStartPage },
              { formationPage = map.battle.battle.isFormationPage },
              { pursueModal = map.battle.battle.isPursueModal },
              { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
              { victoryPage = map.battle.battle.isVictoryPage },
              { medalModal = map.home.isMedalModal },
            })
          end
        end

      elseif (state == "readyBattlePageCanBattle") then

        stepLabel:setStepLabelContent("1-31.出征准备界面")
        stepLabel:setStepLabelContent("1-32.点击出征开始")
        mSleep(100)
        map.battle.battle.clickBattleStartBtn()
        state = "startBattle"

      elseif (state == "startBattle") then

        if (battleNum < maxBattleNum) then
          stepLabel:setStepLabelContent("1-33.第" .. battleNum .. "战开始")
        else
          stepLabel:setStepLabelContent("1-34.第" .. battleNum .. "战Boss战开始")
        end
        stepLabel:setStepLabelContent("1-35.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面")
        state = setOnceListener({
          { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
          { battleStartPage = map.battle.battle.isBattleStartPage },
          { formationPage = map.battle.battle.isFormationPage },
          { pursueModal = map.battle.battle.isPursueModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { readyBattlePageCanBattle = map.battle.battle.isReadyBattlePage },
            { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
            { battleStartPage = map.battle.battle.isBattleStartPage },
            { formationPage = map.battle.battle.isFormationPage },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "extraReceiveModal") then

        stepLabel:setStepLabelContent("1-36.额外获得面板，点击确定")
        map.battle.battle.clickExtraReceiveModalOk()
        battleNum = battleNum + 1
        stepLabel:setStepLabelContent("1-37.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面")
        state = setOnceListener({
          { battleStartPage = map.battle.battle.isBattleStartPage },
          { formationPage = map.battle.battle.isFormationPage },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { pursueModal = map.battle.battle.isPursueModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
            { battleStartPage = map.battle.battle.isBattleStartPage },
            { formationPage = map.battle.battle.isFormationPage },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "battleStartPage") then

        stepLabel:setStepLabelContent("1-38.开始面板，点击开始")
        mSleep(100)
        map.battle.battle.clickBattleStartModalStartBtn()
        stepLabel:setStepLabelContent("1-39.等待阵型面板，追击面板，胜利界面")
        state = setOnceListener({
          { formationPage = map.battle.battle.isFormationPage },
          { pursueModal = map.battle.battle.isPursueModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { battleStartPage = map.battle.battle.isBattleStartPage },
            { formationPage = map.battle.battle.isFormationPage },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
          })
        end

      elseif (state == "formationPage") then

        stepLabel:setStepLabelContent("1-40.阵型面板")
        mSleep(100)
        map.battle.battle.clickFormationPageStartBtn()
        stepLabel:setStepLabelContent("1-41.等待追击面板，胜利界面")
        state = setOnceListener({
          { pursueModal = map.battle.battle.isPursueModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
          { victoryPageNext = map.battle.battle.isVictoryPage2 },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { formationPage = map.battle.battle.isFormationPage },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { victoryPageNext = map.battle.battle.isVictoryPage2 },
          })
        end

      elseif (state == "pursueModal") then

        stepLabel:setStepLabelContent("1-58.追击面板")
        mSleep(100)
        if ((pursue and (battleNum < maxBattleNum)) or (pursueBoss and (battleNum == maxBattleNum))) then
          stepLabel:setStepLabelContent("1-59.追击")
          map.battle.battle.clickPursueModalOk()
        else
          stepLabel:setStepLabelContent("1-60.放弃追击")
          map.battle.battle.clickPursuePageCancel()
        end
        stepLabel:setStepLabelContent("1-61.等待胜利界面")
        state = setOnceListener({
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
          { victoryPageNext = map.battle.battle.isVictoryPage2 },
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { victoryPageNext = map.battle.battle.isVictoryPage2 },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal }
          })
        end

      elseif (state == "victoryPage") then

        mSleep(1000)
        stepLabel:setStepLabelContent("1-42.胜利界面检测HP是否安全")
        mSleep(300)
        HPIsSafe = map.battle.battle.isVictoryPageShipHPSafe()
        if (HPIsSafe) then
          stepLabel:setStepLabelContent("1-43.HP安全")
        else
          stepLabel:setStepLabelContent("1-44.HP不安全")
        end
        mSleep(200)
        stepLabel:setStepLabelContent("1-45.点击胜利继续")
        mSleep(200)
        map.battle.battle.clickVictoryPageContinueBtn()
        stepLabel:setStepLabelContent("1-46.等待胜利继续界面")
        state = setOnceListener({
          { victoryPageNext = map.battle.battle.isVictoryPage2 },
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPage = map.battle.battle.isVictoryPage },
            { victoryPageNext = map.battle.battle.isVictoryPage2 },
            { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          })
        end

      elseif (state == "shipSevereDamageModal") then

        stepLabel:setStepLabelContent("1-47.大破警告框点击返回")
        map.battle.battle.clickShipSevereDamageModalBack()
        stepLabel:setStepLabelContent("1-48.等待新船，下回合窗口，勋章对话框，home")
        HPIsSafe = false
        state = setOnceListener({
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "shipCantGoOnModal") then

        stepLabel:setStepLabelContent("1-49.无法前进警告框点击返回")
        map.battle.battle.clickShipCantGoOnModalBackBtn()
        stepLabel:setStepLabelContent("1-50.等待新船，下回合窗口，勋章对话框，home")
        HPIsSafe = false
        state = setOnceListener({
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "newShipPage") then

        stepLabel:setStepLabelContent("1-51.获取新船")
        mSleep(500)
        map.battle.battle.clickNewShip()
        stepLabel:setStepLabelContent("1-52.等待新船锁定窗口，下回合窗口，勋章对话框，home")
        state = setOnceListener({
          { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
          { newShipPageLockModal = map.battle.battle.isNewShipPageLockModal },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { newShipPage = map.battle.battle.isNewShipPage },
            { hipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
            { newShipPageLockModal = map.battle.battle.isNewShipPageLockModal },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "newShipPageLockModal") then

        stepLabel:setStepLabelContent("1-53.新船锁定窗口点击确认")
        map.battle.battle.clickNewShipPageLockModalOkBtn()
        stepLabel:setStepLabelContent("1-54.等待下回合窗口，勋章对话框，home")
        state = setOnceListener({
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { edalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { newShipPageLockModal = map.battle.battle.isNewShipPageLockModal },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "nextLevelStepModal") then

        if ((battleNum < maxBattleNum) and HPIsSafe) then
          stepLabel:setStepLabelContent("1-55.点击继续下一关")
          map.battle.battle.clickLevelStepModalContinueBtn()
          state = "startBattle"
          battleNum = battleNum + 1
        else
          stepLabel:setStepLabelContent("1-56.点击回港")
          map.battle.battle.clickLevelStepModalBackBtn()
          stepLabel:setStepLabelContent("1-57.等待勋章对话框，主界面")
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
              { medalModal = map.home.isMedalModal },
              { isHome2 = map.home.isHome },
            })
          end
        end

      elseif (state == "victoryPageNext") then

        stepLabel:setStepLabelContent("1-62.点击胜利继续")
        map.battle.battle.clickVictoryPageContinueBtn2()
        stepLabel:setStepLabelContent("1-63.等待大破警告，新船，下回合窗口，勋章对话框，home")
        state = setOnceListener({
          { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPageNext = map.battle.battle.isVictoryPage2 },
            { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "readyBattleFleetsCantBattle") then

        stepLabel:setStepLabelContent("1-64.舰队无法继续战斗")
        map.battle.battle.clickReadyBattlePageBackBtn()
        stepLabel:setStepLabelContent("1-65.等待出征界面")
        state = setOnceListener({
          { readyBattleFleetsCantBattleBattlePage = map.battle.isBattlePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { readyBattleFleetsCantBattle = map.battle.battle.isReadyBattlePage },
            { readyBattleFleetsCantBattleBattlePage = map.battle.isBattlePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "readyBattleFleetsCantBattleBattlePage") then

        map.battle.clickBackToHomeBtn()
        stepLabel:setStepLabelContent("1-66.等待勋章对话框，主界面")
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { readyBattleFleetsCantBattleBattlePage = map.battle.isBattlePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("1-67.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        stepLabel:setStepLabelContent("1-68.出征结束")
        if ((not cantBattle) and alertWhenNoHp) then
          for i = 1, 2 do
            vibrator();
            mSleep(1000);
          end
        end
        state = 0
        return true, HPIsSafe
      end
    end

    return true
  end

  -- 领取任务奖励
  gomission.mission = function()
    stepLabel:setStepLabelContent("2-1.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
    })

    while (state ~= 0) do
      if (state == "isHome") then

        stepLabel:setStepLabelContent("2-2.检测是否有任务奖励")
        mSleep(500)
        local res = map.mission.isUnreceivedMission()
        if (not res) then
          stepLabel:setStepLabelContent("2-3.没有任务奖励")
          state = "isHome2"
        else
          state = "startMission"
        end

      elseif (state == "startMission") then

        stepLabel:setStepLabelContent("2-4.点击任务按钮")
        map.mission.clickMission()
        stepLabel:setStepLabelContent("2-5.等待任务界面")
        state = setOnceListener({
          { missionPage = map.mission.isMission },
          { allMissionPage = map.mission.isMissionAllMission },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { missionPage = map.mission.isMission },
            { allMissionPage = map.mission.isMissionAllMission },
          })
        end

      elseif (state == "missionPage") then

        stepLabel:setStepLabelContent("2-6.点击全部任务")
        map.missionClickAllMission()
        stepLabel:setStepLabelContent("2-7.等待任务全部任务界面")
        state = setOnceListener({
          { allMissionPage = map.mission.isMissionAllMission },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { missionPage = map.mission.isMission },
            { allMissionPage = map.mission.isMissionAllMission },
          })
        end

      elseif (state == "allMissionPage") then

        mSleep(100)
        local res = map.mission.isMissionUnreceivedReward()
        if (not res) then
          stepLabel:setStepLabelContent("2-8.没有任务奖励")
          state = "missionPageNoRewar"
        else
          stepLabel:setStepLabelContent("2-9.有任务奖励")
          map.mission.clickGetFirstReward()
          stepLabel:setStepLabelContent("2-10.等待获得面板")

          state = setOnceListener({
            { rewardPage = map.mission.isRewardPannel },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { allMissionPage = map.mission.isMissionAllMission },
              { rewardPage = map.mission.isRewardPannel },
            })
          end
        end

      elseif (state == "rewardPage") then

        stepLabel:setStepLabelContent("2-11.点击确定")
        map.mission.clickRewardPannelOk()
        stepLabel:setStepLabelContent("2-12.等待任务全部任务界面")
        state = setOnceListener({
          { allMissionPage = map.mission.isMissionAllMission },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { rewardPage = map.mission.isRewardPannel },
            { allMissionPage = map.mission.isMissionAllMission },
          })
        end

      elseif (state == "missionPageNoRewar") then

        stepLabel:setStepLabelContent("2-13.等待返回home")
        map.mission.clickBackToHome()
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { missionPageNoRewar = map.mission.isMission },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("2-14.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        stepLabel:setStepLabelContent("2-15.返回港口")
        state = 0
      end
    end

    return true
  end


  -- 远征回收
  gomission.expeditionReward = function(enableChapter, expeditionTogether)
    if (type(enableChapter) ~= "table") then
      enableChapter = { 1, 2, 3, 4, 5, 6, 7 }
    end

    if (#enableChapter < 1) then
      stepLabel:setStepLabelContent("3-1.没有远征任务！")
      return true
    end
    -- 复制一份数组
    (function()
      local newC = {}
      for i, v in ipairs(enableChapter) do
        table.insert(newC, v)
      end
      enableChapter = newC
    end)()

    stepLabel:setStepLabelContent("3-2.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
      { battleExpedition = map.expedition.isBattleExpedition },
      { expeditionIsBattle = map.expedition.isBattle },
    })

    local lastChapter = nil

    while (state ~= 0) do
      if (state == "isHome") then
        stepLabel:setStepLabelContent("3-3.检测是否有远征奖励")
        mSleep(100)
        local res = map.expedition.isExpeditionCompleted()
        if (not res) then
          stepLabel:setStepLabelContent("3-4.没有远征奖励和任务")
          state = 0
          return true
        end
        stepLabel:setStepLabelContent("3-5.点击出征")
        map.expedition.clickBattle()
        stepLabel:setStepLabelContent("3-6.等待出征界面")
        state = setOnceListener({
          { expeditionIsBattle = map.expedition.isBattle },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { battleExpedition = map.expedition.isBattleExpedition },
            { expeditionIsBattle = map.expedition.isBattle },
          })
        end

      elseif (state == "expeditionIsBattle") then

        stepLabel:setStepLabelContent("3-7.点击远征")
        map.expedition.clickExpedition()
        stepLabel:setStepLabelContent("3-8.等待远征界面")
        state = setOnceListener({
          { battleExpedition = map.expedition.isBattleExpedition },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { battleExpedition = map.expedition.isBattleExpedition },
            { expeditionIsBattle = map.expedition.isBattle },
          })
        end

      elseif (state == "battleExpedition") then

        if (#enableChapter > 0) then
          local chapter = enableChapter[1]

          stepLabel:setStepLabelContent("3-9.移动到第" .. chapter .. "章")
          map.expedition.moveToChapter(chapter, lastChapter)
          lastChapter = chapter
          stepLabel:setStepLabelContent("3-10.检测本页有可收获奖励")
          mSleep(200)
          state = "checkHasReward"
        else
          state = "returnToHome"
        end

      elseif (state == "checkHasReward") then

        local res, list = map.expedition.isThisExpeditionPageHasReward()
        if (res) then
          local v = list[1]
          stepLabel:setStepLabelContent("3-11.点击按钮" .. v)
          map.expedition.clickExpeditionBtn(v)
          stepLabel:setStepLabelContent("3-12.等待远征完成页面")
          state = setOnceListener({
            { expeditionCompletedPage = map.expedition.isExpeditionCompletedPage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { expeditionIsBattle = map.expedition.isBattleExpedition },
              { expeditionCompletedPage = map.expedition.isExpeditionCompletedPage },
            })
          end
        else
          stepLabel:setStepLabelContent("3-13.本页没有可收获的奖励")
          state = "battleExpedition"
          table.remove(enableChapter, 1)
        end

      elseif (state == "expeditionCompletedPage") then

        map.expedition.clickRewardPannelOk()
        stepLabel:setStepLabelContent("3-14.等待远征界面")
        state = setOnceListener({
          { checkHasReward = map.expedition.isBattleExpedition },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { expeditionCompletedPage = map.expedition.isExpeditionCompletedPage },
            { checkHasReward = map.expedition.isBattleExpedition },
          })
        end

      elseif (state == "returnToHome") then

        if (expeditionTogether) then
          stepLabel:setStepLabelContent("3-15.等待派遣舰队")
          state = 0
          return true
        else
          stepLabel:setStepLabelContent("3-16.返回港口")
          map.expedition.clickBackToHome()
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { returnToHome = map.expedition.isBattleExpedition },
              { medalModal = map.home.isMedalModal },
              { isHome2 = map.home.isHome },
            })
          end
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("3-17.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        state = 0
        stepLabel:setStepLabelContent("3-18.home")
        return true
      end
    end
    return true
  end

  -- 远征派遣舰队
  gomission.expeditionOnce = function(expeditionFleetToChapter, expeditionQuickRepair)
    if (type(expeditionFleetToChapter) ~= "table") then
      expeditionFleetToChapter = { false, false, false, false }
    end

    if ((not expeditionFleetToChapter[1]) and (not expeditionFleetToChapter[2]) and (not expeditionFleetToChapter[3]) and (not expeditionFleetToChapter[4])) then
      stepLabel:setStepLabelContent("3-19.没有远征任务！")
      return true
    end
    -- 转换数组
    (function()
      local newC = {}
      for i, v in ipairs(expeditionFleetToChapter) do
        if (v) then
          table.insert(newC, { i, v })
        end
      end
      expeditionFleetToChapter = newC
    end)()

    stepLabel:setStepLabelContent("3-20.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
      { expeditionIsBattle = map.expedition.isBattle },
      { expeditionExpeditionPage = map.expedition.isBattleExpedition },
    })
    local lastChapter = nil
    local fleet, chapters

    while (state ~= 0) do
      if (state == "isHome") then
        stepLabel:setStepLabelContent("3-21.点击出征")
        map.expedition.clickBattle()
        stepLabel:setStepLabelContent("3-22.等待出征界面")
        state = setOnceListener({
          { expeditionIsBattle = map.expedition.isBattle },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { expeditionIsBattle = map.expedition.isBattle },
          })
        end

      elseif (state == "expeditionIsBattle") then

        stepLabel:setStepLabelContent("3-23.点击远征")
        map.expedition.clickExpedition()
        stepLabel:setStepLabelContent("3-24.等待远征界面")
        state = setOnceListener({
          { expeditionExpeditionPage = map.expedition.isBattleExpedition },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { expeditionIsBattle = map.expedition.isBattle },
            { expeditionExpeditionPage = map.expedition.isBattleExpedition },
          })
        end

      elseif (state == "expeditionExpeditionPage") then

        if (#expeditionFleetToChapter > 0) then
          fleet, chapters = table.unpack(expeditionFleetToChapter[1])

          local chapter, section = table.unpack(strSplit(chapters, "-"))
          if (lastChapter ~= chapter) then
            stepLabel:setStepLabelContent("3-25.移动到第" .. chapter .. "章")
            map.expedition.moveToChapter(chapter, lastChapter)
            lastChapter = chapter
            mSleep(300)
          end
          stepLabel:setStepLabelContent("3-26.检测第" .. section .. "节能否远征")
          mSleep(200)
          local res = map.expedition.isChapterCanExpedition(section)
          if (res) then
            stepLabel:setStepLabelContent("3-27.点击按钮" .. section)
            map.expedition.clickExpeditionBtn(section)
            stepLabel:setStepLabelContent("3-28.等待远征准备界面")
            state = setOnceListener({
              { battleExpeditionPreparePage = map.expedition.isExpeditionPrepare },
            }, 2000)
            if (state == 0) then
              state = setOnceListener({
                { expeditionExpeditionPage = map.expedition.isBattleExpedition },
                { battleExpeditionPreparePage = map.expedition.isExpeditionPrepare },
              })
            end
          else
            stepLabel:setStepLabelContent("3-29.本章不能远征")
            state = "expeditionExpeditionPage"
            -- 执行下一个章节
            table.remove(expeditionFleetToChapter, 1)
          end
        else
          stepLabel:setStepLabelContent("3-30.没有远征")
          state = "returnToHome"
        end

      elseif (state == "battleExpeditionPreparePage") then

        stepLabel:setStepLabelContent("3-31.选择舰队" .. fleet)
        map.expedition.clickSelectFleet(fleet)
        stepLabel:setStepLabelContent("3-32.检测所有状态正常")
        mSleep(300)
        local res = map.expedition.isReadyExpeditionShipStatus()
        if (not res) then
          stepLabel:setStepLabelContent("3-33.状态不正常")
          map.expedition.clickQuickSupply()
          stepLabel:setStepLabelContent("3-34.等待快速补给界面")
          state = setOnceListener({
            { quickSupplyPage = map.expeditionIsQuickSupply },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { battleExpeditionPreparePage = map.expedition.isExpeditionPrepare },
              { quickSupplyPage = map.expeditionIsQuickSupply },
            })
          end
        else
          state = "expeditionPreparePage2"
        end

      elseif (state == "quickSupplyPage") then

        map.expedition.clickQuickSupplyDo()
        stepLabel:setStepLabelContent("3-35.等待远征准备界面")
        state = setOnceListener({
          { expeditionPreparePage = map.expedition.isExpeditionPrepare },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickSupplyPage = map.expeditionIsQuickSupply },
            { expeditionPreparePage = map.expedition.isExpeditionPrepare },
          })
        end

      elseif (state == "expeditionPreparePage") then

        if (expeditionQuickRepair) then
          -- 如果快速修理
          map.expedition.clickQuickRepair()
          stepLabel:setStepLabelContent("3-36.等待快速修理界面")
          state = setOnceListener({
            { quickRepairPage = map.expedition.isQuickRepair },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { expeditionPreparePage = map.expedition.isExpeditionPrepare },
              { quickRepairPage = map.expedition.isQuickRepair },
            })
          end
        else
          state = "expeditionPreparePage2"
        end

      elseif (state == "quickRepairPage") then

        map.expedition.clickQuickRepairDo()
        stepLabel:setStepLabelContent("3-37.等待远征准备界面")
        state = setOnceListener({
          { expeditionPreparePage2 = map.expedition.isExpeditionPrepare },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickRepairPage = map.expedition.isQuickRepair },
            { expeditionPreparePage2 = map.expedition.isExpeditionPrepare },
          })
        end

      elseif (state == "expeditionPreparePage2") then

        stepLabel:setStepLabelContent("3-38.检测舰队可以远征")
        mSleep(500)
        local fleetCanExpedition = map.expedition.isCanExpedition()
        if (not fleetCanExpedition) then
          stepLabel:setStepLabelContent("3-39.点击返回远征界面")
          map.expedition.clickBackToExpeditionPrepare()
          table.remove(expeditionFleetToChapter, 1)
        else
          stepLabel:setStepLabelContent("3-40.点击远征开始")
          map.expedition.clickBattleStart()
        end
        stepLabel:setStepLabelContent("3-41.等待远征界面")
        state = setOnceListener({
          { expeditionExpeditionPage = map.expedition.isBattleExpedition },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { expeditionPreparePage2 = map.expedition.isExpeditionPrepare },
            { expeditionExpeditionPage = map.expedition.isBattleExpedition },
          })
        end

      elseif (state == "returnToHome") then

        stepLabel:setStepLabelContent("3-42.返回港口")
        map.expedition.clickBackToHome()
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { returnToHome = map.expedition.isBattleExpedition },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("3-43.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        state = 0
        stepLabel:setStepLabelContent("3-44.home")
        return true
      end
    end

    return true
  end


  -- 修理
  gomission.repairOnce = function()
    stepLabel:setStepLabelContent("4-1.等待home")

    local needRepair = true
    local slot

    local state = setOnceListener({
      { isHome = map.home.isHome },
      { repairPage = map.repair.isRepairPage },
      { dockPage = map.repair.isDockPage },
    })
    while (state ~= 0) do
      if (state == "isHome") then

        stepLabel:setStepLabelContent("4-2.点击出征")
        mSleep(100)
        map.repair.clickDockBtn()
        stepLabel:setStepLabelContent("4-3.等待船坞界面")
        state = setOnceListener({
          { repairPage = map.repair.isRepairPage },
          { dockPage = map.repair.isDockPage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { repairPage = map.repair.isRepairPage },
            { dockPage = map.repair.isDockPage },
          })
        end

      elseif (state == "dockPage") then

        stepLabel:setStepLabelContent("4-4.点击修理按钮")
        mSleep(100)
        map.repair.clickRepairBtn()
        stepLabel:setStepLabelContent("4-5.等待修理界面")
        state = setOnceListener({
          { repairPage = map.repair.isRepairPage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { dockPage = map.repair.isDockPage },
            { repairPage = map.repair.isRepairPage },
            { medalModal = map.home.isMedalModal },
          })
        end

      elseif (state == "repairPage") then

        stepLabel:setStepLabelContent("4-6.检测空闲槽位")
        mSleep(500)
        local res, hasList = map.repair.hasEmptyRepairSlot()
        if (res) then
          slot = hasList[1]
          stepLabel:setStepLabelContent("4-7.有空闲槽位")
          stepLabel:setStepLabelContent("4-8.点击第" .. slot .. "个空闲槽位")
          mSleep(100)
          map.repair.clickRepairSlotBtn(slot)
          mSleep(100)
          stepLabel:setStepLabelContent("4-9.检测修理界面，选船界面")
          state = setOnceListener({
            { selectShipPage = map.repair.isSelectShipPage },
          }, 3000)
          -- 如果一没进入修船选船页面说明没有需要维修的船
          if (state == 0) then
            state = setOnceListener({
              { selectShipPage = map.repair.isSelectShipPage },
              { repairFinish = map.repair.isRepairPage },
              { medalModal = map.home.isMedalModal },
              { isHome2 = map.home.isHome },
            })
          end
        else
          stepLabel:setStepLabelContent("4-10.没有空位")
          state = setOnceListener({
            { repairFinish = map.repair.isRepairPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "selectShipPage") then

        stepLabel:setStepLabelContent("4-11.选择第一个船")
        mSleep(200)
        map.repair.clickFirstShip()
        stepLabel:setStepLabelContent("4-12.等待返回修理界面")
        state = setOnceListener({
          { returnToRepairPage = map.repair.isRepairPage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { selectShipPage = map.repair.isSelectShipPage },
            { returnToRepairPage = map.repair.isRepairPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "returnToRepairPage") then

        stepLabel:setStepLabelContent("4-13.等待第" .. slot .. "个槽位变成修理状态")
        state = setOnceListener({
          { repairPage = map.repair.isSlotNotEmpty(slot) },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 3000)
        if (state == 0) then
          state = setOnceListener({
            { repairFinish = map.repair.isRepairPage },
            { repairPage = map.repair.isSlotNotEmpty(slot) },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "repairFinish") then

        stepLabel:setStepLabelContent("4-14.完成维修")
        map.repair.clickBackToHomeBtn()
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { returnToHome = map.expedition.isBattleExpedition },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("4-15.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        stepLabel:setStepLabelContent("4-16.维修结束")
        state = 0
        return true, needRepair
      end
    end


    return true, needRepair
  end
  -- 修理

  -- 演习
  gomission.exerciseOnce = function(chapter, pursue, quickRepair, fleet, maxBattleNum)
    stepLabel:setStepLabelContent("5-1.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
      { thePage = map.exercise.isBattlePage },
      -- 检测是否已在战斗中
      { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
      { battleStartPage = map.battle.battle.isBattleStartPage },
      { formationPage = map.battle.battle.isFormationPage },
      { pursueModal = map.battle.battle.isPursueModal },
      { victoryPage = map.battle.battle.isVictoryPage },
      { medalModal = map.home.isMedalModal },
      { isHome2 = map.home.isHome },
    })

    local quickSupplyCount = 0
    local quickRepairCount = 0
    local battleNum = 1
    local HPIsSafe = true
    while (state ~= 0) do
      if (state == "isHome") then

        stepLabel:setStepLabelContent("5-2.点击出征")
        map.home.clickBattleBtn()
        state = setOnceListener({
          { thePage = map.exercise.isBattlePage },
          { exercisePage = map.exercise.isExercisePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { thePage = map.exercise.isBattlePage },
            { exercisePage = map.exercise.isExercisePage },
          })
        end

      elseif (state == "thePage") then

        stepLabel:setStepLabelContent("5-3.点击演习")
        map.exercise.clickExerciseBtn()
        stepLabel:setStepLabelContent("5-4.等待演习页面")

        state = setOnceListener({
          { exercisePage = map.exercise.isExercisePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { thePage = map.exercise.isBattlePage },
            { exercisePage = map.exercise.isExercisePage },
          })
        end

      elseif (state == "exercisePage") then

        mSleep(100)
        local res, exeList = map.exercise.isExercisePageHaveExercise()
        local nBtn = exeList[1]
        if (type(nBtn) ~= "nil") then
          map.exercise.clickToNExerciseBtn(nBtn)
          stepLabel:setStepLabelContent("5-5.等待出征准备界面")
          state = setOnceListener({
            { readyBattlePage = map.exercise.isReadyBattlePage },
            { quickSupplyModal = map.exercise.isQuickSupplyModal },
            { quickRepairModal = map.exercise.isQuickRepairModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { thePage = map.exercise.isBattlePage },
              { exercisePage = map.exercise.isExercisePage },
              { readyBattlePage = map.exercise.isReadyBattlePage },
              { quickSupplyModal = map.exercise.isQuickSupplyModal },
              { quickRepairModal = map.exercise.isQuickRepairModal },
            })
          end
        else
          stepLabel:setStepLabelContent("5-6.没有可以挑战的人")
          state = "readyBattleFleetsCantBattle"
        end

      elseif (state == "readyBattlePage") then

        stepLabel:setStepLabelContent("5-7.选择舰队:" .. fleet)
        map.exercise.selectFleet(fleet)
        stepLabel:setStepLabelContent("5-8.检测所有状态正常")
        mSleep(500)
        local res = map.exercise.isReadyBattlePageShipStatusAllRignt()
        if (not res) then
          map.exercise.clickReadyBattlePageQuickSupplyBtn()
          stepLabel:setStepLabelContent("5-9.等待快速补给界面")
          state = setOnceListener({
            { quickSupplyModal = map.exercise.isQuickSupplyModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePage = map.exercise.isReadyBattlePage },
              { quickSupplyModal = map.exercise.isQuickSupplyModal },
            })
          end
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "quickSupplyModal") then

        stepLabel:setStepLabelContent("5-10.快速补给界面")
        stepLabel:setStepLabelContent("5-11.快速补给界面点击确定")
        map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()
        stepLabel:setStepLabelContent("5-12等待出征准备界面")
        quickSupplyCount = quickSupplyCount + 1
        if (quickSupplyCount < 3) then
          state = setOnceListener({
            { readyBattlePage2 = map.exercise.isReadyBattlePage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { quickSupplyModal = map.exercise.isQuickSupplyModal },
              { readyBattlePage2 = map.exercise.isReadyBattlePage },
            })
          end
        else
          stepLabel:setStepLabelContent("5-13.资源数量不足")
          state = "quickSupplyModalFail"
        end

      elseif (state == "quickSupplyModalFail") then

        stepLabel:setStepLabelContent("5-14.点击快速补给关闭")
        mSleep(100)
        map.exercise.clickQuickSupplyModalCloseBtn()
        mSleep(300)
        state = setOnceListener({
          { readyBattleFleetsCantBattle = map.exercise.isReadyBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickSupplyModalFail = map.exercise.isQuickSupplyModal },
            { readyBattleFleetsCantBattle = map.exercise.isReadyBattlePage },
          })
        end

      elseif (state == "readyBattlePage2") then

        stepLabel:setStepLabelContent("5-15.检测血量是否安全")
        mSleep(500)
        local res = map.exercise.isReadyBattlePageShipHPSafe()
        if (not res) then
          state = "readyBattlePageCheckHp"
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "readyBattlePageCheckHp") then

        if (quickRepair) then
          -- 如果快速修理
          stepLabel:setStepLabelContent("5-16.点击快速修理按钮")
          map.exercise.clickQuickRepairBtn()
          stepLabel:setStepLabelContent("5-17.等待快速修理界面")
          state = setOnceListener({
            { quickRepairModal = map.exercise.isQuickRepairModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePageCheckHp = map.exercise.isReadyBattlePage },
              { quickRepairModal = map.exercise.isQuickRepairModal },
            })
          end
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "quickRepairModal") then

        stepLabel:setStepLabelContent("5-18.点击快速修理确定")
        map.exercise.clickQuickRepairModalOkBtn()
        quickRepairCount = quickRepairCount + 1
        stepLabel:setStepLabelContent("5-19.等待出征准备界面")
        if (quickRepairCount < 3) then
          state = setOnceListener({
            { readyBattlePageCheckCanBattle = map.exercise.isReadyBattlePage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { quickRepairModal = map.exercise.isQuickRepairModal },
              { readyBattlePageCheckCanBattle = map.exercise.isReadyBattlePage },
            })
          end
        else
          stepLabel:setStepLabelContent("5-20.快速修理数量不足")
          state = "quickRepairModalFail"
        end

      elseif (state == "quickRepairModalFail") then

        stepLabel:setStepLabelContent("5-21.点击快速修理关闭")
        mSleep(100)
        map.exercise.clickQuickRepairModalCloseBtn()
        mSleep(300)
        state = setOnceListener({
          { readyBattleFleetsCantBattle = map.exercise.isReadyBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickRepairModalFail = map.exercise.isQuickRepairModal },
            { readyBattleFleetsCantBattle = map.exercise.isReadyBattlePage },
          })
        end

      elseif (state == "readyBattlePage4") then

        stepLabel:setStepLabelContent("5-22.再次检测血量是否安全")
        mSleep(500)
        local res = map.exercise.isReadyBattlePageShipHPSafe()
        if (not res) then
          state = "readyBattleFleetsCantBattle"
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "readyBattlePageCheckCanBattle") then

        stepLabel:setStepLabelContent("5-23.检测舰队可以出征")
        mSleep(500)
        local fleetCanBattle = map.exercise.isFleetsCanBattle()
        if (not fleetCanBattle) then
          state = "readyBattleFleetsCantBattle"
        else
          stepLabel:setStepLabelContent("5-24.等待出征准备界面，...")
          state = setOnceListener({
            { readyBattlePageCanBattle = map.exercise.isReadyBattlePage },
            { battleStartPage = map.exercise.isBattleStartPage },
            { formationPage = map.exercise.isFormationPage },
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
            { medalModal = map.home.isMedalModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePageCheckCanBattle = map.exercise.isReadyBattlePage },
              { readyBattlePageCanBattle = map.exercise.isReadyBattlePage },
              { battleStartPage = map.exercise.isBattleStartPage },
              { formationPage = map.exercise.isFormationPage },
              { pursueModal = map.exercise.isPursueModal },
              { victoryPage = map.exercise.isVictoryPage },
              { medalModal = map.home.isMedalModal },
              { isHome2 = map.home.isHome },
            })
          end
        end

      elseif (state == "readyBattlePageCanBattle") then

        stepLabel:setStepLabelContent("5-25.出征准备界面")
        stepLabel:setStepLabelContent("5-26.点击出征开始")
        mSleep(100)
        map.exercise.clickBattleStartBtn()
        state = "startBattle"

      elseif (state == "startBattle") then

        stepLabel:setStepLabelContent("5-27.等待开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面")
        state = setOnceListener({
          { battleStartPage = map.exercise.isBattleStartPage },
          { formationPage = map.exercise.isFormationPage },
          { pursueModal = map.exercise.isPursueModal },
          { victoryPage = map.exercise.isVictoryPage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { readyBattlePageCheckCanBattle = map.exercise.isReadyBattlePage },
            { battleStartPage = map.exercise.isBattleStartPage },
            { formationPage = map.exercise.isFormationPage },
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "battleStartPage") then

        stepLabel:setStepLabelContent("5-28.开始面板，点击开始")
        mSleep(100)
        map.exercise.clickBattleStartModalStartBtn()
        stepLabel:setStepLabelContent("5-29.等待阵型面板，追击面板，胜利界面")
        state = setOnceListener({
          { formationPage = map.exercise.isFormationPage },
          { pursueModal = map.exercise.isPursueModal },
          { victoryPage = map.exercise.isVictoryPage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { battleStartPage = map.exercise.isBattleStartPage },
            { formationPage = map.exercise.isFormationPage },
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
          })
        end

      elseif (state == "formationPage") then

        stepLabel:setStepLabelContent("5-30.阵型面板")
        mSleep(100)
        map.exercise.clickFormationPageStartBtn()
        stepLabel:setStepLabelContent("5-31.等待追击面板，胜利界面")
        state = setOnceListener({
          { pursueModal = map.exercise.isPursueModal },
          { victoryPage = map.exercise.isVictoryPage },
          { victoryPageNext = map.exercise.isVictoryPage2 },
          { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { formationPage = map.exercise.isFormationPage },
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
          })
        end

      elseif (state == "pursueModal") then

        stepLabel:setStepLabelContent("5-32.追击面板")
        mSleep(100)
        if (pursue) then
          stepLabel:setStepLabelContent("5-33.追击")
          map.exercise.clickPursueModalOk()
        else
          stepLabel:setStepLabelContent("5-34.放弃追击")
          map.exercise.clickPursuePageCancel()
        end
        stepLabel:setStepLabelContent("5-35.等待胜利界面")
        state = setOnceListener({
          { victoryPage = map.exercise.isVictoryPage },
          { victoryPageNext = map.exercise.isVictoryPage2 },
          { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "victoryPage") then

        mSleep(1000)
        stepLabel:setStepLabelContent("5-36.胜利界面检测HP是否安全")
        mSleep(300)
        HPIsSafe = map.exercise.isVictoryPageShipHPSafe()
        if (HPIsSafe) then
          stepLabel:setStepLabelContent("5-37.HP安全")
        else
          stepLabel:setStepLabelContent("5-38.HP不安全")
        end
        mSleep(200)
        stepLabel:setStepLabelContent("5-39.点击胜利继续")
        mSleep(200)
        map.exercise.clickVictoryPageContinueBtn()
        stepLabel:setStepLabelContent("5-40.等待胜利继续界面")
        state = setOnceListener({
          { victoryPageNext = map.exercise.isVictoryPage2 },
          { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPage = map.exercise.isVictoryPage },
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "victoryPageNext") then

        stepLabel:setStepLabelContent("5-41.点击胜利继续")
        map.exercise.clickVictoryPageContinueBtn2()
        stepLabel:setStepLabelContent("5-42.等待演习界面")
        state = setOnceListener({
          { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "victoryOpponentDetailPage") then
        stepLabel:setStepLabelContent("5-41.点击关闭挑战")
        map.exercise.clickVictoryOpponentDetailPageClose()
        stepLabel:setStepLabelContent("5-42.等待勋章对话框，home")
        state = setOnceListener({
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
          isHome2 = map.home.isHome
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "exercisePage2") then

        stepLabel:setStepLabelContent("5-43.点击回港")
        map.exercise.clickBackToHomeBtn()
        stepLabel:setStepLabelContent("5-44.等待勋章对话框，home")
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "readyBattleFleetsCantBattle") then

        stepLabel:setStepLabelContent("5-45.舰队无法继续战斗")
        map.exercise.clickReadyBattlePageBackBtn()
        stepLabel:setStepLabelContent("5-46.等待出征界面")
        state = setOnceListener({
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        })

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("5-48.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        stepLabel:setStepLabelContent("5-49.演习结束")
        state = 0
        return true, HPIsSafe
      end
    end
  end

  -- 演习
  return gomission
end
end
end

do
local _ENV = _ENV
package.preload[ "src/KeepScreenHock" ] = function( ... ) local arg = _G.arg;
-- 全局函数生成，由于部分计算过程不想暴露所以用了闭包

local __tmp = (function()
  local __keepScreen = keepScreen
  keepScreen = nil
  keepScreenState = false
  keepScreen = function(...)
    keepScreenState = select(1, ...)
    return __keepScreen(...)
  end
end)()

end
end

do
local _ENV = _ENV
package.preload[ "src/StepLabel" ] = function( ... ) local arg = _G.arg;
return (function()
  local StepLable = {
    originText = "",
    text = "",
  }
  fwShowWnd("steplabel", 300, 50, 300, 100, 0)

  function StepLable:setStepLabelContent(text, noNLog)
    self.originText = text
    if ((type(runCount) == "number") or (type(runCode) == "string")) then
      text = tostring(runCount) .. ".. " .. text
    end
    self.text = text
    fwShowButton("steplabel", "stopbtn", text, "90333333", "90FFFFFF", "", 28, 0, 0, 300, 100)
    if (not noNLog) then
      local dateStr = os.date("%Y-%m-%d %X")
      wLog("shipr1-1", "[DATE] " .. text);
      nLog(dateStr .. " " .. text)
    end
  end

  function StepLable:getText()
    return StepLable.originText
  end

  return StepLable
end)()
end
end

package.preload[ "src/TSLib" ] = assert( (loadstring or load)(
"\27TS1R\000\1\4\4\4\8\000\25�\r\
\26\
\000\9\20 �@L{\000�z\r���jr\rW\4��]\16�7Xh_\4�j��Tn�Z/Z�\r\9\20 SE� #��P���5�0�20\8t\0256\8t\25\6(:.X�p>]��5\8�-\14��Mq�B�D\24\9v\25\16\9v\0252&z\000�-�t���N��;|\"�\11<V�\9iȹ�y�!�o\1,\8\6 �o<\7�\26WZ`\24�h[l�\23vR�B\000\14\8\8 �\
�\5V��\28{�\18;B\\oD��=���\11\8qV4\18�t�\9�R�(��\21/A\23O?\1)�6��c =Z\22\4��`T��� e\000\000\000-\8\8\8H\8\8\8U��\8�\8�\8�H�\8-I\8\8\000\8\9�-�\8\8\000\8��-�\8\8\000\8\9�-\9\9\8\000\8��-I\9\8\000\8\9�-�\9\8\000\8��-�\9\8\000\8\9�-\9\
\8\000\8��-I\
\8\000\8\9�-�\
\8\000\8��-�\2\000\8\000\1�%\1\3\000\8\000��%A\3\000\8\000\1�%�\3\000\8\000��%�\3\000\8\000\1�%\1\4\000\8\000��%A\4\000\8\000\1�%�\4\000\8\000��%�\4\000\8\000\1�%\1\5\000\8\000��%A\5\000\8\000\1�%�\5\000\8\000��%�\5\000\8\000\1�%\1\6\000\8\000��%A\6\000\8\000\1�%�\6\000\8\000��%�\6\000\8\000\1�%\1\7\000\8\000��%A\7\000\8\000\1�%�\7\000\8\000��%�\7\000\8\000\1�%\1\8\000\8\000��%A\8\000\8\000\1�%�\8\000\8\000��\6�H\000\8\000\1�%�\8\000\8\000��%\1\9\000\8\000\1�%A\9\000F�I\000J\1\1�e�\9\000\8@��e�\9\000\8@\1�e\1\
\000\8@��eA\
\000\8@\1�e�\
\000\8@��e�\
\000\8@\1�e\1\11\000\8@��eA\11\000\8@\1�e�\11\000\8@��\31\000�\000\3\7\21 s66#\6\3\16I\25�W\0145�\000@\12\1\000\000\000\1\000\8\7!\25�y�$�\11�p��\23\30\
�%\127\24$CYPM�5���A�@�,EX�;2\000\000\000\4\8\000\000\000�������\4\
\000\000\000���������\4\11\000\000\000����������\4\4\000\000\000����\4\
\000\000\000����������\4\11\000\000\000�����������\4\7\000\000\000������\4\12\000\000\000�����������\4\12\000\000\000�����������\4\11\000\000\000����������\4\17\000\000\000����������������\4\17\000\000\000����������������\4\9\000\000\000��������\4\9\000\000\000��������\4\8\000\000\000�������\4\11\000\000\000����������\4\12\000\000\000������������\4\9\000\000\000��������\4\12\000\000\000�����������\4\15\000\000\000��������������\4\9\000\000\000��������\4\
\000\000\000���������\4\16\000\000\000���������������\4\8\000\000\000�������\4\8\000\000\000�������\4\9\000\000\000�������Ѐ\4\4\000\000\000���\4\11\000\000\000����������\4\11\000\000\000�����������\4\9\000\000\000��������\4\8\000\000\000�������\4\9\000\000\000��������\4\16\000\000\000���������������\4\r\000\000\000������������\4\11\000\000\000���������ր\4\15\000\000\000��������������\4\12\000\000\000�����������\4\18\000\000\000�����������������\4\
\000\000\000���������\4\3\000\000\000�ǀ\4\
\000\000\000���������\4\6\000\000\000������\4\12\000\000\000�����������\4\14\000\000\000�������������\4\
\000\000\000���������\4\6\000\000\000������\4\11\000\000\000����������\4#\000\000\000����������������������������������\4\7\000\000\000�����ɀ\4\8\000\000\000�������/\000\000\000\11\9\20 ��\22D_l\25Fm\3\9\20 4��fw�+=�ӅL\16��\20���+9�\"�o�E\8\r�;| !lM�\23'}\8t\0254\8t\25�Y{n&\25$\11�\7��mu\25\9v\25\18\9v\25���Z�>D3�\20�\11U�Y\30�5N f��0\25SZbgc�[\
�&)��\22O\000(\8\6 �b=m\000\000\8\8 \6��('Av\7S�\18|}�\
f�\20�Sc��\16�U�\17,\2�vHyV4\18�\"�b\31\000\000\000C�IH\14H\8HB\8H�\14\8\8HB\8��\14�\8HB\8H�\14�\8\000\
@��K�\000\000�\000A\000�@A\1J����\000A\000��A\1J�\000�\
@\000�K@\000\000��A\000�\000B\1J�\000�\
@��e\000\000\000�@\000\000�\000\000\11�\000\000\
���\
�\000�\
A��\31\1\000\1\31\000�\000\8\7\21 \127M�*��2^�$�!�@\0252\127��S[&�h:$�\12(��\6\1;�t��L+\5\2\16I\25h\26�%�9�\r8��\2\1\000\000\000\000\000\6\7!\25i�\\�'�}\8R�;���q���&/�cC��\000n\12\000\000\000\4\9\000\000\000\25\2\3\24\000\15\8\31m\4\5\000\000\000\25\20\29\8m\4\6\000\000\000\8\31\31\2\31m\4\7\000\000\000\30\8\1\8\14\25m\4\7\000\000\000\30\25\31\4\3\
m\4\7\000\000\000\11\2\31\000\12\25m\4\5\000\000\000\11\4\3\9m\4\6\000\000\000\9\8\15\24\
m\4\8\000\000\000\
\8\25\4\3\11\2m\4\8\000\000\0009\30.\5\8\14\6m\4\
\000\000\000\2\29\0252\27\12\1\24\8m\4\8\000\000\000\15\12\0092\12\31\
m\3\000\000\000\11\9\20 ʵ'J�a�k�\12\9\20 ���w�1�d�W�F��\12B \25�L(\8t\0258\8t\25e��<���c�24\\\1\20�XH0]I\30�&O5\15�;�]0\24\23\9v\25\18\9v\25���Tkp�l\16;�\21\24��\27]�u^�<�\24��O<e��En(�\14�&B@\000 \8\6 ?#�Sl�i\
��\16g���\\�Fa\31�e�^z�mA���evc� \6\11\8\8 �Q#\16�3�]t�\15r�{V4\18�(m;�]~;\18W�r:\000\000\000q���7�w�jv���������w����qv��p6��:��ujv��1����u��*v���76��w\000�ǁA\3�A\000\000\23\000\000��\1\2\000\6BA\000GBB\3\29�\000\1\24�A\4\23�\000�\7BB\3\27B\000\000\23�\1�\6BA\000@\2\000\000\29�\000\1\24�A\4\23@\000�\28B\000\000\23\000\000�\1�\2\000X\000B\2\23@\1�F�A\000G��\4�\2\3\000�\2\000\2]��\1\000\1�\4FBC\000��A\000��B\5��\3\000\000\3�\000@\3\000\1�\3�\3�\3\000\4\000\4�\1@\4\000\2��\000\4�B��^\2�\1_\2\000\000\31\000�\000\8\7\21 ^�r~�\20nG$��@o�\12\20�Yc��\12\31n��,�H�\31� �d�%^;\18\3\16I\25\12g�_\28I[\15\1\000\000\000\1\000\11\7!\25\12\15\6G��Clɒ�\9�t�%Nֱ-v1�o\17�yF���;t��\127�\0114$\16\000\000\000\4\9\000\000\000���������\3\000\000\000\000\000\000\000\000\4\6\000\000\000������\4\8\000\000\000��������\3\000\000\000\000\000\000\000@\4\5\000\000\000�����\4\9\000\000\000���������\4\7\000\000\000�������\4\1\000\000\000�\4\5\000\000\000�����\4\2\000\000\000��\4\7\000\000\000�������\4\12\000\000\000��\19Ha\19~F�Ӆ�\4\6\000\000\000������\4D\000\000\000\16j\\\30uK\16~f\19|i\30If\30Wz�\19yt\16cF\19Ly\19yA��ӒӅ�\19qK\16cF�Ӆ��Ӆ���\31jv\30Pw�Ӆ�Ӆ��\3\000\000\000\000\000\000\8@\000\000\000\000\26pi\23#\8\29l�S�Z\26�vi�e�'۪WM�v\20=O�\r&���\20\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 �y�B�\5�^�\000�s�\5�]�ƴ\1�C�\3�Η-U��p�BX1u\15\9\20 �0{\28\\�\25i_��+�F�li��n�*�)\30\8t\0251\8t\25�%\28G\2\9v\25\31\9v\25���h�A�Q,y4t\000d%,�F�\22���&�m�\8\1.\8\6 Y&�[���<���~韷\30y\3�\27m�DrѥJ|\2\r\8\8 _��u�t�)�q`\14:\18L'��/�~V4\18H��\24[\20D=}�q0�H�\7\24?�f�u�cV\000\000\000g��!���|a�๡�����ad�a� a��� �����`���'������<���|���g��!�a�|a�๡�����ad�a� a���`\1\000A�\1\000�A\1\000�\1@\000\000\2�\000�\1\000\1�@\000\000�\000B\000�@\2\000&\1\000\000��\000\000\25\000\000\1\23\000\2��\000�\000\1�\2\000@\1\000\000��\2\000�\1�\000\1�\2\000�\000\000\3�\000\000\000\23@\
��\000B\000\000\1\000\000f\1\000\000݀\000\000\6AA\000\7\1C\2@\1�\000�A\000\000\29��\1\27\1\000\000\23@\2�\6AC\000@\1�\1\29�\000\1\27\1\000\000\23\000\1�\6AC\000@\1�\1\30\1\000\1\31\1\000\000\23\000\5�\6AA\000\7\1C\2@\1�\000�\1@\000�\1�\1�\1\000\1\29�\000\000\27A\000\000\23�\2�\5\1�\000A�\2\000�\1\000\000��\2\000\000\2�\000F\2@\000�\2�\1]\2\000\1\30\1\000\000\31\1\000\000\23\000\000��\000\000\1\31\000�\000\1\7\21 �\28�\0099%�LK�� \11\3\16I\25:��x3�Y7\2\000\000\000\1\000\1\1\5\7!\25\14��\1)aN\4�MP\000��r>\14\000\000\000\4\5\000\000\000\1\12\5\16u\4\7\000\000\000\27\000\24\23\16\7u\4\8\000\000\000!\0066\29\16\22\30u\3\000\000\000\000\000\000�?\4\12\000\000\000]\20\7\18*\22\26\000\27\1\\u\4\7\000\000\000\6\1\7\28\27\18u\3\000\000\000\000\000\000\000@\4\16\000\000\000]\16\r\5\16\22\1\16\17*\1\12\5\16\\u\4\7\000\000\000\6\16\25\16\22\1u\4\2\000\000\000Vu\4\1\000\000\000u\4\9\000\000\000\27\26U\3\20\25\000\16u\4\5\000\000\000\19\28\27\17u\4\9\000\000\000\1\26\27\000\24\23\16\7u\000\000\000\000\17pi\23��\7\31@�\31ZGw7u\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 j}P|o��\26��\26+�(;iI\
\9\20 �\24|\3t:�\25��iXw\8t\0251\8t\25ԍ\25&(\9v\25\18\9v\25\22��\17/>�B�4�e\000*fZ��L\\{Rfe��\"b�V�mI��a���R\1,\8\6 �3\31I�֥X�\8yH�-9\rs��6\3\1\8\8 y\r�\25 ��\25Q\2�\6��4�X�D�*\15p���2�t�\29�C�s-~V4\18���\24�{�r g�\31���*\26��5ޛ�\5h\000\000\000�-m--,--�-,um�,:-/��-�-,�--l�--�,,-�l--+/m-m/--0/-,�m--�-m--,�-�-,um�,:-/��-�-,�--l�,-��,-�l,-+/m-m/�-\29\2\000\1�@\000\000�@A\000�\000�\1\000\1�\000F\1@\000�\1\000\1]\1\000\1݀\000\000�@\000\000\23@\3��\000@\000\000\1\000\1݀\000\1X@�\1\23\000\2��\000�\000\1�\000\000A�\2\000��\2\000�\1�\000\6\2@\000@\2\000\1\29\2\000\1�@\000\000�\000C\000\1A\3\000f\1\000\000݀\000\000\25\000�\1\23@\000��\000\000\1\23�\
�\6\1C\000@\1\000\000�\1\000\000\29�\000\000FAA\000G\1�\2�\1�\000�A\000\000]��\1[\1\000\000\23@\2�F�C\000�\1\000\2]�\000\1[\1\000\000\23\000\1�F�C\000�\1\000\2^\1\000\1_\1\000\000\23�\5�FAA\000G\1�\2�\1�\000�\1@\000\000\2\000\2�\1\000\1]�\000\000[A\000\000\23\000\3�E\1�\000��\3\000�\1\000\000\1�\3\000A\2\4\000�\2�\000V��\4�\2@\000�\2\000\2�\2\000\1^\1\000\000_\1\000\000\23\000\000�\31\1\000\1\31\000�\000\1\7\21 ���\17Y��j��\25g\12\8\16I\25���LFS�9�в\26���\21�)�\18��+cC\7\14#_�@I�^�m\2\000\000\000\1\000\1\1\11\7!\25\127]�b1a�t�\7qq(��'\23��dI�i$�*FE��\29Xa�Dq�k5;\17\000\000\000\4\5\000\000\000=09,I\4\7\000\000\000'<$+,;I\4\
\000\000\000&9=\22?(%<,I\3\000\000\000\000\000\000�?\4\12\000\000\000a(;.\22*&<'=`I\4\7\000\000\000:=; '.I\3\000\000\000\000\000\000\000@\4\16\000\000\000a,19,*=,-\22=09,`I\4\5\000\000\000/ '-I\4\4\000\000\000' %I\3\000\000\000\000\000\000\8@\4\14\000\000\000a-,/(<%=\22?(%`I\4\7\000\000\000:,%,*=I\4\2\000\000\000jI\4\9\000\000\000=&'<$+,;I\4\1\000\000\000I\4\5\000\000\000&9=gI\000\000\000\000\27pi\23L%9d���Z�/�\27g��\25�nx`�� \27r�+\12]cK5r�\7\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\16pi\23�\2\25\24|ŜA\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 79\8c1\15\9\20 \20?\0058,��\15��7T�n�M*a.x�~�%e\8t\0256\8t\25\26�Bg���Y\22�\26D��7\0003��3_��\31K\9v\25\25\9v\25}\1&d\000+\8\6 \29��O���\26\000\15\8\8 Q�\0193�\9�\18z��*\30��S�\rUV\22S�\17�OX-5{V4\18\17�`\16�\15+\26 �\5,\3\000\000\000455\000\31\000\000\1\31\000�\000\4\7\21 ��**\21�=\000\0177I\22�>Y\"�\16�%�\4:'\2\000\16I\25��}\127\000\000\000\000\7\7!\25�\18�\9�H%3b�?\11�\3\21eAJK\0233z�/\1\000\000\000\4\8\000\000\000\000\31\000\31\9\31\0001\000\000\000\000\27pi\23�\11\0242���iS|�g�\21�D\27��\20qu�;�#%\0271��&K��h\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 \5��x�z�L�\12\9\20 N��Rxg�_Xr9\0282��<�\3/fR\8t\0251\8t\25���'O\9v\25\26\9v\25��Gݠ=l\1 \8\6 ;!Swu\15{\17�\20}F9��#vz�x|��\9ѫ�\2�,�l\27��.\000\
\8\8 7d�S���`�pV4\18\15\20�\3���Q�\"\6y��NP\9W�U�\23d3�-2#��X54\000\000\000�А�א�ЖP�Ѝ�P�͐����PБ\16��Q���6����P�Е�P�Q���\17���&\1\000\000]�\000\000�\000\000\1��\1\000\1\1\1\000F\1@\000G��\2�\1\2\000�A\2\000]��\1�\1\000\000��\000\000�\000@\000���\1\1�\000\000A�\2\000݀�\1\6�B\000@\1�\1�\1\000\000�\1�\000\29A\000\2\6\1C\000A�\000\000\29A\000\1\6AC\000@\1�\1�\1\000\000�\1�\000\29A\000\2\6\1C\000@\1\000\1\29A\000\1\6�C\000@\1�\1�\1\000\000�\1�\000\29A\000\2\31\000�\000\7\7\21 '��_l\27v��\3���\7uY�}\8\000\16I\25�w1t\3\000\000\000\000\000\1\2\1\3\7\7!\25���B7��\5���7�G\127f�\1�~[�\127A\15\000\000\000\4\5\000\000\000�����\4\11\000\000\000�����������\4\
\000\000\000����������\3\000\000\000\000\000\000�?\4\7\000\000\000�������\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\4\7\000\000\000�������\3\000\000\000\000\000\000>@\3\000\000\000\000\000\000I@\3\000\000\000\000\000\000\"@\4\
\000\000\000����������\4\7\000\000\000�������\4\
\000\000\000����������\4\8\000\000\000��������\000\000\000\000\22pi\23;.$kv�Tp\6�R)r��>\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 �MB ���}]�'z\30%\0055'\22p\127N��x�\19co�\000\9\20 �/@Zf%�j��\17\27�ج\21�8�\11!ȵS\27\26�H�6�*�>\9\6^\8t\0254\8t\25f�\31Y`zLB\r\16�(s�h.{\9v\25\27\9v\25�Q�/T$nU\24�`*\1/\8\6 j�e\31�_\16\18D\22_\0178\18�?�^�\15���\11\000\9\8\8 �t`\15\\\127V4\18\rK�\8���:�zP>sp�s���U�S�SJ�F\1278\000\000\000Y\\\\\\\29\\\\\\�\28\\\\�\\\\\\A�\\\\\25\\\\\\��\\\\�\28\\\\z]\\\\\1�\\\\�\\�\\��\\\\]\29\\\\\29]]\\�\1\000\000��\000\000�@A\1ǀ�\1\6�A\1\29\1�\000�@\000\000�@A\1�\000�\1\19\1\000\1@\1\000\1݀�\1\r�\000\000�@A\1�\000�\1\19\1\000\1@\1\000\1݀�\1M��\000�@B\1\1\1\000\000@\1\000\000�\1�\000�@\000\2ƀB\1\1\1\000\000@\1\000\000�\1�\000�@\000\2��B\1\6AA\1\7\1B\2A\1\3\000�A\3\000\29\1�\1�@\000\000ƀC\1\1\1\000\000@\1\000\000�\1�\000�@\000\2\31\000�\000\3\7\21 �m�\28\7\3\16I\25R�v/��\31\4\3\000\000\000\1\2\1\3\000\000\7\7!\25�\28�q���,�>�1L\16\0221�Q�\\�b-\7\15\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�������\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\20@\4\5\000\000\000�����\4\11\000\000\000�����������\4\
\000\000\000����������\4\7\000\000\000�������\4\
\000\000\000����������\4\
\000\000\000����������\4\7\000\000\000�������\3\000\000\000\000\000\000D@\3\000\000\000\000\000\000N@\4\8\000\000\000��������\000\000\000\000\24pi\23'�\9hg'�&\2\14�mk�hy�9;f�lw}\12��\4�p�Zb��\12��\9\9\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 ���\20�\15VaH<\31x��\4t�{sO#ʛe�y#أ(]\
\
\9\20 5��ak�K���L�\8t\0259\8t\25�2�T��0\rO�\127s�I�\18!�&�Q��GBw�,iR�hw\9v\25\30\9v\25�\12�1��'y�y�G�\6W\20\21\3�:\0080�\23\1-\8\6 շ�O�?�xc*�Uҫ�C\000\r\8\8 ��B;�Q\1gX_�%�}G\18\21 \12`�zV4\18���,��hpu\000\000\000����ѐ��\17А�v����\16��Ր��\17\16��QА������\16��\21�\16�QP���ѐ�ё��6���\r\16��u�����\16�ё��\17ё��\17\16��ѐ����\16�\17��\16�\16�C�\16���\16�\r\17\16�\29\17��P\1�\1\19\2�\2@\2�\2݁�\1���\000\6�A\1@\2\000\2�\2\000\3�\2�\3\29B\000\2\000\2�\1A\2\2\000��\1\000\29��\1A\2\000\000�\2\000\4�\2\000\000a\2\
�\26�@\4\23�\4�FCB\1�\3�\1��\2\000\1�\2\000�\3�\1]C\000\000F\3C\1�\3\000\2�\3�\1\19\4�\2@\4�\2݃�\1��\3\3\000\4�\1S\4�\2�\4�\2\29��\1\r\4�\3]C\000\2\23�\4�FCB\1�\3�\1��\2\000\1\4\1\000�\3�\1]C\000\000F\3C\1�\3\000\2�\3�\1\19\4�\2@\4�\2݃�\1��\3\3\000\4�\1S\4�\2�\4�\2\29��\1\r\4�\3]C\000\2`B�\127FBB\1�\2�\1�B\3\000\1�\2\000�\2�\1]B\000\000\24\000B\4\23@\1�F�C\1�\2\000\2�\2\000\3\000\3�\3]B\000\2\23\000\3�F�C\1�\2\000\2�\2�\1\19\3�\2@\3�\2݂�\1��\2\3\000\3�\1S\3�\2�\3�\2\29��\1\r\3�\3]B\000\2\31\000�\000\8\7\21 ��{]�G[p^��|~��~MnUB,^�>��\22+��\7+cg�Z��\\\19\000\16I\25��N\"\3\000\000\000\1\2\1\3\000\000\3\7!\25Y\127�^�\16�9\15\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000d\127ghox\
\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\0004@\3\000\000\000\000\000\000\"@\3\000\000\000\000\000\000\20@\4\
\000\000\000~e\127ibNe}d\
\3\000\000\000\000\000\000\000\000\4\7\000\000\000gYfooz\
\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000Y@\4\
\000\000\000~e\127ibGe|o\
\3\000\000\000\000\000\000>@\4\8\000\000\000~e\127ib_z\
\1\000\000\000\r\9\20 ;��*@�'�.���\12�\14\9\20 ˃�\11�FOZu��&{��Z�\"c]`�K�n�\1F\8t\0255\8t\25x\\�\23?��\0147H�\25�oi0Q��Kk\9v\25\17\9v\25��\21Q���\21B��\0247�\25:s\7\22���k��P)\r��:�8�\23\1-\8\6 �H�\4��lB5i>\4��^3\000\9\8\8 ��\02255~V4\18\0317f\15���c���5\8Z�l\2��/�Bu7\11\000\000\00035u52uu5s�u\000]\000�\000\29@\000\000\6\000@\000\7�@\000f\000\000\000\30\000\000\000\31\000\000\000\31\000�\000\11\7\21 z\12<G&��E\17�!A9|�wxk�\17o��d R�HV;�'��~}\2\2\16I\25���=8�Vi���\11\1\000\000\000\000\2\11\7!\25��\5\1�>Xhv\127�|��rC\4��l;y-0YW�\18���!gH*mۛ�m\4\000\000\000\4\5\000\000\000�����\4\11\000\000\000�����������\4\
\000\000\000����������\4\7\000\000\000�������\000\000\000\000\23pi\23\9\14\2Q�o�#�)�\29\11��\000��b[\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\26pi\23���G�a!�]�\6�Fp?^\3�2\8Yhkߘ+\8�>yZ\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 jIX:��3V6��\2�S�b\\��\2hج\11?��nI]�bI\3\9\20 �s!d��dg�<]Uh>\r\30ܷ�Y��P2$E�\1��\31;Q��\31�;�b�\8t\0259\8t\0257|F._�\
\"���@��-gɤI`W\28r$\6��\20\18\2�w�l�:�\9v\25\30\9v\25|K.2�=�\16��g%(��\20\r��\19\4�\0201\1 \8\6 WVov��#\14�v?k\3ʐZ�]�u.��@k\8�x�\21KO���r\000\14\8\8 M�j\
\5;�\18#�1]J��\21<��@��<\127�~V4\18L,�_m�5{���<^.\\We.�5\\��_j\000\000\000���Ք���T���3����U�Ր���TU��\20������ՈU��P���\20\21��Ԕ�ճ���HU��\16������Ք���s���\8U����UՔ���T���\20T�������T�ՐԀ\000��\1\000�A\000\000\1\2\2\000f\2\000\000]�\000\000�AB\1��B\3΁\000\000��\000\1�AB\1ǁ�\3\14\000݁\000\1\4\2\000\1\25��\3\23�\000�\16\2\1\3@\2\000\2�\2�\3\23�\000�\16\2�\3P\2\2\3�\2\000\2\25\000\000\1\23�\000��\2�\4����\23\000\000��@��\25@�\1\23�\000��\2\000\5��\2�\23\000\000���\2��BB\1�B�\5\6�C\1\29\3�\000�B\000\000�BB\1���\5\1\3\000\000A\3\4\000݂�\1\6CD\1@\3�\5�\3\000\000�\3�\000\29C\000\2\6�D\1A�\4\000\29C\000\1\1\3\000\000@\3\000\4�\3\000\000!�\2�\6�B\1\r\000\4\000\6\4C\1M\000�\000\6\4E\1@\4�\5�\4\000\000�\4�\000\29D\000\2\6�D\1A�\1\000\29D\000\1 ��\127\6�D\1@\3�\2\29C\000\1\6CE\1@\3�\5�\3\000\1�\3�\1\29C\000\2\31\000�\000\5\7\21 \22l�F��.\5\3\25A\30#e�Z��C6kw�!z�\23Q\20\2\16I\25��1\r~��+���9\3\000\000\000\1\2\1\3\000\000\000\7!\25�F$\22\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000'<$+,;I\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000I@\4\5\000\000\000$(=!I\4\4\000\000\000(+:I\4\3\000\000\0001zI\4\3\000\000\0000zI\4\11\000\000\000;('-&$:,,-I\4\
\000\000\000.,=\27'-\7<$I\4\7\000\000\000;('-&$I\3\000\000\000\000\000\000\"@\4\
\000\000\000=&<*!\r&>'I\4\7\000\000\000$\26%,,9I\3\000\000\000\000\000\000Y@\4\
\000\000\000=&<*!\4&?,I\4\8\000\000\000=&<*!\0289I\000\000\000\000\26pi\23�0�@yۊ\30�@�\19�khS�d�{�\7l)\15#[\20\31��z\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 �q�4���&�Tnq�&}j\
\9\20 �e\26t��w&�\27_�\8t\0257\8t\25�ck\28>��O2k�$z|�\16o��\27^/X\9��\16W�\9v\25\26\9v\25ω{\24���Q\1+\8\6 ��\7f�Dv[\000\
\8\8 Jȶ\7\28��!\12\127V4\18�,%Y`��,p\19�W���\r\1�iSR�*F\24+\16\11\\\000\000\000\9\12\12\12M\12\12\12�L\12\12�\12\12\12\17�\12\12I\12\12\12��\12\12�L\12\12*\r\12\12Q�\12\12�\12\12\12��\12\12\rM\12\12j\r\12\12��\12\12�\12\12\12\r\r\r\12MM\12\12�\r\12\12ь\12\12\9\r�\12MM\r\12�M\12\12��\1\000&\2\000\000\29�\000\000�\000\000\1P\1�\1��A\1�\1B\3��A\1�A�\3\000\2\000\1�\1\000\1��\000\000��\1\2��A\1ǁ�\3\6�A\1\7BB\4@\2\000\1\29\2\000\1݁\000\000��\1\2\6�B\1A\2\3\000�\2\000\000�\2�\000\29B\000\2\6BC\1A�\3\000\29B\000\1\1\2\000\000@\2�\2�\2\000\000!B\2�\r�\1\000M��\000\6�C\1A\3\3\000�\3\000\000�\3�\000\29C\000\2\6CC\1A�\1\000\29C\000\1 \2�\127\6BC\1A\2\4\000\29B\000\1\6BD\1A\2\3\000��A\1�\2B\5��A\1�B�\5\000\3\000\1�\2\000\1��\000\000���\1��\2\000��A\1ǂ�\5\6�A\1\7CB\6@\3\000\1\29\3\000\1݂\000\000�\1�\000\29B\000\2\31\000�\000\11\7\21 �\1c<��*\127�|�`\16�~\27�\31A5/�\22}O�Ck\26�+Z�\\�\r\16\6\16I\25x��ctC�d07�jGD�{\8�b6\r�U\0095D\7b\3\000\000\000\1\2\1\3\000\000\8\7!\25(J�*\127\12�i�Ħ3k�M;�@ Mv��\12�\r�gBT�$\30��\26\18\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000\4\31\7\8\15\24j\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000$@\4\5\000\000\000\7\11\30\2j\4\4\000\000\000\9\5\25j\4\4\000\000\000\24\11\14j\4\4\000\000\000\25\3\4j\4\
\000\000\000\30\5\31\9\2.\5\29\4j\3\000\000\000\000\000\000\000\000\4\7\000\000\000\0079\6\15\15\26j\3\000\000\000\000\000\000Y@\4\
\000\000\000\30\5\31\9\2'\5\28\15j\3\000\000\000\000\000\000I@\4\8\000\000\000\30\5\31\9\2?\26j\000\000\000\000\20pi\23�\9!k6��%p-S$\127\11�'�K�$\17��\4\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 �7w\\<M?I�i\14p}Z\24q�\14\9\20 !p�4gd�>\22\29z\27���o+��uP�K!\127EJ|�\8t\0256\8t\25)�\12\24���^��5\15Ks�\14.�Zq���q�\9v\25\18\9v\25�U�K\\i�+>��\31�4#\1��F!��H\27�6�F��\26Mpt�>�}�&\1+\8\6 ��!\0083�\22\000\9\8\8 C��hU|V4\18�[�'�.�5\5�M?�\4^\29p\000\000\000PUUU\20UUU�\21UU�UUUH�UU\16UUU��UU�\21UUsTUU\8�UU�UUU��UUT\20UU3TUU��UU�UUUTTTU\20\20UU�TUU��UUPT�U\20\20TU�\20UU��TUsWUUH�UU\19�\20T\18T�W��\000\000]�\000\1P��\2��A\1�\1B\3���\000��\000\1��@\3�\1\000\2\25@\1\3\23�\000��\1�\2\000\2\000\2P�\1\3\23�\000��\1\1\3\16\2@\2\000\2\6CB\1A�\2\000\29C\000\1\25\000\000\1\23@\000��\2\000\4\23\000\000��\2\000\4\25@�\1\23@\000��\2�\4\23\000\000��\2�\4\6�B\1A\3\000\000�\3\000\000�\3�\000\29C\000\2\6�B\1A�\000\000�\3\000\1�\3�\1\29C\000\2\6CB\1A�\2\000\29C\000\1\1\3\000\000@\3�\3�\3\000\000!\3\4�\r�\2\000M��\000��\2\1���\1\6\4C\1A\4\000\000�\4\000\000�\4�\000\29D\000\2\6\4C\1A�\000\000�\4\000\1�\4�\1\29D\000\2\6DB\1A�\1\000\29D\000\1 C�\127\6CB\1AC\3\000\29C\000\1\6�C\1A\3\000\000��\000\000��@\7�À\000Ѓ�\7\29C\000\2\6�C\1A�\000\000��\000\000��@\7�À\000Ѓ�\7\29C\000\2\31\000�\000\4\7\21 �Ɨ;i��\3`�*o4fp\26;�\22\19�_\17~\20\2\16I\25�:�\4�[{U/y�W\3\000\000\000\1\2\1\3\000\000\8\7!\0255\19]u���XՓ�Q���\16g�Z\31�\22�\30.)�O�a�E шH\15\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�������\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000$@\4\5\000\000\000�����\4\4\000\000\000����\4\7\000\000\000�������\3\000\000\000\000\000\000Y@\4\
\000\000\000����������\4\
\000\000\000����������\3\000\000\000\000\000\000I@\4\8\000\000\000��������\000\000\000\000\27pi\23-I�\\)�2c\29�@�Z�vRk�2�=>h剸,W�\2r�B�\5\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 �\11U�K\30�y<|\21�\25g\30\8\9\20 O�\7\0258\9t\0255\8t\25�\16�\12�,�e1q�\14�a\9e���a�\9v\25\18\9v\25��A)�?|\20�eB�hj�\25{L��$ � 2P9�X�c�`�,~\r\1#\8\6 Y�\16'��\5p\9��W��u\19\16��O��>�x\
\31e�\31nY]�:�\20$\6\000\9\8\8 إ�5\5}V4\18Ķ�B��\20\5�Y�Ub\24�'?��f�\000\000\000\000\5\5\5D\5\5\5�E\5\5�\5\5\5\24�\5\5@\5\5\5��\5\5�E\5\5#\4\5\5X�\5\5�\5\5\5��\5\5\4D\5\5c\4\5\5��\5\5�\5\5\5\4\4\4\5DD\5\5�\4\5\5؅\5\5\000\4�\5DD\4\5�D\5\5Ą\4\5#\7\5\5\24�\5\5C�D\4B\4�\7��\5\5X�\5\4U��\7��D\4�\4G\6���\000��\000\1��@\3�\1\000\2\25@\1\3\23�\000��\1�\2\000\2\000\2P�\1\3\23�\000��\1\1\3\16\2@\2\000\2\6CB\1A�\2\000\29C\000\1\1\3\000\000\25\000\000\1\23@\000��\2\000\4\23\000\000��\2\000\4\25@�\1\23@\000��\2�\4\23\000\000��\2�\4F�B\1�\3\000\000̓\000\000Ѓ�\7\15�\2\6�\3�\7\rĀ\000\16�@\8O�\2\6\14D\4\8]C\000\2F�B\1��\000\000̓\000\000Ѓ�\7\15�\2\6�\3�\7\rĀ\000\16�@\8O�\2\6\rD\4\8]C\000\2M�\000\000P��\6��\000\000��@\7\000\000�\6MÀ\000P��\6�À\000Ѐ@\7@\000�\6FCB\1��\2\000]C\000\1A\3\000\000�\3�\3�\3\000\000a�\4�\14�\2\000N��\000��\2\1���\1\26\000\4\6\23@\2�F\4C\1�\4\000\000�\4\000\000\000\5�\000]D\000\2F\4C\1��\000\000�\4\000\1\000\5�\1]D\000\2FDB\1��\1\000]D\000\1`��\127FCB\1�C\3\000]C\000\1F�C\1�\3\000\000�\3\000\000\000\4�\000]C\000\2F�C\1��\000\000�\3\000\1\000\4�\1]C\000\2\31\000�\000\3\7\21 4�\6Q\21\9\16I\25��,)v٠9�\3{!�](N���k�<=z��\000/$�?y\3\000\000\000\1\2\1\3\000\000\3\7!\25.�\17V��Ei\15\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000pks|{l\30\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000$@\4\5\000\000\000s\127jv\30\4\4\000\000\000\127|m\30\4\7\000\000\000sMr{{n\30\3\000\000\000\000\000\000Y@\4\
\000\000\000jqk}vZqip\30\4\
\000\000\000jqk}vSqh{\30\3\000\000\000\000\000\000I@\4\8\000\000\000jqk}vKn\30\000\000\000\000\27pi\23�E�iђ\0259\20�5\15o��\008699'n\"�I\30ӵ\14`��@Fȵ\127\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 3\15�h�+�\15�\000\9\20 ���O\4g�[\127�$\30�;*sK\14�-d\20�tB&�[�)�@�\8+\11\29\9t\0253\8t\25�H�Cu)\0024\20��X\17\8v\25\26\9v\25@SPR�D,\19\1*\8\6 �ʶS���Ed;0Y\000\1\8\8 �\22�`'�b\19P�P\26^�k\19\2C�vCh^:���{�n�\6/g�\16�\127V4\0183΃l(��[��pI~܁\26���P�� %a\6=[�\000\000\000����͌��\ř�j����\12��Ɍ��\r\12��M̌������\12��\9���ML���͌�ꍌ�\17\12��I��������͌�*���Q\12����\12��͍�\r͌�M\r�������\r��ɍ\12�\rM��M͌�����ꎌ��\r��\9�\12�M͎��Ό�͎��*���\17\r��J�B\1���\3\6�B\1\7\2C\4F�B\1GB�\4�\000]�\000\1��B\1�BC\5΂\000\000��\000\1P��\4\29\2\000\1݁\000\000\6�B\1\7�C\4F�B\1G��\4��\000\000��\000\000]��\1��B\1��C\5�\000\1�\000\000���\1M��\4\29�\000\1N\2\000\1�B�\1O��\4�\2�\000\24\000D\3\23\000\000�S\2�\4\6CD\1A�\4\000�\3\000\1�\3�\1\29C\000\2\6�D\1A\3\5\000\29C\000\1\1�\4\000@\3\000\2�\3\000\000!\3\14�\25@\2�\23�\000�\14ă\3�\000��\23@\000�\ră\3�\000��\25\000\000\1\23@\2�\6�B\1\7�E\8F�B\1G��\8�DE\1]\4\000\1\29�\000\000\15\4\4\4�\2\4\000\23\000\2�\6�B\1\7�E\8F�B\1G��\8�DE\1]\4\000\1\29�\000\000\15\4\4\4�\2\4\000\25@�\1\23@\2�\6�B\1\7\4F\8F�B\1G��\8�DE\1]\4\000\1\29�\000\000\15\4\4\4�\2�\000\23\000\2�\6�B\1\7\4F\8F�B\1G��\8�DE\1]\4\000\1\29�\000\000\15\4\4\4�\2�\000\6DF\1A�\4\000�\4\000\5�\4�\5\29D\000\2\6�D\1@\4�\2\29D\000\1 C�\127\6�D\1A�\6\000\29C\000\1\6�F\1A�\4\000�\3\000\1�\3�\1\29C\000\2\31\000�\000\11\7\21 A\11�\18\30O�\30��\9\16U�\\k�W\11g\20\29Zb\28܈~}\4[*��\0166\20\7\16I\25�?�\3D\15�*V\127T%\9��\22��\
E�'�8\3\000\000\000\1\2\1\3\000\000\7\7!\25�ci\127F߽4��u\20\6�d\16滛r�\
�j\28\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�������\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000�v@\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000\28@\4\5\000\000\000�����\4\4\000\000\000����\4\5\000\000\000�����\4\4\000\000\000����\4\5\000\000\000�����\4\4\000\000\000����\3\000\000\000\000\000\000�\4\
\000\000\000����������\3\000\000\000\000\000\000\000\000\4\7\000\000\000�������\3\000\000\000\000\000\000Y@\4\
\000\000\000����������\4\4\000\000\000����\4\4\000\000\000����\4\4\000\000\000����\4\
\000\000\000����������\3\000\000\000\000\000\000I@\4\8\000\000\000��������\000\000\000\000\17pi\23\23.�N\\�,4�uj\23\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 �#2I���<�\
\9\20 .k�\rǽ�K�\8r\19m\9t\25:\8t\25ٝ�w�X\22\6��z*\28��*;\\�\9��ga�X< 6��k���\18�J?\\6\8v\25\28\9v\25k�x�0\8~�\9܅YD\1#\8\6 x��bL�<Kl>�uĤ�1͐syig�\24�w�M���B\17_�U��n@\000\9\8\8 @�Dc�~V4\18׼Wf\"�\3\16�MZ~i�\16>�k.K<'d�\000\000\000��������7���P����6��󶶶76��w��������6��3���wv������з��+6��s�����������\16���k6����������7���P����7��󷶶77��w��������7��3�6�ww����������\16���+7��s�6���������74��P���k7����6��t��7���w��������4���������7�B�\1��\2�ς\000\1\15À\1�\2�\5\15\3\000\000�\2�\5\15C�\000�\2�\5\14�\000\2\15\3\3�NÀ\2OC\3��\3\1\2�C�\2��\3\7σ\000\1��\3\7�À\1��\3\7σ\3\5\15Ă\6�\3�\7\15\4\3\5OD�\6\14D\4\8�\3�\7\15�\2\6O��\4\14D\4\8O\4\3\5�D�\6N��\8\16D\4\8F\4C\1GD�\8�\4C\1��C\9�\4C\1���\9\14E\000\8݄\000\1\6\5C\1\7�C\
N\5�\7\29�\000\1�\4�\9�\4\000\1]�\000\000�\4C\1�\4D\9�\4�\7\14\5�\7�\4�\9\14E\000\8NE\000\8\15E\5\
�\4�\9��\000\1��\3\000\14\5�\000�\4�\9\4\5\000\000�A\000\000\23\000\000��\1\000\000\24@D\4\23\000\000��\4�\9F�D\1��\4\000�\5\000\000\000\6�\000]E\000\2F\5E\1�E\5\000]E\000\1A�\4\000�\5\000\3�\5\000\000a�\14�\25���\23@\000�\14\5�\8\23\000\000�\r\5�\8\25�\3\000\23�\2�F\6C\1G��\12�\6C\1�\6F\r�\6\000\
�\6\000\1]�\000\000OF\6\9NF�\7�@\6�\23@\2�F\6C\1G��\12�\6C\1�\6F\r�\6\000\
�\6\000\1]�\000\000OF\6\9MF�\7�@\6�\25\000�\000\23�\2�F\6C\1G��\12�\6C\1�\6F\r�\6\000\
�\6\000\1]�\000\000OF\6\9NF\6\8�@��\23@\2�F\6C\1G��\12�\6C\1�\6F\r�\6\000\
�\6\000\1]�\000\000OF\6\9MF\6\8�@��F�F\1��\4\000ƆE\1\6GF\1]F\000\2F\6E\1��\2\000]F\000\1`��\127F\5E\1�\5\7\000]E\000\1FEG\1��\4\000�\5\000\000\000\6�\000]E\000\2\31\000�\000\5\7\21 ���N���O��\"\5�?�*�hY|\27��}�p�(\29\5\16I\25�6\26BL�.fF��hD�V\r\3\000\000\000\1\2\1\3\000\000\5\7!\25\
|�\26\18j�\6\"R�t���h\30\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�����ץ\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000\28@\3\000\000\000\000\000�v@\3\000\000\000\000\000\000 @\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000\"@\4\5\000\000\000���ͥ\4\4\000\000\000��¥\4\5\000\000\000���˥\4\4\000\000\000��֥\4\5\000\000\000���ѥ\3\000\000\000\000\000\000�\4\
\000\000\000��������˥\3\000\000\000\000\000\000\000\000\4\7\000\000\000�����ե\3\000\000\000\000\000\000Y@\4\2\000\000\000ݥ\4\4\000\000\000��֥\4\4\000\000\000����\4\2\000\000\000ܥ\4\4\000\000\000��˥\4\
\000\000\000����������\3\000\000\000\000\000\000I@\4\8\000\000\000������ե\000\000\000\000\27pi\0233�XJs�>)P�5\
s{�-��O5�$m^K8�\19���8�\4�8\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 \1�8s�\8\9\20 �C�YT\9t\0254\8t\0250�\ra�G\2F\11�(\15��C;G\8v\25\28\9v\25�-�.��J_dJ�s��`'\1.\8\6 �@6@�w\
\6��Lo�a2J�n�:�#\15�k8\000\r\8\8 \15>�\22�\rE\22\18<q$�:\24PK��\14�}V4\18���K�+\0172�\12dAD'=$po�\11\22\000\000\000���ߞ���^���9����_�ߙ_�\000G��\000�\000�\000�\000A\000��\000\1�\000�\000\17\1A\000\16AA\2݀\000\1\000\1�\000QAA\000\29�\000\1@\1\000\1�\1�\1�\1\000\2_\1\000\2\31\000�\000\8\7\21 t�J\5\18��Qf\22�f2��@�y\1~�C�\21�A�\31\7ĺq�9\25=���%\8\3\16I\25T�#C��\20\21\2\000\000\000\1\2\000\000\000\7!\25���1\6\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�������\4\5\000\000\000�����\4\6\000\000\000������\3\000\000\000\000\000\000�@\3\000\000\000\000\000\000p@\000\000\000\000\26pi\23�4�\28��>�=cOqB\0033�\31�bzx{\31���AS[�!\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 M��N�\"\19\29߼�(Չ#C�\8�IC\3\9\20 !y�<\16i�1l�6-�R\27\18�]SF\"�Suּ�N~&f\31��\27\28�Б\2Z\9t\0259\8t\25�92=\
��v���F`roc�U�\24���sS|�{��\9\r��\20}}\8v\25\26\9v\25y��k\1��9\1/\8\6 ǀ�:���VW�=e�\
�}Sɭ ��r7\000\14\8\8 uB�]�Q)iE�<1J��o��|/h��&H}V4\18���B�\")A�m�g}��\127��\0238\21\000\000\000MHHH\9HHH�\8HH�HHHU�HH\r\000\000\000��\000\000�@\000\000&\1\000\000]�\000\000�\000\000\000��\000\000\1A\000\000f\1\000\000��\000\000�\000A\000\15A�\000�\000�\1̀�\1�\000\000\1\31\000�\000\11\7\21 �CNc�0�P��\28\"1�!_���]}�1\31���\22\15��I~m�X\6\9\16I\25�6�\4P.�/���8rA�\2���P�~+pL\19�\6\24:\17.\1\000\000\000\1\2\9\7!\25���7cϹ\29���\8�Tk^�!Q\\�V�W��\23!xDz\29\6\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000-6.!&1C\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000�@\3\000\000\000\000\000\000p@\000\000\000\000\19pi\23n�� \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 \31<A �\3\9\20 Ő�Ms�e\\���2\27K�?9�\0176��BW#rg? �\"Xo\9�\19�x\18\9H\9t\0253\8t\25\21+/S\9\11�6��Mis\8v\25\30\9v\25���\18��\r\26y�-�4�D4�E~�\30f[\1+\8\6 픀!܌TF\000\12\8\8 �=�u��\15\4�d�j�y�\21�}V4\18�\
oc��RO\7��g�UP#3Hd\5A\000\000\000���Â���B���%����C�Æ���BC��\2������ÞC��F���\2\3���å���^C��\6�C��\1\1\000AA\000\000�A\1\000�\1\000\000݀\000\000\6�A\1\7�A\2F�A\1G\1�\2�\1\000\2������\1����\3��\000\1�\000\000\3�\1\000\2�\1C\1��\000\1�\1\000\2\17\2C\1\16BC\4݁\000\1\000\2\000\2QBC\1\29�\000\1F�C\1�\2\000\000�\2�\000]\2�\1\000\3�\2NC\2\3\29�\000\1\26�\000\6\23�\2�\000\3�\2N��\3\29�\000\1\26�\000\6\23�\1�\000\3�\2N�\2\4\29�\000\1\26�\000\6\23@\000�\3\3�\000\31\3\000\1\3\3\000\000\31\3\000\1\31\000�\000\6\7\21 �ǷbSD�]\
�R�@�k\14\4\16I\25\31\21�%�K`\"�Zc=�M�\26%�R5\3\000\000\000\1\2\1\3\000\000\5\7!\25��AH�\"Jz\3�AI{�#\15\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�������\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000�V@\4\5\000\000\000�����\4\6\000\000\000������\4\4\000\000\000����\3\000\000\000\000\000\000Y@\3\000\000\000\000\000�o@\3{\20�G�z�?\3\000\000\000\000\000\000�@\3\000\000\000\000\000\000p@\4\12\000\000\000������������\000\000\000\000\19pi\23�m�j\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 Vb\23n�\000\26PHD\0046�Y�A|�14BeIc�$:��-��hv�\3\9\20 \18��C�|QcD\
\0123\28p�\17uA$W\7u�\25�_/1��V�\15�J�p\7\27�\9t\0254\8t\25�v<>���x���\rv3�`a\8v\25\25\9v\25��g\4\1+\8\6 \15ԁ\27R�\127c\000\15\8\8 �ԛk�5�\25LlE^H��\31ݚ�|?��\2�L�M}rV4\18\"3�i�\000�6�kK0f=�\28�p�H��o\7m�B6Q��y��\12^T�\4\1P\000\000\000x}}}<}}}�=}}�}}}`�}}8}�}��}}��}}|||}\27|}} �}}�=<|��<|�=����}��=�|��}|=}}|��?|�}�}�@\000\1�\000\000\000�\000\000\000\1\1\000\000��\11���B\1�A\1\000�\1�\3\7B\1\000\7�@\4�\1�\1FBA\1G��\4�B\1\000�\2C\5�BC\5]�\000\1�BA\1��A\5�B\1\000�\2�\5�B�\5Ђ�\5��\000\1�BA\1ǂ�\5\7C\1\000\7\3C\6\17�C\6݂\000\1\6CA\1\7�C\6NC\2\3\29�\000\1Y\000�\000\23�\2�\6CA\1\7�C\6N��\3\29�\000\1Y\000�\000\23@\1�\6CA\1\7�C\6N�\2\4\29�\000\1\25\000�\000\23\000\1�\6�B\1C\3\000\000\29C\000\1\3\3\000\000\31\3\000\1���\127��B\1�\000\000\000�@\000\1�\000�\000�\000\000\1\31\000�\000\11\7\21 g��+=9A?��n\r1�d9�l\5 �,4\"+L�=�\28|N�\000�=\14\7\16I\25 /\
k��Q)\24s�:l�OI�g\31I�\r�7\3\000\000\000\1\2\1\3\000\000\000\7!\25S��\22\16\000\000\000\3\000\000\000\000\000\000�?\4\6\000\000\000������\3\000\000\000\000\000\000\000@\4\7\000\000\000�������\3\000\000\000\000\000�V@\4\5\000\000\000�����\4\6\000\000\000������\3\000\000\000\000\000\000Y@\3\000\000\000\000\000�o@\3{\20�G�z�?\4\11\000\000\000�����������\4\12\000\000\000������������\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000�@\3\000\000\000\000\000\000p@\4\4\000\000\000����\000\000\000\000\27pi\23�{G\25u�M\000\6c�a-�I�$\4\29��k*(�\2QI�FS\6�F$\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 �\18�\1�:�}v\15\9\20 *\5�?��P9��\21\4�K\15h\22:�d���\8�\9t\0257\8t\25*7�\25\22a�\24�U\
P��UO��y?J��z|��T�\8v\25\16\9v\25T\3�,���5�W�3��\"e�ڍt\31i�\31���\1\31��8\1(\8\6 u��I\000\
\8\8 Y��6q��Kn~V4\18v�HWA\31�Z�n�*\1�^[�j\5C\8��\15�\000\000\000knnn/nnn�.nn�nnns�nn+n�n��nn��nnooon\8onn3�nn�./o��/o�.��n�.�o��no.nno��,o�n�n�.no�nnnw�.oy.n��nnn�nno�nnn�nnn�n�ooonnϮe��,o�/on�o�mi,oni�.j�o�o(,/oG��\4�B\1\000�\2C\5�BC\5]�\000\1�BA\1��A\5�B\1\000�\2�\5�B�\5Ђ�\5��\000\1�BA\1ǂ�\5\7C\1\000\7\3C\6\17�C\6݂\000\1\6CA\1\7�C\6NC\2\3\29�\000\1Y\000�\000\23�\2�\6CA\1\7�C\6N��\3\29�\000\1Y\000�\000\23@\1�\6CA\1\7�C\6N�\2\4\29�\000\1\25\000�\000\23\000\1�\6�B\1C\3\000\000\29C\000\1\3\3\000\000\31\3\000\1���\127�@A\1�\000D\1�@D\1�\000�\000�@\000\000�@A\1��D\1��\4\000\1\1\5\000���\1�@A\1ǀ�\1\1A\5\000A�\5\000݀�\1\6AA\1\7�D\2A\1\000\000��\5\000\29��\1F\1F\1�\1\000\2�\1\000\000��\1\000�\1�\3́�\3\21\2\000\000\7\2\2\000\7�@\4\r�\000\4]A\000\2FAF\1�\1\000\000]A\000\1F�F\1�\1\000\2�\1\000\000��\1\000�\1�\3́�\3\21\2\000\000\7\2\2\000\7�@\4\r�\000\4]A\000\2FAF\1�AA\1��D\3��\6\000\1\2\7\000�\1�\1]A\000\000FAG\1�\1\000\2�\1\000\000��\1\000�\1�\3́�\3\21\2\000\000\7\2\2\000\7�@\4\r�\000\4]A\000\2F�B\1�\1\000\000]A\000\1FAF\1�\1�\1]A\000\1C\1�\000_\1\000\1\31\000�\000\000\7\21 ��_32�)\14\000\16I\25~�i\3\3\000\000\000\1\2\1\3\000\000\9\7!\25�+�<�h\r~�W�MFr3&\28l�*j$j\3\17��Y�L\7\16\30\000\000\000\3\000\000\000\000\000\000�?\4\6\000\000\000\2\23\20\26\19v\3\000\000\000\000\000\000\000@\4\7\000\000\000\24\3\27\20\19\4v\3\000\000\000\000\000�V@\4\5\000\000\000\27\23\2\30v\4\6\000\000\000\16\26\25\25\4v\3\000\000\000\000\000\000Y@\3\000\000\000\000\000�o@\3{\20�G�z�?\4\11\000\000\000\29\19\19\6%\21\4\19\19\24v\4\12\000\000\000\17\19\0025\25\26\25\4$14v\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000�@\3\000\000\000\000\000\000p@\4\4\000\000\000\23\20\5v\4\11\000\000\000\4\23\24\18\25\27\5\19\19\18v\4\
\000\000\000\17\19\2$\24\0188\3\27v\4\7\000\000\000\4\23\24\18\25\27v\3\000\000\000\000\000\000\20�\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000y@\3\000\000\000\000\000��@\3\000\000\000\000\000\000\"@\4\
\000\000\000\2\25\3\21\0302\25\1\24v\4\7\000\000\000\27%\26\19\19\6v\4\
\000\000\000\2\25\3\21\30;\25\000\19v\3\000\000\000\000\000\000D@\3\000\000\000\000\000\000N@\4\8\000\000\000\2\25\3\21\30#\6v\000\000\000\000\19pi\02313uy\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 �\3�)\19K1\5�� \11��vrS�G@9\15\9\20 s��em�?h)�h4}�DU�ۓo��4\17�\9t\0257\8t\25P&\3\2sq(\22�x�u{��f�7\17\24���`ӌ�J�\8v\25\31\9v\25�@\7\127\27��1�&�C\26e<H��[k�)�F�i�q\1*\8\6 �8tdWm�\27�s�(\000\11\8\8 :7%\14�\2=i���^\24}V4\18k�\29G5n�n�Ym$)��6,Y�\127X\000\000\000\29\24\24\24Y\24\24\24�X\24\24�\24\24\24\5�\24\24]\24�\24��\24\24�X\24\24\25�\24\24~\25\24\24E�\24\24�\24�\24�\24\25\24\25Y\25\24Y\25\24\24�\25\24\24��\24\24�X\24\25\15\24\24��\24\24\24\4Y�\24\15\24\24�\1�\000\000A\1\000\000�\1\000\000��\1\000\1\2\000\000U\2\000\2�\2\000\000!B\7�\6C@\1\7�A\6A\3\2\000�C@\1�CB\7�\3\000\2\000\4�\5@\4�\5�\3\000\2\29�\000\000\27\3\000\000\23@\2�@\3�\3��\2\000�C@\1�C�\7\000\4\000\2@\4�\5�\4�\5݃\000\2���\6\23�\1�@\3�\3�C@\1�CB\7�\3\000\2\000\4�\5@\4�\5��\000\2ց�\6 \2�\127\6B@\1\7�A\4@\2\000\000�\2�\3�\2�\1\29�\000\2\27B\000\000\23�\1��B@\1�BB\5�\2\000\000\000\3�\1���\1���\2\23@\2��B@\1�BB\5�\2\000\000\000\3�\1N\3@\4��\000\2���\2�\000�\4M\1�\2\23��\127�\1\000\1\31\000�\000\7\7\21 y�8���\21��'�nq\31/\2�-\19\11\16I\25��\28jwhA+\9'K\7��\23\28\31��n#��O��s\7\24��5��qA\5�7+\3\000\000\000\1\2\1\3\000\000\7\7!\25\"c ]�*-T\9\14�\9\\�Ek{-j=\7\1qh\11\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000JMKPW^9\3\000\000\000\000\000\000\000@\4\2\000\000\000y9\3\000\000\000\000\000\000\8@\4\7\000\000\000WLT[\\K9\4\1\000\000\0009\4\5\000\000\000_PW]9\4\12\000\000\000\17\16\23\28\18\20\19\6bg\0299\4\4\000\000\000JL[9\4\2\000\000\000\0289\000\000\000\000\22pi\23��\12r�/���\19�=\0001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 N�Lv�-�Q�d�BD�JW\18�o\1O\11\17\
��G!,\12\9\20 \26\19�\15�?�\3�\r4\4 �\14D\16\000�-�\9t\0258\8t\25�y�\
<\29�\2�4sl�G�=���xS�R\29\0037�\14�t+�\8v\25\30\9v\25��\127\127|��&6�j\17���~7a�v\30b>e\1 \8\6 �H\28m\30��6V�E��fD0{g8��O���e\127ƈ)*_�{\000\
\8\8 )\6.-\5m\20\000�~V4\18\25�wm�YDu#6]�\23\16d7'�\1\14\27\rV\19\000\000\000���ז���V���1����W�\000F��\000G��\000�\000\000\000�\000\1\000]��\1X@�\000\23�\000����\000��\000\1\23@\000��@\000\000�\000�\000�\000\000\1\31\000�\000\7\7\21 :^�\16�\1\3\2p\12�\23U\16o9\"(\4\3\16I\25g��\14���\30\2\000\000\000\1\2\000\000\11\7!\25�N�\17+�\r\12u�\16:&5YW��tP�nxr�&�&|Q#6%5\1\28���\"\7\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000_X^EBK,\4\3\000\000\000EC,\4\5\000\000\000C\\IB,\4\2\000\000\000^,\000\4\6\000\000\000O@C_I,\000\000\000\000\26pi\23N;/I���\"�M\1e�A�#\21ր\26L-[)�d\27\1��~\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 `��\21^(�}qvkm_�\14\29Y�rf\26e�\26s\14\9\20 �\
h\23\29y�?a\7PO���+�-�Tş\8txq>1�\9t\0252\8t\25J~}Eku�\30�\8v\25\25\9v\25bJv&\1-\8\6 �N\9\0004ɓm{~�ia�s\000\000\11\8\8 Ĵe\0058?�S\\�\25 |~V4\18���5���\11;�\1k\28{�R�p6rU+�\5\22\000\000\000y|||=|||�<||�|||a�||:��\000G��\000�\000\000\000�\000\1\000]��\1[\000\000\000\23�\1��@�\000\1�\1\000���\1���\000�@\000\1�\000\000\1\23@\000��\000\000\000�\000\000\1\31\000�\000\8\7\21 1x�-*60\29�\14�U�\127 }���Hl<g*W\31)qU:*z���H���6\5\9\16I\25\000�?[\4�\28]�?(\7��H[8��Jc��p)��[f0\18@\2\000\000\000\1\2\000\000\7\7!\25a�i/�\18,`_�\23\4*>\000-\127�\27\22�m�\15\8\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000\000\7\1\26\29\20s\4\3\000\000\000\26\28s\4\5\000\000\000\28\3\22\29s\4\2\000\000\000\1s\4\5\000\000\000\1\22\18\23s\4\5\000\000\000Y\18\31\31s\4\6\000\000\000\16\31\28\000\22s\000\000\000\000\16pi\23�l\26i��\17\2\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 \16�\4My\14�5/ds<���an��'���\"\1\
\9\20 N\26AC��W!\000o�0�\9t\0259\8t\25�\22�\000�\\)&�\22�^�D8a+\20�\29��Wg#s�*�\2Kfb��\16�\8v\25\29\9v\25~�6\27��\31?ohIP(��n�o�!\1(\8\6 �\4�{\000\12\8\8 ��+a��H-��\1\27P�\29}~V4\18��x@�8*n�{�\22\26\16�\3R݁\15��G\28\000\000\000x}}}<}}}�=}}�}}}`�}};��}:��}�\000\000\000�\000\1\000]��\1�\000\000\000�\000\000\000[\000\000\000\23@\2�\12A�\000\29\1\1\1\23@\000����\1�\000�\1\"A\000\000���\127\12��\000\29A\000\1\23@\000�\3\1\000\000\31\1\000\1�\000\000\1\31\000�\000\7\7\21 K�,\16�G�ms\27,\25*9eq�[\\\11\
\3\16I\25M�2\28�^�q\2\000\000\000\1\2\000\000\3\7!\25\9`\31xQ<�\12\7\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000rushof\1\4\3\000\000\000hn\1\4\5\000\000\000nqdo\1\4\2\000\000\000s\1\4\6\000\000\000mhodr\1\4\6\000\000\000bmnrd\1\000\000\000\000\26pi\23x�hHy��{\19�'r��gc\17�Mw�f�>|�D���?\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 F~^\29f�{.t�Tr�'-\8�9�U���=�\1\9\20 7�Pa9�/d[�`x��sr\0206�r��+i��0<\6Ƞ5�\9t\0257\8t\25Kei\15r `q��k���\20S�\7\8:\14�=c�\24l�\8v\25\17\9v\25:ٛLH�0\26c\29\r0��\14\3�@\24K@w�~�ym \8��y�\17�p\1!\8\6 \0041~Oa˾.��4.�\3\25J�V\15\16��d\18\1�yBG��\2\000\11\8\8 �f�+�x�>ה�:\000zV4\18I��+ǻ^Z$\000\000\000\5\000\000\000A\000\000\000�@\000\000�\000\000\000\29�\000\000E\000\000\000��\000\000��\000\000&\1\000\000]�\000\000�\000�\000�\000\1\000\1A\000\000AA\1\000�\1\000\000��\000\000ƀA\1���\1\000\1\000\000@\1\000\1݀�\1�\000\000\000\23@\2�%\1\000\000@\1\000\2�\1�\000]A\000\1L\1�\1]A\000\1C\1�\000_\1\000\1W�\000�\23@\000�\3\1\000\000\31\1\000\1\31\000�\000\1\7\21 ��\0044\1�Y\24k��N\7\000\16I\25;��d\3\000\000\000\1\2\1\3\000\000\11\7!\25�6#\30՞\4hUYA4\6��\28�\24r\8^P�-���\rR�\0121b�S}\28�E<\9\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�����ֱ\3\000\000\000\000\000\000\000@\4\6\000\000\000����Ա\3\000\000\000\000\000\000\8@\4\2\000\000\000Ʊ\4\3\000\000\000�ޱ\4\5\000\000\000���߱\4\6\000\000\000����Ա\1\000\000\000\11\9\20 3D�v�\5�}�\1\9\20 7�\4j��%�z>sMH�~�\r�\17���~\11Ze6P�u:�\9t\0252\8t\0259��\
;��\\�\8v\25\18\9v\25{.�*�<\27Q2f�/OtR\rs��\29��#�\24\30~�&e]��L�\19\"\r\000!\8\6 6�j\1\14~�f.�9?Q�\
\2A�I]��\21=r�l>��}+\1\1\8\8 \21�\18d�t�\0308��%���u>\19�\29C\31K\\G�70;�<C}�BgJ~V4\18��\27\18 �%^1�D\24HKn\31��\16|\12��;\23\000\000\000\11JJJ�JJJ�JJJ+JN�\12\11\
J�KK\000]�\000\1\24��\2\23�\000�E\1�\000�\1\1\000]A\000\1\23�\1�E\1\000\1L��\2�\1\1\000]A�\1E\1\000\1L��\2�\1\1\000]A�\1`@�\127\31\000�\000\1\7\21 ��uYМ�\8�w�*\8\6\16I\25\6�\3\
��w\17�\17�+W�\14\12\4��nJ��h�b{J\3\000\000\000\000\2\1\4\1\3\2\7!\0255#�\15�\26�.g&�8\5\000\000\000\3\000\000\000\000\000\000�?\4\5\000\000\000�����\4\6\000\000\000������\4\6\000\000\000������\4\3\000\000\000���\000\000\000\000\26pi\23��O$�9�V�\7�\17\28��T���\25-�'y�F�a�E�\2\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\21pi\23�3�?\16\15�\26nұ*S��;\29��Vl6>H�y>\21\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 P�i\15Ѿ�{\25m Vr��|���<��\11\22A/:v�\0284'�I�)i\1\9\20 \12�RQ�\21�\\e�\25GU�z�=�\28tj�x�5b\22J\23�\20=\
t\0259\8t\25�C�|\19�!@S\3�\"E��W�\6�A\4� ��\16\23Ԑ\17\27і7'\24\11v\25\26\9v\25߅�H!\24�6\1/\8\6 ��\2\31��g3]\1M+��\0145���)\24\30�R\000\
\8\8 Yr�o�M�J�rV4\18^�\23\18Ԫ�*��<i�M�\
��9A\14��}V \29ji$,>!�\000>�#�\12%\000\000\000����몪�+ꪪL����*��着�+*��kꪪ������\000\000�\000�\000��\000\000\1A\000\000A\1\1\000�\1\000\000��\000\000�@A\1ǀ�\1\000\1\000\000@\1\000\1݀�\1�\000\000\000\23�\2�\12��\1�\1�\000\29A�\1\12��\1�\1\2\000\29A�\1\12A�\1\29A\000\1\3\1�\000\31\1\000\1\23@\000�\3\1\000\000\31\1\000\1\31\000�\000\11\7\21 �˝\127�\16�-�\17\19-�\\�\26\127��T���\31��c��}\11<�\6\14\7\6\16I\0253��>��S9Q��7\7��h���\11���\22`�OX\3\000\000\000\1\2\1\3\000\000\7\7!\25C��F���$\9\29�h\23-�qYF\19\14�j�s\
\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000\26\29\27\000\7\14i\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\4\2\000\000\000\30i\4\3\000\000\000\000\6i\4\5\000\000\000\6\25\12\7i\4\6\000\000\000\30\27\000\29\12i\4\3\000\000\000dci\4\6\000\000\000\
\5\6\26\12i\000\000\000\000\27pi\23h#�\0112��]\0052\2q���Iܮ�j�F\4\7r��I��q\24[X\0234\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 ~H7q~\4C\11ؘ<?��\0120���3���*\18B{\r\4��)[\15\9\20 vNbit��|��6Jo�\30\
�k�\2]\02505!\
t\0257\8t\25�PW!\30X�TCT\4f®4g\9��8��\r&;��\7\22\11v\25\17\9v\25��!)�\23%X4\\FO���[QT�$\23��d>�\25M�X�/�G\17$\1.\8\6 Z9kc���N���\
_�Z\r\"n\31\3 �#J�\21�v\000\1\8\8 �{Z\20E��\000�˧\2\9��I�KP;.\28�#'�F\30ޟT!��3\11B|V4\18+��\18'�y6Nj�p\5�\8k\
\000\000\000GBBB\3BBB�\2\000\000�\000\000\000\29�\000\000F��\000G��\000�\000\000\000]@\000\1\31\000�\000\
\7\21 \15�fLV2�\15rєjMր\25&�~?b\25�\0142J�\22���\"\4\5\16I\25)\000I!ߋD0 w�`I�lk\2\000\000\000\1\2\000\000\9\7!\25���`�\15�\127���'?�sc��QI��-cm�r\7&��g\4\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000(/)25<[\4\3\000\000\0004([\4\7\000\000\000)>64->[\000\000\000\000\24pi\23]��\18V\31�>\24\19�K�O�%}�?ug}i<�-�\16�\7\000{vy�\8�_5 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 ���D�U�i�\127b\12Hr�\7\11�|.��|\9W�&\16�\14\9\20 i�3S�(ZB\11}�pb��\16�pJ:���J��Z%\
t\0258\8t\25\1\000�\29���|��eb^l�M�=�\4s�Mw\12��t�\8ud\11\11v\25\31\9v\25�\19�d�'�\1{j[k��g.j�w`\9\16M0W�A\24\000.\8\6 Q��7b\127�F�\20Wv�:\30H�2zwٶ�u\17\20R\27\000\000\8\8 �3�ft��+��\30te�18��\6���|f�\\Oҥ!\3�yV4\18��\8\8\4\000\000\000����A@\000\000\29@\000\1\31\000�\000\8\7\21 �F$\18��}l�(�\18yZ�v�\20�m<�\26~%�!%�\2wNE�g.|�c=\2\6\16I\25�%_f�r\"\4���1?`}.���{�<�'Pt�I\1\000\000\000\000\000\11\7!\25�p�\14�4�u�͏)\23[6@��E|[�m&}E�\15΀g\127�,�\5A��,\2\000\000\000\4\6\000\000\000������\4\11\000\000\000����Ϫ�����\000\000\000\000\21pi\23��B\\\17�\16?\26Q�sx�\1o�=�5�e�a��\28m\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 \2�\1\6�\4�~��p@�j�V��\15\5Jw�^�@N?\17�\20]\25\8\9\20 z��\23\000\
t\25:\8t\25f@pwvR�\0221T�\19�R�E\17��k=\22�\0191z�\25h�\5G��ah��);\14\11v\25\17\9v\25Ƶl8%srB�\20y\\4�|\12Uxv%���\30�z�\3\6�sy�\20�$\1/\8\6 Ü�9k\127={R\14m\7\14\20�\24h��:d�d\000\1\8\8 �&�|�\127_|[=�~\30g�sU�\6\19��p\18չ�9f��~ʧg&6zV4\18\\j�\14���\14C\000\000\00006v6wv66+�67p6v6��66k�67|6���v�6��76��67.��7!v5�07t61wt4v767��46+��\1\27\1\000\000\23�\1��\1B\000��B\3�\1\000\1\000\2\000\2@\2�\2�\1\000\2�\1\000\000\7A�\000A\1\3\000\29�\000\1\24��\2\23@\3��\1B\000�AB\3�\1\000\2\1�\2\000���\1�\1\000\000\23�\1�\6\2B\000\7�B\4@\2\000\2�\2\000\3�\2�\3\30\2\000\2\31\2\000\000�A�\000�A\3\000��\000\1\24��\3\23@\3�\6\2B\000\7BB\4@\2\000\3��\2\000\29\1\27\2\000\000\23�\1��\2B\000��B\5�\2\000\3\000\3\000\4@\3�\4�\2\000\2�\2\000\000\3\2\000\000\31\2\000\1\31\000�\000\000\7\21 # 6G�_CQ\14\2\16I\25WܲS3عv�nz\11\1\000\000\000\000\000\2\7!\25:�-p��\0310���Y\14\000\000\000\4\8\000\000\000k|hlpk|\25\4\3\000\000\000jc\25\4\r\000\000\000jcvzr|m7qmmi\25\4\8\000\000\000MPT\\VLM\25\3\000\000\000\000\000\000\8@\4\8\000\000\000k|hl|jm\25\4\24\000\000\000qmmi#66nnn7(*,/.! 7zvt6\25\3\000\000\000\000\000\000i@\4\7\000\000\000jmkpw~\25\4\5\000\000\000\127pw}\25\4\19\000\000\000<}2<7<}2<7<}2<7<}2\25\4\4\000\000\000jl{\25\4\18\000\000\000qmmi#66nnn7pi7zw6\25\4 \000\000\000qmmi#66pi7zqpwxc7zvt6~|mpi7xjia\25\000\000\000\000\22pi\23�\2]+\12�Wa\11=�Be��e\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 7�}7��\28*�G�wAW�1f�\2?E��\17�\r\9\20 y��;�\24dZC`.b�M-\15\11\
t\0255\8t\25�~c^�bDv��\"a��]~�?\5L)\11v\25\31\9v\25�\28�Mw.\0046o��a7��\18�E�a^�\6���/\1-\8\6 \27�bJa��Yu��\23��fQ\000\1\8\8 \28�\15BT2\23I��JC�a\18\1���Z �|\r\30\29\0162\19��\22���g2pV4\18�7�D\19��r�S\25\28���%\15��p��\30h\4��\3���>\"\000\000\0007222s222�r22�222/�22w2�2��22�r223�\000\000f\1\000\000]�\000\000�\000A\1�\000�\000\1A\1\000�@�\1��A\1���\000\24�A\1\23�\1��\000B\1�\000�\000\1A\2\000@\1\000\000\22A\1\2�@�\1\23�\000��\000B\1�\000�\000\000\1\000\000�@�\1��B\1�\000�\000�@\000\1\31\000�\000\000\7\21 s\23�e��Q\6\5\16I\25�\9\\l�\19j\1�D�\23�6\3\000\000\000\1\2\1\3\000\000\7\7!\25�\14�/��%\8zK�l\22��q��<QS �/\11\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�����ݺ\3\000\000\000\000\000\000\000@\4\r\000\000\000R> \\&\22\\-\31_\5-�\4\8\000\000\000������ݺ\3\000\000\000\000\000\000\000\000\4\
\000\000\000��������ߺ\4\4\000\000\000��ɺ\4\5\000\000\000���ݺ\4\8\000\000\000�����瀺\4\9\000\000\000�������ݺ\000\000\000\000\26pi\23��9,t�f=�\23�$�T�Bj�G%\25�\r93E�hi\9\31j\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 �\000zdh�\21X1��*aR�~�\12\9\20 0\12�\31\7 �\20�\000�mh\29<D�F`/�\
t\25:\8t\25�\14\24\23L�Jy\r��_~��WPcA\\��S55\2*boC�.�/�}$��#$\11v\25\29\9v\25��\6;���$-��S��sY\01803\18\1+\8\6 �1}j\7��>\000\14\8\8 �\9�B8r�i\16\8@L\9z�s@?\7\r@\20\26l�{V4\18�1V0��o7\r�F^�\000\000\000��������@���'����A������GA\1�\000\1��\\A��\6���ǀ\000������@����A�A���\000@��W\000�@�������A�A�\000\000�A���\000@��W\000�@��F�\3�Z����A�AF�\3�^������AA�A�\1�������\23�C�\\@��Z���ց�AF\000\000�\1�������\23�C�\\@��\6���\26����A�A\6���\30����A�A\6�B\3�\1\000\000\23�\000�ǁB\3�\1\000\1\23\000#���B\3�\1\000\000\23�\000���B\3�\1\000\1\23�!�\31\000\000\1\23\000!�@\1�\000�\1\000\2�\1\3\000��\1\3]�\000\1[\1\000\000\23�\
�G��\1�\1\000\2�\1\3\000��\1\3]�\000\1�\1�\2�\1\000\000\23�\000��\1�\2�\1\000\1\23�\28��\1�\000�\1\000\2\1B\2\000�\1�\3��\000\1�\1\000\000\23�\26����\1�\1\000\2\1B\2\000�\1�\3��\000\1�\1B\3�\1\000\000\23�\000��\1B\3�\1\000\1\23\000\24�ǁB\3�\1\000\000\23�\000�ǁB\3�\1\000\1\23�\22���B\3�\1\000\000\23�\000���B\3�\1\000\1\23\000\21�\31\000\000\1\23�\20�@\1�\000�\1\000\2�A\3\000��\1\3]�\000\1[\1\000\000\23�\
�G��\1�\1\000\2�A\3\000��\1\3]�\000\1�\1�\2�\1\000\000\23�\000��\1�\2�\1\000\1\23\000\16��\1�\000�\1\000\2\1B\2\000�\1�\3��\000\1�\1\000\000\23@\14����\1�\1\000\2\1B\2\000�\1�\3��\000\1�\1B\3�\1\000\000\23�\000��\1B\3�\1\000\1\23�\11�ǁB\3�\1\000\000\23�\000�ǁB\3�\1\000\1\23\000\
���B\3�\1\000\000\23�\000���B\3�\1\000\1\23�\8�\31\000\000\1\23\000\8�@\1�\000�\1\000\2�A\2\000��\1\3]�\000\1[\1\000\000\23\000\6�G��\1�\1\000\2�A\2\000��\1\3]�\000\1�\1�\2�\1\000\000\23�\000��\1�\2�\1\000\1\23�\3����\2�\1\000\000\23�\000����\2�\1\000\1\23\000\2����\2�\1\000\000\23�\000����\2�\1\000\1\23�\000�\31\000\000\1\23\000\000�\31\000\000\1\31\000�\000\6\7\21 \9��0\27{(>�4?\31Y��\12\9\9\16I\25�6i\1�;�;�.tq\3��$\21o�x��z,���IB \24L\2\000\000\000\1\2\000\000\6\7!\25���[G��4&�kp���\26��M\2%��2���\4\14\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000���
ä\4\8\000\000\000��������\4\3\000\000\000�ޤ\4\6\000\000\000����Ф\4\14\000\000\000������������̤\4\31\000\000\000����������΋
������Њ���
�פ\4\5\000\000\000�����\4\20\000\000\000��������������������\4\12\000\000\000�
�ˊ����Ф\4\r\000\000\000�������������\4\19\000\000\000�������������������\4!\000\000\000��̉���׊����΋
������Њ���
�פ\4!\000\000\000��̉���Њ����΋
������Њ���
�פ\1\000\000\000\1\9\20 [��P�E�&=#�\11�6ee/�[\
�3�;�\5�k�β+�\1\9\20 ��l�\8�\127�\5�&0\000�!X�u|^\8�i�|�k\30\19�Oq\
t\0254\8t\25]�\3~A��\000h�: ߪYL&\11v\25\28\9v\25^C�yj��Cw'<rnY�%\000#\8\6 X\30_q��Pn�\12\3r\29d\15\24��:zYChWL\19k\"���5�H�B,�\29N\1\
\8\8 \5f�o\23�\29;�}V4\18G��\\s\11\31U^t\24\000\6\29/H�\30�$\14\000\000\000Ă��B�\2���C\2\000\000]��\1X��\000\23�\000��\000�\000��\000\1\23@\000��@\000\000�\000�\000�\000\000\1\31\000�\000\
\7\21 c\0143FҬh%9x�NB��\18-�~R���H���V�޺D\4\2\16I\25���w��\0256���\\\1\000\000\000\000\1\6\7!\25\27a)N�A�V�@RAgt�p[\29�\12��;\4�V�>\5\000\000\000\4\3\000\000\000���\4\5\000\000\000�����\4\2\000\000\000��\000\4\6\000\000\000������\000\000\000\000\27pi\23���s���y��|>�[J\
�mVn�\19!�b\
���\30�\
=8\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\21pi\23\\��dѷ�],4�\7�{\\w�n$0��\\PK\15�M\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 �m(h�Ϝt�Lc�1y\8�\14\9\20 B��\000�ۍ\5�>kp@��:2�~.��S&�\24�V�\
t\0251\8t\25���\5�\11v\25\17\9v\25���0Gp�\24��ol�0[;\6��\7k\26�N���MH�\12&\17<\0243\000#\8\6 �͇7�߉o�v�E��\27l\0057�I��-���`��K-v\02266�Lfy\000\9\8\8 ���6@\127V4\18���q�\1s-��W7x�VHP\"�Lo^$=3��\\`\000\000\000e@@@\6@\000@\29��@�\000\000@��\000@���A@A�@\1AA@�AA@��@BF�\000@G�\000B\000A�@�\1A@�\1A@]�@B�@�A��@A�@@@Z�@�W\000@���A@W@A�Z�@�\23@\000��@\2\000\23\000\000���\2\000\000\1\000\000@\1�\1\29�\000\1K\1\000\000��B\000�\1\000\2�\1\1\1\23�\r��\2C\000�B�\5\1�\3\000@\3�\1��\3\000�\3\000\5\22�\3\6݂\000\1\12\3�\5\29\3\1\1\23�\
�\6�@\000\7�@\8@\4�\7�D\4\000\29��\1\24�D\8\23�\8�\6\4C\000\7�D\8@\4�\1��\3\000�\4\000\5\1�\3\000@\5�\7�\5\5\000V��\8�D\5\000\29��\1\27\4\000\000\23�\5�L�E\8]D\000\1F�E\000�\4\6\000]�\000\1�D�\8ǄF\9\000\5�\1A�\3\000�\5\000\5��\3\000\000\6�\7A\6\5\000\22E\6\
݄\000\1\7��\9\27\5\000\000\23\000\1�\6\5G\000\7EG\
@\5�\2���\9\29E�\1\"C\000\000���\127��\000\000#B�\127_\1\000\1\31\000�\000\5\7\21 ���U��MI�289���]*��\23�\24\28\7\4R�\3\26\11\16I\25�2't�\31';���:���9L�B'�,�\4K�xg\
��\7�\r�1���\29\1\000\000\000\000\000\8\7!\25O\23�Rys�T�\18V\000�_�cq'LFb\20�-�5�\26��\14�6�z\30\000\000\000\4\9\000\000\000���������\4\9\000\000\000���������\4\7\000\000\000������\4\4\000\000\000���\3\000\000\000\000\000\000�?\3\000\000\000\000\000\000\8@\3\000\000\000\000\000@W@\4+\000\000\000����������������������������������������\3\000\000\000\000\000\000T@\0042\000\000\000����������������������������������������������\4!\000\000\000�������������������������������\4\7\000\000\000�������\4\3\000\000\000��\4\6\000\000\000�����\4\4\000\000\000����\4\2\000\000\000��\4\6\000\000\000������\3\000\000\000\000\000\000\16�\4\5\000\000\000�����\4\5\000\000\000����\4\12\000\000\000�����������\4\3\000\000\000���\4\6\000\000\000�����\4\8\000\000\000�������\4\3\000\000\000��\4\6\000\000\000������\4\5\000\000\000����\4\19\000\000\000�������������������\4\6\000\000\000�����\4\7\000\000\000�������\1\000\000\000\
\9\20 E��\22�aJ1/G�R�\8\9\20 X\4�)�\
t\0253\8t\25Q\r�`�PF\27\3��-�\11v\25\17\9v\25_.?\20��(8F��GP{�E߇�S.\9FT4\"N\1A(�\"���|\000-\8\6 �I�\7��%\11��}\15G@\21r\1\
\8\8 \25�� ���\000�{V4\18b�=_�g�%�\28F\127\19\000\000\000������5�tu��5���c5�\1]�\000\1�\000\000\000���\000�\000\1\1\23\000\1��\1A\000�A�\3\000\2\000\1@\2\000\3�A�\1�@\000\000c\1�\127�\000\000\1\31\000�\000\6\7\21 \22�+~���\1�E�[\25ґ>\
\7\16I\25y��v\28wglC�\8L��6\11\0222�$���\19\1\000\000\000\000\000\6\7!\25��\27x��,h\\b'R6�\26@�!e\29$m%�+�\"\6\000\000\000\4\3\000\000\000���\4\6\000\000\000������\4\4\000\000\000�븘\4\6\000\000\000�����\4\6\000\000\000������\4\7\000\000\000������\000\000\000\000\17pi\23�!�4\5l�\20\11��-\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\26pi\23�0i\21a�l<]qn#;+�t�4�aQ��\"�l�&\20�(`\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 \127�KX\27\
_A�߾u��%�\15\9\20 jo�T�w�P�\24\0150\25�\0119��\28P�s\r�\
t\0251\8t\25qUV\12�\11v\25\29\9v\25\18�0\22͵gB���qA@{]��w\1 \8\6 v��\0201�)$Uo8yؔ�\20���\8���J\2�I7�\21�_\24�\11<\000\14\8\8 X�\01183\000k}\30��\31D̷]��(a��[\6]qV4\18��j6��Lk�H~N\12��C�yac[��ZD3i\\�0�y)T<\29>\000\000\000X]]]\28]]]�\29]]�]]]@�]]\24]]]��]]�\29]]{\\]]\000�]]�]�]��]]\\\\\\]\28\28\\]�\\]]��\000\000ƀA\1\1�\1\000݀\000\1\6�A\1A\1\2\000\29�\000\1K\1\000\000�\1�\000��B\2\11�\1\000\
\2\000�\
�Æ\
���K�\000\000J�Ĉ�\2\000\3J���\
B\2�FBE\1G\2�\4GB�\4�\2\000\3]�\000\1\
B\2�FBE\1G��\4G��\4�\2�\2]�\000\1\
B\2���\000\1�\000\2�����ƁB\1\24\000�\3\23�\1���E\1�A�\3\000\2�\2A�\6\000�\1�\1�\1\000\000\23@\000��\1\000\000�\1\000\1\31\000�\000\6\7\21 \15q\rW�4�\20%\3[}�n�k\11\11\16I\25zr�v]\3r\000��A\20m&A`��7ʶ�!,c2}�@�a\"��Y_c�z\3\000\000\000\1\2\1\3\000\000\2\7!\25fm|7\15I�[ΨG\8\27\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000���
�\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\4\7\000\000\000�������\3\000\000\000\000\000\000\20@\4\8\000\000\000�������\4\3\000\000\000���\4\r\000\000\000�����������\4\4\000\000\000����\4\5\000\000\000����\4\8\000\000\000��������\4\4\000\000\000���\4\7\000\000\000�������\4\5\000\000\000���Є\4\8\000\000\000��������\4\8\000\000\000��������\4\r\000\000\000�����������\4\"\000\000\000�������������������������������\4\15\000\000\000�������������\4\7\000\000\000������\4\6\000\000\000��굶�\4\5\000\000\000�
�\4\6\000\000\000�����\3\000\000\000\000\000\000i@\4\7\000\000\000�������\4\1\000\000\000�\000\000\000\000\27pi\23E��\r���>܅\
U/�;\\�C�\2��k8��\0167�v�^f0�1\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 ��\5m3��?�n�\4�6\27\25⸒\15~\19@\\��3�_�h��xU��j-�\1\9\20 \20W\rY\27���N��}B�C�\0203��\28^�r?T�{�\
t\0252\8t\25k/�&���\9�\11v\25\28\9v\25`�T\12{��g\
im+�\
`\27\1!\8\6 kX\26GK@�vt��k�&�\6\29��{\16Ħ\4��p\22��(X\000\000\8\8 \16?�~E^�-Y��e�0\23\6&C hH4�z$>p!\
\26�6WrV4\18>��S��r|An�1�\1�\22\16�(#��u;\20E�&pd}/F�%#\30�7R\28\000\000\000RWWW\22WWW�\23WW�WWWJ�WW\18W�W��WW��\000\000\1\1\1\000f\1\000\000]�\000\000�@A\1��\1\000��\000\1�@A\1\1�\1\000݀\000\1�@\000�\7A�\1@\1\000\000\29�\000\1\24��\2\23@\000�\31\1\000\1\23@\000��\1\000\000�\1\000\1\31\000�\000\6\7\21 %��!�\6R\25���A�\0267\r\7\11\16I\25�^�=���\17�\12�6Z!�\21_�DJ�K�5�\127�C�\9\0220�|�;�ª+\3\000\000\000\1\2\1\3\000\000\6\7!\25��\29]�ܑbG\18�g�<T\19\14�k6�\
d٪\16E\11\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�������\3\000\000\000\000\000\000\000@\4\7\000\000\000�������\3\000\000\000\000\000\000\20@\4\8\000\000\000��������\4\3\000\000\000���\4\r\000\000\000�������������\4\8\000\000\000��������\4\8\000\000\000��������\3\000\000\000\000\000\000i@\000\000\000\000\26pi\23��3\7���\000!\6�sl��6�(�#?��E�j�\1\15�WE\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 :\6M:�\26Qm�&�Q�N�\1f@?.�\8\9\20 \19�.X�\
t\0257\8t\25)`\127$V�\30\"V#�;�]sH�H\
l\24��^�\2k3�\11v\25\18\9v\25���T�\27%GY\r\000Xj�[g\24�\\l�v�\7\19�}+_X�RE\5\21{��m3\1+\8\6 �Z@Xp\16E&\000\000\8\8 �`�\18D+�\19��#\27��}\20�k�A�sU/f�U\24�\3\4\0268pV4\18\20�\"<�ŻZDiH\5�\000-(�E�9�k�8_�b*��s\14=\000\000\000=888y888�x88�888%�88~��8�888ex89~��8\1278�8e��8�x�8��98�x89���8���\000�@�\000�\000�\1\000\1\000\000@\1\000\1݀�\1�@\000\000\23@\2����\000�\000�\1݀�\000\14A�\1Z\000��\23�\000�\6A�\000A�\2\000\29A\000\1\23\000�\127�@�\000��\1\000�@\000\1���\000�\000\3\000�@\000\1�@�\000�@\3\000�@\000\1���\000��\3\000�@\000\1�@�\000�@\3\000�@\000\1���\000��\3\000�@\000\1�@�\000�@\3\000�@\000\1���\000�\000\3\000�@\000\1�@�\000��\2\000�@\000\1\31\000�\000\6\7\21 �\
c\2\6z�um\0185lS�]\
\6\4\16I\25�j�>��r\5\23ͺT>�.&/�]\2\000\000\000\1\2\000\000\5\7!\25EX�o\1B@p�\8�\14%\28�\
\16\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�������\4\16\000\000\000����������������\4\3\000\000\000���\4\5\000\000\000�����\4\7\000\000\000�������\3\000\000\000\000\000@\127@\4\15\000\000\000���������������\4\5\000\000\000�����\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000I@\4\8\000\000\000��������\4\9\000\000\000���������\3\000\000\000\000\000\000$@\4\2\000\000\000��\4\6\000\000\000������\000\000\000\000\26pi\23vtkP�\17:��\19\0294xojo2�X���YH0�&Q��3\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 ���*���c��li�7�dW��\3�A�\24KW;{�\12^\23�2:P\18\11�P�\8\9\20 a�SU�\
t\0257\8t\25\3��9`�*e�\25.ke�eke��\24Z��\9Qը-�\11v\25\29\9v\25��A-Y�f�\5�\0008\4�t^��C\000/\8\6 a1�\r+�\27y�\5>BXפ8�\29�\\���+\1\9\8\8 \23��`�{V4\18��Bx�p�\20pq_i\12\000\000\000�������u����G��\000��\000\000]@\000\1\23�\000�F@@\000G��\000�\000\1\000]@\000\1\31\000�\000\6\7\21 ?#\\a�@�>\19Y�VC�\30\27\3\6\16I\25�r�A��\6���<\
V�K��-4q�-U�M\14y\1\000\000\000\000\000\8\7!\25���U�Q�m���^�\29�\0099��{�-�W�#'L�Z;4�K�4\5\000\000\000\3\000\000\000\000\000\000\000\000\4\3\000\000\000���\4\8\000\000\000�������\4�\000\000\000������᭠��������������ୠ�뭢��������������������������������������������颧�������������魠��������������������������������������������������������������\4;\000\000\000�ୠ�뭢��������������������������������������������颧�\000\000\000\000\27pi\23�ikQ�\16�\21,^/<\2��iv��\r%��PrA6S9�Bge�\"2\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 ��\2T�u�0�\
\9\20 �g�{P�}4\22�3\6�\
t\0259\8t\25?e%%���\18���\9�K�r�x�as`Fz�~T.���\18�\127�-�\11v\25\29\9v\25Ƙ-A\127A�\26A\14�9K��J�z�J\000 \8\6 3h�9��]hgt�3�!�I�7 \\R?%\20\127N>3+�\"0J��D\000\r\8\8 �SC:\29�@ZΖ\"\1u�I 7�%�rV4\18��c/u\127S:{�\7>0\"�)U��h.(�P�UW��5\4���\17n�Mr\8\000\000\000�АБ���\29@\000\1\6�@\000\7�@\000A\000\1\000\29@\000\1\31\000�\000\11\7\21 ?��\\\8^�<���\29s&�\22�)V%V]qQ[HW`Xav\1���e\2\6\16I\25�U�1�Q|*�Ѯ\1o��t,oJk?�E$pNt>\1\000\000\000\000\000\000\7!\25��\1l\5\000\000\000\4\9\000\000\000���������\4\23\000\000\000��������������������\4\3\000\000\000���\4\8\000\000\000�������\0049\000\000\000�ୠ�뭢������������������������������������������������\000\000\000\000\19pi\23\9hV@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\9\20 _�d\
2\16� /��b\8\15\9\20 ���N���~���q\24��fݯf\7ґ�Z�\11t\0259\8t\25�tI6\25i�jtJ�O�\26�daP�?��\5ij��\17�X\27N�\21nb�\11v\25\27\9v\0253\28�o�Q@O���]\000(\8\6 ^�b\16\2\12\8\8 w��{[HI\26��\8>֕&\6apV4\18��\01195u8\3�\4�o���7�?\24u��~V�F(?�ѦO7\000\000\000�aaa�aaaD aa\4�aaĠaay!�av�a��!a���b`c`a� a`�`�`���aaca\3AB\1\000�\2\000\1\29B�\1\27\000\000\000\23�\6�\6�A\000@\2\000\000\29�\000\1\24�A\4\23�\000�\000\2\000\2@\2\000\000\29B\000\1\23�\3�\6�A\000@\2\000\000\29�\000\1\24\000B\4\23�\2�\6BB\000A�\2\000�\2\000\000V��\4\29�\000\1\27\2\000\000\23�\000�@\2\000\2�\2\000\4�\2�\000]B\000\000\000\2�\2AB\1\000\29B\000\1\24@�\000\23�\000�\6�@\000\7�@\4A�\2\000\29B\000\1�\1\000\1\31\000�\000\4\7\21 ��qu�:�:\9�m\17-�jZ+�,z��sz\11\5\16I\25��GH���\\\22q�<\1\000�7\1\000\000\000\000\000\7\7!\25�c�\26� �G��<�u\\k\9\
qC�4�V\12\000\000\000\4�\000\000\00047ped(~mz{agf5*9&8*(mfkglafo5*]\\N%0*76\0024)LGK\\QXM(xda{|(X]JDAK(*%''Ixxdm''L\\L(XDA[\\(9&8''MF*(*`||x2''\127\127\127&ixxdm&kge'L\\L{'Xzgxmz|qDa{|%9&8&l|l*6\0024xda{|(~mz{agf5*9&8*6\0024'xda{|6\8\3\000\000\000\000\000\000\000\000\4\3\000\000\000g{\8\4\8\000\000\000mpmk}|m\8\4\15\000\000\000caddidd(%1(d{l\8\0043\000\000\000'xza~i|m'~iz'lj'd{l'kge&ixxdm&d{lalmf|anamz{&xda{|\8\4\5\000\000\000|qxm\8\4\6\000\000\000|ijdm\8\4\7\000\000\000{|zafo\8\4\5\000\000\000dgil\8\4\8\000\000\000zm|}zf(\8\4D\000\000\000di}fk`k|d(dgil(%\127('[q{|me'Dajzizq'Di}fk`Limegf{'kge&ixxdm&d{l&xda{|\8\4\000\000\000\14\9\20 �yXP�u\28\r�\2�\14[j�\31Cެ+���\127]��\14�\3\9\20 ��Jk���\28!q\4^�ou<k+�\4���21\27�\7�\18\23$��,)E�~\6r\11t\0258\8t\25���\6���7�HPdF\25\20:�\17\127q��p(�7??\14G�C\28\
v\25\29\9v\25l}�\29&\11�y3O>>I��*\3\14�\8\000-\8\6 ��}V��\8�F�lbO�I\000\2\8\8 ��+X�\1qf���lO_�\20V-\1kUޯ\31�z%\28P@\24\15���H�R�\"�\127V4\18\127@�Z\"Y�|촵\9nR\26L�()%���H|��\15\27\000\000\000��������8����9��>9y�xy�����\1@\1�\1\29�\000\1\27\1\000\000\23\000\3�FAA\000�\1\000\2]�\000\1[\1\000\000\23\000\1�@\1\000\000�\1\000\2^\1\000\1_\1\000\000\23\000\1�A�\1\000_\1\000\1\23@\000�A�\1\000_\1\000\1\31\000�\000\6\7\21 �i�f���\9HMMQ;]z\17\7\5\16I\25�\0066/�.�gE�\000\27�M\23\28\1\000\000\000\000\000\2\7!\25�\19�)e=Ct\21�\7\24\8\000\000\000\4\8\000\000\000��������\4\3\000\000\000���\4\6\000\000\000������\0043\000\000\000ɖ������ɐ��ɂ�Ɋ��Ʌ��ȇ����Ȋ�������������Ȗ�����\4\5\000\000\000�����\4\5\000\000\000�����\3\000\000\000\000\000\000�?\3\000\000\000\000\000\000\000\000\1\000\000\000\15\9\20 �b-|_�~Sp�*}C]�G;�y\7.��B�\000\9\20 (�Kb\29�IM�K�cZ}\4\5��8:\9��P��+Ȥ~i>W�f\4\11t\0257\8t\25u\"�\27-�\r</\00334b��r��m\28i(�_k Lu\29\
v\25\31\9v\25�@E@�k�/�\
\r\18-��h(,)\5�m:\14�t\6<\000(\8\6 
�U\1\11\8\8 �a�D彘\29���/A|V4\18�D�\19I`M,��\27%��Cd\23\000\000\000$AAA�A\1A�AAA��A@\25\1\1@V\1A��\000\000\000�\000\000\1��\000\000�\000\000\000��@\000\000\1\000\1@\1�\000�\1\000\000�\1�\1\1\2\1\000]�\000\2�@\1\2\000\1\000\1AA\1\000�@\1\2�\000\000\1\31\000�\000\5\7\21 e%�\14�K�J~>�\31�G5*\0265�\6�A\
T<��\28\9\5\16I\25\23j�3�\9'\18u��L\3��s\1\000\000\000\000\000\9\7!\25\1��^0Wc\\��\5G�L\30m��i\24>TYIX\23\15C���[\6\000\000\000\4\5\000\000\000�����\4\6\000\000\000������\4\3\000\000\000���\4\11\000\000\000����ڎ�����\3\000\000\000\000\000\000�?\4\2\000\000\000��\1\000\000\000\1\9\20 _<�\26eu�\20ӂ\31G�.\23W\9�\29@M��\16\5?+eC\127\14B�\
\9\20 �\127�>פ?\4e��\000\26\11t\0252\8t\25��_6�k;\16\30\
v\25\26\9v\25���IG\127\15u\000*\8\6 �O�e�\25hR\19�eV\3\1\8\8 ��g\11T��V*\3e\8\3ˢvEۇ^u�Tn<%�\11�\23Yy�-�\2�{V4\18�\29\22C]-Yc���5|\000\000\000\6��������F�ņ\6��G����FGƁƆ�G��ǚ����\7�GA���\7���ZE��߇���G�GFE��\\������GF���\7�G����ņ\4��G���\1ą�����\26D��������\17�C�\1�����G�݂\000\1\24��\5\23\000\7��B�\000�\2\000\000\23�\1�\000\3�\1F\3B\000�\3�\4]�\000\1��\2\000ր\3\6\23@\9�\6\3B\000@\3\000\4\29�\000\1J\000�\4\000\3�\1A\3\3\000�@\3\6\000\3�\1E\3�\000�\3�\4�\3�\000\rDC\1]�\000\2�@\3\6\000\3�\1@\3\000\2��\3\000ր\3\6\23�\4��BA\000\000\3�\4݂\000\1\24@�\5\23�\1��\2�\1\1�\1\000F\3B\000�\3�\4]�\000\1��\3\000ր�\5\23@\1��\2�\1\6\3B\000@\3�\4\29�\000\1A�\2\000�@�\5b�\000\000�A�\127F\1D\000�\1\000\000]�\000\1[\1\000\000\23\000\8��\1�\1��\2\000��\1\3�A�\000�\1�\1\000\2\000\2AB\4\000�@�\3�\1\000\000\23\000\2��\1�\1\6\2B\000@\2�\2\29�\000\1A�\4\000�\2\000\3��\4\000���\3\23@\3��\1�\1\1\2\3\000�\000�\3�\1�\1\5\2�\000@\2�\2�\2�\000�BC\1\29�\000\2�\000�\3�\1�\1\000\2\000\2A�\3\000�@�\3�\000\000\1\31\000�\000\5\7\21 �m�a0��[\000\29�C�\18�e�I�\\�S�Xk�9\28\18\000\16I\25�l�\6\2\000\000\000\000\000\1\1\9\7!\25e4�a�\28,o��\31L�M<4\
\22�E�EEl�E�?_\11A\28\20\000\000\000\4\1\000\000\000�\4\7\000\000\000�����ơ\4\4\000\000\000��ѡ\4\2\000\000\000��\4\6\000\000\000����ҡ\4\5\000\000\000���ġ\4\2\000\000\000��\4\2\000\000\000��\4\9\000\000\000�������ơ\4\5\000\000\000�����\4\6\000\000\000����ġ\4\2\000\000\000��\4\3\000\000\000ګ�\3\000\000\000\000\000\000�?\4\4\000\000\000܍��\4\4\000\000\000����\4\r\000\000\000�����������ġ\4\15\000\000\000���������ğ����\4\9\000\000\000���������\4\4\000\000\000����\000\000\000\000\20pi\23�\16G6���z�\1�b�5�AI�!tn/�e\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\22pi\23�D�DQM\r)^\11�w{�-z\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\23pi\23\\y�Y�}�Ux\7�q2�n?@ǀ2\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 N�n6ږ�\20�\5�sW�!\27��Hx�\000\9\20 \27\21�J�ՠO�\3�.3\127<q��+E\
I0\18\3��x-��\8�6�\3}\11t\0258\8t\25Y �Z\23��h\26\3�h�\6J\6~o�(���b���+\8\23\29^[\
v\25\17\9v\25}�.+b�gnڱ�E�\25@\27F�8G(��{e�\0050\24��:\1279 \23\000#\8\6 ��%\\γ�P!R@s|��+t��\127T�|dx[�p~\000�\17Xw*]��xy\1\r\8\8 �A�6�\24-TA�'~�Dp\31�\31wZ8rV4\18=\16n\6Ȅ\1\5�GJh�\
�1*{is`��-E$�Lqb�:���)���|\20\000\000\000~8x8�x88e�89���8��88\11\1\000\000G\1A\000[\1\000\000\23@\1�G\1A\000\
A\1�GAA\1�\1�\1�\1\000\2]A�\1GAA\1�\1�\1�\1\000\000]A�\1\31\000�\000\000\7\21 \7��@�\0171%\8\000\16I\25Մ�\17\1\000\000\000\000\000\7\7!\25��q}I<{\17%5�|\20\12dn�<D#}�\24Z\6\000\000\000\4\8\000\000\000������޻\4\3\000\000\000���\4\6\000\000\000����ϻ\0043\000\000\000�������ޔ��ɔ�ٔ��ߔ��֕����ޕ�������������ȕ����ϻ\4\23\000\000\000���������������������ɻ\4\6\000\000\000����޻\000\000\000\000\23pi\23�s�8\26�\16�\29\
<3r�6�2\0210\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 \1a�1\14�jg�(\14v[\000�\0074�\1o�E^w>�k<'\8\9\20 x��TY\11t\0257\8t\25�f�\11T�c\22\27��\21� �\r\29�D-���3��T3V\
v\25\16\9v\25��\8p�\14\4/u��.7&\16UN-�\20��\30$�ă^o��+\000,\8\6 \20\1Kh�I�\127�Ս\r\21b;\26��'g\1\2\8\8 pb�!,�)V&D�z�8*^{;D\5v�\5\6'\7�2I�K8G]�\17{�PI�yV4\18���vI\000\000\000�ΎΉ�\14�N���\15N�ΓNN�E��Ε������N\2\14\14�\19���َ�N\8Ϗ�\9�\15����͏L��\19ON�\21���َ�N\8\1A\000���\3\000\2\000\3A\2\2\000݁�\1�\1�\3�AB\000ǁ�\3\000\2\000\1@\2\000\3�A�\1�@\000\000c��\127���\000�@\000\1�\000\000\1\24\000�\1\23@\000��\000\000\000�\000\000\1�\000@\000�@�\1\000\1\000\000AA\3\000݀�\1�\000\000\000\23�\6�\21\1\000\1X�C\2\23\000\4�\1�\3\000U\1\000\1N��\2��\3\000!A\1�\12��\1��\1\1\29B�\1\12��\1�\2\4\000\29B�\1 \1�\127\12��\1�\1\000\1��\1\1\29A�\1\23�\000�\12��\1��C\1\29A�\1\12��\1\29A\000\1\6AD\000\31\1\000\1\31\000�\000\5\7\21 ��\18S���\28�x�q�\14\23\2�A�K���F�;�\22\11\4\16I\25�c8%[��B�\
�\11�d�\rFEZB\1\000\000\000\000\000\4\7!\25�ƾ'>9�)���\28[)}Ik�\127\18\000\000\000\4\3\000\000\000NH'\4\5\000\000\000HWBI'\4\2\000\000\000U'\4\6\000\000\000KNIBT'\4\7\000\000\000TSUNI@'\4\5\000\000\000ANIC'\4\2\000\000\000.'\4\4\000\000\000TRE'\3\000\000\000\000\000\000\000@\4\6\000\000\000SFEKB'\4\7\000\000\000NITBUS'\4\6\000\000\000DKHTB'\3\000\000\000\000\000\000\000\000\4\2\000\000\000P'\3\000\000\000\000\000\000�?\4\6\000\000\000PUNSB'\4\2\000\000\000-'\4\6\000\000\000ANUTS'\000\000\000\000\23pi\23\9b�'� �\4<\25�\0290i�Z/�;=\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 ��?D�o\11v�\28e_��'\15#�\31PC։\17\
��\30���B�\1\9\20 �{P53��t�tU,�\
?5v��F���#���I�T�\22A\11t\0253\8t\25\28�$&���s��N1r\
v\25\17\9v\0250F�\8X`�8r��e�r�9\9c_Ks\31�~�\000�2�&�?=��B\000*\8\6 �C'\31ϥ�Q�J�x\2\r\8\8 �?�pA�l;0|Y_�\16�i6G�p:|V4\18�Q�%��0\0271F\21:U�o\15\000\000\000�:z:�zz;�:::;�:\000���\1�\000\000\000\23�\1���@\1@\1�\000�@�\1�\000A\1�@\000\1�\000�\000�\000\000\1\31\000�\000\1\7\21 A�^fq��\21D��%\6\9\16I\25��r8t\31�.z!wP\24D\28\30\23�Kh���\27�c�\28\17��\26\1\000\000\000\000\000\2\7!\25�R�_�\3�C��z\5\000\000\000\4\3\000\000\000���\4\5\000\000\000�����\4\2\000\000\000�\4\6\000\000\000������\4\6\000\000\000������\000\000\000\000\17pi\23HNV<�\8q+q8\23\"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\16pi\23ӄ�\
SI�\11\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 �G9'��b\\�B�c%b�\27f-k\7�'�T\27��O\\Η+\
6'qn�\21d�\11\9\20 C��Yy��L�\11t\25:\8t\25�\29�\"c�\24�{�K5�\18T�v7-X\127,S~+>w�D�\000�\"=Y2\6xx�\
v\25\16\9v\25K%�h\"�@\19f��?��9\29��O[>\6\19g\17a�y�\11@?\000+\8\6 x�\7\1�3�\19\1\14\8\8 �\\�,�i\7\5��q6\
\3N.�ioa0Ol\16�{V4\18�le3��\19��mC%\000\000\000����i���\12�L�����\17���Ԍ���\12�L\12����M��\17@\000\1\23�\000���@\000�\000�\1\1A\1\000�@\000\1ƀA\000\1�\1\000݀\000\1\7\1�\1GAB\2��\2\000]�\000\1���\2\1\2\3\000�A�\1���\2\1B\3\000�A�\1���\2\1�\3\000�A�\1���\2\1�\3\000�A�\1�\1�\2�A\000\1\31\000�\000\5\7\21 ��\21A�=�\22�`�~~@�A�`�o�f.w�f�p\9\4\16I\25\1bo\
^%�0]B\15v�*�e�+�\23\1\000\000\000\000\000\3\7!\25�6�$\000��\26\17\000\000\000\4\23\000\000\000���������������������\3\000\000\000\000\000\000\000\000\4'\000\000\000������������������������������������\4\3\000\000\000���\4\8\000\000\000�������\0041\000\000\000�ᬡ�ꬣ�����������������������������������ھ�\4\8\000\000\000�������\4\3\000\000\000���\4\8\000\000\000�����鿌\4\5\000\000\000����\4*\000\000\000��������������������������������������\4\5\000\000\000����\4'\000\000\000�����������������������������������ߌ\4\31\000\000\000���������������������������ތ\4\26\000\000\000����������������������،\4\23\000\000\000�����������ӽ������ߌ\4\6\000\000\000�����\2\000\000\000\12\9\20 ���>︵X\18`�gy�:{1��/\8\000\9\20 3�|\8�\22\21#bbgwV5\2\31�0�f�O�\12�9�+��\31mq�\2s�\11t\0256\8t\25U��\9�ߎ\26��0sc$�#�g0\1+\19�\23�\
v\25\16\9v\25~��T���\r�q�.�[�X^�!h'��H�\1�\rP�\11'\000*\8\6 �a�uɮF\"G$yQ\1\2\8\8 OIr\3{\25�Y\21,�y���z�N�x�\\�`��g\7_��$9+�M\"�jz�}V4\18\2��\20\000��\4�E�{�\
*\22+��\28\27\000\000\000֐А��P�\17\16��P���\6P���\16��\28PP\000�\000\1\1\23�\3��\1A\000�AA\3�\1�\2\1�\1\000���\1\24�A\3\23�\1��\1B\000�AB\3��\2\000\000\2\000\000A�\2\000�\2�\2ց�\3�A\000\1�@\000\000#��\127\31\000�\000\8\7\21 J��j���*#�&\0064��CC��\18J�\12O���Q�q�9`\15�pN[<G\11\000\16I\25�3!B\1\000\000\000\000\000\3\7!\25�i�_#M\23\28\12\000\000\000\4\3\000\000\000ag\8\4\6\000\000\000xgxmf\8\4\4\000\000\000d{(\8\4\6\000\000\000dafm{\8\4\7\000\000\000{|zafo\8\4\5\000\000\000nafl\8\4\3\000\000\000-&\8\000\4\3\000\000\000g{\8\4\8\000\000\000mpmk}|m\8\4\8\000\000\000ze(%zn(\8\4\2\000\000\000'\8\000\000\000\000\26pi\23]\21�Z��\15\21|��x\14\17�aS$�9�$lF1�c\\�|�K\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\9\20 !�\4PB\6�;<6vp�\
\9\20 �BB\127eCeK\11��)�\11t\0258\8t\25E��g���S�o>8�y\8H��|\20S��1�5C(:�#\17�\
v\25\25\9v\25ې�\
\000(\8\6 �%\7N\1\r\8\8 ��#G���>7�\23JF-\0013\16��\"�yV4\18�w\16?\20\000\000\000�ӓӔ�\19�RS��\19���E\19��]�\000\1���\000�\000\1\1\23�\1��\1A\000�AA\3��\1\000\000\2\000\000A�\1\000�\2�\2ց�\3�A\000\1�@\000\000#A�\127\31\000�\000\11\7\21 Z�w\24\14~�z�Ӱ7m\8�g�ȟ\23{\22�6�K�2�xMA�ې@\11\3\16I\25~X;\21kK�x\1\000\000\000\000\000\2\7!\25\19��)�2�*\
�#\11\8\000\000\000\4\3\000\000\000���\4\6\000\000\000������\4\4\000\000\000�麚\4\6\000\000\000�����\4\3\000\000\000��\4\8\000\000\000��������\4\8\000\000\000��������\4\2\000\000\000��\000\000\000\000\22pi\23��PN�<�\21�vW-�\2X\28\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\24pi\23�N{t\12�0[�pnM�{|'\29�.~�A�Q\30��o� ?=\28߻\24xfg\8\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 A�\0043�I\
%C��M\"S�\12�{�m�%SL��f\6��R\3q��\26�\000\9\20 �\22\6��<��CW�6vx�q{<|2/e��\0266.[�.�\\`P�\11t\0252\8t\25��o\19�z�Z�\
v\25\31\9v\25B�p\r��\3;��^u\15��\20H�\9\23,�\16\16\000^5\4\000-\8\6 ��\0265C9\29R���V�V�\"\000\000\8\8 ��B]��B&X��8���\1 ~41J��O���>�`x\8\\qV4\18f��m\21�6~\9��)?�\7>V\18�`��R=�j�\0248�4\27��J\25\000\000\000Z\\\28\\\29\28\\\\A�\\]\27�\28\\ۜ�\\�\\]\\��\000\1�@A\1A�\1\000�@�\1�@A\1A�\1\000�@�\1�@A\1A\1\2\000�@�\1�@A\1AA\2\000�@�\1�@A\1A�\2\000�@�\1��B\1�@\000\1\31\000�\000\3\7\21 1��)\6\4\16I\25��\8k]\19\5:*��c\\�\0235[�\31o\1\000\000\000\000\000\8\7!\25\8|�\11/E\16\18U\\�T�-6i�3S8�<z\r�,�j߱�i��\31]\12\000\000\000\4\8\000\000\000��������\4\3\000\000\000���\4\8\000\000\000��������\4\5\000\000\000�����\4\29\000\000\000؁��ؼ��������؜���������ٓ��\4\5\000\000\000�����\4%\000\000\000������ױ���א���נ����ז�����Ж������\0043\000\000\000������ױ���ה���נ����ז�����Л�������ڞ�����������\0043\000\000\000������ױ���ל���נ����ז�����Л�������ڞ�����������\4\17\000\000\000������ױ���מ����\4\28\000\000\000������ױ���ׄ���������������\4\6\000\000\000������\000\000\000\000\21pi\23�\18\000r0�;%J�a$0��_E#r#SeDNo��\29\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 �\17\
'�\
\9\20 ���\23w�%M�\18�>�\11t\0257\8t\25���i���Y�δU\9@�\29�d\31\8�v\\]�_�4�\
v\25\27\9v\25�\19�\21z}�v�1(\23\1!\8\6 ��53J4A:�\r\16#\0038<�A�\22�ik\30���eZ4�2\000\000\8\8 \30�\\*�!\30<�\20^U��fQ�\9�VҠ�m���h\23��#\14yV4\18�?a\r\24\000\000\000\11\14\14\14O\14\14\14�N\14\14�\14\14\14\19�\14\14k\14\14\14��\000\000�\000\000\000\21\1\000\000\26\000�\1\23�\2�\6A�\000\7�@\2@\1\000\000�\1�\1\29��\1@\1�\000�\1\000\2]�\000\1�@�\1�\000@\1\23@�\127�\000\000\1\31\000�\000\6\7\21 �BQ�\127\28+�\19k\14�/�.\7\11\16I\25\0209dp�C3D�\\�V�j�\7/-�XcG\21\12��Hi��h�JMH���_\2\000\000\000\1\2\000\000\5\7!\25-��-�*�\18\127y�8K�HX\4\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000������\3\000\000\000\000\000\000\000\000\4\5\000\000\000����\1\000\000\000\14\9\20 v\0047\23���T��u@�\9\\M��9y�Z%Pū�d\23\12\9\20 ��_\26\12~%\000�\12�6�ȏ?Z��b�\11t\0256\8t\25�Y�#���8)Z�O�\24�?(o�\22xH�X�\
v\25\26\9v\25�\12H\17K4|T\000.\8\6 ���.?�(c?Ӱ[\17�n�jnO�\000\"2���\5\1\2\8\8 �җrY�FS\29�o\29�-�B\31��7�\7jR�&�Aԇ?R�R�3�x�zV4\18O�\5\15���5\23\000\000\000����i�i����������i��i�\23�\000�A�\000\000_\000\000\1\23�\2�\25\000��\23�\000�A\000\1\000_\000\000\1\23�\1�\25\000��\23�\000�A�\1\000_\000\000\1\23@\000�A�\1\000_\000\000\1\31\000�\000\7\7\21 x2�^Xöu�t�\4�z�7\\�&P\2\6\16I\25<�4\0124s�\14'\r\22E{}]osFJj9��3W��>\000\000\000\000\9\7!\25�ߴ9��\1cC\26\4\15\26��\12��q\000�G�Q9v�D���R\8\000\000\000\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000n@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000 l@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000h@\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000�?\000\000\000\000\19pi\23\r�\26\23\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\24pi\23Ң.\12�N�($��Z!{4\27k��^���H��/zļkT�4�M�(�1\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 \9!-.��!\9[\11\9\20 �D�=�b�M�\11t\0255\8t\25�\9�\000���@��5r�\8_Z���_�\
v\25\31\9v\25Ҋ�\1h��\24O\27�&���$y+�\20ʑ�P�WZ\26\000.\8\6 \4\29W.fھ\000F��\16��\"+Z�#\3�k�Iv\"�~\000\9\8\8 �/�l�|V4\18[\22�u�p�X��=\6U[�3e\000\000\000��������������|����������<��|<���||�<�|�<�������|�������|=��||�}<�������|�|=|����|��}��\29��|:���������B\4@\2�\000�\2\000\3�\2\000\3\29\2\000\2݁\000\000�\1\000\000\23�\2��\1\000\1\6BB\000\7�B\4@\2�\000�\2\000\3�\2\000\3\29�\000\2�\000�\3�\1\000\1Z���\23�\000��@�\127\23\000\000��\000\3\000�\000\000\1\25���\23@\1��\000@\000\6\1B\000@\1\000\1\29�\000\1�\000��\23@\000��\000@\000ʀ��\1�\1\000A�\3\000�\000\000\000�\000@\000���\1\6\1B\000F\1D\000�\1@\000�A@\3]�\000\1�\1D\000�AD\000ǁ�\3�\1�\000��\000\000��D\3��\000\1V��\2\29\1\000\1�@\000\000��\000\000\1\1\5\000A�\000\000�\000\3��\1@\000�A�\3\1\2\5\000݁\000\1�\000�\3�\1\000\000\6BB\000\7�B\4@\2�\000�\2\000\1�\2\000\1\29�\000\2\22\000�\3�@�\127�\000B\000\000\1\000\000�\000\000\1�\000\000\000\31\000�\000\1\7\21 o0n/�d�4n�Qg\12\11\16I\25�m�\14k\"�F���mb��\16Ի~_CǸ\20^�5M�&t\14Yhe�H\15P\1\000\000\000\000\000\7\7!\25\18v�\19X#�P�Hvs�U�>���S��6=\22\000\000\000\4\5\000\000\0006:/3[\4\5\000\000\000\4)5?[\3\000\000\000\000\000\000�?\4\8\000\000\000)>*.2)>[\4\3\000\000\000(![\4\7\000\000\000(\"(/>6[\4\5\000\000\000.?2?[\4\1\000\000\000[\4\9\000\000\000/45.69>)[\4\7\000\000\000(/)25<[\4\4\000\000\000(.9[\3\000\000\000\000\000\000\8@\4\2\000\000\000j[\3\000\000\000\000\000\000\000\000\4\11\000\000\000kjihonmlcb[\4\11\000\000\000):5?46(>>?[\4\9\000\000\000/4(/)25<[\4\3\000\000\0004([\4\5\000\000\000/26>[\4\8\000\000\000)>->)(>[\3\000\000\000\000\000\000$@\4\7\000\000\000):5?46[\000\000\000\000\16pi\23�w�\11[��)\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 ��6\1c�8-n�E\23 oFa�9U��s}v�<��X3P\1\9\20 P \18h�\9QAbF�P�.�\15���#���l�B �\26�c�\14t\0256\8t\25�\8\\tƀ\\7Z�Jl���Y\29@Xkx�Fr�\
v\25\29\9v\25��\30G��\"\1{\31�@ƆHA���|\1(\8\6 )��n\1\11\8\8 A)�\8���C��\0266�~V4\18S~~\23\28��C��&_\26��X~8~\20���n:\1\000\000����˃�C�Ã�H��ÉCCC�Ã�H��ÉC�B�Ã�H��ÉCCB����EÃ�&���I\3�AEÃ�&���I\3CAEÃ�&C��I\3�@E\3��\3���^C���Á�ԃ�CH���\8����B����C�'���\4\3\1�I\3CG\8����B����C�'���\4�\000�I\3�EI\3�DI��K\8���I\3�J����E\3��\3���^������C�CB�aC����<�D�\6�X����C�CB\3��\4�\6��\2��b��CE�D���\4B\7�����^�C�c�=��C�C�\3�I�\3�HEÁ�D���\4C\7�����^�C��O�ÁN�\3\6N�C�CE\3��\3���^C\000\1\24\000G\1\23@\28��\000�\000��\2\000\1A\7\000A�\7\000�\1\000\000��\000\000�\000�\000\1A\3\000AA\7\000��\3\000�\1\000\000݀\000\000\5\1�\000A�\7\000�A\7\000�A\4\000&\2\000\000\29�\000\000E\1�\000�\1\8\000�A\7\000\1B\8\000f\2\000\000]�\000\000�\1�\000��\8\000\1\2\7\000A�\8\000�\2\000\000��\000\000�\1�\000\1\2\9\000A\2\7\000�B\9\000�\2\000\000݁\000\000Y�H\3\23@\000�\25���\23�\000�\6�I\000A�\9\000�B\3\000\29B�\1\4\2�\000\24�H\3\23\000\1���B\000�\000@\2�\5\000\2\000\5\23�\000���B\000�\000\000\2�\5@\2\000\5�\2�\000�\2\
\000\1\3\7\000@\3\000\4�\3\000\000��\000\000�\2�\000\1C\
\000A\3\7\000�\3�\4�\3\000\000݂\000\000\5\3�\000A�\
\000�C\7\000��\
\000&\4\000\000\29�\000\000E\3�\000�\3\11\000�C\7\000\1�\
\000f\4\000\000]�\000\000��\3\000��ō�\3B��CF������C\1�����������\2���\1��\3\1��\3���C\3���\000��\3\000\000��\3�@\000\000\7\25�B\000\23�\000���I\000��\12\000\1D\3\000�C�\1��\2\000�\3\000\000\1�\2\000�\3\1��\4B\000�DE\9Ǆ�\000\11\5\000\000�D�\1�C�\127\23�\24��\000\000\000\27\000\000\000\23@\000��\000\000\000\23\000\000���\7\000�\000�\000\1�\2\000AA\7\000��\3\000�\1\000\000݀\000\000\5\1�\000AA\3\000�A\7\000�A\4\000&\2\000\000\29�\000\000E\1�\000��\7\000�A\7\000\1B\8\000f\2\000\000]�\000\000�\1�\000�\1\8\000\1\2\7\000A�\8\000�\2\000\000��\000\000�\1�\000\1�\8\000A\2\7\000�B\9\000�\2\000\000݁\000\000Y�H\3\23@\000�\25���\23�\000�\6�I\000A�\9\000�B\3\000\29B�\1\4\2�\000\24�H\3\23\000\1���B\000�\000@\2�\5\000\2\000\5\23�\000���B\000�\000\000\2�\5@\2\000\5�\2�\000�\2\9\000\1\3\7\000@\3\000\4�\3\000\000��\000\000�\2�\000\1\3\
\000A\3\7\000�\3�\4�\3\000\000݂\000\000\5\3�\000AC\
\000�C\7\000��\
\000&\4\000\000\29�\000\000E\3�\000��\
\000�C\7\000\1�\
\000f\4\000\000]�\000\000��\3\000��ō�\3B��CF���E������C\1�����������\2���\1��\3\1��\3���C\3���\000��\3�\000\11\4\000\000�C�\000��\3�@\000\000\7��\000\000\8�\000��\000\1\000\8����@\1\000\8�\000���\1\000\8�����\1\000\8�\000��\000\2\000\8����@\2\000\8�\000���\2\000\8�����\2\000\8�\000�\31\000�\000\3\7\21 \26�m\1\21\000\16I\25��z`\3\000\000\000\000\000\1\3\1\2\3\7!\25ySW\3Q\2�\23=\000\000\000\4\
\000\000\00075$\5\25\0038?'P\4\r\000\000\000#9>7<5\0025#%<$P\4\12\000\000\000=%$9<\0025#%<$P\4\r\000\000\000\"5<1$5\0025#%<$P\4\7\000\000\000? $9?>P\4\8\000\000\000? $9?>#P\4\
\000\000\000? $9?>\2<$P\4\5\000\000\000$) 5P\4\6\000\000\000$12<5P\4\6\000\000\000'94$8P\4\14\000\000\00075$\0033\"55>\0039*5P\3\000\000\000\000\000\000�?\4\7\000\000\00085978$P\3\000\000\000\000\000\000\000@\4\7\000\000\000?;>1=5P\4\7\000\000\000��е��P\4\11\000\000\00031>35<>1=5P\4\7\000\000\000��ƶ��P\4\6\000\000\000 175#P\4\6\000\000\000 19\"#P\4\4\000\000\000>%=P\4\7\000\000\0009>#5\"$P\4\12\000\000\000 175>%=$) 5P\4\8\000\000\0004561%<$P\4\9\000\000\000 175$) 5P\4\6\000\000\000=%<$9P\4\8\000\000\000\"5$$) 5P\4\6\000\000\000#$)<5P\4\7\000\000\000>%=25\"P\4\7\000\000\000#$\"9>7P\4\r\000\000\000��ʶ����ݷ��P\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\4\r\000\000\000%93?>697~41$P\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000^@\4\6\000\000\0005\"\"?\"P\4J\000\000\000\5\25\0305'xy�������g�����Ҷ����\5\25�����������ζ����ĸ����������`���a���bP\3\000\000\000\000\000\000\28@\3\000\000\000\000\000\000 @\3\000\000\000\000\000\000\"@\4\1\000\000\000P\3\000\000\000\000\000\000$@\4\7\000\000\000$9$<5#P\4\7\000\000\0003?>697P\4\7\000\000\000?\"95>$P\4\6\000\000\000$9=5\"P\4\8\000\000\000273?<?\"P\4\11\000\000\0002$>2;3?<?\"P\4&\000\000\000��ʹ����������������ĸ��������`P\4\8\000\000\000\5\25\028125<P\4\8\000\000\000\5\25\002149?P\4\7\000\000\000\5\25\02149$P\4\8\000\000\000\5\25\019853;P\4\8\000\000\000\5\25\19?=2?P\4\11\000\000\000\5\25\19?=2?\2<$P\4\12\000\000\000\5\25\19?=2?\2<$#P\4\8\000\000\000\5\25\25=175P\4\7\000\000\000\5\25\0038?'P\12\000\000\000\14\9\20 E��\16�7�\12��\8\23�P{j���X�\16�qهP| \8\9\20 ZB�;1\12t\0252\8t\25\18��x*�a\31�\
v\25\29\9v\25.Ѐ'�z�8��st�f�>ƀ�]\000(\8\6 CCfe\000\
\8\8  /�Ha�8$�zV4\18H�10oRr!\000\000\000���������y9��������y�8��y���8������\1\000\1�\2U\1\000\2\25@��\23\000\4�AA\1\000�\1\000\2��A\3��\1\000a�\2�F�A\000�\2B\000��\000\5]�\000\1\24\000�\4\23\000\1�F\2B\000��A\4��\2\2J��\1\23\000\000�`��\127\"�\000\000�\000�\127\31\000�\000\
\7\21 �]W\6d�Tk/��_��\2\19]�]\2�\11\21JI@�kP��s\11\6\16I\25�٠Ns��=!�Z\0021�@\19���6KV�!W��n\1\000\000\000\000\000\5\7!\25��NZ.�Pc8��\28�Q�7\9\000\000\000\4\6\000\000\000PAIRS \4\
\000\000\000GETuisHOW \4\r\000\000\000SINGLErESULT \4\9\000\000\000STRsPLIT \4\2\000\000\000\12 \3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000�?\4\9\000\000\000TONUMBER \4\3\000\000\000\127g \000\000\000\000\21pi\23|\0081\2�H�f;��\14ݦi&@ޖh\2�GP&��W\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 f�\6_���PW��\127'��?~\24�\14�P\24c�\22Gh*\000\9\20 ��2M+��\26�Ǉt\000\11p\"���x�@h���W�\11�J\30D�\6 \12t\0255\8t\25r��\r\26��D�w�\12�բ\3���x\26\rv\25\31\9v\25m��k8�gy2�\
O�sNS��'\28V\24�\9M\000U2\000(\8\6 �ʛ\9\000\11\8\8 *ʢ{�\27�lB�cZ�\127V4\18\2B�'\25��C�W�C\3M\6Jڅ�<���+�I�!C\000\000\000���������=}������=�=�|��=���|����<=���=�����;|��}�=����� <=�:<���<<\2��\1\000�\1�\2\1�\1\000V\1\2\3�\1\2\000�\1\000\2΁�\3\1�\1\000��\4��BB\000��B\5�\2�\2\1�\1\000@\3�\4��\1\000\22�\3\6���\1X�B\5\23@\2��BA\000��@\000\000\3�\1A\3\1\000݂�\1\r��\4�\2�\5\r��\4\7\3\3\2�\2�\5���\127�AA\000��@\000\000\2�\1A\2\1\000݁�\1ǁ�\3��\1\3ǁA\2X�\1\3\23�\1��AA\000��@\000\000\2�\1A\2\1\000݁�\1ǁ�\3���\3\"�\000\000���\127\31\000�\000\6\7\21 �#�2\23�|:�Bf\21�\29�w\15\9\16I\25�\24\9\25[�*pi��r\17�\1\5���i�b�A�=PXwh�\5\1\000\000\000\000\000\7\7!\25D>�\
#\26�r�E�T���|N�dn&a�A\12\000\000\000\4\6\000\000\000ZKCXY*\4\
\000\000\000MO^\127cyBE]*\4\12\000\000\000G_^CFxOY_F^*\4\9\000\000\000Y^XyZFC^*\4\2\000\000\000\6*\4\3\000\000\000um*\3\000\000\000\000\000\000�?\4\2\000\000\000j*\3\000\000\000\000\000\000\000\000\4\7\000\000\000Y^XCDM*\4\5\000\000\000LCDN*\000\000\000\000\000\26pi\23<J�\0239��\16���~U<�[�HvT\000\15�H/�<\24n(g\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 ��^e\\n�<�\8\9\20 �\15\7D\20\12t\0251\8t\25��t\9\rv\25\29\9v\25�ǅ|\25P�\"���*\5��\24Dl�Z\000.\8\6 :O�C���\30�==Nk=�I4��`#\4P\20\23\26g*\000\000\8\8 Y�=\26��oDm#�|�\20lM�8v\
!)W\" ��#�\1�\11�qV4\18�o�H�0id\24�mN�\127�\12�\"%X��\rCʄ�\15(�T�/�eW\000\000\000�АЖ��ЗP\16������P�P�\17��P���\17��ЍQPї�\17�V\17��\16�P��R��MQPѐ���V\17��\16�������MQP�W\17��\22\17�����\3A\2\2\000݁�\1�\1�\3�A\2\000\21\2�\2\14BA\4AB\1\000�\1\r�ƂB\000\6�B\000F�@\000�\3�\1��\1\000]��\1GC�\6\7C\3\6݂\000\1\24��\5\23@\
���B\000\6�@\000@\3�\1��\1\000\29��\1\7CA\6MCA\5GC�\2�B\3\6�BA\5��\2\3��@\000\000\3\000\3A�\1\000݂�\1�\1�\5�B\2\000\21\3\000\3\14CA\6AC\1\000��\4�ƃB\000\6�B\000F�@\000�\4�\1��\1\000]��\1G��\8\7D\4\8݃\000\1\24��\7\23\000\2���B\000\6�@\000@\4�\1��\1\000\29��\1\7�A\8MDA\7GD\4\3�C\4\8���\127�A�\127\"�\000\000���\127\31\000�\000\1\7\21 -��m\21��@��s\15\20\9\16I\25�|�_�Ȱ]�;\26{(w3@��\000r�U�%�\2yU\2�>\12\1\000\000\000\000\000\2\7!\0259&lR�ʪY\26\23gt\12\000\000\000\4\6\000\000\000������\4\
\000\000\000����������\4\r\000\000\000�������������\4\9\000\000\000���������\4\3\000\000\000���\3\000\000\000\000\000\000�?\4\2\000\000\000��\3\000\000\000\000\000\000\000@\4\2\000\000\000��\3\000\000\000\000\000\000\000\000\4\9\000\000\000���������\4\3\000\000\000���\000\000\000\000\19pi\23�L9}\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 _@�\" ��2�'�ahו\27�7�\16\23�WR�i\24gRv�\1��+.`\
\9\20 \5��R�[r`���\11�\12t\0253\8t\25���ui�c]\23�f\26�\rv\25\18\9v\0252\18s\19�FD=)ٽ f�\17'I�V\rJ\"NE��P]�\30�:�b�w��\r.\1,\8\6 Qզ\01178\rQ�m\"*�pm�\15�l\1\
\8\8 A��?`y�S�{V4\0187͞%]YpQ�9�@�\000\000\000��-����-����m���-歭��m�,+��m���0������-�-,�\15-����R����-*-m�k-l�x�-��--��-�-+m�l����,l�����{�,��쯭0�-�+��*-�k-l��,m�j�,���-�0�-��-�-��-����-���mo�����E\000\000\1��\000\000�\000\3\000&\1\000\000]�\000\000�\000�\1�@\2\000\1�\2\000AA\3\000�\1\000\000��\000\000�\000�\1\1�\3\000A\1\3\000��\3\000�\1\000\000݀\000\000\5\1�\1A\1\4\000�\1\3\000�A\4\000&\2\000\000\29�\000\000E\1�\1��\4\000��\2\000\1�\4\000f\2\000\000]�\000\000�\1�\1�\1\5\000\1�\2\000AB\5\000�\2\000\000��\000\000��\1\000�AA��A\000�ʁ����\000��\1��ʁ\1
A��\24��\2\23@\000��\1G
\1Ǎ\6��\000\21\2\000\4\25\000\000\4\23�\1�\6�A\000A\2\2\000���\000�\2\000\5V��\4�B\2\000\29B�\1\6B@\000\7�B\4F��\000G\2�\4�\2�\3\29B�\1\23\000\r�F\000@\000�\000\000\000]�\000\1\24\000�\000\23�\11�E\000�\1��\000\000��\2\000\1A\3\000f\1\000\000]�\000\000�\000�\1�@\2\000\1\1\3\000A�\3\000�\1\000\000��\000\000�\000�\1\1�\3\000A\1\3\000�A\4\000�\1\000\000݀\000\000\5\1�\1A\1\4\000��\2\000��\4\000&\2\000\000\29�\000\000E\1�\1��\4\000��\2\000\1B\5\000f\2\000\000]�\000\000��\1\000�AA��\1\000��A����\000������A\1��\1��\24�D\2\23@\000��\1G��\1Ǎ�A@\000ǁ�\3\6��\000\7�@\4@\2\000\3�A�\1\31\000�\000\5\7\21 L,B]\12�5d�\27�{�Х:#��~X\3XK��\24N\11\8\16I\25��\21lN�*u\24�7I��c1՜{R��\19\4�aQ)���\000���s\4\000\000\000\000\000\1\1\000\2\000\1\000\7!\25�̖Q\29\000\000\000\4\5\000\000\000\20\25\16\5`\4\6\000\000\000\20\1\2\12\5`\4\4\000\000\000\14\21\r`\3\000\000\000\000\000\000�?\4\6\000\000\000\16\1\9\18\19`\4\6\000\000\000,\1\2\5\12`\4\6\000\000\000\16\1\7\5\19`\4\6\000\000\000\5\18\18\15\18`\0044\000\000\000��ׅ�Ȇ�����Ն�Ѕ������L�����5)�����ǉ�Ն�І��`\3\000\000\000\000\000\000\000@\4\7\000\000\000\9\14\19\5\18\20`\4\7\000\000\000\14\21\r\2\5\18`\4\7\000\000\000\19\20\18\9\14\7`\3\000\000\000\000\000\000.@\3\000\000\000\000\000\000\8@\4\5\000\000\000\12\5\6\20`\3\000\000\000\000\000\000\16@\4\8\000\000\000PLPLRUU`\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000�\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000\000\000\4\5\000\000\000\20\5\24\20`\4\5\000\000\000\19\9\26\5`\4\6\000\000\000\1\12\9\7\14`\4\6\000\000\000\3\15\12\15\18`\4\7\000\000\000\14\15\23\18\1\16`\4\6\000\000\000\23\9\4\20\8`\000\000\000\000\000\16pi\23 4i\"��9>\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 ��b��\127<[`�\4���\31\15}S|��Z\0049G�\29tv�:��={u\
\9\20 6>�\23A�Ko�G�<'\rt\0255\8t\25sW\14\8�1�\8=֪'o��U���(�\rv\25\17\9v\0251\25�5\\\4�\28�x�\3�<�=�\31 \9��my���\21���t�+�A\1*\8\6 �ÝWB�J~�8�o\1\14\8\8 Q0�z7�*t~�K\21Ʀ\0315܁ho��5o�~V4\18�#�^�2�T� F\23q{�f�dC]6��>�\000\000\000�Ԕ�T��ԉT��̔\20��T�T���Ԟ\20�URԕ�\20���I������T�TU�vT����+����TST\20�\18T\21�\1�T��TT��T�TR\20��\21����U\21�����\2�U�Օ��I�T�R���ST��\18T\21��U\20�\19�U���T�I�T�R\20��Sԗ�\19�\23��U\23�^�U�Ô�T�Ԕ�T��ԉT���\20\23��\20�T����U\20��\21������\000]�\000\000�\000\000\1�@\2\000\1\1\4\000f\1\000\000��\000\000�\000�\1\1A\4\000A\1\4\000��\4\000�\1\000\000݀\000\000\5\1�\1A�\4\000��\3\000�\1\5\000&\2\000\000\29�\000\000E\1�\1�A\5\000��\3\000\1�\5\000f\2\000\000]�\000\000�\1�\1��\5\000\1\2\4\000A\2\6\000�\2\000\000��\000\000�\1�\1\1B\6\000A�\3\000��\000\000�\2\000\000݁\000\000\11\2\2\000\
B��\
BA�\
�\000�\
�\000�\
���\
�\1�\
\2��\
B\1�\24\000E\2\23@\000�\
�G�\
�ǎ\24\000F\3\23@\000�\
�Ǎ\
�G�F��\000U\2�\4\25\000�\4\23�\1�F�A\000�\2\2\000Ƃ�\000�\2�\5��\2\5�B\2\000]B�\1FB@\000G��\4���\000�\2\000\5�\2\000\4]B�\1F�B\000G\2�\4�BC\4ǂC\4J�\2\5\23\000\17�F\000@\000�\000\000\000]�\000\1\24\000�\000\23�\15�@\000\000\000�\000\000\1��\000\000\1\1\4\000f\1\000\000��\000\000�\000�\1\1A\2\000A\1\4\000��\4\000�\1\000\000݀\000\000\5\1�\1AA\4\000��\3\000�\1\5\000&\2\000\000\29�\000\000E\1�\1��\4\000��\3\000\1�\5\000f\2\000\000]�\000\000�\1�\1�A\5\000\1\2\4\000A\2\6\000�\2\000\000��\000\000�\1�\1\1�\5\000A�\3\000��\000\000�\2\000\000݁\000\000\11\2\2\000\
B��\
BA�\
�\000�\
�\000�\
���\
�\1�\
\2��\
B\1�\24\000E\2\23@\000�\
�G�\
�ǎ\24\000F\3\23@\000�\
�Ǎ\
�G�FB@\000G��\4���\000��@\5�\2\000\4]B�\1F�B\000G\2�\4�BC\4ǂC\4J�\2\5\31\000�\000\11\7\21 I��\5��k;\17H+r���\"W\18�>\11�(0&\21�+%�k8�*�E\12\4\16I\25�\0037z�\2�0��xxx�;� \4\000\000\000\000\000\1\1\000\2\000\1\6\7!\25@�\31s�8�\20|�@\5\6�?(��D\0048Nvt�x)@ \000\000\000\4\5\000\000\000\1\12\5\16u\4\6\000\000\000\1\20\23\25\16u\4\4\000\000\000\27\000\24u\3\000\000\000\000\000\000�?\4\6\000\000\000\5\20\28\7\6u\4\11\000\000\000'\20\17\28\0262\7\26\000\5u\4\6\000\000\000\5\20\18\16\6u\4\6\000\000\000\16\7\7\26\7u\0044\000\000\000���ݓ����������Ő������Y����� <�����Ҝ����œ��u\3\000\000\000\000\000\000\000@\4\7\000\000\000\28\27\6\16\7\1u\4\
\000\000\000\18\16\1 <&\29\26\2u\4\r\000\000\000\6\28\27\18\25\16'\16\6\000\25\1u\4\3\000\000\000\28\17u\4\5\000\000\000\25\28\6\1u\4\7\000\000\000\27\000\24\23\16\7u\4\7\000\000\000\6\1\7\28\27\18u\3\000\000\000\000\000\000\8@\4\2\000\000\000Eu\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000�\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000\24@\4\1\000\000\000u\3\000\000\000\000\000\000\28@\4\7\000\000\000\6\16\25\16\22\1u\4\7\000\000\000\28\24\20\18\16\6u\4\6\000\000\000\6\22\20\25\16u\4\6\000\000\000\2\28\17\1\29u\4\7\000\000\000\27\26\2\7\20\5u\000\000\000\000\000\22pi\0236r�R���\20���\"��9\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 ʡ�d]\24B\23�\17�\11��!2�e\19\
�tm4�G�)\7��d\7ϩ\30\20�{nZ\12\9\20 ���?,M�3lBw\18�b�^�/3$n\rt\0251\8t\25eW�Y\000\12v\25\28\9v\25v��Z�=?Z���nr�H'\1#\8\6 \\��\3�\21{f��#n���P�\11:\7\23\22�\26�cy5!$|\30�'Y&~�g\1\15\8\8 l��Z\5:^\17�J�\rskpy\26��\127_��*s��P�rV4\18�6$c�Kr\30\r��\2��I\11J�\
x#[�}F~�e6�IR�\14�l�h?\r�\000\000\000�ɉ�I��ɔI��щ\9�މ�I���Ƀ\9�HOɈ�\9���T������I�IH�kI����6����INI\9�\15I\8�\28�I��II��I�IO\9��\8����H\8�����\31�H�Ȉ��T�I�O���NI��\15I\8��H\9�\14�H���I�T�I�މ�I�ɉ�I��ɔI���\9\11��\9�I����H\9��\8������ɔI��L���\8������ɯ���TI\000\000�\000\000\1\1A\3\000A\1\3\000�\1\000\000݀\000\000\5\1�\1A�\3\000��\2\000��\3\000&\2\000\000\29�\000\000E\1�\1�\1\4\000�\1\3\000\1B\4\000f\2\000\000]�\000\000�\1�\1��\4\000\1\2\3\000A�\4\000�\2\000\000��\000\000�\1�\1\1\2\5\000A\2\3\000�B\5\000�\2\000\000݁\000\000\5\2�\1A�\5\000��\2\000��\5\000&\3\000\000\29�\000\000E\2�\1�\2\6\000��\2\000\1C\6\000f\3\000\000]�\000\000��\2\000�B\000��BA�������\000����\2\1��B����\1��B���\2\2�\24�E\4\23@\000���Ȑ��H�Ƃ�\000�\2�\5\25\000�\5\23�\1���A\000\1\3\2\000F��\000U\3�\6\22C\3\6AC\2\000�B�\1�B@\000ǂ�\5\6��\000\7\3\000\6@\3\000\5�B�\1\23\000\18�F\000@\000�\000\000\000]�\000\1\24\000�\000\23�\16�@\000\000\000�\000\000\1��\000\000\1\1\3\000f\1\000\000��\000\000�\000\000\1\1A\2\000A\1\3\000�\1\000\000݀\000\000\5\1�\1AA\3\000��\2\000��\3\000&\2\000\000\29�\000\000E\1�\1��\3\000�\1\3\000\1B\4\000f\2\000\000]�\000\000�\1�\1�\1\4\000\1\2\3\000A�\4\000�\2\000\000��\000\000�\1�\1\1�\4\000A\2\3\000�B\5\000�\2\000\000݁\000\000\5\2�\1A\2\5\000��\2\000��\5\000&\3\000\000\29�\000\000E\2�\1��\5\000��\2\000\1C\6\000f\3\000\000]�\000\000��\2\000�B\000��BA�������\000����\2\1��B����\1��B���\2\2�\24�E\4\23@\000���Ȑ��H��B@\000ǂ�\5\6��\000\7�@\6@\3\000\5�B�\1\31\000�\000\4\7\21 \11�Zp{~�s��f\29�gDA?��z��\0008\14\000\16I\25`�p\25\4\000\000\000\000\000\1\1\000\2\000\1\8\7!\25ĽX^\0268\000B�� 9���o܂�O\22\28�2��o;\5{z�\16>\3$\000\000\000\4\5\000\000\000.#*?Z\4\6\000\000\000.;86?Z\4\4\000\000\0004/7Z\3\000\000\000\000\000\000�?\4\6\000\000\000*;3()Z\4\5\000\000\000\31>3.Z\4\6\000\000\000*;=?)Z\4\6\000\000\000?((5(Z\0044\000\000\000������Ӽ�ҳ�����߼�ȿ��v��ɿ��\15\19��ڿ���������Z\3\000\000\000\000\000\000\000@\4\7\000\000\00034)?(.Z\4\7\000\000\0004/78?(Z\4\7\000\000\000).(34=Z\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000.@\3\000\000\000\000\000\000\20@\4\5\000\000\0006?<.Z\3\000\000\000\000\000\000\24@\4\8\000\000\000jvjvhooZ\3\000\000\000\000\000\000\28@\4\8\000\000\000>?<;/6.Z\3\000\000\000\000\000\000 @\3\000\000\000\000\000\000�\3\000\000\000\000\000\000\"@\3\000\000\000\000\000\000\000\000\4\3\000\000\0003>Z\4\7\000\000\000*(57*.Z\4\5\000\000\000.?\".Z\4\7\000\000\00018.#*?Z\4\5\000\000\000)3 ?Z\4\6\000\000\000;63=4Z\4\6\000\000\0009565(Z\4\7\000\000\00045-(;*Z\4\6\000\000\000-3>.2Z\000\000\000\000\000\24pi\23��.YjGbf�\25�M��\21\\:@�q-��E�.�Y���Wc��\23�=�F\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 ��)\28\11\\\6\28�\7�i�+�_�\14d/�Ƹ?K\11\9\20 ���\5�/�%�\rt\0253\8t\25��X\7&Q�^98�mG\12v\25\28\9v\25���\3wF�_Q\
Q(-\1�M\1,\8\6 �o\\:ʮ�H4|NI\8$\19%3�eK\1\r\8\8 �i�\127?�W\25���\2��T\31�}�\0234yV4\18���\1\3\1\000\000r4t4�444i�45,t�4#4:�\127444~�t��4u4�444�455#44�~��6��44\0235�K~tu���u4���45564���5�445�u43u�4u564鴴5�4�5l�45#�4���v4��645574�t�5�tw4��w5���43u�4�4�5��u4���45564���5��t5~������4���4�4�5-��5#�5���v4�4042��4!546�4�55574�t�5�tt4�tp5���43��4�4�545�4�t�5#�\4�r4t4�444i�4\1\24��\000\23\000\25�E\000\000\1��\000\000��\4\000&\1\000\000]�\000\000�\000\000\1�\000\3\000\1�\4\000f\1\000\000��\000\000�\000�\1\1\1\5\000A�\4\000�A\5\000�\1\000\000݀\000\000\5\1�\1A�\5\000��\4\000��\5\000&\2\000\000\29�\000\000E\1�\1�\1\6\000��\4\000\1B\6\000f\2\000\000]�\000\000�\1�\1��\6\000\1�\4\000A�\6\000�\2\000\000��\000\000�\1�\1\1\2\7\000A�\4\000��\000\000�\2\000\000݁\000\000\6�A\000@\2�\000�\2\2\000\29��\1\21\2\000\4F�A\000�\2\000\1�\2\2\000]��\1U\2�\4X@\2\4\23�\000�\6�B\000A�\2\000�\2\3\000\29B�\1\11\2\2\000F�A\000�\2�\000�\2\2\000]��\1G��\4\
B��\
BA�\
���\
�\
�\1�\
�\
\2\1�\
B��\24�E\2\23@\000�\
�Ȑ\
�H�F�H\000\24��\4\23@\000�\
�H�\
�ȏF��\000U\2�\4\25\000�\4\23�\1�F�B\000�\2\4\000���\000�\2�\5��\2\5�\2\3\000]B�\1FB@\000GB�\4���\000�\2\000\5�\2\000\4]B�\1FBC\000G��\4�BB\4J��\000\23@\22�F\000@\000�\000\000\000]�\000\1\24��\000\23\000\21�@\000\000\000�\000\000\1��\000\000\1�\4\000f\1\000\000��\000\000�\000�\1\1\1\3\000A�\4\000�A\5\000�\1\000\000݀\000\000\5\1�\1A\1\5\000��\4\000��\5\000&\2\000\000\29�\000\000E\1�\1��\5\000��\4\000\1B\6\000f\2\000\000]�\000\000�\1�\1�\1\6\000\1�\4\000A�\6\000�\2\000\000��\000\000�\1�\1\1�\6\000A�\4\000��\000\000�\2\000\000݁\000\000\6�A\000@\2�\000�\2\2\000\29��\1\21\2\000\4F�A\000�\2\000\1�\2\2\000]��\1U\2�\4X@\2\4\23�\000�\6�B\000A�\2\000�\2\3\000\29B�\1\11\2\2\000F�A\000�\2�\000�\2\2\000]��\1G��\4\
B��\
BA�\
���\
�\
�\1�\
�\
\2\1�\
B��\24�E\2\23@\000�\
�Ȑ\
�H�F�H\000\24��\4\23@\000�\
�H�\
�ȏFB@\000GB�\4���\000��@\5�\2\000\4]B�\1FBC\000G��\4�BB\4J��\000\31\000�\000\5\7\21 lE�j.L`A��A\22ߣ\\\"�)8G�,�;��v>\12\5\16I\25\000~�\26\1\26d,@%jh�x*\30\4\000\000\000\000\000\1\1\000\2\000\1\3\7!\25�/�\16�y�k$\000\000\000\4\5\000\000\000?2;.K\4\6\000\000\000?*)'.K\4\4\000\000\000%>&K\3\000\000\000\000\000\000�?\4\6\000\000\000;*\"98K\4\14\000\000\000\8#.( \9$3\0129$>;K\4\9\000\000\0008?9\24;'\"?K\4\3\000\000\000\"/K\4\2\000\000\000gK\4\5\000\000\000'\"8?K\4\6\000\000\000.99$9K\4<\000\000\000h��Ӣ�Ģ�ң��A���������Ѣ�­�ͬ�Ϯ�Ӣ�į�Ţ�¢���Ĭ����K\3\000\000\000\000\000\000\000@\4\
\000\000\000,.?\30\2\24#$<K\4\12\000\000\000&>?\"'\25.8>'?K\4\6\000\000\000;*,.8K\0044\000\000\000�������­�â�������έ�ٮ��g��خ��\30\2��ˮ����������K\4\7\000\000\000\"%8.9?K\4\7\000\000\000%>&).9K\4\7\000\000\0008?9\"%,K\3\000\000\000\000\000\000\8@\4\2\000\000\000{K\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000�\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000\24@\4\1\000\000\000K\3\000\000\000\000\000\000\28@\4\7\000\000\0008.'.(?K\4\7\000\000\000\"&*,.8K\4\6\000\000\0008(*'.K\4\6\000\000\000<\"/?#K\4\7\000\000\000%$<9*;K\000\4\6\000\000\000'\"8?yK\000\000\000\000\20pi\23`�\23K�(Z4���!h�*pƳ�\127Ğ#}\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 ���$=\14\9\20 \"��9\30��3��\8~�G\31m}�e\21\20rx_�\24�\
�\rt\0252\8t\25ƜMI��GN�\12v\25\16\9v\25�+:Q�$�p\1�\\`���\18��� �ƒ+yÄ&\25�$\1!\8\6 ⽖\25\2x']x\31�b���W\\��\4bǠ[\000ù ��L}\1\
\8\8 ���\1#��d6|V4\18ܠ�b\30mu'RT\31K�\18xB�\000\000\000p6v6�666k�67.v�6!�>�}666|�v��6w6�666�677!66�|��4��66\0217�I|vw����6��6�6�7/��7!�7���w6�6460��6#764�6�77w46�v�7�vv6��t7��61��6�6�767�6�v�7��t6�6u7�v�61��6�6�7!v+�F\000@\000�\000\000\000]�\000\1\24��\000\23@\15�E\000\000\1��\000\000�\000\4\000&\1\000\000]�\000\000�\000\000\1�@\2\000\1\1\4\000f\1\000\000��\000\000�\000�\1\1A\4\000A\1\4\000��\4\000�\1\000\000݀\000\000\5\1�\1A�\4\000��\3\000�\1\5\000&\2\000\000\29�\000\000E\1�\1�A\5\000��\3\000\1�\5\000f\2\000\000]�\000\000��\1\000�A���AA���\000������A\1��\1��\24\000E\2\23@\000���F���ƌƁ�\000�\1�\3\25\000�\3\23�\1���A\000\1\2\2\000F��\000U\2�\4\22B\2\4AB\2\000�A�\1�A@\000ǁ�\3\6��\000\7\2\000\4@\2\000\3�A�\1��B\000�\1�\3\7BC\3G�C\3�A\2\4\23�\12�F\000@\000�\000\000\000]�\000\1\24\000�\000\23@\11�@\000\000\000�\000\000\1��\000\000\1\1\4\000f\1\000\000��\000\000�\000�\1\1A\2\000A\1\4\000��\4\000�\1\000\000݀\000\000\5\1�\1AA\4\000��\3\000�\1\5\000&\2\000\000\29�\000\000E\1�\1��\4\000��\3\000\1�\5\000f\2\000\000]�\000\000��\1\000�A���AA���\000������A\1��\1��\24\000E\2\23@\000���F���ƌ�A@\000ǁ�\3\6��\000\7�@\4@\2\000\3�A�\1��B\000�\1�\3\7BC\3G�C\3�A\2\4\31\000�\000\
\7\21 i��|���\11\\X�\000��WqC��\\\8}gq���Q\2��o\
\3\16I\25ͻG}{G\22\22\4\000\000\000\000\000\1\1\000\2\000\1\8\7!\25(UJl]\5�/\18��\19�t\25OW\3N\7oß\24\3<�*W�\7(\2��\21\27\000\000\000\4\5\000\000\000IDMX=\4\6\000\000\000I\\_QX=\4\4\000\000\000SHP=\3\000\000\000\000\000\000�?\4\6\000\000\000M\\TON=\4\9\000\000\000~RP_R\127RE=\4\6\000\000\000M\\ZXN=\4\6\000\000\000XOORO=\0044\000\000\000Ւ�ء�ۡ�ۨ�Ԝ�ۨ�ػ�۲�ظ�\17؀�ش�htۡ�ؙ�Ԝ�ۨ�ۥ�=\3\000\000\000\000\000\000\000@\4\7\000\000\000TSNXOI=\4\
\000\000\000ZXIhtnURJ=\4\r\000\000\000NTSZQXoXNHQI=\4\3\000\000\000TY=\4\5\000\000\000QTNI=\4\7\000\000\000SHP_XO=\4\7\000\000\000NIOTSZ=\3\000\000\000\000\000\000\8@\4\2\000\000\000\r=\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000�\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\4\7\000\000\000NXQX^I=\4\7\000\000\000SRJO\\M=\4\6\000\000\000JTYIU=\000\000\000\000\000\17pi\23\r��)%I�z��e\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 �{pْ�\9H\127(/\15\1:*ٞ\r{n\16\19VE��w�\8\9\20 İl%\5\14t\0256\8t\25w��\29^�MU��\"\11���\23Q\9\4-�o�@�\12v\25\28\9v\25���a�0�n�iU�� 0\1.\8\6 ��b!S�._M'v=�d\26dEL�_��K_�Ҏ!\1\14\8\8 �D�O�e.+�S�\28�E\1z�\4<&Rd�r�pV4\18b�,'��\2\23vJ�Hڤ\15E\19kPl&��S�,�\\etT\25�\000\000\000����}����}���=��=�}�����=�|{���=���`������}�}|�_}����\2����}{}��z=��;�����?��|��z<?��|��w�|�{���:�>��|��`}}�z=���}�{z}=�;=>�(�}��}}��}�}{���<����<>�����+�|��|��`�}�{���z=��;=>��|=�:�|���}�`�}���}����}����}����8��=�}����|=��<���&\1\000\000]�\000\000�\000\000\1��\4\000\1A\5\000f\1\000\000��\000\000�\000\000\1\1�\5\000AA\5\000�\1\000\000݀\000\000\5\1\000\1A�\5\000�A\5\000�\1\000\000\29�\000\000E\1�\1�\1\6\000�A\5\000\1B\6\000f\2\000\000]�\000\000�\1�\1��\6\000\1\2\5\000A�\6\000�\2\000\000��\000\000�\1�\1\1\2\7\000A\2\5\000�B\7\000�\2\000\000݁\000\000\6BC\000@\2�\000��\3\000\29��\1\21\2\000\4X�D\4\23�\000�\6\2D\000A�\7\000��\4\000\29B�\1\11\2\2\000FBC\000�\2�\000��\3\000]��\1G��\4\
B\2�\
BA�\
���\
\2��\
�\1�\
B��\
�\
�\1�\24�F\3\23@\000�\
�H�\
�H�F��\000U\2�\4\25\000�\4\23�\1�F\2D\000�B\4\000���\000�\2�\5��\2\5��\4\000]B�\1FB@\000G��\4���\000�\2\000\5�\2\000\4]B�\1F�A\000G��\4�BB\4��\2\000\7�B\4�\2\3\5J��\000\23\000\20�F\000@\000�\000\000\000]�\000\1\24@�\000\23�\18�@\000\000\000�\000\000\1��\000\000\1A\5\000f\1\000\000��\000\000�\000\000\1\1�\4\000AA\5\000�\1\000\000݀\000\000\5\1\000\1A�\5\000�A\5\000�\1\000\000\29�\000\000E\1�\1��\5\000�A\5\000\1B\6\000f\2\000\000]�\000\000�\1�\1�\1\6\000\1\2\5\000A�\6\000�\2\000\000��\000\000�\1�\1\1�\6\000A\2\5\000�B\7\000�\2\000\000݁\000\000\6BC\000@\2�\000��\3\000\29��\1\21\2\000\4X�D\4\23�\000�\6\2D\000A�\7\000��\4\000\29B�\1\11\2\2\000FBC\000�\2�\000��\3\000]��\1G��\4\
B\2�\
BA�\
���\
\2��\
�\1�\
B��\
�\
�\1�\24�F\3\23@\000�\
�H�\
�H�FB@\000G��\4���\000��@\5�\2\000\4]B�\1F�A\000G��\4�BB\4��\2\000\7�B\4�\2\3\5J��\000\31\000�\000\5\7\21 G��(UZ({`��\3.�P~\22.I+(w�4-Y�\31\r\5\16I\25u�\9rѽ�\3�;+j$SUQ\4\000\000\000\000\000\1\1\000\2\000\1\000\7!\25I\16�W$\000\000\000\4\5\000\000\000����\4\6\000\000\000�����\4\4\000\000\000����\3\000\000\000\000\000\000�?\4\6\000\000\000�����\4\9\000\000\000��������\4\
\000\000\000���������\4\r\000\000\000�������������\4\5\000\000\000����\4\5\000\000\000�����\4\3\000\000\000�Ԕ\4\5\000\000\000�����\4\3\000\000\000��\4\9\000\000\000���������\4\2\000\000\000��\4\6\000\000\000�����\4\6\000\000\000�����\0044\000\000\000|;#q\8<r\8\29r\1\28}5!r\1$q\18\17r\27\6q\0171�q)\7q\29\25��r\8\20q03}5!r\1$r\12;�\3\000\000\000\000\000\000\000@\4\7\000\000\000�������\4\7\000\000\000������\4\7\000\000\000������\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\4\2\000\000\000��\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000�\3\000\000\000\000\000\000\28@\3\000\000\000\000\000\000\000\000\4X\000\000\000�q\27\12}\19\27}\000\r|;;�|;#s5:|:0|\21\000q\30<r5\18r\8\29p,0p,>q\27\12}\19\27�q\0272q0\2p,\20p,>q\27\12}\19\27p,.q\17'|\21\000r5\18s\14\16q\27\12}\19\27�\4\7\000\000\000������\4\7\000\000\000������\4\7\000\000\000�������\4\6\000\000\000������\000\000\000\000\000\23pi\23M��P-d\17tl�\29\27���v\127ȫf\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 3&\\e\23D�A\28@5v��\1r���e�BK\4e�j`�5T\"�\15\9\20 ke�\r�aevX��\15\4\11�9E��R\22ؖbZ\14t\0258\8t\25�Ԡi�d41��V\14�Z14Z|7\19_:�<[��x*ZQ\2.\15v\25\25\9v\25�\14=\24\1#\8\6 \7\24�+�j�\rC�b\23:>\15\17�NO_��\r�:\17\3�~E5\8B�\17d\9|c\1\11\8\8 �\r`\rh>�\12�\25Xe\23{V4\18�$\25\31#\\�V׸\8\127�\000\000\000Q\23W\23�\23\23\23J�\23\22\15W�\23\000W\16�\\\23\23\23]�W��\23V\23�\23\23\23�\23\22\22\000\23\23�]��\21��\23\0234\22�h]WV����\23ї�\23�\23�\22\14��\22\000�\22���V\23�\23\21\23\17��\23\2\22\23\21�\23�\22\22V\21\23�W�\22�WW\23��U\22ї�\23\16��\23�\23�\22\23\22�\23�W�\1\23@\24�F\000@\000�\000\000\000]�\000\1\24��\000\23�\12�E\000\000\1��\000\000�\000\3\000&\1\000\000]�\000\000�\000\000\1�@\2\000\1\1\3\000f\1\000\000��\000\000�\000�\1\1A\3\000A�\2\000��\3\000�\1\000\000݀\000\000\5\1�\1A�\3\000��\2\000�\1\4\000&\2\000\000\29�\000\000K�\1\000JA��JAA�J�\000��\1E\000J���J\1��J�\000�\24��\1\23@\000�J�ŊJ�E����\000�\1\000\3\25\000\000\3\23�\1���A\000�\1\2\000\6��\000\21\2\000\4�\1�\3\1B\2\000�A�\1�A@\000��B\3Ɓ�\000�\1�\3\000\2�\2�A�\1\23\000\
�F\000@\000�\000\000\000]�\000\1\24\000�\000\23�\8�@\000\000\000�\000\000\1��\000\000\1\1\3\000f\1\000\000��\000\000�\000�\1\1A\2\000A�\2\000��\3\000�\1\000\000݀\000\000\5\1�\1AA\3\000��\2\000�\1\4\000&\2\000\000\29�\000\000K�\1\000JA��JAA�J�\000��\1E\000J���J\1��J�\000�\24��\1\23@\000�J�ŊJ�E��A@\000��B\3Ɓ�\000���\3\000\2�\2�A�\1\31\000�\000\4\7\21 �05@�\29=0���\"2�ft�tCM:�_\9\000\16I\25\26��E\4\000\000\000\000\000\1\1\000\2\000\1\11\7!\25?c�\5\21�\12oS\15\8\24\11�b\19X�o\6�M\23)�|�b��\7\20��(,���\23\24\000\000\000\4\5\000\000\000���ȭ\4\6\000\000\000����ȭ\4\4\000\000\000����\3\000\000\000\000\000\000�?\4\6\000\000\000����ޭ\4\9\000\000\000�������խ\4\6\000\000\000����ޭ\4\6\000\000\000����߭\0044\000\000\000E\2\26H1\5K1$K8%D\12\24K8\29H+(K\"?H(\8�H\16>H$ ��K1-H\9\
D\12\24K8\29K5\2�\3\000\000\000\000\000\000\000@\4\7\000\000\000�����٭\4\7\000\000\000�����߭\4\7\000\000\000�����ʭ\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000�\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\000\000\4\3\000\000\000�ɭ\4\11\000\000\000���������ȭ\4\7\000\000\000�����٭\4\4\000\000\000����\4\7\000\000\000�����ݭ\4\6\000\000\000����ŭ\000\000\000\000\000\23pi\23�\15���o��J3Y�}\28���T\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 .,�LQr{\28���<�N�Yͩ�M���\3R\14\9\20 �=�\8\\f�'���$�.\14'6��A�\16�P\19.�{�\14t\0257\8t\25\8\14\16F\31��\28\27i\9UΦ\1m��\14t\14\24�\3�Hifs\15v\25\31\9v\25�.{M�x\23C� \27F��\30kʡ�\1��k\20q��\19\1 \8\6 \5o�0�Q6P�\28�'�\24�~�J�S�[F|zE�\23��H\\T�.$\1\1\8\8 C�V\3���e\19�\15\rW��~zK\27\17\27�\31Sv��\27��$f�!@d}V4\18��&���BU�{7�g�i?��\8�\000\000\000\"d$d�ddd9�de|$�ds$c�/ddd.�$��d%d�ddd�deesdd�.��f��ddGe�\27.$%���d��d�d�e}��es�e��%d�dfdb�dqedf�d�ee%fd�$�e�$$d��&e��dc�d�d�ede�d�$�es$\127�\"d$d�d\000\000]�\000\1\24��\000\23@\14�E\000\000\1��\000\000�\000\3\000&\1\000\000]�\000\000�\000�\1�@\2\000\1\1\3\000AA\3\000�\1\000\000��\000\000�\000�\1\1�\3\000A�\2\000��\000\000�\1\000\000݀\000\000\5\1�\1A�\3\000��\2\000�\1\4\000&\2\000\000\29�\000\000E\1�\1�A\4\000��\2\000\1�\4\000f\2\000\000]�\000\000��\1\000�AA��A����\000������A\1��\1��\24\000D\2\23@\000��\1F��\1ƋƁ�\000�\1�\3\25\000�\3\23�\1���A\000\1\2\2\000F��\000U\2�\4\22B\2\4AB\2\000�A�\1�A@\000ǁ�\3\6��\000\7\2\000\4@\2\000\3�A�\1\23�\11�F\000@\000�\000\000\000]�\000\1\24\000�\000\23@\
�@\000\000\000�\000�\1��\000\000\1\1\3\000AA\3\000�\1\000\000��\000\000�\000�\1\1A\2\000A�\2\000��\000\000�\1\000\000݀\000\000\5\1�\1A�\3\000��\2\000�\1\4\000&\2\000\000\29�\000\000E\1�\1��\3\000��\2\000\1�\4\000f\2\000\000]�\000\000��\1\000�AA��A����\000������A\1��\1��\24\000D\2\23@\000��\1F��\1Ƌ�A@\000ǁ�\3\6��\000\7�@\4@\2\000\3�A�\1\31\000�\000\4\7\21 K\9Ck�a\29��>6C�c9�\23IN��t\6\
\11\16I\25�0\28MY60Z�O�]Dv�d�x68\18�\1fVv!6v�9��vgyG�.\4\000\000\000\000\000\1\1\000\2\000\1\5\7!\25=\25�x�F�\1\3\16�T�Ͷ^\25\000\000\000\4\5\000\000\000&+\"7R\4\6\000\000\000&30>7R\4\4\000\000\000<'?R\3\000\000\000\000\000\000�?\4\6\000\000\000\"3; !R\4\6\000\000\000\27?357R\4\6\000\000\000\"357!R\4\6\000\000\0007  = R\0044\000\000\000�������۴�ڻ�����״�����~������\7\27��ҷ���������R\3\000\000\000\000\000\000\000@\4\7\000\000\000;<!7 &R\4\7\000\000\000<'?07 R\4\7\000\000\000!& ;<5R\4\7\000\000\00017<&7 R\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000�\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\4\4\000\000\000! 1R\4\6\000\000\0003>;5<R\4\6\000\000\000!13>7R\4\7\000\000\000<=% 3\"R\4\6\000\000\000%;6&:R\000\000\000\000\000\21pi\23\11�idv��H\000�Rh�\18D'̕3\000�B�Q\6�90\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 \27��!|\25�l�Y\29\20(;�w(�/\0243t�=��6-���u\15}�\26R\15\9\20 �I&\15�39a�5�e��KN�\14\0224�A�\4�\14t\0254\8t\25٬�\127��Q\26�x�ek9�O�\15v\25\27\9v\25�U�\28#c\2>��_Q\000/\8\6 ��1.�R�F\24\127�/��u\000��ih��J\28\1\9\8\8 �\22�_�}V4\18�\0063\rr@X*y\4fm0�\000K�$�8/\000\000\000����t����u��ru5�25����u�(u����������st��5�u�h4�\1J���\000\1\000\3\24�A\2\23�\5�F\1B\000�\1A\000�AA\3]\1\1\1\23@\000��BB\000�B\2\4b�\000\000���\127F\1A\000G��\2]A�\000F\1A\000G��\2]A�\000F\1A\000G\1�\2]A�\000\24@C\000\23@\2�A�\1\000_\1\000\1\23�\1�\24@C\000\23�\000�AA\3\000_\1\000\1\23@\000�F�C\000]A�\000\31\000�\000\8\7\21 (�9,�Zx\30\18*�J��O`a�<#�;o_���_\25j�=���D\9א/\11\2\16I\25J\
�a-:�m���8\2\000\000\000\000\000\1\1\5\7!\25\30\19�\27?\r\19\127#'�#��:\28\15\000\000\000\4\8\000\000\000 7#'; 7R\4\3\000\000\000!(R\4\5\000\000\0008!=<R\4\7\000\000\0007<1=67R\4\
\000\000\00057&\7\27\1:=%R\4\7\000\000\000$3>'7!R\4\7\000\000\000!:=%\7\27R\3\000\000\000\000\000\000�?\4\6\000\000\000\"3; !R\4\3\000\000\000\r\21R\4\7\000\000\000=\"&;=<R\4\8\000\000\000=\"&;=<!R\4\
\000\000\000=\"&;=<\000>&R\3\000\000\000\000\000\000\000\000\4\9\000\000\000>'3\r7*;&R\000\000\000\000\20pi\23���?���0��xGuIktdg=\3H\6�T\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\22pi\23�k�px��\31Ů�W+�/m\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 �+\22\15@�4\8\12&�\r�ԇ\21�\14\9\20 \17`�_�,\16a&p�bbE�1E��5�˓=�ڞ8�\14t\0251\8t\25���v�\15v\25\31\9v\25%�\11\19�N\15e�HL'��9!�US\11�\24\11T���v\000#\8\6 \
�E\17\27׽{k��0���bG!� Z��cw�\4|�L�/���k���\9\4\11\8\8 \18��g\"��\28��\127%�yV4\18��\18W.\000\000\000��Ņ�D\5�\3�Ņ\2\4ņ\24\4\5�E����G��S�\7���ą�\7\5��Ǆ�\5��\3\22�\2\4e\2\000\000X�A\000\23@\1�X��\000\23�\000�X�A\1\23@\000�\24��\1\23�\1���\1\000��\1\000\14\3B\2�\000�\2�\000\000\6@\000�\5\000\000\000\5�BB\000�\2�\3\000\3\000\000@\3�\000�\3\000\1�\3�\1�B\000\3��B\000�\2�\3�B\000\1��B\000�\2\3\000�B\000\1�\2�\4�\2\000\4�B\000\1\31\000�\000\8\7\21 8�y=~��\15�c�8\25b�3\6�jU#S�Kϰ\14\25�\9�|�J�l[\6b$\16\4\16I\25P2�c�VsVt�\7bk\9�_\20��\6\1\000\000\000\000\000\000\7!\25�*}\000\r\000\000\000\4\14\000\000\000��������������\4\3\000\000\000���\4\5\000\000\000�����\4\5\000\000\000Ě���\4\9\000\000\000���������\4\6\000\000\000Ř����\000\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000�?\4\9\000\000\000���������\4\17\000\000\000�����������������\4\7\000\000\000�������\3\000\000\000\000\000\000I@\1\000\000\000\11\9\20 ���\29�t�i�\8\9\20 \\�\27B�\14t\0252\8t\25\127��2\\��\9�\15v\25\31\9v\25��k\r�,#��UI��v6ِ+\15�\25\16kx�\27X\000+\8\6 \23��x\11i\
\3\1\
\8\8 ���\25=a�\0202rV4\18���=j��VXE�t�e\0310�\7d>\5u�'-`o(V��[��\17EAa*\5\000\000\000t2r2u@�\000�\000�\000]@\000\1\31\000�\000\3\7\21 \30��S\3\9\16I\25!��cz5y]�O\27g�U�pnť\000�7q0wTq'GV�\15\2\000\000\000\000\000\1\8\3\7!\25�\25�\127��}%\2\000\000\000\4\3\000\000\000���\4\7\000\000\000�������\000\000\000\000\27pi\23���\2�\21�_Zn�-8�a\23O?�=`��)\
�(U�;�\20��l\30\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\24pi\23tC\26S�D2FҞ�-��\r/�.�W\24�\24Xm��_�ķ+!\15�x��sC\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 \18\
�H�-`'�\30Pm��\18v��\16p�#y\8q6�6W�&k�\19\0318E\r\9\20 �MO\0126�\127=y9�uH�g\27�\14t\0253\8t\25H\5\rI��\16a��RH�\15v\25\31\9v\25vѳ\\DE�\9���`��=c���d�J\r~�\11�\25\1-\8\6 *nJ+�'�\15�V�]<x�s\000\2\8\8 �u�J�S�i�\0166''�LSB�� ۘ\\\18\20�k\11\22p�Kd!�)���\23\1~V4\18\28�\"3gGl %`Vh�;3\20\29C�h;�Tw\12\000\000\000\4\1\1\1@\1\1\1�A\1\1�\000\000\000\29�\000\000K\000\000\000�\000\000\000�\000\000\1\000\1\000\000�\000\000\1�\000\000\000\31\000�\000\1\7\21 a�Rr�c�W�\9%T\5\7\16I\25���Ud\21�m���R�\28>\1X=�}�\22:0\2\000\000\000\1\2\000\000\7\7!\0251��4#�\r{��'_���[J%ZN4s�\127\2\000\000\000\3\000\000\000\000\000\000�?\4\6\000\000\0001$') E\1\000\000\000\8\9\20 ��BpC\1\9\20 ��.ؿ�&��H��rn�\21]kU�?\2۩�m�57�\14t\0258\8t\25x�h$���|���E�\15�?=+�,�7o\26�Q�(�>�\4�\15v\25\28\9v\25k��E�c�g�A0\25DӥX\000,\8\6 \0220�$\15�u~�N\20g0y�5�\28N\1\9\8\8 �^�I\rqV4\18�\30�p\16�4)��kt�4�[e�t+�n\17bz�\24\19Q\15�\14 \15z\6#\000\000\000K\rM\r�\r\r\rP�\r\12UM�\r\26M\r�\18\r\r\12\26\r\12�K\r�\rV\r\r\000\23@\000�F\000�\000_\000\000\1K\000\000\000H@\000\000��@\000�\000\000\000�\000\1\1\23�\1��\1\000\1\000\2�\2݁\000\1\5\2\000\1@\2\000\3\29�\000\1J\000�\3��\000\000#��\127��@\000�\000�\000\6\1A\000@\1\000\000\29\1\000\1�\000\000\000�\000\000\000\31\000�\000\3\7\21 D\15aT\
\000\16I\25\\\5�<\3\000\000\000\000\1\1\1\1\2\000\7!\25�p�n\5\000\000\000\4\5\000\000\0007:3&C\4\6\000\000\0007\"!/&C\4\6\000\000\0003\"*10C\4\r\000\000\0000&7.&7\"7\"!/&C\4\r\000\000\000$&7.&7\"7\"!/&C\000\000\000\000\20pi\23��D;(y4���(���]\127�\30\r�L�\18\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\19pi\23�ݔ\11\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 ���,�5B\7�~�#U��\19 \14/P%M\1=e�W\17]`\17^Zv\0241s�\r\9\20 ��$k�˴\31VMR��\28�\14t\0255\8t\25��/K��Y8�f�/Y_�\r\4�`<�\15v\25\30\9v\0256\11�\"\14�%FQ�tNY�hgzOCS\8�\\\000#\8\6 \12��1\3�i\9�4�\16�6�UX�Q\29�B�`Ҿ3{���\2ؚ�=3БU\000\r\8\8 ���S��Z-�;�`��Os\18��z�yV4\18�N\21F\r\000\000\000���򴲲�2r�=��\000\24��\1\23@\000�\1�\000\000\23�\000�\24\000�\1\23\000\000�\1@\1\000\31\000\000\1\31\000�\000\3\7\21 �ޯ@\4\11\16I\25\16�6r>�Tjm��v\0301\\8�a�8ƥ�]���\11�DY\21��lg�8R=\1\000\000\000\000\000\8\7!\25�� x�o�\18�\20<�\28\4Y[.0\14�\24�>i��\22���c��b4\6\000\000\000\3\000\000\000\000\000\000\000@\4\14\000\000\000��������������\3\000\000\000\000 �DA\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000(A\3\000\000\000\000\000\000�?\000\000\000\000\19pi\23J�\28\17\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 Q\23�\5\22�x^=�^\19\0069lm�\
\0225�PQ*���T�W�\27�\15\9\20 ��\12\
�O�\24~H�ae��\15���7�L\000`�\14t\0255\8t\25�4�mH\23�>�<4]En\6`<C�\4�\15v\25\30\9v\25�&\27\5ݩZ^z%\15S�̴f'�,q���-\1/\8\6 0C�\26ݞX3a�C|m\26�-��� D\4Z1\000\
\8\8 �btu�[ M�rV4\18�;-W��l[�?T\8��\2gj�k\19��Th���\6\23\7�\000�='���c%\000\000\000����Ώ��\14Ϗ�i����\15���\15O��OO�\15����\15��\9��\000�\000A\1�@\1\000��\000\1ƀ�\000���\1\11�\1\000G�A\1\
A\1�G�A\1\
A��G\1B\1\
A\1�\
�\
�\
�B�݀\000\1\26@�\1\23@\1�\rA�\1\25\000�\000\23�\000�\3\1�\000\31\1\000\1\23@\000�\3\1\000\000\31\1\000\1\31\000�\000\1\7\21 ,��+�\127�{\25�\28f\6\4\16I\25O��N�h�L1/Y{�,�|'��j\2\000\000\000\1\2\000\000\5\7!\25���/���fΌ�C���P\14\000\000\000\3\000\000\000\000\000\000�?\4\6\000\000\000������\4\3\000\000\000���\4\5\000\000\000�����\4\5\000\000\000�����\4\3\000\000\000��\4\4\000\000\000����\4\6\000\000\000������\4\5\000\000\000�����\4\5\000\000\000�����\3\000\000\000\000\000\000\000\000\4\7\000\000\000�������\4\7\000\000\000�������\3\000\000\000\000\000\24�@\000\000\000\000\26pi\23\19�!\28~\6\23F�\26[eҘ\14_���lHV�<[�{:�=�t\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 ��\0077�|;m3C\15;\21��-̻�~ʿ�1�A)\22\\��\14�*M�\8\9\20 ���n'\15t\0253\8t\25\19�&%_�\25\31\15/�i�\15v\25\25\9v\25G��y\1+\8\6 �hN;�\23o\000\000\r\8\8 �Q�;\1\18�`���o�u�j��ww\9{V4\18פ#:^��CˬrW�\000\000\000\12\9\9\9H\9\9\9�I\9\9�\9\9\9\20�\9\9O��\9��\9\9T�\9\8�\9�\9�\9\9\9,\8\9\9lH\9\9�HH\9�\8\9\9\30�\11��\8\9\11�HH\9\8�\8\9���\8�\8\9\9\30\9\9�\30\9\8��H�\9��H\
�\8�\8\8\11\11\9�H�\8�HK\9�\8\9\9\30�\11��\8\9\11�HK\9\8�\11\9���\8�\8\9\9\30\9\9�\30\9\8��H�\9��H\
�\1�\1\1�\2\000�A�\1�\1C\000�\1\000\000\23�\2��\1\000\2�\1C\000\1�\2\000���\1�\1\000\000\23\000\000�\23\000\1��A�\000��A\3�\1�\1\1B\3\000�A�\1��C\000�\1\000\000\23�\2��\1\000\2ǁC\000\1�\2\000���\1�\1\000\000\23\000\000�\23\000\1��A�\000��A\3�\1�\1\1�\3\000�A�\1�\1D\000�\1\000\000\23�\2��\1\000\2�\1D\000\1�\1\000���\1�\1\000\000\23\000\000�\23\000\1��A�\000��A\3�\1�\1\1B\4\000�A�\1��D\000�\1\000\000\23�\2��\1\000\2ǁD\000\1�\1\000���\1�\1\000\000\23\000\000�\23\000\1��A�\000��A\3�\1�\1\1�\4\000�A�\1�\1E\000�\1\000\000\23�\2��\1\000\2�\1E\000\1�\1\000���\1�\1\000\000\23\000\000�\23\000\1��A�\000��A\3�\1�\1\1B\5\000�A�\1�\1\000\000ǁE\000�\1�\3\1\2\000\000�A\3��\2\000\000ǂE\000�B�\5�\2�\5\1\3\000\000��\1��\3�\2ǃE\000�C�\7�C�\7\000\4�\4@\4�\6�C\000\2���\127�\1�\127�\1�\1�\1\000\000\23�\2��A�\000�\1F\3�\1�\1\1B\6\000���\1H������\000���\000\1�\6\000�A�\1\23�\000��\1G\1�\1\000\000�\1\000\1�\1\000\000\31\000�\000\4\7\21 �\2�~�QB\5y�N&\\¿0��k\27�z)5\18\11\16I\25{O�\19��\000Z<\19�l�O�G��'\127���\11�~`11\4F\000�T�\5�(=\6\2\000\000\000\1\2\000\000\000\7!\25�l�\5\29\000\000\000\3\000\000\000\000\000\000�?\4\6\000\000\000�����\4\8\000\000\000�������\4\3\000\000\000���\4\5\000\000\000����\4\6\000\000\000�����\4\7\000\000\000������\4\7\000\000\000������\4\19\000\000\000e\5(e1\000e1\30f\000'������\4\6\000\000\000�����\4\7\000\000\000������\4\19\000\000\000e\5(e1\000e1\30f\000'������\4\7\000\000\000������\4\20\000\000\000e\5(e1\000e1\30f\000'�������\4\7\000\000\000������\4\20\000\000\000e\5(e1\000e1\30f\000'�������\4\6\000\000\000�����\4\19\000\000\000e\5(e1\000e1\30f\000'������\4\11\000\000\000����������\4\24\000\000\000e\5(e1\000e1\30f\000'�����������\4\7\000\000\000������\4\20\000\000\000e\5(e1\000e1\30f\000'�������\4\6\000\000\000�����\4\r\000\000\000������������\4\7\000\000\000������\4\2\000\000\000��\4\6\000\000\000�����\3\000\000\000\000\000\000\000\000\4\7\000\000\000������\2\000\000\000\r\9\20 \30\29�K!�5p�o\1\3��vb!\12\9\20 y�\26\2$c\20\11�g#\
#J8�\16{q�\14t\25:\8t\25\7\25�\31�j�2\29��\22�Hm\16jx\6\29��w8���b��Wz\22�3ܜ�.�\15v\25\30\9v\25��\3a%v\28\000�v>[�\4�\4\8�1hE6\7P\000*\8\6 �axTdS\4\28g/�j\2\r\8\8 :7{~�\\�O�\5�?�ܕ\000��\19[~}V4\18�ЎLU�\27\20�\24�X�;)\127r\26�*\11\000\000\000�~>~�~~~��~\1\24@\000\1\23�\000��\000�\000�\000\000\1\23@\000��\000\000\000�\000\000\1\31\000�\000\
\7\21 �/\28G�@c)\23�Kp��s��\16\23\6�sz\27�}\6L�\20x\4\3\16I\25\15\9�a\6�\17}\1\000\000\000\000\1\7\7!\25U?�1L\r�w�T:7���M�<�b\29&�\14\1\000\000\000\4\5\000\000\000UXQD!\000\000\000\000\16pi\23���2�+SN\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 �gQ5�\15\9\20 \14��3���#�\
fV���G�Z�\14\22J�57\15t\0253\8t\25N��Lv�/z�lx�\15v\25\18\9v\25:^\14H\0060e&�s�\7��uI��\31\000\9��8}��D�cQSq�\7\7\3S�\16\000!\8\6 \1��;C�\29U�\29`G���\12��t(�\1�B�ULB\12�tX\3\2\8\8 ��1v��G|0�hd��\27>�C\17\11F��\25���\31\4/�W�ҩI$r\26\24\15yV4\18+�\127>�\000\000\000�\15O\15\23O�\14\24�\28�ȏO\15�\15\15\15\24\15\11��\15\15\15\8�O\15N�\15\15ҏ�\14�\15\15\15\24\15\15�\24O\r��\15�\15�O�\14\
\14\15\14N�\14\15�\14�\15��\14\15\15\r\15\14N\r\r\15YN�\r�O�\14�OM\15�\15\15\15\24\15\11��\15\15\15\8NM\15N�\r\15ҏ�\14�\15\15\15\24\15\15�\24O\r��\15�\15�O�\14\
\14\15\14N�\14\15�\14�\15��\1\000\000\2\000\1A�\2\000VA�\2�@�\1�\000C\000�\000\000\000\23\000\4��\000\000\000\7\1C\000A�\000\000݀�\1�\000\000\000\23\000\000�\23@\2��\000�\000�@�\1\5\1\000\1A�\1\000�\1�\000��\1\000\000\2\000\1A\2\2\000VA�\2�@�\1�@C\000�\000\000\000\23\000\4��\000\000\000\7AC\000A�\000\000݀�\1�\000\000\000\23\000\000�\23@\2��\000�\000�@�\1\5\1\000\1A�\1\000�\1�\000��\1\000\000\2\000\1A�\3\000VA�\2�@�\1�\000@\000\24��\1\23�\4��\000D\000�\000\000\000\23\000\4��\000\000\000\7\1D\000A�\000\000݀�\1�\000\000\000\23\000\000�\23@\2��\000�\000�@�\1\5\1\000\1A�\1\000�\1�\000��\1\000\000\2\000\1AB\4\000VA�\2�@�\1�\000@\000\24��\1\23�\4��\000D\000�\000\000\000\23\000\4��\000\000\000\7\1D\000A�\000\000݀�\1�\000\000\000\23\000\000�\23@\2��\000�\000�@�\1\5\1\000\1A�\1\000�\1�\000��\1\000\000\2\000\1AB\4\000VA�\2�@�\1�\000@\000\24��\1\23�\4��\000D\000�\000\000\000\23\000\4��\000\000\000\7\1D\000A�\000\000݀�\1�\000\000\000\23\000\000�\23@\2��\000�\000�@�\1\5\1\000\1A�\1\000�\1�\000��\1\000\000\2\000\1AB\4\000VA�\2�@�\1\31\000�\000\
\7\21 ��-[\17\127�>�\25oj'M�\31���\17:�vq*��0\1XT\16\
\5\16I\25nv�\5�u�W$^\17:.\000H.\3\000\000\000\1\4\000\1\1\3\5\7!\25ճ]|;��\6&\20�(���r\20\000\000\000\4\5\000\000\000�����\4\6\000\000\000������\4\5\000\000\000�����\4\7\000\000\000�������\4\6\000\000\000������\4\7\000\000\000�������\4\4\000\000\000\12GG�\4\7\000\000\000\2J^\12GG�\4\26\000\000\000\15SA\reL\15P]����\14Zu\rkL\2\127r\3DD�\4\5\000\000\000�����\4\7\000\000\000�������\4\26\000\000\000\15SA\reL\15P]����\14Zu\rkL\2\127r\3DD�\4\6\000\000\000������\4\6\000\000\000������\4\27\000\000\000\15SA\reL\15P]�����\14Zu\rkL\2\127r\3DD�\4\11\000\000\000�����������\4\7\000\000\000�������\4\28\000\000\000\15SA\reL\15P]������\14Zu\rkL\2\127r\3DD�\4\14\000\000\000��������������\4\9\000\000\000���������\000\000\000\000\20pi\23V��\12NR�0�%\22\14���&��XP�T\17f\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\19pi\23\29Osh\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 [\31�\18'b`n�p�X��r\8� /I��\5/_�VT_��\\�́\27D��\
\31\000\9\20 �8#\20f;�P�#�{���\26H�4v�EF5���Tb�\12u�ň:\21\15t\0255\8t\25=\29\16\000�;�I���L��c\0038D�8\000\14v\25\26\9v\25\2��Fz\11$\20\1(\8\6 ]\5oY\000\2\8\8 �G�B���ap��Kx�q[�86ϊ�(r�\
\r�x\24A25pi�\0163%�\127V4\18$4� H~,p�\31\\0�y-V�k\5EC�h%�?�\16I\000\000\000��������9���^����8������98��yx�������8��=���y����y��޹��%8��}��������y��\30\1\000\000݀\000\000\5\1\000\000A�\1\000��\000\000�\1\000\000\29�\000\000E\1\000\000��\1\000��\000\000&\2\000\000]�\000\000�\1@\000�\1A\3�\1\000\000\1�\000\000U\2\000\000�\2\000\000!�\4�\6C�\000\7\3B\6@\3�\3�C�\000��B\7��\2\000\7�\2\000\7\4@\8G\4@\000G\4�\8\14D\4\8G�\2\000G��\8�\4@\000��@\9N��\8��\2\000�\4A\9�\3�\2\29C\000\000 ��\127\6\2�\000@\2\000\3�B�\000�BC\5�\2�\3\1�\3\000���\1�\2�\000\000\3\000\1@\3�\1�\3\000\2�\3�\2\30\2\000\4\31\2\000\000\31\000�\000\4\7\21 ��x%p{�Z\15\30^\24>��(��[\19\
��\1\19\6\16I\25\"�\127'�V�k�q+I�8\4*��\16.�P\r+3Ƿu\2\000\000\000\1\2\000\000\8\7!\25�\
Fa\3RV\30�U�,��^\"5��\7Ff�Q\0115�w���Ak��r\15\000\000\000\3\000\000\000\000\000\000�?\4\6\000\000\000k~}sz\31\3\000\000\000\000\000\000\000@\4\7\000\000\000qjr}zm\31\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\24@\4\7\000\000\000vqlzmk\31\4\7\000\000\000lkmvqx\31\4\7\000\000\000ypmr~k\31\4\r\000\000\000:lc:lc/g:/)g\31\4\28\000\000\000yvq{Rjskv\\pspmVqMzxvpqYjeef\31\4\7\000\000\000|pq|~k\31\4\2\000\000\0003\31\000\000\000\000\22pi\23�\23JrX\20�H4\31�,�ڲ\23\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 �4�xQ�\000'�\14\9\20 bJ�\7�&�L'�\24\\U�\11\\l�WD�\19\127@vik�\15t\0252\8t\25��r%:`�m>\14v\25\31\9v\25�\19�?�U7XAɄw�U�\30��i\4�\3�n\11a�\"\1*\8\6 �`\23\14\24��8��T\000\15\8\8 �\27<lA��M\\��9��/I��xF���`�4NDk}V4\18F[(\17�DE5e��D�O�h\000%Y4B\1\000\000nkkk*kkk�+kk�kkkv�kk.kkk��kk�+kkMjkk6�kk�kkk��+k�k�jjjkk-j�k�*jk6�kj��i�jkkNikk*ikk�i�j�ikk\
�K�*hkk�+k�hhl�hkl�hkk\
ht�,�+k,o�c,o�c,��csk�c|kl�,�+k,o�c,o�c,/�c0okk|�h�,�+k,o�c,o�c,�c0/kk|ki�-/�k,��c�okj��+k�o�b�o�b�/�b6/�j|�j�-/�k,��c�okj��+k�o�b�o�b��b6/�j,�+k,o�c,o�c,��csk�c|kl�,�+k,o�c,o�c,/�c0okk|�h�,�+k,o�c,o�c,��\8[D\000\000\23\000\2�FD�\000G��\8�\4\000\1��@\000�\4�\9�\4�\9�D�\9]D�\1\23�\1�FD�\000G��\8�\4\000\1��@\000�\4�\9�\4�\9Ǆ�\9]D�\1G�@\000G\4�\8G\4�\8G��\8\24@�\8\23\000\1�FD�\000G��\8�\4\000\1��\3\000]D�\1G�@\000G\4�\8G\4�\8G��\8\24��\8\23@\9�G�@\000G\4�\8G\4�\8G��\8[\4\000\000\23�\7�G�@\000G\4�\8G\4�\8G\4�\8[\4\000\000\23\000\4�FD�\000G��\8�\4\000\1��@\000�\4�\9�\4�\9Ǆ�\9]D�\1FD�\000G��\8�\4\000\1��@\000�\4�\9�\4�\9�\4�\9]D�\1\23\000\2�FD�\000G��\8�\4\000\1��@\000�\4�\9�\4�\9Ǆ�\9]D�\1\23��\127`C�\127`��\127[@\000\000\23�\2�K\2\000\000@\000�\4A\2\000\000�\2\000\1�\2\000\000a�\000�AC\4\000�\3\000\6V��\6J@\3\6`��\127U\2�\000�\2\000\1\25��\4\23�\5�F��\000��\4\000�\2\5\000]B�\1U\2\000\1�\2�\000N��\4�B�\000�\2�\4\1\3\5\000�B�\1�\2\000\000�\2�\4\1\3\000\000��\1��C�\000��B\7�\3�\000\1D\4\000@\4�\6\22D\4\8�C�\1���\127K\2\000\000���\000�\2F\3\000\3\000\000�\2\000\1�\2\000\000dB\000\000H@\2�F��\000G\2�\4\24\000�\4\23�\26�A�\000\000���\000�\2\000\5�\2\000\000a\2\25�\1\1\000\000FC�\000G��\6���\000�\3\3\7��\6\000]��\1[\3\000\000\23�\6�@\3\000\4���\000�\3\3\7��\6\000]��\1�\3\000\4�\3@\6��\3\1\1\4\7\000���\1�\3\000\000\1\4\000\000U\4�\6�\4\000\000!D\1�\6E�\000Gń\6\29�\000\1\r\5@\
\7\5\5\7�\3�\9 \4�\127\6��\000N\4@\6GD�\000\
ă\8\1\1\5\000\23�\15�N\3@\6GC\3\1\24��\6\23�\1�F��\000�\3@\6���\000ƃ�\000�\3�\7J�\3\7\1\1\5\000FC�\000G��\6�\3@\6��\3\1��\7\000]��\1[\3\000\000\23�\6�@\3\000\4�\3@\6��\3\1��\7\000]��\1�C�\000ƃ�\000\14\4@\6�\3�\7��\000\1�\3@\7���\6�\3\000\4\000\4\000\7A\4\7\000݃�\1\6D�\000F��\000G\4�\8\29�\000\1\r\4@\8\7\4�\7F��\000�\4@\6���\000J\4\4\9\1\1\5\000\24\000@\2\23�\3�@\3\000\4�\3@\6��\3\1�\3\7\000]��\1�C�\000ƃ�\000�\3�\7��\000\1�\3@\7���\6ƃ�\000\14\4@\6\7\4�\000ʃ\3\8\1\1\5\000`B�\127\23@\000�A\2\5\000_\2\000\1A\2\000\000_\2\000\1\31\000�\000\5\7\21 �?V\4���Y�~\23\30�(�W4�X\25��Nv$�TO\22\7\16I\25���z���=\12��Z\31�O_�V�K$8t\19\2\000\000\000\1\2\000\000\7\7!\25��� �S�\127\9+�\1=��Z�*�H�\22AH \000\000\000\3\000\000\000\000\000\000�?\4\6\000\000\000������\3\000\000\000\000\000\000\000@\4\6\000\000\000������\4\8\000\000\000��������\4\3\000\000\000���\4\5\000\000\000�����\4\5\000\000\000�����\4\11\000\000\000�����������\4\7\000\000\000�������\4\5\000\000\000�����\4\7\000\000\000�������\4\14\000\000\000��������������\4\5\000\000\000�����\4\6\000\000\000������\4\9\000\000\000���������\4\5\000\000\000�����\4\4\000\000\000����\4\6\000\000\000������\0045\000\000\000:c~9DZ�������6aG:ft;Q\\8Kn:b~9DZ:fS;qg1bR;nO;Y~:ft=^\\�\3\000\000\000\000\000\000\000\000\4\7\000\000\000�������\4\
\000\000\000����������\4\7\000\000\000�������\4\7\000\000\000�������\4\7\000\000\000�������\4\5\000\000\000�����\4\2\000\000\000��\4\2\000\000\000��\4\9\000\000\000���������\4\3\000\000\000���\4\2\000\000\000��\1\000\000\000\15\9\20 ��l\rL��C��\20%u�+\0155F�\000pIXF\31\11\9\20 %M�'\14�\29t\15\15t\25:\8t\25<H={6-�<���U�e�j\28�\22\30�\25My���zo�_%�\5�Wf\025057\14v\25\18\9v\25\12�.?�x\\*�L`f2\29U\19�T\8MWQAiD\
P�\12o\5���E�#w]\000/\8\6 �O�jb\
�lpO\rJc�\0141��\1278�stt\3\r\8\8 ���, J�h�.�S��ji�!�>\28yV4\18x;08+\000\000\000�\\\28\29\11\28\28��\28\28\28\000]�\28\11\28\28�\29]\28\28]\29\28\28�\29\28\28ڝ\\\28���\31\28\30\28\000@\2\000\2�\2�\1݁\000\2�A\000\000\23�\2�\6�@\000\7\2A\4@\2\000\000�\2�\1Ƃ@\000�B�\5\000\3\000\000�\2\000\1\29�\000\000�\1�\2\23@\3�\6�@\000\7\2A\4@\2\000\000�\2�\1�\2�\3\29�\000\2�\1�\2\6�@\000\7BA\4@\2\000\2\29�\000\1�\000�\3M\1�\2\23��\127�\1\000\1\31\000�\000\11\7\21 s\3�,\26A�\15�j�n�w�\28&�\16Og�\27\25y\r+}�\".$z�p!\r\4\16I\25�f8ti��&��\29\4㊯Q��\21p\1\000\000\000\000\1\3\7!\25E�R>\21�\":\6\000\000\000\3\000\000\000\000\000\000�?\4\2\000\000\000_\31\4\7\000\000\000lkmvqx\31\4\5\000\000\000yvq{\31\4\4\000\000\000lj}\31\4\4\000\000\000szq\31\000\000\000\000\27pi\23�U�v�c�.�Ɨx��o#\25��\23b��L���\12��jV\22�\30\11\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\20pi\23p\11�\14}ۭD��<A�L}\30IFm3�q\27^\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 \26��\\��)\21�\
\9\20 ��;9� u*6�x\\�\1t\0256\8t\25i��P��iN���\26P��cl�mH�\3\21=�\14v\25\31\9v\25���S�u@kU'R\12X��\8v�[\28#��N\3wK*\1.\8\6 @��}��Oj\3��>�`�5>�\21\21���L\2GHq\000\000\8\8 �gK)��q\6�\7\31C\14^bh ��?�(�mD\11�D���\
�~V4\18Bl*%u��!3��[5p?b�C\20\3!}�/?\000\000\000����℄������ń���D��\4�\4\5ń�a\5��\12D�\5aE��\12D\5\5a���\12D�\6aŅ�\12D\5\6Sŏ�\23\000\11�\24��\000\23�\3���\1\000��\1\000\1�\1\000@\2\000\3]��\000�\2\2\000��\2��B\2\000������\2\000��\2���\2\000�����\1\7�\23�\6�\24\000�\000\23@\6��\1\3\000�A\3\000\1B\2\000A�\2\000�\2�\3�\2�\4\000\3�\3@\3�\3�\3\000\1]�\000\1�\3�\3�\3�\1��\000\1V��\6\29�\000\1�\2�\5��\000\1�\3\000��\2���\3\000�����\2\4\000��\2��B\4\000�������\127\31\000�\000\3\7\21 �jf\15\16\3\16I\25|��i!\7\16^\4\000\000\000\1\2\1\3\000\000\1\4\000\7!\25u�Nv\11\000\000\000\4\
\000\000\000��������ջ\4\6\000\000\000������\4\11\000\000\000���������޻\4\
\000\000\000��������ջ\4\9\000\000\000�������޻\4\15\000\000\000�������������ɻ\4\7\000\000\000���҉��\4\22\000\000\000����������������������\4\6\000\000\000���ډ�\3\000\000\000\000\000\26�@\4!\000\000\000��ٌ�ދ��ނ�������݉����ڈ����ً�\18\000\000\000\r\9\20 g�{'���\17l�\23\
���w�\3\9\20 ӳD\20��\15Z�Z@x5�xT\6yf#�\14B\24|�,O�o6�B�\2�t�\15t\0258\8t\25H\15ka��r\22y��\
�WY}�?�\31��3;A;�3��]�\14v\25\27\9v\25,*XA}�ck]�M_\1*\8\6 Q\000�5Ģ�\6Rg�j\000\14\8\8 �g�~�S�\2R��fg\27\r\19\127��\\;4�& rV4\18^��h���8\"ٳy�\14uk��e-~� \0292\30�LBm�C��\4(�u9J:\000\000\000%   a   �`  �   =�  e   ��  �`  \6!  }�  � � ��  !!! aa! �!\000\000��\000\000ƀA\1\1�\1\000݀\000\1\6�A\1A\1\2\000\29�\000\1K\1\000\000�\1�\000��B\2\11�\1\000\
\2\000�\
�Æ\
���K�\000\000J�Ĉ�\2\000\3J���\
B\2�FBE\1G\2�\4GB�\4�\2\000\3]�\000\1\
B\2�FBE\1G��\4G��\4�\2�\2]�\000\1\
B\2���\000\1�\000\2�����ƁB\1\24\000�\3\23�\000��\1�\2�\1\000\1\23@\000��\1\000\000�\1\000\1\31\000�\000\11\7\21 �8c<��}���@�eUh�N?9{H,K?�4�IT\24�{�a\11\11\16I\25\29�\29\3Gi�!�IE:\5\5�\5��\9\8\11eRM��b�*�.�6YW��%\3\000\000\000\000\000\000\1\000\2\11\7!\25�\23\18z��\31\29\6F\3u\18}?�t�<O$&P�\127U\3�?�dJ�_\26|,�f\25\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000������\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\4\7\000\000\000�������\3\000\000\000\000\000\000$@\4\8\000\000\000�������\4\3\000\000\000��\4\r\000\000\000�������������\4\4\000\000\000����\4\5\000\000\000����\4\8\000\000\000��������\4\4\000\000\000���\4\7\000\000\000������\4\5\000\000\000���ߋ\4\8\000\000\000��������\4\8\000\000\000��������\4\r\000\000\000������������\4\"\000\000\000������������������������������\4\15\000\000\000��������������\4\7\000\000\000������\4\6\000\000\000��庹�\4\5\000\000\000�����\4\6\000\000\000�����\3\000\000\000\000\000\000i@\000\000\000\000\23pi\23�KV\0248��'�V_\29�&�Wr<�S\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 ���\16�\5\
_\14;�\27�+�&.�6P:\",\0030.t_\30{�'u\
\9\20 t�\15l\20�hW��y�\15t\25:\8t\25~�\0128Η�b��pf^4�\18\19%^?}��\\a��\
7[�RޖBY��/n�\14v\25\31\9v\25J��&F��r�\8l\2i`E.>+\"v��J(c�<?\000 \8\6 \3�BD\\\27\11f�\12c%=\9oG�I\127E\27�RM`\24]\29�\19a@�l�\\\1\11\8\8 E�1:�\23�PJ�\20>={V4\18�\7�P'v\26\\蕬\19'\000\000\000X===�=}=�}==��=<��}=���<=<==|<<=���<||<\000\24�A\2\23�\5���A\000���\000\24\000B\3\23@\2��\1@\000\1B\000\000݁\000\1\12B�\1��\2\000\29��\1\12�B\4\29�\000\1@\1\000\4\23@\1��\1�\000\12B�\1��\2\000\29\2�\1݁\000\000@\1�\3�\1�\1�A\000\1_\1\000\1\23@\000��A\1\000�\1\000\1\31\000�\000\7\7\21 ^��.�,�l�v�I��\6\16ө\19\11\6\16I\25j�\8\9y3�AO�\0063_�S1�\",\1\29�2\8b��u\1\000\000\000\000\2\9\7!\25\26ٕ-��\5=Ň�,5a�z\000�bZ��\23m�ͻW��j`\r\000\000\000\4\8\000\000\000\7\16\4\000\28\7\16u\4\3\000\000\000\6\15u\4\3\000\000\000\28\26u\4\5\000\000\000\26\5\16\27u\4\3\000\000\000\7\23u\4\1\000\000\000u\000\4\
\000\000\000\18\16\1:&!\12\5\16u\4\4\000\000\000\28\26\6u\4\5\000\000\000\7\16\20\17u\4\3\000\000\000_\20u\4\6\000\000\000\1\26\29\16\ru\4\6\000\000\000\22\25\26\6\16u\1\000\000\000\000\9\20 dcU\17�w.0p^�#���\16�T\5.�ߺ\6�0�X\r�Y,���A`\r\9\20 \31�`bʜ\30|�3\4y�o�R�\15t\0259\8t\25\1278�\17\24��]c��F\18M\15E�\22�&Ҡ�\
���u\9�o>\3r�\14�\14v\25\16\9v\25���\26\"5�\30�t�R;d�B�\\PE��\23d���r\29��h\000!\8\6 x0\1!���oE��M��ZM�:k1:�g)�`@\27���\19\1\1\8\8 )�D\20B7�f�v�c��\r&Z�'DK�^*�\25\29k���j\30�X5D\127V4\18!\r$D�jq5�\19.DDB!cl�3\8�w�\6�q(\9\000\000\000\2D\4D\3\4�D�\000\000\000��\000\000%\1\000\000]�\000\2\000\000�\000\31\000\000\1\31\000�\000\6\7\21 �S�y\14ZR\17\16-Ea1��\26\5\3\16I\25V��.��Sh\1\000\000\000\000\000\5\7!\25��<X<�\3P�$F�,�}\3\000\000\000\4\7\000\000\000\19\20\18\9\14\7`\4\5\000\000\000\7\19\21\2`\4\4\000\000\000HNI`\1\000\000\000\14\9\20 3OWFu]\28\23�'�\12b6�\8�]�JC�Nu�>\19\11\9\20 �JT\29A��\"�\15t\25:\8t\25��\23\3�cBxw\18L\14�}�\21�\29�3\31+�6>1\12\28,h�\14E�dN\17ܢe�\14v\25\29\9v\25���\\��\5\rE\2#0�\16!5D\127�k\000/\8\6 ���RtO`\000&��A\"\14\17j�v8\r��J\1\12\8\8 A\15�\2|w \9R\11D\8\22��\15�qV4\18�L�e͞�)r�k#[_+t�\28N?\24\25fWz�\30+�MZ[D�$f\
\000\000\000Ж֖��V�\23\22\000\000�\000@\000���\1\000\1\000\000�\000\000\1^\000\000\000_\000\000\000\31\000�\000\1\7\21 �)�@*��\11�>PV\5\5\16I\25p��;�Oq\11ǔ�9c;�7\1\000\000\000\000\000\5\7!\25;�O:��vy[\14wH9[�G\4\000\000\000\4\7\000\000\000`gaz}t\19\4\7\000\000\000u|a~rg\19\4\5\000\000\0006#!k\19\4\5\000\000\000qjgv\19\000\000\000\000\23pi\23Az\8}zj\15J�_'M��L\5�#�Y\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\23pi\23'\29v0up�?��(\29�\24�S�϶3\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\24pi\23�1H+KZ�^'+�7��l\17\11�XX U�x!�.\29��.�j�F�O\19Y\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 & FT֏Ni���\3���u:ݑ\000�\8\9\20 ݓgU�\15t\0254\8t\25�\4?;���<�!�\30&,Uf�\14v\25\16\9v\25�<\127(tc\16zǂ7\2�)t\30\22�\0065\8��JMe�{w@�-\000,\8\6 �p g1~�qV��+7��C�[�z\000\
\8\8 �:\17mJ\17;HDzV4\18?�\15L\r9-\18&\000\000\000BD\4DC\4\4DY��D\1D�D��DD��DDAEDE\5EED�E�E�ā\1]��\1[\000\000\000\23�\3��\000\000\000�@A\000\1�\1\000݀\000\1\7��\1\7\1B\2@\1�\000\29�\000\1�\000\000\2\3\1�\000FAB\000��B\1]\1\000\1\31\1\000\000\23��\127�\000@\000�@@\1���\000�\000\000\1\26���\23\000�\127�\000\000\000�\000\000\1\23@�\127\31\000�\000\4\7\21 F\\C&���b�;Y,��Q~Ӊ9\30k�\27i\7\6\16I\25���\4y�\19�NWEn\25�~@v�\21�x�c��3\4\000\000\000\000\2\1\000\1\2\1\3\9\7!\25�ݜ_�1va{�\31T�N�F,��R�;\7\000\11'�\
�\11�M\12\000\000\000\4\3\000\000\000���\4\5\000\000\000�����\4*\000\000\000������ސ���߂����ߟ�����޶����������ߐ����\4\20\000\000\000�̖������ׄ���������\4\11\000\000\000ׁ���������\4\8\000\000\000��������\4\3\000\000\000���\4\5\000\000\000�����\4\7\000\000\000�������\4\9\000\000\000���������\4\5\000\000\000�����\3\000\000\000\000\000\000\8@\000\000\000\000\21pi\23�a�w�\28.\22rډd|,\30N;\28>b�\19�vY�\15%\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 M�Vz�\15\9\20 p$\26`\2�� �\20\31Ab�f\21�PLE�\28�!�\15t\0255\8t\25+\11\4\0160n\\6D�\19Kz�*\6s�:a�\14v\25\28\9v\25�\20\26bl�2\5M��<�@\31_\1/\8\6 PH\4\31?e{ ���YH8�d\25�%^��?;\000\r\8\8 ��\7xf��C\16O�L0j^r�(�A�}V4\18�\20�b)\30� \3l�g�e�'�:�BY\000\000\000�����ޟ����\31ޞ��\4ޟ����\31\30ޟ�Y\30ߟ�]��ߝ��\31�\31�_�����\31�ߜ��B�\31�Y�ޟ�ݞ�Bޟ�Z�\31��\29ޟ�\29\31��]���B\2\4݁\000\1\6\2B\000\7BB\4@\2�\3\29�\000\1\25\000��\23�\r�\6�B\000\7�B\4\29��\000E\2\000\1�\2\3\000�B\3\000\5\3�\1A�\3\000�\3\000\2��\3\000\5\4�\2A\4\4\000�\4�\3ւ�\5]��\1[\2\000\000\23�\6��\2\000\000�BD\000\1�\4\000݂\000\1\7��\5\7\3E\6@\3�\4\29�\000\1�\2\000\6\7CE\5\24@@\6\23@\2�\7�E\5\9\3\000\3\6�E\000G\3F\5\29�\000\1F�E\000��E\5]\3\000\1\31\3\000\000\23��\127\4\3\000\000F�E\000�CE\5]\3\000\1\31\3\000\000\23@�\127��B\000��B\5���\000�\2\2\5\26��\2\23��\127�\2\000\000�\2\000\1\23\000�\127\23�\000�\4\2\000\000AB\6\000\31\2�\1\31\000�\000\000\7\21 \000q�7��x\19\11\16I\25{\22�=dS#Z���\127\17+\24 �HV_�Bc<\12l7\127|��\0302�g[KѲ\31\7\000\000\000\000\2\1\5\1\000\1\2\1\3\1\6\1\4\4\7!\25z��?ef�}R��3�~�TH'�u\26\000\000\000\3\000\000\000\000\000\000>@\3\000\000\000\000\000\000�?\4\9\000\000\000���������\4\14\000\000\000���������᥿��\4\7\000\000\000�������\3\000\000\000\000\000@\127@\4\9\000\000\000���������\4\19\000\000\000ཪ�ࠬ�������᥿��\4\7\000\000\000�������\4\4\000\000\000����\4\3\000\000\000���\4\5\000\000\000�����\4'\000\000\000������ி��ἵ���ᡪ�������������ᮼ���\4\
\000\000\000����������\4\11\000\000\000鿮��������\4\9\000\000\000鼠������\4\
\000\000\000馢�������\4\8\000\000\000��������\4\3\000\000\000���\4\5\000\000\000�����\4\7\000\000\000�������\4\5\000\000\000�����\4\6\000\000\000������\4\9\000\000\000���������\4\7\000\000\000�������\4\19\000\000\000*Tq(FH'hl)Q_&[V'``�\000\000\000\000\21pi\23�͈!y�>h�mK9n�3\1\25 �:���\27���!\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 �\29�5g��E,IP\0233�|W��d\
z9�tl�b\1�|�o���b덇}P\000\9\20 �!Rb��CTZU�\19@*r \8�y-\8?�\30f0+ZG�\18\5I�=j+\000t\0257\8t\25��\1d�$�\23>�7U�o�f@\0236\16=X�]@*�\18�\14v\25\30\9v\25��'[\7H�H\12�a}�1xr;\4\4 \3��\7\1+\8\6 ��f!�\5~w\000\11\8\8 �>�\30�$Z#9��D�~V4\18�9�X���!t]\23%�xOw���{�\19**T\000\000\000����k������pq���6���7p0�����1��-pp���1����p6���-pp��q������q�5�p�����-p�������1��@\1�\1\29�\000\1\25\000\1�\23�\r�\6AB\000\7�B\2\29��\000E\1\000\1��\2\000�\1\3\000\5\2�\1AB\3\000�\2\000\2��\3\000\5\3�\2A�\3\000�\3�\1ց�\3]��\1[\1\000\000\23�\6��\1\000\000�\1D\000\1B\4\000݁\000\1\7��\3\7�D\4@\2�\2\29�\000\1�\1\000\4\7\2E\3\24\000B\4\23@\2�\7BE\3\9\2\000\3\6�E\000G�E\3\29�\000\1F�E\000�BE\3]\2\000\1\31\2\000\000\23��\127\4\2\000\000F�E\000�\2E\3]\2\000\1\31\2\000\000\23@�\127�AB\000��B\3���\000�\1\1\3\26�\1\1\23��\127�\1\000\000�\1\000\1\23\000�\127\23�\000�\4\1\000\000A\1\6\000\31\1�\1\31\000�\000\11\7\21 r\27ibv�+\14�ciy��7o\4\2u\1{�\9�J~\21�.�\7�(GA\15\11\16I\25�veP�Ψ>$e\30c�zip�WoFP�5J�+�\17C]�=P)\28\20+j�0\7\000\000\000\000\2\1\5\1\000\1\2\1\3\1\6\1\4\3\7!\25�\r�X{��1\25\000\000\000\3\000\000\000\000\000\000>@\4\7\000\000\000#$\"9>7P\4\5\000\000\00069>4P\4\2\000\000\000\127P\000\4\9\000\000\000%#5\"\0001$8P\4\6\000\000\000\127\"5#\127P\4\4\000\000\000<5>P\3\000\000\000\000\000\000�?\4\3\000\000\000?#P\4\5\000\000\000$9=5P\4'\000\000\0008$$ j\127\1271 9b~#*ghi~>5$jhh\127\00253&\18)$5~1#8(P\4\
\000\000\000%#5\">1=5mP\4\11\000\000\000v 1##'?\"4mP\4\9\000\000\000v#?6$94mP\4\
\000\000\000v9=741$1mP\4\8\000\000\000\"5!%9\"5P\4\3\000\000\000#*P\4\5\000\000\000:#?>P\4\7\000\000\000453?45P\4\5\000\000\0009>6?P\4\6\000\000\0009=7\0254P\4\9\000\000\000$?#$\"9>7P\4\7\000\000\000\"5#%<$P\4\19\000\000\000����׸������ɸ��P\000\000\000\000\24pi\23\28G�1\11U�Sِ�}���(\1\16�O��&(��b\
t+�1\0119R6\\b�\3\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 et�2j�\6.�w�\12f��$�\8\9\20 ���c\3\000t\0253\8t\25\28��c8\27�\4v�\9h\5\1v\25\16\9v\0251��\9�#�\r!\11St�@�kz�Cx=)�2��F\0226my|\1(\8\6 ��\15B\000\14\8\8 f��\7��\000\5�,�G+��%g�\127d\6��\3�yV4\18l$�69\000\000\000���������\2����������B����\2\2�ǂ��ق�����\2ǂ��\3\2��CB���\1�\1A\1\1\000�\1\000\2�A\1\000\5\2\000\000�\000�\1]��\1[\000\000\000\23�\5��\000\000\000ƀ�\000\1�\1\000݀\000\1\7\1�\1\7AB\2@\1�\000\29�\000\1�\000\000\2\7�B\1\24�B\2\23@\1�\3\1�\000F\1�\000��B\1]\1\000\1\31\1\000\000\23@�\127\4\1\000\000F\1�\000��B\1]\1\000\1\31\1\000\000\23��\127�\000�\000�@@\1���\000�\000\000\1\26���\23@�\127�\000\000\000�\000\000\1\23��\127\31\000�\000\
\7\21 #��\1��Z[;^�q�zKg�C?��\17L\12z\7/���C\9\8\16I\25!3�\29Ѫ�M���AB>)\18��9g�\6:\127g�D4�\4P�\17�6\5\000\000\000\1\4\000\2\1\000\1\2\1\3\7\7!\25��\20\18\0269Yw�s�_��\21\23�e\25?�\7�\5\14\000\000\000\4\3\000\000\000���\4\5\000\000\000�����\4*\000\000\000������ڔ���ۆ����ۛ�����ڧ����������۔����\4\
\000\000\000����������\4\11\000\000\000Ӆ���������\4\8\000\000\000Ӝ������\4\8\000\000\000��������\4\3\000\000\000���\4\5\000\000\000�����\4\7\000\000\000�������\4\5\000\000\000�����\4\12\000\000\000������������\4\9\000\000\000���������\3\000\000\000\000\000\000\8@\000\000\000\000\16pi\23�\21�B��\21\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 ���I\11�\2M�I�t�#I-�\25Vd\6-�\8\14�#+�\1\9\20 \000�l2{l\29r4\9Z~;z._Q�;.,\20�#���\24��9\30i\000t\0253\8t\25`I\000 I\4\6@�$8\6-\1v\25\25\9v\25WZ{v\000(\8\6 �.�\24\000\14\8\8 �#p5(��P2\23I&���Ls�\3\2Һ<p�yV4\18Tޅ\29S\000\000\000��͍��͍�\r\r��\r͍\12M���\r��֍���\r�\r\11�̍\
�̌M�\r��\12���L��\16\r��͍��\11�̍\
�όM�\r��̏�\16\r\r�\22��\000\23�\1���B\000�\000�\000\1�\2\000���\1@\000\000\1�\000�\000�\000\000\1\23\000\000�_\000\000\1�\000@\000�@@\1���\000�\000\000\1Y���\23\000\000�\23\000�\127F\000@\000G@�\000]��\000��@\000��\3\000��\000\1�\000\000\000\23�\5��\000A\000�@�\1\000\1\000\1A�\1\000��\1\000݀\000\2�\000�\1�\000A\000�\000�\1\000\1\000\1AA\2\000݀�\1�\000\000\000\23�\1�ƀB\000\000\1\000\1A�\2\000݀�\1�\000�\1�\000C\1�\000\000\1\23\000\000��\000\000\1�\000@\000�@�\1݀�\000�@�\1\25���\23@�\127�\000D\000\1A\4\000A�\4\000�@�\1\23��\127\23��\127\23@�\127\31\000�\000\6\7\21 Mj�\127b��HnruX$'�2\7\11\16I\25�ޒJX0H1�\31EZ;w�x�DDU#�(s�`\8\23+�4{�\24)\19(e\14W\1\000\000\000\000\2\9\7!\25V�Zw\127��M�k� ��\23\16{J�\8d�DV\"_\14a�a�.\19\000\000\000\4\3\000\000\000���\4\5\000\000\000�����\4\8\000\000\000��������\4 \000\000\000��������Ă�����Ą��ř�����Ă����\4\7\000\000\000�������\4\4\000\000\000����\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\16�\4\5\000\000\000�����\4\5\000\000\000�����\4\9\000\000\000���������\4\3\000\000\000���\3\000\000\000\000\000\000�?\3\000\000\000\000\000\000$@\4 \000\000\000��������Ă�����Ą��ř�����Ă����\3\000\000\000\000\000�r@\4\7\000\000\000�������\4d\000\000\000\15OW\rb[\12cy\rJk\15bw\15Ma\15f|\15N[\2^O\5Vf\2E]\rKD\15Dp\12vF\15vZ\rW{\rQv\12b|\15OW\rb[\15Dr\12|S\12vg\15`K\2Ut\12dO\12GI\15RR\5Vf\15gY\15Zl\3mg\2E\127�\3\000\000\000\000\000\000\20@\000\000\000\000\27pi\23�R\18c\127\28\r\31d\23\11=܏�Y���<K�E;)��Y6�<\5�-�\19\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 /��sk��ih��<\24v�c��\8?\26:�1\15_�I�\6�\30@\1\9\20 Z�;F[W8\14��v$���6�s�\127:o�D1%�D'�dnT\000t\0257\8t\25��>T1\22i��Z\21��H�\12�o\22.�\12h,CuB\1v\25\29\9v\25��^:Ҡcd��^k\22 �*\1�RX\000+\8\6 ~�Yg\26\000\11<\1\r\8\8 �\2=\25)_�\5��03�l�78�2h�qV4\18֒�\12ܐ@0\0278�E\16\2�Q\r��tC\20$4l�pG�V\
It֪J\28\000\000\000����Y���\28����Y���\25�ڝ�X؅�X�\29A\000\000\1\1\1\000@\1\000\000�\1\1\000!\1\3�\6�@\000\7BA\4A�\1\000\29�\000\1�\000\000\4\000\2�\000F�A\000G\2�\4�\2\000\1�\2�\1\000\3�\1]�\000\2V@\2\4 A�\127_\000\000\1\31\000�\000\4\7\21 ���\17��b:�\19�.+\25\6\7m%�$��Zi\r\6\16I\25]��\15�\20*\20�C�C�2@e#݃{\25D�\127\14*�y\2\000\000\000\000\2\000\3\8\7!\25C��\5�'�,�LwL{=�m2�4&�\16f\18QЊz\15luV�H%X\9\000\000\000\4\1\000\000\000@\4%\000\000\000!\"#$%&'(9*+,-./0123456789:pqrstuvwxy@\4\5\000\000\000-!4(@\4\11\000\000\0002!.$/-3%%$@\3\000\000\000\000\000\000�?\4\7\000\000\0002!.$/-@\3\000\000\000\000\000\000B@\4\7\000\000\000342).'@\4\4\000\000\00035\"@\000\000\000\000\22pi\23\28\"AK$]I\12���\19�xK\20\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 \11V�\7�tXv+'�k�3_;�)�\14��b_$��N&�\14F�\000\9\20 Id�/��kt)\26SH��ji��7\7I�\17&c�\19+\30\26\7}��g^H\000t\0256\8t\25Y�\02433\\�BR2\18\22���\19\8C\16LE�\23\31p\1v\25\27\9v\25w��[rE�Z�1T+\000.\8\6 }��bv��!���Ly�\4\30;Х09�9,�`�l\000\000\8\8 \28%\23bT\30y'�\11�&���V}8�o���\15ME�]���\21�~V4\18g�Et/��4���\r���6���JT�l!/\000\000\000�ё�֑���QQє�Q�PQ��\20����\16��G���\16�����QА���T��\2��\1\000��\000\1ր�\1]��\1[\000\000\000\23�\4���A\000�\000B\1�\000�\000\1A\2\000���\1�@\000\000\23@\000�\24��\000\23�\000��\000\000\000�\000�\000�\000�\1\23��\127�\000�\000��B\000\000\1�\000�\000\000\1�\000\000\000\23@�\127�\000@\000�@@\1���\000�\000\000\1\26�\000�\23��\127�\000\000\000�\000\000\1\23\000�\127\31\000�\000\1\7\21 �k\5j\r��1\25\17�^\8\4\16I\25���\\��\5@�L�'\8z�~=��\12\5\000\000\000\000\2\1\000\1\9\1\3\1\7\9\7!\25CJ2/vT\0229�|,2���%�y-\27\"��YN�vL:/�q\r\000\000\000\4\3\000\000\000���\4\5\000\000\000����\4\8\000\000\000��������\4\15\000\000\000������
������\4\6\000\000\000������\4\4\000\000\000����\3\000\000\000\000\000\000$@\4\7\000\000\000���
�\4\5\000\000\000�
��\4\2\000\000\000��\4\1\000\000\000�\4\9\000\000\000�����
�\3\000\000\000\000\000\000\8@\000\000\000\000\16pi\23�q\\�tjO\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 v�\000\000�\27�r#�#9�\2�\7���\3�%ApU�\18lΩ\4-VR\3'�\15\9\20 ��(1<��c.\8)l\31��Vb��W�]�\2�\000t\0257\8t\25�/�(Y�p[*~\25m�:9\19\000_s\":+�\21v�:\2b\1v\25\27\9v\25��\5\16pFK7��:\1*\8\6 ��M*h&�:�?\r/\000\9\8\8 g)�BM\127V4\18���.\r��_�C�z�U\12M\4H�\26���+4\6�0�\000\000\000kMMI\22\12MMZMM�\12LMM�\12MMZMM��\12MM��\rML�MM\rOMM�O�M�OMLMN�L\rNMN�\12�N�L\12ML\15LM�\12ML�L�MK�\12MP��M\12�LM[\15OI��MLKO\15MJ\15\15I\rO�NP�MLTM��Z�V�K�\15MJ�\15IP��M\9OMM�ONM�OMLLC\3\000E\3�\1��\3\000\22�\3\6A�\3\000�\3\000\2�\3\4\000\000\4\000\2AD\4\000�\4�\2��\4\000\5\5�\2A�\4\000�\5\000\3�\5\5\000��\000\1�E\5\000\000\6�\3V\3�\6݂�\1@\2�\5[\2\000\000\23�\5��\2B\000ǂ�\5\000\3�\4A�\5\000݂�\1�B\000\000\23\000\2�X\000�\4\23�\1��\2B\000ǂ�\5\000\3�\4AC\6\000݂�\1�\2\000\000\23�\000��\2\000\000\000\3�\4�\2�\1\23��\127I\2�\3\23@\2�\23��\127ƂB\000���\5݂�\000�\2�\5\26��\2\23@�\127�\2\000\000�\2\000\1\23��\127��B\000��B\5���\000�\2\000\1\1C\3\000E\3�\1��\6\000\22�\3\6A�\6\000�\3�\3�\3\7\000\5\4\000\3A\4\5\000\29�\000\1V\3�\6݂�\1@\2�\5[\2\000\000\23\000\5��\2B\000ǂ�\5\000\3�\4A�\5\000݂�\1�B\000\000\23@\000�\24\000�\4\23�\000��\2\000\000\000\3�\4�\2�\1\23��\127�BG\000\000\3�\4݂\000\1\6CG\000E\3�\3\29\3\000\1�\2\000\000\23��\127ƂB\000���\5݂�\000΂�\5\26��\2\23\000�\127�\2\000\000�\2\000\1\23@�\127\23�\000�\4\2\000\000A�\7\000\31\2�\1\31\000�\000\11\7\21 ��\2��M\8���\9���&s��0\26C#e�@\4\20)\21\17D\27��\7\25\7\16I\25��KFq��:\1S�9\16;�}d��u�v~v\8\000\000\000\000\2\1\5\1\000\1\9\1\3\1\8\1\7\1\4\3\7!\25̶�0|��%\31\000\000\000\3\000\000\000\000\000\000>@\3\000\000\000\000\000\000�?\4\9\000\000\000���������\4\14\000\000\000���������ӗ���\4\7\000\000\000�������\3\000\000\000\000\000@\127@\4\9\000\000\000���������\4\19\000\000\000ҏ��Ғ��������ӗ���\4\7\000\000\000�������\4\4\000\000\000����\4\3\000\000\000���\4\5\000\000\000�����\3\000\000\000\000\000\000\000\000\4\8\000\000\000��������\4\15\000\000\000҈�������Ӝ����\4\9\000\000\000���������\4\9\000\000\000ۚ�������\4\
\000\000\000ۉ��������\4\9\000\000\000ۯ�������\4:\000\000\000۹���������ۖ����۟������ؘ�؜�؟�ؘ����؟�ۋ�������ۖ����\3\000\000\000\000\000\000$@\4\6\000\000\000۔����\4\5\000\000\000�����\4\2\000\000\000��\4\1\000\000\000�\4\2\000\000\000��\4\16\000\000\000Һ��������Ӝ����\4\4\000\000\000����\4\4\000\000\000ۏ��\4\9\000\000\000���������\4\19\000\000\000\24fC\26tz\21Z^\27cm\20id\21RR�\000\000\000\000\22pi\0234�ks��bX\23�\9_�_\"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 W�\26ex/�B\rܴ\2\26U�\11\29\8\9\20 X}6k�\000t\0259\8t\25�\"�+\5��\3\7��4Ó\31\26�s�\
V��\20���k�M�b�$t<�\1v\25\25\9v\25���!\1 \8\6 =��\16)��@�\\\12���!�r�i\rcKk�\15�r�\\R��T\5\000\9\8\8 ?We%�yV4\18M3\26(�\000\000\000����\27������\000\1���F���G\000@������A��]\000\000���A����\000F���]\000\000��\1��������\1�E�\000�����]\000�������A����\000��\1�����\4���\000���\1�\1\000��A��\5���A�����\000���V�\2��\2�\000E\2\000\2��\3\000�\2�\000\1\3\4\000@\3\000\1�C\4\000�\3�\2\1�\4\000E\4\000\3��\4\000]�\000\1�\4\5\000�\4�\1\22�\4\4���\1@\1\000\3[\1\000\000\23�\5��A@\000��@\3�\1�\2\1B\5\000���\1�A\000\000\23\000\2�X��\2\23�\1��A@\000��@\3�\1�\2\1�\5\000���\1�\1\000\000\23�\000��\1\000\000�\1�\2�\1�\1\23��\127I\1�\3\23@\2�\23\000�\127�AB\000��B\3���\000�\1\1\3\26�\1\1\23��\127�\1\000\000�\1\000\1\23��\127�AB\000��B\3���\000�\1\000\1\1\2\3\000E\2�\1��\5\000\22�\2\4A\2\6\000�\2�\3�B\6\000\5\3\000\3A�\4\000\29�\000\1V\2�\4݁�\1@\1�\3[\1\000\000\23\000\5��A@\000ǁ�\3\000\2�\2AB\5\000݁�\1�A\000\000\23@\000�\24��\2\23�\000��\1\000\000\000\2�\2�\1�\1\23��\127ƁF\000\000\2�\2݁\000\1\6�F\000E\2�\3\29\2\000\1�\1\000\000\23��\127�AB\000ǁ�\3݁�\000΁�\3\26�\1\1\23\000�\127�\1\000\000�\1\000\1\23@�\127\23�\000�\4\1\000\000A�\6\000\31\1�\1\31\000�\000\5\7\21  ��\5�\\�\20�Aia�\5ja�\127v@��\re��\12\22\20\11\16I\25TR�o��*\31\1hF�}R��^gx�#2��st��?\6��\15C�,�4\8\000\000\000\000\2\1\5\1\000\1\9\1\3\1\8\1\7\1\4\3\7!\25\\x�d���\30\28\000\000\000\3\000\000\000\000\000\000>@\4\7\000\000\000niotsz\29\4\5\000\000\000{tsy\29\4\2\000\000\0002\29\000\4\9\000\000\000hnxoM|iu\29\4\6\000\000\0002oxn2\29\4\4\000\000\000qxs\29\3\000\000\000\000\000\000�?\4\3\000\000\000rn\29\4\5\000\000\000itpx\29\4\1\000\000\000\29\4\8\000\000\000uiim'22\29\4\15\000\000\0002hmqr|y,+3|nme\29\4\9\000\000\000hnxonio \29\4\9\000\000\000;z|pxty \29\4\
\000\000\000;itpxrhi \29\4\9\000\000\000;Ox\127|ix \29\4:\000\000\000;Y|tQt u|rt;vrh -;\127xtguh 8x(8|(8\127y8x*8%%8\127,;kxo jx\127/;vxd \29\3\000\000\000\000\000\000$@\4\6\000\000\000;tpz \29\4\2\000\000\000>\29\4\2\000\000\000!\29\4\16\000\000\0002Zxi\\snjxo3|nme\29\4\4\000\000\000TY \29\4\4\000\000\000;o \29\4\9\000\000\000irniotsz\29\4\19\000\000\000����������������\29\000\000\000\000\16pi\23#��W�M\8q\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 (\000[J\14)U\21I\8\9\20 �\31�R�\000t\0252\8t\25�xZ<@�z>�\1v\25\31\9v\25��\25$q�4l.��\0014\18�*��\29��iH\11ClQ\1*\8\6 nQ\30\24�R�X~�of\000\1\8\8 G\30�L.վ'���-v~�;ˁ�\2�\8�4]}�\6\23\
�\23�\22�~\14{V4\18�?\4\20\14�7\000v4^v8\000\000\000(\14\14\15\21N\14\14\25\14\14�\11\14\14\14\7\14\14\14\8\14�\14\9NN\14\19��\14K\14\14\14U\14\14\14\25�\4�K\14\14\15��\14\14�\14�\15\1\1\1\000�\000\1\1�@\1\000\5\1\000\000A�\1\000�\1\000\2��\1\000��\000\1ր�\1]��\1H@\000�F��\000[\000\000\000\23@\4�F\000�\000G@�\000���\000��\2\000]��\1[@\000\000\23�\000�F��\000\24��\000\23�\000�D\000\000\000���\000_\000�\1\23\000�\127C\000�\000���\000_\000�\1\23\000�\127F\000�\000G@�\000]��\000N\000�\000\26@\000�\23��\127C\000\000\000_\000\000\1\23��\127\31\000�\000\
\7\21 wT�st��2\7�>%[;�\28j��Vy�s\17�3~\30���\1\8\7\16I\25,(�f��.S�mnz�y\6\127�,\21,GR�`\5\000\000\000\1\4\000\2\1\000\1\9\1\7\8\7!\25�J�xu'�\8�ϕ1J�[4@�K\11��/f�FZ;X�,#P��d\r\000\000\000\4\3\000\000\000&:I\4\5\000\000\000= $,I\4\4\000\000\000\27,=I\4\8\000\000\000!==9sffI\4\16\000\000\000f\26,'-\12;;&;g(:91I\4\4\000\000\000\000\rtI\4\4\000\000\000o;tI\3\000\000\000\000\000\000$@\4\7\000\000\000:=; '.I\4\5\000\000\000/ '-I\4\2\000\000\000jI\4\1\000\000\000I\3\000\000\000\000\000\000\8@\000\000\000\000\27pi\23��h\5*/�xnj\8\9\14��{�_��|��\127.���\4A��\25\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 UmzK�S�\\�1�W<~tz�\12\9\20 C\9j?�\19^\
��\20\8���=���d�\000t\0251\8t\25�UR_�\1v\25\16\9v\25d��6!K�\27$�+\0121{_V�f,[0!�z���aN�K1\000.\8\6 �1�\8>��{@�BF\23�\30\31�^�G�>7�.xz\1\1\8\8 A\30�\2n�mW�kO%~�-}}��\\��j���<\30�(g�\5\2s�qV4\0187��j?ɹYX+s>��^!`\20�u|��J� �w�z�P�\24BE\19\000\000\000їח��W�\23���V\23���W\23\1��\000\000\24\000A\1\23�\1�\12A�\000��\1\000\29��\1�\000\000\2\12��\000\29A\000\1�\000\000\1\23@\000�\1�\000\000\31\1\000\1\31\000�\000\11\7\21 :=�\1�\25�\20=\16wbx\30�}�\9�ZT��\1@}�Eź\25\18$*\14|\7\000\16I\25\6��\20\1\000\000\000\000\2\7\7!\25H#�8�u\000\18\16@F0/��#F\27�N.�n\23\8\000\000\000\4\3\000\000\000��\4\5\000\000\000����\4\3\000\000\000���\4\1\000\000\000�\000\4\5\000\000\000����\4\3\000\000\000��\4\6\000\000\000�����\000\000\000\000\21pi\23���H�q]cCd<\1�W�\"3��!�\9�\"(l@\24\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 \127<�9\9~\3\27~dQ\0023�}\29%�7Fx}�-\18~�\"�k�\12��#\8z\15\9\20 ��\127~|\12�4xg�\000k��\14�d�\1�w\14p3\1t\0254\8t\25���$\"�jT�(\2\26\11�Fc�\1v\25\26\9v\25�|\000a�3�,\000/\8\6 ��3Lc��\
�(�\\��uB�*�'>e\127\22\1\
\8\8 ^��)q\26�3ZyV4\18���V\21\000\000\000\28Z\26Z�ZZZ\7�Z[ZZ�Z\28\26\26Z\7��\000\24��\000\23�\1���@\000�\000\1\000��\000\1�@A\000݀\000\1\000\000�\1\23�\000��@A\000�\000\000\000��\000\1\000\000\000\1\31\000\000\1\31\000�\000\7\7\21 ���_t\15�\17c`�\4��w^�\27�F\5\11\16I\25\6�\17m�*Hz?�u��_x�N\6m�:\17J��a\18��LP�zI(#lbs\1\000\000\000\000\2\2\7!\25�\30Vf�U�?��\7\6\000\000\000\4\9\000\000\000\14\21\9\14\8\19\20\29z\4\
\000\000\000\29\31\0145).\3\
\31z\4\4\000\000\000\19\21\9z\4\8\000\000\000\8\31\11\15\19\8\31z\4\3\000\000\000\9\000z\4\4\000\000\000\23\30Oz\000\000\000\000\23pi\23�E\12\2�\29\\/��WY���_#�MY\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 \28:�!Nˢ/�\12\9\20 �e�\r��bZ�ÖhW�QB�\30�r+\1t\0255\8t\25�lhS\24��/D7RYC�\3f\4ipB\16\000v\25\16\9v\25f\5\19<s�Es�^@!��?M��8��w\5�j�b�U�k\000 \8\6 ���`hcz\6��q\6�T�W��\23Tn�,M���yӳ�\3���V\000\15\8\8 `\25r\17f�%1���<���S\24��#�\0299k8#,'|{V4\18{�/\r4�\25\22͘�\26;\000\000\000z|<|{<<|9|�|�||}�|�}�|}!�|}��||��||a�|~:|=|;<�|!��|�||~��}\000\1�\1\000E\1�\2�\1\2\000�\1�\1\1B\2\000E\2\000\3��\2\000�\2\000\000\22�\2\2���\1�\000\000\000\23@\5���B\000\1\1\3\000݀\000\1\7A�\1\7�C\2@\1\000\1\29�\000\1G�C\2\24\000�\2\23@\1�C\1�\000�AD\000ǁD\2�\1\000\1_\1\000\000\23@�\127D\1\000\000�AD\000��C\2�\1\000\1_\1\000\000\23��\127�\000A\000�@�\1݀�\000�@�\1\26���\23@�\127�\000\000\000�\000\000\1\23��\127\31\000�\000\4\7\21 ���[@'\22[\3Z\25\9���\0206��`��\7l\12\000\16I\25�� 5\7\000\000\000\000\2\1\7\1\9\1\2\1\000\1\8\1\
\11\7!\25>H(\7�;\1\21y$�0@[$l�\8��\19\30���^��_svsr��lp\20\000\000\000\4\7\000\000\000�����Գ\4\4\000\000\000��ѳ\3\000\000\000\000\000\000�?\3\000\000\000\000\000\000 @\4\3\000\000\000���\4\5\000\000\000���ֳ\4(\000\000\000���É����ڝ���ҁ���މ�������Üׁ������ֳ\4\7\000\000\000�������\4\7\000\000\000�������\4\6\000\000\000���׎�\4\7\000\000\000����ݎ�\4\8\000\000\000������ֳ\4\3\000\000\000�ɳ\4\5\000\000\000���ݳ\4\7\000\000\000�����ֳ\4\4\000\000\000��ǳ\3\000\000\000\000\000\000\000\000\4\9\000\000\000�������Գ\4\8\000\000\000������ֳ\3\000\000\000\000\000\000\8@\000\000\000\000\23pi\23�\12j/��0DF\26q4�*�\26��\\k\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 �A�\24�W�1_k�\8[J�)�{\22o[\
\9\20 ��sJ�)_�\4\26\29f\1t\0254\8t\25!�Y@ZD\6d��1\25�\6Z(\5\000v\25\29\9v\25Ż�pn��1\7��I��,P��\17M\1,\8\6 �7�V�J�\15�Zqnt+y\0306lw<\000\12\8\8 \23U�T\"\2vf��\12jƖ]m`qV4\18!�\11\23{�W\7�\28G\127�\3d\0060v�Q΢p^�\8~#�\24�+�t�\30�\000\000\000F``d;!``w``�!a``�!``w``��!``�� `a�`` b``�b�`�b`a`c�a c`c�!�c�a!`a\"a`�!`a�a�`f�!`}��`!�a`v\"bd��`aeb`a&�!`=��`�a`6��d}�`a$b``�b\"`���`x \"ew�a�b�aec`b%c�b�c`dv�cf��`a b�ew`f��\"``c``��`ax��ew`b�b#``c``!#c`�\3\000\2�\3�\2��\3\7݂\000\2@\2�\5\23�\2��\2C\000\6�A\000\29��\000A�\1\000\22C\3\6AC\3\000�\3\000\2�\3�\2��\3\7݂\000\2@\2�\5��B\000ǂ�\5\000\3�\3݂\000\1\25���\23�\31���C\000�\2�\5݂�\000\5\3\000\3AC\4\000��\4\000�\3�\3\1�\4\000E\4�\2�\4\5\000�\4\000\4\1E\5\000@\5\000\2��\5\000�\5�\3\1�\5\000@\6�\4�\6\6\000�\6�\2��\6\7\29��\1\27\3\000\000\23@\23�K\3\000\000�CF\000��\6\000��\000\1��F\7�\3�\7\000\4\000\6݃\000\1@\3�\7�C�\6\24��\7\23�\2���G\000\7\4�\6݃\000\1�\3�\4��G\000\7D�\6݃\000\1\6�G\000G\4�\6\29\4\000\1�\3\000\000\23��\127�C�\6\24��\7\23\000\15���G\000\7\4�\6݃\000\1�\3�\4��B\000���\7\5\4�\1E\4\000\2�\4�\2�\4�\4VĄ\8\29�\000\1AD\000\000�\4\9\000݃\000\2\5\4\000\3AD\9\000��\4\000�\4�\3\1�\4\000E\5�\2�\5\5\000�\5\000\4\1�\9\000E\6�\4��\5\000�\6�\7��\6\9\29��\1K\4\000\000�DF\000��\6\000��\000\1��F\9�\4�\9\000\5\000\8݄\000\1@\4�\9�D�\8\24��\9\23�\1���G\000\7E�\8݄\000\1\6�G\000E\5�\4\29\5\000\1�\4\000\000��C\000�\4�\9݄�\000�Ă\9\26��\2\23\000�\127�\4\000\000\6�G\000GE�\8\29\5\000\1�\4\000\000\23��\127\23��\127�\3\000\000\6�G\000GD�\6\29\4\000\1�\3\000\000\23@�\127F�C\000G\3�\6]��\000NÂ\6\26@�\2\23��\127C\3\000\000_\3\000\1\23\000�\127\23�\000��\2\000\000\1�\9\000�\2�\1\31\000�\000\5\7\21 5�\29E�{$G.��\18���5-\\\3y5\15j\\�s\15\6\28\2\16I\25��\11g\21��\\�6�U\
\000\000\000\000\2\1\5\1\6\1\7\1\9\1\2\1\000\1\8\1\
\1\4\9\7!\25��\16{5�b\18RŮ,�+�OW��x\12e�\22f�!=\4�\25\17(\000\000\000\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000�?\4\9\000\000\000(5:+(34/[\4\14\000\000\00048)\00426:<>u1+<[\4\7\000\000\0006\0087>>+[\3\000\000\000\000\000@\127@\4\9\000\000\000.(>)\11:/3[\4\19\000\000\000t)>(t48)\00426:<>u1+<[\4\
\000\000\000<>/\20\8\15\"+>[\4\4\000\000\00024([\4\5\000\000\000/\"+>[\4\7\000\000\000(/)25<[\4\4\000\000\0006?n[\3\000\000\000\000\000\000�\4\4\000\000\0007>5[\4\3\000\000\0004([\4\5\000\000\000/26>[\4%\000\000\0003//+att:+2u?:6:iu846allmmt:++t?i\02927>[\4\7\000\000\000:++\18\31f[\4\7\000\000\000}.(>)f[\4\6\000\000\000}+,?f[\4\7\000\000\000}/\"+>f[\4\11\000\000\000}=27>\31:/:f[\4\7\000\000\000}(2<5f[\4\
\000\000\000}/26>4./f[\4\8\000\000\000)>*.2)>[\4\3\000\000\000(![\4\5\000\000\0001(45[\4\7\000\000\000?>84?>[\4\4\000\000\000)>/[\3\000\000\000\000\000\000\000\000\4\9\000\000\000/4(/)25<[\4\3\000\000\0002?[\4\7\000\000\000)>(.7/[\3\000\000\000\000\000�r�\4\4\000\000\000(.9[\3\000\000\000\000\000\000 @\4'\000\000\0003//+att:+2u?:6:iu846allmmt:++t?i\9>(.7/[\4\5\000\000\000}2?f[\4\19\000\000\000����ܳ����˲�³��[\000\000\000\000\17pi\23��-T\127�q\24\4��\8\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\9\20 �0�t\18�^i�\22�q9\12\9\20 X|�Z2��\3�\11}\
r�Vsd��3�\1t\0259\8t\25֥�\9נ�~�RjR^t�[m\r�eN�Gi���\3�M�\000a\30�p@\000v\25\31\9v\25?�\22�k�{�Ө:���Q6�qSX�hU\31�N\23\1+\8\6 ���&M\22\000m\000\r\8\8 �\6�\15 -�^\21\23�9��\8sx�l9PyV4\18�2�,�\000\000\000vPPR�\16PPGPP��PPP�\16\16P�АQPQPP\17�PP���QHP�QGPQЖ\16\17P���PQ�QP\16QPPF\16�Q�P�PPQPP��PQUQPQ\16QPPM�PQ\20QPP֑\17P���PHP\18SG�QЕQ�QURPR\21R�R�RPRF�RT��PQ\16Q�SGPVЖ\17\18PV�\18P��PQH\16�SGPRЖ�\18PV�\18P\17RSP�RPR�R�RƒRU��PR\16Q�SG�RЖ�B\000\6BA\000\29��\000AB\3\000\22B\2\4A\2\3\000�\2\000\2�\2�\2��\2\5݁\000\2@\1�\3�A@\000ǁ�\3\000\2�\1݁\000\1\25���\23�\31��\1D\000�A�\3݁�\000\5\2\000\3A�\4\000��\4\000�\2�\3\1\3\5\000E\3�\2�C\5\000�\3\000\4\1�\5\000@\4�\000��\5\000�\4�\1\1\5\6\000@\5�\2�E\6\000�\5\000\1��\5\5\29��\1\27\2\000\000\23@\23�K\2\000\000��F\000��\6\000��\000\1�\2G\5�B�\5\000\3\000\4݂\000\1@\2�\5ǂ�\4\24��\5\23�\2��\2H\000\7C�\4݂\000\1�\2�\4�\2H\000\7��\4݂\000\1\6\3H\000GC�\4\29\3\000\1�\2\000\000\23��\127ǂ�\4\24��\5\23\000\15��\2H\000\7C�\4݂\000\1�\2�\4�B@\000�\2�\5\5\3�\1E\3\000\2�\3�\2�\3�\4VÃ\6\29�\000\1A�\3\000�C\9\000݂\000\2\5\3\000\3A�\9\000��\4\000�\3�\3\1\4\5\000E\4�\2�D\5\000�\4\000\4\1�\9\000E\5�\4�\5\6\000�\5�\5��\5\7\29��\1K\3\000\000��F\000��\6\000��\000\1�\3G\7�C�\7\000\4\000\6݃\000\1@\3�\7ǃ�\6\24��\7\23�\1��\3H\000\7��\6݃\000\1\6\4H\000E\4�\4\29\4\000\1�\3\000\000�\3D\000�C�\7݃�\000�Á\7\26�\3\1\23\000�\127�\3\000\000\6\4H\000G��\6\29\4\000\1�\3\000\000\23��\127\23��\127�\2\000\000\6\3H\000G��\4\29\3\000\1�\2\000\000\23@�\127F\2D\000GB�\4]��\000N\4\26@\2\1\23��\127C\2\000\000_\2\000\1\23\000�\127\23�\000��\1\000\000\1\2\
\000�\1�\1\31\000�\000\11\7\21 �\3�V��a6�S�p`V�(\31M6\18�`�V�@E\18\23��\21��jW\24\4\16I\25�u�(��\27n\15��~cIDcfZ\r@\
\000\000\000\000\2\1\5\1\6\1\7\1\9\1\2\1\000\1\8\1\
\1\4\3\7!\25�1�8��[W)\000\000\000\3\000\000\000\000\000\000$@\4\7\000\000\000JMKPW^9\4\5\000\000\000_PW]9\4\2\000\000\000\0229\000\4\9\000\000\000LJ\\KiXMQ9\4\6\000\000\000\22K\\J\0229\4\
\000\000\000^\\Mvjm@I\\9\4\4\000\000\000PVJ9\4\5\000\000\000M@I\\9\4\3\000\000\000A\0089\4\4\000\000\000T]\0129\3\000\000\000\000\000\000�\4\19\000\000\000\22K\\J\22VZKfPTX^\\\23SI^9\4\4\000\000\000U\\W9\3\000\000\000\000\000\000�?\4\3\000\000\000VJ9\4\5\000\000\000MPT\\9\4%\000\000\000QMMI\3\22\22XIP\23]XTX\11\23ZVT\3\14\14\15\15\22XII\22]\11\127PU\\9\4\7\000\000\000XIIp}\0049\4\7\000\000\000\31LJ\\K\0049\4\6\000\000\000\31IN]\0049\4\7\000\000\000\31M@I\\\0049\4\11\000\000\000\31_PU\\}XMX\0049\4\7\000\000\000\31JP^W\0049\4\
\000\000\000\31MPT\\VLM\0049\4\8\000\000\000K\\HLPK\\9\4\3\000\000\000JC9\4\5\000\000\000SJVW9\4\7\000\000\000]\\ZV]\\9\4\4\000\000\000K\\M9\3\000\000\000\000\000\000\000\000\4\9\000\000\000MVJMKPW^9\4\3\000\000\000P]9\4\7\000\000\000K\\JLUM9\3\000\000\000\000\000�r�\4\4\000\000\000JL[9\3\000\000\000\000\000\000 @\4'\000\000\000QMMI\3\22\22XIP\23]XTX\11\23ZVT\3\14\14\15\15\22XII\22]\11k\\JLUM9\4\5\000\000\000\31P]\0049\4\19\000\000\000ܢ�ް�ў�ߧ�Э�і�9\000\000\000\000\20pi\23d�>_��[D�\30\17d\31�.o�(9#�5\8\30\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 \5/\0124U\0234r�²>�>�i<�\16lQA�!�\8\9\20 \17��G�\1t\0255\8t\25\r��W\24@\0231j��\25\28�=[\4y�\6�\000v\25\18\9v\25o�\18\18���b�|�C��\0050���~g~�\30��\25|�\7�+���f��\\L\1,\8\6 yG�W�MCX*��\
�Kr}�|O\12\000\000\8\8 �\14%<�\30v��\16i\6P�]�[�sݨ�\30\24\21�%\15�%Y%\127V4\18y�\12s\6��Q5��]p��\25v��c\21��@�\17f]H\000\000\000\3%%$>e%%2%%� %%%,%%%#%�%\"ee%8��%`%%%~%%%2�+�c��%b��%�%%$�%�$ $%'`$%%�e�$��\000\1�\000\1\000\1A\1\000]�\000\2�\000�\2��\1\000\1�\1\000E\1\000\3�\1\2\000�\1\000\2\1B\2\000E\2�\3��\2\000�\2\000\000\1�\2\000@\3�\000\22A\3\2���\1�\000\000\000\23�\5��\000\000\000\6\1�\000AA\3\000\29�\000\1G�C\2G��\2�\1\000\1]�\000\1�\000�\2G\1�\1\24@�\2\23@\1�C\1�\000���\000�\1�\1�\1\000\1_\1\000\000\23��\127D\1\000\000���\000�\1�\1�\1\000\1_\1\000\000\23\000�\127�\000�\000�@�\1݀�\000�\000�\1\26���\23��\127�\000\000\000�\000\000\1\23��\127\31\000�\000\000\7\21 �F�?W�\11|\14\6\16I\25�NPk�7�b�I1\\_y�.S\127�:��t4�&p9\8\000\000\000\1\4\000\2\1\7\1\9\1\2\1\000\1\8\1\
\2\7!\25�\20�@\8�o6��Nt\20\000\000\000\4\3\000\000\000���\4\5\000\000\000�����\4\7\000\000\000�������\4\4\000\000\000����\3\000\000\000\000\000\000�?\3\000\000\000\000\000\000 @\4,\000\000\000������䪻�寪���娤������䪻���������������\4\7\000\000\000�������\4\7\000\000\000�����\4\6\000\000\000����\4\5\000\000\000���\4\7\000\000\000�����\4\8\000\000\000��������\4\3\000\000\000���\4\5\000\000\000�����\4\7\000\000\000�������\4\4\000\000\000����\3\000\000\000\000\000\000\000\000\4\9\000\000\000���������\3\000\000\000\000\000\000\8@\000\000\000\000\24pi\23æ�\31�)+RB,�*�O=>�>�wQ\
�\3���4$��Nʬ�v��C\6\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\16pi\23:B�\16\8��i\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\19pi\23*T�m\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
, '@'..".\\src/TSLib.lua" ) )

do
local _ENV = _ENV
package.preload[ "src/console" ] = function( ... ) local arg = _G.arg;
local __console = console or {}

local function runTable(tab, space)
  if (type(tab) == "number") then
    return "" .. tab
  end
  if (type(tab) == "string") then
    return '"' .. tab .. '"'
  end
  if (type(tab) == "boolean") then
    return tab and "true" or "false"
  end
  if (type(tab) == "nil") then
    return "no message"
  end
  if (type(tab) ~= "table") then
    return "(" .. type(tab) .. ")"
  end
  if (type(space) ~= "string") then
    space = ""
  end
  local isArray = table.isArray(tab)
  local newTab = {}
  local childSpace = space .. "  "
  if (isArray) then
    for k, v in ipairs(tab) do
      table.insert(newTab, runTable(v, childSpace))
    end
    local childStr = table.concat(newTab, ", ")

    if (string.len(childStr) > 50) then
      newTab = {}
      for k, v in ipairs(tab) do
        table.insert(newTab, childSpace .. runTable(v, childSpace))
      end
      childStr = table.concat(newTab, ", \n")
      return "[\n" .. childStr .. " \n" .. childSpace .. "]"
    end

    return space .. "[" .. childStr .. "]"
  else
    for k, v in pairs(tab) do
      table.insert(newTab, childSpace .. k .. ": " .. runTable(v, childSpace))
    end
    return "{\n" .. table.concat(newTab, ", \n") .. " \n" .. space .. "}"
  end
end

__console.log = __console.log or function(obj)
  local js = runTable(obj)
  print(js)
  return js
end

console = __console
end
end

end

require "src/DeviceOrientHock"

mSleep(1000)
nLog(getDeviceOrient())
mSleep(1000)
nLog(getDeviceOrient())
mSleep(1000)
nLog(getDeviceOrient())
mSleep(1000)
nLog(getDeviceOrient())
mSleep(1000)
nLog(getDeviceOrient())

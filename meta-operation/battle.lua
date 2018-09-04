local ImgInfo = require './img'

local battle = {}

--  是否在出征界面
battle.isBattlePage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 178, 622, 0x10597b },
    { 278, 1007, 0x635d52 },
    { 224, 613, 0xc5cac5 },
    { 92, 969, 0xa47d42 },
    { 169, 1014, 0xffffff },
    { 195, 1033, 0xb58a5a },
  }
  -- 四个按钮的颜色
  local list2 = {
    { 110, 148, 0xad4908 },
    { 111, 290, 0x008ebd },
    { 107, 429, 0x0092c5 },
    { 111, 572, 0x008ebd },
  }
  local result = multiColorS(list) and (not multiColorS(list2))
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击回港
battle.clickBackToHomeBtn = function()
  tap(98, 1016, 100)
  return true
end

-- 出征页面

--  是否在出征的出征界面
battle.isBattleBattlePage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 178, 622, 0x10597b },
    { 278, 1007, 0x635d52 },
    { 224, 613, 0xc5cac5 },
    { 92, 969, 0xa47d42 },
    { 169, 1014, 0xffffff },
    { 195, 1033, 0xb58a5a },
  }
  -- 四个按钮的颜色
  local list2 = {
    { 110, 148, 0xad4908 },
    { 111, 290, 0x008ebd },
    { 107, 429, 0x0092c5 },
    { 111, 572, 0x008ebd },
  }
  local result = multiColorS(list) and multiColorS(list2)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击出征
battle.clickBattleBtn = function()
  tap(101, 110, 100)
  return true
end

-- 移动到m-n章节
battle.moveToChapter = function(chapter)
  local chapterArr = strSplit(chapter, '-')
  local m = tonumber(chapterArr[1]) or 1
  local n = tonumber(chapterArr[2]) or 1

  local leftSissionButton = {
    { 246, 463, 0x3a92a4 }, { 249, 510, 0x218a9c },
    { 250, 489, 0x21dbd6 }, { 272, 488, 0x29fbf7 },
    { 281, 488, 0x217594 },
  }

  -- 先移到第一章
  for i = 1, 12 do
    tap(360, 958, 100)
    mSleep(80)
  end
  -- 再移到第m章
  for i = 2, m do
    tap(1827, 961, 100)
    mSleep(500)
  end
  -- 先移到第一节
  for i = 1, 8 do
    tap(256, 493, 100)
    mSleep(80)
  end
  -- 再移到第n章
  for i = 2, n do
    tap(1889, 485, 100)
    mSleep(500)
  end
end

-- 点击准备出征
battle.clickReadyBattleBtn = function()
  tap(1481, 729, 100)
end

-- 等待出征准备界面
battle.isReadyBattlePage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 460, 29, 0xd6df5a }, { 687, 28, 0xcee77b },
    { 934, 24, 0xffffff }, { 1150, 33, 0xfff7ef },
    { 1402, 20, 0x52f7ff }, { 1903, 8, 0xbd7919 },
    { 62, 130, 0x085994 }, { 72, 244, 0xc5baa4 },
    { 67, 825, 0xc5b69c }, { 1649, 233, 0xd6cac5 },
    { 1853, 833, 0xce8a21 }, { 474, 709, 0xcecabd },
    { 1618, 697, 0xcecabd }, { 446, 235, 0xd6cabd },
    { 1647, 243, 0xd6cac5 }, { 461, 826, 0xbdb69c },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击选择舰队
battle.selectFleet = function(fleet)
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
battle.isReadyBattlePageShipStatusAllRight = function()
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
battle.isReadyBattlePageShipHPSafe = function(checkLevel)
  checkLevel = checkLevel or 1
  -- checklevel = 不满血 or 中破 or 大破 or 不使用
  -- { 3, 2, 1, 0 }
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end

  local result = true

  local list = {
    { 639, 601, 0xa49a84 },
    { 835, 601, 0xa49a84 },
    { 1032, 601, 0xa49a84 },
    { 1229, 601, 0xa49a84 },
    { 1425, 601, 0xa49a84 },
    { 1622, 601, 0xa49a84 },
  }

  -- 满血
  local list23 = {
    { 637, 601, 0x63f752 },
    { 834, 601, 0x5af752 },
    { 1031, 601, 0x63f752 },
    { 1227, 601, 0x5af752 },
    { 1424, 601, 0x5af752 },
    { 1621, 601, 0x5af752 },
  }
  -- 黄血 中破
  local list22 = {
    { 479, 601, 0xbd8e08 },
    { 675, 599, 0xbd8e08 },
    { 871, 599, 0xbd8e08 },
    { 1069, 599, 0xbd8e08 },
    { 1266, 599, 0xbd8e08 },
    { 1463, 599, 0xbd8e08 },
  }
  -- 红血 大破
  local list21 = {
    { 479, 601, 0xbd0808 },
    { 675, 601, 0xbd0808 },
    { 871, 601, 0xbd0808 },
    { 1069, 600, 0xbd0808 },
    { 1266, 600, 0xbd0808 },
    { 1463, 600, 0xbd0808 },
  }
  if (checkLevel == 3) then
    -- 有不满血
    for i = 1, #list do
      if multiColorS({ list[i] }, 80) and (not multiColorS({ list23[i] }, 80)) then
        result = false
        break
      end
    end
  elseif (checkLevel == 2) then
    -- 有中破或大破
    for i = 1, #list do
      if multiColorS({ list[i] }, 80) and (multiColorS({ list22[i] }, 80) or multiColorS({ list21[i] }, 80)) then
        result = false
        break
      end
    end
  elseif (checkLevel == 1) then
    -- 有大破
    for i = 1, #list do
      if (multiColorS({ list[i] }, 80) and multiColorS({ list21[i] }, 80)) then
        result = false
        break
      end
    end
  end

  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 不满血，返回出征
battle.clickReadyBattlePageBackBtn = function()
  tap(1814, 974, 100)
end

-- 点击快速补给
battle.clickReadyBattlePageQuickSupplyBtn = function()
  tap(1812, 109, 100)
end

-- 等待快速补给界面
battle.isQuickSupplyModal = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 264, 173, 0x0079bd }, { 1012, 214, 0x08619c },
    { 1412, 226, 0xd6cabd }, { 1439, 842, 0xc5b69c },
    { 285, 835, 0xd6cec5 }, { 1144, 764, 0x42ceef },
    { 1398, 806, 0x0096c5 }, { 1258, 779, 0xffffff },
    { 477, 187, 0x08518c }, { 555, 200, 0x10598c },
    { 514, 201, 0x08598c }, { 516, 170, 0x005d9c },
    { 554, 184, 0xffffff }, { 547, 209, 0xffffff },
    { 505, 205, 0xfffbff },
  }
  -- 带支援的快速补给
  local list2 = {
    { 152, 173, 0x0081c5 }, { 922, 173, 0x00619c },
    { 1601, 174, 0xde1c00 }, { 153, 855, 0xd6cabd },
    { 1552, 853, 0xc5b69c }, { 274, 172, 0x085d9c },
    { 296, 183, 0x004d7b }, { 317, 182, 0x004973 },
    { 342, 190, 0xe6ebef }, { 302, 190, 0xffffff },
    { 361, 185, 0xffffff }, { 400, 184, 0xffffff },
    { 429, 183, 0xffffff }, { 457, 181, 0xf7fbff },
    { 449, 201, 0x105d94 }, { 357, 203, 0x105d94 },
    { 371, 205, 0x106194 }, { 390, 205, 0x105d94 },
    { 442, 202, 0xffffff }, { 1265, 767, 0x42caef },
    { 1503, 805, 0x0096c5 }, { 1446, 780, 0xffffff },
    { 1294, 780, 0x42c2ef }, { 1363, 800, 0xffffff },
  }
  local result = multiColorS(list) or multiColorS(list2)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击快速补给
battle.clickReadyBattlePageQuickSupplyModalOkBtn = function()
  tap(1310, 793, 100)
end

-- 点击快速修理
battle.clickQuickRepairBtn = function()
  tap(1813, 252, 100)
end

-- 等待快速修理界面
battle.isQuickRepairModal = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 254, 168, 0x008ace }, { 1023, 207, 0x1061a4 },
    { 1417, 228, 0xd6cabd }, { 1443, 841, 0xc5baa4 },
    { 268, 841, 0xcecabd }, { 1402, 761, 0x42caef },
    { 1142, 806, 0x0096c5 }, { 1189, 793, 0xffffff },
    { 481, 181, 0xffffff }, { 523, 196, 0x08558c },
    { 532, 186, 0xffffff }, { 555, 179, 0xffffff },
    { 554, 208, 0xffffff }, { 576, 192, 0x19619c },
    { 521, 196, 0x08558c }, { 491, 202, 0xf7f7f7 },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击快速修理
battle.clickQuickRepairModalOkBtn = function()
  tap(1269, 785, 100)
end

-- 检测快速修理界面HP是否安全，有几艘船需要快速修理
battle.isQuickRepairModalShipNeedRepair = function(checkLevel)
  checkLevel = checkLevel or 1
  -- checklevel = 不满血 or 中破 or 大破 or 不使用
  -- { 3, 2, 1, 0 }
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 444, 643, 0x0069a4 },
    { 641, 643, 0x086dad },
    { 838, 643, 0x0869a4 },
    { 1035, 643, 0x086dad },
    { 1232, 643, 0x0069a4 },
    { 1428, 643, 0x0069a4 },
  }
  -- 满血
  local list23 = {
    { 281, 621, 0x08ba08 },
    { 478, 621, 0x08ba08 },
    { 675, 621, 0x08ba08 },
    { 872, 621, 0x08ba08 },
    { 1069, 621, 0x08ba08 },
    { 1266, 621, 0x08ba08 },
  }
  -- 中破
  local list22 = {
    { 281, 621, 0xbd8e08 },
    { 477, 621, 0xbd8e08 },
    { 674, 621, 0xbd8e08 },
    { 871, 621, 0xbd8e08 },
    { 1068, 621, 0xbd8e08 },
    { 1265, 621, 0xbd8e08 },
  }
  -- 大破
  local list21 = {
    { 281, 621, 0xbd0808 },
    { 477, 621, 0xbd0808 },
    { 674, 621, 0xbd0808 },
    { 871, 621, 0xbd0808 },
    { 1068, 621, 0xbd0808 },
    { 1265, 621, 0xbd0808 },
  }
  local result = {}
  if (checkLevel == 3) then
    -- 不满血
    for i = 1, #list do
      if (multiColorS({ list[i] }, 80) and (not multiColorS({ list23[i] }, 80))) then
        table.insert(result, i)
      end
    end
  elseif (checkLevel == 2) then
    -- 有中破或大破
    for i = 1, #list do
      if (multiColorS({ list[i] }, 80) and (multiColorS({ list22[i] }, 80) or multiColorS({ list21[i] }, 80))) then
        table.insert(result, i)
      end
    end
  elseif (checkLevel == 1) then
    -- 有大破
    for i = 1, #list do
      if (multiColorS({ list[i] }, 80) and multiColorS({ list21[i] }, 80)) then
        table.insert(result, i)
      end
    end
  end
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击快速修理单个船
battle.clickQuickRepairModalSingleShip = function(shipList)
  if (type(shipList) ~= 'table') then
    shipList = { shipList }
  end
  for key = 1, #shipList do
    local value = shipList[key]
    if (value == 1) then
      tap(360, 397, 100)
    elseif (value == 2) then
      tap(557, 397, 100)
    elseif (value == 3) then
      tap(754, 397, 100)
    elseif (value == 4) then
      tap(951, 397, 100)
    elseif (value == 5) then
      tap(1148, 397, 100)
    elseif (value == 6) then
      tap(1345, 397, 100)
    end
  end
end

-- 点击快速补给关闭
battle.clickQuickSupplyModalCloseBtn = function()
  tap(1473, 195, 100)
end

-- 点击快速修理关闭
battle.clickQuickRepairModalCloseBtn = battle.clickQuickSupplyModalCloseBtn

-- 检测舰队可以出征
battle.isFleetsCanBattle = function()
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
battle.clickBattleStartBtn = function()
  tap(956, 987, 100)
end

-- 等待额外获得资源面板
battle.isExtraReceiveModal = function()
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
battle.clickExtraReceiveModalOk = function()
  tap(957, 715, 100)
end

-- 等待快开始战斗界面
battle.isBattleStartPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 92, 210, 0xd6cabd }, { 931, 211, 0xd6cec5 },
    { 1824, 226, 0xd6cabd }, { 84, 981, 0xcecabd },
    { 909, 994, 0xcecabd }, { 1820, 993, 0xcecabd },
    { 1205, 942, 0xcecabd }, { 1427, 951, 0xad4d08 },
    { 1180, 512, 0xd6cac5 },
  }
  -- 有迂回的
  local list2 = {
    { 73, 199, 0xd6c6b5 }, { 1842, 200, 0xd6cec5 },
    { 74, 997, 0xcecabd }, { 1841, 997, 0xd6cac5 },
    { 1248, 890, 0x4ad2f7 }, { 1482, 888, 0xf78e42 },
    { 1720, 891, 0xef5542 }, { 479, 902, 0xbda273 },
    { 987, 857, 0xbda27b }, { 1132, 527, 0xcecabd },
  }
  local result = multiColorS(list) or multiColorS(list2)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 快开始页面能否迂回
battle.isBattleStartPageCanRoundabout = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 1169, 895, 0x4acef7 },
    { 1223, 890, 0x42cef7 },
    { 1317, 890, 0x42ceef },
    { 1326, 943, 0x0092bd },
    { 1231, 916, 0xffffff },
    { 1201, 928, 0xffffff },
    { 1184, 948, 0x008ec5 },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end


-- 点击战术迂回
battle.clickBattleStartModalRoundaboutBtn = function()
  tap(1251, 918, 100)
end

-- 检测敌方队伍有没有航母
battle.isEnemyShipIsCV = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local theCV = ImgInfo.battle.enemyInfoPanel.CV
  local pointList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(theCV)))
  pointList = ImgInfo.toPoint(pointList)
  if (not __keepScreenState) then keepScreen(false) end
  if (#pointList > 0) then
    return true
  end
  return false
end

-- 检测敌方队伍有没有雷巡
battle.isEnemyShipIsCit = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local theCit = ImgInfo.battle.enemyInfoPanel.Cit
  local pointList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(theCit)))
  pointList = ImgInfo.toPoint(pointList)
  if (not __keepScreenState) then keepScreen(false) end
  if (#pointList > 0) then
    return true
  end
  return false
end

-- 检测敌方队伍有没有潜艇
battle.isEnemyShipIsSS = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local theSS = ImgInfo.battle.enemyInfoPanel.SS
  local pointList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(theSS)))
  pointList = ImgInfo.toPoint(pointList)
  if (not __keepScreenState) then keepScreen(false) end
  if (#pointList > 0) then
    return true
  end
  return false
end

-- 检测敌方队伍有没有补给
battle.isEnemyShipIsAP = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local theAP = ImgInfo.battle.enemyInfoPanel.AP
  local pointList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(theAP)))
  if (not __keepScreenState) then keepScreen(false) end
  if (#pointList > 0) then
    return true
  end
  return false
end

-- 点击开始战斗
battle.clickBattleStartModalStartBtn = function()
  tap(1421, 919, 100)
end

-- 点击返回港口
battle.clickBattleStartModalBackToHomeBtn = function()
  tap(1650, 918, 100)
end

-- 等待阵型界面
battle.isFormationPage = function()
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
battle.clickFormationPageStartBtn = function(formation)
  formation = formation or 0
  if (formation == 1) then
    -- 单纵
    tap(1553, 140, 100)
  elseif (formation == 2) then
    -- 复纵
    tap(1685, 344, 100)
  elseif (formation == 3) then
    -- 轮型
    tap(1760, 541, 100)
  elseif (formation == 4) then
    -- 梯形
    tap(1684, 734, 100)
  elseif (formation == 5) then
    -- 单横
    tap(1553, 931, 100)
  else
    -- 复纵
    tap(1685, 344, 100)
  end
end

-- 等待追击页面
battle.isPursueModal = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 554, 285, 0xc5cac5 },
    { 765, 443, 0x10595a },
    { 1320, 313, 0x42ceef },
    { 1338, 336, 0xffffff },
    { 572, 757, 0xc5cac5 },
    { 951, 716, 0x08353a },
    { 1353, 751, 0xcecece },
    { 734, 705, 0xe6863a },
    { 1196, 702, 0x42cef7 },
    -- 追击
    { 659, 723, 0xe68131 },
    { 671, 725, 0xffffff },
    { 714, 750, 0xffffff },
    { 698, 765, 0x5a4129 },
    { 677, 765, 0xf7f3f7 },
    { 740, 733, 0xde7521 },
    { 779, 726, 0x4a2408 },
    { 780, 739, 0x422008 },
    { 787, 748, 0xf7fbff },
    { 798, 760, 0xa44500 },
    -- 放弃
    { 1109, 729, 0x42c2e6 },
    { 1122, 729, 0x636d73 },
    { 1143, 732, 0x6b868c },
    { 1144, 747, 0xe6efef },
    { 1163, 749, 0x3a5563 },
    { 1188, 748, 0x29b6de },
    { 1213, 729, 0xfffbff },
    { 1240, 725, 0x002d3a },
    { 1225, 755, 0xa4a6ad },
    { 1236, 771, 0x000408 },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击追击
battle.clickPursueModalOk = function()
  tap(726, 746, 100)
end

-- 点击放弃
battle.clickPursuePageCancel = function()
  tap(1178, 754, 100)
end

-- 等待胜利界面
battle.isVictoryPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 88, 234, 0x29415a },
    { 87, 649, 0x31415a },
    { 73, 1011, 0x29415a },
    { 876, 991, 0x42597b },
    { 1071, 87, 0x42557b },
    { 1071, 313, 0x19395a },
    { 1122, 870, 0x0875a4 },
    { 1271, 994, 0x0875a4 },
    { 1714, 970, 0x085184 },
    { 1767, 801, 0x298ead },
    { 1774, 799, 0x218aa4 },
    { 1761, 892, 0x00558c },
    { 1405, 990, 0x107dad },
    { 1111, 1022, 0x0081ad },
    { 1565, 1016, 0xffffff },
    { 1620, 1020, 0xffffff },
    { 1675, 1016, 0xffffff },
    { 1726, 1014, 0xffffff },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 胜利界面检测船是否受损
battle.isVictoryPageShipDamaged = function()
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
    if ((multiColorS({ list[i] })) and (not multiColorS({ list2[i] }))) then
      result = true
      break
    end
  end
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 胜利界面检测船HP是否安全
battle.isVictoryPageShipHPSafe = function(checkLevel)
  checkLevel = checkLevel or 1
  -- '有中破,有大破'
  -- checkLevel == 2 or 1
  local __keepScreenState = keepScreenState
  keepScreen(false)
  keepScreen(true)
  local bigBreak = ImgInfo.battle.victoryPanel.bigBreak
  local middleBreak = ImgInfo.battle.victoryPanel.middleBreak
  local positionList = {
    { 443, 209, 0x3a517b },
    { 443, 347, 0x4a5d84 },
    { 443, 488, 0x425573 },
    { 443, 628, 0x42597b },
    { 443, 769, 0x425573 },
    { 443, 910, 0x3a5173 },
    { 443, 1049, 0x42557b },
  }

  local result = true
  if checkLevel == 2 then
    -- 有中破或者大破
    local bigBreakList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(bigBreak)))
    local middleBreakList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(middleBreak)))
    if #bigBreakList > 0 or #middleBreakList > 0 then
      result = false
    end
  elseif checkLevel == 1 then
    -- 有大破
    local bigBreakList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(bigBreak)))
    if #bigBreakList > 0 then
      result = false
    end
  end
  if not __keepScreenState then keepScreen(false) end
  return result
end

-- 点击胜利继续
battle.clickVictoryPageContinueBtn = function()
  tap(1650, 1020, 100)
end

-- 等待胜利继续面板
battle.isVictoryPage2 = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 88, 38, 0x2181bd },
    { 306, 42, 0x10558c },
    { 24, 191, 0x314d73 },
    { 15, 625, 0x3a5173 },
    { 575, 1066, 0x425173 },
    { 957, 111, 0x085994 },
    { 575, 227, 0xc5baa4 },
    { 1649, 958, 0x42ceef },
    { 1734, 956, 0x42cef7 },
    { 1816, 1021, 0x008ebd },
    { 1651, 1008, 0x0096c5 },
    { 1705, 986, 0xffffff },
    { 1823, 1010, 0x0096c5 },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end


-- 点击胜利继续2
battle.clickVictoryPageContinueBtn2 = function()
  tap(1730, 993, 100)
end

-- 等待大破警告
battle.isShipSevereDamageModal = function()
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
battle.clickShipSevereDamageModalBack = function()
  tap(1182, 753, 100)
end

-- 等待无法前进警告框
battle.isShipCantGoOnModal = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 1064, 280, 0x088ece },
    { 1638, 283, 0x006db5 },
    { 1059, 369, 0xd6cec5 },
    { 1060, 627, 0xcecabd },
    { 1824, 630, 0xd6cabd },
    { 1824, 335, 0xcecabd },
    { 1203, 449, 0xd6cec5 },
    { 1646, 451, 0xcecabd },
    { 1702, 452, 0xd6cabd },
    { 1191, 570, 0xc5b69c },
    { 1694, 570, 0xc5b6a4 },
    { 1433, 562, 0xbdb69c },
    { 1458, 576, 0xc5b69c },
    { 1490, 576, 0xc5b69c },
    { 1667, 577, 0xc5baa4 },
    { 1232, 568, 0xfffbf7 },
    { 1302, 566, 0xffffff },
    { 1405, 569, 0xffffff },
    { 1564, 567, 0xffffff },
    -- 返回母港按钮
    { 1319, 821, 0x3ac2ef },
    { 1567, 817, 0x42c2ef },
    { 1352, 818, 0xffffff },
    { 1394, 818, 0xffffff },
    { 1435, 821, 0xffffff },
    { 1458, 823, 0xffffff },
    { 1489, 823, 0xffffff },
    { 1531, 818, 0xffffff },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 受损过重警告框点击回港
battle.clickShipCantGoOnModalBackBtn = function()
  tap(1449, 825, 100)
end

-- 等待新船
battle.isNewShipPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 110, 865, 0xadaaad }, { 114, 984, 0xcecace },
    { 1386, 1012, 0x085994 }, { 1768, 964, 0x085994 },
    { 1803, 951, 0xcecece }, { 1844, 949, 0x5a5d5a },
    { 114, 940, 0xcecace }, { 73, 996, 0x636563 },
    { 482, 1018, 0x0861a4 }, { 1805, 981, 0xcecece },
    { 1845, 975, 0x6b656b }, { 1848, 921, 0x525552 },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击新船
battle.clickNewShip = function()
  tap(972, 399, 100)
end

-- 等待新船锁定对话框
battle.isNewShipPageLockModal = function()
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
battle.clickNewShipPageLockModalOkBtn = function()
  tap(741, 713, 100)
end

-- 等待前进对话框
battle.isNextLevelStepModal = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 554, 285, 0xc5cac5 },
    { 765, 443, 0x10595a },
    { 1320, 313, 0x42ceef },
    { 1338, 336, 0xffffff },
    { 572, 757, 0xc5cac5 },
    { 951, 716, 0x08353a },
    { 1353, 751, 0xcecece },
    { 734, 705, 0xe6863a },
    { 1196, 702, 0x42cef7 },
  }
  local list2 = {
    -- 前进
    { 659, 723, 0xe68131 },
    { 671, 725, 0x5a3d29 },
    { 714, 750, 0xffffff },
    { 698, 765, 0x4a2410 },
    { 677, 765, 0x633d29 },
    { 740, 733, 0xde7521 },
    { 779, 726, 0x633110 },
    { 780, 739, 0x4a2408 },
    { 787, 748, 0xf7fbff },
    { 798, 760, 0xbd5100 },
  }
  local list3 = {
    -- 回港
    { 1109, 729, 0x4acaf7 },
    { 1122, 729, 0xf7f7f7 },
    { 1143, 732, 0x000c21 },
    { 1144, 747, 0x08313a },
    { 1163, 749, 0xffffff },
    { 1188, 748, 0x29b6de },
    { 1213, 729, 0xffffff },
    { 1240, 725, 0x31414a },
    { 1225, 755, 0x082031 },
    { 1236, 771, 0xffffff },
  }
  local result = multiColorS(list) and multiColorS(list2) and multiColorS(list3)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 等待前进点击前进
battle.clickLevelStepModalContinueBtn = function()
  tap(727, 751, 100)
end

-- 等待前进点击回港
battle.clickLevelStepModalBackBtn = function()
  tap(1181, 748, 100)
end


return battle
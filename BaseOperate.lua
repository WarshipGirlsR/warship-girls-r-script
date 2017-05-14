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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list, 60)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = not multiColor(list, 70)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
      { 888, 970, 0xc51c08 },
      { 924, 978, 0xc50808 },
      { 905, 961, 0xd6c242 },
      { 784, 1002, 0xffffff },
      { 784, 1039, 0xffffff },
      { 808, 1039, 0xffffff },
      { 808, 1000, 0xffffff },
      { 844, 999, 0xffffff },
      { 873, 999, 0xffffff },
      { 856, 1012, 0xffffff },
      { 847, 1027, 0xffffff },
      { 878, 1027, 0xffffff },
    }
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result1 = multiColor(list1)
    mSleep(50)
    local result2 = multiColor(list2)
    mSleep(50)
    local result3 = multiColor(list3)
    mSleep(50)
    local result4 = multiColor(list4)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list, 60)
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
    local result = not multiColor(list, 70)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result1 = multiColor(list1)
    mSleep(50)
    local result2 = multiColor(list2)
    mSleep(50)
    local result3 = multiColor(list3)
    mSleep(50)
    local result4 = multiColor(list4)
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
        result = multiColor(list)
      elseif (n == 2) then
        local list = {
          { 691, 531, 0x0096c5 },
          { 952, 575, 0x52a6ef },
        }
        result = multiColor(list)
      elseif (n == 3) then
        local list = {
          { 691, 751, 0x0096c5 },
          { 952, 794, 0x52a6f7 },
        }
        result = multiColor(list)
      elseif (n == 4) then
        local list = {
          { 691, 976, 0x0096c5 },
          { 952, 1022, 0x52a6f7 },
        }
        result = multiColor(list)
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
        result = not multiColor(list)
      elseif (n == 2) then
        local list = {
          { 691, 531, 0x0096c5 },
          { 952, 575, 0x52a6ef },
        }
        result = not multiColor(list)
      elseif (n == 3) then
        local list = {
          { 691, 751, 0x0096c5 },
          { 952, 794, 0x52a6f7 },
        }
        result = not multiColor(list)
      elseif (n == 4) then
        local list = {
          { 691, 976, 0x0096c5 },
          { 952, 1022, 0x52a6f7 },
        }
        result = not multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
    local result = multiColor(list)
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
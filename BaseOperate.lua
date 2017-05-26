-- 原子操作列表
return function()
  local map = {
    -- 网络检查
    network = {},

    -- 主页
    home = {},

    -- 登录
    login = {},

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

    -- 战役
    campaign = {},

    -- 决战无畏之海
    activity = {},
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
      { 524, 248, 0x0881c5 }, { 1098, 293, 0x0869a4 }, { 1407, 295, 0xd6cec5 }, { 1398, 777, 0xbdb69c },
      { 513, 773, 0xc5baa4 }, { 514, 486, 0xd6cac5 }, { 660, 485, 0xcecabd }, { 708, 484, 0xd6cac5 },
      { 763, 486, 0xd6cabd }, { 788, 484, 0x5a7173 }, { 812, 484, 0xf7f7f7 }, { 842, 488, 0x214952 },
      { 873, 488, 0xbdc6ce }, { 895, 486, 0x19454a }, { 933, 489, 0xbdc6c5 }, { 971, 489, 0xced2d6 },
      { 1015, 488, 0xcecabd }, { 1033, 488, 0x42656b }, { 1071, 485, 0xd6cac5 }, { 1098, 484, 0x4a6973 },
      { 1122, 481, 0x3a5d63 }, { 1153, 484, 0xf7fbf7 }, { 1171, 470, 0x738e94 }, { 1194, 491, 0x6b868c },
      { 1224, 485, 0x42656b }, { 1245, 491, 0xffffff },
      -- 确认
      { 650, 685, 0x42caef }, { 692, 711, 0xffffff }, { 725, 711, 0x42616b }, { 753, 713, 0x42c2ef },
      { 807, 699, 0x42c6ef }, { 842, 681, 0x42ceef }, { 832, 739, 0x0092bd }, { 724, 743, 0x008ebd },
      -- 取消
      { 1078, 692, 0xce493a }, { 1106, 714, 0xc54131 }, { 1106, 747, 0xa41400 }, { 1206, 732, 0x6b868c },
      { 1173, 707, 0xce453a }, { 1265, 684, 0xce493a }, { 1264, 733, 0xa41000 }, { 1246, 709, 0xc54131 },
      { 1209, 710, 0x7b9294 },
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

  -- 等待网络连接不通对话框
  map.network.isNetworkFailureModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 505, 275, 0xcecece }, { 636, 260, 0xffffff }, { 658, 260, 0xffffff }, { 682, 262, 0xffffff },
      { 717, 258, 0xffffff }, { 755, 266, 0xffffff }, { 1035, 271, 0x105d94 }, { 524, 349, 0xcecabd },
      { 1390, 356, 0xd6cabd }, { 1390, 608, 0xd6cabd }, { 522, 671, 0xbdb69c }, { 1398, 772, 0xc5b69c },
      { 668, 731, 0x0096c5 }, { 1094, 730, 0xad1400 }, { 573, 435, 0xffffff }, { 636, 446, 0xffffff },
      { 825, 459, 0xffffff }, { 1053, 435, 0xffffff }, { 1254, 440, 0xffffff }, { 1331, 443, 0xffffff },
      { 836, 513, 0xffffff }, { 923, 509, 0xffffff }, { 1091, 503, 0xffffff }, { 555, 444, 0xcecabd },
      { 1292, 445, 0xcecabd }, { 1117, 516, 0xd6cabd }, { 781, 509, 0xd6cec5 },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击网络不通 确认
  map.network.clickNetworkFailureModalOk = function()
    tap(741, 717, 100)
    return true
  end

  -- 点击网络不通 取消
  map.network.clickNetworkFailureModalCancel = function()
    tap(1174, 718, 100)
    return true
  end

  -- 等待检查您的网络对话框
  map.network.isCheckNetworkModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 517, 246, 0x0081c5 }, { 506, 331, 0xcecabd }, { 513, 781, 0xc5baa4 }, { 1407, 782, 0xc5b69c },
      { 1408, 296, 0xd6cac5 }, { 774, 471, 0xcecabd }, { 796, 470, 0x083942 }, { 810, 473, 0x9cb2b5 },
      { 849, 482, 0x638184 }, { 864, 476, 0x526d73 }, { 623, 261, 0x085994 }, { 652, 261, 0xf7fbf7 },
      { 664, 259, 0xadbebd }, { 682, 260, 0xffffff }, { 709, 262, 0xbdcace }, { 738, 268, 0x7b969c },
      { 758, 265, 0xd6e3de }, { 710, 252, 0xc5cece }, { 678, 252, 0x00558c }, { 705, 255, 0x084152 },
      { 773, 483, 0xd6cec5 }, { 795, 483, 0xeff3f7 }, { 833, 483, 0xb5c2c5 }, { 846, 483, 0x9ca29c },
      { 870, 485, 0x3a6163 }, { 894, 486, 0xd6cac5 }, { 931, 491, 0xf7f7f7 }, { 963, 498, 0x4a6973 },
      { 989, 499, 0x31555a }, { 1047, 483, 0x5a797b },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击检查您的网络对话框 确认
  map.network.clickCheckNetworkModalOk = function()
    tap(951, 716, 100)
    return true
  end

  -- 检测暂停
  map.home.isPause = function()
    return isPause
  end

  -- 检测恢复
  map.home.isNotPause = function()
    return not isPause
  end

  -- 检测新闻窗口
  map.home.isNewsModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 75, 28, 0x007dbd },
      { 1140, 69, 0x085d9c },
      { 1809, 85, 0xd6cec5 },
      { 1872, 78, 0x9c0c08 },
      { 75, 521, 0xd1cabf },
      { 59, 1000, 0xcecabd },
      { 943, 1002, 0xc5b69c },
      { 1863, 957, 0xd6cec5 },
      { 1864, 460, 0xd6cac5 },
      { 956, 103, 0xcecabd },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击新闻 取消
  map.home.clickMewsModalClose = function()
    tap(1876, 50, 100)
    return true
  end

  -- 签到窗口
  map.home.isSignModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 1142, 118, 0x0865a4 },
      { 1567, 120, 0x940c08 },
      { 368, 154, 0xd6cabd },
      { 426, 207, 0xbdb69c },
      { 731, 206, 0xc5b69c },
      { 992, 233, 0xbdb69c },
      { 1500, 211, 0xbdb69c },
      { 621, 512, 0xc5b69c },
      { 1492, 506, 0xc5b29c },
      { 515, 879, 0xd6cec5 },
      { 1407, 857, 0xc5bab5 },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  map.home.isSignModalHasReward = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 832, 887, 0xb54d00 },
      { 943, 879, 0xffffff },
      { 978, 878, 0xffffff },
      { 1045, 876, 0xb54d00 },
      { 883, 894, 0xb54900 },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击领取签到奖励
  map.home.clickSignModalGetReward = function()
    tap(953, 872, 100)
    return true
  end

  -- 签到确认窗口
  map.home.isSignConfirmModal = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 452, 274, 0x0086c5 },
      { 1095, 322, 0x0875b5 },
      { 1480, 326, 0xd6cabd },
      { 445, 360, 0xd6cabd },
      { 480, 682, 0xc5b69c },
      { 1410, 718, 0xc5b6a4 },
      { 875, 722, 0x009ac5 },
      { 1043, 713, 0x42c2ef },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击签到确认窗口关闭
  map.home.clickSignConfirmModalGetReward = function()
    tap(961, 716, 100)
    return true
  end

  -- 点击领取签到关闭
  map.home.clickSignModalClose = function()
    tap(1567, 98, 100)
    return true
  end

  -- 启动游戏
  map.login.startApp = function()
    if (isFrontApp("com.huanmeng.zhanjian2") ~= 1) then
      runApp("com.huanmeng.zhanjian2")
    end
  end

  -- 重启游戏
  map.login.restartApp = function()
    closeApp("com.huanmeng.zhanjian2")
    return runApp("com.huanmeng.zhanjian2")
  end

  -- 游戏正在运行
  map.login.isAppRunning = function()
    if (isFrontApp("com.huanmeng.zhanjian2") == 1) then
      return true
    end
    return false
  end

  -- 游戏不在运行
  map.login.isAppNotRun = function()
    if (isFrontApp("com.huanmeng.zhanjian2") == 1) then
      return false
    end
    return true
  end

  -- 是否在选择服务器界面
  map.login.isSelectServerPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 443, 759, 0x0896d6 },
      { 480, 829, 0xc5cac5 },
      { 538, 842, 0x109ad6 },
      { 833, 847, 0x1075b5 },
      { 865, 758, 0x0871ad },
      { 1130, 846, 0x1071b5 },
      { 1232, 758, 0x086dad },
      { 1387, 761, 0x086db5 },
      { 1470, 847, 0x0879bd },
      { 1442, 781, 0xc5cac5 },
      { 668, 907, 0xadeff7 },
      { 757, 910, 0xbdf3f7 },
      { 843, 907, 0xcef7ff },
      { 1104, 912, 0x8cd7de },
      { 1158, 906, 0x9cd7e6 },
      { 1248, 906, 0x9cd7de },
      { 1172, 970, 0x8cbed6 },
      { 1129, 1022, 0x6b96c5 },
      { 800, 1023, 0xa4c6e6 },
      { 769, 1001, 0xadceef },
      { 831, 942, 0xfffbff },
      { 869, 966, 0xf7fbff },
      { 925, 957, 0xffffff },
      { 1017, 973, 0xffffff },
      { 1076, 953, 0xf7fbff },
      { 991, 946, 0xfffbff },
      { 1093, 990, 0xf7fbff },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击登录
  map.login.clickLoginBtn = function()
    tap(953, 965, 100)
    return true
  end

  --  是否在出征界面
  map.battle.isBattlePage = function()
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
    local result = multiColor(list)
    local result2 = multiColor(list2)
    if (not __keepScreenState) then keepScreen(false) end
    return (result and (not result2))
  end

  -- 点击回港
  map.battle.clickBackToHomeBtn = function()
    tap(98, 1016, 100)
    return true
  end

  -- 出征页面

  --  是否在出征的出征界面
  map.battle.isBattleBattlePage = function()
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
    local result = multiColor(list)
    local result2 = multiColor(list2)
    if (not __keepScreenState) then keepScreen(false) end
    return (result and result2)
  end

  -- 点击出征
  map.battle.clickBattleBtn = function()
    tap(101, 110, 100)
    return true
  end

  -- 移动到m-n章节
  map.battle.moveToChapter = function(chapter)
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
  map.battle.clickReadyBattleBtn = function()
    tap(1061, 523, 100)
  end

  -- 等待出征准备界面
  map.battle.isReadyBattlePage = function()
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
  map.battle.selectFleet = function(fleet)
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
  map.battle.isReadyBattlePageShipStatusAllRight = function()
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
  map.battle.isReadyBattlePageShipHPSafe = function(checkLevel)
    checkLevel = checkLevel or 1
    -- checklevel = 不满血 or 中破 or 大破 or 不使用
    -- { 3, 2, 1, 0 }
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end

    local result = true

    local list = {
      { 634, 631, 0x085994 },
      { 829, 631, 0x105d94 },
      { 1029, 631, 0x105d94 },
      { 1229, 631, 0x105d94 },
      { 1419, 631, 0x105d94 },
      { 1619, 631, 0x105d94 },
    }

    -- 满血
    local list23 = {
      { 640, 600, 0x9cfb8c },
      { 837, 600, 0x9cfb8c },
      { 1034, 600, 0x9cfb8c },
      { 1231, 600, 0x9cfb8c },
      { 1428, 600, 0x9cfb8c },
      { 1625, 600, 0x9cfb8c },
    }
    -- 黄血 中破
    local list22 = {
      { 1459, 599, 0xefdb21 },
      { 1262, 599, 0xe6d719 },
      { 1065, 599, 0xefdb21 },
      { 868, 599, 0xe6d719 },
      { 671, 599, 0xefdb21 },
      { 474, 599, 0xe6d719 },
    }
    -- 红血 大破
    local list21 = {
      { 474, 600, 0xef1010 },
      { 671, 600, 0xe61010 },
      { 868, 600, 0xef1010 },
      { 1065, 600, 0xe61010 },
      { 1262, 600, 0xef1010 },
      { 1459, 600, 0xe61010 },
    }
    if (checkLevel == 3) then
      -- 有不满血
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 80)
        local theList23 = multiColor({ list23[i] }, 80)
        if (theList and (not theList23)) then
          result = false
          break
        end
      end
    elseif (checkLevel == 2) then
      -- 有中破或大破
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 80)
        local theList22 = multiColor({ list22[i] }, 80)
        local theList21 = multiColor({ list21[i] }, 80)
        if (theList and (theList22 or theList21)) then
          result = false
          break
        end
      end
    elseif (checkLevel == 1) then
      -- 有大破
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 80)
        local theList21 = multiColor({ list21[i] }, 80)
        if (theList and theList21) then
          result = false
          break
        end
      end
    end

    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 不满血，返回出征
  map.battle.clickReadyBattlePageBackBtn = function()
    tap(1814, 974, 100)
  end

  -- 点击快速补给
  map.battle.clickReadyBattlePageQuickSupplyBtn = function()
    tap(1812, 109, 100)
  end

  -- 等待快速补给界面
  map.battle.isQuickSupplyModal = function()
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
  map.battle.clickReadyBattlePageQuickSupplyModalOkBtn = function()
    tap(1269, 785, 100)
  end

  -- 点击快速修理
  map.battle.clickQuickRepairBtn = function()
    tap(1813, 252, 100)
  end

  -- 等待快速修理界面
  map.battle.isQuickRepairModal = function()
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
  map.battle.clickQuickRepairModalOkBtn = function()
    tap(1269, 785, 100)
  end

  -- 检测快速修理界面HP是否安全，有几艘船需要快速修理
  map.battle.isQuickRepairModalShipNeedRepair = function(checkLevel)
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
      { 443, 621, 0x9cff8c },
      { 640, 621, 0x94fb84 },
      { 837, 621, 0x9cff8c },
      { 1034, 621, 0x94fb84 },
      { 1231, 621, 0x9cff8c },
      { 1428, 621, 0x94fb84 },
    }
    -- 中破
    local list22 = {
      { 277, 621, 0xefe310 },
      { 474, 621, 0xe6df08 },
      { 671, 621, 0xefe310 },
      { 868, 621, 0xe6df08 },
      { 1065, 621, 0xefe310 },
      { 1262, 621, 0xe6df08 },
    }
    -- 大破
    local list21 = {
      { 277, 621, 0xef0c10 },
      { 474, 621, 0xe60808 },
      { 671, 621, 0xef0c10 },
      { 868, 621, 0xe60c08 },
      { 1065, 621, 0xef0c10 },
      { 1262, 621, 0xe60808 },
    }
    local result = {}
    if (checkLevel == 3) then
      -- 不满血
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 80)
        local theList23 = multiColor({ list23[i] }, 80)
        if (theList and (not theList23)) then
          table.insert(result, i)
        end
      end
    elseif (checkLevel == 2) then
      -- 有中破或大破
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 80)
        local theList22 = multiColor({ list22[i] }, 80)
        local theList21 = multiColor({ list21[i] }, 80)
        if (theList and (theList22 or theList21)) then
          table.insert(result, i)
        end
      end
    elseif (checkLevel == 1) then
      -- 有大破
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 80)
        local theList21 = multiColor({ list21[i] }, 80)
        if (theList and theList21) then
          table.insert(result, i)
        end
      end
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击快速修理单个船
  map.battle.clickQuickRepairModalSingleShip = function(shipList)
    if (type(shipList) ~= 'table') then
      shipList = { shipList }
    end
    for key, value in ipairs(shipList) do
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
  map.battle.clickQuickSupplyModalCloseBtn = function()
    tap(1473, 195, 100)
  end

  -- 点击快速修理关闭
  map.battle.clickQuickRepairModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

  -- 检测舰队可以出征
  map.battle.isFleetsCanBattle = function()
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
  map.battle.clickBattleStartBtn = function()
    tap(956, 987, 100)
  end

  -- 等待额外获得资源面板
  map.battle.isExtraReceiveModal = function()
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
  map.battle.clickExtraReceiveModalOk = function()
    tap(957, 715, 100)
  end

  -- 等待快开始战斗界面
  map.battle.isBattleStartPage = function()
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

  -- 快开始页面能否迂回
  map.battle.isBattleStartPageCanRoundabout = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 1525, 897, 0x4acef7 },
      { 1753, 892, 0x42cef7 },
      { 1749, 946, 0x008ebd },
      { 1525, 944, 0x0092bd },
      { 1613, 916, 0xffffff },
      { 1677, 920, 0xffffff },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end


  -- 点击战术迂回
  map.battle.clickBattleStartModalRoundaboutBtn = function()
    tap(1643, 920, 100)
  end

  -- 检测前两船是不是航母
  map.battle.isFirstSecondShipIsCV = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    -- 第一位是航母
    local list1 = {
      { 227, 333, 0xf7f7f7 }, { 252, 331, 0xdee3de }, { 287, 329, 0x84497b }, { 309, 328, 0x8c4984 },
      { 351, 323, 0x6b5d63 }, { 379, 321, 0xa4868c }, { 457, 326, 0x948e94 }, { 520, 348, 0x4a3d42 },
      { 448, 392, 0x943d6b }, { 348, 393, 0x63595a }, { 206, 398, 0x635d63 }, { 223, 394, 0xcecece },
      { 261, 390, 0xe6e7e6 }, { 268, 388, 0x08819c }, { 249, 362, 0x639aad }, { 310, 392, 0x8c4d84 },
      { 357, 396, 0x736973 }, { 400, 393, 0xd68694 }, { 455, 410, 0x734563 }, { 516, 413, 0xdecace },
    }
    -- 第二位是航母
    local list2 = {}
    for key, value in ipairs(list1) do
      table.insert(list2, { value[1] + 390, value[2], value[3] })
    end

    local list = {}
    for key, value in ipairs(list1) do table.insert(list, value) end
    for key, value in ipairs(list1) do table.insert(list, value) end

    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击开始战斗
  map.battle.clickBattleStartModalStartBtn = function()
    tap(1327, 919, 100)
  end

  -- 战斗中自动点击，加速战斗
  map.battle.autoClickWhenBattle = function()
    tap(668, 842, 100)
    return false
  end

  -- 等待阵型界面
  map.battle.isFormationPage = function()
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
  map.battle.clickFormationPageStartBtn = function(formation)
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
  map.battle.isPursueModal = function()
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
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击追击
  map.battle.clickPursueModalOk = function()
    tap(726, 746, 100)
  end

  -- 点击放弃
  map.battle.clickPursuePageCancel = function()
    tap(1178, 754, 100)
  end

  -- 等待胜利界面
  map.battle.isVictoryPage = function()
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
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 胜利界面检测船是否受损
  map.battle.isVictoryPageShipDamaged = function()
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
      if ((multiColor({ list[i] })) and (not multiColor({ list2[i] }))) then
        result = true
        break
      end
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 胜利界面检测船HP是否安全
  map.battle.isVictoryPageShipHPSafe = function(checkLevel)
    checkLevel = checkLevel or 1
    -- '有中破,有大破'
    -- checkLevel == 2 or 1
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
    -- 中破
    local list22 = {
      { { 474, 289, 0xf7ca6b }, { 481, 283, 0xe6be63 }, { 471, 329, 0xcea242 }, },
      { { 474, 430, 0xf7ca6b }, { 481, 424, 0xe6be63 }, { 471, 470, 0xcea242 }, },
      { { 474, 570, 0xf7ca6b }, { 481, 564, 0xe6be63 }, { 471, 610, 0xcea242 }, },
      { { 474, 711, 0xf7ca6b }, { 481, 705, 0xe6be63 }, { 471, 751, 0xcea242 }, },
      { { 474, 852, 0xf7ca6b }, { 481, 846, 0xe6be63 }, { 471, 892, 0xcea242 }, },
      { { 474, 992, 0xf7ca6b }, { 481, 986, 0xe6be63 }, { 471, 1032, 0xcea242 }, },
    }
    -- 大破
    local list21 = {
      { { 474, 289, 0xffb6b5 }, { 481, 283, 0xffbabd }, { 471, 329, 0xff7d7b }, },
      { { 474, 430, 0xffb6b5 }, { 481, 424, 0xffbabd }, { 471, 470, 0xff7d7b }, },
      { { 474, 570, 0xffb6b5 }, { 481, 564, 0xffbabd }, { 471, 610, 0xff7d7b }, },
      { { 474, 711, 0xffb6b5 }, { 481, 705, 0xffbabd }, { 471, 751, 0xff7d7b }, },
      { { 474, 852, 0xffb6b5 }, { 481, 846, 0xffbabd }, { 471, 892, 0xff7d7b }, },
      { { 474, 992, 0xffb6b5 }, { 481, 986, 0xffbabd }, { 471, 1032, 0xff7d7b }, },
    }
    local result = true
    if (checkLevel == 2) then
      -- 有中破或者大破
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 85)
        local theList22 = multiColor(list22[i], 85)
        local theList21 = multiColor(list21[i], 85)
        if (theList and (theList22 or theList21)) then
          result = false
          break
        end
      end

    elseif (checkLevel == 1) then
      -- 有大破
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 85)
        local theList21 = multiColor(list21[i], 85)
        if (theList and theList21) then
          result = false
          break
        end
      end
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击胜利继续
  map.battle.clickVictoryPageContinueBtn = function()
    tap(1650, 1020, 100)
  end

  -- 等待胜利继续面板
  map.battle.isVictoryPage2 = function()
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
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end


  -- 点击胜利继续2
  map.battle.clickVictoryPageContinueBtn2 = function()
    tap(1730, 993, 100)
  end

  -- 等待大破警告
  map.battle.isShipSevereDamageModal = function()
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
  map.battle.clickShipSevereDamageModalBack = function()
    tap(1182, 753, 100)
  end

  -- 等待无法前进警告框
  map.battle.isShipCantGoOnModal = function()
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
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 受损过重警告框点击回港
  map.battle.clickShipCantGoOnModalBackBtn = function()
    tap(1449, 825, 100)
  end

  -- 等待新船
  map.battle.isNewShipPage = function()
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
  map.battle.clickNewShip = function()
    tap(972, 399, 100)
  end

  -- 等待新船锁定对话框
  map.battle.isNewShipPageLockModal = function()
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
  map.battle.clickNewShipPageLockModalOkBtn = function()
    tap(741, 713, 100)
  end

  -- 等待前进对话框
  map.battle.isNextLevelStepModal = function()
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
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 等待前进点击前进
  map.battle.clickLevelStepModalContinueBtn = function()
    tap(727, 751, 100)
  end

  -- 等待前进点击回港
  map.battle.clickLevelStepModalBackBtn = function()
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

  -- 等待新船
  map.mission.isNewShipPage = function()
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
  map.mission.clickNewShip = function()
    tap(972, 399, 100)
  end

  -- 等待新船锁定对话框
  map.mission.isNewShipPageLockModal = function()
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
  map.mission.clickNewShipPageLockModalOkBtn = function()
    tap(741, 713, 100)
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
  map.expedition.isBattlePage = function()
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
      { 110, 148, 0x008ebd },
      { 111, 290, 0x008ebd },
      { 107, 429, 0xb54d08 },
      { 111, 572, 0x008ebd },
    }
    local result = multiColor(list)
    local result2 = multiColor(list2)
    if (not __keepScreenState) then keepScreen(false) end
    return (result and (not result2))
  end

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
      { 278, 1007, 0x635d52 },
      { 224, 613, 0xc5cac5 },
      { 92, 969, 0xa47d42 },
      { 169, 1014, 0xffffff },
      { 195, 1033, 0xb58a5a },
    }
    -- 四个按钮的颜色
    local list2 = {
      { 110, 148, 0x008ebd },
      { 111, 290, 0x008ebd },
      { 107, 429, 0xb54d08 },
      { 111, 572, 0x008ebd },
    }
    local result = multiColor(list)
    local result2 = multiColor(list2)
    if (not __keepScreenState) then keepScreen(false) end
    return (result and result2)
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

  -- 等待出征准备界面
  map.expedition.isReadyBattlePage = map.battle.isReadyBattlePage

  -- 选择舰队
  map.expedition.clickSelectFleet = map.battle.selectFleet

  -- 检测所有状态正常
  map.expedition.isReadyBattlePageShipStatusAllRight = map.battle.isReadyBattlePageShipStatusAllRight

  -- 检测hp是否安全
  map.expedition.isReadyBattlePageShipHPSafe = map.battle.isReadyBattlePageShipHPSafe

  -- 点击快速补给
  map.expedition.clickReadyBattlePageQuickSupplyBtn = map.battle.clickReadyBattlePageQuickSupplyBtn

  -- 检测快速补给界面
  map.expedition.isQuickSupplyModal = map.battle.isQuickSupplyModal

  -- 点击快速补给确定
  map.expedition.clickReadyBattlePageQuickSupplyModalOkBtn = map.battle.clickReadyBattlePageQuickSupplyModalOkBtn

  -- 点击快速补给关闭
  map.expedition.clickQuickSupplyModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

  -- 点击快速维修
  map.expedition.clickQuickRepairBtn = map.battle.clickQuickRepairBtn

  -- 等待快速维修界面
  map.expedition.isQuickRepairModal = map.battle.isQuickRepairModal

  -- 点击快速维修确定
  map.expedition.clickQuickRepairModalOkBtn = map.battle.clickQuickRepairModalOkBtn

  -- 点击快速修理关闭
  map.expedition.clickQuickRepairModalCloseBtn = map.battle.clickQuickRepairModalCloseBtn

  -- 检测快速修理界面HP是否安全，有几艘船需要快速修理
  map.expedition.isQuickRepairModalShipNeedRepair = map.battle.isQuickRepairModalShipNeedRepair

  -- 点击快速修理单个船
  map.expedition.clickQuickRepairModalSingleShip = map.battle.clickQuickRepairModalSingleShip

  -- 检测舰队可以出征
  map.expedition.isFleetsCanBattle = map.battle.isFleetsCanBattle

  -- 点击返回远征界面
  map.expedition.clickBackToExpedition = function()
    tap(1812, 974, 100)
    return true
  end

  -- 点击远征开始
  map.expedition.clickBattleStartBtn = map.battle.clickBattleStartBtn

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
  map.exercise.isBattlePage = function()
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
      { 110, 148, 0x008ebd },
      { 111, 290, 0xad4900 },
      { 107, 429, 0x0092c5 },
      { 111, 572, 0x008ebd },
    }
    local result = multiColor(list)
    local result2 = multiColor(list2)
    if (not __keepScreenState) then keepScreen(false) end
    return (result and (not result2))
  end
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
      { 178, 622, 0x10597b },
      { 278, 1007, 0x635d52 },
      { 224, 613, 0xc5cac5 },
      { 92, 969, 0xa47d42 },
      { 169, 1014, 0xffffff },
      { 195, 1033, 0xb58a5a },
    }
    -- 四个按钮的颜色
    local list2 = {
      { 110, 148, 0x008ebd },
      { 111, 290, 0xad4900 },
      { 107, 429, 0x0092c5 },
      { 111, 572, 0x008ebd },
    }
    local result = multiColor(list)
    local result2 = multiColor(list2)
    if (not __keepScreenState) then keepScreen(false) end
    return (result and result2)
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
      if (multiColor({ item })) then
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
  map.exercise.isReadyBattlePage = map.battle.isReadyBattlePage

  -- 点击选择舰队
  map.exercise.selectFleet = map.battle.selectFleet

  -- 检测所有状态正常
  map.exercise.isReadyBattlePageShipStatusAllRight = map.battle.isReadyBattlePageShipStatusAllRight

  -- 检测hp是否安全
  map.exercise.isReadyBattlePageShipHPSafe = map.battle.isReadyBattlePageShipHPSafe

  -- 不满血，返回出征
  map.exercise.clickReadyBattlePageBackBtn = map.battle.clickReadyBattlePageBackBtn

  -- 点击快速补给
  map.exercise.clickReadyBattlePageQuickSupplyBtn = map.battle.clickReadyBattlePageQuickSupplyBtn

  -- 等待快速补给界面
  map.exercise.isQuickSupplyModal = map.battle.isQuickSupplyModal

  -- 点击快速补给
  map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn = map.battle.clickReadyBattlePageQuickSupplyModalOkBtn

  -- 点击快速修理
  map.exercise.clickQuickRepairBtn = map.battle.clickQuickRepairBtn

  -- 等待快速修理界面
  map.exercise.isQuickRepairModal = map.battle.isQuickRepairModal

  -- 点击快速修理
  map.exercise.clickQuickRepairModalOkBtn = map.battle.clickQuickRepairModalOkBtn

  -- 检测快速修理界面HP是否安全，有几艘船需要快速修理
  map.exercise.isQuickRepairModalShipNeedRepair = map.battle.isQuickRepairModalShipNeedRepair

  -- 点击快速修理单个船
  map.exercise.clickQuickRepairModalSingleShip = map.battle.clickQuickRepairModalSingleShip

  -- 点击快速补给关闭
  map.exercise.clickQuickSupplyModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

  -- 点击快速修理关闭
  map.exercise.clickQuickRepairModalCloseBtn = map.battle.clickQuickRepairModalCloseBtn

  -- 检测舰队可以出征
  map.exercise.isFleetsCanBattle = map.battle.isFleetsCanBattle

  -- 点击出征开始
  map.exercise.clickBattleStartBtn = map.battle.clickBattleStartBtn

  -- 等待额外获得资源面板
  map.exercise.isExtraReceiveModal = map.battle.isExtraReceiveModal

  -- 点击额外获得确定
  map.exercise.clickExtraReceiveModalOk = map.battle.clickExtraReceiveModalOk

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
  map.exercise.isFormationPage = map.battle.isFormationPage

  -- 点击阵型
  map.exercise.clickFormationPageStartBtn = map.battle.clickFormationPageStartBtn

  -- 等待追击页面
  map.exercise.isPursueModal = map.battle.isPursueModal

  -- 点击追击
  map.exercise.clickPursueModalOk = map.battle.clickPursueModalOk

  -- 点击放弃
  map.exercise.clickPursuePageCancel = map.battle.clickPursuePageCancel

  -- 等待胜利界面
  map.exercise.isVictoryPage = map.battle.isVictoryPage

  -- 胜利界面检测船是否受损
  map.exercise.isVictoryPageShipDamaged = map.battle.isVictoryPageShipDamaged

  -- 胜利界面检测船HP是否安全
  map.exercise.isVictoryPageShipHPSafe = map.battle.isVictoryPageShipHPSafe

  -- 点击胜利继续
  map.exercise.clickVictoryPageContinueBtn = map.battle.clickVictoryPageContinueBtn

  -- 等待胜利继续面板
  map.exercise.isVictoryPage2 = map.battle.isVictoryPage2

  -- 点击胜利继续2
  map.exercise.clickVictoryPageContinueBtn2 = map.battle.clickVictoryPageContinueBtn2

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

  -- 战役流程

  -- 是否在出征界面
  map.campaign.isBattlePage = function()
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
      { 110, 148, 0x008ebd },
      { 111, 290, 0x008ebd },
      { 107, 429, 0x0092c5 },
      { 111, 572, 0xad4900 },
    }
    local result = multiColor(list)
    local result2 = multiColor(list2)
    if (not __keepScreenState) then keepScreen(false) end
    return (result and (not result2))
  end

  -- 点击战役按钮
  map.campaign.clickCampaignBtn = function()
    tap(102, 530, 100)
    return true
  end

  -- 是否在战役界面
  map.campaign.isCampaignPage = function()
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
      { 110, 148, 0x008ebd },
      { 111, 290, 0x008ebd },
      { 107, 429, 0x0092c5 },
      { 111, 572, 0xad4900 },
    }
    local result = multiColor(list)
    local result2 = multiColor(list2)
    if (not __keepScreenState) then keepScreen(false) end
    return (result and result2)
  end

  -- 移动到战役
  map.campaign.moveToCampaignMission = function(m)
    m = tonumber(m) or 1
    -- 先移动到第1章
    for i = 1, 5 do
      tap(358, 962, 100)
      mSleep(200)
    end
    -- 再移到第m章
    for i = 2, m do
      tap(1836, 960, 100)
      mSleep(200)
    end
    return true
  end

  -- 点击准备开始战斗
  map.campaign.clickCampainReadyBtn = function(difficulty)
    if (difficulty == 'default') then
      tap(651, 317, 100)
    else
      tap(1504, 309, 100)
    end
    return true
  end

  -- 等待出征准备界面
  map.campaign.isReadyBattlePage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 660, 197, 0xcecabd },
      { 1636, 197, 0xcecabd },
      { 1627, 336, 0xcecabd },
      { 1799, 423, 0xd6aa31 },
      { 1803, 680, 0xcea229 },
      { 454, 1040, 0xd6cabd },
      { 1753, 1041, 0xd6cec5 },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 检测所有状态正常
  map.campaign.isReadyBattlePageShipStatusAllRight = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local result = true
    local list = {
      -- 弹药不足
      {
        { 347, 218, 0xb53129 },
        { 383, 274, 0x9c2021 },
        { 349, 325, 0x941419 },
      }, {
        { 348, 357, 0xad2d29 },
        { 383, 414, 0x941819 },
        { 349, 464, 0x8c1410 },
      }, {
        { 347, 495, 0xb53131 },
        { 383, 552, 0x942021 },
        { 349, 603, 0x8c1419 },
      }, {
        { 347, 634, 0xad3131 },
        { 383, 691, 0x941c21 },
        { 349, 742, 0x8c1410 },
      }, {
        { 347, 773, 0xb53131 },
        { 383, 830, 0x941c21 },
        { 349, 880, 0x8c1410 },
      }, {
        { 347, 912, 0xad3129 },
        { 383, 969, 0x8c1419 },
        { 349, 1019, 0x941810 },
      },
      -- 远征中
      {
        { 348, 229, 0xc5ba21 },
        { 382, 262, 0xb58e08 },
        { 364, 320, 0xb59210 },
      }, {
        { 348, 368, 0xcebe31 },
        { 382, 410, 0xbd9a19 },
        { 364, 459, 0xb59210 },
      }, {
        { 348, 507, 0xcebe21 },
        { 381, 549, 0xb59210 },
        { 364, 598, 0xb58e08 },
      }, {
        { 348, 646, 0xcebe29 },
        { 382, 688, 0xbd9a10 },
        { 364, 737, 0xb58e08 },
      }, {
        { 348, 784, 0xceba29 },
        { 382, 826, 0xbd9a19 },
        { 364, 875, 0xb58e08 },
      }, {
        { 348, 923, 0xc5ba21 },
        { 382, 966, 0xb59208 },
        { 364, 1014, 0xb58a08 },
      },
    }
    for key, value in ipairs(list) do
      if (multiColor(value, 80)) then
        result = false
        break
      end
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 检测hp是否安全
  map.campaign.isReadyBattlePageShipHPSafe = function(checkLevel)
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local result = true
    -- 槽位上没有船
    local list = {
      { 118, 274, 0x94c242 },
      { 118, 413, 0x8cbe42 },
      { 118, 551, 0x8cbe42 },
      { 118, 690, 0x94c242 },
      { 118, 829, 0x8cbe42 },
      { 118, 967, 0x8cbe42 },
    }
    -- 满血
    local list23 = {
      { 469, 214, 0x9cfb8c },
      { 469, 353, 0x9cff8c },
      { 469, 491, 0x9cff8c },
      { 469, 630, 0x9cfb8c },
      { 469, 769, 0x9cff8c },
      { 469, 908, 0x94fb84 },
    }
    -- 有中破
    local list22 = {
      { 469, 332, 0xefe310 },
      { 469, 471, 0xefe308 },
      { 469, 609, 0xefe308 },
      { 469, 748, 0xefe310 },
      { 469, 887, 0xefe308 },
      { 469, 1026, 0xefe310 },
    }
    -- 有大破
    local list21 = {
      { 469, 332, 0xef0c10 },
      { 469, 471, 0xef0c08 },
      { 469, 609, 0xef0c08 },
      { 469, 748, 0xef0c10 },
      { 469, 887, 0xef0c08 },
      { 469, 1026, 0xef0c10 },
    }
    if (checkLevel == 3) then
      -- 有不满血
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 80)
        local theList23 = multiColor({ list23[i] }, 80)
        if ((not theList) and (not theList23)) then
          result = false
          break
        end
      end
    elseif (checkLevel == 2) then
      -- 有中破或者大破
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 80)
        local theList22 = multiColor({ list22[i] }, 80)
        local theList21 = multiColor({ list21[i] }, 80)
        if ((not theList) and (theList22 or theList21)) then
          result = false
          break
        end
      end

    elseif (checkLevel == 1) then
      -- 有大破
      for i = 1, #list do
        local theList = multiColor({ list[i] }, 80)
        local theList21 = multiColor({ list21[i] }, 80)
        if ((not theList) and theList21) then
          result = false
          break
        end
      end
    end
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 不满血，返回出征
  map.campaign.clickReadyBattlePageBackBtn = map.battle.clickReadyBattlePageBackBtn

  -- 点击快速补给
  map.campaign.clickReadyBattlePageQuickSupplyBtn = map.battle.clickReadyBattlePageQuickSupplyBtn

  -- 等待快速补给界面
  map.campaign.isQuickSupplyModal = map.battle.isQuickSupplyModal

  -- 点击快速补给
  map.campaign.clickReadyBattlePageQuickSupplyModalOkBtn = map.battle.clickReadyBattlePageQuickSupplyModalOkBtn

  -- 点击快速修理
  map.campaign.clickQuickRepairBtn = map.battle.clickQuickRepairBtn

  -- 等待快速修理界面
  map.campaign.isQuickRepairModal = map.battle.isQuickRepairModal

  -- 点击快速修理
  map.campaign.clickQuickRepairModalOkBtn = map.battle.clickQuickRepairModalOkBtn

  -- 检测快速修理界面HP是否安全，有几艘船需要快速修理
  map.campaign.isQuickRepairModalShipNeedRepair = map.battle.isQuickRepairModalShipNeedRepair

  -- 点击快速修理单个船
  map.campaign.clickQuickRepairModalSingleShip = map.battle.clickQuickRepairModalSingleShip

  -- 点击快速补给关闭
  map.campaign.clickQuickSupplyModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

  -- 点击快速修理关闭
  map.campaign.clickQuickRepairModalCloseBtn = map.battle.clickQuickRepairModalCloseBtn

  -- 检测舰队可以出征
  map.campaign.isFleetsCanBattle = map.battle.isFleetsCanBattle

  -- 点击出征开始
  map.campaign.clickBattleStartBtn = map.battle.clickBattleStartBtn

  -- 等待额外获得资源面板
  map.campaign.isExtraReceiveModal = map.battle.isExtraReceiveModal

  -- 点击额外获得确定
  map.campaign.clickExtraReceiveModalOk = map.battle.clickExtraReceiveModalOk

  -- 等待快开始战斗界面
  map.campaign.isBattleStartPage = function()
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
  map.campaign.clickBattleStartModalStartBtn = function()
    tap(1326, 862, 100)
    return true
  end

  -- 等待阵型界面
  map.campaign.isFormationPage = map.battle.isFormationPage

  -- 点击阵型
  map.campaign.clickFormationPageStartBtn = map.battle.clickFormationPageStartBtn

  -- 等待追击页面
  map.campaign.isPursueModal = map.battle.isPursueModal

  -- 点击追击
  map.campaign.clickPursueModalOk = map.battle.clickPursueModalOk

  -- 点击放弃
  map.campaign.clickPursuePageCancel = map.battle.clickPursuePageCancel

  -- 等待胜利界面
  map.campaign.isVictoryPage = map.battle.isVictoryPage

  -- 胜利界面检测船是否受损
  map.campaign.isVictoryPageShipDamaged = map.battle.isVictoryPageShipDamaged

  -- 胜利界面检测船HP是否安全
  map.campaign.isVictoryPageShipHPSafe = map.battle.isVictoryPageShipHPSafe

  -- 点击胜利继续
  map.campaign.clickVictoryPageContinueBtn = map.battle.clickVictoryPageContinueBtn

  -- 等待胜利继续面板
  map.campaign.isVictoryPage2 = map.battle.isVictoryPage2

  -- 点击胜利继续2
  map.campaign.clickVictoryPageContinueBtn2 = map.battle.clickVictoryPageContinueBtn2

  -- 检测胜利对手详情页面
  map.campaign.isVictoryOpponentDetailPage = function()
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
  map.campaign.clickVictoryOpponentDetailPageClose = function()
    tap(1803, 217, 100)
  end

  -- 返回home
  map.campaign.clickBackToHomeBtn = map.battle.clickBackToHomeBtn
  -- 战役流程

  -- 决战无畏之海
  -- 是否有活动按钮
  map.activity.haveHomeActivityBtn = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 32, 855, 0xd67521 }, { 66, 835, 0x6b3d00 }, { 85, 818, 0xad8152 }, { 97, 799, 0xf7924a },
      { 118, 845, 0x7b5521 }, { 139, 855, 0x944119 }, { 154, 867, 0xd66d19 }, { 108, 909, 0xe6e7e6 },
      { 95, 933, 0x9c4108 }, { 53, 898, 0x3a1c00 }, { 70, 917, 0x5a4129 }, { 68, 911, 0xffffff },
      { 103, 881, 0xfffbef }, { 77, 827, 0xfffbef }, { 91, 804, 0xef8642 }, { 158, 860, 0xd67521 },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击活动按钮
  map.activity.clickHomeActivityBtn = function()
    tap(91, 863, 100)
  end

  -- 检测活动页
  map.activity.isActivityPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 855, 20, 0xffffff }, { 776, 27, 0x08598c }, { 700, 37, 0x08598c }, { 790, 53, 0x00598c },
      { 859, 46, 0xffffff }, { 981, 47, 0x105d7b }, { 996, 33, 0xffffff }, { 1030, 30, 0xdee7ef },
      { 1031, 47, 0x105d94 }, { 1449, 988, 0xeff3ce }, { 1250, 988, 0xe6efb5 }, { 974, 968, 0x9cc2b5 },
      { 911, 1008, 0x73b6c5 }, { 566, 1017, 0x73b2bd }, { 196, 1029, 0x3a8ea4 }, { 57, 1003, 0x428aa4 },
      { 1860, 808, 0x94baad },
      -- 返回按钮
      { 1604, 946, 0x42ceef }, { 1649, 962, 0xffffff }, { 1702, 962, 0x42c6ef }, { 1762, 953, 0xffffff },
      { 1781, 977, 0x08a2ce }, { 1790, 948, 0x42caef }, { 1784, 1015, 0x008abd }, { 1709, 1020, 0x008abd },
      { 1618, 1013, 0x008abd },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击关卡
  map.activity.clickChapter = function(n)
    if (n == 1) then
      tap(744, 739, 100)
    elseif (n == 2) then
      tap(1455, 157, 100)
    elseif (n == 3) then
      tap(1159, 192, 100)
    elseif (n == 3.5) then
      tap(1650, 371, 100)
    elseif (n == 4) then
      tap(364, 584, 100)
    end
  end

  -- 检测关卡介绍页
  map.activity.isActivityInfoPage = function()
    local __keepScreenState = keepScreenState
    if (not __keepScreenState) then keepScreen(true) end
    local list = {
      { 143, 123, 0x0875bd }, { 165, 156, 0x0892ce }, { 881, 157, 0x0865a4 }, { 882, 119, 0x005994 },
      { 956, 157, 0xcecabd }, { 1320, 164, 0xd6cac5 }, { 1725, 160, 0xd6cabd }, { 1771, 481, 0xd6cec5 },
      { 1775, 645, 0xd6cec5 }, { 1787, 880, 0xcecabd }, { 1561, 898, 0xcecabd }, { 1327, 894, 0xc5b69c },
      { 101, 543, 0xd6cec5 }, { 1405, 647, 0xd6cec5 }, { 1414, 521, 0xcecabd },
      -- 出征按钮
      { 1476, 771, 0xef8a3a }, { 1493, 782, 0xa45d21 }, { 1517, 790, 0xf7fbff }, { 1534, 806, 0x522d10 },
      { 1547, 812, 0xefebe6 }, { 1553, 812, 0xfffbff }, { 1576, 811, 0xf7fbff }, { 1613, 771, 0xef8a42 },
      { 1705, 804, 0xd67119 }, { 1702, 833, 0xad4900 },
    }
    local result = multiColor(list)
    if (not __keepScreenState) then keepScreen(false) end
    return result
  end

  -- 点击出征准备按钮
  map.activity.clickActivityReadyBattleBtn = function()
    tap(1590, 802, 100)
  end

  -- 等待出征准备界面
  map.activity.isReadyBattlePage = map.battle.isReadyBattlePage

  -- 点击选择舰队
  map.activity.selectFleet = map.battle.selectFleet

  -- 检测所有状态正常
  map.activity.isReadyBattlePageShipStatusAllRight = map.battle.isReadyBattlePageShipStatusAllRight

  -- 点击快速补给
  map.activity.clickReadyBattlePageQuickSupplyBtn = map.battle.clickReadyBattlePageQuickSupplyBtn

  -- 检测hp是否安全
  map.activity.isReadyBattlePageShipHPSafe = map.battle.isReadyBattlePageShipHPSafe

  -- 不满血，返回出征
  map.activity.clickReadyBattlePageBackBtn = map.battle.clickReadyBattlePageBackBtn

  -- 等待快速补给界面
  map.activity.isQuickSupplyModal = map.battle.isQuickSupplyModal

  -- 点击快速补给
  map.activity.clickReadyBattlePageQuickSupplyModalOkBtn = map.battle.clickReadyBattlePageQuickSupplyModalOkBtn

  -- 点击快速修理
  map.activity.clickQuickRepairBtn = map.battle.clickQuickRepairBtn

  -- 等待快速修理界面
  map.activity.isQuickRepairModal = map.battle.isQuickRepairModal

  -- 点击快速修理
  map.activity.clickQuickRepairModalOkBtn = map.battle.clickQuickRepairModalOkBtn

  -- 检测快速修理界面HP是否安全，有几艘船需要快速修理
  map.activity.isQuickRepairModalShipNeedRepair = map.battle.isQuickRepairModalShipNeedRepair

  -- 点击快速修理单个船
  map.activity.clickQuickRepairModalSingleShip = map.battle.clickQuickRepairModalSingleShip

  -- 点击快速补给关闭
  map.activity.clickQuickSupplyModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

  -- 点击快速修理关闭
  map.activity.clickQuickRepairModalCloseBtn = map.battle.clickQuickRepairModalCloseBtn

  -- 检测舰队可以出征
  map.activity.isFleetsCanBattle = map.battle.isFleetsCanBattle

  -- 点击出征开始
  map.activity.clickBattleStartBtn = map.battle.clickBattleStartBtn

  -- 等待额外获得资源面板
  map.activity.isExtraReceiveModal = map.battle.isExtraReceiveModal

  -- 点击额外获得确定
  map.activity.clickExtraReceiveModalOk = map.battle.clickExtraReceiveModalOk

  -- 等待快开始战斗界面
  map.activity.isBattleStartPage = map.battle.isBattleStartPage

  -- 快开始页面能否迂回
  map.activity.isBattleStartPageCanRoundabout = map.battle.isBattleStartPageCanRoundabout

  -- 点击战术迂回
  map.activity.clickBattleStartModalRoundaboutBtn = map.battle.clickBattleStartModalRoundaboutBtn

  -- 点击开始战斗
  map.activity.clickBattleStartModalStartBtn = map.battle.clickBattleStartModalStartBtn

  -- 等待阵型界面
  map.activity.isFormationPage = map.battle.isFormationPage

  -- 点击阵型
  map.activity.clickFormationPageStartBtn = map.battle.clickFormationPageStartBtn

  -- 等待追击页面
  map.activity.isPursueModal = map.battle.isPursueModal

  -- 点击追击
  map.activity.clickPursueModalOk = map.battle.clickPursueModalOk

  -- 点击放弃
  map.activity.clickPursuePageCancel = map.battle.clickPursuePageCancel

  -- 等待胜利界面
  map.activity.isVictoryPage = map.battle.isVictoryPage

  -- 胜利界面检测船是否受损
  map.activity.isVictoryPageShipDamaged = map.battle.isVictoryPageShipDamaged

  -- 胜利界面检测船HP是否安全
  map.activity.isVictoryPageShipHPSafe = map.battle.isVictoryPageShipHPSafe

  -- 点击胜利继续
  map.activity.clickVictoryPageContinueBtn = map.battle.clickVictoryPageContinueBtn

  -- 等待胜利继续面板
  map.activity.isVictoryPage2 = map.battle.isVictoryPage2

  -- 点击胜利继续2
  map.activity.clickVictoryPageContinueBtn2 = map.battle.clickVictoryPageContinueBtn2

  -- 等待大破警告
  map.activity.isShipSevereDamageModal = map.battle.isShipSevereDamageModal

  -- 大破警告框点击回港
  map.activity.clickShipSevereDamageModalBack = map.battle.clickShipSevereDamageModalBack

  -- 等待无法前进警告框
  map.activity.isShipCantGoOnModal = map.battle.isShipCantGoOnModal

  -- 受损过重警告框点击回港
  map.activity.clickShipCantGoOnModalBackBtn = map.battle.clickShipCantGoOnModalBackBtn

  -- 等待新船
  map.activity.isNewShipPage = map.battle.isNewShipPage

  -- 点击新船
  map.activity.clickNewShip = map.battle.clickNewShip

  -- 等待新船锁定对话框
  map.activity.isNewShipPageLockModal = map.battle.isNewShipPageLockModal

  -- 船锁定对话框点击确认
  map.activity.clickNewShipPageLockModalOkBtn = map.battle.clickNewShipPageLockModalOkBtn

  -- 等待前进对话框
  map.activity.isNextLevelStepModal = map.battle.isNextLevelStepModal

  -- 等待前进点击前进
  map.activity.clickLevelStepModalContinueBtn = map.battle.clickLevelStepModalContinueBtn

  -- 等待前进点击回港
  map.activity.clickLevelStepModalBackBtn = map.battle.clickLevelStepModalBackBtn

  -- 返回活动
  map.activity.clickActivityInfoPageBackBtn = function()
    tap(1832, 127, 100)
  end

  -- 返回桌面
  map.activity.clickActivityPageBackBtn = function()
    tap(1694, 974, 100)
  end

  -- 决战无畏之海
  return map
end
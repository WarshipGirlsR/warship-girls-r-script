

do

do
local _ENV = _ENV
package.preload[ "BaseOperate" ] = function( ... ) local arg = _G.arg;
-- åŽŸå­æ“ä½œåˆ—è¡¨

local map = {
  -- ç½‘ç»œæ£€æŸ¥
  network = {},

  -- ä¸»é¡µ
  home = {},

  -- ç™»å½•
  login = {},

  -- å‡ºå¾
  battle = {},

  -- ä»»åŠ¡
  mission = {},

  -- è¿œå¾
  expedition = {},

  -- ä¿®ç†
  repair = {},

  -- æ¼”ä¹ 
  exercise = {},

  -- æˆ˜å½¹
  campaign = {},

  -- å†³æˆ˜æ— ç•ä¹‹æµ·
  activity = {},
}

-- æ£€æµ‹ä¸»é¡µ
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

-- ç­‰å¾…å¼¹å‡ºå‹‹ç« å¯¹è¯æ¡†
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
    -- ç¡®è®¤
    { 650, 685, 0x42caef }, { 692, 711, 0xffffff }, { 725, 711, 0x42616b }, { 753, 713, 0x42c2ef },
    { 807, 699, 0x42c6ef }, { 842, 681, 0x42ceef }, { 832, 739, 0x0092bd }, { 724, 743, 0x008ebd },
    -- å–æ¶ˆ
    { 1078, 692, 0xce493a }, { 1106, 714, 0xc54131 }, { 1106, 747, 0xa41400 }, { 1206, 732, 0x6b868c },
    { 1173, 707, 0xce453a }, { 1265, 684, 0xce493a }, { 1264, 733, 0xa41000 }, { 1246, 709, 0xc54131 },
    { 1209, 710, 0x7b9294 },
  }
  local result = multiColor(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- ç‚¹å‡»å‹‹ç« å–æ¶ˆ
map.home.clickMedalModalCancelBtn = function()
  tap(1169, 720, 100)
end
-- -- å‡ºå¾æµç¨‹
-- æ˜¯å¦åœ¨ä¸»é¡µ


-- ç‚¹å‡»å‡ºå¾
map.home.clickBattleBtn = function()
  tap(1440, 347, 100)
  return true
end

-- ç­‰å¾…ç½‘ç»œè¿žæŽ¥ä¸é€šå¯¹è¯æ¡†
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

-- ç‚¹å‡»ç½‘ç»œä¸é€š ç¡®è®¤
map.network.clickNetworkFailureModalOk = function()
  tap(741, 717, 100)
  return true
end

-- ç‚¹å‡»ç½‘ç»œä¸é€š å–æ¶ˆ
map.network.clickNetworkFailureModalCancel = function()
  tap(1174, 718, 100)
  return true
end

-- ç­‰å¾…æ£€æŸ¥æ‚¨çš„ç½‘ç»œå¯¹è¯æ¡†
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

-- ç‚¹å‡»æ£€æŸ¥æ‚¨çš„ç½‘ç»œå¯¹è¯æ¡† ç¡®è®¤
map.network.clickCheckNetworkModalOk = function()
  tap(951, 716, 100)
  return true
end

-- æ£€æµ‹æš‚åœ
map.home.isPause = function()
  return isPause
end

-- æ£€æµ‹æ¢å¤
map.home.isNotPause = function()
  return not isPause
end

-- æ£€æµ‹æ–°é—»çª—å£
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

-- ç‚¹å‡»æ–°é—» å–æ¶ˆ
map.home.clickMewsModalClose = function()
  tap(1876, 50, 100)
  return true
end

-- ç­¾åˆ°çª—å£
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

-- ç‚¹å‡»é¢†å–ç­¾åˆ°å¥–åŠ±
map.home.clickSignModalGetReward = function()
  tap(953, 872, 100)
  return true
end

-- ç­¾åˆ°ç¡®è®¤çª—å£
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

-- ç‚¹å‡»ç­¾åˆ°ç¡®è®¤çª—å£å…³é—­
map.home.clickSignConfirmModalGetReward = function()
  tap(961, 716, 100)
  return true
end

-- ç‚¹å‡»é¢†å–ç­¾åˆ°å…³é—­
map.home.clickSignModalClose = function()
  tap(1567, 98, 100)
  return true
end

-- å¯åŠ¨æ¸¸æˆ
map.login.startApp = function()
  if (isFrontApp("com.huanmeng.zhanjian2") ~= 1) then
    runApp("com.huanmeng.zhanjian2")
  end
end

-- é‡å¯æ¸¸æˆ
map.login.restartApp = function()
  closeApp("com.huanmeng.zhanjian2")
  return runApp("com.huanmeng.zhanjian2")
end

-- æ¸¸æˆæ­£åœ¨è¿è¡Œ
map.login.isAppRunning = function()
  if (isFrontApp("com.huanmeng.zhanjian2") == 1) then
    return true
  end
  return false
end

-- æ¸¸æˆä¸åœ¨è¿è¡Œ
map.login.isAppNotRun = function()
  if (isFrontApp("com.huanmeng.zhanjian2") == 1) then
    return false
  end
  return true
end

-- æ˜¯å¦åœ¨é€‰æ‹©æœåŠ¡å™¨ç•Œé¢
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

-- ç‚¹å‡»ç™»å½•
map.login.clickLoginBtn = function()
  tap(953, 965, 100)
  return true
end

--  æ˜¯å¦åœ¨å‡ºå¾ç•Œé¢
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²
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

-- ç‚¹å‡»å›žæ¸¯
map.battle.clickBackToHomeBtn = function()
  tap(98, 1016, 100)
  return true
end

-- å‡ºå¾é¡µé¢

--  æ˜¯å¦åœ¨å‡ºå¾çš„å‡ºå¾ç•Œé¢
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²
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

-- ç‚¹å‡»å‡ºå¾
map.battle.clickBattleBtn = function()
  tap(101, 110, 100)
  return true
end

-- ç§»åŠ¨åˆ°m-nç« èŠ‚
map.battle.moveToChapter = function(chapter)
  local chapterArr = strSplit(chapter, "-")
  local m = tonumber(chapterArr[1]) or 1
  local n = tonumber(chapterArr[2]) or 1
  -- å…ˆç§»åˆ°ç¬¬ä¸€ç« 
  for i = 1, 8 do
    tap(360, 958, 100)
    mSleep(200)
  end
  -- å†ç§»åˆ°ç¬¬mç« 
  for i = 2, m do
    tap(1827, 961, 100)
    mSleep(200)
  end
  -- å…ˆç§»åˆ°ç¬¬ä¸€èŠ‚
  for i = 1, 8 do
    tap(256, 493, 100)
    mSleep(200)
  end
  -- å†ç§»åˆ°ç¬¬nç« 
  for i = 2, n do
    tap(1889, 485, 100)
    mSleep(200)
  end
  return true
end

-- ç‚¹å‡»å‡†å¤‡å‡ºå¾
map.battle.clickReadyBattleBtn = function()
  tap(1061, 523, 100)
end

-- ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢
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

-- ç‚¹å‡»é€‰æ‹©èˆ°é˜Ÿ
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

-- æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸
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

-- æ£€æµ‹hpæ˜¯å¦å®‰å…¨
map.battle.isReadyBattlePageShipHPSafe = function(checkLevel)
  checkLevel = checkLevel or 1
  -- checklevel = ä¸æ»¡è¡€ or ä¸­ç ´ or å¤§ç ´ or ä¸ä½¿ç”¨
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

  -- æ»¡è¡€
  local list23 = {
    { 640, 600, 0x9cfb8c },
    { 837, 600, 0x9cfb8c },
    { 1034, 600, 0x9cfb8c },
    { 1231, 600, 0x9cfb8c },
    { 1428, 600, 0x9cfb8c },
    { 1625, 600, 0x9cfb8c },
  }
  -- é»„è¡€ ä¸­ç ´
  local list22 = {
    { 1459, 599, 0xefdb21 },
    { 1262, 599, 0xe6d719 },
    { 1065, 599, 0xefdb21 },
    { 868, 599, 0xe6d719 },
    { 671, 599, 0xefdb21 },
    { 474, 599, 0xe6d719 },
  }
  -- çº¢è¡€ å¤§ç ´
  local list21 = {
    { 474, 600, 0xef1010 },
    { 671, 600, 0xe61010 },
    { 868, 600, 0xef1010 },
    { 1065, 600, 0xe61010 },
    { 1262, 600, 0xef1010 },
    { 1459, 600, 0xe61010 },
  }
  if (checkLevel == 3) then
    -- æœ‰ä¸æ»¡è¡€
    for i = 1, #list do
      local theList = multiColor({ list[i] }, 80)
      local theList23 = multiColor({ list23[i] }, 80)
      if (theList and (not theList23)) then
        result = false
        break
      end
    end
  elseif (checkLevel == 2) then
    -- æœ‰ä¸­ç ´æˆ–å¤§ç ´
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
    -- æœ‰å¤§ç ´
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

-- ä¸æ»¡è¡€ï¼Œè¿”å›žå‡ºå¾
map.battle.clickReadyBattlePageBackBtn = function()
  tap(1814, 974, 100)
end

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™
map.battle.clickReadyBattlePageQuickSupplyBtn = function()
  tap(1812, 109, 100)
end

-- ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢
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

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™
map.battle.clickReadyBattlePageQuickSupplyModalOkBtn = function()
  tap(1269, 785, 100)
end

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†
map.battle.clickQuickRepairBtn = function()
  tap(1813, 252, 100)
end

-- ç­‰å¾…å¿«é€Ÿä¿®ç†ç•Œé¢
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

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†
map.battle.clickQuickRepairModalOkBtn = function()
  tap(1269, 785, 100)
end

-- æ£€æµ‹å¿«é€Ÿä¿®ç†ç•Œé¢HPæ˜¯å¦å®‰å…¨ï¼Œæœ‰å‡ è‰˜èˆ¹éœ€è¦å¿«é€Ÿä¿®ç†
map.battle.isQuickRepairModalShipNeedRepair = function(checkLevel)
  checkLevel = checkLevel or 1
  -- checklevel = ä¸æ»¡è¡€ or ä¸­ç ´ or å¤§ç ´ or ä¸ä½¿ç”¨
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
  -- æ»¡è¡€
  local list23 = {
    { 443, 621, 0x9cff8c },
    { 640, 621, 0x94fb84 },
    { 837, 621, 0x9cff8c },
    { 1034, 621, 0x94fb84 },
    { 1231, 621, 0x9cff8c },
    { 1428, 621, 0x94fb84 },
  }
  -- ä¸­ç ´
  local list22 = {
    { 278, 621, 0xefe310 },
    { 474, 621, 0xe6df08 },
    { 671, 621, 0xefe310 },
    { 868, 621, 0xe6df08 },
    { 1065, 621, 0xefe310 },
    { 1262, 621, 0xe6df08 },
  }
  -- å¤§ç ´
  local list21 = {
    { 280, 621, 0xbd0808 },
    { 474, 621, 0xe60808 },
    { 671, 621, 0xef0c10 },
    { 868, 621, 0xe60c08 },
    { 1065, 621, 0xef0c10 },
    { 1262, 621, 0xe60808 },
  }
  local result = {}
  if (checkLevel == 3) then
    -- ä¸æ»¡è¡€
    for i = 1, #list do
      local theList = multiColor({ list[i] }, 80)
      local theList23 = multiColor({ list23[i] }, 80)
      if (theList and (not theList23)) then
        table.insert(result, i)
      end
    end
  elseif (checkLevel == 2) then
    -- æœ‰ä¸­ç ´æˆ–å¤§ç ´
    for i = 1, #list do
      local theList = multiColor({ list[i] }, 80)
      local theList22 = multiColor({ list22[i] }, 80)
      local theList21 = multiColor({ list21[i] }, 80)
      if (theList and (theList22 or theList21)) then
        table.insert(result, i)
      end
    end
  elseif (checkLevel == 1) then
    -- æœ‰å¤§ç ´
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

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å•ä¸ªèˆ¹
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

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­
map.battle.clickQuickSupplyModalCloseBtn = function()
  tap(1473, 195, 100)
end

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­
map.battle.clickQuickRepairModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

-- æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾
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

-- ç‚¹å‡»å‡ºå¾å¼€å§‹
map.battle.clickBattleStartBtn = function()
  tap(956, 987, 100)
end

-- ç­‰å¾…é¢å¤–èŽ·å¾—èµ„æºé¢æ¿
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

-- ç‚¹å‡»é¢å¤–èŽ·å¾—ç¡®å®š
map.battle.clickExtraReceiveModalOk = function()
  tap(957, 715, 100)
end

-- ç­‰å¾…å¿«å¼€å§‹æˆ˜æ–—ç•Œé¢
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

-- å¿«å¼€å§‹é¡µé¢èƒ½å¦è¿‚å›ž
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


-- ç‚¹å‡»æˆ˜æœ¯è¿‚å›ž
map.battle.clickBattleStartModalRoundaboutBtn = function()
  tap(1643, 920, 100)
end

-- æ£€æµ‹å‰ä¸¤èˆ¹æ˜¯ä¸æ˜¯èˆªæ¯
map.battle.isFirstSecondShipIsCV = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  -- ç¬¬ä¸€ä½æ˜¯èˆªæ¯
  local list1 = {
    { 227, 333, 0xf7f7f7 }, { 252, 331, 0xdee3de }, { 287, 329, 0x84497b }, { 309, 328, 0x8c4984 },
    { 351, 323, 0x6b5d63 }, { 379, 321, 0xa4868c }, { 457, 326, 0x948e94 }, { 520, 348, 0x4a3d42 },
    { 448, 392, 0x943d6b }, { 348, 393, 0x63595a }, { 206, 398, 0x635d63 }, { 223, 394, 0xcecece },
    { 261, 390, 0xe6e7e6 }, { 268, 388, 0x08819c }, { 249, 362, 0x639aad }, { 310, 392, 0x8c4d84 },
    { 357, 396, 0x736973 }, { 400, 393, 0xd68694 }, { 455, 410, 0x734563 }, { 516, 413, 0xdecace },
  }
  -- ç¬¬äºŒä½æ˜¯èˆªæ¯
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

-- ç‚¹å‡»å¼€å§‹æˆ˜æ–—
map.battle.clickBattleStartModalStartBtn = function()
  tap(1327, 919, 100)
end

-- æˆ˜æ–—ä¸­è‡ªåŠ¨ç‚¹å‡»ï¼ŒåŠ é€Ÿæˆ˜æ–—
map.battle.autoClickWhenBattle = function()
  tap(668, 842, 100)
  return false
end

-- ç­‰å¾…é˜µåž‹ç•Œé¢
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

-- ç‚¹å‡»é˜µåž‹
map.battle.clickFormationPageStartBtn = function(formation)
  formation = formation or 0
  if (formation == 1) then
    -- å•çºµ
    tap(1553, 140, 100)
  elseif (formation == 2) then
    -- å¤çºµ
    tap(1685, 344, 100)
  elseif (formation == 3) then
    -- è½®åž‹
    tap(1760, 541, 100)
  elseif (formation == 4) then
    -- æ¢¯å½¢
    tap(1684, 734, 100)
  elseif (formation == 5) then
    -- å•æ¨ª
    tap(1553, 931, 100)
  else
    -- å¤çºµ
    tap(1685, 344, 100)
  end
end

-- ç­‰å¾…è¿½å‡»é¡µé¢
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
    -- è¿½å‡»
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
    -- æ”¾å¼ƒ
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

-- ç‚¹å‡»è¿½å‡»
map.battle.clickPursueModalOk = function()
  tap(726, 746, 100)
end

-- ç‚¹å‡»æ”¾å¼ƒ
map.battle.clickPursuePageCancel = function()
  tap(1178, 754, 100)
end

-- ç­‰å¾…èƒœåˆ©ç•Œé¢
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

-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹æ˜¯å¦å—æŸ
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

-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹HPæ˜¯å¦å®‰å…¨
map.battle.isVictoryPageShipHPSafe = function(checkLevel)
  checkLevel = checkLevel or 1
  -- 'æœ‰ä¸­ç ´,æœ‰å¤§ç ´'
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
  -- ä¸­ç ´
  local list22 = {
    { { 474, 289, 0xf7ca6b }, { 481, 283, 0xe6be63 }, { 471, 329, 0xcea242 }, },
    { { 474, 430, 0xf7ca6b }, { 481, 424, 0xe6be63 }, { 471, 470, 0xcea242 }, },
    { { 474, 570, 0xf7ca6b }, { 481, 564, 0xe6be63 }, { 471, 610, 0xcea242 }, },
    { { 474, 711, 0xf7ca6b }, { 481, 705, 0xe6be63 }, { 471, 751, 0xcea242 }, },
    { { 474, 852, 0xf7ca6b }, { 481, 846, 0xe6be63 }, { 471, 892, 0xcea242 }, },
    { { 474, 992, 0xf7ca6b }, { 481, 986, 0xe6be63 }, { 471, 1032, 0xcea242 }, },
  }
  -- å¤§ç ´
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
    -- æœ‰ä¸­ç ´æˆ–è€…å¤§ç ´
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
    -- æœ‰å¤§ç ´
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

-- ç‚¹å‡»èƒœåˆ©ç»§ç»­
map.battle.clickVictoryPageContinueBtn = function()
  tap(1650, 1020, 100)
end

-- ç­‰å¾…èƒœåˆ©ç»§ç»­é¢æ¿
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


-- ç‚¹å‡»èƒœåˆ©ç»§ç»­2
map.battle.clickVictoryPageContinueBtn2 = function()
  tap(1730, 993, 100)
end

-- ç­‰å¾…å¤§ç ´è­¦å‘Š
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

-- å¤§ç ´è­¦å‘Šæ¡†ç‚¹å‡»å›žæ¸¯
map.battle.clickShipSevereDamageModalBack = function()
  tap(1182, 753, 100)
end

-- ç­‰å¾…æ— æ³•å‰è¿›è­¦å‘Šæ¡†
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
    -- è¿”å›žæ¯æ¸¯æŒ‰é’®
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

-- å—æŸè¿‡é‡è­¦å‘Šæ¡†ç‚¹å‡»å›žæ¸¯
map.battle.clickShipCantGoOnModalBackBtn = function()
  tap(1449, 825, 100)
end

-- ç­‰å¾…æ–°èˆ¹
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

-- ç‚¹å‡»æ–°èˆ¹
map.battle.clickNewShip = function()
  tap(972, 399, 100)
end

-- ç­‰å¾…æ–°èˆ¹é”å®šå¯¹è¯æ¡†
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

-- èˆ¹é”å®šå¯¹è¯æ¡†ç‚¹å‡»ç¡®è®¤
map.battle.clickNewShipPageLockModalOkBtn = function()
  tap(741, 713, 100)
end

-- ç­‰å¾…å‰è¿›å¯¹è¯æ¡†
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
    -- å‰è¿›
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
    -- å›žæ¸¯
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

-- ç­‰å¾…å‰è¿›ç‚¹å‡»å‰è¿›
map.battle.clickLevelStepModalContinueBtn = function()
  tap(727, 751, 100)
end

-- ç­‰å¾…å‰è¿›ç‚¹å‡»å›žæ¸¯
map.battle.clickLevelStepModalBackBtn = function()
  tap(1181, 748, 100)
end

-- -- å‡ºå¾æµç¨‹

-- -- ä»»åŠ¡æµç¨‹

-- æ˜¯å¦æœ‰æ²¡é¢†å–çš„ä»»åŠ¡
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

-- ç‚¹å‡»ä»»åŠ¡æŒ‰é’®
map.mission.clickMission = function()
  tap(785, 1016, 100)
end

-- ç­‰å¾…ä»»åŠ¡ç•Œé¢
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

-- ç‚¹å‡»å…¨éƒ¨ä»»åŠ¡æŒ‰é’®
map.missionClickAllMission = function()
  tap(785, 1016, 100)
end

-- ç­‰å¾…å…¨éƒ¨ä»»åŠ¡ç•Œé¢
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

-- æ£€æµ‹å…¨éƒ¨ä»»åŠ¡ç•Œé¢æ˜¯å¦æœ‰æœªé¢†å–çš„å¥–åŠ±
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

-- ç‚¹å‡»é¢†å–ç¬¬ä¸€ä¸ªå¥–åŠ±
map.mission.clickGetFirstReward = function()
  tap(1755, 190, 100)
end

-- ç­‰å¾…èŽ·å¾—é¢æ¿
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

-- ç‚¹å‡»èŽ·å¾—é¢æ¿ç¡®å®š
map.mission.clickRewardPannelOk = function()
  tap(955, 717, 100)
end

-- ç­‰å¾…æ–°èˆ¹
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

-- ç‚¹å‡»æ–°èˆ¹
map.mission.clickNewShip = function()
  tap(972, 399, 100)
end

-- ç­‰å¾…æ–°èˆ¹é”å®šå¯¹è¯æ¡†
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

-- èˆ¹é”å®šå¯¹è¯æ¡†ç‚¹å‡»ç¡®è®¤
map.mission.clickNewShipPageLockModalOkBtn = function()
  tap(741, 713, 100)
end

-- ç‚¹å‡»ä»»åŠ¡é¢æ¿çš„è¿”å›žæ¸¯å£
map.mission.clickBackToHome = function()
  tap(136, 986, 100)
end

-- -- ä»»åŠ¡æµç¨‹


-- -- è¿œå¾æµç¨‹
-- æ£€æµ‹æœ‰è¿œå¾å®Œæˆ
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

-- ç‚¹å‡»å‡ºå¾
map.expedition.clickBattle = map.home.clickBattleBtn

-- æ£€æµ‹åœ¨å‡ºå¾ç•Œé¢
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²
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

-- ç‚¹å‡»è¿œå¾
map.expedition.clickExpedition = function()
  tap(108, 394, 100)
  return true
end

-- æ£€æµ‹åœ¨å‡ºå¾è¿œå¾ç•Œé¢
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²
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

-- ä»Žç¬¬mç« ç§»åŠ¨åˆ°ç¬¬nç« 
map.expedition.moveToChapter = function(n, m)
  n = tonumber(n) or 1
  if (type(m) == "nil") then
    -- å…ˆç§»åŠ¨åˆ°ç¬¬1ç« 
    for i = 1, 7 do
      tap(358, 962, 100)
      mSleep(200)
    end
    -- å†ç§»åŠ¨åˆ°ç¬¬nç« 
    for i = 2, n do
      tap(1835, 963, 100)
      mSleep(200)
    end
  else
    m = tonumber(m) or 1
    local diff = n - m
    -- ç§»åŠ¨åˆ°ç¬¬nç« 
    if (diff > 0) then
      -- å³ç§»
      for i = 1, diff do
        tap(1835, 963, 100)
        mSleep(200)
      end
    elseif (diff < 0) then
      -- å·¦ç§»
      for i = 1, (0 - diff) do
        tap(358, 962, 100)
        mSleep(200)
      end
    end
  end
  return true
end

-- æ£€æµ‹æœ¬é¡µæœ‰æ”¶èŽ·å¥–åŠ±ï¼ŒåŒæ—¶èŽ·å–å“ªæ¡æœ‰å¥–åŠ±
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

-- ç‚¹å‡»ç¬¬nä¸ªæŒ‰é’®
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

-- æ£€æµ‹åœ¨è¿œå¾å®Œæˆç•Œé¢
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

-- ç‚¹å‡»ç»§ç»­
map.expedition.clickRewardPannelOk = function()
  tap(1644, 1022, 100)
  return true
end

-- æ£€æµ‹ç¬¬nç« èƒ½å¦è¿œå¾
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

-- ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢
map.expedition.isReadyBattlePage = map.battle.isReadyBattlePage

-- é€‰æ‹©èˆ°é˜Ÿ
map.expedition.clickSelectFleet = map.battle.selectFleet

-- æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸
map.expedition.isReadyBattlePageShipStatusAllRight = map.battle.isReadyBattlePageShipStatusAllRight

-- æ£€æµ‹hpæ˜¯å¦å®‰å…¨
map.expedition.isReadyBattlePageShipHPSafe = map.battle.isReadyBattlePageShipHPSafe

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™
map.expedition.clickReadyBattlePageQuickSupplyBtn = map.battle.clickReadyBattlePageQuickSupplyBtn

-- æ£€æµ‹å¿«é€Ÿè¡¥ç»™ç•Œé¢
map.expedition.isQuickSupplyModal = map.battle.isQuickSupplyModal

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™ç¡®å®š
map.expedition.clickReadyBattlePageQuickSupplyModalOkBtn = map.battle.clickReadyBattlePageQuickSupplyModalOkBtn

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­
map.expedition.clickQuickSupplyModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

-- ç‚¹å‡»å¿«é€Ÿç»´ä¿®
map.expedition.clickQuickRepairBtn = map.battle.clickQuickRepairBtn

-- ç­‰å¾…å¿«é€Ÿç»´ä¿®ç•Œé¢
map.expedition.isQuickRepairModal = map.battle.isQuickRepairModal

-- ç‚¹å‡»å¿«é€Ÿç»´ä¿®ç¡®å®š
map.expedition.clickQuickRepairModalOkBtn = map.battle.clickQuickRepairModalOkBtn

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­
map.expedition.clickQuickRepairModalCloseBtn = map.battle.clickQuickRepairModalCloseBtn

-- æ£€æµ‹å¿«é€Ÿä¿®ç†ç•Œé¢HPæ˜¯å¦å®‰å…¨ï¼Œæœ‰å‡ è‰˜èˆ¹éœ€è¦å¿«é€Ÿä¿®ç†
map.expedition.isQuickRepairModalShipNeedRepair = map.battle.isQuickRepairModalShipNeedRepair

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å•ä¸ªèˆ¹
map.expedition.clickQuickRepairModalSingleShip = map.battle.clickQuickRepairModalSingleShip

-- æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾
map.expedition.isFleetsCanBattle = map.battle.isFleetsCanBattle

-- ç‚¹å‡»è¿”å›žè¿œå¾ç•Œé¢
map.expedition.clickBackToExpedition = function()
  tap(1812, 974, 100)
  return true
end

-- ç‚¹å‡»è¿œå¾å¼€å§‹
map.expedition.clickBattleStartBtn = map.battle.clickBattleStartBtn

-- ç‚¹å‡»è¿”å›žæ¸¯å£
map.expedition.clickBackToHome = function()
  tap(101, 1015, 100)
  return true
end

-- -- è¿œå¾æµç¨‹


-- -- ä¿®ç†æµç¨‹

-- ç‚¹å‡»èˆ¹åžæŒ‰é’®
map.repair.clickDockBtn = function()
  tap(1442, 743, 100)
  return true
end

-- æ£€æµ‹èˆ¹åžç•Œé¢
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

-- ç‚¹å‡»ä¿®ç†æŒ‰é’®
map.repair.clickRepairBtn = function()
  tap(101, 253, 100)
  return true
end

-- æ£€æµ‹ä¿®ç†ç•Œé¢
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

-- æ£€æµ‹å¯ç”¨çš„ä¿®ç†æ§½ä½
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

-- æ£€æµ‹ç¬¬nä¸ªä¿®ç†æ§½ä½å¯ç”¨
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

-- æ£€æµ‹ç¬¬nä¸ªä¿®ç†æ§½ä½ä¸å¯ç”¨
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

-- ç‚¹å‡»ç¬¬nä¸ªä¿®ç†æŒ‰é’®
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

-- æ£€æµ‹ä¿®ç†é€‰èˆ¹ç•Œé¢
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






-- å¯»æ‰¾ä¸€ä¸ªä¸åœ¨èˆ°é˜Ÿé‡Œçš„èˆ¹
local function transColorListToString(tab)
  local tmp = {}
  for key, value in ipairs(tab) do
    value[3] = string.format('0x%06X', value[3])
    table.insert(tmp, table.concat(value, '|'))
  end
  return table.concat(tmp, ',')
end

local function transRelativePoint(tab, basePoint)
  local newTab = {}
  for key, value in ipairs(tab) do
    newTab[key] = { value[1] - basePoint[1], value[2] - basePoint[2], value[3] }
  end
  return newTab
end

local function transPointList(tab)
  local newTab = {}
  for key, value in ipairs(tab) do
    table.insert(newTab, { value.x, value.y })
  end
  return newTab
end

local function subtractionList(target, ...)
  local sources = { ... }
  local sourcesMap = {}
  local newTab = {}
  for _, source in ipairs(sources) do
    for _, value in ipairs(source) do
      sourcesMap[value[1] .. ',' .. value[2]] = value
    end
  end
  for key, value in ipairs(target) do
    if (not sourcesMap[value[1] .. ',' .. value[2]]) then
      table.insert(newTab, value)
    end
  end
  return newTab
end

-- å¯»æ‰¾ä¸€ä¸ªä¸åœ¨èˆ°é˜Ÿé‡Œçš„èˆ¹ã€‚
-- å…ˆæ‰¾åˆ°æ‰€æœ‰èˆ¹çš„ä½ç½®ï¼Œå†æ‰¾åˆ°æ‰€æœ‰åœ¨èˆ°é˜Ÿé‡Œèˆ¹çš„ä½ç½®ï¼Œå°†ä¸¤ä¸ªæ•°ç»„ç›¸å·®
map.repair.findFirstShipNotInFleet = function()
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

-- ç‚¹å‡»ç¬¬ä¸€è‰˜èˆ¹
map.repair.clickFirstShip = function()
  tap(151, 432, 100)
  return true
end

-- ç‚¹å‡»ä¸€æœèˆ¹
map.repair.clickAShip = function(point)
  tap(point[1], point[2], 100)
end

-- æ»‘åŠ¨åˆ°ä¸‹ä¸€é¡µ
map.repair.moveToNextPage = function()
  local point = {
    { 1477, 824, 0x3a516b },
    { 265, 814, 0xcecabd },
  }
  moveTo(point[1][1], point[1][2], point[2][1], point[2][2], 100)
end

-- ç‚¹å‡»è¿”å›žæ¸¯å£
map.repair.clickSelectShipPageBackBtn = function()
  tap(1819, 974, 100)
end

-- ç‚¹å‡»è¿”å›žæ¸¯å£
map.repair.clickBackToHomeBtn = function()
  tap(100, 1015, 100)
  return true
end

-- ä¿®ç†æµç¨‹

-- æ¼”ä¹ æµç¨‹

-- æ˜¯å¦åœ¨å‡ºå¾é¡µé¢
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²
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
-- ç‚¹å‡»æ¼”ä¹ 
map.exercise.clickExerciseBtn = function()
  tap(103, 252, 100)
  return true
end

--  æ£€æµ‹æ¼”ä¹ ç•Œé¢
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²
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

--  æ£€æµ‹æ˜¯å¦æœ‰æ¼”ä¹ 
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

--  ç‚¹å‡»ç¬¬nä¸ªæ¼”ä¹ 
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

-- ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢
map.exercise.isReadyBattlePage = map.battle.isReadyBattlePage

-- ç‚¹å‡»é€‰æ‹©èˆ°é˜Ÿ
map.exercise.selectFleet = map.battle.selectFleet

-- æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸
map.exercise.isReadyBattlePageShipStatusAllRight = map.battle.isReadyBattlePageShipStatusAllRight

-- æ£€æµ‹hpæ˜¯å¦å®‰å…¨
map.exercise.isReadyBattlePageShipHPSafe = map.battle.isReadyBattlePageShipHPSafe

-- ä¸æ»¡è¡€ï¼Œè¿”å›žå‡ºå¾
map.exercise.clickReadyBattlePageBackBtn = map.battle.clickReadyBattlePageBackBtn

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™
map.exercise.clickReadyBattlePageQuickSupplyBtn = map.battle.clickReadyBattlePageQuickSupplyBtn

-- ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢
map.exercise.isQuickSupplyModal = map.battle.isQuickSupplyModal

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™
map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn = map.battle.clickReadyBattlePageQuickSupplyModalOkBtn

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†
map.exercise.clickQuickRepairBtn = map.battle.clickQuickRepairBtn

-- ç­‰å¾…å¿«é€Ÿä¿®ç†ç•Œé¢
map.exercise.isQuickRepairModal = map.battle.isQuickRepairModal

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†
map.exercise.clickQuickRepairModalOkBtn = map.battle.clickQuickRepairModalOkBtn

-- æ£€æµ‹å¿«é€Ÿä¿®ç†ç•Œé¢HPæ˜¯å¦å®‰å…¨ï¼Œæœ‰å‡ è‰˜èˆ¹éœ€è¦å¿«é€Ÿä¿®ç†
map.exercise.isQuickRepairModalShipNeedRepair = map.battle.isQuickRepairModalShipNeedRepair

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å•ä¸ªèˆ¹
map.exercise.clickQuickRepairModalSingleShip = map.battle.clickQuickRepairModalSingleShip

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­
map.exercise.clickQuickSupplyModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­
map.exercise.clickQuickRepairModalCloseBtn = map.battle.clickQuickRepairModalCloseBtn

-- æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾
map.exercise.isFleetsCanBattle = map.battle.isFleetsCanBattle

-- ç‚¹å‡»å‡ºå¾å¼€å§‹
map.exercise.clickBattleStartBtn = map.battle.clickBattleStartBtn

-- ç­‰å¾…é¢å¤–èŽ·å¾—èµ„æºé¢æ¿
map.exercise.isExtraReceiveModal = map.battle.isExtraReceiveModal

-- ç‚¹å‡»é¢å¤–èŽ·å¾—ç¡®å®š
map.exercise.clickExtraReceiveModalOk = map.battle.clickExtraReceiveModalOk

-- ç­‰å¾…å¿«å¼€å§‹æˆ˜æ–—ç•Œé¢
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


-- ç‚¹å‡»å¼€å§‹æˆ˜æ–—
map.exercise.clickBattleStartModalStartBtn = function()
  tap(1326, 862, 100)
  return true
end

-- ç­‰å¾…é˜µåž‹ç•Œé¢
map.exercise.isFormationPage = map.battle.isFormationPage

-- ç‚¹å‡»é˜µåž‹
map.exercise.clickFormationPageStartBtn = map.battle.clickFormationPageStartBtn

-- ç­‰å¾…è¿½å‡»é¡µé¢
map.exercise.isPursueModal = map.battle.isPursueModal

-- ç‚¹å‡»è¿½å‡»
map.exercise.clickPursueModalOk = map.battle.clickPursueModalOk

-- ç‚¹å‡»æ”¾å¼ƒ
map.exercise.clickPursuePageCancel = map.battle.clickPursuePageCancel

-- ç­‰å¾…èƒœåˆ©ç•Œé¢
map.exercise.isVictoryPage = map.battle.isVictoryPage

-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹æ˜¯å¦å—æŸ
map.exercise.isVictoryPageShipDamaged = map.battle.isVictoryPageShipDamaged

-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹HPæ˜¯å¦å®‰å…¨
map.exercise.isVictoryPageShipHPSafe = map.battle.isVictoryPageShipHPSafe

-- ç‚¹å‡»èƒœåˆ©ç»§ç»­
map.exercise.clickVictoryPageContinueBtn = map.battle.clickVictoryPageContinueBtn

-- ç­‰å¾…èƒœåˆ©ç»§ç»­é¢æ¿
map.exercise.isVictoryPage2 = map.battle.isVictoryPage2

-- ç‚¹å‡»èƒœåˆ©ç»§ç»­2
map.exercise.clickVictoryPageContinueBtn2 = map.battle.clickVictoryPageContinueBtn2

-- æ£€æµ‹èƒœåˆ©å¯¹æ‰‹è¯¦æƒ…é¡µé¢
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

-- ç‚¹å‡»å…³é—­æŒ‘æˆ˜
map.exercise.clickVictoryOpponentDetailPageClose = function()
  tap(1803, 217, 100)
  return true
end

-- è¿”å›žhome
map.exercise.clickBackToHomeBtn = map.battle.clickBackToHomeBtn

-- æ¼”ä¹ æµç¨‹

-- æˆ˜å½¹æµç¨‹

-- æ˜¯å¦åœ¨å‡ºå¾ç•Œé¢
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²
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

-- ç‚¹å‡»æˆ˜å½¹æŒ‰é’®
map.campaign.clickCampaignBtn = function()
  tap(102, 530, 100)
  return true
end

-- æ˜¯å¦åœ¨æˆ˜å½¹ç•Œé¢
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²
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

-- ç§»åŠ¨åˆ°æˆ˜å½¹
map.campaign.moveToCampaignMission = function(m)
  m = tonumber(m) or 1
  -- å…ˆç§»åŠ¨åˆ°ç¬¬1ç« 
  for i = 1, 5 do
    tap(358, 962, 100)
    mSleep(200)
  end
  -- å†ç§»åˆ°ç¬¬mç« 
  for i = 2, m do
    tap(1836, 960, 100)
    mSleep(200)
  end
  return true
end

-- ç‚¹å‡»å‡†å¤‡å¼€å§‹æˆ˜æ–—
map.campaign.clickCampainReadyBtn = function(difficulty)
  if (difficulty == 'default') then
    tap(651, 317, 100)
  else
    tap(1504, 309, 100)
  end
  return true
end

-- ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢
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

-- æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸
map.campaign.isReadyBattlePageShipStatusAllRight = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local result = true
  local list = {
    -- å¼¹è¯ä¸è¶³
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
    -- è¿œå¾ä¸­
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

-- æ£€æµ‹hpæ˜¯å¦å®‰å…¨
map.campaign.isReadyBattlePageShipHPSafe = function(checkLevel)
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local result = true
  -- æ§½ä½ä¸Šæ²¡æœ‰èˆ¹
  local list = {
    { 118, 274, 0x94c242 },
    { 118, 413, 0x8cbe42 },
    { 118, 551, 0x8cbe42 },
    { 118, 690, 0x94c242 },
    { 118, 829, 0x8cbe42 },
    { 118, 967, 0x8cbe42 },
  }
  -- æ»¡è¡€
  local list23 = {
    { 469, 214, 0x9cfb8c },
    { 469, 353, 0x9cff8c },
    { 469, 491, 0x9cff8c },
    { 469, 630, 0x9cfb8c },
    { 469, 769, 0x9cff8c },
    { 469, 908, 0x94fb84 },
  }
  -- æœ‰ä¸­ç ´
  local list22 = {
    { 469, 332, 0xefe310 },
    { 469, 471, 0xefe308 },
    { 469, 609, 0xefe308 },
    { 469, 748, 0xefe310 },
    { 469, 887, 0xefe308 },
    { 469, 1026, 0xefe310 },
  }
  -- æœ‰å¤§ç ´
  local list21 = {
    { 469, 332, 0xef0c10 },
    { 469, 471, 0xef0c08 },
    { 469, 609, 0xef0c08 },
    { 469, 748, 0xef0c10 },
    { 469, 887, 0xef0c08 },
    { 469, 1026, 0xef0c10 },
  }
  if (checkLevel == 3) then
    -- æœ‰ä¸æ»¡è¡€
    for i = 1, #list do
      local theList = multiColor({ list[i] }, 80)
      local theList23 = multiColor({ list23[i] }, 80)
      if ((not theList) and (not theList23)) then
        result = false
        break
      end
    end
  elseif (checkLevel == 2) then
    -- æœ‰ä¸­ç ´æˆ–è€…å¤§ç ´
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
    -- æœ‰å¤§ç ´
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

-- ä¸æ»¡è¡€ï¼Œè¿”å›žå‡ºå¾
map.campaign.clickReadyBattlePageBackBtn = map.battle.clickReadyBattlePageBackBtn

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™
map.campaign.clickReadyBattlePageQuickSupplyBtn = map.battle.clickReadyBattlePageQuickSupplyBtn

-- ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢
map.campaign.isQuickSupplyModal = map.battle.isQuickSupplyModal

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™
map.campaign.clickReadyBattlePageQuickSupplyModalOkBtn = map.battle.clickReadyBattlePageQuickSupplyModalOkBtn

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†
map.campaign.clickQuickRepairBtn = map.battle.clickQuickRepairBtn

-- ç­‰å¾…å¿«é€Ÿä¿®ç†ç•Œé¢
map.campaign.isQuickRepairModal = map.battle.isQuickRepairModal

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†
map.campaign.clickQuickRepairModalOkBtn = map.battle.clickQuickRepairModalOkBtn

-- æ£€æµ‹å¿«é€Ÿä¿®ç†ç•Œé¢HPæ˜¯å¦å®‰å…¨ï¼Œæœ‰å‡ è‰˜èˆ¹éœ€è¦å¿«é€Ÿä¿®ç†
map.campaign.isQuickRepairModalShipNeedRepair = map.battle.isQuickRepairModalShipNeedRepair

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å•ä¸ªèˆ¹
map.campaign.clickQuickRepairModalSingleShip = map.battle.clickQuickRepairModalSingleShip

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­
map.campaign.clickQuickSupplyModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­
map.campaign.clickQuickRepairModalCloseBtn = map.battle.clickQuickRepairModalCloseBtn

-- æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾
map.campaign.isFleetsCanBattle = map.battle.isFleetsCanBattle

-- ç‚¹å‡»å‡ºå¾å¼€å§‹
map.campaign.clickBattleStartBtn = map.battle.clickBattleStartBtn

-- ç­‰å¾…é¢å¤–èŽ·å¾—èµ„æºé¢æ¿
map.campaign.isExtraReceiveModal = map.battle.isExtraReceiveModal

-- ç‚¹å‡»é¢å¤–èŽ·å¾—ç¡®å®š
map.campaign.clickExtraReceiveModalOk = map.battle.clickExtraReceiveModalOk

-- ç­‰å¾…å¿«å¼€å§‹æˆ˜æ–—ç•Œé¢
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


-- ç‚¹å‡»å¼€å§‹æˆ˜æ–—
map.campaign.clickBattleStartModalStartBtn = function()
  tap(1326, 862, 100)
  return true
end

-- ç­‰å¾…é˜µåž‹ç•Œé¢
map.campaign.isFormationPage = map.battle.isFormationPage

-- ç‚¹å‡»é˜µåž‹
map.campaign.clickFormationPageStartBtn = map.battle.clickFormationPageStartBtn

-- ç­‰å¾…è¿½å‡»é¡µé¢
map.campaign.isPursueModal = map.battle.isPursueModal

-- ç‚¹å‡»è¿½å‡»
map.campaign.clickPursueModalOk = map.battle.clickPursueModalOk

-- ç‚¹å‡»æ”¾å¼ƒ
map.campaign.clickPursuePageCancel = map.battle.clickPursuePageCancel

-- ç­‰å¾…èƒœåˆ©ç•Œé¢
map.campaign.isVictoryPage = map.battle.isVictoryPage

-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹æ˜¯å¦å—æŸ
map.campaign.isVictoryPageShipDamaged = map.battle.isVictoryPageShipDamaged

-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹HPæ˜¯å¦å®‰å…¨
map.campaign.isVictoryPageShipHPSafe = map.battle.isVictoryPageShipHPSafe

-- ç‚¹å‡»èƒœåˆ©ç»§ç»­
map.campaign.clickVictoryPageContinueBtn = map.battle.clickVictoryPageContinueBtn

-- ç­‰å¾…èƒœåˆ©ç»§ç»­é¢æ¿
map.campaign.isVictoryPage2 = map.battle.isVictoryPage2

-- ç‚¹å‡»èƒœåˆ©ç»§ç»­2
map.campaign.clickVictoryPageContinueBtn2 = map.battle.clickVictoryPageContinueBtn2

-- æ£€æµ‹èƒœåˆ©å¯¹æ‰‹è¯¦æƒ…é¡µé¢
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

-- ç‚¹å‡»å…³é—­æŒ‘æˆ˜
map.campaign.clickVictoryOpponentDetailPageClose = function()
  tap(1803, 217, 100)
end

-- è¿”å›žhome
map.campaign.clickBackToHomeBtn = map.battle.clickBackToHomeBtn
-- æˆ˜å½¹æµç¨‹

-- å†³æˆ˜æ— ç•ä¹‹æµ·
-- æ˜¯å¦æœ‰æ´»åŠ¨æŒ‰é’®
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

-- ç‚¹å‡»æ´»åŠ¨æŒ‰é’®
map.activity.clickHomeActivityBtn = function()
  tap(91, 863, 100)
end

-- æ£€æµ‹æ´»åŠ¨é¡µ
map.activity.isActivityPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 855, 20, 0xffffff }, { 776, 27, 0x08598c }, { 700, 37, 0x08598c }, { 790, 53, 0x00598c },
    { 859, 46, 0xffffff }, { 981, 47, 0x105d7b }, { 996, 33, 0xffffff }, { 1030, 30, 0xdee7ef },
    { 1031, 47, 0x105d94 }, { 1449, 988, 0xeff3ce }, { 1250, 988, 0xe6efb5 }, { 974, 968, 0x9cc2b5 },
    { 911, 1008, 0x73b6c5 }, { 566, 1017, 0x73b2bd }, { 196, 1029, 0x3a8ea4 }, { 57, 1003, 0x428aa4 },
    { 1860, 808, 0x94baad },
    -- è¿”å›žæŒ‰é’®
    { 1604, 946, 0x42ceef }, { 1649, 962, 0xffffff }, { 1702, 962, 0x42c6ef }, { 1762, 953, 0xffffff },
    { 1781, 977, 0x08a2ce }, { 1790, 948, 0x42caef }, { 1784, 1015, 0x008abd }, { 1709, 1020, 0x008abd },
    { 1618, 1013, 0x008abd },
  }
  local result = multiColor(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- ç‚¹å‡»å…³å¡
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

-- æ£€æµ‹å…³å¡ä»‹ç»é¡µ
map.activity.isActivityInfoPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 143, 123, 0x0875bd }, { 165, 156, 0x0892ce }, { 881, 157, 0x0865a4 }, { 882, 119, 0x005994 },
    { 956, 157, 0xcecabd }, { 1320, 164, 0xd6cac5 }, { 1725, 160, 0xd6cabd }, { 1771, 481, 0xd6cec5 },
    { 1775, 645, 0xd6cec5 }, { 1787, 880, 0xcecabd }, { 1561, 898, 0xcecabd }, { 1327, 894, 0xc5b69c },
    { 101, 543, 0xd6cec5 }, { 1405, 647, 0xd6cec5 }, { 1414, 521, 0xcecabd },
    -- å‡ºå¾æŒ‰é’®
    { 1476, 771, 0xef8a3a }, { 1493, 782, 0xa45d21 }, { 1517, 790, 0xf7fbff }, { 1534, 806, 0x522d10 },
    { 1547, 812, 0xefebe6 }, { 1553, 812, 0xfffbff }, { 1576, 811, 0xf7fbff }, { 1613, 771, 0xef8a42 },
    { 1705, 804, 0xd67119 }, { 1702, 833, 0xad4900 },
  }
  local result = multiColor(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- ç‚¹å‡»å‡ºå¾å‡†å¤‡æŒ‰é’®
map.activity.clickActivityReadyBattleBtn = function()
  tap(1590, 802, 100)
end

-- ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢
map.activity.isReadyBattlePage = map.battle.isReadyBattlePage

-- ç‚¹å‡»é€‰æ‹©èˆ°é˜Ÿ
map.activity.selectFleet = map.battle.selectFleet

-- æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸
map.activity.isReadyBattlePageShipStatusAllRight = map.battle.isReadyBattlePageShipStatusAllRight

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™
map.activity.clickReadyBattlePageQuickSupplyBtn = map.battle.clickReadyBattlePageQuickSupplyBtn

-- æ£€æµ‹hpæ˜¯å¦å®‰å…¨
map.activity.isReadyBattlePageShipHPSafe = map.battle.isReadyBattlePageShipHPSafe

-- ä¸æ»¡è¡€ï¼Œè¿”å›žå‡ºå¾
map.activity.clickReadyBattlePageBackBtn = map.battle.clickReadyBattlePageBackBtn

-- ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢
map.activity.isQuickSupplyModal = map.battle.isQuickSupplyModal

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™
map.activity.clickReadyBattlePageQuickSupplyModalOkBtn = map.battle.clickReadyBattlePageQuickSupplyModalOkBtn

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†
map.activity.clickQuickRepairBtn = map.battle.clickQuickRepairBtn

-- ç­‰å¾…å¿«é€Ÿä¿®ç†ç•Œé¢
map.activity.isQuickRepairModal = map.battle.isQuickRepairModal

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†
map.activity.clickQuickRepairModalOkBtn = map.battle.clickQuickRepairModalOkBtn

-- æ£€æµ‹å¿«é€Ÿä¿®ç†ç•Œé¢HPæ˜¯å¦å®‰å…¨ï¼Œæœ‰å‡ è‰˜èˆ¹éœ€è¦å¿«é€Ÿä¿®ç†
map.activity.isQuickRepairModalShipNeedRepair = map.battle.isQuickRepairModalShipNeedRepair

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å•ä¸ªèˆ¹
map.activity.clickQuickRepairModalSingleShip = map.battle.clickQuickRepairModalSingleShip

-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­
map.activity.clickQuickSupplyModalCloseBtn = map.battle.clickQuickSupplyModalCloseBtn

-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­
map.activity.clickQuickRepairModalCloseBtn = map.battle.clickQuickRepairModalCloseBtn

-- æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾
map.activity.isFleetsCanBattle = map.battle.isFleetsCanBattle

-- ç‚¹å‡»å‡ºå¾å¼€å§‹
map.activity.clickBattleStartBtn = map.battle.clickBattleStartBtn

-- ç­‰å¾…é¢å¤–èŽ·å¾—èµ„æºé¢æ¿
map.activity.isExtraReceiveModal = map.battle.isExtraReceiveModal

-- ç‚¹å‡»é¢å¤–èŽ·å¾—ç¡®å®š
map.activity.clickExtraReceiveModalOk = map.battle.clickExtraReceiveModalOk

-- ç­‰å¾…å¿«å¼€å§‹æˆ˜æ–—ç•Œé¢
map.activity.isBattleStartPage = map.battle.isBattleStartPage

-- å¿«å¼€å§‹é¡µé¢èƒ½å¦è¿‚å›ž
map.activity.isBattleStartPageCanRoundabout = map.battle.isBattleStartPageCanRoundabout

-- ç‚¹å‡»æˆ˜æœ¯è¿‚å›ž
map.activity.clickBattleStartModalRoundaboutBtn = map.battle.clickBattleStartModalRoundaboutBtn

-- ç‚¹å‡»å¼€å§‹æˆ˜æ–—
map.activity.clickBattleStartModalStartBtn = map.battle.clickBattleStartModalStartBtn

-- ç­‰å¾…é˜µåž‹ç•Œé¢
map.activity.isFormationPage = map.battle.isFormationPage

-- ç‚¹å‡»é˜µåž‹
map.activity.clickFormationPageStartBtn = map.battle.clickFormationPageStartBtn

-- ç­‰å¾…è¿½å‡»é¡µé¢
map.activity.isPursueModal = map.battle.isPursueModal

-- ç‚¹å‡»è¿½å‡»
map.activity.clickPursueModalOk = map.battle.clickPursueModalOk

-- ç‚¹å‡»æ”¾å¼ƒ
map.activity.clickPursuePageCancel = map.battle.clickPursuePageCancel

-- ç­‰å¾…èƒœåˆ©ç•Œé¢
map.activity.isVictoryPage = map.battle.isVictoryPage

-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹æ˜¯å¦å—æŸ
map.activity.isVictoryPageShipDamaged = map.battle.isVictoryPageShipDamaged

-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹HPæ˜¯å¦å®‰å…¨
map.activity.isVictoryPageShipHPSafe = map.battle.isVictoryPageShipHPSafe

-- ç‚¹å‡»èƒœåˆ©ç»§ç»­
map.activity.clickVictoryPageContinueBtn = map.battle.clickVictoryPageContinueBtn

-- ç­‰å¾…èƒœåˆ©ç»§ç»­é¢æ¿
map.activity.isVictoryPage2 = map.battle.isVictoryPage2

-- ç‚¹å‡»èƒœåˆ©ç»§ç»­2
map.activity.clickVictoryPageContinueBtn2 = map.battle.clickVictoryPageContinueBtn2

-- ç­‰å¾…å¤§ç ´è­¦å‘Š
map.activity.isShipSevereDamageModal = map.battle.isShipSevereDamageModal

-- å¤§ç ´è­¦å‘Šæ¡†ç‚¹å‡»å›žæ¸¯
map.activity.clickShipSevereDamageModalBack = map.battle.clickShipSevereDamageModalBack

-- ç­‰å¾…æ— æ³•å‰è¿›è­¦å‘Šæ¡†
map.activity.isShipCantGoOnModal = map.battle.isShipCantGoOnModal

-- å—æŸè¿‡é‡è­¦å‘Šæ¡†ç‚¹å‡»å›žæ¸¯
map.activity.clickShipCantGoOnModalBackBtn = map.battle.clickShipCantGoOnModalBackBtn

-- ç­‰å¾…æ–°èˆ¹
map.activity.isNewShipPage = map.battle.isNewShipPage

-- ç‚¹å‡»æ–°èˆ¹
map.activity.clickNewShip = map.battle.clickNewShip

-- ç­‰å¾…æ–°èˆ¹é”å®šå¯¹è¯æ¡†
map.activity.isNewShipPageLockModal = map.battle.isNewShipPageLockModal

-- èˆ¹é”å®šå¯¹è¯æ¡†ç‚¹å‡»ç¡®è®¤
map.activity.clickNewShipPageLockModalOkBtn = map.battle.clickNewShipPageLockModalOkBtn

-- ç­‰å¾…å‰è¿›å¯¹è¯æ¡†
map.activity.isNextLevelStepModal = map.battle.isNextLevelStepModal

-- ç­‰å¾…å‰è¿›ç‚¹å‡»å‰è¿›
map.activity.clickLevelStepModalContinueBtn = map.battle.clickLevelStepModalContinueBtn

-- ç­‰å¾…å‰è¿›ç‚¹å‡»å›žæ¸¯
map.activity.clickLevelStepModalBackBtn = map.battle.clickLevelStepModalBackBtn

-- è¿”å›žæ´»åŠ¨
map.activity.clickActivityInfoPageBackBtn = function()
  tap(1832, 127, 100)
end

-- è¿”å›žæ¡Œé¢
map.activity.clickActivityPageBackBtn = function()
  tap(1694, 974, 100)
end

return function()
  -- å†³æˆ˜æ— ç•ä¹‹æµ·
  return map
end
end
end

do
local _ENV = _ENV
package.preload[ "Co" ] = function( ... ) local arg = _G.arg;
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
-- local v1 = coroutine.yield(Promise.resolve(123))
-- local v2 = coroutine.yield({
-- a = Promise.resolve(234),
-- b = Promise.resolve(456),
-- })
-- console.log(v1)
-- console.log(v2)
-- end)):catch(function(err)
-- print(err)
-- end)

-----------------------------------------------------------------------------


local Promise = Promise or require 'Promise'

local unpack = unpack or table.unpack
local isArray = table.isArray or function(tab)
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
function tryCatch(cb)
  return xpcall(cb, function(e)
    return setStackTraceback and
      (e .. '\n' .. debug.traceback())
      or (e)
  end)
end

----------------------------------------------------------------------
function new(gen, ...)
  return Promise.new(function(resolve, reject)
    if (type(gen) == 'function') then gen = coroutine.create(gen) end
    if (type(gen) ~= 'thread') then return resolve(gen) end

    local onResolved, onRejected, next

    onResolved = function(res)
      local done, ret
      local coStatus = true
      local xpcallRes, xpcallErr = tryCatch(function()
        coStatus, ret = coroutine.resume(gen, res)
      end)
      if (not xpcallRes) then
        return reject(xpcallErr)
      end
      if (not coStatus) then
        return reject(ret)
      end
      done = (coroutine.status(gen) == 'dead')
      next(done, ret)
    end

    onRejected = function(err)
      local done, ret
      local coStatus = true
      local xpcallRes, xpcallErr = tryCatch(function()
        coStatus, ret = coroutine.resume(gen, error(tostring(err)))
      end)
      if (not xpcallRes) then
        return reject(xpcallErr)
      end
      if (not coStatus) then
        return reject(xpcallErr)
      end
      done = (coroutine.status(gen) == 'dead')
      next(done, ret)
    end

    next = function(done, ret)
      if (done) then
        return resolve(ret)
      end
      local value = toPromise(ret)
      if (value and (isPromise(value))) then
        return value.andThen(onResolved, onRejected)
      end
      return onResolved(value)
      --       onRejected(error('You may only yield a function, promise, generator, array, or object, '
      --          .. 'but the following object was passed: "' .. type(ret) .. '"'))
    end

    onResolved();
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

  if (isArray(obj)) then
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
  if ((type(obj) == 'table') and (type(obj.andThen) == 'function')) then
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
        res = { res[2] }
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
  local newArr = {}
  for k, v in ipairs(obj) do
    table.insert(newArr, toPromise(v))
  end
  return Promise.all(newArr);
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
    table.insert(promises, promise.andThen(function(res)
      results[key] = res
    end))
  end

  for key, value in pairs(obj) do
    local promise = toPromise(value)
    if (promise and isPromise(promise)) then
      defer(promise, key)
    else
      results[key] = obj[key]
    end
  end

  return Promise.all(promises).andThen(function()
    return results
  end)
end



return setmetatable({
  new = new,
  Promise = Promise,
}, {
  __call = function(_, ...)
    return new(...)
  end
})

end
end

do
local _ENV = _ENV
package.preload[ "DeviceOrientHock" ] = function( ... ) local arg = _G.arg;
require "TSLib"

local __init = init

-- 0=ç«–å±ï¼Œ1=å³æ—‹ï¼ˆhomeé”®åœ¨å³è¾¹ï¼‰ï¼Œ2=å·¦æ—‹ï¼ˆhomeé”®åœ¨å·¦è¾¹ï¼‰ï¼Œ3=å€’ç«‹
__init(0)
local w, h = getScreenSize()
local m = math.max(w, h)
local sideLength = math.min(w, h)
local orient = 0;
local nextUpdateTime = 0

-- è®¡ç®—æ–¹å‘è¾…åŠ©ç•Œé¢ï¼Œä¸€åƒç´ å®½åº¦çš„ç™½è‰²è¾¹ç•Œï¼Œä¸€åƒç´ å®½çš„é»‘è‰²è¾¹ç•Œï¼Œç”¨äºŽæ£€æµ‹æ–¹å‘
fwShowWnd("orientwid1", 0, 0, 2, m, 0)
fwShowTextView("orientwid1", "text1", "", "center", "000000", "FEFEFE", 15, 0, 0, 0, 1, m, 1)
fwShowTextView("orientwid1", "text2", "", "center", "000000", "010101", 15, 0, 1, 0, 2, m, 1)
mSleep(100)

-- è®¡ç®—å½“å‰æ–¹å‘
function calOrient(_orient)
  local result = _orient
  -- å¯»æ‰¾ç™½è‰²è¾¹ç•Œ
  __init(_orient)

  local checkOrder = { 0, 1, 2 }
  if (_orient == 0) then
    checkOrder = { 1, 2 }
  elseif (_orient == 1) then
    checkOrder = { 0, 2 }
  elseif (_orient == 2) then
    checkOrder = { 0, 1 }
  end

  local checkPointList = {
    { 0, math.floor(0.333 * sideLength), 0xfefefe },
    { 0, math.floor(0.5 * sideLength), 0xfefefe },
    { 0, math.floor(0.667 * sideLength), 0xfefefe },
    { 0, math.floor(0.833 * sideLength), 0xfefefe },
    { 1, math.floor(0.333 * sideLength), 0x010101 },
    { 1, math.floor(0.5 * sideLength), 0x010101 },
    { 1, math.floor(0.667 * sideLength), 0x010101 },
    { 1, math.floor(0.833 * sideLength), 0x010101 },
  }

  -- å¦‚æžœæ–¹å‘æ²¡å˜åˆ™ä¸æ—‹è½¬
  if (multiColor(checkPointList)) then
    return _orient
  end
  -- å¦‚æžœæ–¹å‘å˜äº†åˆ™æ—‹è½¬
  for k, v in ipairs(checkOrder) do
    __init(v)
    if (multiColor(checkPointList)) then
      return v
    end
  end
  __init(_orient)
  return _orient
end

local _orient = calOrient(orient)
orient = _orient

-- èŽ·å–å½“å‰æ–¹å‘
getDeviceOrient = function()
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


-- è®¾ç½®å½“å‰æ–¹å‘ï¼Œå½“ç„¶åªèƒ½è®¾ç½®initçš„æ–¹å‘
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
package.preload[ "EventQuery" ] = function( ... ) local arg = _G.arg;
local sz
local socket

-- get the time
local gettimeFunc = function()
  return os.time() * 1000
end
-- sleep
local mSleep = mSleep

-- for touchsprite socket
local _ = (function()
  local pcallRes = pcall(function()
    sz = require 'sz'
    socket = require 'szocket.core'
    gettimeFunc = function()
      return socket.gettime() * 1000
    end
    mSleep = mSleep or function(n)
      socket.select(nil, nil, n / 1000)
    end
  end)
  if (pcallRes) then return end
  local pcallRes2 = pcall(function()
    socket = require 'socket'
    gettimeFunc = function()
      return socket.gettime() * 1000
    end
    mSleep = mSleep or function(n)
      socket.select(nil, nil, n / 1000)
    end
  end)
end)()


-- fwGetPressedButton
-- keepScreen(true);

local function isEmpty(tab)
  for _, v in pairs(tab) do
    return false
  end
  return true
end







local function tryCatch(cb)
  return xpcall(cb, function(e)
    return stackTraceback and
      (e .. '\n' .. debug.traceback())
      or (e)
  end)
end

local function bindSelf(func, self)
  return function(...) return func(self, ...) end
end

local getEventId = (function()
  local id = 0
  return function()
    id = id + 1
    return id
  end
end)()

-- main query
local eventQuery = {}
-- sub query
local screenListenerQuery = {}
local screenListenerQueryIndex = {}
local screenListenerQueryGroup = {}
local buttonListenerQuery = {}
local buttonListenerQueryIndex = {}
local timerQuery = {}
local timerQueryIndex = {}


function getEventObj(func, time, isInterval, ms)
  return {
    id = getEventId() or 0,
    time = time or 0,
    func = func,
    isInterval = isInterval or false,
    ms = ms or 0,
    drop = false,
  }
end

function getScreenEventObj(tags, checker, func)
  return {
    id = getEventId() or 0,
    tags = tags,
    checker = checker,
    func = func,
    drop = false,
  }
end

function getButtonEventObj(btnId, func)
  return {
    id = getEventId() or 0,
    btnId = btnId,
    func = func,
    drop = false,
  }
end




function setImmediate(func)
  if (type(func) ~= 'function') then return 0 end
  local eventObj = getEventObj(func)
  table.insert(eventQuery, eventObj)
  return eventObj.id
end

function setTimeout(func, ms)
  if (type(func) ~= 'function') then return 0 end
  if ((type(ms) ~= 'number') or (ms < 4)) then ms = 4 end
  local time = gettimeFunc() + ms
  local eventObj = getEventObj(func, time)
  table.insert(timerQuery, eventObj)
  timerQueryIndex[eventObj.id] = eventObj
  return eventObj.id
end

function clearTimeout(id)
  local theEventObj = timerQueryIndex[id]
  if (theEventObj) then
    theEventObj.drop = true
    timerQueryIndex[id] = nil
  end
end

function setInterval(func, ms)
  if (type(func) ~= 'function') then return 0 end
  if ((type(ms) ~= 'number') or (ms < 4)) then ms = 4 end
  local time = gettimeFunc() + ms
  local eventObj = getEventObj(func, time, true, ms)
  table.insert(timerQuery, eventObj)
  timerQueryIndex[eventObj.id] = eventObj
  return eventObj.id
end

-- param: tags, checker, func
function setScreenListener(...)
  local args = { ... }
  local tags = {}
  if (type(args[1]) == 'table') then
    tags = table.remove(args, 1)
  elseif (type(args[1]) == 'string') then
    tags = { table.remove(args, 1) }
  end
  local checker = table.remove(args, 1)
  local func = table.remove(args, 1)


  if (type(checker) ~= 'function') then return 0 end
  if (type(func) ~= 'function') then return 0 end
  local screenEventObj = getScreenEventObj(tags, checker, func)
  table.insert(screenListenerQuery, screenEventObj)
  screenListenerQueryIndex[screenEventObj.id] = screenEventObj
  for _, tag in ipairs(tags) do
    screenListenerQueryGroup[tag] = screenListenerQueryGroup[tag] or {}
    screenListenerQueryGroup[tag][screenEventObj.id] = screenEventObj
  end
  return screenEventObj.id
end

function clearScreenListener(id)
  local theEventObj = screenListenerQueryIndex[id]
  if (theEventObj) then
    theEventObj.drop = true
    screenListenerQueryIndex[id] = nil
    for _, tag in ipairs(theEventObj.tags) do
      if (type(screenListenerQueryGroup[tag]) == 'table') then
        screenListenerQueryGroup[tag][theEventObj.id] = nil
        if (isEmpty(screenListenerQueryGroup[tag])) then
          screenListenerQueryGroup[tag] = nil
        end
      end
    end
  end
end

function clearScreenListenerByTags(tags)
  if (type(tags) ~= 'table') then
    tags = { tags }
  end
  for _, tag in pairs(tags) do
    local tagsEventObj = screenListenerQueryGroup[tag]
    if (type(tagsEventObj) == 'table') then
      for _, eventObj in pairs(tagsEventObj) do
        eventObj.drop = true
        screenListenerQueryIndex[eventObj.id] = nil
      end
    end
    screenListenerQueryGroup[tag] = nil
  end
end

function setButotnListener(btnId, func)
  if (type(func) ~= 'function') then return 0 end
  local btnEventObj = getButtonEventObj(btnId, func)
  table.insert(buttonListenerQuery, btnEventObj)
  buttonListenerQueryIndex[btnEventObj.id] = btnEventObj
  return btnEventObj.id
end

function clearButotnListener(id)
  local theEventObj = buttonListenerQueryIndex[id]
  if (not theEventObj) then
    theEventObj.drop = true
    buttonListenerQueryIndex[id] = nil
  end
end

function clearListenersOnButton(btnId)
  for key, value in ipairs(buttonListenerQuery) do
    if (value.btnId ~= btnId) then
      value.drop = true
      buttonListenerQueryIndex[value.id] = nil
    end
  end
end

function run()
  local continue = 0
  local thisTime = 0
  local sleepTime = 3600000


  repeat
    continue = 0
    sleepTime = 3600000

    -- run eventQuery
    for key, value in ipairs(eventQuery) do
      value.func()
      -- setInterval event
    end
    eventQuery = {}


    -- read event from other Query
    thisTime = gettimeFunc()

    -- timeQuery
    if (#timerQuery > 0) then
      continue = continue + 1
      local newTimeQuery = {}
      for key, value in ipairs(timerQuery) do
        if (not value.drop) then
          if (value.time <= thisTime) then
            table.insert(eventQuery, value)

            -- setInterval event
            if (value.isInterval) then
              repeat
                value.time = value.time + value.ms
              until (value.time > thisTime)
              sleepTime = math.min(sleepTime, value.time)
              table.insert(newTimeQuery, value)
            end
          else
            sleepTime = math.min(sleepTime, value.time)
            table.insert(newTimeQuery, value)
          end
        end
      end
      timerQuery = newTimeQuery
      newTimeQuery = nil
    end

    -- screenListenerQuery
    if (#screenListenerQuery > 0) then
      if (type(getDeviceOrient) == 'function') then getDeviceOrient() end
      local hasDropEvent = false
      continue = continue + 1
      sleepTime = math.min(sleepTime, 200)
      keepScreen(true);
      for key, value in ipairs(screenListenerQuery) do
        if (not value.drop) then
          if (value.checker()) then
            table.insert(eventQuery, value)
            if (value.isOnce) then
              value.drop = true
              hasDropEvent = true
            end
          end
        else
          hasDropEvent = true
        end
      end

      if (hasDropEvent) then
        local newScreenListenerQuery = {}
        for key, value in ipairs(screenListenerQuery) do
          if (not value.drop) then
            table.insert(newScreenListenerQuery, value)
          end
        end
        screenListenerQuery = newScreenListenerQuery
      end
      keepScreen(false);
    end

    -- buttonListenerQuery
    if (#buttonListenerQuery > 0) then
      sleepTime = math.min(sleepTime, 200)
      continue = continue + 1
      local btnIdList = {}
      local hasBtnClick = false
      local hasDropEvent = false
      while (true) do
        local btnId = fwGetPressedButton()
        if (type(btnId) ~= 'string') then break end
        btnIdList[btnId] = btnId
        hasBtnClick = true
      end
      if (hasBtnClick) then
        for key, value in ipairs(buttonListenerQuery) do
          if (not value.drop) then
            if (btnIdList[value.btnId] == value.btnId) then
              table.insert(eventQuery, value)
            end
          else
            hasDropEvent = true
          end
        end

        if (hasDropEvent) then
          local newButtonListenerQuery = {}
          for key, value in ipairs(buttonListenerQuery) do
            if (not value.drop) then
              table.insert(newButtonListenerQuery, value)
            end
          end
          buttonListenerQuery = newButtonListenerQuery
        end
      end
    end

    if (luaExisted) then
      break
    end

    if (#eventQuery <= 0) then
      mSleep(sleepTime)
    end
  until (false)
end

return {
  setImmediate = setImmediate,
  setTimeout = setTimeout,
  clearTimeout = clearTimeout,
  setInterval = setInterval,
  clearInterval = clearTimeout,
  setScreenListener = setScreenListener,
  clearScreenListener = clearScreenListener,
  clearScreenListenerByTags = clearScreenListenerByTags,
  setButotnListener = setButotnListener,
  clearListenersOnButton = clearListenersOnButton,
  clearButotnListener = clearButotnListener,
  run = run,
}
end
end

do
local _ENV = _ENV
package.preload[ "GoMission" ] = function( ... ) local arg = _G.arg;
local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
local c = coroutine

local isArray = table.isArray or function(tab)
  if (type(tab) ~= 'table') then return false end
  local length = #tab
  for key, value in pairs(tab) do
    if ((type(key) ~= 'number') or (key > length)) then
      return false
    end
  end
  return true
end


local combineListener = function(target, ...)
  local sources = { ... }
  if (type(target) ~= 'table') then target = {} end
  for _, source in ipairs(sources) do
    for key, value in ipairs(source) do
      table.insert(target, value)
    end
  end
  local targetReverse = table.reverse(target)
  local resultIndex = {}
  local result = {}
  for key, value in ipairs(targetReverse) do
    if (not resultIndex[value[3]]) then
      resultIndex[value[3]] = value
      table.insert(result, value)
    end
  end

  local resultReverse = table.reverse(result)
  return resultReverse
end

local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    eq.setTimeout(resolve, ms)
  end)
end

local setScreenListenerPromise = function(actionType, tags, checker)
  return Promise.new(function(resolve)
    eq.setScreenListener(tags, checker, function() resolve(actionType) end)
  end)
end

local setScreenListeners = function(theArr, ...)

  if ((type(theArr) ~= 'table') or (#theArr == 0)) then
    return Promise.resolve(nil)
  end

  theArr = table.merge(theArr, ...)

  local theArrUnique = table.uniqueLast(theArr, 3)
  for key, value in ipairs(theArrUnique) do
    value.isOnce = true
  end
  return co(c.create(function()
    local newArr = {}
    local tags = {}
    local done = false
    for key, listenerEvent in ipairs(theArrUnique) do
      if (type(listenerEvent[2]) == 'table') then
        tags = table.merge(tags, listenerEvent[2])
      else
        table.insert(tags, listenerEvent[2])
      end

      if ((type(listenerEvent[4]) == 'number') and (listenerEvent[4] > 0)) then
        table.insert(newArr, co(c.create(function()
          c.yield(sleepPromise(listenerEvent[4]))
          if (not done) then
            return c.yield(setScreenListenerPromise(listenerEvent[1], listenerEvent[2], listenerEvent[3]))
          end
          return
        end)))
      else
        table.insert(newArr, co(c.create(function()
          local res = c.yield(setScreenListenerPromise(listenerEvent[1], listenerEvent[2], listenerEvent[3]))
          done = true
          return res
        end)))
      end
    end
    local res = c.yield(Promise.race(newArr))
    eq.clearScreenListenerByTags(tags)
    return res
  end))
end

local missions = {--  home = function() end,
  --  battleOnce = function() end,
  --  mission = function() end,
  --  expeditionReward = function() end,
  --  expeditionOnce = function() end,
  --  repairOnce = function() end,
  --  exerciseOnce = function() end,
}

local stateTree = {
  pause = {},
  home = {},
  network = {},
  login = {},
  battle = {},
  expeditionReward = {
    enableChapter = {},
  },
  expedition = {
    needExpedition = true,
    expeditionFleetToChapter = {},
  },
  repair = {
    needRepair = true,
  },
  exercise = {},
  campaign = {},
  activity = {},
}



return {
  init = function(map, stepLabel, settings)
    -- å®šä¹‰éœ€è¦å…¨å±€ç›‘å¬çŠ¶æ€
    local getComListener = function()
      return {
        { { type = 'NETWORK_NETWORK_FAILURE_MODAL', addToStart = true }, 'homeGroup', map.network.isNetworkFailureModal, 2000 },
        { { type = 'NETWORK_CHECK_NETWORK_MODAL', addToStart = true }, 'homeGroup', map.network.isCheckNetworkModal, 2000 },
        { 'LOGIN_START_APP', 'homeGroup', map.login.isAppNotRun, 20000 },
        -- 5åˆ†é’Ÿç•Œé¢ä¸å˜åŒ–åˆ™é‡å¯æ¸¸æˆ
        { 'LOGIN_START_APP', 'homeGroup', function() return true end, settings.restartInterval * 1000 },
        --        { { type = 'PAUSE_PAUSE', addToStart = true }, 'homeGroup', map.home.isPause },
      }
    end
    local getHomeListener = function()
      return {
        { 'HOME_HOME', 'homeGroup', map.home.isHome, 2000 },
        { { type = 'HOME_MEDAL_MODAL', addToStart = true }, 'homeGroup', map.home.isMedalModal, 2000 },
        { { type = 'HOME_NEWS_MODAL', addToStart = true }, 'homeGroup', map.home.isNewsModal, 2000 },
        { { type = 'HOME_SIGN_MODAL', addToStart = true }, 'homeGroup', map.home.isSignModal, 2000 },
      }
    end
    local getLoginListener = function()
      return {
        { { type = 'LOGIN_SELECT_SERVER', addToStart = true }, 'loginGroup', map.login.isSelectServerPage, 2000 },
      }
    end
    local makeAction = function(action)
      if (type(action) == 'table') then return action end
      return { type = action }
    end

    -- å®šä¹‰çŠ¶æ€æ ‘
    missions.home = function(action, state)
      return co(c.create(function()
        if (action.type == 'HOME_HOME') then

          return nil, state

        elseif (action.type == 'HOME_MEDAL_MODAL') then

          stepLabel.setStepLabelContent('1-2å‹‹ç« å–æ¶ˆ')
          map.home.clickMedalModalCancelBtn()
          c.yield(sleepPromise(2000))
          local res = map.home.isMedalModal()
          if (res) then
            return makeAction('HOME_MEDAL_MODAL'), state
          end
          return nil, state

        elseif (action.type == 'HOME_NEWS_MODAL') then

          stepLabel.setStepLabelContent('1-3.å…³é—­æ–°é—»')
          map.home.clickMewsModalClose()
          c.yield(sleepPromise(2000))
          local res = map.home.isNewsModal()
          if (res) then
            return makeAction('HOME_NEWS_MODAL'), state
          end
          return nil, state

        elseif (action.type == 'HOME_SIGN_MODAL') then

          stepLabel.setStepLabelContent('1-4.èŽ·å–ç­¾åˆ°å¥–åŠ±')
          local res = map.home.isSignModalHasReward()
          if (res) then
            stepLabel.setStepLabelContent('1-5.æœ‰å¥–åŠ±ï¼Œç‚¹å‡»èŽ·å–')
            map.home.clickSignModalGetReward()
            stepLabel.setStepLabelContent('1-6.ç­‰å¾…èŽ·å–ç¡®è®¤')
            local newstateTypes = c.yield(setScreenListeners({
              { 'HOME_SIGN_CONFIRM_MODAL', 'missionsGroup', map.home.isSignConfirmModal },
              { 'HOME_SIGN_MODAL', 'missionsGroup', map.home.isSignModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('1-7.æ²¡æœ‰å¥–åŠ±')
            map.home.clickSignModalClose()
            c.yield(sleepPromise(2000))
            local res = map.home.isSignModal()
            if (res) then
              return makeAction('HOME_SIGN_MODAL'), state
            end
            return nil, state
          end

        elseif (action.type == 'HOME_SIGN_CONFIRM_MODAL') then

          stepLabel.setStepLabelContent('1-8.ç‚¹å‡»èŽ·å–ç¡®è®¤')
          map.home.clickSignConfirmModalGetReward()
          stepLabel.setStepLabelContent('1-9.ç­‰å¾…èŽ·å–ç­¾åˆ°å¥–åŠ±é¢æ¿')
          c.yield(sleepPromise(2000))
          local newstateTypes = c.yield(setScreenListeners({
            { 'HOME_SIGN_CONFIRM_MODAL', 'missionsGroup', map.home.isSignConfirmModal, 2000 },
            { 'HOME_SIGN_MODAL', 'missionsGroup', map.home.isSignModal },
          }))
          return makeAction(newstateTypes), state
        end

        return nil
      end))
    end

    missions.network = function(action, state)
      return co(c.create(function()
        if (action.type == 'NETWORK_NETWORK_FAILURE_MODAL') then

          stepLabel.setStepLabelContent('1-10.ç½‘ç»œä¸é€šï¼Œç‚¹å‡»ç¡®è®¤')
          state.network.networkFalureCount = state.network.networkFalureCount or 0
          state.network.networkFalureCount = state.network.networkFalureCount + 1
          if (state.network.networkFalureCount > 50) then
            return makeAction('LOGIN_START_APP'), state
          end
          map.network.clickNetworkFailureModalOk()
          c.yield(sleepPromise(2000))
          local res = map.network.isNetworkFailureModal()
          if (res) then
            return makeAction('NETWORK_NETWORK_FAILURE_MODAL'), state
          end
          return nil, state

        elseif (action.type == 'NETWORK_CHECK_NETWORK_MODAL') then

          stepLabel.setStepLabelContent('1-11.æ£€æŸ¥æ‚¨çš„ç½‘ç»œï¼Œç‚¹å‡»ç¡®è®¤')
          state.network.networkFalureCount = state.network.networkFalureCount or 0
          state.network.networkFalureCount = state.network.networkFalureCount + 1
          if (state.network.networkFalureCount > 50) then
            return makeAction('LOGIN_START_APP'), state
          end
          map.network.clickCheckNetworkModalOk()
          c.yield(sleepPromise(2000))
          local res = map.network.isCheckNetworkModal()
          if (res) then
            return makeAction('NETWORK_CHECK_NETWORK_MODAL'), state
          end
          return nil, state
        end

        return nil, state
      end))
    end

    missions.pause = function(action, state)
      return co(c.create(function()
        if (action.type == 'PAUSE_PAUSE') then
          state.pause.lasttext = stepLabel.getText()
          stepLabel.setPrefix('')
          stepLabel.setStepLabelContent('æš‚åœ')
          c.yield(sleepPromise(500))
          if (map.home.isPause()) then
            return makeAction('PAUSE_PAUSE_CONTINUE'), state
          else
            return nil, state
          end
        elseif (action.type == 'PAUSE_PAUSE_CONTINUE') then
          c.yield(sleepPromise(500))
          if (map.home.isPause()) then
            return makeAction('PAUSE_PAUSE_CONTINUE'), state
          else
            stepLabel.setStepLabelContent(state.pause.lasttext)
            return nil, state
          end
        end

        return nil, state
      end))
    end

    missions.login = function(action, state)
      return co(c.create(function()
        if (action.type == 'LOGIN_START_APP') then

          stepLabel.setStepLabelContent('1-11.å¯åŠ¨æ¸¸æˆ')
          map.login.restartApp()
          local newstateTypes = c.yield(setScreenListeners({
            { 'LOGIN_SELECT_SERVER', 'missionsGroup', map.login.isSelectServerPage, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'LOGIN_SELECT_SERVER') then

          stepLabel.setStepLabelContent('1-12.ç™»å½•ç•Œé¢')
          map.login.clickLoginBtn()
          c.yield(sleepPromise(2000))
          local res = map.login.isSelectServerPage()
          if (res) then
            return makeAction('LOGIN_SELECT_SERVER'), state
          end
          return nil, state
        end

        return nil, state
      end))
    end

    missions.battleOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'BATTLE_START') then
          state.battle.quickSupplyCount = 0
          state.battle.quickRepairCount = 0
          state.battle.quickRepairSingleLastShip = 0
          state.battle.quickRepairSingleCount = 0
          state.battle.HPIsSafe = true
          state.battle.battleNum = 1
          state.battle.cantBattle = true
          state.battle.battleRebootAt6_1AMeetCVFlag = false
          state.battle.battleChapter = nil
          state.battle.passBattleStartPage = false

          -- å‡ºå¾åŽå°±åº”è¯¥éœ€è¦ç»´ä¿®
          state.repair.needRepair = true

          stepLabel.setStepLabelContent('2-1.ç­‰å¾…HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_HOME_CLICK_BATTLE') then

          stepLabel.setStepLabelContent('2-2.ç‚¹å‡»å‡ºå¾')
          map.home.clickBattleBtn()
          stepLabel.setStepLabelContent('2-3.ç­‰å¾…å‡ºå¾é¡µé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('2-5.å‡ºå¾é¡µé¢ç‚¹å‡»å‡ºå¾çš„å‡ºå¾æŒ‰é’®')
          c.yield(sleepPromise(500))
          map.battle.clickBattleBtn()
          stepLabel.setStepLabelContent('2-6.ç­‰å¾…å‡ºå¾çš„å‡ºå¾ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE') then

          if (#settings.battleChapter > 1) then
            state.battle.battleChapter = table.remove(settings.battleChapter, 1)
            table.insert(settings.battleChapter, state.battle.battleChapter)
          else
            state.battle.battleChapter = settings.battleChapter[1]
          end
          stepLabel.setStepLabelContent('2-7.å‡ºå¾çš„å‡ºå¾é¡µé¢')
          stepLabel.setStepLabelContent('2-8.ç§»åŠ¨åˆ°ç« èŠ‚' .. state.battle.battleChapter)
          c.yield(sleepPromise(300))
          map.battle.moveToChapter(state.battle.battleChapter)
          stepLabel.setStepLabelContent('2-9.è¿›å…¥ç« èŠ‚')
          c.yield(sleepPromise(300))
          map.battle.clickReadyBattleBtn()
          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('2-10.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage, 2000 },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE') then

          if ((state.battle.quickSupplyCount <= 0) and (state.battle.quickRepairCount <= 0)) then
            -- è¿˜æ²¡å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®
            stepLabel.setStepLabelContent('2-11.é€‰æ‹©èˆ°é˜Ÿ:' .. settings.battleFleet)
            map.battle.selectFleet(settings.battleFleet)
            stepLabel.setStepLabelContent('2-12.æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸')
            c.yield(sleepPromise(1000))
            local res = map.battle.isReadyBattlePageShipStatusAllRight()
            if (res) then
              stepLabel.setStepLabelContent('2-13.çŠ¶æ€æ­£å¸¸')
              state.battle.quickSupplyCount = 1
              state.battle.quickRepairCount = 1
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('2-14.çŠ¶æ€ä¸æ­£å¸¸')
              map.battle.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('6-12.ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
                { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.isQuickSupplyModal },
              }))
              return makeAction(newstateTypes), state
            end
          elseif (state.battle.quickRepairCount <= 0) then
            -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®
            stepLabel.setStepLabelContent('2-15.æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(1000))
            local res = map.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('2-16.è¡€é‡å®‰å…¨')
              state.battle.quickRepairCount = 1
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.battleQuickRepair > 0) then
                stepLabel.setStepLabelContent('2-17.è¡€é‡ä¸å®‰å…¨ï¼Œå¿«ä¿®')
                map.battle.clickQuickRepairBtn()

                state.battle.quickRepairSingleLastShip = 0
                state.battle.quickRepairSingleCount = 0

                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
                  { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('2-18.è¡€é‡ä¸å®‰å…¨')
                state.battle.quickRepairCount = 1
                return { type = 'BATTLE_READY_BATTLE_PAGE' }, state
              end
            end
          else
            -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œå·²ç»ç»´ä¿®
            stepLabel.setStepLabelContent('2-19.å†æ¬¡æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(500))
            -- ä¸å…è®¸å¤§ç ´å‡ºå¾
            local res = map.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('2-20.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('2-21.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')
              return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO'), state
            end
          end

        elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('2-22.å¿«é€Ÿè¡¥ç»™ç•Œé¢ç‚¹å‡»ç¡®å®š')
          map.battle.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('2-23.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          state.battle.quickSupplyCount = state.battle.quickSupplyCount + 1
          if (state.battle.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.isQuickSupplyModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('2-24.èµ„æºæ•°é‡ä¸è¶³')
            return { type = 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('2-25.ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­')
          c.yield(sleepPromise(100))
          map.battle.clickQuickSupplyModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickSupplyModal, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL') then

          if (settings.battleQuickRepair == 3) then
            -- ä¸æ»¡è¡€åˆ™å¿«ä¿®
            stepLabel.setStepLabelContent('2-26.ç‚¹å‡»å¿«é€Ÿä¿®ç†ç¡®å®š')
            c.yield(sleepPromise(500))
            map.battle.clickQuickRepairModalOkBtn()
            state.battle.quickRepairCount = state.battle.quickRepairCount + 1
            stepLabel.setStepLabelContent('2-27.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
            if (state.battle.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('2-28.å¿«ä¿®æ•°é‡ä¸è¶³')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.battleQuickRepair == 2) then
            -- ä¸­ç ´æˆ–å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('2-29.å¯»æ‰¾ä¸­ç ´æˆ–å¤§ç ´çš„èˆ¹')
            c.yield(sleepPromise(1000))
            local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
            if (#res > 0) then

              if ((state.battle.quickRepairSingleLastShip ~= res[1]) or (state.battle.quickRepairSingleCount < 3)) then
                state.battle.quickRepairSingleLastShip = res[1]
                state.battle.quickRepairSingleCount = state.battle.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('2-30.ä¸­ç ´æˆ–å¤§ç ´:' .. table.concat(res, ','))
                map.battle.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.battle.quickRepairSingleLastShip = 0
                state.battle.quickRepairSingleCount = 0
                state.battle.quickRepairCount = state.battle.quickRepairCount + 1
                stepLabel.setStepLabelContent('2-31.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('2-32.ä¿®ç†å®Œæˆ')
              state.battle.quickRepairCount = state.battle.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.battleQuickRepair == 1) then
            -- å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('2-33.å¯»æ‰¾å¤§ç ´çš„èˆ¹')
            c.yield(sleepPromise(1000))
            local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
            if (#res > 0) then
              if ((state.battle.quickRepairSingleLastShip ~= res[1]) or (state.battle.quickRepairSingleCount < 3)) then
                state.battle.quickRepairSingleLastShip = res[1]
                state.battle.quickRepairSingleCount = state.battle.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('2-34.å¤§ç ´:' .. table.concat(res, ','))
                map.battle.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.battle.quickRepairSingleLastShip = 0
                state.battle.quickRepairSingleCount = 0
                state.battle.quickRepairCount = state.battle.quickRepairCount + 1
                stepLabel.setStepLabelContent('2-35.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('2-36.ä¿®ç†å®Œæˆ')
              state.battle.quickRepairCount = state.battle.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('2-37.ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­')
          c.yield(sleepPromise(500))
          map.battle.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('2-38.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('2-39.æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾')
          c.yield(sleepPromise(500))
          local fleetCanBattle = map.battle.isFleetsCanBattle()
          if (fleetCanBattle) then
            stepLabel.setStepLabelContent('2-40.å¯ä»¥å‡ºå¾')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.battle.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('2-41.è¿”å›žHOME')
            return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO'), state
          end

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('2-42.å‡ºå¾å‡†å¤‡ç•Œé¢ï¼Œç‚¹å‡»å‡ºå¾å¼€å§‹')
          c.yield(sleepPromise(100))
          map.battle.clickBattleStartBtn()
          return { type = 'BATTLE_GO_A_BATTLE' }, state

        elseif (action.type == 'BATTLE_GO_A_BATTLE') then

          state.battle.passBattleStartPage = false

          if (state.battle.battleNum < settings.battleMaxBattleNum) then
            stepLabel.setStepLabelContent('2-43.ç¬¬' .. state.battle.battleNum .. 'æˆ˜å¼€å§‹')
          else
            stepLabel.setStepLabelContent('2-44.ç¬¬' .. state.battle.battleNum .. 'æˆ˜Bossæˆ˜å¼€å§‹')
          end
          stepLabel.setStepLabelContent('2-45.ç­‰å¾…é¢å¤–èŽ·å¾—é¢æ¿ï¼Œå¼€å§‹é¢æ¿ï¼Œé˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhomeï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
            { 'BATTLE_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.battle.isExtraReceiveModal },
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            -- { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.isNewShipPageLockModal },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_EXTRA_RECEIVE_MODAL') then

          stepLabel.setStepLabelContent('2-46.é¢å¤–èŽ·å¾—é¢æ¿ï¼Œç‚¹å‡»ç¡®å®š')
          map.battle.clickExtraReceiveModalOk()
          stepLabel.setStepLabelContent('2-47.ç­‰å¾…é¢å¤–èŽ·å¾—é¢æ¿ï¼Œå¼€å§‹é¢æ¿ï¼Œé˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhomeï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.battle.isExtraReceiveModal, 2000 },
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_START_PAGE') then

          -- 6-1ç¬¬ä¸€æˆ˜ï¼Œé‡åˆ°2èˆªæ¯ï¼ŒSLå¤§æ³•
          state.battle.passBattleStartPage = true
          if (settings.battleRebootAt6_1AMeetCV) then
            stepLabel.setStepLabelContent('2-48.å¼€å§‹æ£€æµ‹èˆªæ¯')
            if (state.battle.battleChapter == '6-1') then
              if (state.battle.battleNum == 1) then
                c.yield(sleepPromise(500))
                if (map.battle.isFirstSecondShipIsCV()) then
                  stepLabel.setStepLabelContent('2-49.é‡åˆ°2èˆªæ¯ï¼ŒSLå¤§æ³•')
                  return makeAction({ type = 'LOGIN_START_APP' }), state
                end
              end
            end
          end

          stepLabel.setStepLabelContent('2-50.å¼€å§‹é¢æ¿ï¼Œç‚¹å‡»å¼€å§‹')
          c.yield(sleepPromise(200))
          if (settings.battleRoundabout and map.battle.isBattleStartPageCanRoundabout()) then
            map.battle.clickBattleStartModalRoundaboutBtn()
          else
            map.battle.clickBattleStartModalStartBtn()
          end
          stepLabel.setStepLabelContent('2-51.ç­‰å¾…é˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage, 2000 },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_FORMATION_PAGE') then

          -- 6-1æœªå‘çŽ°æ•Œèˆ°
          if (settings.battleRebootAt6_1AMeetCV) then
            if (not state.battle.passBattleStartPage) then
              if (state.battle.battleChapter == '6-1') then
                if (state.battle.battleNum == 1) then
                  c.yield(sleepPromise(500))
                  if (map.battle.isFirstSecondShipIsCV()) then
                    stepLabel.setStepLabelContent('2-52.æœªå‘çŽ°æ•Œèˆ°ï¼ŒSLå¤§æ³•')
                    return makeAction({ type = 'LOGIN_START_APP' }), state
                  end
                end
              end
            end
          end

          stepLabel.setStepLabelContent('2-53.é˜µåž‹é¢æ¿')
          c.yield(sleepPromise(100))
          map.battle.clickFormationPageStartBtn(settings.battleFormation)
          stepLabel.setStepLabelContent('2-54.ç­‰å¾…è¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage, 2000 },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage, 2000 },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_PURSUE_PAGE') then

          stepLabel.setStepLabelContent('2-55.è¿½å‡»é¢æ¿')
          if ((settings.battlePursue and (state.battle.battleNum < settings.battleMaxBattleNum))
            or (settings.battlePursueBoss and (state.battle.battleNum == settings.battleMaxBattleNum))) then
            stepLabel.setStepLabelContent('2-56.è¿½å‡»')
            map.battle.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('2-57.æ”¾å¼ƒè¿½å‡»')
            map.battle.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('2-58.ç­‰å¾…èƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage, 2000 },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal, 2000 },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_VICTORY_PAGE') then

          c.yield(sleepPromise(1000))
          stepLabel.setStepLabelContent('2-59.èƒœåˆ©ç•Œé¢æ£€æµ‹HPæ˜¯å¦å®‰å…¨')
          c.yield(sleepPromise(300))
          -- æœ‰å¤§ç ´å°±å›žæ¸¯
          state.battle.HPIsSafe = map.battle.isVictoryPageShipHPSafe(1)
          if (state.battle.HPIsSafe) then
            stepLabel.setStepLabelContent('2-60.HPå®‰å…¨')
          else
            stepLabel.setStepLabelContent('2-61.HPä¸å®‰å…¨')
          end
          c.yield(sleepPromise(200))
          stepLabel.setStepLabelContent('2-62.ç‚¹å‡»èƒœåˆ©ç»§ç»­')
          map.battle.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('2-63.ç­‰å¾…èƒœåˆ©ç»§ç»­ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal, 2000 },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage, 2000 },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('2-64.ç‚¹å‡»èƒœåˆ©ç»§ç»­')
          map.battle.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('2-65.ç­‰å¾…å¤§ç ´è­¦å‘Šï¼Œæ–°èˆ¹ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage, 2000 },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2, 2000 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_SHIP_SERVER_DAMAGE_MODAL') then

          stepLabel.setStepLabelContent('2-66.å¤§ç ´è­¦å‘Šæ¡†ç‚¹å‡»è¿”å›ž')
          map.battle.clickShipSevereDamageModalBack()
          stepLabel.setStepLabelContent('2-67.ç­‰å¾…æ–°èˆ¹ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          state.battle.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2, 2000 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_SHIP_CANT_GO_ON_MODAL') then

          stepLabel.setStepLabelContent('2-68.æ— æ³•å‰è¿›è­¦å‘Šæ¡†ç‚¹å‡»è¿”å›ž')
          map.battle.clickShipCantGoOnModalBackBtn()
          stepLabel.setStepLabelContent('2-69.ç­‰å¾…æ–°èˆ¹ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          state.battle.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_NEW_SHIP_PAGE') then

          stepLabel.setStepLabelContent('2-70.èŽ·å–æ–°èˆ¹')
          c.yield(sleepPromise(500))
          map.battle.clickNewShip()
          stepLabel.setStepLabelContent('2-71.ç­‰å¾…æ–°èˆ¹é”å®šçª—å£ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.isNewShipPageLockModal },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('2-72.æ–°èˆ¹é”å®šçª—å£ç‚¹å‡»ç¡®è®¤')
          map.battle.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('2-73.ç­‰å¾…ä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.isNewShipPageLockModal, 2000 },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_NEXT_LEVEL_STEP_MODAL') then

          if ((state.battle.battleNum < settings.battleMaxBattleNum) and state.battle.HPIsSafe) then
            stepLabel.setStepLabelContent('2-74.ç‚¹å‡»ç»§ç»­ä¸‹ä¸€å…³')
            map.battle.clickLevelStepModalContinueBtn()
            state.battle.battleNum = state.battle.battleNum + 1
            return { type = 'BATTLE_GO_A_BATTLE' }, state
          else
            stepLabel.setStepLabelContent('2-75.ç‚¹å‡»å›žæ¸¯')
            map.battle.clickLevelStepModalBackBtn()
            stepLabel.setStepLabelContent('2-76.ç­‰å¾…ä¸»ç•Œé¢')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CANT_GO') then

          -- éœ‡åŠ¨æç¤ºä¸èƒ½æˆ˜æ–—
          if (settings.battleAlertWhenNoHp) then
            vibrator(500)
            mSleep(500)
            vibrator(500)
          end

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.battle.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent('2-77.ç­‰å¾…å‡ºå¾ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME') then

          map.battle.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('2-78.ç­‰å¾…ä¸»ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil, state
      end))
    end


    -- é¢†å–ä»»åŠ¡å¥–åŠ±
    missions.mission = function(action, state)
      return co(c.create(function()
        if (action.type == 'MISSION_START') then

          stepLabel.setStepLabelContent('3-1.ç­‰å¾…HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'MISSION_IS_UNRECEIVED_MISSION', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then

          stepLabel.setStepLabelContent('3-2.æ£€æµ‹æ˜¯å¦æœ‰ä»»åŠ¡å¥–åŠ±')
          c.yield(sleepPromise(100))
          local res = map.mission.isUnreceivedMission()
          if (res) then
            return { type = 'MISSION_INIT' }, state
          end
          stepLabel.setStepLabelContent('3-3.æ²¡æœ‰ä»»åŠ¡å¥–åŠ±')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_INIT') then

          stepLabel.setStepLabelContent('3-4ç‚¹å‡»ä»»åŠ¡æŒ‰é’®')
          map.mission.clickMission()
          stepLabel.setStepLabelContent('3-5.ç­‰å¾…ä»»åŠ¡ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'MISSION_INIT', 'homeGroup', map.home.isHome, 2000 },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_PAGE') then

          stepLabel.setStepLabelContent('3-6.ç‚¹å‡»å…¨éƒ¨ä»»åŠ¡')
          map.missionClickAllMission()
          stepLabel.setStepLabelContent('3-7.ç­‰å¾…ä»»åŠ¡å…¨éƒ¨ä»»åŠ¡ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_MISSION_ALL_MISSION') then

          c.yield(sleepPromise(100))
          local res = map.mission.isMissionUnreceivedReward()
          if (not res) then
            stepLabel.setStepLabelContent('3-8.æ²¡æœ‰ä»»åŠ¡å¥–åŠ±')
            return { type = 'MISSION_PAGE_NO_REWAR' }, state
          else
            stepLabel.setStepLabelContent('3-9.æœ‰ä»»åŠ¡å¥–åŠ±')
            map.mission.clickGetFirstReward()
            stepLabel.setStepLabelContent('3-10.ç­‰å¾…èŽ·å¾—é¢æ¿')

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
              { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel },
            }))

            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'MISSION_REWAR_PANNEL') then

          stepLabel.setStepLabelContent('3-11.ç‚¹å‡»ç¡®å®š')
          map.mission.clickRewardPannelOk()
          stepLabel.setStepLabelContent('3-12.ç­‰å¾…æ–°èˆ¹ï¼Œä»»åŠ¡å…¨éƒ¨ä»»åŠ¡')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 1000 },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_NEW_SHIP') then

          stepLabel.setStepLabelContent('3-13.ç‚¹å‡»æ–°èˆ¹')
          map.mission.clickNewShip()
          stepLabel.setStepLabelContent('3-14.ç­‰å¾…æ–°èˆ¹é”å®šï¼Œä»»åŠ¡å…¨éƒ¨ä»»åŠ¡')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('3-15.ç‚¹å‡»æ–°èˆ¹')
          map.mission.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('3-16.ç­‰å¾…ä»»åŠ¡å…¨éƒ¨ä»»åŠ¡')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_PAGE_NO_REWAR') then

          stepLabel.setStepLabelContent('3-17.ç­‰å¾…è¿”å›žhome')
          map.mission.clickBackToHome()

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_PAGE_NO_REWAR', 'missionsGroup', map.mission.isMission, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil
      end))
    end

    -- è¿œå¾å›žæ”¶
    missions.expeditionReward = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXPEDITION_REWARD_START') then

          stepLabel.setStepLabelContent('4-1.ç­‰å¾…HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'EXPEDITION_REWARD_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_INIT') then

          -- è¿œå¾ç« èŠ‚
          state.expeditionReward.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }

          return makeAction('EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED'), state

        elseif (action.type == 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED') then

          stepLabel.setStepLabelContent('4-3.æ£€æµ‹æ˜¯å¦æœ‰è¿œå¾å¥–åŠ±')
          c.yield(sleepPromise(100))
          local res = map.expedition.isExpeditionCompleted()
          if (not res) then
            stepLabel.setStepLabelContent('4-4.æ²¡æœ‰è¿œå¾å¥–åŠ±å’Œä»»åŠ¡')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
            return makeAction(newstateTypes), state
          end
          stepLabel.setStepLabelContent('4-5.ç‚¹å‡»å‡ºå¾')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('4-6.ç­‰å¾…å‡ºå¾ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

          stepLabel.setStepLabelContent('4-7.ç‚¹å‡»è¿œå¾')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('4-8.ç­‰å¾…è¿œå¾ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

          if (#state.expeditionReward.enableChapter > 0) then
            local chapter = state.expeditionReward.enableChapter[1]
            stepLabel.setStepLabelContent('4-9.ç§»åŠ¨åˆ°ç¬¬' .. chapter .. 'ç« ')
            c.yield(sleepPromise(300))
            map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
            state.expedition.lastChapter = chapter
            stepLabel.setStepLabelContent('4-10.æ£€æµ‹æœ¬é¡µæœ‰å¯æ”¶èŽ·å¥–åŠ±')
            return { type = 'EXPEDITION_REWARD_CHECK_HAS_REWARD' }, state
          else
            return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }, state
          end

        elseif (action.type == 'EXPEDITION_REWARD_CHECK_HAS_REWARD') then

          local res, list = map.expedition.isThisExpeditionPageHasReward()
          if (res) then
            local v = list[1]

            -- å½“å›žæ”¶ä¸€ä¸ªè¿œå¾å¥–åŠ±æ—¶ï¼Œå°±éœ€è¦è¿œå¾æ´¾é£
            state.expedition.needExpedition = true

            stepLabel.setStepLabelContent('4-11.ç‚¹å‡»ç¬¬' .. v .. 'èŠ‚')
            map.expedition.clickExpeditionBtn(v)
            stepLabel.setStepLabelContent('4-12.ç­‰å¾…è¿œå¾å®Œæˆé¡µé¢')

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
              { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage },
            }))
            return makeAction(newstateTypes), state
          end

          stepLabel.setStepLabelContent('4-13.æœ¬é¡µæ²¡æœ‰å¯æ”¶èŽ·çš„å¥–åŠ±')
          table.remove(state.expeditionReward.enableChapter, 1)
          return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }, state

        elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then

          map.expedition.clickRewardPannelOk()
          stepLabel.setStepLabelContent('4-14.ç­‰å¾…è¿œå¾ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage, 2000 },
            { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_RETURN_TO_HOME') then

          map.expedition.clickBackToHome()
          stepLabel.setStepLabelContent('4-15.è¿”å›žHOME')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'EXPEDITION_REWARD_RETURN_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil
      end))
    end

    -- è¿œå¾å›žæ”¶


    -- è¿œå¾æ´¾é£èˆ°é˜Ÿ
    missions.expeditionOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXPEDITION_ONCE_START') then

          if (not state.expedition.needExpedition) then
            stepLabel.setStepLabelContent('4-18.è·³è¿‡è¿œå¾æ´¾é£ï¼Œè¿”å›žæ¸¯å£')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
            return makeAction(newstateTypes), state
          end

          if (type(settings.expeditionFleetToChapter) ~= 'table') then
            state.expedition.expeditionFleetToChapter = { false, false, false, false }
          end

          if ((not settings.expeditionFleetToChapter[1])
            and (not settings.expeditionFleetToChapter[2])
            and (not settings.expeditionFleetToChapter[3])
            and (not settings.expeditionFleetToChapter[4])) then
            stepLabel.setStepLabelContent('4-18.æ²¡æœ‰è¿œå¾ä»»åŠ¡ï¼è¿”å›žæ¸¯å£')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
            return makeAction(newstateTypes), state
          end

          stepLabel.setStepLabelContent('4-16.ç­‰å¾…HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_INIT') then
          stepLabel.setStepLabelContent('4-17.å‡†å¤‡è¿œå¾æ´¾é£èˆ°é˜Ÿ')
          -- å‡†å¤‡å¼€å§‹è¿œå¾æ´¾é£èˆ°é˜Ÿä»»åŠ¡

          -- å°†å‡ºå¾æ´¾é£åˆ—è¡¨å¤åˆ¶åˆ°ç¼“å­˜ä¸­
          state.expedition.expeditionFleetToChapter = {}
          for i, v in ipairs(settings.expeditionFleetToChapter) do
            if (v) then
              table.insert(state.expedition.expeditionFleetToChapter, { i, v })
            end
          end


          -- æ­¤ä»»åŠ¡ä½¿ç”¨çš„å˜é‡æ¢å¤é»˜è®¤å€¼
          state.expedition.quickSupplyCount = 0
          state.expedition.quickRepairCount = 0
          state.expedition.quickRepairSingleLastShip = 0
          state.expedition.quickRepairSingleCount = 0
          state.expedition.lastChapter = nil
          state.expedition.fleet = nil
          state.expedition.chapters = nil
          state.expedition.hasShipCantExpedition = false


          stepLabel.setStepLabelContent('4-19.ç‚¹å‡»å‡ºå¾')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('4-20.ç­‰å¾…å‡ºå¾ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattlePage },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then
          -- è¿›å…¥å‡ºå¾å¤§é¡µé¢
          stepLabel.setStepLabelContent('4-21.ç‚¹å‡»è¿œå¾')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('4-22.ç­‰å¾…è¿œå¾ç•Œé¢')


          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_IS_EXPEDITION_PAGE') then
          -- è¿›å…¥è¿œå¾é¡µé¢
          if (#state.expedition.expeditionFleetToChapter > 0) then
            state.expedition.quickSupplyCount = 0
            state.expedition.quickRepairCount = 0

            state.expedition.fleet, state.expedition.chapters = table.unpack(state.expedition.expeditionFleetToChapter[1])

            local chapter, section = table.unpack(strSplit(state.expedition.chapters, '-'))
            if (state.expedition.lastChapter ~= chapter) then
              stepLabel.setStepLabelContent('4-21.ç§»åŠ¨åˆ°ç¬¬' .. chapter .. 'ç« ')
              map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
              state.expedition.lastChapter = chapter
              c.yield(sleepPromise(300))
            end
            stepLabel.setStepLabelContent('4-23.æ£€æµ‹ç¬¬' .. section .. 'èŠ‚èƒ½å¦è¿œå¾')
            c.yield(sleepPromise(200))
            local res = map.expedition.isChapterCanExpedition(section)
            if (res) then
              stepLabel.setStepLabelContent('4-24.ç‚¹å‡»æŒ‰é’®' .. section)
              map.expedition.clickExpeditionBtn(section)
              stepLabel.setStepLabelContent('4-25.ç­‰å¾…è¿œå¾å‡†å¤‡ç•Œé¢')

              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('4-26.æœ¬ç« ä¸èƒ½è¿œå¾')
              -- æ‰§è¡Œä¸‹ä¸€ä¸ªç« èŠ‚
              table.remove(state.expedition.expeditionFleetToChapter, 1)
              return { type = 'EXPEDITION_IS_EXPEDITION_PAGE' }, state
            end
          else
            stepLabel.setStepLabelContent('4-27.æ²¡æœ‰è¿œå¾')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
              { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE') then

          if ((state.expedition.quickSupplyCount <= 0) and (state.expedition.quickRepairCount <= 0)) then
            -- è¿˜æ²¡å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®
            stepLabel.setStepLabelContent('4-28.é€‰æ‹©èˆ°é˜Ÿ' .. state.expedition.fleet)
            map.expedition.clickSelectFleet(state.expedition.fleet)
            stepLabel.setStepLabelContent('4-29.æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸')
            c.yield(sleepPromise(300))
            -- æ£€æµ‹èˆ°é˜Ÿæ˜¯å¦åœ¨æœ€ä½³çŠ¶æ€
            local res = map.expedition.isReadyBattlePageShipStatusAllRight()
            if (res) then
              stepLabel.setStepLabelContent('4-30.çŠ¶æ€æ­£å¸¸')
              state.expedition.quickSupplyCount = 1
              state.expedition.quickRepairCount = 1
              return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('4-31.çŠ¶æ€ä¸æ­£å¸¸')
              map.expedition.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('4-32.ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_QUICK_SUPPLY_MODAL', 'missionsGroup', map.expedition.isQuickSupplyModal },
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
              }))
              return makeAction(newstateTypes), state
            end
          elseif (state.expedition.quickRepairCount <= 0) then
            -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®
            stepLabel.setStepLabelContent('4-33.æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(1000))
            local res = map.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('4-34.è¡€é‡å®‰å…¨')
              state.expedition.quickRepairCount = 1
              return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.expeditionQuickRepair > 0) then
                stepLabel.setStepLabelContent('4-35.è¡€é‡ä¸å®‰å…¨ï¼Œå¿«ä¿®')
                map.expedition.clickQuickRepairBtn()
                stepLabel.setStepLabelContent('4-36.ç­‰å¾…å¿«é€Ÿä¿®ç†ç•Œé¢')

                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal },
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
                }))

                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('4-37.è¡€é‡ä¸å®‰å…¨')
                state.expedition.quickRepairCount = 1
                return { type = 'EXPEDITION_READY_BATTLE_PAGE' }, state
              end
            end
          else
            -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œå·²ç»ç»´ä¿®
            stepLabel.setStepLabelContent('4-38.å†æ¬¡æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(500))
            -- ä¸å…è®¸å¤§ç ´å‡ºå¾
            local res = map.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('4-39.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')
              return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('4-40.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')
              return { type = 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO' }, state
            end
          end

        elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL') then
          -- å¿«é€Ÿè¡¥ç»™ç•Œé¢
          stepLabel.setStepLabelContent('4-41.å¿«é€Ÿè¡¥ç»™ç•Œé¢ç‚¹å‡»ç¡®å®š')
          map.expedition.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('4-42.ç­‰å¾…è¿œå¾å‡†å¤‡ç•Œé¢')
          state.expedition.quickSupplyCount = state.expedition.quickSupplyCount + 1
          if (state.expedition.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_QUICK_SUPPLY_MODAL', 'missionsGroup', map.expedition.isQuickSupplyModal, 2000 },
              { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('4-43.èµ„æºæ•°é‡ä¸è¶³')
            return { type = 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('4-44.ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­')
          c.yield(sleepPromise(100))
          map.expedition.clickQuickSupplyModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickSupplyModal, 2000 },
            { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', 'missionsGroup', map.expedition.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL') then


          if (settings.expeditionQuickRepair == 3) then
            -- ä¸æ»¡è¡€åˆ™å¿«ä¿®
            stepLabel.setStepLabelContent('4-45.ç‚¹å‡»å¿«é€Ÿä¿®ç†ç¡®å®š')
            c.yield(sleepPromise(500))
            map.expedition.clickQuickRepairModalOkBtn()
            state.expedition.quickRepairCount = state.expedition.quickRepairCount + 1
            stepLabel.setStepLabelContent('4-46.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
            if (state.expedition.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('4-47.å¿«ä¿®æ•°é‡ä¸è¶³')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.expeditionQuickRepair == 2) then
            -- ä¸­ç ´æˆ–å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('4-48.å¯»æ‰¾ä¸­ç ´æˆ–å¤§ç ´çš„èˆ¹')
            c.yield(sleepPromise(1000))
            local res = map.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)
            if (#res > 0) then
              if ((state.expedition.quickRepairSingleLastShip ~= res[1]) or (state.expedition.quickRepairSingleCount < 3)) then
                state.expedition.quickRepairSingleLastShip = res[1]
                state.expedition.quickRepairSingleCount = state.expedition.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('4-49.ä¸­ç ´æˆ–å¤§ç ´:' .. table.concat(res, ','))
                map.expedition.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                  { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.expedition.quickRepairSingleLastShip = 0
                state.expedition.quickRepairSingleCount = 0
                state.expedition.quickRepairCount = state.battle.quickRepairCount + 1
                stepLabel.setStepLabelContent('4-50.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('4-51.ä¿®ç†å®Œæˆ')
              state.expedition.quickRepairCount = state.expedition.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.expeditionQuickRepair == 1) then
            -- å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('4-52.å¯»æ‰¾å¤§ç ´çš„èˆ¹')
            c.yield(sleepPromise(1000))
            local res = map.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)
            if (#res > 0) then
              if ((state.expedition.quickRepairSingleLastShip ~= res[1]) or (state.expedition.quickRepairSingleCount < 3)) then
                state.expedition.quickRepairSingleLastShip = res[1]
                state.expedition.quickRepairSingleCount = state.expedition.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('4-53.å¤§ç ´:' .. table.concat(res, ','))
                map.expedition.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                  { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.expedition.quickRepairSingleLastShip = 0
                state.expedition.quickRepairSingleCount = 0
                state.expedition.quickRepairCount = state.battle.quickRepairCount + 1
                stepLabel.setStepLabelContent('4-54.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('4-55.ä¿®ç†å®Œæˆ')
              state.expedition.quickRepairCount = state.expedition.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('4-56.ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­')
          c.yield(sleepPromise(500))
          map.expedition.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('4-57.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal, 2000 },
            { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('4-58.æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾')
          c.yield(sleepPromise(500))
          local fleetCanBattle = map.expedition.isFleetsCanBattle()
          if (fleetCanBattle) then
            stepLabel.setStepLabelContent('4-59.å¯ä»¥å‡ºå¾')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.expedition.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('4-60.è¿”å›ž')
            return makeAction('EXPEDITION_READY_BATTLE_PAGE_CANT_GO'), state
          end

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('4-61.å‡ºå¾å‡†å¤‡ç•Œé¢ï¼Œç‚¹å‡»å‡ºå¾å¼€å§‹')
          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('4-62.ç‚¹å‡»è¿œå¾å¼€å§‹')
          map.expedition.clickBattleStartBtn()
          stepLabel.setStepLabelContent('4-63.ç­‰å¾…æˆ˜æ–—å¼€å§‹')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then
          -- èˆ°é˜Ÿä¸èƒ½è¿œå¾ï¼Œå‡†å¤‡è¿”å›žè¿œå¾é¡µ
          state.expedition.hasShipCantExpedition = true

          -- éœ‡åŠ¨æç¤ºä¸èƒ½è¿œå¾
          if (settings.expeditionAlertWhenNoHp) then
            vibrator(500)
            mSleep(500)
            vibrator(500)
          end

          stepLabel.setStepLabelContent('4-64.ç‚¹å‡»è¿”å›žè¿œå¾ç•Œé¢')
          map.expedition.clickBackToExpedition()

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          }))

          -- å¦‚æžœç¦»å¼€è¿™ä¸€é¡µï¼Œåˆ™ä»Žè¿œå¾é˜Ÿåˆ—é‡Œé€€å‡ºä¸€ä¸ªé˜Ÿä¼
          if (newstateTypes ~= 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then
            table.remove(state.expedition.expeditionFleetToChapter, 1)
          end

          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME') then

          if (not state.expedition.hasShipCantExpedition) then
            state.expedition.needExpedition = false
          end

          stepLabel.setStepLabelContent('4-66.è¿”å›žè¿œå¾é¡µ')
          map.expedition.clickBackToExpedition()
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
            { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME') then

          stepLabel.setStepLabelContent('4-67.è¿”å›žæ¸¯å£')
          map.expedition.clickBackToHome()
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
            { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return makeAction(newstateTypes), state
        end
      end))
    end
    -- è¿œå¾æ´¾é£

    -- ä¿®ç†
    missions.repairOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'REPAIR_ONCE_START') then

          state.repair.repairNum = 0
          -- ç»´ä¿®æ»‘åŠ¨ç•Œé¢æ¬¡æ•°
          state.repair.moveCount = 4

          if (not state.repair.needRepair) then
            stepLabel.setStepLabelContent('5-1.è·³è¿‡ç»´ä¿®ï¼Œè¿”å›žæ¸¯å£')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener()))
            return makeAction(newstateTypes), state
          end

          stepLabel.setStepLabelContent('5-1.ç­‰å¾…HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'REPAIR_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_INIT') then
          state.repair.slot = nil

          stepLabel.setStepLabelContent('5-2.ç‚¹å‡»å‡ºå¾')
          c.yield(sleepPromise(100))
          map.repair.clickDockBtn()
          stepLabel.setStepLabelContent('5-3.ç­‰å¾…èˆ¹åžç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_DOCK_PAGE') then

          stepLabel.setStepLabelContent('5-4.ç‚¹å‡»ä¿®ç†æŒ‰é’®')
          c.yield(sleepPromise(100))
          map.repair.clickRepairBtn()
          stepLabel.setStepLabelContent('5-5.ç­‰å¾…ä¿®ç†ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_REPAIR_PAGE') then

          if (state.repair.repairNum < 6) then
            stepLabel.setStepLabelContent('5-6.æ£€æµ‹ç©ºé—²æ§½ä½')
            c.yield(sleepPromise(500))
            local res, hasList = map.repair.hasEmptyRepairSlot()
            if (res) then
              state.repair.slot = hasList[1]
              stepLabel.setStepLabelContent('5-7.æœ‰ç©ºé—²æ§½ä½')
              stepLabel.setStepLabelContent('5-8.ç‚¹å‡»ç¬¬' .. state.repair.slot .. 'ä¸ªç©ºé—²æ§½ä½')
              c.yield(sleepPromise(100))
              map.repair.clickRepairSlotBtn(state.repair.slot)
              c.yield(sleepPromise(100))
              stepLabel.setStepLabelContent('5-9.æ£€æµ‹ä¿®ç†ç•Œé¢ï¼Œé€‰èˆ¹ç•Œé¢')

              -- å¦‚æžœä¸€æ²¡è¿›å…¥ä¿®èˆ¹é€‰èˆ¹é¡µé¢è¯´æ˜Žæ²¡æœ‰éœ€è¦ç»´ä¿®çš„èˆ¹
              local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
                { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage },
                { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
              }))

              if (newstateTypes == 'REPAIR_REPAIR_FINISH') then
                state.repair.needRepair = false
                stepLabel.setStepLabelContent('5-10.æ²¡æœ‰èˆ¹éœ€è¦ç»´ä¿®')
              end

              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('5-11.æ²¡æœ‰ç©ºä½')
              state.repair.needRepair = true

              local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
                { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
              }))
              return makeAction(newstateTypes), state
            end
          else
            stepLabel.setStepLabelContent('5-12.ç»´ä¿®å‡ºçŽ°æ„å¤–')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then

          if (settings.repairAll) then
            stepLabel.setStepLabelContent('5-13.é€‰æ‹©ç¬¬ä¸€ä¸ªèˆ¹')
            c.yield(sleepPromise(200))
            map.repair.clickFirstShip()

            state.repair.repairNum = state.repair.repairNum + 1
            stepLabel.setStepLabelContent('5-14.ç­‰å¾…è¿”å›žä¿®ç†ç•Œé¢')

            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
              { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
            }))

            return makeAction(newstateTypes), state
          else
            if (state.repair.moveCount > 0) then
              stepLabel.setStepLabelContent('5-15.å¯»æ‰¾ä¸€ä¸ªä¸åœ¨èˆ°é˜Ÿé‡Œçš„èˆ¹')
              c.yield(sleepPromise(600))
              local point = map.repair.findFirstShipNotInFleet()
              if (point) then
                stepLabel.setStepLabelContent('5-16.æ‰¾åˆ° [' .. point[1] .. ',' .. point[2] .. ']ï¼Œç‚¹å‡»')
                map.repair.clickAShip(point)
                state.repair.repairNum = state.repair.repairNum + 1
              else
                -- æ²¡æ‰¾åˆ°ç‚¹ï¼Œç§»åŠ¨ä¸€æ¬¡
                stepLabel.setStepLabelContent('5-17.æ²¡æ‰¾åˆ°ï¼Œå‘å·¦æ»‘ä¸€æ¬¡')
                map.repair.moveToNextPage()
                state.repair.moveCount = state.repair.moveCount - 1

                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
                  { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage },
                }))

                return makeAction(newstateTypes), state
              end
            end

            stepLabel.setStepLabelContent('5-18.ç­‰å¾…è¿”å›žä¿®ç†ç•Œé¢')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
              { 'REPAIR_SELECT_SHIP_PAGE_RETURN', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
            }))

            if (newstateTypes == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then
              state.repair.needRepair = false
              stepLabel.setStepLabelContent('5-19.æ²¡æœ‰éœ€è¦ä¿®ç†çš„èˆ¹')
            end

            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then

          stepLabel.setStepLabelContent('5-20.ç­‰å¾…ç¬¬' .. state.repair.slot .. 'ä¸ªæ§½ä½å˜æˆä¿®ç†çŠ¶æ€')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isSlotNotEmpty(state.repair.slot) },
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then

          stepLabel.setStepLabelContent('5-21.æ²¡æœ‰å¯ä»¥ä¿®çš„èˆ¹ï¼Œè¿”å›žç»´ä¿®é¡µé¢')
          map.repair.clickSelectShipPageBackBtn()

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_SELECT_SHIP_PAGE_RETURN', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_REPAIR_FINISH') then

          stepLabel.setStepLabelContent('5-22.å®Œæˆç»´ä¿®')
          map.repair.clickBackToHomeBtn()

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil, state
      end))
    end
    -- ä¿®ç†

    -- æ¼”ä¹ 
    missions.exerciseOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXERCISE_START') then
          stepLabel.setStepLabelContent('6-1.ç­‰å¾…home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_INIT') then

          state.exercise.quickSupplyCount = 0
          state.exercise.quickRepairCount = 0
          state.exercise.quickRepairSingleLastShip = 0
          state.exercise.quickRepairSingleCount = 0
          state.exercise.battleNum = 1
          state.exercise.HPIsSafe = true

          stepLabel.setStepLabelContent('6-2.ç‚¹å‡»å‡ºå¾')
          map.home.clickBattleBtn()
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('6-3.ç‚¹å‡»æ¼”ä¹ ')
          map.exercise.clickExerciseBtn()
          stepLabel.setStepLabelContent('6-4.ç­‰å¾…æ¼”ä¹ é¡µé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome },
            { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage, 2000 },
            { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_EXERCISE_PAGE') then

          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('6-5.å¯»æ‰¾æ¼”ä¹ å¯¹æ‰‹')
          local res, exeList = map.exercise.isExercisePageHaveExercise()
          local nBtn = exeList[1]
          if (type(nBtn) ~= 'nil') then
            stepLabel.setStepLabelContent('6-6.å‘çŽ°æ¼”ä¹ å¯¹æ‰‹' .. nBtn)
            map.exercise.clickToNExerciseBtn(nBtn)
            stepLabel.setStepLabelContent('6-7.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage, 2000 },
              { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage, 2000 },
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('6-8.æ²¡æœ‰å¯ä»¥æŒ‘æˆ˜çš„äºº')
            return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
          end

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE') then

          if ((state.exercise.quickSupplyCount <= 0) and (state.exercise.quickRepairCount <= 0)) then
            stepLabel.setStepLabelContent('6-9.é€‰æ‹©èˆ°é˜Ÿ:' .. settings.exerciseFleet)
            map.exercise.selectFleet(settings.exerciseFleet)
            stepLabel.setStepLabelContent('6-10.æ£€æµ‹æ‰€æœ‰çŠ¶æ€')
            c.yield(sleepPromise(1000))
            local res = map.exercise.isReadyBattlePageShipStatusAllRight()
            if (res) then
              stepLabel.setStepLabelContent('6-10.çŠ¶æ€æ­£å¸¸')
              state.exercise.quickSupplyCount = 1
              state.exercise.quickRepairCount = 1
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('6-11.çŠ¶æ€ä¸æ­£å¸¸')
              map.exercise.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('6-12.ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
                { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal },
              }))
              return makeAction(newstateTypes), state
            end
          elseif (state.exercise.quickRepairCount <= 0) then
            stepLabel.setStepLabelContent('6-13.æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(1000))
            local res = map.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('6-14.è¡€é‡å®‰å…¨')
              state.exercise.quickRepairCount = 1
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.exerciseQuickRepair > 0) then
                stepLabel.setStepLabelContent('6-15.è¡€é‡ä¸å®‰å…¨ï¼Œç‚¹å‡»å¿«ä¿®')
                map.exercise.clickQuickRepairBtn()
                stepLabel.setStepLabelContent('6-16.ç­‰å¾…å¿«ä¿®ç•Œé¢')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
                  { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('6-17.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')
                return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }, state
              end
            end
          else
            stepLabel.setStepLabelContent('6-18.å†æ¬¡æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(1000))
            -- ä¸å…è®¸å¤§ç ´å‡ºå¾
            local res = map.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('6-19.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('6-20.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }, state
            end
          end

        elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('6-22.å¿«é€Ÿè¡¥ç»™ç•Œé¢ç‚¹å‡»ç¡®å®š')
          map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('6-23.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          state.exercise.quickSupplyCount = state.exercise.quickSupplyCount + 1
          if (state.exercise.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('6-24.èµ„æºæ•°é‡ä¸è¶³')
            return { type = 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('6-25.ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­')
          c.yield(sleepPromise(100))
          map.exercise.clickQuickSupplyModalCloseBtn()
          stepLabel.setStepLabelContent('6-26.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL') then

          if (settings.exerciseQuickRepair == 3) then
            -- ä¸æ»¡è¡€åˆ™å¿«ä¿®
            stepLabel.setStepLabelContent('6-27.ç‚¹å‡»å¿«é€Ÿä¿®ç†ç¡®å®š')
            c.yield(sleepPromise(500))
            map.exercise.clickQuickRepairModalOkBtn()
            state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
            stepLabel.setStepLabelContent('6-28.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
            if (state.exercise.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('6-29.å¿«é€Ÿä¿®ç†æ•°é‡ä¸è¶³')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.exerciseQuickRepair == 2) then
            -- ä¸­ç ´æˆ–å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('6-30.å¯»æ‰¾ä¸­ç ´æˆ–å¤§ç ´çš„èˆ¹')
            c.yield(sleepPromise(1000))
            local res = map.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
            if (#res > 0) then

              if ((state.exercise.quickRepairSingleLastShip ~= res[1]) or (state.exercise.quickRepairSingleCount < 3)) then
                state.exercise.quickRepairSingleLastShip = res[1]
                state.exercise.quickRepairSingleCount = state.exercise.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('6-31.ä¸­ç ´æˆ–å¤§ç ´:' .. table.concat(res, ','))
                map.exercise.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                  { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.exercise.quickRepairSingleLastShip = 0
                state.exercise.quickRepairSingleCount = 0
                state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
                stepLabel.setStepLabelContent('6-32.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                  { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('6-33.ä¿®ç†å®Œæˆ')
              state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.exerciseQuickRepair == 1) then
            -- å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('6-34.å¯»æ‰¾å¤§ç ´çš„èˆ¹')
            c.yield(sleepPromise(1000))
            local res = map.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
            if (#res > 0) then
              if ((state.exercise.quickRepairSingleLastShip ~= res[1]) or (state.exercise.quickRepairSingleCount < 3)) then
                state.exercise.quickRepairSingleLastShip = res[1]
                state.exercise.quickRepairSingleCount = state.exercise.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('6-35.å¤§ç ´:' .. table.concat(res, ','))
                map.exercise.clickQuickRepairModalSingleShip(res[1])
                c.yield(sleepPromise(500))
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                  { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                state.exercise.quickRepairSingleLastShip = 0
                state.exercise.quickRepairSingleCount = 0
                state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
                stepLabel.setStepLabelContent('6-36.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                  { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('6-37.ä¿®ç†å®Œæˆ')
              state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('6-38.ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­')
          c.yield(sleepPromise(500))
          map.exercise.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('6-39.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('6-40.æ£€æµ‹èˆ°é˜Ÿæ˜¯å¦å¯ä»¥å‡ºå¾')
          c.yield(sleepPromise(300))
          local fleetCanBattle = map.exercise.isFleetsCanBattle()
          if (not fleetCanBattle) then

            stepLabel.setStepLabelContent('6-41.èˆ°é˜Ÿæ— æ³•æˆ˜æ–—')
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }, state
          else
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
          end

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('6-42.å‡ºå¾å‡†å¤‡ç•Œé¢å‡ºå¾å¼€å§‹')
          c.yield(sleepPromise(100))
          map.exercise.clickBattleStartBtn()
          return { type = 'EXERCISE_GO_A_EXERCISE' }, state

        elseif (action.type == 'EXERCISE_GO_A_EXERCISE') then

          stepLabel.setStepLabelContent('6-43.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢ï¼Œ...')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_GO_A_EXERCISE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_START_PAGE') then

          stepLabel.setStepLabelContent('6-44.å¼€å§‹é¢æ¿ï¼Œç‚¹å‡»å¼€å§‹')
          c.yield(sleepPromise(100))
          map.exercise.clickBattleStartModalStartBtn()
          stepLabel.setStepLabelContent('6-45.ç­‰å¾…é˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_GO_A_EXERCISE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage, 2000 },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('6-46.é˜µåž‹é¢æ¿')
          c.yield(sleepPromise(100))
          map.exercise.clickFormationPageStartBtn(settings.exerciseFormation)
          stepLabel.setStepLabelContent('6-47.ç­‰å¾…è¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage, 2000 },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_PURSUE_MODAL') then

          stepLabel.setStepLabelContent('6-48.è¿½å‡»é¢æ¿')
          c.yield(sleepPromise(100))
          if (settings.exercisePursue) then
            stepLabel.setStepLabelContent('6-49.è¿½å‡»')
            map.exercise.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('6-50.æ”¾å¼ƒè¿½å‡»')
            map.exercise.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('6-51.ç­‰å¾…èƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal, 2000 },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_VICTORY_PAGE') then

          stepLabel.setStepLabelContent('6-52.ç‚¹å‡»èƒœåˆ©ç»§ç»­')
          map.exercise.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('6-53.ç­‰å¾…èƒœåˆ©ç»§ç»­ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage, 2000 },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('6-54.ç‚¹å‡»èƒœåˆ©ç»§ç»­')
          map.exercise.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('6-55.ç­‰å¾…æ¼”ä¹ ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2, 2000 },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CANT_GO') then

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.exercise.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent("6-56.ç­‰å¾…å‡ºå¾ç•Œé¢")
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME') then

          stepLabel.setStepLabelContent('6-57.ç‚¹å‡»å›žæ¸¯')
          map.exercise.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('6-68.ç­‰å¾…home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage, 2000 },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage, 2000 },
          }))
          return makeAction(newstateTypes), state
        end
        return nil, state
      end))
    end
    -- æ¼”ä¹ 

    -- æˆ˜å½¹
    missions.campaignOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'CAMPAIGN_START') then
          stepLabel.setStepLabelContent('7-1.ç­‰å¾…home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_INIT') then

          state.campaign.quickSupplyCount = 0
          state.campaign.quickRepairCount = 0
          state.campaign.quickRepairSingleLastShip = 0
          state.campaign.quickRepairSingleCount = 0
          state.campaign.battleNum = 1
          state.campaign.HPIsSafe = true
          -- å‡ºå¾åŽå°±åº”è¯¥éœ€è¦ç»´ä¿®
          state.repair.needRepair = true

          stepLabel.setStepLabelContent('7-2.ç‚¹å‡»å‡ºå¾')
          map.home.clickBattleBtn()
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome, 2000 },
            { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('7-3.ç‚¹å‡»æˆ˜å½¹')
          map.campaign.clickCampaignBtn()
          stepLabel.setStepLabelContent('7-4.ç­‰å¾…æˆ˜å½¹é¡µé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome },
            { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage, 2000 },
            { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_CAMPAIGN_PAGE') then

          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('7-5.ç§»åŠ¨åˆ°æˆ˜å½¹' .. settings.campaignChapter)
          map.campaign.moveToCampaignMission(settings.campaignChapter)
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('7-6.ç‚¹å‡»æˆ˜å½¹')
          map.campaign.clickCampainReadyBtn(settings.campaignDifficulty)
          stepLabel.setStepLabelContent('7-7.ç­‰å¾…æˆ˜å½¹å‡†å¤‡ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage, 2000 },
            { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage, 2000 },
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE') then

          if ((state.campaign.quickSupplyCount <= 0) and (state.campaign.quickRepairCount <= 0)) then
            stepLabel.setStepLabelContent('7-10.æ£€æµ‹æ‰€æœ‰çŠ¶æ€')
            c.yield(sleepPromise(1000))
            local res = map.campaign.isReadyBattlePageShipStatusAllRight()
            if (not res) then
              stepLabel.setStepLabelContent('7-11.çŠ¶æ€ä¸æ­£å¸¸')
              map.campaign.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('7-12.ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
                { 'CAMPAIGN_QUICK_SUPPLY_MODAL', 'missionsGroup', map.campaign.isQuickSupplyModal },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('7-11.çŠ¶æ€æ­£å¸¸')
              state.campaign.quickSupplyCount = state.campaign.quickSupplyCount + 1
              return { type = 'CAMPAIGN_READY_BATTLE_PAGE' }, state
            end
          elseif (state.campaign.quickRepairCount <= 0) then
            stepLabel.setStepLabelContent('7-13.æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(1000))
            local res = map.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))
            if (res) then
              state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
              stepLabel.setStepLabelContent('7-14.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')
              return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              if (settings.campaignQuickRepair > 0) then
                stepLabel.setStepLabelContent('7-15.è¡€é‡ä¸å®‰å…¨ï¼Œç‚¹å‡»å¿«ä¿®')
                map.campaign.clickQuickRepairBtn()
                stepLabel.setStepLabelContent('7-16.ç­‰å¾…å¿«ä¿®ç•Œé¢')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('7-17.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')
                return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }, state
              end
            end
          else
            stepLabel.setStepLabelContent('7-18.å†æ¬¡æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(1000))
            -- ä¸å…è®¸å¤§ç ´å‡ºå¾
            local res = map.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('7-19.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')
              return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('7-20.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')
              return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }, state
            end
          end

        elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('7-22.å¿«é€Ÿè¡¥ç»™ç•Œé¢ç‚¹å‡»ç¡®å®š')
          map.campaign.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('7-23.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          state.campaign.quickSupplyCount = state.campaign.quickSupplyCount + 1
          if (state.campaign.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_SUPPLY_MODAL', 'missionsGroup', map.campaign.isQuickSupplyModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('7-24.èµ„æºæ•°é‡ä¸è¶³')
            return { type = 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('7-25.ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­')
          c.yield(sleepPromise(100))
          map.campaign.clickQuickSupplyModalCloseBtn()
          stepLabel.setStepLabelContent('7-26.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickSupplyModal, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL') then

          if (settings.campaignQuickRepair == 3) then
            stepLabel.setStepLabelContent('7-27.ç‚¹å‡»å¿«é€Ÿä¿®ç†ç¡®å®š')
            map.campaign.clickQuickRepairModalOkBtn()
            state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
            stepLabel.setStepLabelContent('7-28.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
            if (state.campaign.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('7-29.å¿«ä¿®æ•°é‡ä¸è¶³')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.campaignQuickRepair == 2) then
            -- ä¸­ç ´æˆ–å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('7-30.å¯»æ‰¾ä¸­ç ´æˆ–å¤§ç ´çš„èˆ¹')
            c.yield(sleepPromise(1000))
            local res = map.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
            if (#res > 0) then
              if ((state.campaign.quickRepairSingleLastShip ~= res[1]) or (state.campaign.quickRepairSingleCount < 3)) then
                state.campaign.quickRepairSingleLastShip = res[1]
                state.campaign.quickRepairSingleCount = state.campaign.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('7-31.ä¸­ç ´æˆ–å¤§ç ´:' .. table.concat(res, ','))
                map.campaign.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.campaign.quickRepairSingleLastShip = 0
                state.campaign.quickRepairSingleCount = 0
                state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
                stepLabel.setStepLabelContent('7-32.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('7-33.ä¿®ç†å®Œæˆ')
              state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.campaignQuickRepair == 1) then
            -- å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('7-34.å¯»æ‰¾å¤§ç ´çš„èˆ¹')

            c.yield(sleepPromise(500))
            local res = map.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
            if (#res > 0) then
              if ((state.campaign.quickRepairSingleLastShip ~= res[1]) or (state.campaign.quickRepairSingleCount < 3)) then
                state.campaign.quickRepairSingleLastShip = res[1]
                state.campaign.quickRepairSingleCount = state.campaign.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('7-35.å¤§ç ´:' .. table.concat(res, ','))
                map.campaign.clickQuickRepairModalSingleShip(res[1])
                c.yield(sleepPromise(500))
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                state.campaign.quickRepairSingleLastShip = 0
                state.campaign.quickRepairSingleCount = 0
                state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
                stepLabel.setStepLabelContent('7-36.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('7-37.ä¿®ç†å®Œæˆ')
              state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('7-38.ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­')
          c.yield(sleepPromise(500))
          map.campaign.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal, 2000 },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('7-39.å‡ºå¾å‡†å¤‡ç•Œé¢å‡ºå¾å¼€å§‹')
          c.yield(sleepPromise(100))
          map.campaign.clickBattleStartBtn()
          -- å¦‚æžœæ²¡æœ‰å¼€å§‹è¯´æ˜Žæ— æ³•è¿œå¾
          return { type = 'CAMPAIGN_GO_A_EXERCISE' }, state

        elseif (action.type == 'CAMPAIGN_GO_A_EXERCISE') then

          stepLabel.setStepLabelContent('7-40.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢ï¼Œ...')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO', 'missionsGroup', map.campaign.isReadyBattlePage, 3000 },
            { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage },
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_START_PAGE') then

          stepLabel.setStepLabelContent('7-41.å¼€å§‹é¢æ¿ï¼Œç‚¹å‡»å¼€å§‹')
          c.yield(sleepPromise(100))
          map.campaign.clickBattleStartModalStartBtn()
          stepLabel.setStepLabelContent('7-42.ç­‰å¾…é˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_GO_A_EXERCISE', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage, 2000 },
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('7-43.é˜µåž‹é¢æ¿')
          c.yield(sleepPromise(100))
          map.campaign.clickFormationPageStartBtn(settings.exerciseFormation)
          stepLabel.setStepLabelContent('7-44.ç­‰å¾…è¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage },
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage, 2000 },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_PURSUE_MODAL') then

          stepLabel.setStepLabelContent('7-45.è¿½å‡»é¢æ¿')
          c.yield(sleepPromise(100))
          if (settings.exercisePursue) then
            stepLabel.setStepLabelContent('7-46.è¿½å‡»')
            map.campaign.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('7-47.æ”¾å¼ƒè¿½å‡»')
            map.campaign.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('7-48.ç­‰å¾…èƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal, 2000 },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_VICTORY_PAGE') then

          stepLabel.setStepLabelContent('7-49.ç‚¹å‡»èƒœåˆ©ç»§ç»­')
          map.campaign.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('7-50.ç­‰å¾…èƒœåˆ©ç»§ç»­ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage, 2000 },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('7-51.ç‚¹å‡»èƒœåˆ©ç»§ç»­')
          map.campaign.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('7-52.ç­‰å¾…æ¼”ä¹ ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2, 2000 },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO') then

          -- éœ‡åŠ¨æç¤ºä¸èƒ½æˆ˜æ–—
          if (settings.campaignAlertWhenNoHp) then
            vibrator(500)
            mSleep(500)
            vibrator(500)
          end

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.campaign.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent("7-53.ç­‰å¾…å‡ºå¾ç•Œé¢")
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_BATTLE_PAGE2') then

          stepLabel.setStepLabelContent('7-54.ç‚¹å‡»å›žæ¸¯')
          map.campaign.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('7-55.ç­‰å¾…home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state
        end
        return nil, state
      end))
    end
    -- æˆ˜å½¹

    missions.activityOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'ACTIVITY_START') then

          stepLabel.setStepLabelContent('20-1.ç­‰å¾…home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'ACTIVITY_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_INIT') then

          state.activity.quickSupplyCount = 0
          state.activity.quickRepairCount = 0
          state.activity.quickRepairSingleLastShip = 0
          state.activity.quickRepairSingleCount = 0
          state.activity.HPIsSafe = true
          state.activity.battleNum = 1
          state.activity.HPIsSafe = true
          -- å‡ºå¾åŽå°±åº”è¯¥éœ€è¦ç»´ä¿®
          state.repair.needRepair = true

          stepLabel.setStepLabelContent('20-2.æ˜¯å¦æœ‰æ´»åŠ¨æŒ‰é’®')
          local res = map.activity.haveHomeActivityBtn()
          if (res) then
            stepLabel.setStepLabelContent('20-3.ç‚¹å‡»å‡ºå¾')
            map.activity.clickHomeActivityBtn()
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'ACTIVITY_INIT', 'missionsGroup', map.home.isHome, 2000 },
              { 'ACTIVITY_ACTIVITY_PAGE', 'missionsGroup', map.activity.isActivityPage },
              { 'ACTIVITY_ACTIVITY_INFO_PAGE', 'missionsGroup', map.activity.isActivityInfoPage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('20-4.æ²¡æœ‰æ´»åŠ¨æŒ‰é’®')
            return nil, state
          end

        elseif (action.type == 'ACTIVITY_ACTIVITY_PAGE') then

          stepLabel.setStepLabelContent('20-5.ç‚¹å‡»ç« èŠ‚ ' .. settings.activityChapter)
          map.activity.clickChapter(settings.activityChapter)
          stepLabel.setStepLabelContent('20-6.ç­‰å¾…æˆ˜å½¹é¡µé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_INIT', 'missionsGroup', map.home.isHome },
            { 'ACTIVITY_ACTIVITY_PAGE', 'missionsGroup', map.activity.isActivityPage, 2000 },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_ACTIVITY_INFO_PAGE') then

          map.activity.clickActivityReadyBattleBtn()
          stepLabel.setStepLabelContent('20-6.ç­‰å¾…æˆ˜å½¹é¡µé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_INIT', 'missionsGroup', map.home.isHome },
            { 'ACTIVITY_ACTIVITY_PAGE', 'missionsGroup', map.activity.isActivityPage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE', 'missionsGroup', map.activity.isActivityInfoPage, 2000 },
            { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE') then

          if ((state.activity.quickSupplyCount <= 0) and (state.activity.quickRepairCount <= 0)) then
            -- è¿˜æ²¡å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®
            stepLabel.setStepLabelContent('20-11.é€‰æ‹©èˆ°é˜Ÿ:' .. settings.battleFleet)
            map.activity.selectFleet(settings.activityFleet)
            stepLabel.setStepLabelContent('20-12.æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸')
            c.yield(sleepPromise(1000))
            local res = map.activity.isReadyBattlePageShipStatusAllRight()
            if (res) then
              stepLabel.setStepLabelContent('20-13.çŠ¶æ€æ­£å¸¸')
              state.activity.quickSupplyCount = 1
              state.activity.quickRepairCount = 1
              return { type = 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('20-14.çŠ¶æ€ä¸æ­£å¸¸')
              map.activity.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('20-12.ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage, 2000 },
                { 'ACTIVITY_QUICK_SUPPLY_MODAL', 'missionsGroup', map.activity.isQuickSupplyModal },
              }))
              return makeAction(newstateTypes), state
            end
          elseif (state.activity.quickRepairCount <= 0) then
            -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®
            stepLabel.setStepLabelContent('20-15.æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(1000))
            local res = map.activity.isReadyBattlePageShipHPSafe(math.max(1, settings.activityQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('20-16.è¡€é‡å®‰å…¨')
              state.activity.quickRepairCount = 1
              return { type = 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.activityQuickRepair > 0) then
                stepLabel.setStepLabelContent('20-17.è¡€é‡ä¸å®‰å…¨ï¼Œå¿«ä¿®')
                map.activity.clickQuickRepairBtn()
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage, 2000 },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL', 'missionsGroup', map.activity.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('20-18.è¡€é‡ä¸å®‰å…¨')
                state.activity.quickRepairCount = 1
                return { type = 'ACTIVITY_READY_BATTLE_PAGE' }, state
              end
            end
          else
            -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œå·²ç»ç»´ä¿®
            stepLabel.setStepLabelContent('20-19.å†æ¬¡æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')
            c.yield(sleepPromise(500))
            -- ä¸å…è®¸å¤§ç ´å‡ºå¾
            local res = map.activity.isReadyBattlePageShipHPSafe(math.max(1, settings.activityQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('20-20.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')
              return { type = 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('20-21.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')
              return { type = 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
            end
          end

        elseif (action.type == 'ACTIVITY_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('20-22.å¿«é€Ÿè¡¥ç»™ç•Œé¢ç‚¹å‡»ç¡®å®š')
          map.activity.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('20-23.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          state.activity.quickSupplyCount = state.activity.quickSupplyCount + 1
          if (state.activity.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
              { 'ACTIVITY_QUICK_SUPPLY_MODAL', 'missionsGroup', map.activity.isQuickSupplyModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('20-24.èµ„æºæ•°é‡ä¸è¶³')
            return { type = 'ACTIVITY_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'ACTIVITY_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('20-25.ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­')
          c.yield(sleepPromise(100))
          map.activity.clickQuickSupplyModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickSupplyModal, 2000 },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_QUICK_REPAIR_MODAL') then

          if (settings.activityQuickRepair == 3) then
            -- ä¸æ»¡è¡€åˆ™å¿«ä¿®
            stepLabel.setStepLabelContent('20-26.ç‚¹å‡»å¿«é€Ÿä¿®ç†ç¡®å®š')
            c.yield(sleepPromise(500))
            map.activity.clickQuickRepairModalOkBtn()
            state.activity.quickRepairCount = state.activity.quickRepairCount + 1
            stepLabel.setStepLabelContent('20-27.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
            if (state.activity.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                { 'ACTIVITY_QUICK_REPAIR_MODAL', 'missionsGroup', map.activity.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('20-28.å¿«ä¿®æ•°é‡ä¸è¶³')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.activityQuickRepair == 2) then
            -- ä¸­ç ´æˆ–å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('20-29.å¯»æ‰¾ä¸­ç ´æˆ–å¤§ç ´çš„èˆ¹')
            c.yield(sleepPromise(1000))
            local res = map.activity.isQuickRepairModalShipNeedRepair(settings.activityQuickRepair)
            if (#res > 0) then
              if ((state.activity.quickRepairSingleLastShip ~= res[1]) or (state.activity.quickRepairSingleCount < 3)) then
                state.activity.quickRepairSingleLastShip = res[1]
                state.activity.quickRepairSingleCount = state.activity.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('20-30.ä¸­ç ´æˆ–å¤§ç ´:' .. table.concat(res, ','))
                map.activity.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL', 'missionsGroup', map.activity.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.activity.quickRepairSingleLastShip = 0
                state.activity.quickRepairSingleCount = 0
                state.activity.quickRepairCount = state.activity.quickRepairCount + 1
                stepLabel.setStepLabelContent('20-31.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('20-32.ä¿®ç†å®Œæˆ')
              state.activity.quickRepairCount = state.activity.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.activityQuickRepair == 1) then
            -- å¤§ç ´å¿«ä¿®
            stepLabel.setStepLabelContent('20-33.å¯»æ‰¾å¤§ç ´çš„èˆ¹')
            c.yield(sleepPromise(1000))
            local res = map.activity.isQuickRepairModalShipNeedRepair(settings.activityQuickRepair)
            if (#res > 0) then
              if ((state.activity.quickRepairSingleLastShip ~= res[1]) or (state.activity.quickRepairSingleCount < 3)) then
                state.activity.quickRepairSingleLastShip = res[1]
                state.activity.quickRepairSingleCount = state.activity.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('20-34.å¤§ç ´:' .. table.concat(res, ','))
                map.activity.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL', 'missionsGroup', map.activity.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.activity.quickRepairSingleLastShip = 0
                state.activity.quickRepairSingleCount = 0
                state.activity.quickRepairCount = state.activity.quickRepairCount + 1
                stepLabel.setStepLabelContent('20-35.å¿«ä¿®æ•°é‡ä¸è¶³')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('20-36.ä¿®ç†å®Œæˆ')
              state.activity.quickRepairCount = state.activity.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('20-37.ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­')
          c.yield(sleepPromise(500))
          map.activity.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('20-38.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal, 2000 },
            { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('20-39.æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾')
          c.yield(sleepPromise(500))
          local fleetCanBattle = map.activity.isFleetsCanBattle()
          if (fleetCanBattle) then
            stepLabel.setStepLabelContent('20-40.å¯ä»¥å‡ºå¾')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'ACTIVITY_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.activity.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('20-41.è¿”å›žHOME')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('20-42.å‡ºå¾å‡†å¤‡ç•Œé¢ï¼Œç‚¹å‡»å‡ºå¾å¼€å§‹')
          c.yield(sleepPromise(100))
          map.activity.clickBattleStartBtn()
          return { type = 'ACTIVITY_GO_A_BATTLE' }, state

        elseif (action.type == 'ACTIVITY_GO_A_BATTLE') then

          if (state.activity.battleNum < settings.activityMaxBattleNum) then
            stepLabel.setStepLabelContent('20-43.ç¬¬' .. state.activity.battleNum .. 'æˆ˜å¼€å§‹')
          else
            stepLabel.setStepLabelContent('20-44.ç¬¬' .. state.activity.battleNum .. 'æˆ˜Bossæˆ˜å¼€å§‹')
          end
          stepLabel.setStepLabelContent('20-45.ç­‰å¾…é¢å¤–èŽ·å¾—é¢æ¿ï¼Œå¼€å§‹é¢æ¿ï¼Œé˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhomeï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.activity.isReadyBattlePage, 2000 },
            { 'ACTIVITY_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.activity.isExtraReceiveModal },
            { 'ACTIVITY_BATTLE_START_PAGE', 'missionsGroup', map.activity.isBattleStartPage },
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            -- { 'ACTIVITY_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.activity.isNewShipPageLockModal },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_EXTRA_RECEIVE_MODAL') then

          stepLabel.setStepLabelContent('20-46.é¢å¤–èŽ·å¾—é¢æ¿ï¼Œç‚¹å‡»ç¡®å®š')
          map.activity.clickExtraReceiveModalOk()
          state.activity.battleNum = state.activity.battleNum + 1
          stepLabel.setStepLabelContent('20-47.ç­‰å¾…é¢å¤–èŽ·å¾—é¢æ¿ï¼Œå¼€å§‹é¢æ¿ï¼Œé˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhomeï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.activity.isExtraReceiveModal, 2000 },
            { 'ACTIVITY_BATTLE_START_PAGE', 'missionsGroup', map.activity.isBattleStartPage },
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_BATTLE_START_PAGE') then

          stepLabel.setStepLabelContent('20-48.å¼€å§‹é¢æ¿ï¼Œç‚¹å‡»å¼€å§‹')
          c.yield(sleepPromise(200))
          if (settings.activityRoundabout and map.activity.isBattleStartPageCanRoundabout()) then
            map.activity.clickBattleStartModalRoundaboutBtn()
          else
            map.activity.clickBattleStartModalStartBtn()
          end
          stepLabel.setStepLabelContent('20-49.ç­‰å¾…é˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_BATTLE_START_PAGE', 'missionsGroup', map.activity.isBattleStartPage, 2000 },
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('20-50.é˜µåž‹é¢æ¿')
          c.yield(sleepPromise(100))
          map.activity.clickFormationPageStartBtn(settings.activityFormation)
          stepLabel.setStepLabelContent('20-51.ç­‰å¾…è¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_BATTLE_START_PAGE', 'missionsGroup', map.activity.isBattleStartPage, 2000 },
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage, 2000 },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_PURSUE_PAGE') then

          stepLabel.setStepLabelContent('20-52.è¿½å‡»é¢æ¿')
          if ((settings.activityPursue and (state.activity.battleNum < settings.activityMaxBattleNum))
            or (settings.activityPursueBoss and (state.activity.battleNum == settings.activityMaxBattleNum))) then
            stepLabel.setStepLabelContent('20-53.è¿½å‡»')
            map.activity.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('20-54.æ”¾å¼ƒè¿½å‡»')
            map.activity.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('20-55.ç­‰å¾…èƒœåˆ©ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage, 2000 },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal, 2000 },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_VICTORY_PAGE') then

          c.yield(sleepPromise(1000))
          stepLabel.setStepLabelContent('20-56.èƒœåˆ©ç•Œé¢æ£€æµ‹HPæ˜¯å¦å®‰å…¨')
          c.yield(sleepPromise(300))
          -- æœ‰å¤§ç ´å°±å›žæ¸¯
          state.activity.HPIsSafe = map.activity.isVictoryPageShipHPSafe(1)
          if (state.activity.HPIsSafe) then
            stepLabel.setStepLabelContent('20-57.HPå®‰å…¨')
          else
            stepLabel.setStepLabelContent('20-58.HPä¸å®‰å…¨')
          end
          c.yield(sleepPromise(200))
          stepLabel.setStepLabelContent('20-59.ç‚¹å‡»èƒœåˆ©ç»§ç»­')
          map.activity.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('20-60.ç­‰å¾…èƒœåˆ©ç»§ç»­ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal, 2000 },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage, 2000 },
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('20-61.ç‚¹å‡»èƒœåˆ©ç»§ç»­')
          map.activity.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('20-62.ç­‰å¾…å¤§ç ´è­¦å‘Šï¼Œæ–°èˆ¹ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage, 2000 },
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2, 2000 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL') then

          stepLabel.setStepLabelContent('20-63.å¤§ç ´è­¦å‘Šæ¡†ç‚¹å‡»è¿”å›ž')
          map.activity.clickShipSevereDamageModalBack()
          stepLabel.setStepLabelContent('20-64.ç­‰å¾…æ–°èˆ¹ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          state.activity.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2, 2000 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal, 2000 },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_SHIP_CANT_GO_ON_MODAL') then

          stepLabel.setStepLabelContent('20-65.æ— æ³•å‰è¿›è­¦å‘Šæ¡†ç‚¹å‡»è¿”å›ž')
          map.activity.clickShipCantGoOnModalBackBtn()
          stepLabel.setStepLabelContent('20-66.ç­‰å¾…æ–°èˆ¹ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          state.activity.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal, 2000 },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_NEW_SHIP_PAGE') then

          stepLabel.setStepLabelContent('20-67.èŽ·å–æ–°èˆ¹')
          c.yield(sleepPromise(500))
          map.activity.clickNewShip()
          stepLabel.setStepLabelContent('20-68.ç­‰å¾…æ–°èˆ¹é”å®šçª—å£ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal, 2000 },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.activity.isNewShipPageLockModal },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('20-69.æ–°èˆ¹é”å®šçª—å£ç‚¹å‡»ç¡®è®¤')
          map.activity.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('20-70.ç­‰å¾…ä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal, 2000 },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.activity.isNewShipPageLockModal, 2000 },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_NEXT_LEVEL_STEP_MODAL') then

          if ((state.activity.battleNum < settings.activityMaxBattleNum) and state.activity.HPIsSafe) then
            stepLabel.setStepLabelContent('20-71.ç‚¹å‡»ç»§ç»­ä¸‹ä¸€å…³')
            map.activity.clickLevelStepModalContinueBtn()
            state.activity.battleNum = state.activity.battleNum + 1
            return { type = 'ACTIVITY_GO_A_BATTLE' }, state
          else
            stepLabel.setStepLabelContent('20-72.ç‚¹å‡»å›žæ¸¯')
            map.activity.clickLevelStepModalBackBtn()
            stepLabel.setStepLabelContent('20-73.ç­‰å¾…ä¸»ç•Œé¢')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal, 2000 },
              { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
              { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
              { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CANT_GO') then

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.activity.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent('20-74.ç­‰å¾…å‡ºå¾ç•Œé¢')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage, 2000 },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME') then

          map.activity.clickActivityInfoPageBackBtn()
          stepLabel.setStepLabelContent('20-75.ç­‰å¾…ä¸»ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage, 2000 },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME') then

          map.activity.clickActivityPageBackBtn()
          stepLabel.setStepLabelContent('20-76.ç­‰å¾…ä¸»ç•Œé¢')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage, 2000 },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil, state
      end))
    end

    return missions
  end,
  next = function(action, state)
    state = table.assign(stateTree, state)
    return co(c.create(function()
      for key, item in pairs(missions) do
        local newAction, newState = c.yield(item(action, state))
        if (newAction) then
          return newAction, newState
        end
      end
    end))
  end
}
end
end

do
local _ENV = _ENV
package.preload[ "KeepScreenHock" ] = function( ... ) local arg = _G.arg;
-- å…¨å±€å‡½æ•°ç”Ÿæˆï¼Œç”±äºŽéƒ¨åˆ†è®¡ç®—è¿‡ç¨‹ä¸æƒ³æš´éœ²æ‰€ä»¥ç”¨äº†é—­åŒ…

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
package.preload[ "Promise" ] = function( ... ) local arg = _G.arg;
--------------------------------------------------------------------------------------
-- es2015 Promise for lua 5.1 and 5.2

--------------------------------------------------------------------------------------

local PENDING = 0
local RESOLVED = 1
local REJECTED = 2

-- æ˜¯å¦éœ€è¦æ˜¾ç¤ºstack tracebacké‡Œçš„é”™è¯¯ä¿¡æ¯
-- stack tracebacké”™è¯¯ä¿¡æ¯å¾ˆé•¿ï¼Œæ‰€ä»¥è¿™ä¸ªåŠŸèƒ½ä½œä¸ºå¯é€‰é¡¹
local stackTraceback = true
-- å°è£…äº†xpcallæ–¹æ³•
function tryCatch(cb)
  return xpcall(cb, function(e)
    return stackTraceback and
      (e .. '\n' .. debug.traceback())
      or (e)
  end)
end

-- ç»‘å®šselfåˆ°æŸä¸ªæ–¹æ³•
function bindSelf(fn, self)
  return function(...)
    return fn(self, ...)
  end
end

-- éš”ç¦»å‡½æ•°ï¼Œä¸ºäº†é˜²æ­¢å›žè°ƒè¿‡å¤šå¯¼è‡´çˆ†æ ˆéœ€è¦éš”ç¦»å›žè°ƒæ“ä½œ
function asap(callback)
  local co = coroutine.wrap(callback)
  co()
end

-- ç±»
local Promise = {
  setStackTraceback = function(value)
    stackTraceback = value
  end
}

-- ç±»æ–¹æ³• ï¼ˆé™æ€æ–¹æ³•ï¼‰
function Promise.new(resolver)
  if (type(resolver) ~= 'function') then
    error('Promise resolver ' .. type(resolver) .. ' is not a function')
  end

  local newPromise = {
    PromiseStatus = PENDING,
    PromiseValue = nil,
    deferreds = {},
  }
  -- promiseçš„ä¸»è¦æ–¹æ³•ï¼Œè¿™ä¹ˆå†™æ˜¯ä¸ºäº†ç»‘å®šself
  newPromise.andThen = bindSelf(andThen, newPromise)
  newPromise.catch = bindSelf(catch, newPromise)

  -- æ‰§è¡Œä¼ å…¥promiseçš„æ–¹æ³•
  resolver(bindSelf(resolve, newPromise), bindSelf(reject, newPromise))

  return newPromise
end

function Promise.isPromise(obj)
  return (type(obj) == 'table') and type(obj.andThen) == 'function'
end

--- - Promise.resolveæ–¹æ³•ç›¸å½“äºŽå®žä¾‹åŒ–ä¸€ä¸ªPromiseå¯¹è±¡ï¼ŒçŠ¶æ€å˜ä¸ºRESOLVED
function Promise.resolve(value)
  if (Promise.isPromise(value)) then return value end
  return Promise.new(function(resolve, reject)
    resolve(value)
  end)
end

--- - Promise.rejectæ–¹æ³•ç›¸å½“äºŽå®žä¾‹åŒ–ä¸€ä¸ªPromiseå¯¹è±¡ï¼ŒçŠ¶æ€å˜ä¸ºREJECTED
function Promise.reject(value)
  return Promise.new(function(resolve, reject)
    reject(value)
  end)
end

function Promise.all(args)
  if (type(args) ~= 'table') then args = {} end
  return Promise.new(function(resolve, reject)
    if (#args == 0) then return resolve({}) end
    local remaining = #args
    local function getRes(k, value)
      if (Promise.isPromise(value)) then
        value.andThen(function(res)
          getRes(k, res)
        end, function(err)
          reject(err)
        end)
        return
      end

      args[k] = value
      remaining = remaining - 1
      if (remaining == 0) then
        resolve(args)
      end
    end

    for k, value in ipairs(args) do
      getRes(k, value)
    end
  end)
end

function Promise.race(args)
  if (type(args) ~= 'table') then args = {} end
  return Promise.new(function(resolve, reject)
    for k, v in ipairs(args) do
      Promise.resolve(v).andThen(resolve, reject)
    end
  end)
end

-- å¯¹è±¡æ–¹æ³•
function resolve(self, value)
  local xpcallRes, xpcallErr = tryCatch(function()
    if (Promise.isPromise(value)) then
      doResolve(self, value.andThen, resolve, reject)
      return
    end
    self.PromiseStatus = RESOLVED
    self.PromiseValue = value
    finale(self)
  end)
  if (not xpcallRes) then
    reject(self, xpcallErr)
  end
end

function reject(self, value)
  value = value or ''
  self.PromiseStatus = REJECTED
  self.PromiseValue = value
  if (stackTraceback and (not string.find(value, '\n'))) then
    self.PromiseValue = value .. '\n' .. debug.traceback()
  end
  finale(self)
end

function Handler(onResolved, onRejected, resolve, reject)
  return {
    -- å½“å‰promiseçš„çŠ¶æ€è½¬æ¢äº‹ä»¶å¤„ç†å‡½æ•°
    onResolved = type(onResolved) == 'function' and onResolved or nil,
    -- å½“å‰promiseçš„çŠ¶æ€è½¬æ¢äº‹ä»¶å¤„ç†å‡½æ•°
    onRejected = type(onRejected) == 'function' and onRejected or nil,
    resolve = resolve,
    reject = reject,
  }
end

-- promiseçš„ä¸»è¦æ–¹æ³•ã€‚ç”±äºŽluaä¸­thenæ˜¯å…³é”®å­—ï¼Œæ‰€ä»¥ç”¨andThenå–ä»£
function andThen(self, onResolved, onRejected)
  -- thenæœ¬èº«ä¹Ÿä¼šè¿”å›žä¸€ä¸ªpromiseï¼Œå®žçŽ°promiseé“¾
  return Promise.new(function(resolve, reject)
    local deferred = Handler(onResolved, onRejected, resolve, reject)
    handle(self, deferred)
  end)
end


function handle(self, deferred)
  if (self.PromiseStatus == PENDING) then
    table.insert(self.deferreds, deferred)
    return
  end
  asap(function()
    local cb
    if (self.PromiseStatus == RESOLVED) then
      cb = deferred.onResolved
    else
      cb = deferred.onRejected
    end
    if (type(cb) == 'nil') then
      if (self.PromiseStatus == RESOLVED) then
        deferred.resolve(self.PromiseValue)
      else
        deferred.reject(self.PromiseValue)
      end
      return
    end

    local ret
    local xpcallRes, xpcallErr = tryCatch(function()
      -- æ‰§è¡Œå½“å‰promiseçš„çŠ¶æ€è½¬æ¢äº‹ä»¶å¤„ç†å‡½æ•°
      ret = cb(self.PromiseValue)
    end)
    if (not xpcallRes) then
      -- ä¿®æ”¹promiseé“¾è¡¨ä¸­ä¸‹ä¸€ä¸ªpromiseå¯¹è±¡çš„çŠ¶æ€ä¸ºrejected
      deferred.reject(xpcallErr)
      return
    end
    -- ä¿®æ”¹promiseé“¾è¡¨ä¸­ä¸‹ä¸€ä¸ªpromiseå¯¹è±¡çš„çŠ¶æ€ä¸ºresolved
    deferred.resolve(ret)
  end)
end

-- å¯¹çŠ¶æ€è½¬æ¢äº‹ä»¶å¤„ç†å‡½æ•°è¿›è¡Œå°è£…åŽï¼Œå†ä¼ ç»™æ‰§è¡Œå‡½æ•°
function doResolve(self, andThenFn, onResolved, onRejected)
  -- doneä½œä¸ºå¼€å…³ä»¥é˜²æ­¢fnå†…åŒæ—¶è°ƒç”¨resolveå’Œrejectæ–¹æ³•
  local done = false
  local xpcallRes, xpcallErr = tryCatch(function()
    andThenFn(function(value)
      if (done) then return end
      done = true
      onResolved(self, value)
    end, function(value)
      if (done) then return end
      done = true
      onRejected(self, value)
    end)
  end)
  if (not xpcallRes) then
    if (done) then return end
    done = true
    onRejected(self, xpcallErr)
  end
end

-- ç§»åŠ¨åˆ°é“¾è¡¨çš„ä¸‹ä¸€ä¸ªpromise
function finale(self)
  local theDef = self.deferreds
  for k, v in ipairs(self.deferreds) do
    handle(self, v);
  end
  self.deferreds = {};
  if ((self.PromiseStatus == REJECTED) and (#theDef == 0)) then
    error('Uncatch error in Promise \n' .. tostring(self.PromiseValue))
  end
end

-- promiseçš„ä¸»è¦æ–¹æ³•
function catch(self, onRejected)
  -- thenæœ¬èº«ä¹Ÿä¼šè¿”å›žä¸€ä¸ªpromiseï¼Œå®žçŽ°promiseé“¾
  self.andThen(nil, onRejected)
end

return Promise

end
end

do
local _ENV = _ENV
package.preload[ "StepLabel" ] = function( ... ) local arg = _G.arg;
local StepLable = {
  originText = '',
  text = '',
  labelId = '',
  prefix = '',
}

fwShowWnd('steplabel', 300, 50, 300, 100, 0)

StepLable.init = function(labelId)
  StepLable.labelId = labelId
  return StepLable
end

StepLable.setPrefix = function(prefix)
  StepLable.prefix = prefix
  local finalText = StepLable.prefix .. StepLable.text
  fwShowButton('steplabel', StepLable.labelId, finalText, '90333333', '90FFFFFF', '', 7, 0, 0, 300, 100)
  return StepLable
end

StepLable.setStepLabelContent = function(text, noNLog)
  StepLable.originText = text
  if ((type(runCount) == 'number') or (type(runCode) == 'string')) then
    text = tostring(runCount) .. '.. ' .. text
  end
  StepLable.text = text
  local finalText = StepLable.prefix .. text
  fwShowButton('steplabel', StepLable.labelId, finalText, '90333333', '90FFFFFF', '', 7, 0, 0, 300, 100)
  if (not noNLog) then
    local dateStr = os.date('%Y-%m-%d %X')
    wLog('warship-girls-r-script', '[DATE] ' .. finalText);
    nLog(dateStr .. ' ' .. finalText)
  end
end


StepLable.getText = function()
  return StepLable.originText
end

return StepLable
end
end

package.preload[ "TSLib" ] = assert( (loadstring or load)(
"\27TS1R\000\1\4\4\4\8\000\25“\r\
\26\
\000\9\20 —@L{\000¶z\rïø–jr\rW\4’ü]\16ð7Xh_\4Øj™žTnàZ/Z€\r\9\20 SEÔ #–ÂP°Îÿ5ò0ò20\8t\0256\8t\25\6(:.X©p>]¢…5\8Ö-\14£ïMqüBÇD\24\9v\25\16\9v\0252&z\000-ìtƒµÕN™Ô;|\"Ð\11<VÊ\9iÈ¹Áy—!Ào\1,\8\6 Éo<\7†\26WZ`\24­h[lš\23vR¯B\000\14\8\8 õ\
ï\5V­Þ\28{ë\18;B\\oDªò²=žÕ\11\8qV4\18ãtÉ\9ùR©(ôÌ\21/A\23O?\1)×6—¼c =Z\22\4ð€`TÊâÝ e\000\000\000-\8\8\8H\8\8\8Uˆˆ\8\8È\8ÏHÈ\8-I\8\8\000\8\9‰-‰\8\8\000\8‰‰-É\8\8\000\8\9Š-\9\9\8\000\8‰Š-I\9\8\000\8\9‹-‰\9\8\000\8‰‹-É\9\8\000\8\9Œ-\9\
\8\000\8‰Œ-I\
\8\000\8\9-‰\
\8\000\8‰-Á\2\000\8\000\1†%\1\3\000\8\000†%A\3\000\8\000\1‡%\3\000\8\000‡%Á\3\000\8\000\1ˆ%\1\4\000\8\000ˆ%A\4\000\8\000\1‰%\4\000\8\000‰%Á\4\000\8\000\1Š%\1\5\000\8\000Š%A\5\000\8\000\1‹%\5\000\8\000‹%Á\5\000\8\000\1Œ%\1\6\000\8\000Œ%A\6\000\8\000\1%\6\000\8\000%Á\6\000\8\000\1Ž%\1\7\000\8\000Ž%A\7\000\8\000\1%\7\000\8\000%Á\7\000\8\000\1%\1\8\000\8\000%A\8\000\8\000\1‘%\8\000\8\000‘\6ÁH\000\8\000\1’%Á\8\000\8\000’%\1\9\000\8\000\1“%A\9\000FÁI\000J\1\1”e\9\000\8@”eÁ\9\000\8@\1•e\1\
\000\8@•eA\
\000\8@\1–e\
\000\8@–eÁ\
\000\8@\1—e\1\11\000\8@—eA\11\000\8@\1˜e\11\000\8@˜\31\000€\000\3\7\21 s66#\6\3\16I\25íW\0145Ê\000@\12\1\000\000\000\1\000\8\7!\25„yÎ$¸\11–põà\23\30\
”%\127\24$CYPM²5€æÔAØ@È,EX¡;2\000\000\000\4\8\000\000\000ÔóÃèåãë€\4\
\000\000\000ïðôßöáìõå€\4\11\000\000\000ÔÓÖåòóéïîó€\4\4\000\000\000ôáð€\4\
\000\000\000òáîäïíÔáð€\4\11\000\000\000òáîäïíóÔáð€\4\7\000\000\000íïöåÔï€\4\12\000\000\000íïöåÔï÷áòäó€\4\12\000\000\000íïöåÚïïíÏõô€\4\11\000\000\000íïöåÚïïíÉî€\4\17\000\000\000íïöåÃéòãìåÃåîôåò€\4\17\000\000\000íïöåÃéòãìåÐïîéôó€\4\9\000\000\000éîôÔïÒçâ€\4\9\000\000\000òçâÔïÉîô€\4\8\000\000\000éóÃïìïò€\4\11\000\000\000íõìôéÃïìïò€\4\12\000\000\000íõìôéÃïìÔáð€\4\9\000\000\000óôòÓðìéô€\4\12\000\000\000éóÆéìåÅøéóô€\4\15\000\000\000òåáäÆéìåÓôòéîç€\4\9\000\000\000òåáäÆéìå€\4\
\000\000\000÷òéôåÆéìå€\4\16\000\000\000÷òéôåÆéìåÓôòéîç€\4\8\000\000\000äåìÆéìå€\4\8\000\000\000ìõáÅøéô€\4\9\000\000\000çåôÎåôÉÐ€\4\4\000\000\000ìïç€\4\11\000\000\000çåôÁððÎáíå€\4\11\000\000\000çåôÕóåòÁðð€\4\9\000\000\000èôôðÐïóô€\4\8\000\000\000èôôðÇåô€\4\9\000\000\000éîðõôÓôò€\4\16\000\000\000ãìåáòÐáóôåâïáòä€\4\r\000\000\000ãìåáòÃïïëéåó€\4\11\000\000\000ãìåáòÉÄÆÁÖ€\4\15\000\000\000ãìåáòÁììÐèïôïó€\4\12\000\000\000ÄåìÁììÐèïôï€\4\18\000\000\000ãìåáòÁììËåùÃèáéîó€\4\
\000\000\000çåôÓôòÎõí€\4\3\000\000\000ßÇ€\4\
\000\000\000çåôÒîäÎõí€\4\6\000\000\000ÕÉÎå÷€\4\12\000\000\000óîáðÁîäÓáöå€\4\14\000\000\000äååðÃïðùÔáâìå€\4\
\000\000\000çåôÒåîäåò€\4\6\000\000\000éóÄáù€\4\11\000\000\000ãèåãëÔáâìå€\4#\000\000\000æéîäÍõìôéÃïìïòÉîÒåçéïîÆõúúùÂùÔáâìå€\4\7\000\000\000îåïóÕÉ€\4\8\000\000\000ïãòÉîæï€/\000\000\000\11\9\20 ‹\22D_l\25Fm\3\9\20 4¶âfwò+=ÌÓ…L\16÷²\20€§½+9í»\"²oâE\8\r®;| !lMË\23'}\8t\0254\8t\25ëY{n&\25$\11óƒ\7ìímu\25\9v\25\18\9v\25¯ãÙZ©>D3¦\20æ\11UÂY\30¨5N fßç0\25SZbgc«[\
Õ&)À©\22O\000(\8\6 –b=m\000\000\8\8 \6¼Þ('Av\7SÌ\18|}®\
fó\20üScÃÅ\16ýUÈ\17,\2¸vHyV4\18¨\"Ùb\31\000\000\000CÈIH\14H\8HB\8HÈ\14\8\8HB\8ÈÈ\14È\8HB\8HÉ\14ˆ\8\000\
@€K€\000\000†\000A\000‡@A\1J€€‚†\000A\000‡€A\1J€\000ƒ\
@\000‚K@\000\000†ÀA\000‡\000B\1J€\000„\
@€ƒe\000\000\000¥@\000\000å€\000\000\11Á\000\000\
€„\
Á\000…\
A€…\31\1\000\1\31\000€\000\8\7\21 \127M•*“À2^Ñ$Ù!‹@\0252\127® S[&»h:$ó\12(íä\6\1;¡tæL+\5\2\16I\25h\26‰%©9§\r8†Þ\2\1\000\000\000\000\000\6\7!\25iã½\\ä'ò}\8Rí;ˆùíqëãÐ&/“cCÜÅ\000n\12\000\000\000\4\9\000\000\000\25\2\3\24\000\15\8\31m\4\5\000\000\000\25\20\29\8m\4\6\000\000\000\8\31\31\2\31m\4\7\000\000\000\30\8\1\8\14\25m\4\7\000\000\000\30\25\31\4\3\
m\4\7\000\000\000\11\2\31\000\12\25m\4\5\000\000\000\11\4\3\9m\4\6\000\000\000\9\8\15\24\
m\4\8\000\000\000\
\8\25\4\3\11\2m\4\8\000\000\0009\30.\5\8\14\6m\4\
\000\000\000\2\29\0252\27\12\1\24\8m\4\8\000\000\000\15\12\0092\12\31\
m\3\000\000\000\11\9\20 Êµ'JÙa¯kö\12\9\20 ½¢wÃ1…d×WŠFèý\12B \25ÚL(\8t\0258\8t\25eÐù<ÚÿÇc±24\\\1\20ãXH0]I\30Ù&O5\15é;ü]0\24\23\9v\25\18\9v\25¼½çTkpùl\16;š\21\24›ë\27]‰u^ÿ<­\24ÿ˜O<e ‡En(¤\14¡&B@\000 \8\6 ?#ýSlÜi\
ÿ§\16g·­è\\ÖFa\31Že³^zßmA­žëevcÀ \6\11\8\8 þQ#\16Û3º]tø\15r÷{V4\18½(m;Í]~;\18W†r:\000\000\000qö·÷7öwõjv÷ö«¶÷ôà÷÷w¶¶÷÷qv·÷p6·ô:¶öujv÷ö1¶¶÷ðu¶ô*v÷öï76ôàw\000€ÇA\3ÛA\000\000\23\000\000€Á\1\2\000\6BA\000GBB\3\29‚\000\1\24ÀA\4\23€\000€\7BB\3\27B\000\000\23À\1€\6BA\000@\2\000\000\29‚\000\1\24ÀA\4\23@\000€\28B\000\000\23\000\000€\1‚\2\000X\000B\2\23@\1€FÂA\000GÂÂ\4\2\3\000À\2\000\2]‚€\1\000\1€\4FBC\000†ÂA\000‡ÂB\5Á‚\3\000\000\3€\000@\3\000\1€\3€\3À\3\000\4\000\4€\1@\4\000\2‚\000\4ÍB‡^\2€\1_\2\000\000\31\000€\000\8\7\21 ^…r~Î\20nG$÷–@oÀ\12\20æ¯Yc€\12\31ný¹,åH©\31æ ”dÝ%^;\18\3\16I\25\12gõ_\28I[\15\1\000\000\000\1\000\11\7!\25\12\15\6GÔöClÉ’¶\9št¹%NÖ±-v1¢o\17ØyFéÎù;tƒÅ\127ì\0114$\16\000\000\000\4\9\000\000\000‚™˜ƒ›”“„ö\3\000\000\000\000\000\000\000\000\4\6\000\000\000’“”ƒ‘ö\4\8\000\000\000‘“‚Ÿ˜™ö\3\000\000\000\000\000\000\000@\4\5\000\000\000‚†“ö\4\9\000\000\000˜—›“ž—‚ö\4\7\000\000\000…‚„Ÿ˜‘ö\4\1\000\000\000ö\4\5\000\000\000˜—›“ö\4\2\000\000\000Éö\4\7\000\000\000™„›—‚ö\4\12\000\000\000ÚÖ\19Ha\19~FÖÓ…ö\4\6\000\000\000“„„™„ö\4D\000\000\000\16j\\\30uK\16~f\19|i\30If\30WzÚ\19yt\16cF\19Ly\19yAÌÕÓ’Ó…Ö\19qK\16cFÌÓ…ÖÑÓ…ÑÖÞ\31jv\30PwÖÓ…ÖÓ…ßö\3\000\000\000\000\000\000\8@\000\000\000\000\26pi\23#\8\29lÉSÑZ\26ðviðe›'ÛªWMÓv\20=Oë\r&©¿Å\20\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 yóBÁ\5¼^½\000 sè\5“]¿Æ´\1ñC¯\3üÎ—-U§þpÛBX1u\15\9\20 ¹0{\28\\§\25i_Œö+ŠFªli­Ðn½*„)\30\8t\0251\8t\25ç%\28G\2\9v\25\31\9v\25³¯ýh³AØQ,y4t\000d%,çFÆ\22­‘&ÔmØ\8\1.\8\6 Y&Ä[¸ýð<°Š¤~éŸ·\30y\3­\27m‹DrÑ¥J|\2\r\8\8 _ÏóuÍtâ)Žq`\14:\18L'ìó´/á~V4\18H›Î\24[\20D=}‰q0±HŸ\7\24?Èf†u†cV\000\000\000gá¡á!ááá|aáà¹¡¡àöáãadáaá aááà áá ààá` áá'à¡ááãáá<àáà|¡áágá¡á!áaá|aáà¹¡ àöáãadáaá aááà`\1\000AÁ\1\000A\1\000Æ\1@\000\000\2€\000Ý\1\000\1@\000\000†\000B\000Á@\2\000&\1\000\000€\000\000\25\000\000\1\23\000\2€Å\000€\000\1\2\000@\1\000\000\2\000À\1€\000\1Â\2\000Þ\000\000\3ß\000\000\000\23@\
€Æ\000B\000\000\1\000\000f\1\000\000Ý€\000\000\6AA\000\7\1C\2@\1€\000A\000\000\29€\1\27\1\000\000\23@\2€\6AC\000@\1€\1\29\000\1\27\1\000\000\23\000\1€\6AC\000@\1€\1\30\1\000\1\31\1\000\000\23\000\5€\6AA\000\7\1C\2@\1€\000†\1@\000À\1€\1\1\000\1\29\000\000\27A\000\000\23€\2€\5\1€\000A\2\000€\1\000\000Á\2\000\000\2€\000F\2@\000€\2€\1]\2\000\1\30\1\000\000\31\1\000\000\23\000\000€ß\000\000\1\31\000€\000\1\7\21 ¡\28È\0099%„LK°“ \11\3\16I\25:‰©x3÷Y7\2\000\000\000\1\000\1\1\5\7!\25\14÷\1)aN\4ÔMP\000Æôr>\14\000\000\000\4\5\000\000\000\1\12\5\16u\4\7\000\000\000\27\000\24\23\16\7u\4\8\000\000\000!\0066\29\16\22\30u\3\000\000\000\000\000\000ð?\4\12\000\000\000]\20\7\18*\22\26\000\27\1\\u\4\7\000\000\000\6\1\7\28\27\18u\3\000\000\000\000\000\000\000@\4\16\000\000\000]\16\r\5\16\22\1\16\17*\1\12\5\16\\u\4\7\000\000\000\6\16\25\16\22\1u\4\2\000\000\000Vu\4\1\000\000\000u\4\9\000\000\000\27\26U\3\20\25\000\16u\4\5\000\000\000\19\28\27\17u\4\9\000\000\000\1\26\27\000\24\23\16\7u\000\000\000\000\17pi\23½í\7\31@ø\31ZGw7u\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 j}P|oåî\26ˆ×\26+•(;iI\
\9\20 Å\24|\3t:â\25úËiXw\8t\0251\8t\25Ô\25&(\9v\25\18\9v\25\22±›\17/>ºB½4Æe\000*fZšØL\\{RfeúÜ\"bãVmI·Êa¨ÃÏR\1,\8\6 õ3\31I¦Ö¥Xþ\8yH«-9\rs²±6\3\1\8\8 y\rº\25 ²\25Q\2Ô\6éò¨4¨XÍDæ*\15p£³ø2Ét…\29«C‹s-~V4\18×ô\24ë{ôr g¾\31£ˆ*\26º®5Þ›„\5h\000\000\000ë-m--,--ð­-,umí,:-/­è-­-,¬--lì--¬,,-ìl--+/m-m/--0/-,ðm--ë-m--,­-ð­-,umì,:-/­è-­-,¬--l¬,-¬ì,-ìl,-+/m-m/­-\29\2\000\1Ý@\000\000Æ@A\000Ç\000Â\1\000\1€\000F\1@\000€\1\000\1]\1\000\1Ý€\000\000Û@\000\000\23@\3€Æ\000@\000\000\1\000\1Ý€\000\1X@Â\1\23\000\2€Å\000€\000\1\000\000A\2\000Á\2\000À\1€\000\6\2@\000@\2\000\1\29\2\000\1Ý@\000\000Æ\000C\000\1A\3\000f\1\000\000Ý€\000\000\25\000€\1\23@\000€Ÿ\000\000\1\23À\
€\6\1C\000@\1\000\000¦\1\000\000\29\000\000FAA\000G\1Â\2€\1€\000ÁA\000\000]€\1[\1\000\000\23@\2€FC\000€\1\000\2]\000\1[\1\000\000\23\000\1€FC\000€\1\000\2^\1\000\1_\1\000\000\23€\5€FAA\000G\1Â\2€\1€\000Æ\1@\000\000\2\000\2Ý\1\000\1]\000\000[A\000\000\23\000\3€E\1€\000Á\3\000À\1\000\000\1Â\3\000A\2\4\000€\2€\000V‚‚\4†\2@\000À\2\000\2\2\000\1^\1\000\000_\1\000\000\23\000\000€\31\1\000\1\31\000€\000\1\7\21 ´’û\17Yîêjž\25g\12\8\16I\25£¥µLFSé9üÐ²\26˜ÙÔ\21ì)\18úÙ+cC\7\14#_Ü@Ià^¯m\2\000\000\000\1\000\1\1\11\7!\25\127]ób1aƒt¦\7qq(¶À'\23Œ’dI»i$ñ*FEÂÏ\29Xa©Dq´k5;\17\000\000\000\4\5\000\000\000=09,I\4\7\000\000\000'<$+,;I\4\
\000\000\000&9=\22?(%<,I\3\000\000\000\000\000\000ð?\4\12\000\000\000a(;.\22*&<'=`I\4\7\000\000\000:=; '.I\3\000\000\000\000\000\000\000@\4\16\000\000\000a,19,*=,-\22=09,`I\4\5\000\000\000/ '-I\4\4\000\000\000' %I\3\000\000\000\000\000\000\8@\4\14\000\000\000a-,/(<%=\22?(%`I\4\7\000\000\000:,%,*=I\4\2\000\000\000jI\4\9\000\000\000=&'<$+,;I\4\1\000\000\000I\4\5\000\000\000&9=gI\000\000\000\000\27pi\23L%9dÔÒóZó/£\27gßç\25²nx`—â™ \27rã+\12]cK5r³\7\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\16pi\23¯\2\25\24|ÅœA\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 79\8c1\15\9\20 \20?\0058,Îÿ\15õÛ7TìnãM*a.x¾~‰%e\8t\0256\8t\25\26ñBg½Š¶Y\22É\26Dòâ7\0003­§3_³ê\31K\9v\25\25\9v\25}\1&d\000+\8\6 \29ÚÎO©ÁÌ\26\000\15\8\8 Qž\0193û\9¸\18zâÄ*\30ùSÝ\rUV\22Sõ\17ÚOX-5{V4\18\17‰`\16‘\15+\26 ¶\5,\3\000\000\000455\000\31\000\000\1\31\000€\000\4\7\21 ¾Ý**\21’=\000\0177I\22è>Y\"Ó\16Ç%ì\4:'\2\000\16I\25‘›}\127\000\000\000\000\7\7!\25ô\18Ô\9ÄH%3b?\11å\3\21eAJK\0233z÷/\1\000\000\000\4\8\000\000\000\000\31\000\31\9\31\0001\000\000\000\000\27pi\23ë\11\0242¡ÅÿiS|÷gæ\21ÐD\27¨Ä\20quˆ;Ã#%\0271û¹&KÅàh\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 \5çÐx˜z¶Lþ\12\9\20 NŸãRxg¹_Xr9\0282ÈÇ<ê\3/fR\8t\0251\8t\25½àù'O\9v\25\26\9v\25òî€GÝ =l\1 \8\6 ;!Swu\15{\17ž\20}F9£ù#vzòx|Àö\9Ñ«ƒ\2,…l\27ÚÔ.\000\
\8\8 7d…S½ÒÜ`ÐpV4\18\15\20˜\3‡ïQð\"\6y§ŽNP\9WŸU²\23d3õ-2#¾X54\000\000\000ÖÐÐ×Ð–PÐÐPÐÍÐÐÕÐPÐ‘\16ÐÐQÐÑÐ6ÐÐÐÍPÐÐ•ÐPÐQÑÐ\17ÐÑÐ&\1\000\000]€\000\000…\000\000\1Á€\1\000\1\1\1\000F\1@\000GÁÁ\2\1\2\000ÁA\2\000]€\1¦\1\000\000€\000\000Æ\000@\000ÇÀÁ\1\1Á\000\000A\2\000Ý€€\1\6ÁB\000@\1€\1€\1\000\000À\1€\000\29A\000\2\6\1C\000AÁ\000\000\29A\000\1\6AC\000@\1€\1€\1\000\000À\1€\000\29A\000\2\6\1C\000@\1\000\1\29A\000\1\6C\000@\1€\1€\1\000\000À\1€\000\29A\000\2\31\000€\000\7\7\21 'öù_lÂ‡\27v”±\3åÖó\7uY½}\8\000\16I\25Âw1t\3\000\000\000\000\000\1\2\1\3\7\7!\25£¤…B7‡¬\5ßöˆ7ÜG\127f­\1Ÿ~[·\127A\15\000\000\000\4\5\000\000\000“ŸŠ–þ\4\11\000\000\000ŒŸš‘“››šþ\4\
\000\000\000™›Š¬š°‹“þ\3\000\000\000\000\000\000ð?\4\7\000\000\000‹“œ›Œþ\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\4\7\000\000\000ŒŸš‘“þ\3\000\000\000\000\000\000>@\3\000\000\000\000\000\000I@\3\000\000\000\000\000\000\"@\4\
\000\000\000Š‘‹–º‘‰þ\4\7\000\000\000“­’››Žþ\4\
\000\000\000Š‘‹–³‘ˆ›þ\4\8\000\000\000Š‘‹–«Žþ\000\000\000\000\22pi\23;.$kv‘Tp\6ÀR)r’©>\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 ÎMB þþß}]„'z\30%\0055'\22p\127N³“xæ\19coú\000\9\20 ¨/@Zf%êj²Ú\17\27ýØ¬\21×8š\11!ÈµS\27\26ÙH…6ð*˜>\9\6^\8t\0254\8t\25f \31Y`zLB\r\16¬(s¾h.{\9v\25\27\9v\25óQá/T$nU\24ž`*\1/\8\6 jÄe\31_\16\18D\22_\0178\18¨?œ^ð\15¡š†\11\000\9\8\8 Ãt`\15\\\127V4\18\rKÂ\8æÀ¥:äzP>sp¬s˜›·UâSýSJ©F\1278\000\000\000Y\\\\\\\29\\\\\\Ý\28\\\\º\\\\\\AÜ\\\\\25\\\\\\ÝÜ\\\\\28\\\\z]\\\\\1Ü\\\\Ù\\Ü\\œ\\\\]\29\\\\\29]]\\¦\1\000\000€\000\000Æ@A\1Ç€Á\1\6ÁA\1\29\1€\000Ý@\000\000Æ@A\1Ç\000Â\1\19\1\000\1@\1\000\1Ý€€\1\rÀ\000\000Æ@A\1Ç\000Â\1\19\1\000\1@\1\000\1Ý€€\1MÀ€\000Æ@B\1\1\1\000\000@\1\000\000€\1€\000Ý@\000\2Æ€B\1\1\1\000\000@\1\000\000€\1€\000Ý@\000\2ÆÀB\1\6AA\1\7\1B\2A\1\3\000A\3\000\29\1€\1Ý@\000\000Æ€C\1\1\1\000\000@\1\000\000€\1€\000Ý@\000\2\31\000€\000\3\7\21 ýmÖ\28\7\3\16I\25R¢v/—ï\31\4\3\000\000\000\1\2\1\3\000\000\7\7!\25²\28Ãq¤ÿË,©>¿1L\16\0221—Q­\\ýb-\7\15\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000”—˜Ÿˆú\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\20@\4\5\000\000\000—›Ž’ú\4\11\000\000\000ˆ›”ž•—‰ŸŸžú\4\
\000\000\000ŸŽ¨”ž´—ú\4\7\000\000\000ˆ›”ž•—ú\4\
\000\000\000Ž•™’¾•”ú\4\
\000\000\000Ž•™’·•ŒŸú\4\7\000\000\000—©–ŸŸŠú\3\000\000\000\000\000\000D@\3\000\000\000\000\000\000N@\4\8\000\000\000Ž•™’¯Šú\000\000\000\000\24pi\23'Ó\9hg'“&\2\14‡mkéhyŸ9;fžlw}\12„ï\4õpèZbá×\12üÑ\9\9\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 ¿´Ë\20Õ\15VaH<\31xýó\4t£{sO#Ê›eè¥y#Ø£(]\
\
\9\20 5Š’aké¾K¢ÝÑL¼\8t\0259\8t\25Ô2ëTØâ0\rOò\127sñ·Iï¸\18!ˆ&úQÍÒGBwè‡,iR²hw\9v\25\30\9v\25ó\12Ó1»'y‡y›GÚ\6W\20\21\3·:\0080Ž\23\1-\8\6 Õ·‚OÝ?äxc*§UÒ«‡C\000\r\8\8 †ôB;ºQ\1gX_€%¬}G\18\21 \12`zV4\18·ýÝ,·øhpu\000\000\000•Ñ\17Ðv\16Õ\17\16QÐ¶‘Í\16\21\16QP‘ÑÑ‘‘6‘\r\16u‘\16‘Ñ‘\17Ñ‘\17\16‘ÌÑ‘‡\16Ñ\17‘\16‘\16‘C‘\16’’\16’\r\17\16‘\29\17‘P\1€\1\19\2€\2@\2€\2Ý€\1ÍÁ\000\6ÂA\1@\2\000\2€\2\000\3À\2€\3\29B\000\2\000\2€\1A\2\2\000‚\1\000\29‚€\1A\2\000\000€\2\000\4Á\2\000\000a\2\
€\26€@\4\23À\4€FCB\1€\3€\1Áƒ\2\000\1Ä\2\000\3€\1]C\000\000F\3C\1€\3\000\2À\3€\1\19\4€\2@\4€\2Ýƒ€\1ÍÃ\3\3\000\4€\1S\4€\2€\4€\2\29„€\1\r\4„\3]C\000\2\23€\4€FCB\1€\3€\1Áƒ\2\000\1\4\1\000\3€\1]C\000\000F\3C\1€\3\000\2À\3€\1\19\4€\2@\4€\2Ýƒ€\1ÍÃ\3\3\000\4€\1S\4€\2€\4€\2\29„€\1\r\4„\3]C\000\2`Bõ\127FBB\1€\2€\1ÁB\3\000\1Ã\2\000\2€\1]B\000\000\24\000B\4\23@\1€F‚C\1€\2\000\2À\2\000\3\000\3€\3]B\000\2\23\000\3€F‚C\1€\2\000\2À\2€\1\19\3€\2@\3€\2Ý‚€\1ÍÂ\2\3\000\3€\1S\3€\2€\3€\2\29ƒ€\1\r\3ƒ\3]B\000\2\31\000€\000\8\7\21 à{]ÅG[p^‹©|~™Ž~MnUB,^ñ>ö\22+·À\7+cg³ZéŽé\\\19\000\16I\25êàN\"\3\000\000\000\1\2\1\3\000\000\3\7!\25Y\127æ^ò\16Ý9\15\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000d\127ghox\
\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\0004@\3\000\000\000\000\000\000\"@\3\000\000\000\000\000\000\20@\4\
\000\000\000~e\127ibNe}d\
\3\000\000\000\000\000\000\000\000\4\7\000\000\000gYfooz\
\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000Y@\4\
\000\000\000~e\127ibGe|o\
\3\000\000\000\000\000\000>@\4\8\000\000\000~e\127ib_z\
\1\000\000\000\r\9\20 ;š½*@ëƒ'í°¢.ãíï\12Û\14\9\20 ËƒÒ\11žFOZuöÚ&{¿Zé\"c]`ê´Kên†\1F\8t\0255\8t\25x\\¯\23?¢‰\0147H \25¿oi0Q†˜Kk\9v\25\17\9v\25çÕ\21QÞÏè\21Bõ–\0247î‘\25:s\7\22†š×k€P)\rˆŠ:˜8¯\23\1-\8\6 ØH¼\4ÓÒlB5i>\4Åù^3\000\9\8\8 ð\02255~V4\18\0317f\15¡Å×cýÓî5\8ZÉl\2°Œ/çBu7\11\000\000\00035u52uu5sµu\000]\000€\000\29@\000\000\6\000@\000\7À@\000f\000\000\000\30\000\000\000\31\000\000\000\31\000€\000\11\7\21 z\12<G&åþE\17¾!A9|¥wxk—\17oûçd R»HV;€'²ð~}\2\2\16I\25®‡=8‹ViÙÀ\11\1\000\000\000\000\2\11\7!\25ÐÃ\5\1Î>Xhv\127Î|£–rC\4¨–l;y-0YWÏ\18…˜­!gH*mÛ›þm\4\000\000\000\4\5\000\000\000¶º¯³Û\4\11\000\000\000©ºµ¿´¶¨¾¾¿Û\4\
\000\000\000¼¾¯‰µ¿•®¶Û\4\7\000\000\000©ºµ¿´¶Û\000\000\000\000\23pi\23\9\14\2QØoí#¬)Ý\29\11¾Ž\000¿²b[\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\26pi\23…ÊÊGæ—a!˜]€\6¾Fp?^\3ù2\8Yhkß˜+\8´>yZ\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 jIX:¹Ð3V6œ\2¬Sˆb\\»·\2hØ¬\11?¿únI]½bI\3\9\20 ¬s!d¾·dg¬<]Uh>\r\30Ü·ÂY†ÜP2$E¦\1¼…\31;Q«¾\31”;íb™\8t\0259\8t\0257|F._þ\
\"ÌÝü@µÜ-gÉ¤I`W\28r$\6ùÚ\20\18\2ÖwølÆ:•\9v\25\30\9v\25|K.2±=ú\16›âg%(Ÿ¶\20\rù±\19\4»\0201\1 \8\6 WVovö¥#\14v?k\3ÊZ´]ˆu.³œ@k\8žx‘\21KO´ír\000\14\8\8 M›j\
\5;¬\18#‰1]JÇÆ\21<·ò@‚‡<\127Õ~V4\18L,†_mÁ5{÷Œû<^.\\We.ü5\\îÆ_j\000\000\000ÐÕÕÕ”ÕÕÕT•ÕÕ3ÕÕÕÈUÕÕÕÕÕTUÕÕ\20•ÕÕóÔÕÕˆUÕÕPÕÕÕ\20\21ÕÕÔ”ÕÕ³ÔÕÕHUÕÕ\16ÕÕÕÔÔÔÕ””ÕÕsÔÕÕ\8UÕÕÐÔUÕ””ÔÕT”ÕÕ\20TÔÕó×ÕÕÈTÕÕÔ€\000Á\1\000ÁA\000\000\1\2\2\000f\2\000\000]\000\000†AB\1‡B\3Î\000\000\000\1ÆAB\1ÇÂ\3\14Â€\000Ý\000\1\4\2\000\1\25€\3\23À\000€\16\2\1\3@\2\000\2\2‚\3\23€\000€\16\2\3P\2\2\3€\2\000\2\25\000\000\1\23€\000€Ó\2€\4ˆÀ‚…\23\000\000€ˆ@‚…\25@€\1\23€\000€Ó\2\000\5ˆÀ\2†\23\000\000€ˆ€\2†ÆBB\1ÇBÃ\5\6ƒC\1\29\3€\000ÝB\000\000ÆBB\1ÇÂÃ\5\1\3\000\000A\3\4\000Ý‚€\1\6CD\1@\3€\5€\3\000\000À\3€\000\29C\000\2\6ƒD\1AÃ\4\000\29C\000\1\1\3\000\000@\3\000\4\3\000\000!Ã\2€\6ÄB\1\r\000\4\000\6\4C\1M\000„\000\6\4E\1@\4€\5€\4\000\000À\4€\000\29D\000\2\6„D\1A„\1\000\29D\000\1 ƒü\127\6ƒD\1@\3€\2\29C\000\1\6CE\1@\3€\5€\3\000\1À\3€\1\29C\000\2\31\000€\000\5\7\21 \22löFøÐ.\5\3\25A\30#e¨Zü‹C6kwò!z»\23Q\20\2\16I\25ìí1\r~…¨+¦ï9\3\000\000\000\1\2\1\3\000\000\000\7!\25éF$\22\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000'<$+,;I\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000I@\4\5\000\000\000$(=!I\4\4\000\000\000(+:I\4\3\000\000\0001zI\4\3\000\000\0000zI\4\11\000\000\000;('-&$:,,-I\4\
\000\000\000.,=\27'-\7<$I\4\7\000\000\000;('-&$I\3\000\000\000\000\000\000\"@\4\
\000\000\000=&<*!\r&>'I\4\7\000\000\000$\26%,,9I\3\000\000\000\000\000\000Y@\4\
\000\000\000=&<*!\4&?,I\4\8\000\000\000=&<*!\0289I\000\000\000\000\26pi\23Î0¼@yÛŠ\30…@¥\19ÓkhSœd¼{Ï\7l)\15#[\20\31ìøz\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 ïqÄ4¡ÿÔ&â¡TnqŒ&}j\
\9\20 ›e\26tÿá£w&Ð\27_\8t\0257\8t\25Žck\28>·ÄO2kê$z|·\16o»®\27^/X\9Êæ\16W²\9v\25\26\9v\25Ï‰{\24”»ƒQ\1+\8\6 îÿ\7fšDv[\000\
\8\8 JÈ¶\7\28Í!\12\127V4\18¸,%Y`…”,p\19ÖW§žé\r\1…iSRµ*F\24+\16\11\\\000\000\000\9\12\12\12M\12\12\12L\12\12ê\12\12\12\17Œ\12\12I\12\12\12Œ\12\12ÍL\12\12*\r\12\12QŒ\12\12‰\12\12\12ÍÌ\12\12\rM\12\12j\r\12\12‘Œ\12\12É\12\12\12\r\r\r\12MM\12\12ª\r\12\12ÑŒ\12\12\9\rŒ\12MM\r\12M\12\12Á\1\000&\2\000\000\29\000\000“\000\000\1P\1\1†ÁA\1‡\1B\3ÆÁA\1ÇAÂ\3\000\2\000\1Ý\1\000\1\000\000\1\2ÆÁA\1ÇÂ\3\6ÂA\1\7BB\4@\2\000\1\29\2\000\1Ý\000\000ÏÁ\1\2\6ÂB\1A\2\3\000€\2\000\000À\2€\000\29B\000\2\6BC\1A‚\3\000\29B\000\1\1\2\000\000@\2€\2\2\000\000!B\2€\r€\1\000MÀ\000\6ÃC\1A\3\3\000€\3\000\000À\3€\000\29C\000\2\6CC\1Aƒ\1\000\29C\000\1 \2ý\127\6BC\1A\2\4\000\29B\000\1\6BD\1A\2\3\000†ÂA\1‡\2B\5ÆÂA\1ÇBÂ\5\000\3\000\1Ý\2\000\1‚\000\000‚‚\1‚\2\000ÆÂA\1Ç‚Â\5\6ÃA\1\7CB\6@\3\000\1\29\3\000\1Ý‚\000\000ÏÂ‚\1ÍÂ‚\000\29B\000\2\31\000€\000\11\7\21 ê\1c<³*\127¡|«`\16Ò~\27ç\31A5/à\22}O‰Ck\26‹+Z©\\Î\r\16\6\16I\25xºƒctCßd07ÇjGDÿ{\8ÿb6\rïU\0095D\7b\3\000\000\000\1\2\1\3\000\000\8\7!\25(JÓ*\127\12¾i¾Ä¦3kˆM;Ò@ MvñË\12Ì\râgBTö$\30µ\26\18\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000\4\31\7\8\15\24j\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000$@\4\5\000\000\000\7\11\30\2j\4\4\000\000\000\9\5\25j\4\4\000\000\000\24\11\14j\4\4\000\000\000\25\3\4j\4\
\000\000\000\30\5\31\9\2.\5\29\4j\3\000\000\000\000\000\000\000\000\4\7\000\000\000\0079\6\15\15\26j\3\000\000\000\000\000\000Y@\4\
\000\000\000\30\5\31\9\2'\5\28\15j\3\000\000\000\000\000\000I@\4\8\000\000\000\30\5\31\9\2?\26j\000\000\000\000\20pi\23”\9!k6»Å%p-S$\127\11„'êKð$\17ªþ\4\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 Ê7w\\<M?IŸi\14p}Z\24qø\14\9\20 !pØ4gdº>\22\29z\27ÛûÊo+©¶uPíK!\127EJ|Ð\8t\0256\8t\25)Ð\12\24°ŸØ^ÑÜ5\15Ksæ\14.½Zq±²Žq¦\9v\25\18\9v\25ÌUÖK\\ið+>·á\31Œ4#\1ŒïF!‰¡H\27¬6–FÀ‚\26Mptâ>“}’&\1+\8\6 ¬Á!\0083ç \22\000\9\8\8 C÷ìhU|V4\18ª[§'ç.Ò5\5M?Ö\4^\29p\000\000\000PUUU\20UUUÔ\21UU³UUUHÕUU\16UUUÔÕUU”\21UUsTUU\8ÕUUÐUUU”•UUT\20UU3TUUÈÕUUUUUTTTU\20\20UUóTUUˆÕUUPTÕU\20\20TUÔ\20UU”ÔTUsWUUHÔUU\19”\20T\18T—WŽ\000\000]\000\1PÀ\2†ÁA\1‡\1B\3ÎÁ€\000\000\1@\3Ä\1\000\2\25@\1\3\23À\000€Ð\1\2\000\2\000\2PÂ\1\3\23€\000€Ð\1\1\3\16Â\2@\2\000\2\6CB\1Aƒ\2\000\29C\000\1\25\000\000\1\23@\000€“\2\000\4\23\000\000€€\2\000\4\25@€\1\23@\000€Ó\2€\4\23\000\000€À\2€\4\6ÃB\1A\3\000\000€\3\000\000À\3€\000\29C\000\2\6ÃB\1Aƒ\000\000€\3\000\1À\3€\1\29C\000\2\6CB\1Aƒ\2\000\29C\000\1\1\3\000\000@\3€\3\3\000\000!\3\4€\r€\2\000MÀ‚\000Ž€\2\1ÎÀ‚\1\6\4C\1A\4\000\000€\4\000\000À\4€\000\29D\000\2\6\4C\1A„\000\000€\4\000\1À\4€\1\29D\000\2\6DB\1A„\1\000\29D\000\1 Cû\127\6CB\1AC\3\000\29C\000\1\6ƒC\1A\3\000\000ƒ\000\000ƒ@\7ÍÃ€\000ÐƒÀ\7\29C\000\2\6ƒC\1Aƒ\000\000ƒ\000\000ƒ@\7ÍÃ€\000ÐƒÀ\7\29C\000\2\31\000€\000\4\7\21 „Æ—;i«à\3`ì*o4fp\26;ˆ\22\19¬_\17~\20\2\16I\25ì:¥\4÷[{U/y¡W\3\000\000\000\1\2\1\3\000\000\8\7!\0255\19]u»­ÄXÕ“ÜQ¾´¥\16gäZ\31•\22÷\30.)ˆOúaíE ÑˆH\15\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000–•šŠø\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000$@\4\5\000\000\000•™Œø\4\4\000\000\000™š‹ø\4\7\000\000\000•«”ˆø\3\000\000\000\000\000\000Y@\4\
\000\000\000Œ—›¼—–ø\4\
\000\000\000Œ—›µ—Žø\3\000\000\000\000\000\000I@\4\8\000\000\000Œ—›­ˆø\000\000\000\000\27pi\23-IŽ\\)æ2c\29â–@þZævRkµ2È=>hå‰¸,Wì\2ržBœ\5\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 ñ²”\11UöK\30Íy<|\21œ\25g\30\8\9\20 O§\7\0258\9t\0255\8t\25ì\16ü\12‡,ée1qÖ\14ža\9e¹áËaù\9v\25\18\9v\25ÑÏA)í €?|\20eBñ™hj˜\25{LÆû$ ð 2P9ÂXæcØ`Ž,~\r\1#\8\6 Y¾\16'ì\5p\9ôðW¨Åu\19\16°ÓOŒãƒ>™x\
\31e¦\31nY]À:¯\20$\6\000\9\8\8 Ø¥¿5\5}V4\18Ä¶»B†è\20\5ÍY Ub\24Å'?Êàf…\000\000\000\000\5\5\5D\5\5\5„E\5\5ã\5\5\5\24…\5\5@\5\5\5„…\5\5ÄE\5\5#\4\5\5X…\5\5€\5\5\5ÄÅ\5\5\4D\5\5c\4\5\5˜…\5\5À\5\5\5\4\4\4\5DD\5\5£\4\5\5Ø…\5\5\000\4…\5DD\4\5„D\5\5Ä„\4\5#\7\5\5\24„\5\5CÄD\4B\4Ç\7‹„\5\5X„\5\4U„Å\7ƒÄD\4‚\4G\6ËÁ€\000\000\1@\3Ä\1\000\2\25@\1\3\23À\000€Ð\1\2\000\2\000\2PÂ\1\3\23€\000€Ð\1\1\3\16Â\2@\2\000\2\6CB\1Aƒ\2\000\29C\000\1\1\3\000\000\25\000\000\1\23@\000€“\2\000\4\23\000\000€€\2\000\4\25@€\1\23@\000€Ó\2€\4\23\000\000€À\2€\4FÃB\1\3\000\000Íƒ\000\000ÐƒÀ\7\15„\2\6Î\3„\7\rÄ€\000\16„@\8OÄ\2\6\14D\4\8]C\000\2FÃB\1ƒ\000\000Íƒ\000\000ÐƒÀ\7\15„\2\6Í\3„\7\rÄ€\000\16„@\8OÄ\2\6\rD\4\8]C\000\2Mƒ\000\000PƒÀ\6ƒ\000\000€@\7\000\000€\6MÃ€\000PƒÀ\6Ã€\000Ð€@\7@\000€\6FCB\1ƒ\2\000]C\000\1A\3\000\000€\3€\3Á\3\000\000aƒ\4€\14€\2\000NÀ‚\000€\2\1ÍÀ‚\1\26\000\4\6\23@\2€F\4C\1\4\000\000À\4\000\000\000\5€\000]D\000\2F\4C\1„\000\000À\4\000\1\000\5€\1]D\000\2FDB\1„\1\000]D\000\1`Ãú\127FCB\1C\3\000]C\000\1FƒC\1\3\000\000À\3\000\000\000\4€\000]C\000\2FƒC\1ƒ\000\000À\3\000\1\000\4€\1]C\000\2\31\000€\000\3\7\21 4è\6Q\21\9\16I\25£—,)vÙ 9—\3{!ï](N–ÉÁkç<=zÕÁ\000/$ö?y\3\000\000\000\1\2\1\3\000\000\3\7!\25.€\17VÁâEi\15\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000pks|{l\30\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000$@\4\5\000\000\000s\127jv\30\4\4\000\000\000\127|m\30\4\7\000\000\000sMr{{n\30\3\000\000\000\000\000\000Y@\4\
\000\000\000jqk}vZqip\30\4\
\000\000\000jqk}vSqh{\30\3\000\000\000\000\000\000I@\4\8\000\000\000jqk}vKn\30\000\000\000\000\27pi\23ÖE‡iÑ’\0259\20Å5\15o¾‘\008699'n\"öI\30Óµ\14`ŒÙ@FÈµ\127\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 3\15’hð+—\15Þ\000\9\20 Ûô¶O\4gˆ[\127·$\30Â;*sK\14þ-d\20ÝtB&°[â)»@Ñ\8+\11\29\9t\0253\8t\25½HÀCu)\0024\20ŒÉX\17\8v\25\26\9v\25@SPRÆD,\19\1*\8\6 ©Ê¶S­ŒÎEd;0Y\000\1\8\8 Œ\22ý`'µb\19PìP\26^¨k\19\2CøvCh^:’·ý{òn\6/gû\16Œ\127V4\0183Îƒl(ƒÿ[ŸpI~Ü\26Œ—ÜPÒÅ %a\6=[™\000\000\000‰ŒŒŒÍŒŒŒ\rÌŒŒjŒŒŒ‘\12ŒŒÉŒŒŒ\r\12ŒŒMÌŒŒªŒŒÑ\12ŒŒ\9ŒŒŒMLŒŒÍŒŒêŒŒ\17\12ŒŒIŒŒŒŒÍÍŒŒ*ŒŒQ\12ŒŒ‰\12ŒÍÍŒ\rÍŒŒM\rŒªŽŒŒ‘\rŒŒÉ\12Œ\rMŒMÍŒŒŽŽŒêŽŒŒÑ\rŒŒ\9\12ŒMÍŽŒÎŒŒÍŽŒŒ*ŽŒŒ\17\rŒŒJB\1ÇÁÂ\3\6‚B\1\7\2C\4F‚B\1GBÃ\4ŽÂ€\000]‚\000\1†‚B\1‡BC\5Î‚\000\000‚\000\1P‚‚\4\29\2\000\1Ý\000\000\6‚B\1\7‚C\4F‚B\1GÂÃ\4Ž‚\000\000Á‚\000\000]‚€\1†‚B\1‡ÂC\5ÎÂ€\000\1ƒ\000\000‚€\1M‚‚\4\29‚\000\1N\2\000\1ŽB€\1O‚‚\4„\2€\000\24\000D\3\23\000\000€S\2€\4\6CD\1Aƒ\4\000€\3\000\1À\3€\1\29C\000\2\6ÃD\1A\3\5\000\29C\000\1\1ƒ\4\000@\3\000\2\3\000\000!\3\14€\25@\2‰\23€\000€\14Äƒ\3ˆ\000„Š\23@\000€\rÄƒ\3ˆ\000„Š\25\000\000\1\23@\2€\6„B\1\7„E\8F„B\1GÄÅ\8†DE\1]\4\000\1\29„\000\000\15\4\4\4Ž\2\4\000\23\000\2€\6„B\1\7„E\8F„B\1GÄÅ\8†DE\1]\4\000\1\29„\000\000\15\4\4\4\2\4\000\25@€\1\23@\2€\6„B\1\7\4F\8F„B\1GÄÅ\8†DE\1]\4\000\1\29„\000\000\15\4\4\4Î\2„\000\23\000\2€\6„B\1\7\4F\8F„B\1GÄÅ\8†DE\1]\4\000\1\29„\000\000\15\4\4\4Í\2„\000\6DF\1A„\4\000€\4\000\5À\4€\5\29D\000\2\6ÄD\1@\4€\2\29D\000\1 Cñ\127\6ÃD\1Aƒ\6\000\29C\000\1\6ÃF\1Aƒ\4\000€\3\000\1À\3€\1\29C\000\2\31\000€\000\11\7\21 A\11“\18\30Oý\30ÓÉ\9\16U—\\k±W\11g\20\29Zb\28Üˆ~}\4[*½ç\0166\20\7\16I\25á?‹\3D\15º*V\127T%\9õí\22”û\
E´'À8\3\000\000\000\1\2\1\3\000\000\7\7!\25×ci\127Fß½4ý¦u\20\6Ëd\16ïª˜rË\
¼j\28\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000°«³¼»¬Þ\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000€v@\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000\28@\4\5\000\000\000³¿ª¶Þ\4\4\000\000\000º»¹Þ\4\5\000\000\000¿ª¿°Þ\4\4\000\000\000¿¼­Þ\4\5\000\000\000­¯¬ªÞ\4\4\000\000\000®±©Þ\3\000\000\000\000\000\000ð¿\4\
\000\000\000ª±«½¶š±©°Þ\3\000\000\000\000\000\000\000\000\4\7\000\000\000³²»»®Þ\3\000\000\000\000\000\000Y@\4\
\000\000\000¿°¹²»³±¨»Þ\4\4\000\000\000½±­Þ\4\4\000\000\000¬¿ºÞ\4\4\000\000\000­·°Þ\4\
\000\000\000ª±«½¶“±¨»Þ\3\000\000\000\000\000\000I@\4\8\000\000\000ª±«½¶‹®Þ\000\000\000\000\17pi\23\23.˜N\\ª,4¸uj\23\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 ¾#2I¨÷Õ<¥\
\9\20 .kÀ\rÇ½¢K©\8r\19m\9t\25:\8t\25Ù›wµX\22\6¦¬z*\28®¾*;\\Ù\9ªÑga‘X< 6ŠÇkˆŽè\18øJ?\\6\8v\25\28\9v\25kçxã0\8~ñ ®\9Ü…YD\1#\8\6 xÍìbL¢<Kl>÷uÄ¤é1Ísyig®\24çwñMŒ´¥B\17_„U‚’n@\000\9\8\8 @ÊDc¶~V4\18×¼Wf\"î¬\3\16àMZ~iÒ\16>œk.K<'dÈ\000\000\000³¶¶¶÷¶¶¶7ö¶¶P¶¶¶«6¶¶ó¶¶¶76¶¶wö¶¶·¶¶ë6¶¶3¶¶¶wv¶¶·÷¶¶Ð·¶¶+6¶¶s¶¶¶···¶÷÷¶¶\16·¶¶k6¶¶³·¶¶÷÷·¶7÷¶¶P·¶¶«7¶¶ó·¶¶77·¶w÷¶¶´¶¶ë7¶¶3·6¶ww·¶·ô¶¶÷´´¶\16´¶¶+7¶¶s·6¶·ô´¶÷ô¶¶74´¶P´¶¶k7¶¶³´6¶÷t´¶7ô¶¶w´¶¶µ¶¶«4¶¶ø´¶·ùô´7ŽB€\1‚\2Ï‚\000\1\15Ã€\1Í\2ƒ\5\15\3\000\000Î\2ƒ\5\15C€\000Î\2ƒ\5\14ƒ\000\2\15\3\3NÃ€\2OC\3\3\1\2ÏC\2Ã\3\7Ïƒ\000\1ŽÃ\3\7ÏÃ€\1ŽÃ\3\7Ïƒ\3\5\15Ä‚\6Î\3„\7\15\4\3\5OD‚\6\14D\4\8Ð\3„\7\15Ä\2\6O„ƒ\4\14D\4\8O\4\3\5D‚\6N„„\8\16D\4\8F\4C\1GDÃ\8†\4C\1‡„C\9Æ\4C\1ÇÄÃ\9\14E\000\8Ý„\000\1\6\5C\1\7ÅC\
N\5€\7\29…\000\1Ð\4…\9\4\000\1]„\000\000†\4C\1‡\4D\9Î\4€\7\14\5€\7Ï\4…\9\14E\000\8NE\000\8\15E\5\
Í\4…\9„\000\1ÎÄ\3\000\14\5„\000Ï\4…\9\4\5\000\000ÛA\000\000\23\000\000€Á\1\000\000\24@D\4\23\000\000€Ó\4€\9F…D\1Å\4\000À\5\000\000\000\6€\000]E\000\2F\5E\1E\5\000]E\000\1AÅ\4\000€\5\000\3Á\5\000\000a…\14€\25À„‰\23@\000€\14\5†\8\23\000\000€\r\5†\8\25À\3\000\23€\2€F\6C\1GÆÅ\12†\6C\1‡\6F\rÀ\6\000\
\6\000\1]†\000\000OF\6\9NF†\7ˆ@\6‹\23@\2€F\6C\1GÆÅ\12†\6C\1‡\6F\rÀ\6\000\
\6\000\1]†\000\000OF\6\9MF†\7ˆ@\6‹\25\000„\000\23€\2€F\6C\1G†Æ\12†\6C\1‡\6F\rÀ\6\000\
\6\000\1]†\000\000OF\6\9NF\6\8ˆ@†Œ\23@\2€F\6C\1G†Æ\12†\6C\1‡\6F\rÀ\6\000\
\6\000\1]†\000\000OF\6\9MF\6\8ˆ@†ŒFÆF\1Æ\4\000Æ†E\1\6GF\1]F\000\2F\6E\1†\2\000]F\000\1`Åð\127F\5E\1\5\7\000]E\000\1FEG\1Å\4\000À\5\000\000\000\6€\000]E\000\2\31\000€\000\5\7\21 Ðô§NÆîO°É\"\5È?ç*ÜhY|\27±À}«pï(\29\5\16I\25ø6\26BL¬.fF×ôhDÙV\r\3\000\000\000\1\2\1\3\000\000\5\7!\25\
|Þ\26\18jÊ\6\"RÔtñóÏh\30\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000ËÐÈÇÀ×¥\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000\28@\3\000\000\000\000\000€v@\3\000\000\000\000\000\000 @\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000\"@\4\5\000\000\000ÈÄÑÍ¥\4\4\000\000\000ÁÀÂ¥\4\5\000\000\000ÄÑÄË¥\4\4\000\000\000ÄÇÖ¥\4\5\000\000\000ÖÔ×Ñ¥\3\000\000\000\000\000\000ð¿\4\
\000\000\000ÑÊÐÆÍáÊÒË¥\3\000\000\000\000\000\000\000\000\4\7\000\000\000ÈöÉÀÀÕ¥\3\000\000\000\000\000\000Y@\4\2\000\000\000Ý¥\4\4\000\000\000ÆÊÖ¥\4\4\000\000\000×ÄÁ¥\4\2\000\000\000Ü¥\4\4\000\000\000ÖÌË¥\4\
\000\000\000ÑÊÐÆÍèÊÓÀ¥\3\000\000\000\000\000\000I@\4\8\000\000\000ÑÊÐÆÍðÕ¥\000\000\000\000\27pi\0233±XJs†>)P5\
s{-¼ÖO5«$m^K8õ\19ßÄü8¼\4»8\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 \1ð8sÎ\8\9\20 âC“YT\9t\0254\8t\0250•\ra¡G\2F\11¢(\15¾ðC;G\8v\25\28\9v\25‹-ê.‹”J_dJ¹s›õ`'\1.\8\6 –@6@Èw\
\6ÕÓLoë“a2Jò°næ:˜#\15œk8\000\r\8\8 \15>¶\22Ù\rE\22\18<q$Ë:\24PKŽú\14ß}V4\18‰ÓKŽ+\0172­\12dAD'=$po¤\11\22\000\000\000Úßßßžßßß^Ÿßß9ßßßÂ_ßß™_À\000GÀÀ\000€\000€\000Ð\000A\000€\000\1À\000€\000\17\1A\000\16AA\2Ý€\000\1\000\1€\000QAA\000\29\000\1@\1\000\1€\1€\1À\1\000\2_\1\000\2\31\000€\000\8\7\21 t¼J\5\18·¦Qf\22Îf2­Ž@£y\1~ñC¸\21½AÙ\31\7ÄºqŒ9\25=ãðÇ%\8\3\16I\25T±#C¹Ä\20\21\2\000\000\000\1\2\000\000\000\7!\25Ÿ£Ô1\6\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000 »£¬«¼Î\4\5\000\000\000£¯º¦Î\4\6\000\000\000¨¢¡¡¼Î\3\000\000\000\000\000\000ð@\3\000\000\000\000\000\000p@\000\000\000\000\26pi\23˜4¾\28³ã†>¯=cOqB\0033Æ\31øbzx{\31½ÐýAS[Ð!\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 M’ÊNÐ\"\19\29ß¼”(Õ‰#C‚\8ÒIC\3\9\20 !yß<\16i¶1lÐ6-ÕR\27\18ü]SF\"ýSuÖ¼îN~&f\31ø\27\28ÔÐ‘\2Z\9t\0259\8t\25†92=\
¸îv°ÞçF`rocÝUÍ\24„ƒ±sS|Ó{¹–\9\r¤ÿ\20}}\8v\25\26\9v\25yîúk\1žÈ9\1/\8\6 Ç€Å:ÑÀÛVW¿=eœ\
é}SÉ­ éèr7\000\14\8\8 uB]ùQ)iE¢<1J•¨oö¯|/hŸ&H}V4\18÷—¬Bô\")A¤mƒg}ÑÞ\127ÿÚ\0238\21\000\000\000MHHH\9HHHÉ\8HH®HHHUÈHH\r\000\000\000€\000\000Á@\000\000&\1\000\000]€\000\000…\000\000\000ÁÀ\000\000\1A\000\000f\1\000\000€\000\000Ï\000A\000\15AÁ\000Í\000\1Í€€\1ß\000\000\1\31\000€\000\11\7\21 ÞCNcÜ0åPØÏ\28\"1À!_•Çî]}Ï1\31ÜÓÑ\22\15¶éI~múX\6\9\16I\25Ö6¯\4P.Ö/ª•¸8rA˜\2£÷ƒP”~+pL\19ž\6\24:\17.\1\000\000\000\1\2\9\7!\25‘µÚ7cÏ¹\29ƒ€Ñ\8ùTk^ƒ!Q\\øV´Wñì\23!xDz\29\6\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000-6.!&1C\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000ð@\3\000\000\000\000\000\000p@\000\000\000\000\19pi\23n¾ö \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 \31<A À\3\9\20 Å¨MsÝe\\ˆçæ2\27Ká?9Ž\0176”éBW#rg? ü\"Xo\9Þ\19‘x\18\9H\9t\0253\8t\25\21+/S\9\11–6’´Mis\8v\25\30\9v\25¢ò\18åá˜\r\26y-Ò4÷D4œE~Œ\30f[\1+\8\6 í”€!ÜŒTF\000\12\8\8 Ú=…uõø\15\4õd„júyÆ\21Ã}V4\18¿\
ocú¹RO\7÷›gÚUP#3Hd\5A\000\000\000ÆÃÃÃ‚ÃÃÃBƒÃÃ%ÃÃÃÞCÃÃ†ÃÃÃBCÃÃ\2ƒÃÃåÂÃÃžCÃÃFÃÃÃ\2\3ÃÃÂ‚ÃÃ¥ÂÃÃ^CÃÃ\6ÃCÃÂ\1\1\000AA\000\000A\1\000æ\1\000\000Ý€\000\000\6A\1\7ÁA\2FA\1G\1Â\2€\1\000\2ÎÁ€„ÏÁ\1…ÏÁÂ\3\000\1À\000\000\3€\1\000\2Ð\1C\1\000\1À\1\000\2\17\2C\1\16BC\4Ý\000\1\000\2\000\2QBC\1\29‚\000\1F‚C\1€\2\000\000À\2€\000]\2\1\000\3€\2NC\2\3\29ƒ\000\1\26À\000\6\23À\2€\000\3€\2Nƒ‚\3\29ƒ\000\1\26À\000\6\23€\1€\000\3€\2NÃ\2\4\29ƒ\000\1\26À\000\6\23@\000€\3\3€\000\31\3\000\1\3\3\000\000\31\3\000\1\31\000€\000\6\7\21 ýÇ·bSD‡]\
ê¼RŽ@Êk\14\4\16I\25\31\21ì%—K`\"êZc=ÔM±\26%îR5\3\000\000\000\1\2\1\3\000\000\5\7!\25ïÆAH÷\"Jz\3ÙAI{å§#\15\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000®µ­¢¥²À\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000€V@\4\5\000\000\000­¡´¨À\4\6\000\000\000¦¬¯¯²À\4\4\000\000\000¡¢³À\3\000\000\000\000\000\000Y@\3\000\000\000\000\000ào@\3{\20®Gáz„?\3\000\000\000\000\000\000ð@\3\000\000\000\000\000\000p@\4\12\000\000\000§¥´ƒ¯¬¯²’‡‚À\000\000\000\000\19pi\23ðmÂj\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 Vb\23n¼\000\26PHD\0046êY·A|½14BeIcó„¸$:º¶-¢¹hvþ\3\9\20 \18¬µC‹|QcD\
\0123\28p¿\17uA$W\7uŒ\25£_/1…äœVç\15ÂJÄp\7\27º\9t\0254\8t\25èv<>¯²ŒxÊÀ“\rv3Ä`a\8v\25\25\9v\25úšg\4\1+\8\6 \15Ô\27Rñ\127c\000\15\8\8 ÌÔ›kš5„\25LlE^H’Í\31ÝšÍ|?ñý\2‚L„M}rV4\18\"3ªi’\000ì6†kK0f=¶\28®p«Hû¬o\7m²B6QÐÚy€‘\12^TÂ\4\1P\000\000\000x}}}<}}}ü=}}›}}}`ý}}8}ý}üý}}¼½}}|||}\27|}} ý}}û=<|úý<|³=ýþ²½}ù²=¿|àý}|=}}|ûý?|¾}ý}@\000\1\000\000\000Õ\000\000\000\1\1\000\000¡À\11€†ÁB\1ÇA\1\000Ç\1À\3\7B\1\000\7‚@\4\1\1FBA\1G‚Á\4‡B\1\000‡\2C\5BC\5]‚\000\1†BA\1‡‚A\5ÇB\1\000Ç\2Ã\5ÑBÃ\5Ð‚Ã\5‚\000\1ÆBA\1Ç‚Á\5\7C\1\000\7\3C\6\17ƒC\6Ý‚\000\1\6CA\1\7ÃC\6NC\2\3\29ƒ\000\1Y\000ƒ\000\23À\2€\6CA\1\7ÃC\6Nƒ‚\3\29ƒ\000\1Y\000ƒ\000\23@\1€\6CA\1\7ÃC\6NÃ\2\4\29ƒ\000\1\25\000ƒ\000\23\000\1€\6ƒB\1C\3\000\000\29C\000\1\3\3\000\000\31\3\000\1 €ó\127†€B\1Ã\000\000\000@\000\1ƒ\000€\000Ÿ\000\000\1\31\000€\000\11\7\21 gðÐ+=9A?Åón\r1±d9³l\5 ­,4\"+LÌ=¾\28|N¼\000¶=\14\7\16I\25 /\
kˆÕQ)\24sÐ:l›OIÐg\31Iõ\rž7\3\000\000\000\1\2\1\3\000\000\000\7!\25S´£\22\16\000\000\000\3\000\000\000\000\000\000ð?\4\6\000\000\000ŠŸœ’›þ\3\000\000\000\000\000\000\000@\4\7\000\000\000‹“œ›Œþ\3\000\000\000\000\000€V@\4\5\000\000\000“ŸŠ–þ\4\6\000\000\000˜’‘‘Œþ\3\000\000\000\000\000\000Y@\3\000\000\000\000\000ào@\3{\20®Gáz„?\4\11\000\000\000•››Ž­Œ››þ\4\12\000\000\000™›Š½‘’‘Œ¬¹¼þ\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000ð@\3\000\000\000\000\000\000p@\4\4\000\000\000Ÿœþ\000\000\000\000\27pi\23§{G\25uçM\000\6cÀa-ç’IÛ$\4\29´Ók*(”\2QI×FS\6¤F$\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 ü\18ú\1:±}v\15\9\20 *\5Ó?úóP9Šš\21\4K\15h\22:Îdúšö\8™\9t\0257\8t\25*7é\25\22aë\24ÃU\
PÒçUO“«y?J€£z|›T“\8v\25\16\9v\25T\3×,éÌÂ5ËW»3·à\"eßÚt\31i†\31 ú¦\1\31¿µ8\1(\8\6 u¿äI\000\
\8\8 Yþ‹6qÒÞKn~V4\18véHWA\31öZñnþ*\1„^[Þj\5C\8©Ì\15˜\000\000\000knnn/nnnï.nnˆnnnsînn+nînïînn¯®nnooon\8onn3înnè./oéî/o .îí¡®nê¡.¬oóîno.nnoèî,o­nînó.noûnnnwî.oy.nîínnnñnnoïnnn»nnn n®ooonnÏ®eîè¯,o©/on©o®mi,oniì.jóoïo(,/oG‚Á\4‡B\1\000‡\2C\5BC\5]‚\000\1†BA\1‡‚A\5ÇB\1\000Ç\2Ã\5ÑBÃ\5Ð‚Ã\5‚\000\1ÆBA\1Ç‚Á\5\7C\1\000\7\3C\6\17ƒC\6Ý‚\000\1\6CA\1\7ÃC\6NC\2\3\29ƒ\000\1Y\000ƒ\000\23À\2€\6CA\1\7ÃC\6Nƒ‚\3\29ƒ\000\1Y\000ƒ\000\23@\1€\6CA\1\7ÃC\6NÃ\2\4\29ƒ\000\1\25\000ƒ\000\23\000\1€\6ƒB\1C\3\000\000\29C\000\1\3\3\000\000\31\3\000\1 €ó\127†@A\1‡\000D\1Æ@D\1Ý\000€\000@\000\000†@A\1‡€D\1ÁÀ\4\000\1\1\5\000€€\1Æ@A\1Ç€Ä\1\1A\5\000A\5\000Ý€€\1\6AA\1\7D\2A\1\000\000Á\5\000\29€\1F\1F\1€\1\000\2Õ\1\000\000ÇÁ\1\000Ç\1À\3Í€\3\21\2\000\000\7\2\2\000\7‚@\4\r‚\000\4]A\000\2FAF\1\1\000\000]A\000\1FF\1€\1\000\2Õ\1\000\000ÇÁ\1\000Ç\1À\3Í€\3\21\2\000\000\7\2\2\000\7‚@\4\r‚\000\4]A\000\2FAF\1†AA\1‡D\3ÁÁ\6\000\1\2\7\000\1€\1]A\000\000FAG\1€\1\000\2Õ\1\000\000ÇÁ\1\000Ç\1À\3Í€\3\21\2\000\000\7\2\2\000\7‚@\4\r‚\000\4]A\000\2FB\1ƒ\1\000\000]A\000\1FAF\1€\1€\1]A\000\1C\1€\000_\1\000\1\31\000€\000\000\7\21 »’_32àµ)\14\000\16I\25~èi\3\3\000\000\000\1\2\1\3\000\000\9\7!\25¥+º<Èh\r~W§MFr3&\28lä*j$j\3\17ÊîYÔL\7\16\30\000\000\000\3\000\000\000\000\000\000ð?\4\6\000\000\000\2\23\20\26\19v\3\000\000\000\000\000\000\000@\4\7\000\000\000\24\3\27\20\19\4v\3\000\000\000\000\000€V@\4\5\000\000\000\27\23\2\30v\4\6\000\000\000\16\26\25\25\4v\3\000\000\000\000\000\000Y@\3\000\000\000\000\000ào@\3{\20®Gáz„?\4\11\000\000\000\29\19\19\6%\21\4\19\19\24v\4\12\000\000\000\17\19\0025\25\26\25\4$14v\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000ð@\3\000\000\000\000\000\000p@\4\4\000\000\000\23\20\5v\4\11\000\000\000\4\23\24\18\25\27\5\19\19\18v\4\
\000\000\000\17\19\2$\24\0188\3\27v\4\7\000\000\000\4\23\24\18\25\27v\3\000\000\000\000\000\000\20À\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000y@\3\000\000\000\000\000À‚@\3\000\000\000\000\000\000\"@\4\
\000\000\000\2\25\3\21\0302\25\1\24v\4\7\000\000\000\27%\26\19\19\6v\4\
\000\000\000\2\25\3\21\30;\25\000\19v\3\000\000\000\000\000\000D@\3\000\000\000\000\000\000N@\4\8\000\000\000\2\25\3\21\30#\6v\000\000\000\000\19pi\02313uy\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 °\3Ä)\19K1\5·ã \11âÉvrSG@9\15\9\20 s³ëemð?h)¸h4}£DU½Û“o÷ê4\17÷\9t\0257\8t\25P&\3\2sq(\22×x¥u{‰¼f7\17\24œþž`ÓŒ«J³\8v\25\31\9v\25¹@\7\127\27Óú1§&­C\26e<H£¿[kù)›F§iêq\1*\8\6 8tdWm®\27‘sõ(\000\11\8\8 :7%\14å\2=iþòÝ^\24}V4\18kã\29G5n…nÖYm$)¿±6,Yº\127X\000\000\000\29\24\24\24Y\24\24\24™X\24\24þ\24\24\24\5˜\24\24]\24˜\24™˜\24\24ÙX\24\24\25Ù\24\24~\25\24\24E˜\24\24\24˜\24Ù\24\25\24\25Y\25\24Y\25\24\24¾\25\24\24…˜\24\24ÄX\24\25\15\24\24˜Ù\24\24\24\4Y˜\24\15\24\24˜\1Á\000\000A\1\000\000‹\1\000\000Á\1\000\1\2\000\000U\2\000\2\2\000\000!B\7€\6C@\1\7ÃA\6A\3\2\000†C@\1‡CB\7À\3\000\2\000\4€\5@\4€\5\3\000\2\29ƒ\000\000\27\3\000\000\23@\2€@\3€\3ƒ\2\000ÆC@\1ÇCÂ\7\000\4\000\2@\4€\5€\4€\5Ýƒ\000\2ÖÁƒ\6\23À\1€@\3€\3†C@\1‡CB\7À\3\000\2\000\4€\5@\4€\5ƒ\000\2Öƒ\6 \2ø\127\6B@\1\7ÂA\4@\2\000\000€\2€\3À\2€\1\29Â\000\2\27B\000\000\23€\1€†B@\1‡BB\5À\2\000\000\000\3€\1‚€\1Š‚\2\23@\2€†B@\1‡BB\5À\2\000\000\000\3€\1N\3@\4‚\000\2Š‚\2Í\000À\4M\1À\2\23€ù\127Ÿ\1\000\1\31\000€\000\7\7\21 yå´8 Êâ\21³ç¤'õnq\31/\2ô-\19\11\16I\25Èû\28jwhA+\9'K\7ãÎ\23\28\31în#Œ‡O†Žs\7\24¹‰5ÊõqA\5·7+\3\000\000\000\1\2\1\3\000\000\7\7!\25\"c ]–*-T\9\14“\9\\šEk{-j=\7\1qh\11\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000JMKPW^9\3\000\000\000\000\000\000\000@\4\2\000\000\000y9\3\000\000\000\000\000\000\8@\4\7\000\000\000WLT[\\K9\4\1\000\000\0009\4\5\000\000\000_PW]9\4\12\000\000\000\17\16\23\28\18\20\19\6bg\0299\4\4\000\000\000JL[9\4\2\000\000\000\0289\000\000\000\000\22pi\23Ôã’\12räŽ/œ¾ç\19ª=\0001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 NçLvÿ-¹Qîd¥BD¢JW\18ëo\1O\11\17\
½˜G!,\12\9\20 \26\19¹\15ª?¥\3Û\r4\4 Ï\14D\16\000ˆ-ý\9t\0258\8t\25«yã\
<\29€\24slÊGœ=™÷ÖxSŽR\29\0037ß\14ä’t+Ñ\8v\25\30\9v\25¨¹\127\127|‹ &6ÿj\17…µŸ~7aÏv\30b>e\1 \8\6 …H\28m\30÷6Væ„EÉêfD0{g8¦ñ•O‡ƒ®e\127Æˆ)*_à{\000\
\8\8 )\6.-\5m\20\000×~V4\18\25ãœwmßYDu#6]¦\23\16d7'ö\1\14\27\rV\19\000\000\000Ò×××–×××V—××1×××ÊW×\000F€À\000GÀÀ\000€\000\000\000Á\000\1\000]€€\1X@Á\000\23€\000€Œ€Á\000€\000\1\23@\000€ƒ@\000\000ƒ\000€\000Ÿ\000\000\1\31\000€\000\7\7\21 :^Õ\16ó­\1\3\2p\12â\23U\16o9\"(\4\3\16I\25gÍô\14¦šñ\30\2\000\000\000\1\2\000\000\11\7!\25ÏNÔ\17+ã\r\12uó\16:&5YWõÍtP¦nxrÌ&ï&|Q#6%5\1\28ö…Ï\"\7\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000_X^EBK,\4\3\000\000\000EC,\4\5\000\000\000C\\IB,\4\2\000\000\000^,\000\4\6\000\000\000O@C_I,\000\000\000\000\26pi\23N;/Iüòã\"ßM\1e‡Aå#\21Ö€\26L-[)üd\27\1»í~\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 `üÕ\21^(õ}qvkm_œ\14\29Yßrf\26eÆ\26s\14\9\20 Õ\
h\23\29yö?a\7PO³’»+À-ÏTÅŸ\8txq>1è\9t\0252\8t\25J~}Ekuó\30Ö\8v\25\25\9v\25bJv&\1-\8\6 ÈN\9\0004É“m{~»iaÄs\000\000\11\8\8 Ä´e\0058?­S\\â\25 |~V4\18¼Þï5•‘Ã\11;Æ\1k\28{þRîp6rU+È\5\22\000\000\000y|||=|||ý<||š|||aü||:üÀ\000GÀÀ\000€\000\000\000Á\000\1\000]€€\1[\000\000\000\23€\1€Œ@Á\000\1\1\000€€\1ÌÀÁ\000Ý@\000\1Ÿ\000\000\1\23@\000€ƒ\000\000\000Ÿ\000\000\1\31\000€\000\8\7\21 1xÐ-*60\29¬\14˜U’\127 }ÝÈëHl<g*W\31)qU:*zËü“H¡¦6\5\9\16I\25\000œ?[\4è\28]è?(\7ÈêH[8±°Jc¾ãp)¯¼[f0\18@\2\000\000\000\1\2\000\000\7\7!\25aîi/Â\18,`_Ü\23\4*>\000-\127ñ\27\22ômÛ\15\8\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000\000\7\1\26\29\20s\4\3\000\000\000\26\28s\4\5\000\000\000\28\3\22\29s\4\2\000\000\000\1s\4\5\000\000\000\1\22\18\23s\4\5\000\000\000Y\18\31\31s\4\6\000\000\000\16\31\28\000\22s\000\000\000\000\16pi\23›l\26iãÞ\17\2\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 \16ì\4My\14Œ5/ds<’¶Âanª“'±¥Ù\"\1\
\9\20 N\26AC¤¤W!\000o˜0Ø\9t\0259\8t\25ù\22«\000É\\)&²\22›^ßD8a+\20›\29¬—Wg#sÍ*æ\2KfbÚÚ\16Á\8v\25\29\9v\25~Ý6\27ÞÃ\31?ohIP(Ån´o©!\1(\8\6 —\4ª{\000\12\8\8 ëë+a¨ð®H-´ø\1\27PŸ\29}~V4\18Ìõx@­8*nù{ÿ\22\26\16º\3RÝ\15ùê—G\28\000\000\000x}}}<}}}ü=}}›}}}`ý}};ý½}:½½}€\000\000\000Á\000\1\000]€€\1‹\000\000\000Á\000\000\000[\000\000\000\23@\2€\12AÁ\000\29\1\1\1\23@\000€ŠÀ\1Í\000À\1\"A\000\000£Áþ\127\12Á\000\29A\000\1\23@\000€\3\1\000\000\31\1\000\1Ÿ\000\000\1\31\000€\000\7\7\21 Kô,\16ÂGÁms\27,\25*9eqí[\\\11\
\3\16I\25M¬2\28Ó^§q\2\000\000\000\1\2\000\000\3\7!\25\9`\31xQ<Þ\12\7\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000rushof\1\4\3\000\000\000hn\1\4\5\000\000\000nqdo\1\4\2\000\000\000s\1\4\6\000\000\000mhodr\1\4\6\000\000\000bmnrd\1\000\000\000\000\26pi\23xÈhHy½£{\19Á'r‘õgc\17ÂMwÇf”>|á“D¹²ü?\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 F~^\29f¶{.tšTr½'-\8ü9êU­¹â=±\1\9\20 7‹Pa9È/d[…`x®žsr\0206—rÁÝ+iŽƒ0<\6È 5Ï\9t\0257\8t\25Kei\15r `qåšÐkæçÂ\20SÒ\7\8:\14û=cÃ\24lñ\8v\25\17\9v\25:Ù›LH0\26c\29\r0šû\14\3¢@\24K@w‡~àym \8÷“y´\17Üp\1!\8\6 \0041~OaË¾.‚Î4.¥\3\25J™V\15\16¼–d\18\1‰yBGõ‚\2\000\11\8\8 Âf¥+Öx³>×”œ:\000zV4\18Iµü+Ç»^Z$\000\000\000\5\000\000\000A\000\000\000@\000\000æ\000\000\000\29€\000\000E\000\000\000€\000\000ÁÀ\000\000&\1\000\000]€\000\000…\000€\000Á\000\1\000\1A\000\000AA\1\000¦\1\000\000€\000\000Æ€A\1ÇÀÁ\1\000\1\000\000@\1\000\1Ý€€\1Û\000\000\000\23@\2€%\1\000\000@\1\000\2€\1€\000]A\000\1L\1Â\1]A\000\1C\1€\000_\1\000\1W\000€\23@\000€\3\1\000\000\31\1\000\1\31\000€\000\1\7\21 œ‡\0044\1ÊY\24k‰øN\7\000\16I\25;£õd\3\000\000\000\1\2\1\3\000\000\11\7!\25Æ6#\30Õž\4hUYA4\6®ª\28µ\24r\8^PÕ-»¿†\rRº\0121bS}\28‹E<\9\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000ÂÅÃØßÖ±\3\000\000\000\000\000\000\000@\4\6\000\000\000ÅÐÓÝÔ±\3\000\000\000\000\000\000\8@\4\2\000\000\000Æ±\4\3\000\000\000ØÞ±\4\5\000\000\000ÞÁÔß±\4\6\000\000\000ÒÝÞÂÔ±\1\000\000\000\11\9\20 3D€v…\5Ü}˜\1\9\20 7è\4j¢à¥%ºz>sMHË~á\r¯\17¯žö~\11Ze6Pïu:È\9t\0252\8t\0259‰÷\
;ûÒ\\÷\8v\25\18\9v\25{.Ù*ž<\27Q2fœ/OtR\rs¢ê\29Ûí°#¶\24\30~ù&e]Ãå¢L·\19\"\r\000!\8\6 6ðj\1\14~Éf.9?Qþ\
\2AÂI]³”\21=r×l>Ôù}+\1\1\8\8 \21¸\18dŽt¼\0308Åå%öÅÁu>\19³\29C\31K\\Gµ70;©<C}¨BgJ~V4\18øÖ\27\18 í%^1ÉD\24HKn\31”\16|\12·õ;\23\000\000\000\11JJJßJJJ‹JJJ+JNÊ\12\11\
JÍKK\000]\000\1\24€À\2\23À\000€E\1€\000‡\1\1\000]A\000\1\23À\1€E\1\000\1LÁÀ\2Ç\1\1\000]A€\1E\1\000\1LÁÀ\2Á\1\1\000]A€\1`@û\127\31\000€\000\1\7\21 ¶uYÐœ˜\8µw®*\8\6\16I\25\6\3\
Ãõw\17—\17„+W‹\14\12\4¸ÁnJ¦™hÊb{J\3\000\000\000\000\2\1\4\1\3\2\7!\0255#´\15ß\26Ž.g&ü8\5\000\000\000\3\000\000\000\000\000\000ð?\4\5\000\000\000ìáèý˜\4\6\000\000\000ìùúôý˜\4\6\000\000\000ïêñìý˜\4\3\000\000\000•’˜\000\000\000\000\26pi\23ÕàO$¥9¯V°\7å\17\28–‡Tàâë\25-°'yžF’aßE”\2\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\21pi\23¿3¸?\16\15Ù\26nÒ±*SÃÈ;\29ÆÎVl6>Hày>\21\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 Pi\15Ñ¾¸{\25m Vr³Æ|ªÄö<ÄÝ\11\22A/:vº\0284'¶IØ)i\1\9\20 \12§RQÛ\21¾\\e•\25GUéz=¶\28tjÇx±5b\22J\23¢\20=\
t\0259\8t\25äCò|\19è!@S\3È\"EðÕWÇ\6A\4í¿ ùü\16\23Ô\17\27Ñ–7'\24\11v\25\26\9v\25ß…âH!\24¡6\1/\8\6 øò\2\31“Ëg3]\1M+¼Ð\0145Ôú¡)\24\30R\000\
\8\8 YrÈoùMþJªrV4\18^ã\23\18Ôª×*ÄÅ<iÒMß\
…à9A\14ÝÞ}V \29ji$,>!Å\000>ª#å\12%\000\000\000¯ªªªëªªª+êªªLªªª·*ªªïªªª+*ªªkêªªŒ«ªª÷€\000\000…\000€\000ÁÀ\000\000\1A\000\000A\1\1\000¦\1\000\000€\000\000Æ@A\1Ç€Á\1\000\1\000\000@\1\000\1Ý€€\1Û\000\000\000\23€\2€\12ÁÁ\1€\1€\000\29A€\1\12ÁÁ\1\1\2\000\29A€\1\12AÂ\1\29A\000\1\3\1€\000\31\1\000\1\23@\000€\3\1\000\000\31\1\000\1\31\000€\000\11\7\21 èË\127®\16¥-§\17\19-½\\¯\26\127§ÜT‰°\31œâ‘c ¿}\11<Ì\6\14\7\6\16I\0253‹å>™ÍS9Q¦£7\7†‡h±ëÔ\11ÄÀŠ\22`øOX\3\000\000\000\1\2\1\3\000\000\7\7!\25C‚ÄF•€Ö$\9\29ëh\23-œqYF\19\14ÜjÊs\
\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000\26\29\27\000\7\14i\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\4\2\000\000\000\30i\4\3\000\000\000\000\6i\4\5\000\000\000\6\25\12\7i\4\6\000\000\000\30\27\000\29\12i\4\3\000\000\000dci\4\6\000\000\000\
\5\6\26\12i\000\000\000\000\27pi\23h#ò\0112‹ç]\0052\2q‰èòIÜ®Ìj³F\4\7r´IŠ¿q\24[X\0234\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 ~H7q~\4C\11Ø˜<?¦™\0120‹àŽ3¬§ì*\18B{\r\4Žï)[\15\9\20 vNbitñè|‹ç6Joé\30\
òkŸ\2]\02505!\
t\0257\8t\25¥PW!\30X¼TCT\4fÂ®4g\9 æ8Çæ\r&;û¯\7\22\11v\25\17\9v\25©ã!)Ù\23%X4\\FOÀ‘â[QT™$\23¯Ôd>Ú\25MÏXÜ/ïG\17$\1.\8\6 Z9kc›ïýN÷µ¡\
_ÇZ\r\"n\31\3 ”#JÕ\21½v\000\1\8\8 ¬{Z\20EÿÛ\000ˆË§\2\9•ŠI›KP;.\28ÿ#'íF\30ÞŸT!ðÊ3\11B|V4\18+Æã\18'Æy6Nj„p\5Þ\8k\
\000\000\000GBBB\3BBBÃ\2\000\000æ\000\000\000\29€\000\000F€À\000GÀÀ\000€\000\000\000]@\000\1\31\000€\000\
\7\21 \15üfLV2¢\15rÑ”jMÖ€\25&‹~?b\25¦\0142J§\22€Äé\"\4\5\16I\25)\000I!ß‹D0 wÃ`I”lk\2\000\000\000\1\2\000\000\9\7!\25¶ÖË`õ\15Ç\127ú Ý'?¢scþ¤QI•ì-cm¾r\7&’˜g\4\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000(/)25<[\4\3\000\000\0004([\4\7\000\000\000)>64->[\000\000\000\000\24pi\23]‰¦\18V\31Æ>\24\19åKˆOŠ%}å?ug}i<-“\16Ø\7\000{vyÐ\8ä_5 \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 Ž¥ñD¬UÚi–\127b\12Hrª\7\11ˆ|.ö¦|\9W¸&\16ï\14\9\20 iÙ3Sÿ(ZB\11}îpb¬š\16ÏpJ:€¶ÒJÄåœZ%\
t\0258\8t\25\1\000§\29šÿ—|Ýíeb^lüMä=ç\4sòMw\12ðÊtà\8ud\11\11v\25\31\9v\25©\19–dý'\1{j[k«¡g.jîw`\9\16M0W÷A\24\000.\8\6 Q‚÷7b\127¾F÷\20Wv¨:\30H²2zwÙ¶ôu\17\20R\27\000\000\8\8 ä3ãftÀì+€Ì\30teêµ18¦‰\6—¸Ý|fê\\OÒ¥!\3½yV4\18¶ã\8\8\4\000\000\000»½ý½A@\000\000\29@\000\1\31\000€\000\8\7\21 ÐF$\18–ì}lÁ(¿\18yZºv“\20ÿm<“\26~%ü!%ý\2wNE£g.|óc=\2\6\16I\25–%_fßr\"\4õ…¨1?`}.‘¥œ{Î<'PtÏI\1\000\000\000\000\000\11\7!\25²p€\14Ä4¼uÃÍ)\23[6@üÚE|[†m&}E“\15Î€g\127Ï,±\5Aœì,\2\000\000\000\4\6\000\000\000Š€ï\4\11\000\000\000ºœŠÏª—†›Áï\000\000\000\000\21pi\23·ÅB\\\17ã\16?\26Qîsxî\1o‹=Ë5®eíaµ\28m\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 \2Š\1\6ã\4ƒ~½èp@Êj˜V¯Ž\15\5JwÏ^ü@N?\17ã\20]\25\8\9\20 zŽÝ\23\000\
t\25:\8t\25f@pwvR§\0221T\19·RÂE\17Îçk=\22÷\0191zæ\25hí\5G’Âah²¸);\14\11v\25\17\9v\25Æµl8%srBÕ\20y\\4¼|\12Uxv%žŠ£\30¿zÚ\3\6´sy¡\20¥$\1/\8\6 Ãœä9k\127={R\14m\7\14\20´\24hÀ‹:dñd\000\1\8\8 ¸&Ž|Þ\127_|[=ï~\30gþsUÒ\6\19‘p\18Õ¹À9f î~Ê§g&6zV4\18\\jÉ\14¹ìÐ\14C\000\000\00006v6wv66+¶67p6v6·¶66k¶67|6÷·±v÷6÷¶76«ö67.ö÷7!v5¶07t61wt4v767··46+÷¶\1\27\1\000\000\23€\1€†\1B\000‡ÁB\3À\1\000\1\000\2\000\2@\2€\2ž\1\000\2Ÿ\1\000\000\7AÁ\000A\1\3\000\29Á\000\1\24ÀÁ\2\23@\3€†\1B\000‡AB\3À\1\000\2\1‚\2\000Á€\1›\1\000\000\23€\1€\6\2B\000\7ÂB\4@\2\000\2€\2\000\3À\2€\3\30\2\000\2\31\2\000\000‡AÁ\000ÁA\3\000Á\000\1\24ÀÁ\3\23@\3€\6\2B\000\7BB\4@\2\000\3‚\2\000\29Â€\1\27\2\000\000\23€\1€†\2B\000‡ÂB\5À\2\000\3\000\3\000\4@\3€\4ž\2\000\2Ÿ\2\000\000\3\2\000\000\31\2\000\1\31\000€\000\000\7\21 # 6GÞ_CQ\14\2\16I\25WÜ²S3Ø¹vñnz\11\1\000\000\000\000\000\2\7!\25:Œ-p’ƒ\0310¹ÖêY\14\000\000\000\4\8\000\000\000k|hlpk|\25\4\3\000\000\000jc\25\4\r\000\000\000jcvzr|m7qmmi\25\4\8\000\000\000MPT\\VLM\25\3\000\000\000\000\000\000\8@\4\8\000\000\000k|hl|jm\25\4\24\000\000\000qmmi#66nnn7(*,/.! 7zvt6\25\3\000\000\000\000\000\000i@\4\7\000\000\000jmkpw~\25\4\5\000\000\000\127pw}\25\4\19\000\000\000<}2<7<}2<7<}2<7<}2\25\4\4\000\000\000jl{\25\4\18\000\000\000qmmi#66nnn7pi7zw6\25\4 \000\000\000qmmi#66pi7zqpwxc7zvt6~|mpi7xjia\25\000\000\000\000\22pi\23ý\2]+\12åWa\11=ÆBeÃèe\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 7Ã}7§¿\28*¨G°wAWñ1f×\2?E¸å\17º\r\9\20 y¸ª;Ö\24dZC`.b†M-\15\11\
t\0255\8t\25±~c^îbDv°Š\"aüÞ]~ù?\5L)\11v\25\31\9v\25¥\28íMw.\0046o‚êa7–Ù\18ªE¿a^ò±\6”…£/\1-\8\6 \27 bJaºÛYuÊò\23¬êfQ\000\1\8\8 \28Š\15BT2\23IÙÔJCƒa\18\1™êüZ Ì|\r\30\29\0162\19£§\22öäàg2pV4\18þ7×D\19ü¡rˆS\25\28®Âù%\15Ûÿp“\30h\4•¿\3´÷ì>\"\000\000\0007222s222³r22Ô222/²22w2²2³²22ór223ó\000\000f\1\000\000]€\000\000†\000A\1À\000€\000\1A\1\000@€\1†€A\1€€\000\24ÀA\1\23€\1€†\000B\1À\000€\000\1A\2\000@\1\000\000\22A\1\2@€\1\23À\000€†\000B\1À\000€\000\000\1\000\000@€\1†€B\1À\000€\000@\000\1\31\000€\000\000\7\21 s\23ªeìÆQ\6\5\16I\25Ò\9\\l€\19j\1„Dª\23í©¾6\3\000\000\000\1\2\1\3\000\000\7\7!\25ù\14/™”%\8zKŸl\22™¬qíÆ<QS ê/\11\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000ÉÎÈÓÔÝº\3\000\000\000\000\000\000\000@\4\r\000\000\000R> \\&\22\\-\31_\5-º\4\8\000\000\000ÓÔÓÎöÕÝº\3\000\000\000\000\000\000\000\000\4\
\000\000\000ÝßÎõéîÃÊßº\4\4\000\000\000ÓÕÉº\4\5\000\000\000ÍöÕÝº\4\8\000\000\000áþûîÿç€º\4\9\000\000\000ÙÖÕÉßöÕÝº\000\000\000\000\26pi\23‡±9,tìf=·\23Ï$šTáBjÑG%\25•\r93E¶hi\9\31j\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 ª\000zdhØ\21X1ÔÈ*aRè~¤\12\9\20 0\12Ú\31\7 ƒ\20½\000Ýmh\29<D­F`/¹\
t\25:\8t\25‚\14\24\23L´Jy\räá_~ôÐWPcA\\øƒS55\2*boCÅ.æ/ø}$Ÿ‰#$\11v\25\29\9v\25ž“\6;™ßÆ$-±‡Sø¯sY\01803\18\1+\8\6 –1}j\7žì>\000\14\8\8 ÿ\9“B8rµi\16\8@L\9zŒs@?\7\r@\20\26lÁ{V4\18©1V0½ào7\r—F^Å\000\000\000ÄÁÁÁ€ÁÁÁ@ÁÁ'ÁÁÁÜAÁÁ¤ÁÁÁGA\1Á\000\1ÁÁ\\AÁÀ\6Á€ÀÇ€\000ÁÀÁÁÜ@ÁÀÀAÁAÀÁÃ\000@ÀÁW\000ÀÂœ@ÁÀšÀÁÁÖAËA†\000\000ÀAÀÁÃ\000@ÀÁW\000ÀÂœ@ÁÀFÀ\3ÃZÀÁÁÖAÁAFÀ\3Ã^ÀÁÀÖÁèAAÀAÁ\1ÀÁÃÀƒÃÁ\23ÀCÂ\\@ÁÀZÀÁÁÖæAF\000\000À\1ÀÁÃÀƒÃÁ\23ÀCÂ\\@ÁÀ\6ÀƒÂ\26ÀÁÁÖAÁA\6ÀƒÂ\30ÀÁÀÖAåA\6B\3Û\1\000\000\23€\000€ÇB\3ß\1\000\1\23\000#€ÇÁB\3Û\1\000\000\23€\000€ÇÁB\3ß\1\000\1\23€!€\31\000\000\1\23\000!€@\1€\000€\1\000\2Á\1\3\000–Á\1\3]\000\1[\1\000\000\23€\
€GÁÁ\1€\1\000\2Á\1\3\000–Á\1\3]\000\1‡\1Â\2›\1\000\000\23€\000€‡\1Â\2Ÿ\1\000\1\23€\28€€\1€\000À\1\000\2\1B\2\000Ö\1‚\3\000\1›\1\000\000\23À\26€‡ÁÁ\1À\1\000\2\1B\2\000Ö\1‚\3\000\1Ç\1B\3Û\1\000\000\23€\000€Ç\1B\3ß\1\000\1\23\000\24€ÇB\3Û\1\000\000\23€\000€ÇB\3ß\1\000\1\23€\22€ÇÁB\3Û\1\000\000\23€\000€ÇÁB\3ß\1\000\1\23\000\21€\31\000\000\1\23€\20€@\1€\000€\1\000\2ÁA\3\000–Á\1\3]\000\1[\1\000\000\23€\
€GÁÁ\1€\1\000\2ÁA\3\000–Á\1\3]\000\1‡\1Â\2›\1\000\000\23€\000€‡\1Â\2Ÿ\1\000\1\23\000\16€€\1€\000À\1\000\2\1B\2\000Ö\1‚\3\000\1›\1\000\000\23@\14€‡ÁÁ\1À\1\000\2\1B\2\000Ö\1‚\3\000\1Ç\1B\3Û\1\000\000\23€\000€Ç\1B\3ß\1\000\1\23€\11€ÇB\3Û\1\000\000\23€\000€ÇB\3ß\1\000\1\23\000\
€ÇÁB\3Û\1\000\000\23€\000€ÇÁB\3ß\1\000\1\23€\8€\31\000\000\1\23\000\8€@\1€\000€\1\000\2ÁA\2\000–Á\1\3]\000\1[\1\000\000\23\000\6€GÁÁ\1€\1\000\2ÁA\2\000–Á\1\3]\000\1‡\1Â\2›\1\000\000\23€\000€‡\1Â\2Ÿ\1\000\1\23€\3€‡Â\2›\1\000\000\23€\000€‡Â\2Ÿ\1\000\1\23\000\2€‡ÁÂ\2›\1\000\000\23€\000€‡ÁÂ\2Ÿ\1\000\1\23€\000€\31\000\000\1\23\000\000€\31\000\000\1\31\000€\000\6\7\21 \9•º0\27{(>©4?\31Yøû\12\9\9\16I\25Þ6i\1É;Á;ù.tq\3Öò$\21ox—Âz,œµ¹IB \24L\2\000\000\000\1\2\000\000\6\7!\25®åì[GÕõ4&¤kpµƒÙ\26öŠM\2%®þ2íõŽ\4\14\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000×ÐÖÍÊÃ¤\4\8\000\000\000ÖÁÕÑÍÖÁ¤\4\3\000\000\000×Þ¤\4\6\000\000\000ÔÈÍ×Ð¤\4\14\000\000\000ÅÔÔæÑÊÀÈÁôÅÐÌ¤\4\31\000\000\000‹ÞÌûçêŠÈÔÖËÎ‹íÊÂËôÈÍ×ÐŠ×ÐÖÍÊÃ×¤\4\5\000\000\000ÖÁÅÀ¤\4\20\000\000\000çâæÑÊÀÈÁàÍ×ÔÈÅÝêÅÉÁ¤\4\12\000\000\000‹íÊÂËŠÔÈÍ×Ð¤\4\r\000\000\000çâæÑÊÀÈÁêÅÉÁ¤\4\19\000\000\000çâæÑÊÀÈÁáÜÁÇÑÐÅÆÈÁ¤\4!\000\000\000‹ÞÌ‰ìÅÊ×ŠÈÔÖËÎ‹íÊÂËôÈÍ×ÐŠ×ÐÖÍÊÃ×¤\4!\000\000\000‹ÞÌ‰ìÅÊÐŠÈÔÖËÎ‹íÊÂËôÈÍ×ÐŠ×ÐÖÍÊÃ×¤\1\000\000\000\1\9\20 [¯œPÅE°&=#ê\11Á6ee/¯[\
­3¨;ˆ\5kßÎ²+Ë\1\9\20 ë½ÿl•\8€\127ú\5à&0\000€!X¥u|^\8¡i¿|‘k\30\19‚Oq\
t\0254\8t\25]ñ\3~AŽÇ\000hŒ: ßªYL&\11v\25\28\9v\25^C«yjÚóCw'<rnY¸%\000#\8\6 X\30_qº„Pn˜\12\3r\29d\15\24÷§:zYChWL\19k\"¤Ûâ5âHéB,â\29N\1\
\8\8 \5f—o\23 \29;‚}V4\18G \\s\11\31U^t\24\000\6\29/H‘\30¡$\14\000\000\000Ä‚Â‚ÅÂB‚\2‚‚‚C\2\000\000]€€\1XÀÀ\000\23€\000€Œ\000Á\000€\000\1\23@\000€ƒ@\000\000ƒ\000€\000Ÿ\000\000\1\31\000€\000\
\7\21 c\0143FÒ¬h%9xØNB¹Œ\18-·~R—»ƒH¬“€V¥ÞºD\4\2\16I\25êðæwýü\0256À™Œ\\\1\000\000\000\000\1\6\7!\25\27a)N·AÇVÜ@RAgt”p[\29ª\12¾‰;\4“V²>\5\000\000\000\4\3\000\000\000¢¤Ë\4\5\000\000\000¤»®¥Ë\4\2\000\000\000¹Ë\000\4\6\000\000\000¨§¤¸®Ë\000\000\000\000\27pi\23ÃïÒs«öÏyûà|>Ã[J\
ò–mVnì›\19!Ðb\
ù³œ\30ÿ\
=8\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\21pi\23\\ÂÏdÑ·¥],4Ù\7Ÿ{\\wþn$0Ãï\\PK\15ÝM\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 ±m(hþÏœté©Lcè1y\8‹\14\9\20 B¸¬\000ÆÛ\5Ù>kp@å×:2Ù~.‹S&€\24œV\
t\0251\8t\25ˆÌ\5’\11v\25\17\9v\25†ßç0Gp¹\24Œ×olÜ0[;\6´´\7k\26¬NäåãMHÏ\12&\17<\0243\000#\8\6 ‡Í‡7˜ß‰oÝv”EÀÖ\27l\0057ÿIŽä¼-¾¦¸`îàK-v\02266ÝLfy\000\9\8\8 ¸Îâ6@\127V4\18ø³ºqÖ\1s-íÕW7xÌVHP\"õLo^$=3èÝ\\`\000\000\000e@@@\6@\000@\29ÀÀ@Æ\000\000@†À\000@‡€€A@AÀ@\1AA@ÁAA@À@BFÁ\000@G\000B\000AÀ@Á\1A@\1A@]Á@B–@ÁAÝÀ@A„@@@ZÀ@ÃW\000@À€A@W@AÀZÀ@Ä\23@\000€Á@\2\000\23\000\000€Á€\2\000\000\1\000\000@\1€\1\29\000\1K\1\000\000†ÁB\000À\1\000\2\1\1\1\23À\r€Æ\2C\000ÇBÃ\5\1ƒ\3\000@\3€\1Ã\3\000À\3\000\5\22Ã\3\6Ý‚\000\1\12\3Ä\5\29\3\1\1\23€\
€\6„@\000\7Ä@\8@\4€\7D\4\000\29„€\1\24€D\8\23À\8€\6\4C\000\7ÄD\8@\4€\1Ä\3\000À\4\000\5\1Å\3\000@\5€\7\5\5\000V„…\8D\5\000\29„€\1\27\4\000\000\23€\5€L„E\8]D\000\1FÄE\000\4\6\000]„\000\1‡DÆ\8Ç„F\9\000\5€\1AÅ\3\000€\5\000\5ÁÅ\3\000\000\6€\7A\6\5\000\22E\6\
Ý„\000\1\7ÅÆ\9\27\5\000\000\23\000\1€\6\5G\000\7EG\
@\5€\2‡ÅÆ\9\29E€\1\"C\000\000£ƒô\127¢\000\000#Bñ\127_\1\000\1\31\000€\000\5\7\21 ¶ÎÝU¿¿MI³289¼‚’]*Úù\23—\24\28\7\4RŸ\3\26\11\16I\25à2't‹\31';Óõ›:½©»9LöB'Ø,›\4KŽxg\
û\7Æ\rç1Á¤®\29\1\000\000\000\000\000\8\7!\25O\23€Rys‘TŒ\18V\000±_„cq'LFb\20É-ž5Ü\26éó¢\14³6¾z\30\000\000\000\4\9\000\000\000ìîÿÄØÝîù‹\4\9\000\000\000ÿäåþæéîù‹\4\7\000\000\000øÿùâåì‹\4\4\000\000\000øþé‹\3\000\000\000\000\000\000ð?\3\000\000\000\000\000\000\8@\3\000\000\000\000\000@W@\4+\000\000\000¤ûùâýêÿî¤ýêù¤èäåÿêâåîùø¤Éþåïçî¤Êûûçâèêÿâäå‹\3\000\000\000\000\000\000T@\0042\000\000\000¤ûùâýêÿî¤ýêù¤æäéâçî¤Èäåÿêâåîùø¤Éþåïçî¤Êûûçâèêÿâäå‹\4!\000\000\000¤ûùâýêÿî¤ýêù¤æäéâçî¤Êûûçâèêÿâäåø‹\4\7\000\000\000âûêâùø‹\4\3\000\000\000âä‹\4\6\000\000\000ûäûîå‹\4\4\000\000\000çø«‹\4\2\000\000\000¤‹\4\6\000\000\000çâåîø‹\3\000\000\000\000\000\000\16À\4\5\000\000\000¥êûû‹\4\5\000\000\000äûîå‹\4\12\000\000\000¤Âåíä¥ûçâøÿ‹\4\3\000\000\000ù ‹\4\6\000\000\000èçäøî‹\4\8\000\000\000ùîúþâùî‹\4\3\000\000\000øñ‹\4\6\000\000\000ûçâøÿ‹\4\5\000\000\000ùîêï‹\4\19\000\000\000ÈÍÉþåïçîÂïîåÿâíâîù‹\4\6\000\000\000ÿêéçî‹\4\7\000\000\000âåøîùÿ‹\1\000\000\000\
\9\20 EŽØ\22ƒaJ1/GÏR˜\8\9\20 X\4¤)¢\
t\0253\8t\25Q\r`PF\27\3¥Õ-“\11v\25\17\9v\25_.?\20úº(8FæÝGP{¢Eß‡‹S.\9FT4\"N\1A(¡\"ˆÞô|\000-\8\6 ˆIÊ\7Âé%\11¶ý}\15G@\21r\1\
\8\8 \25”‡ ÔÄÌ\000õ{V4\18bú=_œg%ó\28F\127\19\000\000\000³õµõ²µ5õtuõõ5õõõc5õ\1]€\000\1‹\000\000\000ÌÀÀ\000Ý\000\1\1\23\000\1€Æ\1A\000ÇAÁ\3\000\2\000\1@\2\000\3ÝA€\1â@\000\000c\1þ\127Ÿ\000\000\1\31\000€\000\6\7\21 \22’+~¨ÕÖ\1êE±[\25Ò‘>\
\7\16I\25y–÷v\28wglCþ\8LØÄ6\11\0222$‰äæ\19\1\000\000\000\000\000\6\7!\25õ¹\27x·í,h\\b'R6â¼\26@Ì!e\29$m%¾+‡\"\6\000\000\000\4\3\000\000\000ñ÷˜\4\6\000\000\000è÷èýö˜\4\4\000\000\000ôë¸˜\4\6\000\000\000ôñöýë˜\4\6\000\000\000ìùúôý˜\4\7\000\000\000ñöëýêì˜\000\000\000\000\17pi\23Ô!ë4\5lœ\20\11ô´-\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\26pi\23Ù0i\21aÍl<]qn#;+§tý4ýaQŽ´\"Ìl´&\20Ç(`\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 \127ÔKX\27\
_A—ß¾uëá«%„\15\9\20 jo‰T†wÎPó\24\0150\25¡\0119´ë†\28P§s\rû\
t\0251\8t\25qUV\12ª\11v\25\29\9v\25\18·0\22ÍµgBüµÚqA@{]Éà¿w\1 \8\6 výƒ\0201Ž)$Uo8yØ”à\20ÍÝÒ\8šú’J\2–I7Ù\21À_\24ö\11<\000\14\8\8 Xê\01183\000k}\30‡÷\31DÌ·]°å(aÈà[\6]qV4\18»ùj6ÇÜLkêH~N\12¡ÞC¼yac[žÔZD3i\\Î0’y)T<\29>\000\000\000X]]]\28]]]Ü\29]]»]]]@Ý]]\24]]]ÜÝ]]œ\29]]{\\]]\000Ý]]Ø]Ý]œ]]\\\\\\]\28\28\\]û\\]]ÀÝ\000\000Æ€A\1\1Á\1\000Ý€\000\1\6A\1A\1\2\000\29\000\1K\1\000\000€\1€\000ÇÁB\2\11‚\1\000\
\2\000†\
‚Ã†\
‚€‡K‚\000\000J‚Äˆ•\2\000\3J‚‚‰\
B\2ˆFBE\1G\2Å\4GBÀ\4€\2\000\3]‚\000\1\
B\2ŠFBE\1G‚Å\4GÂÅ\4€\2€\2]‚\000\1\
B\2‹ÝÁ\000\1ˆ\000\2…ˆÀ„ÆB\1\24\000Æ\3\23€\1€ÆÁE\1ÇAÆ\3\000\2€\2A‚\6\000Þ\1€\1ß\1\000\000\23@\000€Ã\1\000\000ß\1\000\1\31\000€\000\6\7\21 \15q\rWò4ü\20%\3[}…n‘k\11\11\16I\25zr“v]\3r\000ð øA\20m&A`™»7Ê¶¸!,c2}ç@ôa\"¡ÄY_cz\3\000\000\000\1\2\1\3\000\000\2\7!\25fm|7\15IÆ[Î¨G\8\27\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000÷ðöíêã„\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\4\7\000\000\000êñéæáö„\3\000\000\000\000\000\000\20@\4\8\000\000\000öáõñíöá„\4\3\000\000\000÷þ„\4\r\000\000\000÷þëçïáðªìððô„\4\4\000\000\000öá÷„\4\5\000\000\000çëàá„\4\8\000\000\000öáõñá÷ð„\4\4\000\000\000ñöè„\4\7\000\000\000éáðìëà„\4\5\000\000\000ÔË×Ð„\4\8\000\000\000ðíéáëñð„\4\8\000\000\000ìáåàáö÷„\4\r\000\000\000Çëêðáêð©Ðýôá„\4\"\000\000\000åôôèíçåðíëê«ü©óóó©âëöé©ñöèáêçëàáà„\4\15\000\000\000Çëêðáêð©Èáêãðì„\4\7\000\000\000÷ëñöçá„\4\6\000\000\000èðêµ¶„\4\5\000\000\000÷íêï„\4\6\000\000\000ðåæèá„\3\000\000\000\000\000\000i@\4\7\000\000\000çëêçåð„\4\1\000\000\000„\000\000\000\000\27pi\23E¦½\r‰¢²>Ü…\
U/ï;\\•C‘\2˜ÿk8‹\0167Úvú^f0þ1\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 •ˆ\5m3ÎÃ?Ñnî\4œ6\27\25â¸’\15~\19@\\¥ä¿3_„hª›xU¤Ùj-×\1\9\20 î±°\20W\rY\27äÖÆNþŸ}BÈCÆ\0203Èò\28^Ör?Tì…{è\
t\0252\8t\25k/¶&Š‡¹\9Ô\11v\25\28\9v\25`ŠT\12{’¯g\
im+æ\
`\27\1!\8\6 kX\26GK@úvt‹kž&Þ\6\29¯è{\16Ä¦\4ßp\22›Â(X\000\000\8\8 \16?õ~E^¡-Y‚ÑeÍ0\23\6&C hH4‚z$>p!\
\26ç6WrV4\18>âÙS¥ªr|An¼1ÿ\1Š\22\16Ú(#Ëõu;\20EÊ&pd}/Fˆ%#\30®7R\28\000\000\000RWWW\22WWWÖ\23WW±WWWJ×WW\18W×WÖ×WWÁÀ\000\000\1\1\1\000f\1\000\000]€\000\000†@A\1Á€\1\000€\000\1Æ@A\1\1Á\1\000Ý€\000\1Ê@\000„\7AÂ\1@\1\000\000\29Á\000\1\24€Â\2\23@\000€\31\1\000\1\23@\000€ƒ\1\000\000Ÿ\1\000\1\31\000€\000\6\7\21 %«!‰\6R\25¢¯×A™\0267\r\7\11\16I\25¿^À=©ÞÝ\17¨\12¡6Z!é\21_‡DJ¹K–5Ÿ\127ŠC¸\9\0220†|­;ÆÂª+\3\000\000\000\1\2\1\3\000\000\6\7!\25«º\29]ÐÜ‘bG\18˜g˜<T\19\14¿k6ì¼\
dÙª\16E\11\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000¤£¥¾¹°×\3\000\000\000\000\000\000\000@\4\7\000\000\000¹¢ºµ²¥×\3\000\000\000\000\000\000\20@\4\8\000\000\000¥²¦¢¾¥²×\4\3\000\000\000¤­×\4\r\000\000\000¤­¸´¼²£ù¿££§×\4\8\000\000\000ƒžš’˜‚ƒ×\4\8\000\000\000¥²¦¢²¤£×\3\000\000\000\000\000\000i@\000\000\000\000\26pi\23ü–3\7¤ †\000!\6Àslû°6ê(¬#?´÷EÃjŽ\1\15¶WE\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 :\6M:Ô\26QmØ&ºQ¼Nð\1f@?.Ô\8\9\20 \19˜.XÂ\
t\0257\8t\25)`\127$V´\30\"V#Ð;µ]sHÌH\
l\24€Ú^…\2k3Á\11v\25\18\9v\25£€ÝTŒ\27%GY\r\000Xj³[g\24‹\\lšvú\7\19Ž}+_XšRE\5\21{ýÄm3\1+\8\6 —Z@Xp\16E&\000\000\8\8 Ñ`\18D+–\19àÃ#\27Ž¯}\20ªkÕA¿sU/f«U\24¾\3\4\0268pV4\18\20¸\"<áÅ»ZDiH\5à\000-(ùE–9Ék³8_ýb*œÆs\14=\000\000\000=888y888¹x88Þ888%¸88~¸ø8¸888ex89~øø8\1278ù8e¸¸8¾xù8ù¸98¥x89¾øù8¥€€\000Æ@À\000Ç\000Â\1\000\1\000\000@\1\000\1Ý€€\1Û@\000\000\23@\2€ÆÀÀ\000Ç\000Á\1Ý€€\000\14A€\1Z\000„\23À\000€\6AÁ\000A\2\000\29A\000\1\23\000û\127†@Á\000Á€\1\000@\000\1†ÀÂ\000Á\000\3\000@\000\1†@Á\000Á@\3\000@\000\1†ÀÂ\000Á€\3\000@\000\1†@Á\000Á@\3\000@\000\1†ÀÃ\000Á€\3\000@\000\1†@Á\000Á@\3\000@\000\1†ÀÃ\000Á\000\3\000@\000\1†@Á\000Á€\2\000@\000\1\31\000€\000\6\7\21 ¹\
c\2\6zÏum\0185lS]\
\6\4\16I\25ÌjÏ>˜†r\5\23ÍºT>».&/á²]\2\000\000\000\1\2\000\000\5\7!\25EX˜o\1B@pÌ\8–\14%\28¼\
\16\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000§ ¦½º³Ô\4\16\000\000\000£¦½ ±„µ§ ±¶»µ¦°Ô\4\3\000\000\000»§Ô\4\5\000\000\000 ½¹±Ô\4\7\000\000\000¹‡¸±±¤Ô\3\000\000\000\000\000@\127@\4\15\000\000\000¦±µ°„µ§ ±¶»µ¦°Ô\4\5\000\000\000²½º°Ô\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000I@\4\8\000\000\000¿±­»£ºÔ\4\9\000\000\000†½³¼ “Ô\3\000\000\000\000\000\000$@\4\2\000\000\000¢Ô\4\6\000\000\000¿±­¤Ô\000\000\000\000\26pi\23vtkPä\17:õœ\19\0294xojo2ýX„¨èYH0’&Qø¸3\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 ÷¥§*•ŽËcšöliº7‹dW§ý\3…A²\24KW;{«\12^\23ã2:P\18\11ôP\8\9\20 aÏSUÊ\
t\0257\8t\25\3ÔÂ9`Œ*eœ\25.keôekeÍã\24ZãÎ\9QÕ¨-ì\11v\25\29\9v\25•÷A-Yà­f‡\5–\0008\4‹t^ý×C\000/\8\6 a1ý\r+\27yö\5>BX×¤8À\29ç\\üª+\1\9\8\8 \23Åä`õ{V4\18ÂÑBxùp—\20pq_i\12\000\000\000íõµõâõôu³µµõG€À\000À\000\000]@\000\1\23À\000€F@@\000G€À\000\000\1\000]@\000\1\31\000€\000\6\7\21 ?#\\aÒ@³>\19YÏVC÷\30\27\3\6\16I\25°rýA¨ë„\6—šÁ<\
VÌKùÀ-4qê-UŸM\14y\1\000\000\000\000\000\8\7!\25øïÃU×Q™m±ž³^\29é\0099ƒ–{Ü-ÏW…#'L‘Z;4œK¶4\5\000\000\000\3\000\000\000\000\000\000\000\000\4\3\000\000\000âþ\4\8\000\000\000èõèîøùè\4¤\000\000\000æäááìáá­ ´­ýìþùèïâìÿéé¶ÿà­ ÿë­¢ûìÿ¢àâïäáè¢Áäïÿìÿô¢Îìîåèþ¢îâà£ìýýáè£ØÄÆäù£ýïâìÿé¢§¶áìøãîåîùá­áâìé­ ú­¢Þôþùèà¢Áäïÿìÿô¢ÁìøãîåÉìèàâãþ¢îâà£ìýýáè£ØÄÆäù£ýìþùèïâìÿéé£ýáäþù\4;\000\000\000ÿà­ ÿë­¢ûìÿ¢àâïäáè¢Áäïÿìÿô¢Îìîåèþ¢îâà£ìýýáè£ØÄÆäù£ýïâìÿé¢§\000\000\000\000\27pi\23¤ikQ´\16›\21,^/<\2ÐÖivâÝ\r%ÏÆPrA6S9¾Bgeò\"2\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 ¡¼\2TøuÀ0\
\9\20 ïgè{P“}4\22ñ3\6Î\
t\0259\8t\25?e%%²¥¶\18œŠ»\9ÛK—rÇxÉas`Fzà~T.³”´\18¿\127«-ã\11v\25\29\9v\25Æ˜-A\127Aø\26A\14û9Ký÷JšzªJ\000 \8\6 3h¡9ÆË]hgt©3è!ÔI‰7 \\R?%\20\127N>3+ô\"0JµåD\000\r\8\8 ëƒSC:\29Î@ZÎ–\"\1u‡I 7¨%ÐrV4\18¼Ác/u\127S:{“\7>0\"ª)Uþ§h.(¼Pï¡UWØ5\4ôÀé\17nãMr\8\000\000\000ÖÐÐ‘ÐÐ\29@\000\1\6€@\000\7À@\000A\000\1\000\29@\000\1\31\000€\000\11\7\21 ?¾á\\\8^ø<ïèÇ\29s&ƒ\22Ï)V%V]qQ[HW`Xav\1¨œ–e\2\6\16I\25ƒU™1òQ|*äÑ®\1oÙìt,oJk? E$pNt>\1\000\000\000\000\000\000\7!\25ØÓ\1l\5\000\000\000\4\9\000\000\000îáâþèÌýý\4\23\000\000\000îâà£ìýýáè£àâïäáèþìëìÿä\4\3\000\000\000âþ\4\8\000\000\000èõèîøùè\0049\000\000\000ÿà­ ÿë­¢ûìÿ¢àâïäáè¢Áäïÿìÿô¢Îââæäèþ¢Îââæäèþ£ïäãìÿôîââæäèþ\000\000\000\000\19pi\23\9hV@\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\9\20 _¬d\
2\16ö /‚Ïb\8\15\9\20 ‘®·Nñûµ~©Êßq\24ÎîfÝ¯f\7Ò‘ŽZ¶\11t\0259\8t\25ñtI6\25iñjtJµO¬\26ùdaP”?×û\5ij÷·\17£X\27N°\21nbç\11v\25\27\9v\0253\28‘oŸQ@O£òø]\000(\8\6 ^°b\16\2\12\8\8 wéÁ{[HI\26ÉÓ\8>Ö•&\6apV4\18Áš\01195u8\3Š\4o²–Á7Þ?\24u¢Ò~VF(?°Ñ¦O7\000\000\000àaaa„aaaD aa\4àaaÄ aay!¡av¡aá§à!a¦ ¡b`c`a¼ a`¡`á`¼àáaaca\3AB\1\000€\2\000\1\29B€\1\27\000\000\000\23À\6€\6‚A\000@\2\000\000\29‚\000\1\24ÀA\4\23À\000€\000\2\000\2@\2\000\000\29B\000\1\23À\3€\6‚A\000@\2\000\000\29‚\000\1\24\000B\4\23€\2€\6BB\000A‚\2\000€\2\000\000V‚‚\4\29‚\000\1\27\2\000\000\23À\000€@\2\000\2€\2\000\4\2€\000]B\000\000\000\2€\2AB\1\000\29B\000\1\24@À\000\23À\000€\6‚@\000\7Â@\4AÂ\2\000\29B\000\1ß\1\000\1\31\000€\000\4\7\21 »quÊ:˜:\9Ùm\17-ÖjZ+‹,zàÔsz\11\5\16I\25ÎãGHêá\\\22qé<\1\000Ù7\1\000\000\000\000\000\7\7!\25¹câ\26’ ¯Gì„<øu\\k\9\
qCé4ÎV\12\000\000\000\4­\000\000\00047ped(~mz{agf5*9&8*(mfkglafo5*]\\N%0*76\0024)LGK\\QXM(xda{|(X]JDAK(*%''Ixxdm''L\\L(XDA[\\(9&8''MF*(*`||x2''\127\127\127&ixxdm&kge'L\\L{'Xzgxmz|qDa{|%9&8&l|l*6\0024xda{|(~mz{agf5*9&8*6\0024'xda{|6\8\3\000\000\000\000\000\000\000\000\4\3\000\000\000g{\8\4\8\000\000\000mpmk}|m\8\4\15\000\000\000caddidd(%1(d{l\8\0043\000\000\000'xza~i|m'~iz'lj'd{l'kge&ixxdm&d{lalmf|anamz{&xda{|\8\4\5\000\000\000|qxm\8\4\6\000\000\000|ijdm\8\4\7\000\000\000{|zafo\8\4\5\000\000\000dgil\8\4\8\000\000\000zm|}zf(\8\4D\000\000\000di}fk`k|d(dgil(%\127('[q{|me'Dajzizq'Di}fk`Limegf{'kge&ixxdm&d{l&xda{|\8\4\000\000\000\14\9\20 ÇyXPÜu\28\rÝ\2ö\14[jª\31CÞ¬+œÜÀ\127]ø\14æ\3\9\20 µ¨Jk‰²Ò\28!q\4^®ou<k+\4™öà21\27„\7ú\18\23$€í,)EØ~\6r\11t\0258\8t\25ÐÏÄ\6¹íö7ùHPdF\25\20:î\17\127q†Ïp(š7??\14G½C\28\
v\25\29\9v\25l}´\29&\11Ôy3O>>IóÐ*\3\14Ê\8\000-\8\6 ŒÑ}VŸêŠ\8ìFálbOžI\000\2\8\8 ¡ï+Xë\1qf¼çÎlO_¡\20V-\1kUÞ¯\31z%\28P@\24\15ÕËÜHÆR¤\"¹\127V4\18\127@›Z\"Y¸|ì´µ\9nR\26L©()%†ìôH|™×\15\27\000\000\000œ¹¹¹ÿ¹ù¹8ù¹¹ä9¹¸>9y¹xy¹¹¾¸ø\1@\1€\1\29\000\1\27\1\000\000\23\000\3€FAA\000€\1\000\2]\000\1[\1\000\000\23\000\1€@\1\000\000€\1\000\2^\1\000\1_\1\000\000\23\000\1€A\1\000_\1\000\1\23@\000€AÁ\1\000_\1\000\1\31\000€\000\6\7\21 òi©f¢¤«\9HMMQ;]z\17\7\5\16I\25×\0066/È.øgE\000\27ÄM\23\28\1\000\000\000\000\000\2\7!\25à\19Ë)e=Ct\21€\7\24\8\000\000\000\4\8\000\000\000”ƒ—“”ƒæ\4\3\000\000\000•œæ\4\6\000\000\000–Š•’æ\0043\000\000\000É–”‡’ƒÉ‡”É‚„ÉŠ•‚É…‰‹È‡––ŠƒÈŠ•‚‚ƒˆ’€ƒ”•È–Š•’æ\4\5\000\000\000”ƒ‡‚æ\4\5\000\000\000ˆƒž’æ\3\000\000\000\000\000\000ð?\3\000\000\000\000\000\000\000\000\1\000\000\000\15\9\20 þb-|_È~Sp†*}C]¶G;§y\7.¯©Bú\000\9\20 (Kb\29ÛIMñK˜cZ}\4\5šç8:\9°ÂPåéº+È¤~i>W©f\4\11t\0257\8t\25u\"›\27-é\r</\00334b¡¥rÿ m\28i(Œ_k Lu\29\
v\25\31\9v\25ë@E@Õkµ/‹\
\r\18-¬‡h(,)\5Šm:\14Œt\6<\000(\8\6 ÍÊðU\1\11\8\8 ÆaýDå½˜\29´øè/A|V4\18¥D\19I`M,€\27%®ôCd\23\000\000\000$AAAÇA\1AAAAÜÁA@\25\1\1@V\1A€ƒ\000\000\000Ÿ\000\000\1€\000\000Ë\000\000\000ÊÀ@\000\000\1\000\1@\1€\000€\1\000\000À\1€\1\1\2\1\000]\000\2–@\1\2\000\1\000\1AA\1\000–@\1\2Ÿ\000\000\1\31\000€\000\5\7\21 e%š\14íKíJ~>×\31ÚG5*\0265û\6®A\
T<éÚ\28\9\5\16I\25\23j–3§\9'\18uÔÖL\3«Ûs\1\000\000\000\000\000\9\7!\25\1ßã^0Wc\\¥¡\5G‹L\30m¼Ëi\24>TYIX\23\15C„çé[\6\000\000\000\4\5\000\000\000ŽƒŠŸú\4\6\000\000\000Ž›˜–Ÿú\4\3\000\000\000ðú\4\11\000\000\000ˆ••ŽÚŽ›˜–Ÿú\3\000\000\000\000\000\000ð?\4\2\000\000\000‡ú\1\000\000\000\1\9\20 _<Ñ\26eu£\20Ó‚\31Gò.\23W\9ð\29@M…œ\16\5?+eC\127\14B¡\
\9\20 Ù\127–>×¤?\4e–¿\000\26\11t\0252\8t\25•Ë_6‰k;\16\30\
v\25\26\9v\25”µçIG\127\15u\000*\8\6 ÚOþe“\25hR\19ùeV\3\1\8\8 ¸÷g\11Tõ®V*\3e\8\3Ë¢vEÛ‡^u¸Tn<%\11¤\23YyÚ-ø\2Ç{V4\18ã\29\22C]-Yc›…›5|\000\000\000\6ÇÇÇÁ†‡ÇÀF‡Å†\6ÇÇGÆÇÆÚFGÆÆ†ÇGÆÇÇšÆÆÆÐ\7ÖGA…†Ç\7ÅÇÃZEÇÆß‡‡ÂÐGÇGFEÆÇ\\…ÇÇÐÇÇGFÅÇÇ\7ÅGÆÇÄÇÅ†\4ÆÇGÄÇÂ\1Ä…ÇÇÃÇÃ\26DÇÆÇÃÇÂ†ƒÅÇ\17‡CÂ\1…†ÇÇÄGÃÝ‚\000\1\24€Â\5\23\000\7€ÇB‚\000Û\2\000\000\23€\1€\000\3€\1F\3B\000€\3€\4]ƒ\000\1Ã\2\000Ö€\3\6\23@\9€\6\3B\000@\3\000\4\29ƒ\000\1J\000ƒ\4\000\3€\1A\3\3\000Ö@\3\6\000\3€\1E\3€\000€\3€\4À\3€\000\rDC\1]ƒ\000\2Ö@\3\6\000\3€\1@\3\000\2ƒ\3\000Ö€\3\6\23€\4€ÆBA\000\000\3€\4Ý‚\000\1\24@À\5\23À\1€À\2€\1\1ƒ\1\000F\3B\000€\3€\4]ƒ\000\1Ã\3\000Ö€ƒ\5\23@\1€À\2€\1\6\3B\000@\3€\4\29ƒ\000\1AÃ\2\000Ö@ƒ\5b\000\000ãAí\127F\1D\000€\1\000\000]\000\1[\1\000\000\23\000\8€€\1€\1ÁÁ\2\000ÖÀ\1\3‡A\000À\1€\1\000\2\000\2AB\4\000Ö@‚\3›\1\000\000\23\000\2€À\1€\1\6\2B\000@\2€\2\29‚\000\1A‚\4\000€\2\000\3ÁÂ\4\000ÖÀ‚\3\23@\3€À\1€\1\1\2\3\000Ö\000‚\3À\1€\1\5\2€\000@\2€\2€\2€\000ÍBC\1\29‚\000\2Ö\000‚\3À\1€\1\000\2\000\2A‚\3\000Ö@‚\3ß\000\000\1\31\000€\000\5\7\21 þmša0³É[\000\29»CÕ\18Úe•I‰\\¿SŽXkÞ9\28\18\000\16I\25†lþ\6\2\000\000\000\000\000\1\1\9\7!\25e4Ôa÷\28,oÚã\31LùM<4\
\22’EôEEl±E¤?_\11A\28\20\000\000\000\4\1\000\000\000¡\4\7\000\000\000ÒÕÓÈÏÆ¡\4\4\000\000\000ÓÄÑ¡\4\2\000\000\000¨¡\4\6\000\000\000ÑÀÈÓÒ¡\4\5\000\000\000ÕØÑÄ¡\4\2\000\000\000ƒ¡\4\2\000\000\000ú¡\4\9\000\000\000ÕÎÒÕÓÈÏÆ¡\4\5\000\000\000üœ¡\4\6\000\000\000ÕÀÃÍÄ¡\4\2\000\000\000«¡\4\3\000\000\000Ú«¡\3\000\000\000\000\000\000ð?\4\4\000\000\000Ü«¡\4\4\000\000\000ƒ«¡\4\r\000\000\000ÆÄÕÌÄÕÀÕÀÃÍÄ¡\4\15\000\000\000ÌÄÕÀÕÀÃÍÄŸœ¡\4\9\000\000\000ŒŒŸúƒ¡\4\4\000\000\000ƒü«¡\000\000\000\000\20pi\23´\16G6¤æÈz”\1ÿbñ5äAIþ!tn/÷e\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\22pi\23ßD’DQM\r)^\11úw{Ê-z\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\23pi\23\\y”Y«}÷Ux\7íq2Œn?@Ç€2\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 Nìn6Ú–Å\20Ñ\5ªsW›!\27 ŒHx»\000\9\20 \27\21òJåÕ O¦\3¯.3\127<qü¿+E\
I0\18\3¦­x-†\8«6’\3}\11t\0258\8t\25Y ´Z\23ÇÌh\26\3äh\6J\6~o¼(‚°‹b±ðö+\8\23\29^[\
v\25\17\9v\25}ú.+bögnÚ±E‹\25@\27Fç8G(žþ{e°\0050\24íâ:\1279 \23\000#\8\6 —Å%\\Î³éP!R@s|›Æ+t·˜\127TÑ|dx[òp~\000É\17Xw*]¥øxy\1\r\8\8 AŒ6þ\24-TAþ'~·Dp\31‹\31wZ8rV4\18=\16n\6È„\1\5†GJhº\
1*{is`ùÙ-E$ÝLqb¢:ˆ—Ø)ªÔâ|\20\000\000\000~8x8¹x88e¸89¿¸ø8ùø88\11\1\000\000G\1A\000[\1\000\000\23@\1€G\1A\000\
A\1‚GAA\1€\1€\1À\1\000\2]A€\1GAA\1€\1€\1À\1\000\000]A€\1\31\000€\000\000\7\21 \7Ñø@°\0171%\8\000\16I\25Õ„â\17\1\000\000\000\000\000\7\7!\25œ°q}I<{\17%5î|\20\12dnÈ<D#}¬\24Z\6\000\000\000\4\8\000\000\000ÉÞÊÎÒÉÞ»\4\3\000\000\000ÈÁ»\4\6\000\000\000Ë×ÒÈÏ»\0043\000\000\000”ËÉÒÍÚÏÞ”ÍÚÉ”ßÙ”×Èß”ØÔÖ•ÚËË×Þ•×ÈßÒßÞÕÏÒÝÒÞÉÈ•Ë×ÒÈÏ»\4\23\000\000\000÷èúßÍÞÉÏÒÈÞÉòßÞÕÏÒÝÒÞÉ»\4\6\000\000\000ÌÉÒÏÞ»\000\000\000\000\23pi\23òsŸ8\26î¤\16¸\29\
<3rÇ6Ò2\0210\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 \1að1\14ªjg˜(\14v[\000ƒ\0074¸\1oÙE^w>Ök<'\8\9\20 xÎÂTY\11t\0257\8t\25ÑfÙ\11Tßc\22\27’ƒ\21„ ß\r\29ÅD-¢’Ì3úT3V\
v\25\16\9v\25½˜\8p×\14\4/u¢Ö.7&\16UN-Í\20°•\30$ÆÄƒ^o¿¸+\000,\8\6 \20\1KhêI½\127µÕ\r\21b;\26øó'g\1\2\8\8 pb¾!,¬)V&Dúz®8*^{;D\5vö\5\6'\7í2I»K8G]ß\17{æPIÎyV4\18˜«•vI\000\000\000ˆÎŽÎ‰Ž\14ÎNÎÎÎ\15NÎÎ“NNÏEÎÎÎ•ÎÎÎÙÎÈN\2\14\14Î\19ÎÏÏÙŽÊN\8ÏÎ\9\15ÍÎÌÎÍLÏÎ\19ONÏ\21ÏÎÎÙŽÏN\8\1A\000ÇÁÁ\3\000\2\000\3A\2\2\000Ý€\1€\1€\3ÆAB\000ÇÂ\3\000\2\000\1@\2\000\3ÝA€\1â@\000\000cÁú\127ÌÀÂ\000Ý@\000\1Õ\000\000\1\24\000Ã\1\23@\000€Ã\000\000\000ß\000\000\1Æ\000@\000Ç@À\1\000\1\000\000AA\3\000Ý€€\1Û\000\000\000\23€\6€\21\1\000\1X€C\2\23\000\4€\1\3\000U\1\000\1NÃ\2\3\000!A\1€\12ÂÃ\1‡Â\1\1\29B€\1\12ÂÃ\1\2\4\000\29B€\1 \1þ\127\12ÁÃ\1•\1\000\1‡\1\1\29A€\1\23€\000€\12ÁÃ\1‡C\1\29A€\1\12ÁÂ\1\29A\000\1\6AD\000\31\1\000\1\31\000€\000\5\7\21 Æÿ\18S…ŸÑ\28Äx¤q\14\23\2úA¨Kûž´Fì;ä\22\11\4\16I\25Ác8%[ûœB\
Á\11Õdƒ\rFEZB\1\000\000\000\000\000\4\7!\25êÆ¾'>9‚)ŸÞê\28[)}Ikå«\127\18\000\000\000\4\3\000\000\000NH'\4\5\000\000\000HWBI'\4\2\000\000\000U'\4\6\000\000\000KNIBT'\4\7\000\000\000TSUNI@'\4\5\000\000\000ANIC'\4\2\000\000\000.'\4\4\000\000\000TRE'\3\000\000\000\000\000\000\000@\4\6\000\000\000SFEKB'\4\7\000\000\000NITBUS'\4\6\000\000\000DKHTB'\3\000\000\000\000\000\000\000\000\4\2\000\000\000P'\3\000\000\000\000\000\000ð?\4\6\000\000\000PUNSB'\4\2\000\000\000-'\4\6\000\000\000ANUTS'\000\000\000\000\23pi\23\9b§'æ ð\4<\25ë\0290i”Z/Ü;=\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 ÊÏ?Do\11vÜ\28e_‘¶'\15#Ú\31PCÖ‰\17\
š“\30“€¥B’\1\9\20 õ{P53Êât¹tU,•\
?5v¢ôF•Àý#‰’¶IÝTû\22A\11t\0253\8t\25\28á$&Ž›žsàôN1r\
v\25\17\9v\0250Fý\8X`É8r•©e¢rƒ9\9c_Ks\31–~ú\000œ2¶&Â?=ïÕB\000*\8\6 “C'\31Ï¥ýQ­JÇx\2\r\8\8 Ù?‘pAËl;0|Y_â\16Âi6G½p:|V4\18ËQü%Ùè0\0271F\21:Uä²o\15\000\000\000¼:z:½zz;ú:::;»:\000€€\1›\000\000\000\23€\1€ÌÀ@\1@\1€\000Ý@€\1Ì\000A\1Ý@\000\1Ã\000€\000ß\000\000\1\31\000€\000\1\7\21 AÌ^fqÅ×\21DÙÊ%\6\9\16I\25¦®r8t\31È.z!wP\24D\28\30\23’Khƒ„Ö\27‹c²\28\17“ç\26\1\000\000\000\000\000\2\7!\25ÉRˆ_›\3CÍî¿z\5\000\000\000\4\3\000\000\000ûý’\4\5\000\000\000ýâ÷ü’\4\2\000\000\000å’\4\6\000\000\000åàûæ÷’\4\6\000\000\000ñþýá÷’\000\000\000\000\17pi\23HNV<£\8q+q8\23\"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\16pi\23Ó„Ê\
SIÙ\11\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 ØG9'†¤b\\ÎBðc%b±\27f-k\7÷' T\27’—O\\Î—+\
6'qnÏ\21dŒ\11\9\20 C…úYy‘ëL”\11t\25:\8t\25É\29ù\"cð¤\24¢{ÈK5È\18Tòv7-X\127,S~+>w¥DŽ\000¤\"=Y2\6xxŸ\
v\25\16\9v\25K%þh\"û@\19f¾Ù?‹¼9\29íÈO[>\6\19g\17aœy»\11@?\000+\8\6 xŽ\7\1³3à\19\1\14\8\8 Ô\\Ÿ,½i\7\5íÉq6\
\3N.¯ioa0Ol\16Ì{V4\18ùle3ç„Þ\19Š¾mC%\000\000\000©ÌÌÌiŒÌÌ\12ÌLÌÍÍÌÌ\17ŒÌÍÔŒŒÌÛ\12ÌL\12ÌÌÍÍMÌÌ\17@\000\1\23À\000€ÆÀ@\000Ç\000Á\1\1A\1\000Ý@\000\1Æ€A\000\1Á\1\000Ý€\000\1\7\1Â\1GAB\2\2\000]\000\1ŒÁÂ\2\1\2\3\000A€\1ŒÁÂ\2\1B\3\000A€\1ŒÁÂ\2\1‚\3\000A€\1ŒÁÂ\2\1Â\3\000A€\1Œ\1Ä\2A\000\1\31\000€\000\5\7\21 Ùû\21Aã=š\22­`¶~~@¤A‡`×oßf.w÷fÿp\9\4\16I\25\1bo\
^%Ù0]B\15vî*¿eœ+ì\23\1\000\000\000\000\000\3\7!\25ª6ÿ$\000”°\26\17\000\000\000\4\23\000\000\000£úíþ£áãîåàé£Áéèåí£ÈÏÅÁŒ\3\000\000\000\000\000\000\000\000\4'\000\000\000£úíþ£áãîåàé£Áéèåí£ÜäãøãÈíøí£ØäùáîâíåàÿŒ\4\3\000\000\000ãÿŒ\4\8\000\000\000éôéïùøéŒ\0041\000\000\000þá¬¡þê¬£úíþ£áãîåàé£Áéèåí£ÜäãøãÈíøí£Øäùáîâíåàÿ£Ú¾Œ\4\8\000\000\000þéýùåþéŒ\4\3\000\000\000ÿöŒ\4\8\000\000\000ÿýàåøé¿Œ\4\5\000\000\000ãüéâŒ\4*\000\000\000£úíþ£áãîåàé£Áéèåí£ÜäãøãÈíøí£Üäãøãÿ¢ÿýàåøéŒ\4\5\000\000\000éôéïŒ\4'\000\000\000èéàéøé¬êþãá¬ÖÍÈÈÅØÅÃÂÍÀÍßßÉØÍØØÞÅÎÙØÉßŒ\4\31\000\000\000èéàéøé¬êþãá¬ÖÍßßÉØØÃÍÀÎÙÁÃÞÈÉÞŒ\4\26\000\000\000èéàéøé¬êþãá¬ÖËÉÂÉÞÅÏÍßßÉØŒ\4\23\000\000\000èéàéøé¬êþãá¬ÖÓ½ºÍßßÉØßŒ\4\6\000\000\000ïàãÿéŒ\2\000\000\000\12\9\20 òåé>ï¸µX\18`Ègyä:{1¥Ý/\8\000\9\20 3õ|\8œ\22\21#bbgwV5\2\31Š0êfÿOŽ\12Ž9Õ+™Î\31mqÇ\2s¿\11t\0256\8t\25UöÍ\9àßŽ\26Š‰0sc$Ü#Êg0\1+\19ü\23\
v\25\16\9v\25~‘T¹Íó\rÀqê.é[îX^ä!h'ÆåH„\1ç\rPÊ\11'\000*\8\6 –a¯uÉ®F\"G$yQ\1\2\8\8 OIr\3{\25öY\21,Ôy±«ÙzÑNøxŸ\\¾`±ûg\7_ˆÍ$9+ÞM\"Ãjz}V4\18\2£ù\20\000âà\4ñEˆ{Ì\
*\22+õÜ\28\27\000\000\000ÖÐ×ÐP\17\16P\6P‘Í\16‘\28PP\000\000\1\1\23€\3€†\1A\000‡AA\3À\1€\2\1‚\1\000€\1\24ÀA\3\23À\1€†\1B\000‡AB\3Á\2\000\000\2\000\000AÂ\2\000€\2€\2Ö‚\3A\000\1¢@\000\000#û\127\31\000€\000\8\7\21 Jœ·jåÂÐ*#Ê&\0064ø¥CC§ò\18J\12O¸ùŒQ“qþ9`\15¨pN[<G\11\000\16I\25¨3!B\1\000\000\000\000\000\3\7!\25¬i·_#M\23\28\12\000\000\000\4\3\000\000\000ag\8\4\6\000\000\000xgxmf\8\4\4\000\000\000d{(\8\4\6\000\000\000dafm{\8\4\7\000\000\000{|zafo\8\4\5\000\000\000nafl\8\4\3\000\000\000-&\8\000\4\3\000\000\000g{\8\4\8\000\000\000mpmk}|m\8\4\8\000\000\000ze(%zn(\8\4\2\000\000\000'\8\000\000\000\000\26pi\23]\21‘Zô›\15\21|ùx\14\17ùaS$Ý9µ$lF1Ôc\\É|K\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\9\20 !È\4PB\6¾;<6vpš\
\9\20 §BB\127eCeK\11°­)¥\11t\0258\8t\25E°ñgµßíSªo>8ÿy\8H”¥|\20Sçõ1ó5C(:ì#\17ˆ\
v\25\25\9v\25Û¶\
\000(\8\6 ÿ%\7N\1\r\8\8 Ü×#G„ÇØ>7Õ\23JF-\0013\16ßý\"ÓyV4\18Ëw\16?\20\000\000\000•Ó“Ó”“\19ÓRSÓÓ\19ÓÓÓE\19ÓÒ]€\000\1ŒÀÀ\000\000\1\1\23À\1€†\1A\000‡AA\3Á\1\000\000\2\000\000AÂ\1\000€\2€\2Ö‚\3A\000\1¢@\000\000#Aý\127\31\000€\000\11\7\21 ZÙw\24\14~ÎzÔÓ°7m\8g¾ÈŸ\23{\22ó6ÒKæ2ÉxMAÁÛ@\11\3\16I\25~X;\21kKÏx\1\000\000\000\000\000\2\7!\25\19þ·)¾2Å*\
¬#\11\8\000\000\000\4\3\000\000\000óõš\4\6\000\000\000êõêÿôš\4\4\000\000\000öéºš\4\6\000\000\000öóôÿéš\4\3\000\000\000õéš\4\8\000\000\000ÿâÿùïîÿš\4\8\000\000\000è÷º·èüºš\4\2\000\000\000µš\000\000\000\000\22pi\23ˆÜPNå<Ú\21ÃvW-ˆ\2X\28\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\24pi\23ŸN{t\12Ê0[—pnMå{|'\29©.~ƒAQ\30ïoè ?=\28ß»\24xfg\8\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 Aä\0043ÒI\
%CÛçM\"SÍ\12Õ{Õm£%SLùÉf\6¼—R\3qˆ\26÷\000\9\20 ò¨¬\22\6ÿÿ<ÊâCWí6vxöq{<|2/eÝÜ\0266.[×.Ø\\`P€\11t\0252\8t\25Ðÿo\19‡zóZ¾\
v\25\31\9v\25BØp\rÄä\3;ù^u\15Ãú\20H°\9\23,‘\16\16\000^5\4\000-\8\6 þÚ\0265C9\29R¬çÛVÔVð\"\000\000\8\8 ¥±B]îB&Xàø8Þþ\1 ~41J‰¥Oäý>ê`x\8\\qV4\18f“§m\216~\9Ëâ)?ð\7>V\18Î`ÙÊR=Æjû\0248ò•4\27£ÃJ\25\000\000\000Z\\\28\\\29\28\\\\AÜ\\]\27Ü\28\\Ûœœ\\\\]\\Á€\000\1Ì@A\1A\1\000Ý@€\1Ì@A\1AÁ\1\000Ý@€\1Ì@A\1A\1\2\000Ý@€\1Ì@A\1AA\2\000Ý@€\1Ì@A\1A\2\000Ý@€\1ÌÀB\1Ý@\000\1\31\000€\000\3\7\21 1‚ô)\6\4\16I\25Óÿ\8k]\19\5:*Äóc\\”\0235[î\31o\1\000\000\000\000\000\8\7!\25\8|ó\11/E\16\18U\\T­-6i¿3S8­<z\r‹,Æjß±‡iøÅ\31]\12\000\000\000\4\8\000\000\000…’†‚ž…’÷\4\3\000\000\000„÷\4\8\000\000\000„†›žƒ’Ä÷\4\5\000\000\000˜‡’™÷\4\29\000\000\000Ø–…Ø¼’Ž”Ÿ–ž™„Øœ’Ž”Ÿ–ž™ÚÅÙ“•÷\4\5\000\000\000’’”÷\4%\000\000\000³²»²£²×±¥¸º×’™‡× ¿²¥²×–…‡ËÉÐ–‡‡›’Ð÷\0043\000\000\000³²»²£²×±¥¸º×”’…ƒ× ¿²¥²×–…‡ËÉÐ›˜”œ“˜€™Úž“’™ƒžƒž’„Ð÷\0043\000\000\000³²»²£²×±¥¸º×œ’Ž„× ¿²¥²×–…‡ËÉÐ›˜”œ“˜€™Úž“’™ƒžƒž’„Ð÷\4\17\000\000\000³²»²£²×±¥¸º×ž™’ƒ÷\4\28\000\000\000³²»²£²×±¥¸º×„†›žƒ’¨„’†‚’™”’÷\4\6\000\000\000”›˜„’÷\000\000\000\000\21pi\23É\18\000r0†;%Jša$0¦§_E#r#SeDNo–¯\29\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 Å\17\
'†\
\9\20 Ûàƒ\23w‹%Mº\18º>ù\11t\0257\8t\25…ª‚iŽû©YáÎ´U\9@»\29›d\31\8ìv\\]§_º4ª\
v\25\27\9v\25¿\19”\21z}±v¦1(\23\1!\8\6 ›êŒ53J4A:\r\16#\0038<•Aò\22Êik\30¦žeZ4ý2\000\000\8\8 \30¯\\*·!\30<®\20^UãÀfQ \9¹VÒ çm¾¡êh\23•Þ#\14yV4\18?a\r\24\000\000\000\11\14\14\14O\14\14\14N\14\14è\14\14\14\19Ž\14\14k\14\14\14€\000\000Á\000\000\000\21\1\000\000\26\000\1\23€\2€\6AÀ\000\7Á@\2@\1\000\000€\1€\1\29€\1@\1€\000€\1\000\2]\000\1Í@\1\000@\1\23@ü\127Ÿ\000\000\1\31\000€\000\6\7\21 ä¸BQ¦\127\28+¶\19k\14Ð/Ÿ.\7\11\16I\25\0209dpC3DÇ\\ˆVºjŒ\7/-òXcG\21\12í´ÀHi¼ÿh†JMHƒö²_\2\000\000\000\1\2\000\000\5\7!\25-Øë-Ý*°\18\127y»8K‡HX\4\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000õòôïèá†\3\000\000\000\000\000\000\000\000\4\5\000\000\000äÿòã†\1\000\000\000\14\9\20 v\0047\23«€ÇTåÑu@Ò\9\\M•þ9yÖZ%PÅ«˜d\23\12\9\20 µæ_\26\12~%\000þ\12ï6äÈ?ZèÁbð\11t\0256\8t\25íYû#„—Ú8)ZõO²\24ì?(o¸\22xH½X¬\
v\25\26\9v\25„\12H\17K4|T\000.\8\6 ©‹é.?Î(c?Ó°[\17ç³nÜjnOõ\000\"2‡ëê\5\1\2\8\8 ÚÒ—rYõFS\29êo\29±-½B\31¡ß7ç\7jRï&¿AÔ‡?Ró…Rî3®xézV4\18OØ\5\15¦ªÊ5\23\000\000\000ò©ééþiéi¨ééé¶ééèþéíiðéi€\23€\000€A€\000\000_\000\000\1\23À\2€\25\000€\23€\000€A\000\1\000_\000\000\1\23€\1€\25\000€‚\23€\000€A€\1\000_\000\000\1\23@\000€AÀ\1\000_\000\000\1\31\000€\000\7\7\21 x2û^XÃ¶uútä\4ðz¸7\\º&P\2\6\16I\25<¯4\0124s™\14'\r\22E{}]osFJj9ôÉ3WèË>\000\000\000\000\9\7!\25Àß´9ßÓ\1cC\26\4\15\26Õû\12ü½q\000ôGÁQ9vÛDãÅÛR\8\000\000\000\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000n@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000 l@\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000h@\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000ð?\000\000\000\000\19pi\23\rþ\26\23\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\24pi\23Ò¢.\12ÅNê($º¼Z!{4\27kù´^ö¿èH™­/zÄ¼kTð4ÍM‰(è1\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 \9!-.žæ!\9[\11\9\20 úDç=úb¬MÜ\11t\0255\8t\25‘\9ß\000²¶Ø@¨¦5r©\8_Zý—œ_Ò\
v\25\31\9v\25ÒŠê\1h™\24O\27¼&üøÝ$y+¨\20Ê‘¯P“WZ\26\000.\8\6 \4\29W.fÚ¾\000F†‘\16®ß\"+Z¾#\3ÆkÀIv\"Œ~\000\9\8\8 ½/¥lü|V4\18[\22ÇuÂpÌXõ¹=\6U[®3e\000\000\000úü¼üû¼¼üçüüüë¼ý|úü¼üºü¼ü»¼<ü±|<üö¼||ë<÷|ú<¼ü½üýüá|üý»¼½ü»|=ü¡||ü}<ýü§üüüë|ú|=|üüéý|ü½}üü\29üù|:ý¾üú¾¾üû‚B\4@\2€\000€\2\000\3À\2\000\3\29\2\000\2Ý\000\000Û\1\000\000\23€\2€À\1\000\1\6BB\000\7‚B\4@\2€\000€\2\000\3À\2\000\3\29‚\000\2–\000‚\3Õ\1\000\1ZÀ…\23€\000€à@ú\127\23\000\000€\000\3\000Õ\000\000\1\25À€†\23@\1€Æ\000@\000\6\1B\000@\1\000\1\29\000\1Ê\000€\23@\000€Æ\000@\000Ê€À€\1À\1\000A€\3\000„\000\000\000Æ\000@\000ÇÀÃ\1\6\1B\000F\1D\000†\1@\000‡A@\3]\000\1†\1D\000ÆAD\000ÇÄ\3Ý\1€\000\000\000ŒÁD\3\000\1V\2\29\1\000\1Ý@\000\000Á€\000\000\1\1\5\000A\000\000á\000\3€Æ\1@\000ÇAÅ\3\1\2\5\000Ý\000\1€\000€\3À\1\000\000\6BB\000\7‚B\4@\2€\000€\2\000\1À\2\000\1\29‚\000\2\22\000‚\3à@ü\127Æ\000B\000\000\1\000\000Þ\000\000\1ß\000\000\000\31\000€\000\1\7\21 o0n/æd4nŠQg\12\11\16I\25mì\14k\"îFô«ümbøÖ\16Ô»~_CÇ¸\20^ñ´5Mç&t\14YheòH\15P\1\000\000\000\000\000\7\7!\25\18v¿\19X#ÎPØHvsÀUâ>³áñSž´6=\22\000\000\000\4\5\000\000\0006:/3[\4\5\000\000\000\4)5?[\3\000\000\000\000\000\000ð?\4\8\000\000\000)>*.2)>[\4\3\000\000\000(![\4\7\000\000\000(\"(/>6[\4\5\000\000\000.?2?[\4\1\000\000\000[\4\9\000\000\000/45.69>)[\4\7\000\000\000(/)25<[\4\4\000\000\000(.9[\3\000\000\000\000\000\000\8@\4\2\000\000\000j[\3\000\000\000\000\000\000\000\000\4\11\000\000\000kjihonmlcb[\4\11\000\000\000):5?46(>>?[\4\9\000\000\000/4(/)25<[\4\3\000\000\0004([\4\5\000\000\000/26>[\4\8\000\000\000)>->)(>[\3\000\000\000\000\000\000$@\4\7\000\000\000):5?46[\000\000\000\000\16pi\23ÁwŽ\11[äÛ)\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 ¯é6\1cÿ8-nð‘E\23 oFaú9U“îˆs}vž<äíX3P\1\9\20 P \18hÇ\9QAbF‹Pã.’\15ŽÞÖ#›”ïlïŒB â\26ÔcŠ\14t\0256\8t\25ç\8\\tÆ€\\7ZÇJlÏÙþY\29@XkxµFr÷\
v\25\29\9v\25ŽÑ\30Gú£\"\1{\31Û@Æ†HA×ÿ|\1(\8\6 )†n\1\11\8\8 A)\8Š€»C¶\0266Ã~V4\18S~~\23\28òòC¿Ž&_\26ˆÏX~8~\20¢½¸n:\1\000\000ˆÃÃÃËƒÃC…ÃƒÃHÃÃÃ‰CCC…ÃƒÃHÃÃÃ‰CÃB…ÃƒÃHÃÃÃ‰CCBˆÃÃÃEÃƒÃ&ÃÃÃI\3ÃAEÃƒÃ&ƒÃÃI\3CAEÃƒÃ&CÃÃI\3Ã@E\3‚Ã\3ÃÃÃ^CÃÂÛÃÂÔƒÏCHƒÂÃ\8ÃÃÃÅBÃÞÂCÃ'ƒÃÃ\4\3\1ÂI\3CG\8ÃÃÃÅBÃÞÂCÃ'ƒÃÃ\4ƒ\000ÂI\3ÃEI\3€DIƒ‡K\8ÃÃÃI\3ÃJƒÃÃÂE\3‡Ã\3ÃÃÃ^ÃÂÂÔÃÃC‰CBÁaCÃÃàÂ<¼DÃ\6ÃXÃÃÃÔCÁCB\3ÁÃ\4Ã\6ÃÂ\2ÁÃbÃÂCEÂÃD‚†À\4B\7ÃÈÁÃÃ^‚CÂcƒ=¼ÔCÂC‰\3I‰\3†HEÃÃDƒ†Â\4C\7ÃÈÂÃÃ^ƒCÂ‰ƒ…O‰ÃN‰\3\6NÔCõCE\3‚Ã\3ÃÃÃ^C\000\1\24\000G\1\23@\28€…\000€\000ÁÀ\2\000\1A\7\000A\7\000¦\1\000\000€\000\000Å\000€\000\1A\3\000AA\7\000Á\3\000æ\1\000\000Ý€\000\000\5\1€\000AÁ\7\000A\7\000ÁA\4\000&\2\000\000\29\000\000E\1€\000\1\8\000ÁA\7\000\1B\8\000f\2\000\000]\000\000…\1€\000Á\8\000\1\2\7\000AÂ\8\000¦\2\000\000\000\000Å\1€\000\1\2\9\000A\2\7\000B\9\000æ\2\000\000Ý\000\000YÀH\3\23@\000€\25€†\23À\000€\6‚I\000AÂ\9\000B\3\000\29B€\1\4\2€\000\24ÀH\3\23\000\1€†‚B\000Â€\000@\2€\5\000\2\000\5\23À\000€†‚B\000Â€\000\000\2€\5@\2\000\5…\2€\000Á\2\
\000\1\3\7\000@\3\000\4¦\3\000\000‚\000\000Å\2€\000\1C\
\000A\3\7\000€\3€\4æ\3\000\000Ý‚\000\000\5\3€\000Aƒ\
\000C\7\000ÁÃ\
\000&\4\000\000\29ƒ\000\000E\3€\000\3\11\000ÁC\7\000\1Ä\
\000f\4\000\000]ƒ\000\000‹ƒ\3\000ŠÃÅŠ\3BŠCFŒŠƒ€–ŠC\1—Šƒ—Šƒ‚„ŠÃ\2†ŠÃ\1˜Š\3\1ˆŠ\3ƒ˜ŠC\3™ŠÃ\000‡Ë\3\000\000ŠÃ\3‰@\000\000\7\25ÀB\000\23À\000€†ƒI\000ÁÃ\12\000\1D\3\000C€\1Ã\2\000À\3\000\000\1Ä\2\000¡\3\1€†\4B\000‡DE\9Ç„Ä\000\11\5\000\000D€\1 Cþ\127\23À\24€„\000\000\000\27\000\000\000\23@\000€€\000\000\000\23\000\000€€\7\000Å\000€\000\1Á\2\000AA\7\000Á\3\000æ\1\000\000Ý€\000\000\5\1€\000AA\3\000A\7\000ÁA\4\000&\2\000\000\29\000\000E\1€\000Á\7\000ÁA\7\000\1B\8\000f\2\000\000]\000\000…\1€\000Á\1\8\000\1\2\7\000AÂ\8\000¦\2\000\000\000\000Å\1€\000\1‚\8\000A\2\7\000B\9\000æ\2\000\000Ý\000\000YÀH\3\23@\000€\25€†\23À\000€\6‚I\000AÂ\9\000B\3\000\29B€\1\4\2€\000\24ÀH\3\23\000\1€†‚B\000Â€\000@\2€\5\000\2\000\5\23À\000€†‚B\000Â€\000\000\2€\5@\2\000\5…\2€\000Á\2\9\000\1\3\7\000@\3\000\4¦\3\000\000‚\000\000Å\2€\000\1\3\
\000A\3\7\000€\3€\4æ\3\000\000Ý‚\000\000\5\3€\000AC\
\000C\7\000ÁÃ\
\000&\4\000\000\29ƒ\000\000E\3€\000ƒ\
\000ÁC\7\000\1Ä\
\000f\4\000\000]ƒ\000\000‹Ã\3\000ŠÃÅŠ\3BŠCFŒŠÃE‹Šƒ€–ŠC\1—Šƒ—Šƒ‚„ŠÃ\2†ŠÃ\1˜Š\3\1ˆŠ\3ƒ˜ŠC\3™ŠÃ\000‡Ë\3€\000\11\4\000\000äC€\000ŠÃ\3‰@\000\000\7¥À\000\000\8€\000š¥\000\1\000\8€€š¥@\1\000\8€\000›¥€\1\000\8€€›¥À\1\000\8€\000œ¥\000\2\000\8€€œ¥@\2\000\8€\000¥€\2\000\8€€¥À\2\000\8€\000ž\31\000€\000\3\7\21 \26Ím\1\21\000\16I\25Šz`\3\000\000\000\000\000\1\3\1\2\3\7!\25ySW\3Q\2×\23=\000\000\000\4\
\000\000\00075$\5\25\0038?'P\4\r\000\000\000#9>7<5\0025#%<$P\4\12\000\000\000=%$9<\0025#%<$P\4\r\000\000\000\"5<1$5\0025#%<$P\4\7\000\000\000? $9?>P\4\8\000\000\000? $9?>#P\4\
\000\000\000? $9?>\2<$P\4\5\000\000\000$) 5P\4\6\000\000\000$12<5P\4\6\000\000\000'94$8P\4\14\000\000\00075$\0033\"55>\0039*5P\3\000\000\000\000\000\000ð?\4\7\000\000\00085978$P\3\000\000\000\000\000\000\000@\4\7\000\000\000?;>1=5P\4\7\000\000\000µìÐµ÷ÛP\4\11\000\000\00031>35<>1=5P\4\7\000\000\000µßÆ¶æØP\4\6\000\000\000 175#P\4\6\000\000\000 19\"#P\4\4\000\000\000>%=P\4\7\000\000\0009>#5\"$P\4\12\000\000\000 175>%=$) 5P\4\8\000\000\0004561%<$P\4\9\000\000\000 175$) 5P\4\6\000\000\000=%<$9P\4\8\000\000\000\"5$$) 5P\4\6\000\000\000#$)<5P\4\7\000\000\000>%=25\"P\4\7\000\000\000#$\"9>7P\4\r\000\000\000¸ÔÊ¶Ìü¹ÕÝ·íþP\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\4\r\000\000\000%93?>697~41$P\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000^@\4\6\000\000\0005\"\"?\"P\4J\000\000\000\5\25\0305'xyµ×í¶Åà·üüg´èúµßÒ¶Åà·ÊÔ\5\25¶Èî·ôê¶ÆéµÀÁµáÎ¶Ð÷µêÄ¸ÿõ¸þî·íþ´èê`³ÐÑa¶ØÆbP\3\000\000\000\000\000\000\28@\3\000\000\000\000\000\000 @\3\000\000\000\000\000\000\"@\4\1\000\000\000P\3\000\000\000\000\000\000$@\4\7\000\000\000$9$<5#P\4\7\000\000\0003?>697P\4\7\000\000\000?\"95>$P\4\6\000\000\000$9=5\"P\4\8\000\000\000273?<?\"P\4\11\000\000\0002$>2;3?<?\"P\4&\000\000\000µôÊ¹ñå¶Èî·ôê¹ñå¶Åà¸þî·íþµêÄ¸ÿõµô÷´êÞ`P\4\8\000\000\000\5\25\028125<P\4\8\000\000\000\5\25\002149?P\4\7\000\000\000\5\25\02149$P\4\8\000\000\000\5\25\019853;P\4\8\000\000\000\5\25\19?=2?P\4\11\000\000\000\5\25\19?=2?\2<$P\4\12\000\000\000\5\25\19?=2?\2<$#P\4\8\000\000\000\5\25\25=175P\4\7\000\000\000\5\25\0038?'P\12\000\000\000\14\9\20 E ‹\16Í7«\12ù\8\23¾P{j‰ªÕXó\16“qÙ‡P| \8\9\20 ZBõ;1\12t\0252\8t\25\18ðßx*€a\31í\
v\25\29\9v\25.Ð€'°z’8×Èst…f¡>Æ€¬]\000(\8\6 CCfe\000\
\8\8  /ëHaž8$ùzV4\18Hó10oRr!\000\000\000ÿù¹ù¿¹¹ù¾y9ùäùøøîùÿy¿8¹ùyøùû8øøù¤€\1\000\1€\2U\1\000\2\25@‚\23\000\4€AA\1\000•\1\000\2ŽA\3Á\1\000a\2€FÂA\000†\2B\000‡Â\000\5]‚\000\1\24\000‚\4\23\000\1€F\2B\000‚A\4‡‚\2\2J‚‚\1\23\000\000€`Áü\127\"€\000\000£\000ù\127\31\000€\000\
\7\21 ó]W\6düTk/»™_À•\2\19]š]\2í\11\21JI@ØkP«ðs\11\6\16I\25¤Ù NsžÈ=!ÖZ\0021ÿ@\19…Ž¨6KV¼!WïÜn\1\000\000\000\000\000\5\7!\25ûÐNZ.¸Pc8ÅÊ\28ÁQû7\9\000\000\000\4\6\000\000\000PAIRS \4\
\000\000\000GETuisHOW \4\r\000\000\000SINGLErESULT \4\9\000\000\000STRsPLIT \4\2\000\000\000\12 \3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000ð?\4\9\000\000\000TONUMBER \4\3\000\000\000\127g \000\000\000\000\21pi\23|\0081\2 HÔf;”Û\14Ý¦i&@Þ–h\2²GP&šúW\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 fŒ\6_ÈÎßPW²ö\127'•Ç?~\24›\14ÚP\24cÎ\22Gh*\000\9\20 À•2M+Œ¾\26’Ç‡t\000\11p\"Á“™xë‡@hÇü—W¥\11øJ\30DÁ\6 \12t\0255\8t\25r±Õ\r\26úêDæw–\12²Õ¢\3“„x\26\rv\25\31\9v\25m±øk8ãgy2¶\
OæsNSãâ'\28V\24¥\9M\000U2\000(\8\6 ­Ê›\9\000\11\8\8 *Ê¢{ˆ\27´lB¬cZ½\127V4\18\2B–'\25òþC¥W°C\3M\6JÚ…˜<ßð+ÊIž!C\000\000\000»½ý½ûýý½ú=}½ ½¼¼ª=³=û|ý½=¼½¿|¼¼½à<=¼½¼=¿ûüü½;|ý½}¼=¼¼¿¼½ <=¼:<ü¾ú<<\2Á\1\000À\1€\2\1Â\1\000V\1\2\3\1\2\000Õ\1\000\2ÎÁ\3\1‚\1\000¡Á\4€†BB\000‡‚B\5À\2€\2\1Ã\1\000@\3€\4Ã\1\000\22ƒ\3\6‚€\1XÀB\5\23@\2€†BA\000ÆÂ@\000\000\3€\1A\3\1\000Ý‚€\1\rƒÁ\4Ç\2ƒ\5\rƒÁ\4\7\3\3\2Š\2ƒ\5 ú\127†AA\000ÆÁ@\000\000\2€\1A\2\1\000Ý€\1ÇÁ\3‡Á\1\3ÇA\2XÀ\1\3\23€\1€†AA\000ÆÁ@\000\000\2€\1A\2\1\000Ý€\1ÇÁ\3ŠÁÂ\3\"€\000\000£€ð\127\31\000€\000\6\7\21 ®#²2\23º|:ñBf\21È\29w\15\9\16I\25¤\24\9\25[¢*pi¬r\17Ê\1\5”…’i›b¨A÷=PXwhº\5\1\000\000\000\000\000\7\7!\25D>¥\
#\26ÂržEéT¸ÓÁ|Nädn&aA\12\000\000\000\4\6\000\000\000ZKCXY*\4\
\000\000\000MO^\127cyBE]*\4\12\000\000\000G_^CFxOY_F^*\4\9\000\000\000Y^XyZFC^*\4\2\000\000\000\6*\4\3\000\000\000um*\3\000\000\000\000\000\000ð?\4\2\000\000\000j*\3\000\000\000\000\000\000\000\000\4\7\000\000\000Y^XCDM*\4\5\000\000\000LCDN*\000\000\000\000\000\26pi\23<J¥\0239ñÅ\16ýÁ»~U<¤[ÞHvT\000\15ÂH/Â<\24n(g\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 „‡^e\\nÍ<ä\8\9\20 ð\15\7D\20\12t\0251\8t\25ŸèŸt\9\rv\25\29\9v\25‰Ç…|\25Pê\"žêð*\5Åá\24DlòZ\000.\8\6 :OÊCßà•\30ã==Nk=ÃI4ú²`#\4P\20\23\26g*\000\000\8\8 Yé=\26ŽˆoDm#ó| \20lM¢8v\
!)W\" ‚Ž#“\1æ\11ÐqV4\18ïo³H·0id\24÷mNß\127º\12Ÿ\"%X·ß\rCÊ„ê\15(êªTÐ/øeW\000\000\000ÖÐÐ–Ð—P\16ÐÍÐÑÑÇPÃP–\17ÐPÑÐÒ\17ÑÑÐQPÑ—‘\17ÒV\17Ð\16ÑPÒÑRÑÐMQPÑÑÐÓV\17Ð\16ÑÐÒÑÒÑÐMQPÑW\17‘Ó\22\17ÐÐÒÐ\3A\2\2\000Ý€\1€\1€\3ÁA\2\000\21\2€\2\14BA\4AB\1\000á\1\r€Æ‚B\000\6ÃB\000FÃ@\000€\3€\1Áƒ\1\000]ƒ€\1GCÁ\6\7C\3\6Ý‚\000\1\24€‚\5\23@\
€ÆÂB\000\6Ã@\000@\3€\1ƒ\1\000\29ƒ€\1\7CA\6MCA\5GCƒ\2ÊB\3\6ÍBA\5‡Á\2\3ÆÂ@\000\000\3\000\3Aƒ\1\000Ý‚€\1€\1€\5ÁB\2\000\21\3\000\3\14CA\6AC\1\000áÂ\4€ÆƒB\000\6ÄB\000FÄ@\000€\4€\1Á„\1\000]„€\1GÄÁ\8\7D\4\8Ýƒ\000\1\24€ƒ\7\23\000\2€ÆÃB\000\6Ä@\000@\4€\1„\1\000\29„€\1\7ÄA\8MDA\7GD\4\3ÊC\4\8à‚ú\127àAò\127\"€\000\000£€ë\127\31\000€\000\1\7\21 -¯Œm\21œê@¢Šs\15\20\9\16I\25ô|€_…È°]Ò;\26{(w3@©Ì\000réU%Ë\2yU\2¶>\12\1\000\000\000\000\000\2\7!\0259&lR£ÊªY\26\23gt\12\000\000\000\4\6\000\000\000”…–—ä\4\
\000\000\000ƒ±­·Œ‹“ä\4\r\000\000\000–ˆ…¶—‘ˆä\4\9\000\000\000—–·”ˆä\4\3\000\000\000¤¤ä\3\000\000\000\000\000\000ð?\4\2\000\000\000Èä\3\000\000\000\000\000\000\000@\4\2\000\000\000Çä\3\000\000\000\000\000\000\000\000\4\9\000\000\000‹Š‘‰†–ä\4\3\000\000\000»£ä\000\000\000\000\19pi\23ÃL9}\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 _@ÿ\" ÛÂ2Ø'Êah×•\27ÿ7Û\16\23’WRÀi\24gRv¡\1‘Ê+.`\
\9\20 \5àøRÕ[r`îÒÑ\11ý\12t\0253\8t\25òÌui¤c]\23©f\26Œ\rv\25\18\9v\0252\18s\19«FD=)Ù½ fí\17'IÌV\rJ\"NE‡ÌP]Û\30Ü:ÙbíwØ÷\r.\1,\8\6 QÕ¦\01178\rQâ¬m\"*ýpmŸ\15£l\1\
\8\8 AÈ?`y»S­{V4\0187Íž%]YpQØ9í@Ÿ\000\000\000ë­í­-­­­ð-­¬µím­ºíª-æ­­­çmí,+­ì­m­­­0­¬¬º­­-ç-,¯\15-­­Ž¬RÒçíì-*-m­k-l­x­-¬´--¬º-¬-+mì­l­¯­«,l­¸¬­¯{­,¬¬ì¯­0í-¬+íí­*-ï¬k-l­ª,m­j­,¬­¬-­0í-¬º-³-ë­í­-­­­ð-­¬µmo­º­½€E\000\000\1À\000\000Á\000\3\000&\1\000\000]€\000\000…\000€\1Á@\2\000\1Á\2\000AA\3\000¦\1\000\000€\000\000Å\000€\1\1\3\000A\1\3\000Á\3\000æ\1\000\000Ý€\000\000\5\1€\1A\1\4\000\1\3\000ÁA\4\000&\2\000\000\29\000\000E\1€\1\4\000ÁÁ\2\000\1Â\4\000f\2\000\000]\000\000…\1€\1Á\1\5\000\1Â\2\000AB\5\000¦\2\000\000\000\000ËÁ\1\000ÊAA€ÊA\000‹Ê€‹ÊÁ\000ŒÊ\1ŒÊ\1ÊA\24ÀÄ\2\23@\000€Ê\1GÊ\1Ç\6‚Á\000\21\2\000\4\25\000\000\4\23€\1€\6ÂA\000A\2\2\000†‚Á\000•\2\000\5V‚‚\4B\2\000\29B€\1\6B@\000\7‚B\4F‚Á\000G\2€\4€\2€\3\29B€\1\23\000\r€F\000@\000€\000\000\000]€\000\1\24\000Ã\000\23À\11€E\000€\1À\000\000ÁÀ\2\000\1A\3\000f\1\000\000]€\000\000…\000€\1Á@\2\000\1\1\3\000AÁ\3\000¦\1\000\000€\000\000Å\000€\1\1\3\000A\1\3\000A\4\000æ\1\000\000Ý€\000\000\5\1€\1A\1\4\000Á\2\000ÁÁ\4\000&\2\000\000\29\000\000E\1€\1\4\000ÁÁ\2\000\1B\5\000f\2\000\000]\000\000‹Á\1\000ŠAA€Š\1\000‹ŠA€‹Š\000ŒŠÁ€ŒŠA\1Š\1\24ÀD\2\23@\000€Š\1GŠ\1ÇÆA@\000ÇÂ\3\6‚Á\000\7Â@\4@\2\000\3ÝA€\1\31\000€\000\5\7\21 L,B]\12ö5d\27Þ{µÐ¥:#Ÿœ~X\3XKçâ\24N\11\8\16I\25Ü\21lNÐ*u\24²7IËþc1Õœ{RóÐ\19\4¥aQ)­”‰\000µ¢¾s\4\000\000\000\000\000\1\1\000\2\000\1\000\7!\25åÌ–Q\29\000\000\000\4\5\000\000\000\20\25\16\5`\4\6\000\000\000\20\1\2\12\5`\4\4\000\000\000\14\21\r`\3\000\000\000\000\000\000ð?\4\6\000\000\000\16\1\9\18\19`\4\6\000\000\000,\1\2\5\12`\4\6\000\000\000\16\1\7\5\19`\4\6\000\000\000\5\18\18\15\18`\0044\000\000\000ˆÏ×…üÈ†üé†õè‰ÁÕ†õÐ…æå†ïò…åÅL…Ýó…éí5)†üà…ÄÇ‰ÁÕ†õÐ†øÏ`\3\000\000\000\000\000\000\000@\4\7\000\000\000\9\14\19\5\18\20`\4\7\000\000\000\14\21\r\2\5\18`\4\7\000\000\000\19\20\18\9\14\7`\3\000\000\000\000\000\000.@\3\000\000\000\000\000\000\8@\4\5\000\000\000\12\5\6\20`\3\000\000\000\000\000\000\16@\4\8\000\000\000PLPLRUU`\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000ð¿\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000\000\000\4\5\000\000\000\20\5\24\20`\4\5\000\000\000\19\9\26\5`\4\6\000\000\000\1\12\9\7\14`\4\6\000\000\000\3\15\12\15\18`\4\7\000\000\000\14\15\23\18\1\16`\4\6\000\000\000\23\9\4\20\8`\000\000\000\000\000\16pi\23 4i\"„Ü9>\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 ëè¬b»‡\127<[`Á\4†™Þ\31\15}S|•ÄZ\0049GÏ\29tv:¥„={u\
\9\20 6>\23A‹Ko»Gª<'\rt\0255\8t\25sW\14\8ç1¯\8=Öª'o³ëU¾Œ(Ö\rv\25\17\9v\0251\25°5\\\4ö\28¼x’\3ú<ý=€\31 \9ÎÅmyš¥©\21ÔÚðt‡+ËA\1*\8\6 ¿ÃWB³J~¡8Ðo\1\14\8\8 Q0žz7ý*t~¤K\21Æ¦\0315Üho¼˜5oÔ~V4\18ý#^£2”Tù F\23q{fŠdC]6÷ð>Ã\000\000\000’Ô”ÔTÔÔÔ‰TÔÕÌ”\20ÔÃTÜTŸÔÔÔž\20”URÔ•Ô\20ÔÔÔIÔÕÕÃÔÔTžTUÖvTÔÔ÷Õ+«ž”•TST\20Ô\18T\21Ô\1ÔTÕÍTTÕÃTÕTR\20•Ô\21ÔÖÔÒU\21ÔÁÕÔÖ\2ÔUÕÕ•ÖÔI”TÕR””ÔST–Õ\18T\21ÔÓU\20Ô\19ÔUÕÔÕTÔI”TÕR\20–ÔSÔ—Õ\19”\23ÔÓU\23Ô^ÔUÕÃ”òT’Ô”ÔTÔÔÔ‰TÔÕÌ\20\23ÔÃ\20ÇT‘ÔÔÕU\20ÔÔ\21ÔÐÔòÕÔ\000]€\000\000…\000\000\1Á@\2\000\1\1\4\000f\1\000\000€\000\000Å\000€\1\1A\4\000A\1\4\000\4\000æ\1\000\000Ý€\000\000\5\1€\1AÁ\4\000Á\3\000Á\1\5\000&\2\000\000\29\000\000E\1€\1A\5\000ÁÁ\3\000\1‚\5\000f\2\000\000]\000\000…\1€\1ÁÁ\5\000\1\2\4\000A\2\6\000¦\2\000\000\000\000Å\1€\1\1B\6\000AÂ\3\000Â\000\000æ\2\000\000Ý\000\000\11\2\2\000\
B€†\
BA€\
‚\000‡\
Â\000\
‚\
Â\1Ž\
\2Ž\
B\1\24\000E\2\23@\000€\
ÂG\
ÂÇŽ\24\000F\3\23@\000€\
ÂÇ\
ÂGŽF‚Á\000U\2€\4\25\000€\4\23€\1€FÂA\000\2\2\000Æ‚Á\000Õ\2€\5–Â\2\5ÁB\2\000]B€\1FB@\000G‚Â\4†‚Á\000‡\2\000\5À\2\000\4]B€\1FÂB\000G\2Ã\4‡BC\4Ç‚C\4JÂ\2\5\23\000\17€F\000@\000€\000\000\000]€\000\1\24\000Ä\000\23À\15€@\000\000\000…\000\000\1ÁÀ\000\000\1\1\4\000f\1\000\000€\000\000Å\000€\1\1A\2\000A\1\4\000\4\000æ\1\000\000Ý€\000\000\5\1€\1AA\4\000Á\3\000Á\1\5\000&\2\000\000\29\000\000E\1€\1Á\4\000ÁÁ\3\000\1‚\5\000f\2\000\000]\000\000…\1€\1ÁA\5\000\1\2\4\000A\2\6\000¦\2\000\000\000\000Å\1€\1\1Â\5\000AÂ\3\000Â\000\000æ\2\000\000Ý\000\000\11\2\2\000\
B€†\
BA€\
‚\000‡\
Â\000\
‚\
Â\1Ž\
\2Ž\
B\1\24\000E\2\23@\000€\
ÂG\
ÂÇŽ\24\000F\3\23@\000€\
ÂÇ\
ÂGŽFB@\000G‚Â\4†‚Á\000‡Â@\5À\2\000\4]B€\1FÂB\000G\2Ã\4‡BC\4Ç‚C\4JÂ\2\5\31\000€\000\11\7\21 IñÓ\5›™k;\17H+r¥õÉ\"W\18þ>\11…(0&\21ê+%Øk8¥*ÒE\12\4\16I\25¬\0037zë\2á0¹³xxî¶x;± \4\000\000\000\000\000\1\1\000\2\000\1\6\7!\25@ç\31sÄ8Ü\20|µ@\5\6Ž?( ºD\0048Nvtîx)@ \000\000\000\4\5\000\000\000\1\12\5\16u\4\6\000\000\000\1\20\23\25\16u\4\4\000\000\000\27\000\24u\3\000\000\000\000\000\000ð?\4\6\000\000\000\5\20\28\7\6u\4\11\000\000\000'\20\17\28\0262\7\26\000\5u\4\6\000\000\000\5\20\18\16\6u\4\6\000\000\000\16\7\7\26\7u\0044\000\000\000ÚÂéÝ“éü“àýœÔÀ“àÅóð“úçðÐYÈæüø <“éõÑÒœÔÀ“àÅ“íÚu\3\000\000\000\000\000\000\000@\4\7\000\000\000\28\27\6\16\7\1u\4\
\000\000\000\18\16\1 <&\29\26\2u\4\r\000\000\000\6\28\27\18\25\16'\16\6\000\25\1u\4\3\000\000\000\28\17u\4\5\000\000\000\25\28\6\1u\4\7\000\000\000\27\000\24\23\16\7u\4\7\000\000\000\6\1\7\28\27\18u\3\000\000\000\000\000\000\8@\4\2\000\000\000Eu\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000ð¿\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000\24@\4\1\000\000\000u\3\000\000\000\000\000\000\28@\4\7\000\000\000\6\16\25\16\22\1u\4\7\000\000\000\28\24\20\18\16\6u\4\6\000\000\000\6\22\20\25\16u\4\6\000\000\000\2\28\17\1\29u\4\7\000\000\000\27\26\2\7\20\5u\000\000\000\000\000\22pi\0236r÷R‘«½\20­›ƒ\"§í†9\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 Ê¡d]\24B\23…\17¿\11ûŽ!2™e\19\
Ðtm4‡GÃ)\7Áùd\7Ï©\30\20³{nZ\12\9\20 ÿû­?,MÂ3lBw\18Ìbê^‚/3$n\rt\0251\8t\25eW˜Y\000\12v\25\28\9v\25v…¬Zë=?ZŒ³ÃnrêH'\1#\8\6 \\—Á\3Ã\21{f¾Ñ#n¸ÁéPÃ\11:\7\23\22š\26‚cy5!$|\30œ'Y&~òšg\1\15\8\8 lœÆZ\5:^\17ÁJ‰\rskpy\26íÙ\127_‚ñ*sô¬PÉrV4\18à6$cåKr\30\rÿæ\2ÐøI\11J£\
x#[Õ}F~öe6áIR¯\14™l¸h?\rÆ\000\000\000É‰ÉIÉÉÉ”IÉÈÑ‰\9ÉÞ‰ÎI‚ÉÉÉƒ\9‰HOÉˆÉ\9ÉÉÉTÉÈÈÞÉÉIƒIHËkIÉÉêÈ6¶ƒ‰ˆINI\9É\15I\8É\28ÉIÈÐIIÈÞIÈIO\9ˆÉ\8ÉËÉÏH\8ÉÜÈÉË\31ÉHÈÈˆËÉT‰IÈO‰‰ÉNI‹È\15I\8ÉÎH\9É\14ÉHÈÉÈIÉT‰IÈÞ‰áIÉ‰ÉIÉÉÉ”IÉÈÑ\9\11ÉÞ\9ÝIŒÉÉÈH\9ÉÉ\8ÉÊÉïÈÉÉ”IÉÉLÉÉÈ\8‰ËÉÈÈÊÉ¯ÈÉÉTI\000\000Å\000\000\1\1A\3\000A\1\3\000¦\1\000\000Ý€\000\000\5\1€\1A\3\000Á\2\000ÁÁ\3\000&\2\000\000\29\000\000E\1€\1\1\4\000Á\1\3\000\1B\4\000f\2\000\000]\000\000…\1€\1Á\4\000\1\2\3\000AÂ\4\000¦\2\000\000\000\000Å\1€\1\1\2\5\000A\2\3\000B\5\000æ\2\000\000Ý\000\000\5\2€\1A‚\5\000Â\2\000ÁÂ\5\000&\3\000\000\29‚\000\000E\2€\1\2\6\000ÁÂ\2\000\1C\6\000f\3\000\000]‚\000\000‹‚\2\000ŠB\000ŠBA€Š‚€ŠÂ\000ŽŠÂŽŠ\2\1ŠBŠ‚\1ŠB‚Š\2\2‘\24ÀE\4\23@\000€ŠÂÈŠÂH‘Æ‚Á\000Õ\2€\5\25\000€\5\23€\1€ÆÂA\000\1\3\2\000FƒÁ\000U\3€\6\22C\3\6AC\2\000ÝB€\1ÆB@\000Ç‚Â\5\6ƒÁ\000\7\3\000\6@\3\000\5ÝB€\1\23\000\18€F\000@\000€\000\000\000]€\000\1\24\000Ã\000\23À\16€@\000\000\000…\000\000\1ÁÀ\000\000\1\1\3\000f\1\000\000€\000\000Å\000\000\1\1A\2\000A\1\3\000¦\1\000\000Ý€\000\000\5\1€\1AA\3\000Á\2\000ÁÁ\3\000&\2\000\000\29\000\000E\1€\1\3\000Á\1\3\000\1B\4\000f\2\000\000]\000\000…\1€\1Á\1\4\000\1\2\3\000AÂ\4\000¦\2\000\000\000\000Å\1€\1\1‚\4\000A\2\3\000B\5\000æ\2\000\000Ý\000\000\5\2€\1A\2\5\000Â\2\000ÁÂ\5\000&\3\000\000\29‚\000\000E\2€\1‚\5\000ÁÂ\2\000\1C\6\000f\3\000\000]‚\000\000‹‚\2\000ŠB\000ŠBA€Š‚€ŠÂ\000ŽŠÂŽŠ\2\1ŠBŠ‚\1ŠB‚Š\2\2‘\24ÀE\4\23@\000€ŠÂÈŠÂH‘ÆB@\000Ç‚Â\5\6ƒÁ\000\7Ã@\6@\3\000\5ÝB€\1\31\000€\000\4\7\21 \11¦Zp{~ºsƒÖf\29ÄgDA?Šôzšì\0008\14\000\16I\25`®p\25\4\000\000\000\000\000\1\1\000\2\000\1\8\7!\25Ä½X^\0268\000B£° 9Ê÷¶oÜ‚‰O\22\28‘2ääo;\5{zŠ\16>\3$\000\000\000\4\5\000\000\000.#*?Z\4\6\000\000\000.;86?Z\4\4\000\000\0004/7Z\3\000\000\000\000\000\000ð?\4\6\000\000\000*;3()Z\4\5\000\000\000\31>3.Z\4\6\000\000\000*;=?)Z\4\6\000\000\000?((5(Z\0044\000\000\000²õí¿Æò¼ÆÓ¼ÏÒ³ûï¼Ïê¿Üß¼ÕÈ¿ßÿv¿çÉ¿Ó×\15\19¼ÆÚ¿þý³ûï¼Ïê¼ÂõZ\3\000\000\000\000\000\000\000@\4\7\000\000\00034)?(.Z\4\7\000\000\0004/78?(Z\4\7\000\000\000).(34=Z\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000.@\3\000\000\000\000\000\000\20@\4\5\000\000\0006?<.Z\3\000\000\000\000\000\000\24@\4\8\000\000\000jvjvhooZ\3\000\000\000\000\000\000\28@\4\8\000\000\000>?<;/6.Z\3\000\000\000\000\000\000 @\3\000\000\000\000\000\000ð¿\3\000\000\000\000\000\000\"@\3\000\000\000\000\000\000\000\000\4\3\000\000\0003>Z\4\7\000\000\000*(57*.Z\4\5\000\000\000.?\".Z\4\7\000\000\00018.#*?Z\4\5\000\000\000)3 ?Z\4\6\000\000\000;63=4Z\4\6\000\000\0009565(Z\4\7\000\000\00045-(;*Z\4\6\000\000\000-3>.2Z\000\000\000\000\000\24pi\23ÆÔ.YjGbfã\25‹MÔÓ\21\\:@¬q-½•E÷.ëY€¾¢Wcžß\23¦=„F\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 ¶±)\28\11\\\6\28Ô\7¼iÆ+ý_Ï\14d/”Æ¸?K\11\9\20 Ý×\5á/¤%‚\rt\0253\8t\25þôX\7&Q¼^98ímG\12v\25\28\9v\25œú‡\3wF_Q\
Q(-\1œM\1,\8\6 Îo\\:Ê®“H4|NI\8$\19%3‹eK\1\r\8\8 éiÞ\127?ÛW\25øþŒ\2‘ÚT\31Æ}ë\0234yV4\18š…§\1\3\1\000\000r4t4´444i´45,tô4#4:´\127444~ôtµ²4u4ô444©455#44´~´µ6–´44\0235ËK~tu´²´u4óôõ45564©´´5¡445ò´u43uö4u564é´´5á4´5lô45#ô4´²´v4õô645574©t´5²tw4³´w5óôõ43uö4¾4µ5²´u4óôõ45564©´´5³ôt5~´´·³´ô4òô÷4á4´5-´´5#´5´²´v4õ4042õ÷4!546â4µ55574©t´5²tt4³tp5òô÷43µô4ó4µ545´4©t´5#ô\4´r4t4´444i´4\1\24€Ä\000\23\000\25€E\000\000\1À\000\000ÁÀ\4\000&\1\000\000]€\000\000…\000\000\1Á\000\3\000\1Á\4\000f\1\000\000€\000\000Å\000€\1\1\1\5\000AÁ\4\000A\5\000æ\1\000\000Ý€\000\000\5\1€\1A\5\000\4\000ÁÁ\5\000&\2\000\000\29\000\000E\1€\1\1\6\000Á\4\000\1B\6\000f\2\000\000]\000\000…\1€\1Á\6\000\1Â\4\000AÂ\6\000¦\2\000\000\000\000Å\1€\1\1\2\7\000A‚\4\000Â\000\000æ\2\000\000Ý\000\000\6‚A\000@\2€\000\2\2\000\29‚€\1\21\2\000\4F‚A\000€\2\000\1Á\2\2\000]‚€\1U\2€\4X@\2\4\23À\000€\6‚B\000AÂ\2\000\2\3\000\29B€\1\11\2\2\000F‚A\000€\2€\000Á\2\2\000]‚€\1GÂÀ\4\
B‚ƒ\
BA€\
‚€„\
Â€Ž\
‚\1\
Â\
\2\1\
B\24ÀE\2\23@\000€\
‚È\
‚HFÂH\000\24ÀÆ\4\23@\000€\
‚H\
‚ÈFÂÃ\000U\2€\4\25\000€\4\23€\1€F‚B\000\2\4\000ÆÂÃ\000Õ\2€\5–Â\2\5Á\2\3\000]B€\1FB@\000GBÄ\4†ÂÃ\000‡\2\000\5À\2\000\4]B€\1FBC\000G‚Ã\4‡BB\4J‚‚\000\23@\22€F\000@\000€\000\000\000]€\000\1\24ÀÄ\000\23\000\21€@\000\000\000…\000\000\1ÁÀ\000\000\1Á\4\000f\1\000\000€\000\000Å\000€\1\1\1\3\000AÁ\4\000A\5\000æ\1\000\000Ý€\000\000\5\1€\1A\1\5\000\4\000ÁÁ\5\000&\2\000\000\29\000\000E\1€\1\5\000Á\4\000\1B\6\000f\2\000\000]\000\000…\1€\1Á\1\6\000\1Â\4\000AÂ\6\000¦\2\000\000\000\000Å\1€\1\1‚\6\000A‚\4\000Â\000\000æ\2\000\000Ý\000\000\6‚A\000@\2€\000\2\2\000\29‚€\1\21\2\000\4F‚A\000€\2\000\1Á\2\2\000]‚€\1U\2€\4X@\2\4\23À\000€\6‚B\000AÂ\2\000\2\3\000\29B€\1\11\2\2\000F‚A\000€\2€\000Á\2\2\000]‚€\1GÂÀ\4\
B‚ƒ\
BA€\
‚€„\
Â€Ž\
‚\1\
Â\
\2\1\
B\24ÀE\2\23@\000€\
‚È\
‚HFÂH\000\24ÀÆ\4\23@\000€\
‚H\
‚ÈFB@\000GBÄ\4†ÂÃ\000‡Â@\5À\2\000\4]B€\1FBC\000G‚Ã\4‡BB\4J‚‚\000\31\000€\000\5\7\21 lE¿j.L`AùüA\22ß£\\\"»)8GÚ,æ;Èáv>\12\5\16I\25\000~¢\26\1\26d,@%jhœx*\30\4\000\000\000\000\000\1\1\000\2\000\1\3\7!\25’/»\16ÉyÆk$\000\000\000\4\5\000\000\000?2;.K\4\6\000\000\000?*)'.K\4\4\000\000\000%>&K\3\000\000\000\000\000\000ð?\4\6\000\000\000;*\"98K\4\14\000\000\000\8#.( \9$3\0129$>;K\4\9\000\000\0008?9\24;'\"?K\4\3\000\000\000\"/K\4\2\000\000\000gK\4\5\000\000\000'\"8?K\4\6\000\000\000.99$9K\4<\000\000\000h®ÄÓ¢ÌÄ¢ßÒ£ääA£äü¬êå£åï®ïÑ¢ËÂ­êÍ¬ÑÏ®ÄÓ¢ÌÄ¯óÅ¢ËÂ¢êò¢ÌÄ¬Ðó®ÛÇK\3\000\000\000\000\000\000\000@\4\
\000\000\000,.?\30\2\24#$<K\4\12\000\000\000&>?\"'\25.8>'?K\4\6\000\000\000;*,.8K\0044\000\000\000£äü®×ã­×Â­ÞÃ¢êþ­Þû®ÍÎ­ÄÙ®Îîg®öØ®ÂÆ\30\2­×Ë®ïì¢êþ­Þû­ÓäK\4\7\000\000\000\"%8.9?K\4\7\000\000\000%>&).9K\4\7\000\000\0008?9\"%,K\3\000\000\000\000\000\000\8@\4\2\000\000\000{K\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000ð¿\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000\24@\4\1\000\000\000K\3\000\000\000\000\000\000\28@\4\7\000\000\0008.'.(?K\4\7\000\000\000\"&*,.8K\4\6\000\000\0008(*'.K\4\6\000\000\000<\"/?#K\4\7\000\000\000%$<9*;K\000\4\6\000\000\000'\"8?yK\000\000\000\000\20pi\23`Ÿ\23K“(Z4þ„ˆ!hÃ*pÆ³¿\127Äž#}\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 û¿ß$=\14\9\20 \"žÕ9\30Õî3¸Û\8~žG\31m}§e\21\20rx_’\24ì\
Ü\rt\0252\8t\25ÆœMI«ÒGN«\12v\25\16\9v\25Œ+:Q¬$¾p\1ø\\`¾¨‘\18ïõ³ ÒÆ’+yÃ„&\25ê˜$\1!\8\6 â½–\25\2x']x\31Ïbúý W\\îÃ\4bÇ [\000Ã¹ “ÀL}\1\
\8\8 ¶×Ê\1#Åöd6|V4\18Ü ÿb\30mu'RT\31Kð\18xBŸ\000\000\000p6v6¶666k¶67.vö6!¶>¶}666|öv·°6w6ö666«677!66¶|¶·4”¶66\0217ÉI|vw¶±¶ö6ð¶÷6ã6¶7/¶¶7!¶7¶°öw6÷6460·÷6#764à6·77w46«v¶7°vv6±¶t7ð¶÷61·ö6ñ6·767¶6«v¶7°öt6±6u7ñvõ61·õ6¼6·7!v+€F\000@\000€\000\000\000]€\000\1\24ÀÃ\000\23@\15€E\000\000\1À\000\000Á\000\4\000&\1\000\000]€\000\000…\000\000\1Á@\2\000\1\1\4\000f\1\000\000€\000\000Å\000€\1\1A\4\000A\1\4\000\4\000æ\1\000\000Ý€\000\000\5\1€\1AÁ\4\000Á\3\000Á\1\5\000&\2\000\000\29\000\000E\1€\1A\5\000ÁÁ\3\000\1‚\5\000f\2\000\000]\000\000‹\1\000ŠA€†ŠAA€Š\000‡ŠÁ€‹ŠA\1ŒŠ\1Œ\24\000E\2\23@\000€ŠFŒŠÆŒÆÁ\000Õ\1€\3\25\000€\3\23€\1€ÆÁA\000\1\2\2\000F‚Á\000U\2€\4\22B\2\4AB\2\000ÝA€\1ÆA@\000ÇÂ\3\6‚Á\000\7\2\000\4@\2\000\3ÝA€\1ÆÁB\000Ç\1Ã\3\7BC\3G‚C\3ÊA\2\4\23€\12€F\000@\000€\000\000\000]€\000\1\24\000Ä\000\23@\11€@\000\000\000…\000\000\1ÁÀ\000\000\1\1\4\000f\1\000\000€\000\000Å\000€\1\1A\2\000A\1\4\000\4\000æ\1\000\000Ý€\000\000\5\1€\1AA\4\000Á\3\000Á\1\5\000&\2\000\000\29\000\000E\1€\1Á\4\000ÁÁ\3\000\1‚\5\000f\2\000\000]\000\000‹\1\000ŠA€†ŠAA€Š\000‡ŠÁ€‹ŠA\1ŒŠ\1Œ\24\000E\2\23@\000€ŠFŒŠÆŒÆA@\000ÇÂ\3\6‚Á\000\7Â@\4@\2\000\3ÝA€\1ÆÁB\000Ç\1Ã\3\7BC\3G‚C\3ÊA\2\4\31\000€\000\
\7\21 iêú|·¯Å\11\\X©\000úüWqCÛÿ\\\8}gqûô´Q\2„‘o\
\3\16I\25Í»G}{G\22\22\4\000\000\000\000\000\1\1\000\2\000\1\8\7!\25(UJl]\5­/\18ÕÛ\19 t\25OW\3N\7oÃŸ\24\3<º*WÆ\7(\2„ì\21\27\000\000\000\4\5\000\000\000IDMX=\4\6\000\000\000I\\_QX=\4\4\000\000\000SHP=\3\000\000\000\000\000\000ð?\4\6\000\000\000M\\TON=\4\9\000\000\000~RP_R\127RE=\4\6\000\000\000M\\ZXN=\4\6\000\000\000XOORO=\0044\000\000\000Õ’ŠØ¡•Û¡´Û¨µÔœˆÛ¨Ø»¸Û²¯Ø¸˜\17Ø€®Ø´°htÛ¡½Ø™šÔœˆÛ¨Û¥’=\3\000\000\000\000\000\000\000@\4\7\000\000\000TSNXOI=\4\
\000\000\000ZXIhtnURJ=\4\r\000\000\000NTSZQXoXNHQI=\4\3\000\000\000TY=\4\5\000\000\000QTNI=\4\7\000\000\000SHP_XO=\4\7\000\000\000NIOTSZ=\3\000\000\000\000\000\000\8@\4\2\000\000\000\r=\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000ð¿\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\4\7\000\000\000NXQX^I=\4\7\000\000\000SRJO\\M=\4\6\000\000\000JTYIU=\000\000\000\000\000\17pi\23\ržÒ)%Iãzàèe\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 î{pÙ’Ÿ\9H\127(/\15\1:*Ùž\r{n\16\19VE¿”w”\8\9\20 Ä°l%\5\14t\0256\8t\25wÂâ\29^µMU°£\"\11ø‡Å\23Q\9\4-oû@õ\12v\25\28\9v\25ðåÓa¸0ÙnçŸiUÁÓ 0\1.\8\6 þÔb!SÁ._M'v=¤d\26dEL³_®´K_ÑÒŽ!\1\14\8\8 œDÇOªe.+ãS‡\28¬E\1z„\4<&RdšrýpV4\18bâ,'µµ\2\23vJ´HÚ¤\15E\19kPl&îÖSÒ,Õ\\etT\25ä\000\000\000»ý½ý}ýýý }ýüå½=ýê=÷}¶ýýý·=½|{ý¼ý=ýýý`ýüüêýý}·}|ÿ_}ýýÞü\2‚·½¼}{}¼ýz=¼ü;ý¿ýú¼?ý¼|ÿýz<?ýë|üÿwý|ü{½¾ý:ý>ýü|þý`}}üz=½ü·}ý{z}=ý;=>ý(ý}üä}}üê}ü}{ý¹ý<½ùýû<>ýèüýÿ+ý|üü|ùý`½}ü{½½ýz=¹ü;=>ýú|=ý:ý|üýü}ý`½}üê½Ñ}»ý½ý}ýýý }ýüåý8ýê=ë}¸ýýü|=ýý<½øý&\1\000\000]€\000\000…\000\000\1Á€\4\000\1A\5\000f\1\000\000€\000\000Å\000\000\1\1\5\000AA\5\000¦\1\000\000Ý€\000\000\5\1\000\1AÁ\5\000A\5\000æ\1\000\000\29\000\000E\1€\1\1\6\000ÁA\5\000\1B\6\000f\2\000\000]\000\000…\1€\1Á\6\000\1\2\5\000AÂ\6\000¦\2\000\000\000\000Å\1€\1\1\2\7\000A\2\5\000B\7\000æ\2\000\000Ý\000\000\6BC\000@\2€\000‚\3\000\29‚€\1\21\2\000\4X€D\4\23À\000€\6\2D\000A‚\7\000‚\4\000\29B€\1\11\2\2\000FBC\000€\2€\000Á‚\3\000]‚€\1GÂÀ\4\
B\2†\
BA€\
‚€„\
\2\
Â\1\
B\
Â€…\
‚\1‘\24ÀF\3\23@\000€\
ÂH\
ÂH‘FÂÃ\000U\2€\4\25\000€\4\23€\1€F\2D\000B\4\000ÆÂÃ\000Õ\2€\5–Â\2\5Á‚\4\000]B€\1FB@\000GÂÄ\4†ÂÃ\000‡\2\000\5À\2\000\4]B€\1F‚A\000GÂÁ\4‡BB\4Á‚\2\000\7ÃB\4–\2\3\5J‚‚\000\23\000\20€F\000@\000€\000\000\000]€\000\1\24@Å\000\23À\18€@\000\000\000…\000\000\1ÁÀ\000\000\1A\5\000f\1\000\000€\000\000Å\000\000\1\1\4\000AA\5\000¦\1\000\000Ý€\000\000\5\1\000\1A\5\000A\5\000æ\1\000\000\29\000\000E\1€\1Á\5\000ÁA\5\000\1B\6\000f\2\000\000]\000\000…\1€\1Á\1\6\000\1\2\5\000AÂ\6\000¦\2\000\000\000\000Å\1€\1\1‚\6\000A\2\5\000B\7\000æ\2\000\000Ý\000\000\6BC\000@\2€\000‚\3\000\29‚€\1\21\2\000\4X€D\4\23À\000€\6\2D\000A‚\7\000‚\4\000\29B€\1\11\2\2\000FBC\000€\2€\000Á‚\3\000]‚€\1GÂÀ\4\
B\2†\
BA€\
‚€„\
\2\
Â\1\
B\
Â€…\
‚\1‘\24ÀF\3\23@\000€\
ÂH\
ÂH‘FB@\000GÂÄ\4†ÂÃ\000‡Â@\5À\2\000\4]B€\1F‚A\000GÂÁ\4‡BB\4Á‚\2\000\7ÃB\4–\2\3\5J‚‚\000\31\000€\000\5\7\21 Gäæ(UZ({`Ž«\3.„P~\22.I+(w“4-Y³\31\r\5\16I\25už\9rÑ½Í\3®;+j$SUQ\4\000\000\000\000\000\1\1\000\2\000\1\000\7!\25I\16ŠW$\000\000\000\4\5\000\000\000àíäñ”\4\6\000\000\000àõöøñ”\4\4\000\000\000úáù”\3\000\000\000\000\000\000ð?\4\6\000\000\000äõýæç”\4\9\000\000\000×ûùöûÖûì”\4\
\000\000\000óñàÁÝÇüûã”\4\r\000\000\000æñøõàñÆñçáøà”\4\5\000\000\000úõùñ”\4\5\000\000\000øýçà”\4\3\000\000\000ÔÔ”\4\5\000\000\000ðõàõ”\4\3\000\000\000ýð”\4\9\000\000\000çàæÇäøýà”\4\2\000\000\000¸”\4\6\000\000\000äõóñç”\4\6\000\000\000ñææûæ”\0044\000\000\000|;#q\8<r\8\29r\1\28}5!r\1$q\18\17r\27\6q\0171¸q)\7q\29\25ÁÝr\8\20q03}5!r\1$r\12;”\3\000\000\000\000\000\000\000@\4\7\000\000\000ýúçñæà”\4\7\000\000\000úáùöñæ”\4\7\000\000\000çàæýúó”\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\4\2\000\000\000¤”\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000ð¿\3\000\000\000\000\000\000\28@\3\000\000\000\000\000\000\000\000\4X\000\000\000·q\27\12}\19\27}\000\r|;;ž|;#s5:|:0|\21\000q\30<r5\18r\8\29p,0p,>q\27\12}\19\27¸q\0272q0\2p,\20p,>q\27\12}\19\27p,.q\17'|\21\000r5\18s\14\16q\27\12}\19\27”\4\7\000\000\000çûáæ÷ñ”\4\7\000\000\000úûãæõä”\4\7\000\000\000çñøñ÷à”\4\6\000\000\000ãýðàü”\000\000\000\000\000\23pi\23MöŠP-d\17tlÝ\29\27ÑúÆv\127È«f\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 3&\\e\23DA\28@5vÅü\1r½Ïöe©BK\4eÎj`Å5T\"­\15\9\20 ke¾\rìaevX¢˜\15\4\11Á9EìÎR\22Ø–bZ\14t\0258\8t\25‚Ô i¾d41ßüV\14ŒZ14Z|7\19_:Ó<[Éýx*ZQ\2.\15v\25\25\9v\25±\14=\24\1#\8\6 \7\24³+ÌjÁ\rC¿b\23:>\15\17ã®NO_ÿ—\rÿ:\17\3¡~E5\8Bã\17d\9|c\1\11\8\8 ñ\r`\rh>Ù\12Ñ\25Xe\23{V4\18Õ$\25\31#\\”V×¸\8\127†\000\000\000Q\23W\23—\23\23\23J—\23\22\15W×\23\000W\16—\\\23\23\23]×W–‘\23V\23×\23\23\23Š\23\22\22\000\23\23—]—–\21µ—\23\0234\22èh]WV——×\23Ñ—Ö\23Â\23—\22\14——\22\000—\22—‘×V\23Ö\23\21\23\17–Ö\23\2\22\23\21Á\23–\22\22V\21\23ŠW—\22‘WW\23—U\22Ñ—Ö\23\16–×\23Ð\23–\22\23\22—\23ŠW€\1\23@\24€F\000@\000€\000\000\000]€\000\1\24ÀÂ\000\23À\12€E\000\000\1À\000\000Á\000\3\000&\1\000\000]€\000\000…\000\000\1Á@\2\000\1\1\3\000f\1\000\000€\000\000Å\000€\1\1A\3\000AÁ\2\000\3\000æ\1\000\000Ý€\000\000\5\1€\1AÁ\3\000Á\2\000Á\1\4\000&\2\000\000\29\000\000K\1\000JA€ˆJAA€J\000‰†\1E\000J‰J\1ŠJÁ\000‹\24€Ã\1\23@\000€JÁÅŠJÁE‹†Á\000•\1\000\3\25\000\000\3\23€\1€†ÁA\000Á\1\2\000\6‚Á\000\21\2\000\4Ö\1‚\3\1B\2\000A€\1†A@\000‡B\3ÆÁ\000Ç\1€\3\000\2€\2A€\1\23\000\
€F\000@\000€\000\000\000]€\000\1\24\000Ã\000\23À\8€@\000\000\000…\000\000\1ÁÀ\000\000\1\1\3\000f\1\000\000€\000\000Å\000€\1\1A\2\000AÁ\2\000\3\000æ\1\000\000Ý€\000\000\5\1€\1AA\3\000Á\2\000Á\1\4\000&\2\000\000\29\000\000K\1\000JA€ˆJAA€J\000‰†\1E\000J‰J\1ŠJÁ\000‹\24€Ã\1\23@\000€JÁÅŠJÁE‹†A@\000‡B\3ÆÁ\000ÇÁÀ\3\000\2€\2A€\1\31\000€\000\4\7\21 ¦05@•\29=0îÿ·\"2‹ftï™tCM:‹_\9\000\16I\25\26ôÅE\4\000\000\000\000\000\1\1\000\2\000\1\11\7!\25?c¡\5\21Î\12oS\15\8\24\11Îb\19Xo\6M\23)î|±b¸Œ\7\20ˆ(,ûö\23\24\000\000\000\4\5\000\000\000ÙÔÝÈ­\4\6\000\000\000ÙÌÏÁÈ­\4\4\000\000\000ÃØÀ­\3\000\000\000\000\000\000ð?\4\6\000\000\000ÝÌÄßÞ­\4\9\000\000\000îÂÀÏÂïÂÕ­\4\6\000\000\000ÝÌÊÈÞ­\4\6\000\000\000ÈßßÂß­\0044\000\000\000E\2\26H1\5K1$K8%D\12\24K8\29H+(K\"?H(\8H\16>H$ øäK1-H\9\
D\12\24K8\29K5\2­\3\000\000\000\000\000\000\000@\4\7\000\000\000ÄÃÞÈßÙ­\4\7\000\000\000ÃØÀÏÈß­\4\7\000\000\000ÞÙßÄÃÊ­\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000ð¿\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\000\000\4\3\000\000\000ÄÉ­\4\11\000\000\000ÉÌÙÌþÂØßÎÈ­\4\7\000\000\000ÞÈÁÈÎÙ­\4\4\000\000\000ÞÈÁ­\4\7\000\000\000ÃÂÚßÌÝ­\4\6\000\000\000ÚÄÉÙÅ­\000\000\000\000\000\23pi\23ñ‘¤\15õ¯o²ÜJ3YÐ}\28ÇÉèT\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 .,€LQr{\28‡œ’<¯N·YÍ©ëMºø„\3R\14\9\20 å=\8\\fè'¨š¡$ª.\14'6ù–Að\16’P\19.§{‘\14t\0257\8t\25\8\14\16F\31ÏÈ\28\27i\9UÎ¦\1m’Â\14t\14\24Ü\3™Hifs\15v\25\31\9v\25±.{Mþx\23Cƒ \27Fæè\30kÊ¡ \1³ük\20qµ£\19\1 \8\6 \5oç0ùQ6P¨\28Ø'Ò\24Ó~³J»Sø[F|zEÜ\23™ˆH\\TÂ.$\1\1\8\8 C·V\3Š»Åe\19ñ\15\rWåý~zK\27\17\27ÿ\31Sv´Æ\27•´$fé¥!@d}V4\18‚îŠ&¼‹ÚBUû{7g¢i?¬õ\8’\000\000\000\"d$däddd9äde|$¤ds$cä/ddd.¤$åâd%d¤dddùdeesddä.äåfÆäddGe›\27.$%äãä¤d¢ä¥d±däe}ääesäeäâ¤%d¥dfdbå¥dqedf²dåee%fdù$äeâ$$dãä&e¢ä¥dcå¤d£dåedeädù$äes$\127ä\"d$däd\000\000]€\000\1\24ÀÂ\000\23@\14€E\000\000\1À\000\000Á\000\3\000&\1\000\000]€\000\000…\000€\1Á@\2\000\1\1\3\000AA\3\000¦\1\000\000€\000\000Å\000€\1\1\3\000AÁ\2\000Á\000\000æ\1\000\000Ý€\000\000\5\1€\1AÁ\3\000Á\2\000Á\1\4\000&\2\000\000\29\000\000E\1€\1A\4\000ÁÁ\2\000\1‚\4\000f\2\000\000]\000\000‹\1\000ŠAA€ŠA€‰Š\000ŠŠÁ€ŠŠA\1‹Š\1‹\24\000D\2\23@\000€Š\1F‹Š\1Æ‹ÆÁ\000Õ\1€\3\25\000€\3\23€\1€ÆÁA\000\1\2\2\000F‚Á\000U\2€\4\22B\2\4AB\2\000ÝA€\1ÆA@\000ÇÂ\3\6‚Á\000\7\2\000\4@\2\000\3ÝA€\1\23€\11€F\000@\000€\000\000\000]€\000\1\24\000Ã\000\23@\
€@\000\000\000…\000€\1ÁÀ\000\000\1\1\3\000AA\3\000¦\1\000\000€\000\000Å\000€\1\1A\2\000AÁ\2\000Á\000\000æ\1\000\000Ý€\000\000\5\1€\1A\3\000Á\2\000Á\1\4\000&\2\000\000\29\000\000E\1€\1Á\3\000ÁÁ\2\000\1‚\4\000f\2\000\000]\000\000‹\1\000ŠAA€ŠA€‰Š\000ŠŠÁ€ŠŠA\1‹Š\1‹\24\000D\2\23@\000€Š\1F‹Š\1Æ‹ÆA@\000ÇÂ\3\6‚Á\000\7Â@\4@\2\000\3ÝA€\1\31\000€\000\4\7\21 K\9Ckó¨a\29­™>6C×c9ø\23IN¦ët\6\
\11\16I\25Ê0\28MY60ZãO‚]Dvødò¾x68\18±\1fVv!6vÏ9ÂÍvgyG†.\4\000\000\000\000\000\1\1\000\2\000\1\5\7!\25=\25’x”F¦\1\3\16”TÒÍ¶^\25\000\000\000\4\5\000\000\000&+\"7R\4\6\000\000\000&30>7R\4\4\000\000\000<'?R\3\000\000\000\000\000\000ð?\4\6\000\000\000\"3; !R\4\6\000\000\000\27?357R\4\6\000\000\000\"357!R\4\6\000\000\0007  = R\0044\000\000\000ºýå·Îú´ÎÛ´ÇÚ»óç´Çâ·Ô×´ÝÀ·×÷~·ïÁ·Ûß\7\27´ÎÒ·öõ»óç´Çâ´ÊýR\3\000\000\000\000\000\000\000@\4\7\000\000\000;<!7 &R\4\7\000\000\000<'?07 R\4\7\000\000\000!& ;<5R\4\7\000\000\00017<&7 R\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000ð¿\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\000\000\4\4\000\000\000! 1R\4\6\000\000\0003>;5<R\4\6\000\000\000!13>7R\4\7\000\000\000<=% 3\"R\4\6\000\000\000%;6&:R\000\000\000\000\000\21pi\23\11‡idvš·H\000ÛRhÇ\18D'Ì•3\000BõQ\6¿90\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 \27‰Ý!|\25”l‘Y\29\20(;’w(ñ/\0243tÜ=Áï6-µ¶Ýu\15}ö\26R\15\9\20 ÓI&\15ø39aè5µeÅÛKNœ\14\0224›AÄ\4‰\14t\0254\8t\25Ù¬—\127¸ÍQ\26µx†ek9©Oº\15v\25\27\9v\25µUí\28#c\2>Çâ_Q\000/\8\6 ñØ1.ŒRŒF\24\127¶/¥¹u\000§Ûih”˜J\28\1\9\8\8 Ð\22ü_õ}V4\18‘\0063\rr@X*y\4fm0®\000KÝ$Ã8/\000\000\000³õµõtµõõ¨uõôru5õ25µôðôuõ(uõôñôõõ³ô´õst´õ5ôuôh4õ\1JÁ‚\000\1\000\3\24ÀA\2\23€\5€F\1B\000†\1A\000‡AA\3]\1\1\1\23@\000€†BB\000ŠB\2\4b\000\000ãÁþ\127F\1A\000GÂ\2]A€\000F\1A\000GÁÂ\2]A€\000F\1A\000G\1Ã\2]A€\000\24@C\000\23@\2€AÁ\1\000_\1\000\1\23€\1€\24@C\000\23€\000€AA\3\000_\1\000\1\23@\000€FC\000]A€\000\31\000€\000\8\7\21 (â9,ÆZx\30\18*ØJÅðO`aœ<#ß;o_žç_\25jŽ=•´õD\9×/\11\2\16I\25J\
ãa-:“m³º†8\2\000\000\000\000\000\1\1\5\7!\25\30\19Å\27?\r\19\127#'¦#ÄÌ:\28\15\000\000\000\4\8\000\000\000 7#'; 7R\4\3\000\000\000!(R\4\5\000\000\0008!=<R\4\7\000\000\0007<1=67R\4\
\000\000\00057&\7\27\1:=%R\4\7\000\000\000$3>'7!R\4\7\000\000\000!:=%\7\27R\3\000\000\000\000\000\000ð?\4\6\000\000\000\"3; !R\4\3\000\000\000\r\21R\4\7\000\000\000=\"&;=<R\4\8\000\000\000=\"&;=<!R\4\
\000\000\000=\"&;=<\000>&R\3\000\000\000\000\000\000\000\000\4\9\000\000\000>'3\r7*;&R\000\000\000\000\20pi\23¸¿ð?úßÍ0·ÿxGuIktdg=\3H\6¬T\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\22pi\23Þk£px´¬\31Å®†W+º/m\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 ‹+\22\15@×4\8\12&\r§Ô‡\21ê\14\9\20 \17`ÿ_,\16a&põbbE“1EÊÙ5ðË“=‘Úž8ù\14t\0251\8t\25à”…v¤\15v\25\31\9v\25%ï\11\19¶N\15eHL'‹÷9!ŒUS\11Ô\24\11T¡çýv\000#\8\6 \
ÌE\17\27×½{k›€0‚¯¦bG!â ZÁ‹cw‘\4|ÒLø/š˜Àk„·“\9\4\11\8\8 \18‚Íg\"‘ð\28‹\127%…yV4\18íÆ\18W.\000\000\000ƒ„Å…˜D\5…\3ÄÅ…\2\4Å†\24\4\5…E„…†„G……S„\7†ƒ‡Ä…˜\7\5…ÄÇ„…\5‡€\3\22‚\2\4e\2\000\000X€A\000\23@\1€X€Á\000\23À\000€X€A\1\23@\000€\24€Á\1\23€\1€Â\1\000ÁÂ\1\000\14\3B\2Î\000Â\2€\000\000\6@\000€\5\000\000\000\5†BB\000À\2€\3\000\3\000\000@\3€\000€\3\000\1À\3€\1B\000\3†‚B\000À\2€\3B\000\1†ÂB\000Á\2\3\000B\000\1€\2€\4À\2\000\4B\000\1\31\000€\000\8\7\21 8Íy=~¡±\15þc™8\25bÿ3\6ÁjU#S¥KÏ°\14\25–\9·|®Jßl[\6b$\16\4\16I\25P2Ýc©VsVtî\7bk\9›_\20òó\6\1\000\000\000\000\000\000\7!\25²*}\000\r\000\000\000\4\14\000\000\000ž¹‰˜„¹ƒê\4\3\000\000\000…™ê\4\5\000\000\000žƒ‡ê\4\5\000\000\000Äš„ê\4\9\000\000\000Ÿ™˜º‹ž‚ê\4\6\000\000\000Å˜™Åê\000\3\000\000\000\000\000\000\000\000\3\000\000\000\000\000\000ð?\4\9\000\000\000™„‹š™‚…žê\4\17\000\000\000™‹œ£‡‹¾…«†ˆŸ‡ê\4\7\000\000\000‡¹†šê\3\000\000\000\000\000\000I@\1\000\000\000\11\9\20 š¥\29¼tïiì\8\9\20 \\¬\27Bó\14t\0252\8t\25\127¾·2\\Ÿ¨\9Ù\15v\25\31\9v\25—ªk\ró,#¯çUI¾þv6Ù+\15Ä\25\16kxÅ\27X\000+\8\6 \23‰¥x\11i\
\3\1\
\8\8 ô“•\25=aÊ\0202rV4\18ÒôÆ=jüþVXEŸtše\0310»\7d>\5uÅ'-`o(V­ó[Âé´\17EAa*\5\000\000\000t2r2u@À\000…\000€\000]@\000\1\31\000€\000\3\7\21 \30–ÐS\3\9\16I\25!«Žcz5y]ÛO\27g¹UúpnÅ¥\000Š7q0wTq'GVÑ\15\2\000\000\000\000\000\1\8\3\7!\25ï\25\127½Å}%\2\000\000\000\4\3\000\000\000ƒŸì\4\7\000\000\000ž‰ƒš‰ì\000\000\000\000\27pi\23û‚—\2Ú\21‚_Zn¼-8äa\23O?·=`ŠÍ)\
Ù(U¹;¶\20¸Ïl\30\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\24pi\23tC\26S¾D2FÒž·-Êð\r/€.çW\24à\24XmÝä_žÄ·+!\15®xŽˆsC\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 \18\
¡Hæ-`'¤\30Pm”Û\18vªº\16p™#y\8q6‘6Wˆ&kí\19\0318E\r\9\20 ÀMO\0126Ì\127=y9uHg\27ë\14t\0253\8t\25H\5\rI‡³\16a¶ûRHÒ\15v\25\31\9v\25vÑ³\\DE“\9À·‘`Œü=cúÊãd¾J\r~¾\11«\25\1-\8\6 *nJ+ó'Å\15êVƒ]<xës\000\2\8\8 ŽuÓJÑSþi„\0166''™LSBŠ Û˜\\\18\20­k\11\22pïKd!¹)Ôúº\23\1~V4\18\28ˆ\"3gGl %`Vh£;3\20\29C¿h;¬Tw\12\000\000\000\4\1\1\1@\1\1\1€A\1\1æ\000\000\000\29€\000\000K\000\000\000¥\000\000\000À\000\000\1\000\1\000\000Þ\000\000\1ß\000\000\000\31\000€\000\1\7\21 aˆRrûcæW¦\9%T\5\7\16I\25º®óUd\21Ðm«¿¶Rä\28>\1X=•}•\22:0\2\000\000\000\1\2\000\000\7\7!\0251“º4#Œ\r{òè'_µ£ð[J%ZN4s·\127\2\000\000\000\3\000\000\000\000\000\000ð?\4\6\000\000\0001$') E\1\000\000\000\8\9\20 ”¼BpC\1\9\20 úï¡.Ø¿î&øê“H–Érnï\21]kUä?\2Û©¥mñ®57é\14t\0258\8t\25x h$¤ö‰|óÿ²EÄ\15œ?=+ä,þ7o\26ëQ¸(©>£\4Õ\15v\25\28\9v\25k·ªEõc‰g½A0\25DÓ¥X\000,\8\6 \0220‡$\15âu~¨N\20g0yÝ5ñ½\28N\1\9\8\8 Á^—I\rqV4\18™\30†p\16Þ4)ÍÄktˆ4ã[eÂt+¨n\17bzã\24\19Q\15®\14 \15z\6#\000\000\000K\rM\r\r\r\rP\r\12UMÍ\r\26M\r\18\r\r\12\26\r\12K\r\rV\r\r\000\23@\000€F\000€\000_\000\000\1K\000\000\000H@\000\000†€@\000À\000\000\000\000\1\1\23€\1€Å\1\000\1\000\2€\2Ý\000\1\5\2\000\1@\2\000\3\29‚\000\1J\000‚\3¢€\000\000#ý\127†À@\000À\000€\000\6\1A\000@\1\000\000\29\1\000\1ž\000\000\000Ÿ\000\000\000\31\000€\000\3\7\21 D\15aT\
\000\16I\25\\\5‡<\3\000\000\000\000\1\1\1\1\2\000\7!\25ÏpÎn\5\000\000\000\4\5\000\000\0007:3&C\4\6\000\000\0007\"!/&C\4\6\000\000\0003\"*10C\4\r\000\000\0000&7.&7\"7\"!/&C\4\r\000\000\000$&7.&7\"7\"!/&C\000\000\000\000\20pi\23ó¦ÁD;(y4ú§³(°èñ]\127û\30\r¶LÉ\18\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\19pi\23Ý”\11\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 ûÒÙ,€5B\7Ø~÷#UØç\19 \14/Pî‡‰%M\1=eþW\17]`\17^Zv\0241sü\r\9\20 «“$k£Ë´\31VÂŠMR¤—\28Ò\14t\0255\8t\25ËÌ/KòÐY8¿fü/Y_—\r\4î`<Ä\15v\25\30\9v\0256\11å\"\14’%FQ·tNYìhgzOCS\8ã\\\000#\8\6 \12¸²1\3¶i\9¹4´\16ä6ªUXŽQ\29ÙBã`Ò¾3{¦Ž\2Øšô=3Ð‘U\000\r\8\8 ý¶šS¼¿Z-Ç;ä` ‚Os\18‚åzòyV4\18ÝN\21F\r\000\000\000óòòò´²²ò¯2rò=€€\000\24€À\1\23@\000€\1À\000\000\23€\000€\24\000Á\1\23\000\000€\1@\1\000\31\000\000\1\31\000€\000\3\7\21 ÉÞ¯@\4\11\16I\25\16Ÿ6r>ªTjm¹‘v\0301\\8aÉ8Æ¥ú]™€Ÿ\11—DY\21ÿ¤lg¥8R=\1\000\000\000\000\000\8\7!\25¸Ù x‰oü\18óˆ\20<‘\28\4Y[.0\14™\24£>i·ø\22ŽþÁcµÀb4\6\000\000\000\3\000\000\000\000\000\000\000@\4\14\000\000\000›™ˆ¯ŸŽ™™’¯•†™ü\3\000\000\000\000 ìDA\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000(A\3\000\000\000\000\000\000ð?\000\000\000\000\19pi\23J¾\28\17\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 Q\23¨\5\22¡x^=×^\19\0069lmã\
\0225×PQ*þŠ¯T©WÆ\27Ã\15\9\20 Ÿß\12\
ÊO€\24~HÉae½Õ\15ááþ7ÎL\000`Þ\14t\0255\8t\25­4mH\23é>ý<4]En\6`<C”\4û\15v\25\30\9v\25¼&\27\5Ý©Z^z%\15SÃÌ´f'ž,qŒ‡°-\1/\8\6 0C“\26ÝžX3aùC|m\26ò-ã×Ä D\4Z1\000\
\8\8 âbtuî[ MrV4\18;-W‰ðl[Ù?T\8óø\2gjÒk\19¨ŒTh‹ “\6\23\7û\000ð£='ˆÝÇc%\000\000\000ŠÎ\14Ïi’\15É\15OÈOO\15Ò\15Ž\9€À\000‡\000A\1Á@\1\000€\000\1Æ€À\000ÇÀÀ\1\11\1\000GA\1\
A\1ƒGÁA\1\
AƒG\1B\1\
A\1„\
Â„\
Â…\
B†Ý€\000\1\26@€\1\23@\1€\rAÃ\1\25\000\000\23€\000€\3\1€\000\31\1\000\1\23@\000€\3\1\000\000\31\1\000\1\31\000€\000\1\7\21 ,çÑ+Õ\127Å{\25œ\28f\6\4\16I\25O¥ÔNÜhÑL1/Y{Û,…|'Áœj\2\000\000\000\1\2\000\000\5\7!\25¹ËÝ/ˆºàfÎŒÞCœ£¢P\14\000\000\000\3\000\000\000\000\000\000ð?\4\6\000\000\000·¢¡¯¦Ã\4\3\000\000\000¬°Ã\4\5\000\000\000·ª®¦Ã\4\5\000\000\000§¢·¦Ã\4\3\000\000\000é·Ã\4\4\000\000\000§¢ºÃ\4\6\000\000\000®¬­·«Ã\4\5\000\000\000º¦¢±Ã\4\5\000\000\000«¬¶±Ã\3\000\000\000\000\000\000\000\000\4\7\000\000\000®ª­¶·¦Ã\4\7\000\000\000°¦ ¬­§Ã\3\000\000\000\000\000\24õ@\000\000\000\000\26pi\23\19ø!\28~\6\23F»\26[eÒ˜\14_Úý¡lHVˆ<[‰{:³=öt\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 §ª\0077Ö|;m3C\15;\21¥Ï-Ì»ï~Ê¿Â1¹A)\22\\Ú\14è±*M€\8\9\20 ÷žïn'\15t\0253\8t\25\19í&%_‚\25\31\15/Øi÷\15v\25\25\9v\25G¿“y\1+\8\6 hN;ô\23o\000\000\r\8\8 ‹Q¾;\1\18Ç`¬‹¶o¹uµj­÷ww\9{V4\18×¤#:^¿íCË¬rWœ\000\000\000\12\9\9\9H\9\9\9ˆI\9\9ï\9\9\9\20‰\9\9O‰É\9ˆÉ\9\9T‰\9\8Ž\9È\9Â\9\9\9,\8\9\9lH\9\9ŽHH\9’\8\9\9\30É\11‰‰\8\9\11ÎHH\9\8‹\8\9”ˆ‰\8’\8\9\9\30\9\9‰\30\9\8‰HÉ\9ŽÈH\
É\8‰\8\8\11\11\9”H‰\8ŽHK\9’\8\9\9\30É\11‰‰\8\9\11ÎHK\9\8‹\11\9”ˆ‰\8’\8\9\9\30\9\9‰\30\9\8‰HÉ\9ŽÈH\
À\1€\1\1Â\2\000A€\1‡\1C\000›\1\000\000\23À\2€€\1\000\2Ç\1C\000\1‚\2\000€\1›\1\000\000\23\000\000€\23\000\1€†AÀ\000‡ÁA\3À\1€\1\1B\3\000A€\1‡C\000›\1\000\000\23À\2€€\1\000\2ÇC\000\1‚\2\000€\1›\1\000\000\23\000\000€\23\000\1€†AÀ\000‡ÁA\3À\1€\1\1Â\3\000A€\1‡\1D\000›\1\000\000\23À\2€€\1\000\2Ç\1D\000\1‚\1\000€\1›\1\000\000\23\000\000€\23\000\1€†AÀ\000‡ÁA\3À\1€\1\1B\4\000A€\1‡D\000›\1\000\000\23À\2€€\1\000\2ÇD\000\1‚\1\000€\1›\1\000\000\23\000\000€\23\000\1€†AÀ\000‡ÁA\3À\1€\1\1Â\4\000A€\1‡\1E\000›\1\000\000\23À\2€€\1\000\2Ç\1E\000\1‚\1\000€\1›\1\000\000\23\000\000€\23\000\1€†AÀ\000‡ÁA\3À\1€\1\1B\5\000A€\1\1\000\000ÇE\000Õ\1€\3\1\2\000\000¡A\3€\2\000\000Ç‚E\000ÇB‚\5Õ\2€\5\1\3\000\000¡‚\1€€\3€\2ÇƒE\000ÇC‚\7ÇCƒ\7\000\4€\4@\4€\6C\000\2 Âý\127 \1ü\127‡\1À\1›\1\000\000\23€\2€†AÀ\000‡\1F\3À\1€\1\1B\6\000€\1H€‹†Æ\000ÆÁÅ\000\1Â\6\000A€\1\23À\000€‡\1G\1À\1\000\000ž\1\000\1Ÿ\1\000\000\31\000€\000\4\7\21 ’\2ý~áQB\5yÝN&\\Â¿0š“k\27Õz)5\18\11\16I\25{O×\19àÓ\000Z<\19ÚlíOˆGóÀ'\127›•ó\11ü~`11\4F\000âT‡\5ï(=\6\2\000\000\000\1\2\000\000\000\7!\25×lö\5\29\000\000\000\3\000\000\000\000\000\000ð?\4\6\000\000\000ôáâìå€\4\8\000\000\000òåñõéòå€\4\3\000\000\000óú€\4\5\000\000\000êóïî€\4\6\000\000\000óôùìå€\4\7\000\000\000óôòéîç€\4\7\000\000\000éîóåòô€\4\19\000\000\000e\5(e1\000e1\30f\000'ºóôùìå€\4\6\000\000\000÷éäôè€\4\7\000\000\000îõíâåò€\4\19\000\000\000e\5(e1\000e1\30f\000'º÷éäôè€\4\7\000\000\000èåéçèô€\4\20\000\000\000e\5(e1\000e1\30f\000'ºèåéçèô€\4\7\000\000\000ïòéåîô€\4\20\000\000\000e\5(e1\000e1\30f\000'ºïòéåîô€\4\6\000\000\000ôéôìå€\4\19\000\000\000e\5(e1\000e1\30f\000'ºôéôìå€\4\11\000\000\000ãáîãåìîáíå€\4\24\000\000\000e\5(e1\000e1\30f\000'ºãáîãåìîáíå€\4\7\000\000\000ïëîáíå€\4\20\000\000\000e\5(e1\000e1\30f\000'ºïëîáíå€\4\6\000\000\000ðáçåó€\4\r\000\000\000åòòïòíåóóáçå€\4\7\000\000\000ãïîãáô€\4\2\000\000\000¬€\4\6\000\000\000åòòïò€\3\000\000\000\000\000\000\000\000\4\7\000\000\000åîãïäå€\2\000\000\000\r\9\20 \30\29ýK!È5p¦o\1\3Öãvb!\12\9\20 y¥\26\2$c\20\11á¢g#\
#J8û\16{qÆ\14t\25:\8t\25\7\25º\31jš2\29“­\22«Hm\16jx\6\29ÕÄw8¸µ¯bƒé¥Wz\22Ð3Üœ¼.ì\15v\25\30\9v\25Š«\3a%v\28\000ôv>[º\4ý\4\8É1hE6\7P\000*\8\6 ¡axTdS\4\28g/Ýj\2\r\8\8 :7{~Ó\\ÿOŠ\5Ÿ?´Ü•\000÷¿\19[~}V4\18òÐŽLU‡\27\20Æ\24šXƒ;)\127r\26É*\11\000\000\000ø~>~¾~~~ãþ~\1\24@\000\1\23€\000€ƒ\000€\000Ÿ\000\000\1\23@\000€ƒ\000\000\000Ÿ\000\000\1\31\000€\000\
\7\21 í³/\28Gß@c)\23·KpÕsÂõ\16\23\6´sz\27’}\6L¡\20x\4\3\16I\25\15\9¼a\6¦\17}\1\000\000\000\000\1\7\7!\25U?Ã1L\r¹wÕT:7¹’ÇM³<–b\29&´\14\1\000\000\000\4\5\000\000\000UXQD!\000\000\000\000\16pi\23‡™•2§+SN\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 ÈgQ5ë\15\9\20 \14ªå3ÓïÒ#Ø\
fVúžéGÖZÉ\14\22JŽ57\15t\0253\8t\25NëéLvá²/zçlxï\15v\25\18\9v\25:^\14H\0060e&Øs•\7´†uIæÜ\31\000\9ú‡8}•¦DàcQSq–\7\7\3Sá\16\000!\8\6 \1ÀŸ;CÖ\29Uô\29`Géíú\12À‰t(Ú\1ÊB±ULB\12ùtX\3\2\8\8 ¿ÿ1vàèG|0§hd¹ž\27>¶C\17\11Fñö\25ªŠ­\31\4/ûW¼Ò©I$r\26\24\15yV4\18+¢\127>™\000\000\000È\15O\15\23OÏ\14\24Ï\28ÈO\15Ô\15\15\15\24\15\11Ê\15\15\15\8ŽO\15NÎ\15\15Ò\14Ô\15\15\15\24\15\15\24O\rÉ\15Î\15ÈOÎ\14\
\14\15\14NŽ\14\15\14\15ÎÎ\14\15\15\r\15\14N\r\r\15YN\rÒO\14ÈOM\15Ô\15\15\15\24\15\11Ê\15\15\15\8NM\15NŽ\r\15Ò\14Ô\15\15\15\24\15\15\24O\rÉ\15Î\15ÈOÎ\14\
\14\15\14NŽ\14\15\14\15ÎÁ\1\000\000\2\000\1AÂ\2\000VA‚\2Ý@€\1Ç\000C\000Û\000\000\000\23\000\4€Å\000\000\000\7\1C\000AÁ\000\000Ý€€\1Û\000\000\000\23\000\000€\23@\2€Æ\000Á\000Ç@Á\1\5\1\000\1A\1\000€\1€\000ÁÁ\1\000\000\2\000\1A\2\2\000VA‚\2Ý@€\1Ç@C\000Û\000\000\000\23\000\4€Å\000\000\000\7AC\000AÁ\000\000Ý€€\1Û\000\000\000\23\000\000€\23@\2€Æ\000Á\000Ç@Á\1\5\1\000\1A\1\000€\1€\000ÁÁ\1\000\000\2\000\1A‚\3\000VA‚\2Ý@€\1Ç\000@\000\24ÀÃ\1\23À\4€Ç\000D\000Û\000\000\000\23\000\4€Å\000\000\000\7\1D\000AÁ\000\000Ý€€\1Û\000\000\000\23\000\000€\23@\2€Æ\000Á\000Ç@Á\1\5\1\000\1A\1\000€\1€\000ÁÁ\1\000\000\2\000\1AB\4\000VA‚\2Ý@€\1Ç\000@\000\24€Ä\1\23À\4€Ç\000D\000Û\000\000\000\23\000\4€Å\000\000\000\7\1D\000AÁ\000\000Ý€€\1Û\000\000\000\23\000\000€\23@\2€Æ\000Á\000Ç@Á\1\5\1\000\1A\1\000€\1€\000ÁÁ\1\000\000\2\000\1AB\4\000VA‚\2Ý@€\1Ç\000@\000\24ÀÄ\1\23À\4€Ç\000D\000Û\000\000\000\23\000\4€Å\000\000\000\7\1D\000AÁ\000\000Ý€€\1Û\000\000\000\23\000\000€\23@\2€Æ\000Á\000Ç@Á\1\5\1\000\1A\1\000€\1€\000ÁÁ\1\000\000\2\000\1AB\4\000VA‚\2Ý@€\1\31\000€\000\
\7\21 ª·-[\17\127Ÿ>É\25oj'MÔ\31òâð\17:°vq* µ0\1XT\16\
\5\16I\25nvÓ\5õu´W$^\17:.\000H.\3\000\000\000\1\4\000\1\1\3\5\7!\25Õ³]|;ù¼\6&\20(•³r\20\000\000\000\4\5\000\000\000Ÿ’›Žë\4\6\000\000\000§Š‰Ž‡ë\4\5\000\000\000ŸŽ“Ÿë\4\7\000\000\000˜Ÿ™‚…Œë\4\6\000\000\000ŸŠ‰‡Žë\4\7\000\000\000‚…˜Ž™Ÿë\4\4\000\000\000\12GGë\4\7\000\000\000\2J^\12GGë\4\26\000\000\000\15SA\reL\15P]ŸŽ“Ÿ\14Zu\rkL\2\127r\3DDë\4\5\000\000\000˜‚‘Žë\4\7\000\000\000…ž†‰Ž™ë\4\26\000\000\000\15SA\reL\15P]˜‚‘Ž\14Zu\rkL\2\127r\3DDë\4\6\000\000\000Š‡‚Œ…ë\4\6\000\000\000ˆ„‡„™ë\4\27\000\000\000\15SA\reL\15P]ˆ„‡„™\14Zu\rkL\2\127r\3DDë\4\11\000\000\000¹Š‚„¬™„ž›ë\4\7\000\000\000˜Ž‡ŽˆŸë\4\28\000\000\000\15SA\reL\15P]˜Ž‡ŽˆŸ\14Zu\rkL\2\127r\3DDë\4\14\000\000\000¨ƒŽˆ€©„“¬™„ž›ë\4\9\000\000\000¨„†‰„©„“ë\000\000\000\000\20pi\23V»é\12NR«0Ñ%\22\14œ¬à&øÜXPÕT\17f\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\19pi\23\29Osh\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 [\31\18'b`nôp¢XŸÙr\8Ï /I¦¬\5/_ÛVT_üê\\ùÍ\27D¾ß\
\31\000\9\20 Ö8#\20f;·P„#´{ÒÌð\26H¯4vÉEF5˜íØTb£\12uëÅˆ:\21\15t\0255\8t\25=\29\16\000—;åI˜—¬L½¥c\0038DÀ8\000\14v\25\26\9v\25\2æßFz\11$\20\1(\8\6 ]\5oY\000\2\8\8 ÒGƒBüÞáapŽ³Kxôˆq[º86ÏŠž(rÂ\
\rŸx\24A25pi \0163%¸\127V4\18$4ç H~,pá\31\\0íy-Vák\5ECÃh%Ù?¶\16I\000\000\000½¸¸¸ù¸¸¸9ø¸¸^¸¸¸¥8¸¸ý¸¸¸98¸¸yx¸¸ž¹¸¸å8¸¸=¸¸¸y¸¹¸¹y¸¸Þ¹¸¸%8¸¸}¸¸¸¹ù¹¸ùy¸¸\30\1\000\000Ý€\000\000\5\1\000\000A\1\000Á\000\000æ\1\000\000\29\000\000E\1\000\000Á\1\000ÁÁ\000\000&\2\000\000]\000\000‡\1@\000‡\1A\3Ë\1\000\000\1‚\000\000U\2\000\000\2\000\000!Â\4€\6CÀ\000\7\3B\6@\3€\3†CÂ\000‡ƒB\7ÁÃ\2\000\7Ä\2\000\7\4@\8G\4@\000G\4À\8\14D\4\8GÄ\2\000G„À\8‡\4@\000‡„@\9N„„\8‡Ä\2\000‡\4A\9\3€\2\29C\000\000 ‚ú\127\6\2Ã\000@\2\000\3†BÀ\000‡BC\5À\2€\3\1ƒ\3\000‚€\1À\2€\000\000\3\000\1@\3€\1€\3\000\2À\3€\2\30\2\000\4\31\2\000\000\31\000€\000\4\7\21 àx%p{›Z\15\30^\24>†Ü(¨¿[\19\
€¬\1\19\6\16I\25\"Ë\127'éVkq+IÃ8\4*»ž\16.šP\r+3Ç·u\2\000\000\000\1\2\000\000\8\7!\25õ\
Fa\3RV\30¦U¤,•ƒ^\"5‡Æ\7Ff×Q\0115šwÍ÷íAkš¾r\15\000\000\000\3\000\000\000\000\000\000ð?\4\6\000\000\000k~}sz\31\3\000\000\000\000\000\000\000@\4\7\000\000\000qjr}zm\31\3\000\000\000\000\000\000\8@\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000\24@\4\7\000\000\000vqlzmk\31\4\7\000\000\000lkmvqx\31\4\7\000\000\000ypmr~k\31\4\r\000\000\000:lc:lc/g:/)g\31\4\28\000\000\000yvq{Rjskv\\pspmVqMzxvpqYjeef\31\4\7\000\000\000|pq|~k\31\4\2\000\000\0003\31\000\000\000\000\22pi\23®\23JrX\20ìH4\31Ì,òÚ²\23\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 ƒ4¦xQé\000'Þ\14\9\20 bJÇ\7§&ÚL'ó\24\\U¯\11\\lôˆWDà\19\127@vik¤\15t\0252\8t\25—·r%:`üm>\14v\25\31\9v\25\19?×U7XAÉ„wÌU¯\30þÇi\4Â\3Œn\11aŸ\"\1*\8\6 ¥`\23\14\24‘Ì8¨ã¥T\000\15\8\8 ·\27<lA·ÒM\\ÅÝ9·Ö/IÄëxF­®Þ`ž4NDk}V4\18F[(\17»DE5e¨±D²O±h\000%Y4B\1\000\000nkkk*kkkê+kkkkkvëkk.kkkêëkkª+kkMjkk6ëkkàkkk¬«+k¾këjjjkk-jªkê*jk6êkjìêªi jkkNikk*ikkëiëjªikk\
©Kë*hkkì¨+kìhhlþhklªhkk\
htë,¯+k,oèc,oïc,¯ªcsk©c|klë,¯+k,oèc,oïc,/©c0okk|ëhë,¯+k,oèc,oïc,ï©c0/kk|kië-/«k,¯©cëokj¬¯+k¬oèb¬oïb¬/©b6/ëj|«jë-/«k,¯©cëokj¬¯+k¬oèb¬oïb¬ï©b6/ëj,¯+k,oèc,oïc,¯ªcsk¨c|klë,¯+k,oèc,oïc,/©c0okk|ëhë,¯+k,oèc,oïc,ïÂ\8[D\000\000\23\000\2€FDÀ\000GÄÂ\8€\4\000\1ÇÄ@\000Ç\4ƒ\9Ç\4„\9ÇDÂ\9]D€\1\23À\1€FDÀ\000GÄÂ\8€\4\000\1ÇÄ@\000Ç\4ƒ\9Ç\4„\9Ç„Â\9]D€\1GÄ@\000G\4ƒ\8G\4„\8GÄÁ\8\24@Ã\8\23\000\1€FDÀ\000GÄÂ\8€\4\000\1Á„\3\000]D€\1GÄ@\000G\4ƒ\8G\4„\8GÄÁ\8\24ÀÃ\8\23@\9€GÄ@\000G\4ƒ\8G\4„\8G„Â\8[\4\000\000\23À\7€GÄ@\000G\4ƒ\8G\4„\8G\4Ä\8[\4\000\000\23\000\4€FDÀ\000GÄÂ\8€\4\000\1ÇÄ@\000Ç\4ƒ\9Ç\4„\9Ç„Â\9]D€\1FDÀ\000GÄÂ\8€\4\000\1ÇÄ@\000Ç\4ƒ\9Ç\4„\9Ç\4Ä\9]D€\1\23\000\2€FDÀ\000GÄÂ\8€\4\000\1ÇÄ@\000Ç\4ƒ\9Ç\4„\9Ç„Â\9]D€\1\23Àÿ\127`Cà\127`‚Þ\127[@\000\000\23€\2€K\2\000\000@\000€\4A\2\000\000•\2\000\1Á\2\000\000aÂ\000€AC\4\000€\3\000\6Vƒƒ\6J@\3\6`‚þ\127U\2€\000•\2\000\1\25€‚\4\23€\5€F‚Ä\000Â\4\000Á\2\5\000]B€\1U\2\000\1•\2€\000N‚‚\4†BÅ\000À\2€\4\1\3\5\000B€\1\2\000\000À\2€\4\1\3\000\000¡‚\1€†CÀ\000‡ÃB\7À\3€\000\1D\4\000@\4€\6\22D\4\8C€\1 Âý\127K\2\000\000†ÂÅ\000Ç\2F\3\000\3\000\000Ý\2\000\1\2\000\000dB\000\000H@\2‹F‚Å\000G\2À\4\24\000À\4\23À\26€A‚\000\000†‚Å\000•\2\000\5Á\2\000\000a\2\25€\1\1\000\000FCÆ\000GƒÆ\6†ƒÅ\000‡\3\3\7ÁÃ\6\000]ƒ€\1[\3\000\000\23À\6€@\3\000\4†ƒÅ\000‡\3\3\7ÁÃ\6\000]ƒ€\1€\3\000\4Î\3@\6ÇÃ\3\1\1\4\7\000ƒ€\1Ë\3\000\000\1\4\000\000U\4€\6\4\000\000!D\1€\6EÇ\000GÅ„\6\29…\000\1\r\5@\
\7\5\5\7Ê\3…\9 \4þ\127\6„Ç\000N\4@\6GD„\000\
Äƒ\8\1\1\5\000\23À\15€N\3@\6GC\3\1\24€Ã\6\23€\1€FƒÇ\000Ž\3@\6‡ƒƒ\000ÆƒÅ\000Ç\3ƒ\7JÃ\3\7\1\1\5\000FCÆ\000GƒÆ\6Ž\3@\6‡ƒ\3\1ÁÃ\7\000]ƒ€\1[\3\000\000\23€\6€@\3\000\4Ž\3@\6‡ƒ\3\1ÁÃ\7\000]ƒ€\1†CÇ\000ÆƒÅ\000\14\4@\6Ç\3„\7ƒ\000\1\3@\7‡ƒƒ\6À\3\000\4\000\4\000\7A\4\7\000Ýƒ€\1\6DÇ\000F„Å\000G\4ƒ\8\29„\000\1\r\4@\8\7\4„\7F„Ç\000Ž\4@\6‡„„\000J\4\4\9\1\1\5\000\24\000@\2\23À\3€@\3\000\4Ž\3@\6‡ƒ\3\1Á\3\7\000]ƒ€\1†CÇ\000ÆƒÅ\000Ç\3ƒ\7ƒ\000\1\3@\7‡ƒƒ\6ÆƒÇ\000\14\4@\6\7\4„\000Êƒ\3\8\1\1\5\000`Bæ\127\23@\000€A\2\5\000_\2\000\1A\2\000\000_\2\000\1\31\000€\000\5\7\21 ™?V\4—ÜËYà~\23\30ã(ÐW4ðX\25¸ÔNv$òTO\22\7\16I\25¶œ¸zæõà=\12§§Z\31O_‹VøK$8t\19\2\000\000\000\1\2\000\000\7\7!\25áÙ÷ ÛS°\127\9+È\1=ŸÕZ’*àHÍ\22AH \000\000\000\3\000\000\000\000\000\000ð?\4\6\000\000\000ª¿¼²»Þ\3\000\000\000\000\000\000\000@\4\6\000\000\000®¿¹»­Þ\4\8\000\000\000¬»¯«·¬»Þ\4\3\000\000\000­¤Þ\4\5\000\000\000´­±°Þ\4\5\000\000\000ª§®»Þ\4\11\000\000\000Œ¿º·±™¬±«®Þ\4\7\000\000\000·³¿¹»­Þ\4\5\000\000\000²·­ªÞ\4\7\000\000\000·°­»¬ªÞ\4\14\000\000\000¶»½µœ±¦™¬±«®Þ\4\5\000\000\000›º·ªÞ\4\6\000\000\000»º·ªÞ\4\9\000\000\000±³¼±œ±¦Þ\4\5\000\000\000º¿ª¿Þ\4\4\000\000\000¨¿¬Þ\4\6\000\000\000»¬¬±¬Þ\0045\000\000\000:c~9DZ›¦®²·­ª6aG:ft;Q\\8Kn:b~9DZ:fS;qg1bR;nO;Y~:ft=^\\Þ\3\000\000\000\000\000\000\000\000\4\7\000\000\000º·¿²±¹Þ\4\
\000\000\000³§¬»ª«¬°Þ\4\7\000\000\000­¶±©‹—Þ\4\7\000\000\000»°½±º»Þ\4\7\000\000\000­ª¬·°¹Þ\4\5\000\000\000¸·°ºÞ\4\2\000\000\000žÞ\4\2\000\000\000òÞ\4\9\000\000\000ª±°«³¼»¬Þ\4\3\000\000\000™Þ\4\2\000\000\000ýÞ\1\000\000\000\15\9\20 „ßl\rLüÆCù½\20%uæ+\0155F×\000pIXF\31\11\9\20 %M¦'\14Ö\29t\15\15t\25:\8t\25<H={6-Í<¾×òUðe¢j\28‚\22\30š\25My²¼úzo½_%¢\5²Wf\025057\14v\25\18\9v\25\12¯.?šx\\*é•L`f2\29U\19§T\8MWQAiD\
Pï\12o\5ú‘¡Eí#w]\000/\8\6 óO¶jb\
£lpO\rJc™\0141£À\1278ãstt\3\r\8\8 ±–, JðhÄ.òSçÃjiÞ!ã>\28yV4\18x;08+\000\000\000À\\\28\29\11\28\28œÝ\28\28\28\000]œ\28\11\28\28œ\29]\28\28]\29\28\28—\29\28\28Ú\\\28ÛÝÜ\31\28\30\28\000@\2\000\2€\2€\1Ý\000\2ÛA\000\000\23€\2€\6‚@\000\7\2A\4@\2\000\000€\2€\1Æ‚@\000ÇBÁ\5\000\3\000\000Ý\2\000\1\29‚\000\000Š\1‚\2\23@\3€\6‚@\000\7\2A\4@\2\000\000€\2€\1Î\2À\3\29‚\000\2Š\1‚\2\6‚@\000\7BA\4@\2\000\2\29‚\000\1Í\000‚\3M\1À\2\23€÷\127Ÿ\1\000\1\31\000€\000\11\7\21 s\3á,\26Aâ\15Ìj¿nwÞ\28&ð\16Ogã\27\25y\r+}\".$zŠp!\r\4\16I\25öf8ti—ß&Àö\29\4ãŠ¯Q¥ \21p\1\000\000\000\000\1\3\7!\25E•R>\21ð\":\6\000\000\000\3\000\000\000\000\000\000ð?\4\2\000\000\000_\31\4\7\000\000\000lkmvqx\31\4\5\000\000\000yvq{\31\4\4\000\000\000lj}\31\4\4\000\000\000szq\31\000\000\000\000\27pi\23èUÒvùc—.žÆ—xšìo#\25®‡\23bõ‰L°Ú\12øÏjV\22Š\30\11\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\20pi\23p\11›\14}Û­Døù<A‹L}\30IFm3ˆq\27^\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 \26Š\\šƒ)\21»\
\9\20 ƒ¸;9Ù u*6­x\\œ\1t\0256\8t\25i¸«PƒäiN‡¬‹\26Pþ®cl©mHó\3\21=Ž\14v\25\31\9v\25íãìSÑu@kU'R\12X‰¤\8v¶[\28#œ©N\3wK*\1.\8\6 @ø¾}÷óOj\3ƒÌ>Ÿ`“5>¬\21\21ãÚÀL\2GHq\000\000\8\8 ýgK)œÊq\6â\7\31C\14^bh ƒ­?¼(”mD\11ÛD»¿ž\
„~V4\18Bl*%ußî!3™²[5p?b©C\20\3!}Ÿ/?\000\000\000¡„„„â„„†€…„„áÅ„„œ„D„“\4†\4\5Å„„a\5„„\12D…\5aE„„\12D\5\5a……„\12D…\6aÅ…„\12D\5\6SÅ€\23\000\11€\24€Á\000\23€\3€¥\1\000åÁ\1\000\1Â\1\000@\2\000\3]‚€\000¥\2\2\000ˆ€\2¥B\2\000ˆ€‚¥‚\2\000ˆ€\2‚¥Â\2\000ˆ€‚‚×\1\7€\23À\6€\24\000Â\000\23@\6€¥\1\3\000åA\3\000\1B\2\000A‚\2\000€\2€\3À\2€\4\000\3€\3@\3€\3€\3\000\1]ƒ\000\1€\3€\3À\3€\1ƒ\000\1Vƒƒ\6\29ƒ\000\1Ö\2ƒ\5‚\000\1å‚\3\000ˆÀ\2åÂ\3\000ˆÀ‚å\2\4\000ˆÀ\2‚åB\4\000ˆÀ‚‚×Áÿ\127\31\000€\000\3\7\21 þjf\15\16\3\16I\25|œÛi!\7\16^\4\000\000\000\1\2\1\3\000\000\1\4\000\7!\25u²Nv\11\000\000\000\4\
\000\000\000ÊÊØÓÚÔÉÞÕ»\4\6\000\000\000ŽŠŠˆ‹»\4\11\000\000\000ÔØÉùÚ×ÚÕØÞ»\4\
\000\000\000ÔØÉèØÉÞÞÕ»\4\9\000\000\000ÔØÉòÖÚÜÞ»\4\15\000\000\000ÔØÉéÞËÔÉÏþÉÉÔÉ»\4\7\000\000\000ÓÚÔÒ‰ˆ»\4\22\000\000\000ŠŠŠŽÇÿƒƒˆýŽøþƒøˆúÿŽƒƒ»\4\6\000\000\000ßÚÖÚ‰»\3\000\000\000\000\000\26«@\4!\000\000\000‚ŠÙŒÝÞ‹ÞØÞ‚ˆƒŠŒŒØÝ‰‹ŽŠØÚˆƒÚÝØÙ‹»\18\000\000\000\r\9\20 gä{'ðøÃ\17lí\23\
ÐÄþw‹\3\9\20 Ó³D\20—‹\15Zé¦Z@x5×xT\6yf#˜\14B\24|ü,Oóo6‹BŠ\2›Â„t€\15t\0258\8t\25H\15ka¯Ýr\22yùã\
ÉWY}‚?ƒ\31òÊ3;A;½3÷çˆ]\14v\25\27\9v\25,*XA}æck]¾M_\1*\8\6 Q\000”5Ä¢É\6RgÉj\000\14\8\8 ”gÈ~çS»\2Rfg\27\r\19\127ßÊ\\;4Ü& rV4\18^Ìêh÷Ìà8\"Ù³yê\14uk“e-~Ñ \0292\30àLBmØC÷Ê\4(ûu9J:\000\000\000%   a   ¡`  Æ   =   e   ¡   á`  \6!  }   ¥   áà  !!! aa! †!\000\000€\000\000Æ€A\1\1Á\1\000Ý€\000\1\6A\1A\1\2\000\29\000\1K\1\000\000€\1€\000ÇÁB\2\11‚\1\000\
\2\000†\
‚Ã†\
‚€‡K‚\000\000J‚Äˆ•\2\000\3J‚‚‰\
B\2ˆFBE\1G\2Å\4GBÀ\4€\2\000\3]‚\000\1\
B\2ŠFBE\1G‚Å\4GÂÅ\4€\2€\2]‚\000\1\
B\2‹ÝÁ\000\1ˆ\000\2…ˆÀ„ÆB\1\24\000Æ\3\23€\000€Ç\1À\2ß\1\000\1\23@\000€Ã\1\000\000ß\1\000\1\31\000€\000\11\7\21 é•8c<±ö}¼”ä@î€eUhÛN?9{H,K?³4ËIT\24Š{Üa\11\11\16I\25\29±\29\3Giˆ!¤IE:\5\5Ù\5™ö\9\8\11eRM„ä£bÕ*æ.ëµ6YWÊç%\3\000\000\000\000\000\000\1\000\2\11\7!\25â‚\23\18z£›\31\29\6F\3u\18}?øt¼<O$&P¸\127U\3ï?ÁdJš_\26|,±f\25\000\000\000\3\000\000\000\000\000\000ð?\4\7\000\000\000øÿùâåì‹\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\4\7\000\000\000åþæéîù‹\3\000\000\000\000\000\000$@\4\8\000\000\000ùîúþâùî‹\4\3\000\000\000øñ‹\4\r\000\000\000øñäèàîÿ¥ãÿÿû‹\4\4\000\000\000ùîø‹\4\5\000\000\000èäïî‹\4\8\000\000\000ùîúþîøÿ‹\4\4\000\000\000þùç‹\4\7\000\000\000æîÿãäï‹\4\5\000\000\000ÛÄØß‹\4\8\000\000\000ÿâæîäþÿ‹\4\8\000\000\000ãîêïîùø‹\4\r\000\000\000Èäåÿîåÿ¦ßòûî‹\4\"\000\000\000êûûçâèêÿâäå¤ó¦üüü¦íäùæ¦þùçîåèäïîï‹\4\15\000\000\000Èäåÿîåÿ¦Çîåìÿã‹\4\7\000\000\000øäþùèî‹\4\6\000\000\000çÿåº¹‹\4\5\000\000\000øâåà‹\4\6\000\000\000ÿêéçî‹\3\000\000\000\000\000\000i@\000\000\000\000\23pi\23†KV\0248Á•'ÆV_\29ï&¥Wr<ÞS\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 úŽ÷\16\5\
_\14;ø\27ø+Î&.Ü6P:\",\0030.t_\30{ï'u\
\9\20 tä€\15l\20«hW¥Ðyø\15t\25:\8t\25~¦\0128Î—Šbãøpf^4°\18\19%^?}…¢\\aû\
7[àRÞ–BYÀß/n«\14v\25\31\9v\25J¦º&FùórÇ\8l\2i`E.>+\"võ«J(cï<?\000 \8\6 \3çBD\\\27\11fü\12c%=\9oGŒI\127E\27ˆRM`\24]\29î\19a@lÓ\\\1\11\8\8 E¹1:‡\23™PJÓ\20>={V4\18¨\7ÅP'v\26\\è•¬\19'\000\000\000X===»=}=ü}== ½=<û½}=úýý<=<==|<<=àý½<||<\000\24€A\2\23À\5€†ÁA\000€\000\24\000B\3\23@\2€Æ\1@\000\1B\000\000Ý\000\1\12BÂ\1‚\2\000\29‚€\1\12ÂB\4\29‚\000\1@\1\000\4\23@\1€À\1€\000\12BÂ\1‚\2\000\29\2€\1Ý\000\000@\1€\3Ì\1Ã\1ÝA\000\1_\1\000\1\23@\000€A\1\000Ÿ\1\000\1\31\000€\000\7\7\21 ^Ñú.Æ,ïlÊvðI¢îœ\6\16Ó©\19\11\6\16I\25j÷\8\9y3ïAO›\0063_£S1Ý\",\1\29Ì2\8bŠ–u\1\000\000\000\000\2\9\7!\25\26Ù•- “\5=Å‡¶,5aèz\000¬bZ³›\23mÄÍ»WÌØj`\r\000\000\000\4\8\000\000\000\7\16\4\000\28\7\16u\4\3\000\000\000\6\15u\4\3\000\000\000\28\26u\4\5\000\000\000\26\5\16\27u\4\3\000\000\000\7\23u\4\1\000\000\000u\000\4\
\000\000\000\18\16\1:&!\12\5\16u\4\4\000\000\000\28\26\6u\4\5\000\000\000\7\16\20\17u\4\3\000\000\000_\20u\4\6\000\000\000\1\26\29\16\ru\4\6\000\000\000\22\25\26\6\16u\1\000\000\000\000\9\20 dcU\17¤w.0p^#§á\16˜T\5.Þßº\6 0–X\rÎY,™ŸÏA`\r\9\20 \31`bÊœ\30|¤3\4yoÛR‡\15t\0259\8t\25\1278É\17\24ˆ€]cƒÆF\18M\15E\22&Ò ù\
­¦žu\9«o>\3rË\14¬\14v\25\16\9v\25­’ù\26\"5ý\30štÂR;dÍB­\\PEþ×\23dàÛûr\29»àh\000!\8\6 x0\1!ûš›oE¦M…þZM”:k1:Þg)…`@\27³ÇË\19\1\1\8\8 )”D\20B7§fèv˜c¨Ì\r&Z¿'DKú^*º\25\29kçÕÄj\30›X5D\127V4\18!\r$DÒjq5\19.DDB!clß3\8Ùwû\6ñžq(\9\000\000\000\2D\4D\3\4„DÄ\000\000\000Á€\000\000%\1\000\000]€\000\2\000\000€\000\31\000\000\1\31\000€\000\6\7\21 ¹S÷y\14ZR\17\16-Ea1„ø\26\5\3\16I\25VÓÔ.·‚Sh\1\000\000\000\000\000\5\7!\25±<X<ã“\3P÷$F”,Ã}\3\000\000\000\4\7\000\000\000\19\20\18\9\14\7`\4\5\000\000\000\7\19\21\2`\4\4\000\000\000HNI`\1\000\000\000\14\9\20 3OWFu]\28\23Š'Ø\12b6›\8Ã]€JC˜Nuô…>\19\11\9\20 ¼JT\29AŒå\"…\15t\25:\8t\25”Ü\23\3ÞcBxw\18L\14Ý}Á\21¥\29ú3\31+ó6>1\12\28,h¾\14E¿dN\17Ü¢e­\14v\25\29\9v\25üôÌ\\Šë\5\rE\2#0Ñ\16!5D\127ìk\000/\8\6 ¬°ôRtO`\000&»ôA\"\14\17jþv8\rˆñJ\1\12\8\8 A\15‡\2|w \9R\11D\8\22¹œ\15–qV4\18äLßeÍžŒ)rûk#[_+tª\28N?\24\25fWzŠ\30+èMZ[D$f\
\000\000\000Ð–Ö–ÑÖV–\23\22\000\000Æ\000@\000ÇÀÀ\1\000\1\000\000Ý\000\000\1^\000\000\000_\000\000\000\31\000€\000\1\7\21 ù)ý@*ÍÁ\11¼>PV\5\5\16I\25pÏä;Oq\11Ç”ï9c;‚7\1\000\000\000\000\000\5\7!\25;äO:Šövy[\14wH9[ˆG\4\000\000\000\4\7\000\000\000`gaz}t\19\4\7\000\000\000u|a~rg\19\4\5\000\000\0006#!k\19\4\5\000\000\000qjgv\19\000\000\000\000\23pi\23Az\8}zj\15J_'M“…L\5‘#¬Y\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\23pi\23'\29v0up‹?•À(\29š\24âSÐÏ¶3\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\24pi\23²1H+KZÕ^'+Ñ7ö²l\17\11¤XX UÎx!€.\29Çâ¨.£jÑF‘O\19Y\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 & FTÖNiôíÔ\3©ÙÈu:Ý‘\000ñ\8\9\20 Ý“gUë\15t\0254\8t\25Ö\4?;±¬Â<Å!†\30&,UfÔ\14v\25\16\9v\25ô<\127(tc\16zÇ‚7\2ô)t\30\22Ø\0065\8¹÷JMeÑ{w@Ð-\000,\8\6 ýp g1~ˆqV‡ç+7ØïC†[ôz\000\
\8\8 Í:\17mJ\17;HDzV4\18?ÿ\15L\r9-\18&\000\000\000BD\4DC\4\4DYÄÄD\1DÄDÅÄDD…„DDAEDE\5EEDÁEÄE’Ä\1]€€\1[\000\000\000\23€\3€‹\000\000\000Æ@A\000\1\1\000Ý€\000\1\7ÁÁ\1\7\1B\2@\1€\000\29\000\1€\000\000\2\3\1€\000FAB\000‡B\1]\1\000\1\31\1\000\000\23€ù\127†\000@\000‡@@\1€€\000Ž\000\000\1\26€€…\23\000ø\127ƒ\000\000\000Ÿ\000\000\1\23@÷\127\31\000€\000\4\7\21 F\\C&ý„úbº;Y,ÛïQ~Ó‰9\30kè\27i\7\6\16I\25ùµŽ\4yó²\19•NWEn\25Ÿ~@vê\21‰xËc„ñ¥3\4\000\000\000\000\2\1\000\1\2\1\3\9\7!\25ÖÝœ_û1va{´\31TÓN½F,°þRÑ;\7\000\11'­\
²\11óM\12\000\000\000\4\3\000\000\000ž‚ñ\4\5\000\000\000…˜œ”ñ\4*\000\000\000™……ËÞÞ˜Ãß‚‹ÆÉÈßŸ”…ËÉÉÞ¶”…¤‚”ƒ¸Ÿ—žß‚™‰ñ\4\20\000\000\000œÌ–”…˜Ÿ—ž×„‚”ƒŸœ”Ìñ\4\11\000\000\000×‚‚†žƒ•Ìñ\4\8\000\000\000ƒ”€„˜ƒ”ñ\4\3\000\000\000‚‹ñ\4\5\000\000\000›‚žŸñ\4\7\000\000\000•”’ž•”ñ\4\9\000\000\000…ž‚…ƒ˜Ÿ–ñ\4\5\000\000\000”—…ñ\3\000\000\000\000\000\000\8@\000\000\000\000\21pi\23Øa¾wü\28.\22rÚ‰d|,\30N;\28>b€\19·vYÔ\15%\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\8\9\20 M©VzÏ\15\9\20 p$\26`\2ìÈ \20\31AbÝf\21ÜPLE˜\28Â!Ë\15t\0255\8t\25+\11\4\0160n\\6D‹\19Kz¥*\6sª:aÅ\14v\25\28\9v\25–\20\26blõ2\5MŠÝ<û@\31_\1/\8\6 PH\4\31?e{ üçîYH8“d\25•%^Ùã?;\000\r\8\8 ãÀ\7xfˆ™C\16OßL0j^rö(ºAŸ}V4\18ø\20ƒb)\30Ê \3lßgÕeÏ'Á:ŒBY\000\000\000¹ŸŸ›ÄÞŸŸˆŸŸ\31ÞžŸŸ\4ÞŸŸˆŸŸ\31\30ÞŸŸY\30ßŸž]ŸŸßŸŸ\31\31Ÿ_ŸžŸœ\31žßœŸœBÞ\31œYžÞŸžÝžŸBÞŸžZž\31Ÿ™\29ÞŸ‚\29\31ŸÞ]žŸ‰B\2\4Ý\000\1\6\2B\000\7BB\4@\2€\3\29‚\000\1\25\000‚€\23€\r€\6‚B\000\7ÂB\4\29‚€\000E\2\000\1\2\3\000ÁB\3\000\5\3€\1Aƒ\3\000…\3\000\2ÁÃ\3\000\5\4€\2A\4\4\000€\4€\3Ö‚„\5]‚€\1[\2\000\000\23À\6€‹\2\000\000ÆBD\000\1ƒ\4\000Ý‚\000\1\7ÃÄ\5\7\3E\6@\3€\4\29ƒ\000\1€\2\000\6\7CE\5\24@@\6\23@\2€\7ƒE\5\9\3\000\3\6ÃE\000G\3F\5\29ƒ\000\1FÃE\000‡ƒE\5]\3\000\1\31\3\000\000\23Àö\127\4\3\000\000FÃE\000‡CE\5]\3\000\1\31\3\000\000\23@õ\127†‚B\000‡ÂB\5‚€\000Ž\2\2\5\26€‚\2\23Àó\127ƒ\2\000\000Ÿ\2\000\1\23\000ó\127\23€\000€\4\2\000\000AB\6\000\31\2€\1\31\000€\000\000\7\21 \000qÓ7ñ¨èx\19\11\16I\25{\22þ=dS#Z”¸…\127\17+\24 ÐHV_âBc<\12l7\127|ðÈ\0302‹g[KÑ²\31\7\000\000\000\000\2\1\5\1\000\1\2\1\3\1\6\1\4\4\7!\25zÃú?efØ}R¼÷3Ò~©TH'àu\26\000\000\000\3\000\000\000\000\000\000>@\3\000\000\000\000\000\000ð?\4\9\000\000\000¼¡®¿¼§ »Ï\4\14\000\000\000 ¬½¦¢®¨ªá¥¿¨Ï\4\7\000\000\000¢œ£ªª¿Ï\3\000\000\000\000\000@\127@\4\9\000\000\000º¼ª½Ÿ®»§Ï\4\19\000\000\000à½ª¼à ¬½¦¢®¨ªá¥¿¨Ï\4\7\000\000\000¼»½¦¡¨Ï\4\4\000\000\000£ª¡Ï\4\3\000\000\000 ¼Ï\4\5\000\000\000»¦¢ªÏ\4'\000\000\000§»»¿õàà®¿¦ýá¼µø÷öá¡ª»õ÷÷àª¬¹¶»ªá®¼§·Ï\4\
\000\000\000º¼ª½¡®¢ªòÏ\4\11\000\000\000é¿®¼¼¸ ½«òÏ\4\9\000\000\000é¼ ©»¦«òÏ\4\
\000\000\000é¦¢¨«®»®òÏ\4\8\000\000\000½ª¾º¦½ªÏ\4\3\000\000\000¼µÏ\4\5\000\000\000¥¼ ¡Ï\4\7\000\000\000«ª¬ «ªÏ\4\5\000\000\000¦¡© Ï\4\6\000\000\000¦¢¨†«Ï\4\9\000\000\000» ¼»½¦¡¨Ï\4\7\000\000\000½ª¼º£»Ï\4\19\000\000\000*Tq(FH'hl)Q_&[V'``Ï\000\000\000\000\21pi\23âÍˆ!y‘>h®mK9n×3\1\25 ·:¦‚Î\27—õý!\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\3\9\20 Ç\29«5gø¹E,IP\0233¼|Wöâd\
z9Ÿtl¬b\1Š|·oÕíÎbë‡}P\000\9\20 ½!RbµŒCTZUº\19@*r \8¬y-\8?½\30f0+ZG¶\18\5IÆ=j+\000t\0257\8t\25»€\1dÜ$Ü\23>×7UùoÖf@\0236\16=XÝ]@*Ü\18å\14v\25\30\9v\25…è'[\7H‡H\12¦a}±1xr;\4\4 \3‰Æ\7\1+\8\6 §°f!\5~w\000\11\8\8 ’>î\30¶$Z#9ä×Dð~V4\18“9’XŠ²!t]\23%›xOwöºÝ{»\19**T\000\000\000Öððòk°ððçððpqððð6°°ð7p0ñðñðð±1ðð-ppñèð1ñçðñp6°±ð-ppðñqñð°ñððæ°qñ5ðpððñðð-pðñö±°ð÷1±ò@\1€\1\29\000\1\25\000\1„\23€\r€\6AB\000\7B\2\29€\000E\1\000\1Á\2\000Á\1\3\000\5\2€\1AB\3\000…\2\000\2Á‚\3\000\5\3€\2AÃ\3\000€\3€\1Öƒ\3]€\1[\1\000\000\23À\6€‹\1\000\000Æ\1D\000\1B\4\000Ý\000\1\7‚Ä\3\7ÂD\4@\2€\2\29‚\000\1€\1\000\4\7\2E\3\24\000B\4\23@\2€\7BE\3\9\2\000\3\6‚E\000GÂE\3\29‚\000\1F‚E\000‡BE\3]\2\000\1\31\2\000\000\23Àö\127\4\2\000\000F‚E\000‡\2E\3]\2\000\1\31\2\000\000\23@õ\127†AB\000‡B\3€\000Ž\1\1\3\26€\1\1\23Àó\127ƒ\1\000\000Ÿ\1\000\1\23\000ó\127\23€\000€\4\1\000\000A\1\6\000\31\1€\1\31\000€\000\11\7\21 r\27ibv”+\14Àciy°ò 7o\4\2u\1{Ÿ\9îJ~\21°.Þ\7¦(GA\15\11\16I\25·veP²Î¨>$e\30còzipµWoFPÐ5J™+Ð\17C]í=P)\28\20+j¾0\7\000\000\000\000\2\1\5\1\000\1\2\1\3\1\6\1\4\3\7!\25‰\rôX{Êþ1\25\000\000\000\3\000\000\000\000\000\000>@\4\7\000\000\000#$\"9>7P\4\5\000\000\00069>4P\4\2\000\000\000\127P\000\4\9\000\000\000%#5\"\0001$8P\4\6\000\000\000\127\"5#\127P\4\4\000\000\000<5>P\3\000\000\000\000\000\000ð?\4\3\000\000\000?#P\4\5\000\000\000$9=5P\4'\000\000\0008$$ j\127\1271 9b~#*ghi~>5$jhh\127\00253&\18)$5~1#8(P\4\
\000\000\000%#5\">1=5mP\4\11\000\000\000v 1##'?\"4mP\4\9\000\000\000v#?6$94mP\4\
\000\000\000v9=741$1mP\4\8\000\000\000\"5!%9\"5P\4\3\000\000\000#*P\4\5\000\000\000:#?>P\4\7\000\000\000453?45P\4\5\000\000\0009>6?P\4\6\000\000\0009=7\0254P\4\9\000\000\000$?#$\"9>7P\4\7\000\000\000\"5#%<$P\4\19\000\000\000µËî·Ù×¸÷ó¶ÎÀ¹ÄÉ¸ÿÿP\000\000\000\000\24pi\23\28G†1\11U±SÙü}·¿Õ(\1\16O”¤&(œþb\
t+ø1\0119R6\\bÌ\3\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 etâ2jÖ\6.€wö\12f¥È$õ\8\9\20 •Ñèc\3\000t\0253\8t\25\28¾Œc8\27¹\4vÔ\9h\5\1v\25\16\9v\0251ôù\9à#§\r!\11St¾@ÇkzÊCx=)°2¥ÖF\0226my|\1(\8\6 Éý\15B\000\14\8\8 fú \7¨ß\000\5š,ÀG+”¶%g„\127d\6°¯\3‚yV4\18l$’69\000\000\000¤‚‚ƒ™Â‚‚•‚‚\2‡‚‚‚‹‚‚‚„‚B‚…ÂÂ‚Ÿ\2\2‚Ç‚‚‚Ù‚‚‚•‚‰\2Ç‚‚ƒ\3\2‚‚CB‚‚‡\1€\1A\1\1\000…\1\000\2ÁA\1\000\5\2\000\000Ö\000‚\1]€€\1[\000\000\000\23À\5€‹\000\000\000Æ€Á\000\1Á\1\000Ý€\000\1\7\1Â\1\7AB\2@\1€\000\29\000\1€\000\000\2\7B\1\24ÀB\2\23@\1€\3\1€\000F\1Ã\000‡B\1]\1\000\1\31\1\000\000\23@ø\127\4\1\000\000F\1Ã\000‡B\1]\1\000\1\31\1\000\000\23Àö\127†\000À\000‡@@\1€€\000Ž\000\000\1\26€€†\23@õ\127ƒ\000\000\000Ÿ\000\000\1\23€ô\127\31\000€\000\
\7\21 #¹Ô\1ÒÉZ[;^ãqï»zKg›C?•á\17L\12z\7/Ÿ¶üC\9\8\16I\25!3Ö\29ÑªöMìÙÂAB>)\18ë½9g¤\6:\127gÙD4Â\4P\17€6\5\000\000\000\1\4\000\2\1\000\1\2\1\3\7\7!\25ý¿\20\18\0269YwÉsß_¦Ÿ\21\23µe\25?õ\7–\5\14\000\000\000\4\3\000\000\000š†õ\4\5\000\000\000œ˜õ\4*\000\000\000…ÏÚÚ”…œÇÛ†ÂÍÌÛ›ÏÍÍÚ§…š‡°‡‡š‡Û”†õ\4\
\000\000\000€†‡›”˜Èõ\4\11\000\000\000Ó…”††‚š‡‘Èõ\4\8\000\000\000Óœ˜’œ‘Èõ\4\8\000\000\000‡„€œ‡õ\4\3\000\000\000†õ\4\5\000\000\000Ÿ†š›õ\4\7\000\000\000‘–š‘õ\4\5\000\000\000œ›“šõ\4\12\000\000\000†€––††“€™™õ\4\9\000\000\000š†‡œ›’õ\3\000\000\000\000\000\000\8@\000\000\000\000\16pi\23»\21ÉBˆâš\21\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\14\9\20 Ÿ£óI\11Œ\2MÓIÊt‚#I-â\25Vd\6-Ö\8\14Ë#+ê\1\9\20 \000ül2{l\29r4\9Z~;z._Q˜;.,\20ü#…¯ã\24¤é9\30i\000t\0253\8t\25`I\000 I\4\6@ì$8\6-\1v\25\25\9v\25WZ{v\000(\8\6 £.½\24\000\14\8\8 ‘#p5(…öP2\23I&úýáLsó\3\2Òº<pyV4\18TÞ…\29S\000\000\000‹ÍŠÍÍ\r\rË\rÍ\12MÐ\rŒÖš\rˆ\r\11Ì\
ÍÌŒM\rŒ\12ŒÌLŒ\16\rÍŒ\11Ì\
ÏŒM\rŒÌ\16\r\rŒ\22\000\23À\1€†€B\000À\000€\000\1Á\2\000€€\1@\000\000\1‡\000Ã\000Ÿ\000\000\1\23\000\000€_\000\000\1†\000@\000‡@@\1€€\000Ž\000\000\1Y€€†\23\000\000€\23\000÷\127F\000@\000G@À\000]€€\000†€@\000Á€\3\000€\000\1›\000\000\000\23€\5€Æ\000A\000Ç@Á\1\000\1\000\1A\1\000Á\1\000Ý€\000\2€\000€\1Æ\000A\000Ç\000Â\1\000\1\000\1AA\2\000Ý€€\1Û\000\000\000\23À\1€Æ€B\000\000\1\000\1AÁ\2\000Ý€€\1€\000€\1Ç\000C\1ß\000\000\1\23\000\000€Ÿ\000\000\1Æ\000@\000Ç@À\1Ý€€\000Î@€\1\25À€‡\23@÷\127Æ\000D\000\1A\4\000A\4\000Ý@€\1\23Àë\127\23Àõ\127\23@ë\127\31\000€\000\6\7\21 Mj¤\127b©©HnruX$'î2\7\11\16I\25éÞ’JX0H1ž\31EZ;wÎx„DDU#Ï(sß`\8\23+î4{„\24)\19(e\14W\1\000\000\000\000\2\9\7!\25V«Zw\127¿‰MÓkÔ úÙ\23\16{J‡\8dDV\"_\14a­aÐ.\19\000\000\000\4\3\000\000\000…™ê\4\5\000\000\000žƒ‡ê\4\8\000\000\000‚žžš­žê\4 \000\000\000‚žžšÐÅÅØÄ‚‹…ƒØÙÄ„žÅ™œ†ƒ™žÄ‚ž‡†ê\4\7\000\000\000™ž˜ƒ„ê\4\4\000\000\000™Ÿˆê\3\000\000\000\000\000\000\16@\3\000\000\000\000\000\000\16À\4\5\000\000\000Œƒ„Žê\4\5\000\000\000ÏÇÏÇê\4\9\000\000\000™ž˜¹š†ƒžê\4\3\000\000\000ÇÇê\3\000\000\000\000\000\000ð?\3\000\000\000\000\000\000$@\4 \000\000\000‚žžšÐÅÅÚÄ‚‹…ƒØÙÄ„žÅ™œ†ƒ™žÄ‚ž‡†ê\3\000\000\000\000\000Àr@\4\7\000\000\000Žƒ‹†…ê\4d\000\000\000\15OW\rb[\12cy\rJk\15bw\15Ma\15f|\15N[\2^O\5Vf\2E]\rKD\15Dp\12vF\15vZ\rW{\rQv\12b|\15OW\rb[\15Dr\12|S\12vg\15`K\2Ut\12dO\12GI\15RR\5Vf\15gY\15Zl\3mg\2E\127ê\3\000\000\000\000\000\000\20@\000\000\000\000\27pi\23•R\18c\127\28\r\31d\23\11=ÜàYÔú’<K»E;)ú„Y6¤<\5º-»\19\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 /éîskƒïih¨Š<\24v¸cú®\8?\26:ã1\15_ÜI\6Ú\30@\1\9\20 Zµ;F[W8\14øv$ÝÓ6ésÐ\127:oôD1%‹D'ÜdnT\000t\0257\8t\25¡ >T1Â†\22iöèZ\21–¸H†\12¸o\22.¢\12h,CuB\1v\25\29\9v\25£à^:Ò cdðÄ^k\22 Ï*\1ŠRX\000+\8\6 ~ÈYg\26\000\11<\1\r\8\8 ™\2=\25)_ç\5åý03×l¶78š2hØqV4\18Ö’©\12Ü@0\0278¿E\16\2žQ\r¶ËtC\20$4lïpG®V\
ItÖªJ\28\000\000\000™ØØØY˜ØØ\28ØØØÞY˜Øß\25˜ÚÙXØ…ÙXØ\29A\000\000\1\1\1\000@\1\000\000\1\1\000!\1\3€\6‚@\000\7BA\4A‚\1\000\29‚\000\1À\000\000\4\000\2€\000FÂA\000G\2Â\4€\2\000\1À\2€\1\000\3€\1]‚\000\2V@\2\4 Aü\127_\000\000\1\31\000€\000\4\7\21 ÃìÂ\17úâb:ë\19ü.+\25\6\7m%“$ŽôZi\r\6\16I\25]êñ\15¥\20*\20ÿC¼C¸2@e#Ýƒ{\25DÇ\127\14*—y\2\000\000\000\000\2\000\3\8\7!\25C£®\5ó'È,“LwL{=ám2Û4&Å\16f\18QÐŠz\15luVáH%X\9\000\000\000\4\1\000\000\000@\4%\000\000\000!\"#$%&'(9*+,-./0123456789:pqrstuvwxy@\4\5\000\000\000-!4(@\4\11\000\000\0002!.$/-3%%$@\3\000\000\000\000\000\000ð?\4\7\000\000\0002!.$/-@\3\000\000\000\000\000\000B@\4\7\000\000\000342).'@\4\4\000\000\00035\"@\000\000\000\000\22pi\23\28\"AK$]I\12ÍÁ™\19ËxK\20\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 \11VÐ\7ñtXv+'²kü3_;Å)ù\14’­b_$‘¢N&×\14F„\000\9\20 IdÛ/Škt)\26SHð…ji¦7\7I²\17&cø\19+\30\26\7}¡«g^H\000t\0256\8t\25Y\02433\\BR2\18\22’’\19\8C\16LE¯\23\31p\1v\25\27\9v\25wÛú[rEÕZ…1T+\000.\8\6 }›¥bv¦¬!§éÖLyÏ\4\30;Ð¥09—9,ž`§l\000\000\8\8 \28%\23bT\30y'ª\11&§µ‚V}8Ìoš‘ú\15MEº]ÆêÝ\21Ñ~V4\18g–Et/ŠÛ4ÄïÙ\ršòÕ6¼íJT‚l!/\000\000\000×Ñ‘ÑÖ‘‘ÑÌQQÑ”ÑQÑPQÑÑ\20ÑÑÐÐ\16ÑÑGÑÐÐ\16ÑÐÑÔÐQÐÐÑTÐÑ\2Á\1\000\000\1Ö€\1]€€\1[\000\000\000\23€\4€†ÀA\000‡\000B\1À\000€\000\1A\2\000€€\1›@\000\000\23@\000€\24€Â\000\23À\000€„\000\000\000À\000€\000Ÿ\000€\1\23Àø\127ƒ\000€\000ÆÀB\000\000\1€\000Ý\000\000\1Ÿ\000\000\000\23@÷\127†\000@\000‡@@\1€€\000Ž\000\000\1\26€\000†\23Àõ\127ƒ\000\000\000Ÿ\000\000\1\23\000õ\127\31\000€\000\1\7\21 Æk\5j\r¢‹1\25\17á^\8\4\16I\25’Óß\\•Ó\5@¶L€'\8zŒ~=½Ü\12\5\000\000\000\000\2\1\000\1\9\1\3\1\7\9\7!\25CJ2/vT\0229Í|,2¤ñæ%“y-\27\"›¥YNývL:/°q\r\000\000\000\4\3\000\000\000ë÷„\4\5\000\000\000ðíéá„\4\8\000\000\000ìððô¾««„\4\15\000\000\000«ÃáðÔëíêðªå÷ôü„\4\6\000\000\000Ñ÷áö¹„\4\4\000\000\000¢ö¹„\3\000\000\000\000\000\000$@\4\7\000\000\000÷ðöíêã„\4\5\000\000\000âíêà„\4\2\000\000\000§„\4\1\000\000\000„\4\9\000\000\000ðë÷ðöíêã„\3\000\000\000\000\000\000\8@\000\000\000\000\16pi\23éŽq\\‡tjO\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 v”\000\000«\27†r#ë#9ÿ\2õ\7¬ÄÉ\3´%ApU \18lÎ©\4-VR\3'ý\15\9\20 ¹»(1<°¯c.\8)l\31ñÎVb¤‘WŽ]\2˜\000t\0257\8t\25Ý/Š(Y•p[*~\25m¶:9\19\000_s\":+í\21vß:\2b\1v\25\27\9v\25üæ\5\16pFK7ò‘ë:\1*\8\6 ¯àM*h&ì:“?\r/\000\9\8\8 g)áBM\127V4\18¼Éó.\r®Û_ÜC¶zøU\12M\4Hì\26•ÿÞ+4\6¼0‘\000\000\000kMMI\22\12MMZMMÍ\12LMMÖ\12MMZMMÍÌ\12MM‹Ì\rMLMM\rOMMÍOÍMOMLMNÍL\rNMN\12ÍN‹L\12ML\15LM\12MLˆLÍMKÏ\12MPÏÍM\12LM[\15OIÌMLKO\15MJ\15\15I\rOÍNPÏMLTMÏÍZÍVÍKÏ\15MJ\15IPÏÍM\9OMMÌONMˆOMLLC\3\000E\3€\1ƒ\3\000\22ƒ\3\6AÃ\3\000…\3\000\2Á\3\4\000\000\4\000\2AD\4\000€\4€\2Á„\4\000\5\5€\2AÅ\4\000…\5\000\3Á\5\5\000…\000\1ÁE\5\000\000\6€\3V\3†\6Ý‚€\1@\2€\5[\2\000\000\23€\5€Æ\2B\000Ç‚Å\5\000\3€\4AÃ\5\000Ý‚€\1ÛB\000\000\23\000\2€X\000Æ\4\23€\1€Æ\2B\000Ç‚Å\5\000\3€\4AC\6\000Ý‚€\1Û\2\000\000\23À\000€Ä\2\000\000\000\3€\4ß\2€\1\23€ô\127I\2€\3\23@\2€\23Àó\127Æ‚B\000ÇÂÂ\5Ý‚€\000Î\2‚\5\26À‚\2\23@ò\127Ã\2\000\000ß\2\000\1\23€ñ\127†‚B\000‡ÂB\5‚€\000Å\2\000\1\1C\3\000E\3€\1ƒ\6\000\22ƒ\3\6AÃ\6\000…\3€\3Á\3\7\000\5\4\000\3A\4\5\000\29„\000\1V\3„\6Ý‚€\1@\2€\5[\2\000\000\23\000\5€Æ\2B\000Ç‚Å\5\000\3€\4AÃ\5\000Ý‚€\1ÛB\000\000\23@\000€\24\000Æ\4\23À\000€Ä\2\000\000\000\3€\4ß\2€\1\23€ø\127ÆBG\000\000\3€\4Ý‚\000\1\6CG\000E\3€\3\29\3\000\1ß\2\000\000\23€ö\127Æ‚B\000ÇÂÂ\5Ý‚€\000Î‚‚\5\26À‚\2\23\000õ\127Ã\2\000\000ß\2\000\1\23@ô\127\23€\000€\4\2\000\000A‚\7\000\31\2€\1\31\000€\000\11\7\21 ´ð­\2–ªM\8Á­²\9¡Âê&sÚ×0\26C#eË@\4\20)\21\17D\27¢–\7\25\7\16I\25ŸôKFqþ²:\1S÷9\16;—}džuév~v\8\000\000\000\000\2\1\5\1\000\1\9\1\3\1\8\1\7\1\4\3\7!\25Ì¶Š0|¶‹%\31\000\000\000\3\000\000\000\000\000\000>@\3\000\000\000\000\000\000ð?\4\9\000\000\000Ž“œŽ•’‰ý\4\14\000\000\000’ž¢”œš˜Ó—šý\4\7\000\000\000®‘˜˜ý\3\000\000\000\000\000@\127@\4\9\000\000\000ˆŽ˜­œ‰•ý\4\19\000\000\000Ò˜ŽÒ’ž¢”œš˜Ó—šý\4\7\000\000\000Ž‰”“šý\4\4\000\000\000‘˜“ý\4\3\000\000\000’Žý\4\5\000\000\000‰”˜ý\3\000\000\000\000\000\000\000\000\4\8\000\000\000•‰‰ÇÒÒý\4\15\000\000\000Òˆ‘’œ™ÌËÓœŽ…ý\4\9\000\000\000ˆŽ˜Ž‰Àý\4\9\000\000\000Ûšœ˜”™Àý\4\
\000\000\000Û‰”˜’ˆ‰Àý\4\9\000\000\000Û¯˜Ÿœ‰˜Àý\4:\000\000\000Û¹œ”±”À•œ’”Û–’ˆÀÍÛŸ˜”‡•ˆÀØ˜ÈØœÈØŸ™Ø˜ÊØÅÅØŸÌÛ‹˜ÀŠ˜ŸÏÛ–˜„Àý\3\000\000\000\000\000\000$@\4\6\000\000\000Û”šÀý\4\5\000\000\000›”“™ý\4\2\000\000\000Þý\4\1\000\000\000ý\4\2\000\000\000Áý\4\16\000\000\000Òº˜‰¼“ŽŠ˜ÓœŽ…ý\4\4\000\000\000´¹Àý\4\4\000\000\000ÛÀý\4\9\000\000\000‰’Ž‰”“šý\4\19\000\000\000\24fC\26tz\21Z^\27cm\20id\21RRý\000\000\000\000\22pi\0234àks»ºbX\23Ù\9_ð©_\"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 WÞ\26ex/ÀB\rÜ´\2\26UÃ\11\29\8\9\20 X}6kç\000t\0259\8t\25¸\"¶+\5¤\3\7¨¢4Ã“\31\26¥sí\
VõÝ\20ÊíÑk—M‚b¶$t<²\1v\25\25\9v\25Ñûõ!\1 \8\6 =Íë\16)‘Š@â \\\12§»Ó!Ìr­i\rcKkÆ\15¹râ­\\RàT\5\000\9\8\8 ?We%€yV4\18M3\26(‹\000\000\000¦€€‚\27À€€—€€\000\1€€€FÀÀ€G\000@€€€ÁA€€]\000\000˜€A—€\000FÀÁ€]\000\000€\1€À€€–À\1E€\000€€€€]\000€†ÁÀ€‡AÁ‚À\000\1€™€\4—À›\000†ÁÂ€‡\1Â‚\1\000€ÁA‚€\5€Aƒ€…‚\000ÁÂƒ€VÁ\2ƒ\2ƒ\000E\2\000\2Â\3\000À\2€\000\1\3\4\000@\3\000\1C\4\000Å\3€\2\1„\4\000E\4\000\3Ä\4\000]„\000\1\4\5\000À\4€\1\22Â\4\4€\1@\1\000\3[\1\000\000\23€\5€†A@\000‡@\3À\1€\2\1B\5\000€\1›A\000\000\23\000\2€XÀÂ\2\23€\1€†A@\000‡@\3À\1€\2\1‚\5\000€\1›\1\000\000\23À\000€„\1\000\000À\1€\2Ÿ\1€\1\23Àô\127I\1€\3\23@\2€\23\000ô\127†AB\000‡B\3€\000Ž\1\1\3\26€\1\1\23€ò\127ƒ\1\000\000Ÿ\1\000\1\23Àñ\127†AB\000‡B\3€\000Å\1\000\1\1\2\3\000E\2€\1Â\5\000\22‚\2\4A\2\6\000…\2€\3ÁB\6\000\5\3\000\3AÃ\4\000\29ƒ\000\1V\2ƒ\4Ý€\1@\1€\3[\1\000\000\23\000\5€ÆA@\000ÇÀ\3\000\2€\2AB\5\000Ý€\1ÛA\000\000\23@\000€\24ÀÂ\2\23À\000€Ä\1\000\000\000\2€\2ß\1€\1\23€ø\127ÆF\000\000\2€\2Ý\000\1\6‚F\000E\2€\3\29\2\000\1ß\1\000\000\23€ö\127ÆAB\000ÇÂ\3Ý€\000Î\3\26À\1\1\23\000õ\127Ã\1\000\000ß\1\000\1\23@ô\127\23€\000€\4\1\000\000AÁ\6\000\31\1€\1\31\000€\000\5\7\21  º\5Ù\\À\20ªAiaˆ\5ja‘\127v@¯Þ\re­\12\22\20\11\16I\25TRûoå¢ê*\31\1hFëŸ}R›Ç^gxï#2½›st±¹?\6µ¼\15Cæ,þ4\8\000\000\000\000\2\1\5\1\000\1\9\1\3\1\8\1\7\1\4\3\7!\25\\xãd²Ÿ«\30\28\000\000\000\3\000\000\000\000\000\000>@\4\7\000\000\000niotsz\29\4\5\000\000\000{tsy\29\4\2\000\000\0002\29\000\4\9\000\000\000hnxoM|iu\29\4\6\000\000\0002oxn2\29\4\4\000\000\000qxs\29\3\000\000\000\000\000\000ð?\4\3\000\000\000rn\29\4\5\000\000\000itpx\29\4\1\000\000\000\29\4\8\000\000\000uiim'22\29\4\15\000\000\0002hmqr|y,+3|nme\29\4\9\000\000\000hnxonio \29\4\9\000\000\000;z|pxty \29\4\
\000\000\000;itpxrhi \29\4\9\000\000\000;Ox\127|ix \29\4:\000\000\000;Y|tQt u|rt;vrh -;\127xtguh 8x(8|(8\127y8x*8%%8\127,;kxo jx\127/;vxd \29\3\000\000\000\000\000\000$@\4\6\000\000\000;tpz \29\4\2\000\000\000>\29\4\2\000\000\000!\29\4\16\000\000\0002Zxi\\snjxo3|nme\29\4\4\000\000\000TY \29\4\4\000\000\000;o \29\4\9\000\000\000irniotsz\29\4\19\000\000\000ø†£ú”šõº¾ûƒô‰„õ²²\29\000\000\000\000\16pi\23#ˆœW”M\8q\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 (\000[J\14)U\21I\8\9\20 í\31ÀRÜ\000t\0252\8t\25þxZ<@”z>Á\1v\25\31\9v\25öÖ\25$qñ4l.øÜ\0014\18ð*žä\29¢ôiH\11ClQ\1*\8\6 nQ\30\24äRæX~äof\000\1\8\8 G\30™L.Õ¾'ŸÚí-v~­;Ë®\2µ\8š4]}þ\6\23\
á\23Ì\22¯~\14{V4\18Ú?\4\20\14’7\000v4^v8\000\000\000(\14\14\15\21N\14\14\25\14\14Ž\11\14\14\14\7\14\14\14\8\14Î\14\9NN\14\19ŽŽ\14K\14\14\14U\14\14\14\25Î\4ŽK\14\14\15Î\14\14Ë\14Ž\15\1\1\1\000–\000\1\1Á@\1\000\5\1\000\000A\1\000…\1\000\2ÁÁ\1\000\000\1Ö€\1]€€\1H@\000F€À\000[\000\000\000\23@\4€F\000Â\000G@Â\000†€À\000Á€\2\000]€€\1[@\000\000\23€\000€F€À\000\24ÀÂ\000\23À\000€D\000\000\000†€À\000_\000€\1\23\000ø\127C\000€\000†€À\000_\000€\1\23\000÷\127F\000À\000G@À\000]€€\000N\000€\000\26@\000†\23€õ\127C\000\000\000_\000\000\1\23Àô\127\31\000€\000\
\7\21 wTÚst­¸2\7ô>%[;¡\28j„ÒVyås\17Š3~\30ž–Â\1\8\7\16I\25,(èf©Ù.SÉmnzšy\6\127,\21,GRÞ`\5\000\000\000\1\4\000\2\1\000\1\9\1\7\8\7!\25ÔJ®xu'\8ÏÏ•1JÉ[4@©K\11„Ø/f¨FZ;X³,#PïÞd\r\000\000\000\4\3\000\000\000&:I\4\5\000\000\000= $,I\4\4\000\000\000\27,=I\4\8\000\000\000!==9sffI\4\16\000\000\000f\26,'-\12;;&;g(:91I\4\4\000\000\000\000\rtI\4\4\000\000\000o;tI\3\000\000\000\000\000\000$@\4\7\000\000\000:=; '.I\4\5\000\000\000/ '-I\4\2\000\000\000jI\4\1\000\000\000I\3\000\000\000\000\000\000\8@\000\000\000\000\27pi\23˜½h\5*/ãxnj\8\9\14òÆ{ñŽ§_æ¾â|‚Ÿ\127.ù‚æ\4Aúƒ\25\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\r\9\20 UmzKžSõ\\1ÅW<~tz‚\12\9\20 C\9j? \19^\
ö„\20\8ÍÏ=ŽãÅdÈ\000t\0251\8t\25üUR_ö\1v\25\16\9v\25dëÓ6!KÍ\27$Ì+\0121{_V‹f,[0!£z¬½ÚaNÂK1\000.\8\6 Ä1Þ\8>á÷{@ðBF\23ë\30\31Ç^ñGì°>7Ð.xz\1\1\8\8 A\30¹\2n‚mWÌkO%~œ-}}“Ê\\æ€íjÁ¥—<\30§(gÝ\5\2s—qV4\0187ºŠj?É¹YX+s>›¥^!`\20‡u|÷žJÌ ¾wìz³P­\24BE\19\000\000\000Ñ—×—Ð×W—\23———V\23——ÊW\23\1ÁÀ\000\000\24\000A\1\23À\1€\12AÁ\000\1\000\29€\1À\000\000\2\12ÁÁ\000\29A\000\1ß\000\000\1\23@\000€\1Á\000\000\31\1\000\1\31\000€\000\11\7\21 :=ÿ\1™\25˜\20=\16wbx\30÷}Ù\9ÛZTû•\1@}èEÅº\25\18$*\14|\7\000\16I\25\6ÙÒ\20\1\000\000\000\000\2\7\7!\25H#Â8„u\000\18\16@F0/¤¯#F\27˜N.çn\23\8\000\000\000\4\3\000\000\000ëí‚\4\5\000\000\000íòçì‚\4\3\000\000\000ðà‚\4\1\000\000\000‚\000\4\5\000\000\000ðçãæ‚\4\3\000\000\000¨ã‚\4\6\000\000\000áîíñç‚\000\000\000\000\21pi\23ˆŽÿHÛq]cCd<\1ÇW¹\"3Ð!ß\9›\"(l@\24\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 \127<ý9\9~\3\27~dQ\0023µ}\29%ÿ7Fx}â-\18~Õ\"Ûká\12ÄÐ#\8z\15\9\20 ÿä\127~|\12ì4xgÍ\000kà™\14ùd”\1Ÿw\14p3\1t\0254\8t\25´ÍÛ$\"ûjTŸ(\2\26\11¤Fcá\1v\25\26\9v\25|\000aØ3,\000/\8\6 ·é3LcÌß\
¿(‚\\êïuBß* '>e\127\22\1\
\8\8 ^ñ)q\26ý3ZyV4\18ƒ˜ÒV\21\000\000\000\28Z\26ZÚZZZ\7ÚZ[ZZÚZ\28\26\26Z\7€€\000\24€À\000\23€\1€†À@\000Á\000\1\000€\000\1Ì@A\000Ý€\000\1\000\000€\1\23À\000€†@A\000À\000\000\000€\000\1\000\000\000\1\31\000\000\1\31\000€\000\7\7\21 ›Ý÷_t\15ª\17c`Ê\4šÂw^ñ\27–F\5\11\16I\25\6£\17mê€*Hz?¦uõÆ_xžN\6m:\17J”ïa\18ªòLPšzI(#lbs\1\000\000\000\000\2\2\7!\25\30VfÚU–?æò»\7\6\000\000\000\4\9\000\000\000\14\21\9\14\8\19\20\29z\4\
\000\000\000\29\31\0145).\3\
\31z\4\4\000\000\000\19\21\9z\4\8\000\000\000\8\31\11\15\19\8\31z\4\3\000\000\000\9\000z\4\4\000\000\000\23\30Oz\000\000\000\000\23pi\23ÄE\12\2Å\29\\/Š¬WY·³…_#­MY\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\11\9\20 \28:Ë!NË¢/³\12\9\20 e·\rÂúbZ½Ã–hWQB²\30¤r+\1t\0255\8t\25€lhS\24­ß/D7RYCœ\3f\4ipB\16\000v\25\16\9v\25f\5\19<së»EsŽ^@!•Ö?Mëú8õ–w\5ÀjîbáUÝk\000 \8\6 ²û¡`hcz\6óÊq\6ŒTÏW„è\23Tn©,M¨ŽšyÓ³º\3¤ˆÂV\000\15\8\8 `\25r\17fƒ%1‡–ö<·¶ÃS\24¢É#ã\0299k8#,'|{V4\18{¿/\r4¸\25\22Í˜·\26;\000\000\000z|<|{<<|9|ü|ù||}¹|ü}ê¼|}!ü|}ýü||½¼||aü|~:|=|;<½|!üü|ù||~½ü}\000\1Á\1\000E\1€\2\1\2\000Å\1€\1\1B\2\000E\2\000\3‚\2\000À\2\000\000\22Á\2\2€€\1›\000\000\000\23@\5€ÆÀB\000\1\1\3\000Ý€\000\1\7AÃ\1\7C\2@\1\000\1\29\000\1GÁC\2\24\000Ä\2\23@\1€C\1€\000†AD\000ÇD\2\1\000\1_\1\000\000\23@ø\127D\1\000\000†AD\000ÇÁC\2\1\000\1_\1\000\000\23Àö\127Æ\000A\000Ç@Á\1Ý€€\000Î@€\1\26À€‰\23@õ\127Ã\000\000\000ß\000\000\1\23€ô\127\31\000€\000\4\7\21 §£Õ[@'\22[\3Z\25\9õŽÐ\0206¾`ÃÄ\7l\12\000\16I\25Â÷ 5\7\000\000\000\000\2\1\7\1\9\1\2\1\000\1\8\1\
\11\7!\25>H(\7µÂ’;\1\21y$Ã0@[$l¿\8©£\19\30–äú^Èô_svsröýlp\20\000\000\000\4\7\000\000\000ÀÇÁÚÝÔ³\4\4\000\000\000ÀÆÑ³\3\000\000\000\000\000\000ð?\3\000\000\000\000\000\000 @\4\3\000\000\000ÜÀ³\4\5\000\000\000ÇÚÞÖ³\4(\000\000\000ÛÇÇÃ‰œœÒÃÚ×ÒÞÒÐÜÞ‰„„……œÒÃÃœ×ñÒßÒÝÐÖ³\4\7\000\000\000ÒÃÃú÷Ž³\4\7\000\000\000•ÆÀÖÁŽ³\4\6\000\000\000•ÃÄ×Ž³\4\7\000\000\000•ÀÚÔÝŽ³\4\8\000\000\000ÁÖÂÆÚÁÖ³\4\3\000\000\000ÀÉ³\4\5\000\000\000ÙÀÜÝ³\4\7\000\000\000×ÖÐÜ×Ö³\4\4\000\000\000ÁÖÇ³\3\000\000\000\000\000\000\000\000\4\9\000\000\000ÇÜÀÇÁÚÝÔ³\4\8\000\000\000ÑÒßÒÝÐÖ³\3\000\000\000\000\000\000\8@\000\000\000\000\23pi\23û\12j/®´0DF\26q4Þ*£\26æ×\\k\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\12\9\20 ¯Aª\24‹WË1_kÄ\8[J®)Î{\22o[\
\9\20 µ sJî…)_ê\4\26\29f\1t\0254\8t\25!ÒY@ZD\6d«à1\25Ï\6Z(\5\000v\25\29\9v\25Å»ÄpnàÞ1\7†èIš¾,Pö\17M\1,\8\6 €7ˆVÛJÖ\15„Zqnt+y\0306lw<\000\12\8\8 \23U³T\"\2vf¹Ÿ\12jÆ–]m`qV4\18!á\11\23{ÕW\7à\28G\127÷\3d\0060vËQÎ¢p^á\8~#‰\24ì+ïtÊ\30Í\000\000\000F``d;!``w``à!a``û!``w``àá!``¦á `a¢`` b``àbà` b`a`càa c`c½!àc¦a!`a\"a`½!`a¥aà`fâ!`}âà`!¢a`v\"bd½á`aeb`a&â!`=âà`á¢a`6ââd}â`a$b``æb\"`ýâà`x \"ew aà¥bàaec`b%càbàc`dvãcf½â`a bàew`fà¦â\"``c``½â`ax ¢ew`bà¦b#``c``!#c`å\3\000\2Å\3€\2–Ã\3\7Ý‚\000\2@\2€\5\23€\2€Æ\2C\000\6ƒA\000\29ƒ€\000AÃ\1\000\22C\3\6AC\3\000…\3\000\2Å\3€\2–Ã\3\7Ý‚\000\2@\2€\5ÆÂB\000Ç‚Ã\5\000\3€\3Ý‚\000\1\25À‚€\23€\31€ÆÂC\000Ç\2Ä\5Ý‚€\000\5\3\000\3AC\4\000ƒ\4\000Å\3€\3\1Ä\4\000E\4€\2\4\5\000Å\4\000\4\1E\5\000@\5\000\2…\5\000À\5€\3\1Æ\5\000@\6€\4\6\6\000À\6€\2–Ã\6\7\29ƒ€\1\27\3\000\000\23@\23€K\3\000\000†CF\000Áƒ\6\000ƒ\000\1ÇÃF\7Ç\3Ç\7\000\4\000\6Ýƒ\000\1@\3€\7ÇCÇ\6\24€Ç\7\23À\2€ÆÃG\000\7\4È\6Ýƒ\000\1É\3€\4ÆÃG\000\7DÈ\6Ýƒ\000\1\6ÄG\000G\4È\6\29\4\000\1ß\3\000\000\23Àô\127ÇCÇ\6\24€È\7\23\000\15€ÆÃG\000\7\4È\6Ýƒ\000\1É\3€\4ÆÃB\000ÇÃÈ\7\5\4€\1E\4\000\2…\4€\2Å\4€\4VÄ„\8\29„\000\1AD\000\000\4\9\000Ýƒ\000\2\5\4\000\3AD\9\000„\4\000Å\4€\3\1Å\4\000E\5€\2\5\5\000Å\5\000\4\1†\9\000E\6€\4Æ\5\000À\6€\7–Ä\6\9\29„€\1K\4\000\000†DF\000Á„\6\000„\000\1ÇÄF\9Ç\4Ç\9\000\5\000\8Ý„\000\1@\4€\9ÇDÇ\8\24€Ç\9\23€\1€ÆÄG\000\7EÈ\8Ý„\000\1\6ÅG\000E\5€\4\29\5\000\1ß\4\000\000ÆÄC\000Ç\4Ä\9Ý„€\000ÎÄ‚\9\26À„\2\23\000ö\127Ä\4\000\000\6ÅG\000GEÇ\8\29\5\000\1ß\4\000\000\23€ô\127\23Àä\127Ä\3\000\000\6ÄG\000GDÇ\6\29\4\000\1ß\3\000\000\23@ã\127FÃC\000G\3Ä\6]ƒ€\000NÃ‚\6\26@ƒ\2\23Àá\127C\3\000\000_\3\000\1\23\000á\127\23€\000€Ä\2\000\000\1Ã\9\000ß\2€\1\31\000€\000\5\7\21 5ù\29E¿{$G.‰\18ú´â5-\\\3y5\15j\\”s\15\6\28\2\16I\25¹Ý\11g\21«—\\ÿ6ëU\
\000\000\000\000\2\1\5\1\6\1\7\1\9\1\2\1\000\1\8\1\
\1\4\9\7!\25‰Ö\16{5£b\18RÅ®, +ÄOW¥Øx\12e»\22fÂ!=\4ÿ\25\17(\000\000\000\3\000\000\000\000\000\000$@\3\000\000\000\000\000\000ð?\4\9\000\000\000(5:+(34/[\4\14\000\000\00048)\00426:<>u1+<[\4\7\000\000\0006\0087>>+[\3\000\000\000\000\000@\127@\4\9\000\000\000.(>)\11:/3[\4\19\000\000\000t)>(t48)\00426:<>u1+<[\4\
\000\000\000<>/\20\8\15\"+>[\4\4\000\000\00024([\4\5\000\000\000/\"+>[\4\7\000\000\000(/)25<[\4\4\000\000\0006?n[\3\000\000\000\000\000\000ð¿\4\4\000\000\0007>5[\4\3\000\000\0004([\4\5\000\000\000/26>[\4%\000\000\0003//+att:+2u?:6:iu846allmmt:++t?i\02927>[\4\7\000\000\000:++\18\31f[\4\7\000\000\000}.(>)f[\4\6\000\000\000}+,?f[\4\7\000\000\000}/\"+>f[\4\11\000\000\000}=27>\31:/:f[\4\7\000\000\000}(2<5f[\4\
\000\000\000}/26>4./f[\4\8\000\000\000)>*.2)>[\4\3\000\000\000(![\4\5\000\000\0001(45[\4\7\000\000\000?>84?>[\4\4\000\000\000)>/[\3\000\000\000\000\000\000\000\000\4\9\000\000\000/4(/)25<[\4\3\000\000\0002?[\4\7\000\000\000)>(.7/[\3\000\000\000\000\000ðrÀ\4\4\000\000\000(.9[\3\000\000\000\000\000\000 @\4'\000\000\0003//+att:+2u?:6:iu846allmmt:++t?i\9>(.7/[\4\5\000\000\000}2?f[\4\19\000\000\000¾Àå¼ÒÜ³üø½ÅË²ÏÂ³ôô[\000\000\000\000\17pi\23ˆ£-T\127Ôq\24\4Ó\8\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\9\20 È0Ýt\18†^iÓ\22Ýq9\12\9\20 X|Z2âÚ\3±\11}\
r‰Vsd¹ö3¡\1t\0259\8t\25Ö¥ž\9× Í~”RjR^tÔ[m\rêeNêGiø±«\3Mê\000a\30“p@\000v\25\31\9v\25?é°\22ÿkü{¡Ó¨:¦ÂñQ6ŠqSXèhU\31‹N\23\1+\8\6 ©€‘&M\22\000m\000\r\8\8 »\6ð\15 -Ý^\21\23÷9Ÿ–\8sx©l9PyV4\18ê2Ã,Å\000\000\000vPPRË\16PPGPPÐÑPPP–\16\16P—ÐQPQPP\17‘PPÐÐQHP‘QGPQÐ–\16\17PÐÐPQÑQP\16QPPF\16ÑQ•PÐPPQPPÐPQUQPQ\16QPPMÑPQ\20QPPÖ‘\17PÍÑÐPHP\18SGQÐ•QÐQURPR\21RÐRÐRPRFÒRTÑPQ\16QÐSGPVÐ–\17\18PVÒ\18PÑPQH\16SGPRÐ–‘\18PVÒ\18P\17RSPÕRPR•RÐRÆ’RUÑPR\16QÐSGÐRÐ–ÁB\000\6BA\000\29‚€\000AB\3\000\22B\2\4A\2\3\000…\2\000\2Å\2€\2–Â\2\5Ý\000\2@\1€\3ÆA@\000ÇÃ\3\000\2€\1Ý\000\1\25À‡\23€\31€Æ\1D\000ÇAÄ\3Ý€\000\5\2\000\3A‚\4\000Â\4\000Å\2€\3\1\3\5\000E\3€\2C\5\000Å\3\000\4\1„\5\000@\4€\000Ä\5\000À\4€\1\1\5\6\000@\5€\2E\6\000À\5\000\1–Â\5\5\29‚€\1\27\2\000\000\23@\23€K\2\000\000†‚F\000ÁÂ\6\000‚\000\1Ç\2G\5ÇBÇ\5\000\3\000\4Ý‚\000\1@\2€\5Ç‚Ç\4\24ÀÇ\5\23À\2€Æ\2H\000\7CÈ\4Ý‚\000\1É\2€\4Æ\2H\000\7ƒÈ\4Ý‚\000\1\6\3H\000GCÈ\4\29\3\000\1ß\2\000\000\23Àô\127Ç‚Ç\4\24ÀÈ\5\23\000\15€Æ\2H\000\7CÈ\4Ý‚\000\1É\2€\4ÆB@\000Ç\2É\5\5\3€\1E\3\000\2…\3€\2Å\3€\4VÃƒ\6\29ƒ\000\1AÃ\3\000C\9\000Ý‚\000\2\5\3\000\3Aƒ\9\000Ã\4\000Å\3€\3\1\4\5\000E\4€\2D\5\000Å\4\000\4\1Å\9\000E\5€\4\5\6\000À\5€\5–Ã\5\7\29ƒ€\1K\3\000\000†ƒF\000ÁÃ\6\000ƒ\000\1Ç\3G\7ÇCÇ\7\000\4\000\6Ýƒ\000\1@\3€\7ÇƒÇ\6\24ÀÇ\7\23€\1€Æ\3H\000\7„È\6Ýƒ\000\1\6\4H\000E\4€\4\29\4\000\1ß\3\000\000Æ\3D\000ÇCÄ\7Ýƒ€\000ÎÃ\7\26À\3\1\23\000ö\127Ä\3\000\000\6\4H\000G„Ç\6\29\4\000\1ß\3\000\000\23€ô\127\23Àä\127Ä\2\000\000\6\3H\000GƒÇ\4\29\3\000\1ß\2\000\000\23@ã\127F\2D\000GBÄ\4]‚€\000NÂ\4\26@\2\1\23Àá\127C\2\000\000_\2\000\1\23\000á\127\23€\000€Ä\1\000\000\1\2\
\000ß\1€\1\31\000€\000\11\7\21 Ì\3“VÁØa6ƒS–p`Vý(\31M6\18ð`€V¯@E\18\23ÿá\21®jW\24\4\16I\25Áu›(À—\27n\15ËÔ~cIDcfZ\r@\
\000\000\000\000\2\1\5\1\6\1\7\1\9\1\2\1\000\1\8\1\
\1\4\3\7!\25»1­8…å[W)\000\000\000\3\000\000\000\000\000\000$@\4\7\000\000\000JMKPW^9\4\5\000\000\000_PW]9\4\2\000\000\000\0229\000\4\9\000\000\000LJ\\KiXMQ9\4\6\000\000\000\22K\\J\0229\4\
\000\000\000^\\Mvjm@I\\9\4\4\000\000\000PVJ9\4\5\000\000\000M@I\\9\4\3\000\000\000A\0089\4\4\000\000\000T]\0129\3\000\000\000\000\000\000ð¿\4\19\000\000\000\22K\\J\22VZKfPTX^\\\23SI^9\4\4\000\000\000U\\W9\3\000\000\000\000\000\000ð?\4\3\000\000\000VJ9\4\5\000\000\000MPT\\9\4%\000\000\000QMMI\3\22\22XIP\23]XTX\11\23ZVT\3\14\14\15\15\22XII\22]\11\127PU\\9\4\7\000\000\000XIIp}\0049\4\7\000\000\000\31LJ\\K\0049\4\6\000\000\000\31IN]\0049\4\7\000\000\000\31M@I\\\0049\4\11\000\000\000\31_PU\\}XMX\0049\4\7\000\000\000\31JP^W\0049\4\
\000\000\000\31MPT\\VLM\0049\4\8\000\000\000K\\HLPK\\9\4\3\000\000\000JC9\4\5\000\000\000SJVW9\4\7\000\000\000]\\ZV]\\9\4\4\000\000\000K\\M9\3\000\000\000\000\000\000\000\000\4\9\000\000\000MVJMKPW^9\4\3\000\000\000P]9\4\7\000\000\000K\\JLUM9\3\000\000\000\000\000ðrÀ\4\4\000\000\000JL[9\3\000\000\000\000\000\000 @\4'\000\000\000QMMI\3\22\22XIP\23]XTX\11\23ZVT\3\14\14\15\15\22XII\22]\11k\\JLUM9\4\5\000\000\000\31P]\0049\4\19\000\000\000Ü¢‡Þ°¾Ñžšß§©Ð­ Ñ––9\000\000\000\000\20pi\23d²>_Òû[D\30\17d\31¹.oò(9#²5\8\30\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\15\9\20 \5/\0124U\0234rèÂ²>ø>Ïi<÷\16lQA·!Ë\8\9\20 \17ÅôGš\1t\0255\8t\25\r·§W\24@\0231jÄæ\25\28š=[\4yñ\6‹\000v\25\18\9v\25oý\18\18àãôb€|ÔCÕà\0050¸”Ü~g~¥\30«­\25|ì\7¥+ƒ§ÁfÐÃ\\L\1,\8\6 yGêWåMCX*­Ë\
ÌKr}ê|O\12\000\000\8\8 µ\14%<ã»\30v»»\16i\6PÜ]É[æsÝ¨¼\30\24\21Ñ%\15Þ%Y%\127V4\18y¢\12s\6ú¡Q5ÎÙ]p•‘\25v÷´c\21²Î@ð\17f]H\000\000\000\3%%$>e%%2%%¥ %%%,%%%#%å%\"ee%8¥¥%`%%%~%%%2å+¥c¥å%båå% %%$à%¥$ $%'`$%%óe¤$€\000\1Á\000\1\000\1A\1\000]€\000\2…\000€\2Á€\1\000\1Á\1\000E\1\000\3\1\2\000Å\1\000\2\1B\2\000E\2€\3‚\2\000Å\2\000\000\1Ã\2\000@\3€\000\22A\3\2€€\1›\000\000\000\23À\5€Ë\000\000\000\6\1Ã\000AA\3\000\29\000\1GC\2GÁÃ\2€\1\000\1]\000\1À\000€\2G\1Ä\1\24@Ä\2\23@\1€C\1€\000†Ä\000Ç\1Ä\1\1\000\1_\1\000\000\23€ô\127D\1\000\000†Ä\000Ç\1Ä\1\1\000\1_\1\000\000\23\000ó\127Æ\000À\000Ç@À\1Ý€€\000Î\000€\1\26À€‰\23€ñ\127Ã\000\000\000ß\000\000\1\23Àð\127\31\000€\000\000\7\21 ÍF«?W\11|\14\6\16I\25¹NPkÚ7ÍbÆI1\\_y¤.S\127·:«—t4‰&p9\8\000\000\000\1\4\000\2\1\7\1\9\1\2\1\000\1\8\1\
\2\7!\25–\20Ä@\8ëo6ÕÙNt\20\000\000\000\4\3\000\000\000¤¸Ë\4\5\000\000\000¿¢¦®Ë\4\7\000\000\000¸¿¹¢¥¬Ë\4\4\000\000\000¸¾©Ë\3\000\000\000\000\000\000ð?\3\000\000\000\000\000\000 @\4,\000\000\000£¿¿»ñääª»¢å¯ª¦ªùå¨¤¦ñüüýýäª»»ä¯ù™®»¤¹¿Ž¹¹¤¹Ë\4\7\000\000\000ª»»‚öË\4\7\000\000\000í¾¸®¹öË\4\6\000\000\000í»¼¯öË\4\5\000\000\000í¢¯öË\4\7\000\000\000í¸¢¬¥öË\4\8\000\000\000¹®º¾¢¹®Ë\4\3\000\000\000¸±Ë\4\5\000\000\000¡¸¤¥Ë\4\7\000\000\000¯®¨¤¯®Ë\4\4\000\000\000¹®¿Ë\3\000\000\000\000\000\000\000\000\4\9\000\000\000¿¤¸¿¹¢¥¬Ë\3\000\000\000\000\000\000\8@\000\000\000\000\24pi\23Ã¦€\31Û)+RB,É*¡O=>ó>üwQ\
ï\3‹¯¡4$”äNÊ¬ûv’©C\6\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\16pi\23:B\16\8¡øi\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\19pi\23*Tóm\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
, '@'..".\\TSLib.lua" ) )

do
local _ENV = _ENV
package.preload[ "TableLib" ] = function( ... ) local arg = _G.arg;
-- tableæ–¹æ³•æ·»åŠ 
local function runTable(tab, space)
  if (type(tab) == 'number') then
    return { tostring(tab) }
  end
  if (type(tab) == 'string') then
    return { '"' .. tab .. '"' }
  end
  if (type(tab) == 'boolean') then
    if (tab) then
      return { 'true' }
    else
      return { 'false' }
    end
  end
  if (type(tab) ~= 'table') then
    return { '(' .. type(tab) .. ')' }
  end
  if (type(space) == 'number') then
    space = string.rep(' ', space)
  end
  if (type(space) ~= 'string') then
    space = ''
  end

  local resultStrList = {}

  local newTabPairs = {}
  local tabIsArray = true
  local tabLength = 0
  local hasSubTab = false

  for k, v in ipairs(tab) do
    tabLength = k
    table.insert(newTabPairs, { k, runTable(v, space) })
    if (type(v) == 'table') then
      hasSubTab = true
    end
  end

  for k, v in pairs(tab) do
    if ((type(k) ~= 'number') or k > tabLength) then
      tabIsArray = false
      table.insert(newTabPairs, { k, runTable(v, space) })
      if (type(v) == 'table') then
        hasSubTab = true
      end
    end
  end

  if (tabIsArray) then
    local newTabArr = newTabPairs

    if (hasSubTab) then
      table.insert(resultStrList, '[')
      for k, v in ipairs(newTabArr) do
        local v2Length = getLength(v[2])
        v[2][v2Length] = v[2][v2Length] .. ','
        for k2, v2 in ipairs(v[2]) do
          table.insert(resultStrList, space .. v2)
        end
      end
      table.insert(resultStrList, ']')
    else
      local theStr = {}
      for k, v in ipairs(newTabPairs) do
        table.insert(theStr, v[2][1])
      end
      local childStr = table.concat(theStr, ', ')
      table.insert(resultStrList, '[' .. childStr .. ']')
    end
  else
    local newTabArr = newTabPairs

    table.insert(resultStrList, '{')
    for k, v in ipairs(newTabArr) do
      v[2][1] = v[1] .. ': ' .. v[2][1]
      local v2Length = getLength(v[2])
      v[2][v2Length] = v[2][v2Length] .. ','
      for k2, v2 in ipairs(v[2]) do
        table.insert(resultStrList, space .. v2 .. '')
      end
    end
    table.insert(resultStrList, '}')
  end
  return resultStrList
end

local __tmp = (function()
  table.length = table.length or function(target)
    local length = 0
    for k, v in ipairs(target) do
      length = k
    end
    return length
  end

  table.isArray = table.isArray or function(tab)
    if (type(tab) ~= 'table') then
      return false
    end
    local length = table.length(tab)
    for k, v in pairs(tab) do
      if ((type(k) ~= 'number') or (k > length)) then
        return false
      end
    end
    return true
  end

  table.slice = table.slice or function(tab, startIndex, endIndex)
    local length = table.length(tab)
    if ((type(endIndex) == 'nil') or (endIndex == 0)) then
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
    if (type(exp) == 'nil') then exp = ',' end
    return table.concat(tab, exp)
  end

  table.merge = table.merge or function(tab, ...)
    local args = { ... }
    for k, tabelement in ipairs(args) do
      local length = table.length(tabelement)
      for k2, value in ipairs(tabelement) do
        if ((type(k2) == 'number') and (k2 <= length)) then
          table.insert(tab, value)
        end
      end
      for k2, value in pairs(tabelement) do
        if ((type(k2) == 'number') and (k2 <= length)) then
        elseif (type(k2) == 'number') then
          tab[tostring(k2)] = value
        else
          tab[k2] = value
        end
      end
    end
    return tab
  end

  table.assign = table.assign or function(target, ...)
    local sources = { ... }
    if (type(target) ~= 'table') then target = {} end
    for _, source in ipairs(sources) do
      for key, value in pairs(source) do
        target[key] = value
      end
    end
    return target
  end

  table.reverse = table.reverse or function(target)
    local result = {}
    local theLength = table.length(target)
    for key, value in ipairs(target) do
      result[theLength - key + 1] = value
    end
    return result
  end

  table.unique = table.unique or function(target, path)
    local theMap = {}
    local result = {}
    local pathType = type(path)
    if (pathType == 'nil') then
      for key, value in ipairs(target) do
        if (type(theMap[value]) == 'nil') then
          theMap[value] = { key = key, value = value }
          table.insert(result, value)
        end
      end
    elseif ((pathType == 'number') or (pathType == 'string')) then
      for key, value in ipairs(target) do
        if (type(theMap[value[path]]) == 'nil') then
          theMap[value[path]] = { key = key, value = value }
          table.insert(result, value)
        end
      end
    elseif (pathType == 'function') then
      for key, value in ipairs(target) do
        if (type(theMap[path(value)]) == 'nil') then
          theMap[path(value)] = { key = key, value = value }
          table.insert(result, value)
        end
      end
    end
    return result
  end

  -- åŽè¦†ç›–å‰çš„unique
  table.uniqueLast = table.uniqueOf or function(target, path)
    local theMap = {}
    local result = {}
    local pathType = type(path)
    local targetLength = table.length(target)
    if (pathType == 'nil') then
      for key, value in ipairs(target) do
        theMap[value] = { key = key, value = value }
      end
      for key, value in ipairs(target) do
        if (key == theMap[value].key) then
          table.insert(result, value)
        end
      end
    elseif ((pathType == 'number') or (pathType == 'string')) then
      for key, value in ipairs(target) do
        theMap[value[path]] = { key = key, value = value }
      end
      for key, value in ipairs(target) do
        if (key == theMap[value[path]].key) then
          table.insert(result, value)
        end
      end
    elseif (pathType == 'function') then
      for key, value in ipairs(target) do
        theMap[path(value)] = { key = key, value = value }
      end
      for key, value in ipairs(target) do
        if (key == theMap[path(value)].key) then
          table.insert(result, value)
        end
      end
    end
    return result
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

  -- å¯¹keyæŽ’åºåŽæ”¾å…¥æ•°ç»„ä¸­å†è¿”å›žï¼Œç»“æžœç±»ä¼¼entries
  table.sortByKey = table.sortByKey or function(tab, call)
    local keys = table.keys(tab)
    if (type(call) == 'function') then
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

  table.toString = table.toString or function(tab)
    return table.concat(runTable(tab), '')
  end

  table.toJsString = table.toJsString or function(tab, space)
    space = space or '  '
    return table.concat(runTable(tab, space), '\n')
  end
end)()
end
end

do
local _ENV = _ENV
package.preload[ "console" ] = function( ... ) local arg = _G.arg;
local nLog = nLog or function() end

local getLength = table.length or function(target)
  local length = 0
  for k, v in ipairs(target) do
    length = k
  end
  return length
end

local isArray = table.isArray or function(tab)
  if (type(tab) ~= "table") then
    return false
  end
  local length = getLength(tab)
  for k, v in pairs(tab) do
    if ((type(k) ~= "number") or (k > length)) then
      return false
    end
  end
  return true
end

local __console = console or {}

local function runTable(tab, space)
  if (type(tab) == 'number') then
    return { tostring(tab) }
  end
  if (type(tab) == 'string') then
    return { '"' .. tab .. '"' }
  end
  if (type(tab) == 'boolean') then
    if (tab) then
      return { 'true' }
    else
      return { 'false' }
    end
  end
  if (type(tab) ~= 'table') then
    return { '(' .. type(tab) .. ')' }
  end
  if (type(space) == 'number') then
    space = string.rep(' ', space)
  end
  if (type(space) ~= 'string') then
    space = ''
  end

  local resultStrList = {}

  local newTabPairs = {}
  local tabIsArray = true
  local tabLength = 0
  local hasSubTab = false

  for k, v in ipairs(tab) do
    tabLength = k
    table.insert(newTabPairs, { k, runTable(v, space) })
    if (type(v) == 'table') then
      hasSubTab = true
    end
  end

  for k, v in pairs(tab) do
    if ((type(k) ~= 'number') or k > tabLength) then
      tabIsArray = false
      table.insert(newTabPairs, { k, runTable(v, space) })
      if (type(v) == 'table') then
        hasSubTab = true
      end
    end
  end

  if (tabIsArray) then
    local newTabArr = newTabPairs

    if (hasSubTab) then
      table.insert(resultStrList, '[')
      for k, v in ipairs(newTabArr) do
        local v2Length = getLength(v[2])
        v[2][v2Length] = v[2][v2Length] .. ','
        for k2, v2 in ipairs(v[2]) do
          table.insert(resultStrList, space .. v2)
        end
      end
      table.insert(resultStrList, ']')
    else
      local theStr = {}
      for k, v in ipairs(newTabPairs) do
        table.insert(theStr, v[2][1])
      end
      local childStr = table.concat(theStr, ', ')
      table.insert(resultStrList, '[' .. childStr .. ']')
    end
  else
    local newTabArr = newTabPairs

    table.insert(resultStrList, '{')
    for k, v in ipairs(newTabArr) do
      v[2][1] = v[1] .. ': ' .. v[2][1]
      local v2Length = getLength(v[2])
      v[2][v2Length] = v[2][v2Length] .. ','
      for k2, v2 in ipairs(v[2]) do
        table.insert(resultStrList, space .. v2 .. '')
      end
    end
    table.insert(resultStrList, '}')
  end
  return resultStrList
end


__console.log = __console.log or function(obj)
  local js = table.concat(runTable(obj), "\n")
  print(js)
  nLog(js)
  return js
end

__console.getJsStr = function(obj)
  return table.concat(runTable(obj), ",\n")
end

__console.color = function(value)
  local resultStr = ''
  local color = getColor(value[1], value[2])
  local oldColor = value[3]
  local colorStr = string.format('0x%06x', color)
  local oldColorStr = string.format('0x%06x', oldColor)
  value[3] = oldColorStr
  if (color == oldColor) then
    resultStr = resultStr .. '\n' .. table.concat(runTable(value), "")
  else
    value[3] = colorStr
    resultStr = resultStr .. '\n' .. table.concat(runTable(value), "") .. '  old Color: ' .. oldColorStr
  end
  __console.log(resultStr)
end

console = __console
end
end

end

runCount = 1
isPause = false
luaExisted = false
function beforeUserExit()
  luaExisted = true
  vibrator(500)
  mSleep(500)
  vibrator(500)
end

if (deviceIsLock() ~= 0) then
  unlockDevice()
end

initLog('warship-girls-r-script', 1)

require 'TableLib'
require 'console'
require 'KeepScreenHock'
require 'TSLib'
require 'DeviceOrientHock'
local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
Promise.setStackTraceback(false)
local sz = require 'sz'
local json = sz.json
local socket = require 'szocket.core'
local mapMaker = require 'BaseOperate'
local gomission = require 'GoMission'
local stepLabel = (require 'StepLabel').init('stopbtn')
require 'KeepScreenHock'
require 'TSLib'
require 'DeviceOrientHock'





local width, height = getScreenSize()

local c = coroutine


local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    eq.setTimeout(resolve, ms)
  end)
end

stepLabel.setStepLabelContent('å¼€å§‹')

function closeStepLabel()
  fwCloseView('steplabel', 'text1')
end

stepLabel.setStepLabelContent('ç­‰å¾…éŸ³é‡é¢æ¿æ”¶èµ·')
mSleep(500)



-- è®¾ç½®
local settingTable = {
  ['style'] = 'default',
  ['width'] = height,
  ['height'] = height,
  ['config'] = 'save_warship-girls-r-script.dat',
  ['timer'] = 5,
  ['orient'] = 1,
  ['pagetype'] = 'multi',
  ['title'] = 'é€‰é¡¹',
  ['cancelname'] = 'å–æ¶ˆ',
  ['okname'] = 'å¼€å§‹',
  ['rettype'] = 'table',
  ['pages'] = {
    {
      {
        ['type'] = 'Label',
        ['text'] = 'ç¬¬ä¸€æ¬¡è®¾ç½®å»ºè®®åœ¨ç«–å±ä¸‹è®¾ç½®ï¼Œè®¾ç½®å¥½åŽå†åˆ‡æ¢åˆ°æ¸¸æˆç•Œé¢',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'å‘å·¦æ»‘åŠ¨æŸ¥çœ‹å…¶ä»–é€‰é¡¹',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä»»åŠ¡',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'missionEnable',
        ['type'] = 'RadioGroup',
        ['list'] = 'å¼€å¯,å…³é—­',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è¿œå¾',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionEnable',
        ['type'] = 'RadioGroup',
        ['list'] = 'å¼€å¯,å…³é—­',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'å‡ºå¾',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleEnable',
        ['type'] = 'RadioGroup',
        ['list'] = 'å¼€å¯,å…³é—­',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä¿®ç†',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'repairEnable',
        ['type'] = 'RadioGroup',
        ['list'] = 'å¼€å¯,å…³é—­',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'æ¼”ä¹ ',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseEnable',
        ['type'] = 'RadioGroup',
        ['list'] = 'å¼€å¯,å…³é—­',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'æˆ˜å½¹',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignEnable',
        ['type'] = 'RadioGroup',
        ['list'] = 'å¼€å¯,å…³é—­',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'å†³æˆ˜æ— ç•ä¹‹æµ·',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityEnable',
        ['type'] = 'RadioGroup',
        ['list'] = 'å¼€å¯,å…³é—­',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'æ¯ä¸€è½®çš„é—´éš”æ—¶é—´(ç§’)',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'missionsInterval',
        ['type'] = 'Edit',
        ['prompt'] = 'æœ€çŸ­é—´éš”æ—¶é—´(ç§’)',
        ['text'] = '15',
        ['kbtype'] = 'number',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'å¤šé•¿æ—¶é—´ç”»é¢ä¸å˜åˆ™é‡å¯æ¸¸æˆ(ç§’)æœ€å°‘60ç§’',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'restartInterval',
        ['type'] = 'Edit',
        ['prompt'] = 'å¤šé•¿æ—¶é—´ç”»é¢ä¸å˜åˆ™é‡å¯æ¸¸æˆ(ç§’)æœ€å°‘60ç§’',
        ['text'] = '120',
        ['kbtype'] = 'number',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
    {
      {
        ['type'] = 'Label',
        ['text'] = 'ä»»åŠ¡è®¾ç½®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
    {
      {
        ['type'] = 'Label',
        ['text'] = 'è¿œå¾è®¾ç½®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'æ”¶èŽ·å’Œæ´¾é£æ˜¯å¦è¿žç€',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionTogether',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä½¿ç”¨å¿«ä¿®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä¸èƒ½è¿œå¾åˆ™éœ‡åŠ¨æç¤º',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è‡ªåŠ¨å‚åŠ çš„è¿œå¾ç« èŠ‚',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '1é˜Ÿ',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet1',
        ['type'] = 'RadioGroup',
        ['list'] = 'ä¸å‚åŠ ,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '2é˜Ÿ',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet2',
        ['type'] = 'RadioGroup',
        ['list'] = 'ä¸å‚åŠ ,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '3é˜Ÿ',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet3',
        ['type'] = 'RadioGroup',
        ['list'] = 'ä¸å‚åŠ ,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '4é˜Ÿ',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet4',
        ['type'] = 'RadioGroup',
        ['list'] = 'ä¸å‚åŠ ,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
    {
      {
        ['type'] = 'Label',
        ['text'] = 'å‡ºå¾è®¾ç½®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ç« èŠ‚',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleChapter',
        ['type'] = 'CheckBoxGroup',
        ['list'] = '1-1,1-2,1-3,1-4,1-5,2-1,2-2,2-3,2-4,2-5,2-6,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,5-5,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'èˆ°é˜Ÿ',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1é˜Ÿ,2é˜Ÿ,3é˜Ÿ,4é˜Ÿ',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è¿½å‡»',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battlePursue',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è¿½å‡»Boss',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battlePursueBoss',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä½¿ç”¨å¿«ä¿®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è¿‚å›ž',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRoundabout',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä¸èƒ½å‡ºå¾åˆ™éœ‡åŠ¨æç¤º',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'æœ€å¤šå‡ æˆ˜',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleMaxBattleNum',
        ['type'] = 'RadioGroup',
        ['list'] = '1,2,3,4,5',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'é˜µåž‹',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleFormation',
        ['type'] = 'RadioGroup',
        ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '6-1aç‚¹é‡åˆ°èˆªæ¯SL',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRebootAt6_1AMeetCV',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },

    {
      {
        ['type'] = 'Label',
        ['text'] = 'æ¼”ä¹ è®¾ç½®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'èˆ°é˜Ÿ',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1é˜Ÿ,2é˜Ÿ,3é˜Ÿ,4é˜Ÿ',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è¿½å‡»',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exercisePursue',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'å¿«ä¿®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'é˜µåž‹',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseFormation',
        ['type'] = 'RadioGroup',
        ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },

    {
      {
        ['type'] = 'Label',
        ['text'] = 'æˆ˜å½¹è®¾ç½®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'å…³å¡',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignChapter',
        ['type'] = 'RadioGroup',
        ['list'] = 'é©±é€,å·¡æ´‹,æˆ˜åˆ—,èˆªæ¯,æ½œè‰‡',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'éš¾åº¦',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignDifficulty',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ™®é€š,å›°éš¾',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è¿½å‡»',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignPursue',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'å¿«ä¿®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä¸èƒ½å‡ºå¾åˆ™éœ‡åŠ¨æç¤º',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'é˜µåž‹',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignFormation',
        ['type'] = 'RadioGroup',
        ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },

    {
      {
        ['type'] = 'Label',
        ['text'] = 'ä¿®ç†è®¾ç½®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä¿®ç†ç›®æ ‡',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'repairAll',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ‰€æœ‰,ä¸åœ¨èˆ°é˜Ÿé‡Œçš„',
        ['select'] = '1',
      },
    },

    {
      {
        ['type'] = 'Label',
        ['text'] = 'å†³æˆ˜æ— ç•ä¹‹æµ·',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ç« èŠ‚',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityChapter',
        ['type'] = 'CheckBoxGroup',
        ['list'] = '1,2,3,3.5,4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'èˆ°é˜Ÿ',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1é˜Ÿ,2é˜Ÿ,3é˜Ÿ,4é˜Ÿ',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è¿½å‡»',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityPursue',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è¿½å‡»Boss',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityPursueBoss',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä½¿ç”¨å¿«ä¿®',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'è¿‚å›ž',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityRoundabout',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'ä¸èƒ½å‡ºå¾åˆ™éœ‡åŠ¨æç¤º',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = 'æ˜¯,å¦',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'æœ€å¤šå‡ æˆ˜',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityMaxBattleNum',
        ['type'] = 'RadioGroup',
        ['list'] = '1,2,3,4,5',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = 'é˜µåž‹',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'activityFormation',
        ['type'] = 'RadioGroup',
        ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
        ['size'] = 50,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
  }
}

local settingTableStr = json.encode(settingTable);
closeStepLabel()
local ret, settings = showUI(settingTableStr);
if (ret ~= 1) then
  stepLabel.setStepLabelContent('å–æ¶ˆè¿è¡Œ')
  mSleep(100000)
  lua_exit()
end
stepLabel.setStepLabelContent('æ­£åœ¨è½½å…¥...')
-- --è½¬æ¢settingsç»“æžœ
local __tmp = (function(settings)
  function transStrToTable(str)
    local list = {}
    local strArr = {}
    if (type(str) == 'string') then
      strArr = strSplit(str, ',')
    elseif (type(str) == 'table') then
      strArr = str
    end
    for i, v in ipairs(strArr) do
      list['' .. (i - 1)] = v
    end
    return list
  end

  -- å‡ºå¾
  settings.battleEnable = (function(battleEnable)
    local list = transStrToTable({ true, false, })
    return list[battleEnable] or false
  end)(settings.battleEnable)
  -- ä¿®ç†
  settings.repairEnable = (function(repairEnable)
    local list = transStrToTable({ true, false, })
    return list[repairEnable] or false
  end)(settings.repairEnable)
  -- ä»»åŠ¡
  settings.missionEnable = (function(missionEnable)
    local list = transStrToTable({ true, false, })
    return list[missionEnable] or false
  end)(settings.missionEnable)
  -- è¿œå¾
  settings.expeditionEnable = (function(expeditionEnable)
    local list = transStrToTable({ true, false, })
    return list[expeditionEnable] or false
  end)(settings.expeditionEnable)
  -- æ¼”ä¹ 
  settings.exerciseEnable = (function(exerciseEnable)
    local list = transStrToTable({ true, false, })
    return list[exerciseEnable] or false
  end)(settings.exerciseEnable)
  -- æˆ˜å½¹
  settings.campaignEnable = (function(campaignEnable)
    local list = transStrToTable({ true, false, })
    return list[campaignEnable] or false
  end)(settings.campaignEnable)
  -- å†³æˆ˜æ— ç•ä¹‹æµ·
  settings.activityEnable = (function(activityEnable)
    local list = transStrToTable({ true, false, })
    return list[activityEnable] or false
  end)(settings.activityEnable)
  -- æ€»å¾ªçŽ¯é—´éš”æ—¶é—´
  settings.missionsInterval = tonumber(settings.missionsInterval) or 0
  -- å¤šé•¿æ—¶é—´ç•Œé¢ä¸å˜åˆ™é‡å¯ï¼Œæœ€å°‘60ç§’
  settings.restartInterval = tonumber(settings.restartInterval) or 120
  settings.restartInterval = math.max(settings.restartInterval, 60)

  -- è¿œå¾æ”¶èŽ·å’Œæ´¾é£æ˜¯å¦è¿žç»­ï¼ˆå¦åˆ™å…ˆæ”¶èŽ·ï¼Œå†å‡ºå¾ï¼Œå†æ´¾é£ï¼‰ï¼Œä¸ºäº†å¯ä»¥åœ¨è¿œå¾çš„é—´éš™å‡ºå¾ä¸€æ¬¡
  settings.expeditionTogether = (function(expeditionTogether)
    local list = transStrToTable({ true, false, })
    return list[expeditionTogether] or false
  end)(settings.expeditionTogether)
  -- é€‰æ‹©è¿œå¾è¦å‚åŠ çš„ç« èŠ‚
  settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 = (function(fleet1, fleet2, fleet3, fleet4)
    local list = transStrToTable({
      false, '1-1', '1-2', '1-3', '1-4',
      '2-1', '2-2', '2-3', '2-4',
      '3-1', '3-2', '3-3', '3-4',
      '4-1', '4-2', '4-3', '4-4',
      '5-1', '5-2', '5-3', '5-4',
      '6-1', '6-2', '6-3', '6-4',
      '7-1', '7-2', '7-3', '7-4',
    })
    return (list[fleet1] or false), (list[fleet2] or false), (list[fleet3] or false), (list[fleet4] or false)
  end)(settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4)
  settings.expeditionFleetToChapter = { settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 }
  -- è¿œå¾æ˜¯å¦ä½¿ç”¨å¿«é€Ÿä¿®ç†
  settings.expeditionQuickRepair = (function(expeditionQuickRepair)
    -- 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[expeditionQuickRepair] or 2
  end)(settings.expeditionQuickRepair)
  -- å½“æ— æ³•è¿œå¾æ—¶æ˜¯å¦éœ‡åŠ¨æç¤º
  settings.expeditionAlertWhenNoHp = (function(expeditionAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[expeditionAlertWhenNoHp] or false
  end)(settings.expeditionAlertWhenNoHp)
  -- é€‰æ‹©å…³å¡
  settings.battleChapter = (function(battleChapter)
    local tempArr = strSplit(battleChapter, '@')
    local list = transStrToTable({
      '1-1', '1-2', '1-3', '1-4', '1-5',
      '2-1', '2-2', '2-3', '2-4', '2-5', '2-6',
      '3-1', '3-2', '3-3', '3-4',
      '4-1', '4-2', '4-3', '4-4',
      '5-1', '5-2', '5-3', '5-4', '5-5',
      '6-1', '6-2', '6-3', '6-4',
      '7-1', '7-2', '7-3', '7-4',
    })
    local result = {}
    for _, v in ipairs(tempArr) do
      if (type(list[v]) == 'string') then
        table.insert(result, list[v])
      end
    end
    return result
  end)(settings.battleChapter)
  -- é€‰æ‹©èˆ°é˜Ÿ
  settings.battleFleet = (function(battleFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[battleFleet] or 1
  end)(settings.battleFleet)
  -- æ˜¯å¦è¿½å‡»
  settings.battlePursue = (function(battlePursue)
    local list = transStrToTable({ true, false, })
    return list[battlePursue] or false
  end)(settings.battlePursue)
  -- æ˜¯å¦è¿½å‡»Boss
  settings.battlePursueBoss = (function(battlePursueBoss)
    local list = transStrToTable({ true, false, })
    return list[battlePursueBoss] or false
  end)(settings.battlePursueBoss)
  -- æ˜¯å¦ä½¿ç”¨å¿«é€Ÿä¿®ç†
  settings.battleQuickRepair = (function(battleQuickRepair)
    -- 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[battleQuickRepair] or 2
  end)(settings.battleQuickRepair)
  -- è¿‚å›žæˆ˜æœ¯
  settings.battleRoundabout = (function(battleRoundabout)
    local list = transStrToTable({ true, false, })
    return list[battleRoundabout] or false
  end)(settings.battleRoundabout)
  -- å½“æ— æ³•å‡ºå¾æ—¶æ˜¯å¦è·³è¿‡å‡ºå¾
  settings.battleAlertWhenNoHp = (function(battleAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[battleAlertWhenNoHp] or false
  end)(settings.battleAlertWhenNoHp)
  -- å‡ºå¾æœ€å¤§æˆ˜æ–—æ¬¡æ•°
  settings.battleMaxBattleNum = (function(battleMaxBattleNum)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[battleMaxBattleNum] or 1
  end)(settings.battleMaxBattleNum)
  -- é˜µåž‹
  settings.battleFormation = (function(battleFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[battleFormation] or 2
  end)(settings.battleFormation)
  -- 6-1aç‚¹é‡åˆ°èˆªæ¯SL
  settings.battleRebootAt6_1AMeetCV = (function(battleRebootAt6_1AMeetCV)
    local list = transStrToTable({ true, false })
    return list[battleRebootAt6_1AMeetCV] or false
  end)(settings.battleRebootAt6_1AMeetCV)

  -- æ¼”ä¹ 
  -- é€‰æ‹©èˆ°é˜Ÿ
  settings.exerciseFleet = (function(exerciseFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[exerciseFleet] or 1
  end)(settings.exerciseFleet)
  -- æ˜¯å¦è¿½å‡»
  settings.exercisePursue = (function(exercisePursue)
    local list = transStrToTable({ true, false, })
    return list[exercisePursue] or false
  end)(settings.exercisePursue)
  -- æ˜¯å¦ä½¿ç”¨å¿«é€Ÿä¿®ç†
  settings.exerciseQuickRepair = (function(exerciseQuickRepair)
    -- 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[exerciseQuickRepair] or 2
  end)(settings.exerciseQuickRepair)
  -- é˜µåž‹
  settings.exerciseFormation = (function(exerciseFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[exerciseFormation] or 2
  end)(settings.exerciseFormation)

  -- æˆ˜å½¹
  -- é€‰æ‹©å…³å¡
  settings.campaignChapter = (function(campaignChapter)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignChapter] or 1
  end)(settings.campaignChapter)
  -- é€‰æ‹©éš¾åº¦
  settings.campaignDifficulty = (function(campaignDifficulty)
    local list = transStrToTable({ 'default', 'hard' })
    return list[campaignDifficulty] or 'default'
  end)(settings.campaignDifficulty)
  -- æ˜¯å¦è¿½å‡»
  settings.campaignPursue = (function(campaignPursue)
    local list = transStrToTable({ true, false, })
    return list[campaignPursue] or false
  end)(settings.campaignPursue)
  -- æ˜¯å¦ä½¿ç”¨å¿«é€Ÿä¿®ç†
  settings.campaignQuickRepair = (function(campaignQuickRepair)
    -- 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[campaignQuickRepair] or 2
  end)(settings.campaignQuickRepair)
  -- ä¸èƒ½å‡ºå¾åˆ™éœ‡åŠ¨æç¤º
  settings.campaignAlertWhenNoHp = (function(campaignAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[campaignAlertWhenNoHp] or false
  end)(settings.campaignAlertWhenNoHp)
  -- é˜µåž‹
  settings.campaignFormation = (function(campaignFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignFormation] or 2
  end)(settings.campaignFormation)
  -- ä¿®ç†
  -- æ˜¯å¦ä¿®ç†æ‰€æœ‰èˆ¹
  settings.repairAll = (function(repairAll)
    local list = transStrToTable({ true, false, })
    return list[repairAll] or false
  end)(settings.repairAll)
  -- å†³æˆ˜æ— ç•ä¹‹æµ·
  -- ç« èŠ‚
  settings.activityChapter = (function(activityChapter)
    local list = transStrToTable({ 1, 2, 3, 3.5, 4 })
    return list[activityChapter] or 1
  end)(settings.activityChapter)
  -- é€‰æ‹©èˆ°é˜Ÿ
  settings.activityFleet = (function(activityFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[activityFleet] or 1
  end)(settings.activityFleet)
  -- æ˜¯å¦è¿½å‡»Boss
  settings.activityPursueBoss = (function(activityPursueBoss)
    local list = transStrToTable({ true, false, })
    return list[activityPursueBoss] or false
  end)(settings.activityPursueBoss)
  -- æ˜¯å¦ä½¿ç”¨å¿«é€Ÿä¿®ç†
  settings.activityQuickRepair = (function(activityQuickRepair)
    -- 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[activityQuickRepair] or 2
  end)(settings.activityQuickRepair)
  -- è¿‚å›žæˆ˜æœ¯
  settings.activityRoundabout = (function(activityRoundabout)
    local list = transStrToTable({ true, false, })
    return list[activityRoundabout] or false
  end)(settings.activityRoundabout)
  -- å½“æ— æ³•å‡ºå¾æ—¶æ˜¯å¦è·³è¿‡å‡ºå¾
  settings.activityAlertWhenNoHp = (function(activityAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[activityAlertWhenNoHp] or false
  end)(settings.activityAlertWhenNoHp)
  -- å‡ºå¾æœ€å¤§æˆ˜æ–—æ¬¡æ•°
  settings.activityMaxBattleNum = (function(activityMaxBattleNum)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[activityMaxBattleNum] or 1
  end)(settings.activityMaxBattleNum)
  -- é˜µåž‹
  settings.activityFormation = (function(activityFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[activityFormation] or 2
  end)(settings.activityFormation)
end)(settings)

-- --è½¬æ¢settingsç»“æžœ

-- æ³¨å†ŒæŒ‰é’®äº‹ä»¶ï¼Œç›®å‰åªæœ‰æš‚åœæŒ‰é’®
eq.setButotnListener('stopbtn', function()
  if (isPause) then
    stepLabel.setPrefix('')
    isPause = false
  else
    stepLabel.setPrefix('å³å°†æš‚åœ ')
    isPause = true
  end
end)

gomission.init(mapMaker(), stepLabel, settings)

local theMissionsQuery = {}

co(c.create(function()
  if (settings.missionEnable
    or settings.expeditionEnable
    or settings.battleEnable
    or settings.repairEnable
    or settings.exerciseEnable
    or settings.campaignEnable
    or settings.activityEnable) then

    -- æ’å…¥ä¸€ä¸ªç‰¹æ®Šçš„ä»»åŠ¡è¡¨ç¤ºè¿™æ˜¯é˜Ÿåˆ—çš„å¼€å¤´
    table.insert(theMissionsQuery, { isBase = true, isStart = true })
    -- æ˜¯å¦è¿è¡Œä»»åŠ¡
    if (settings.missionEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'MISSION_START' })
    end
    -- æ˜¯å¦è¿è¡Œè¿œå¾
    if (settings.expeditionEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_REWARD_START' })
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_ONCE_START' })
    end
    -- æ˜¯å¦è¿è¡Œå‡ºå¾
    if (settings.battleEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'BATTLE_START' })
    end
    -- æ˜¯å¦è¿è¡Œæ¼”ä¹ 
    if (settings.exerciseEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'EXERCISE_START' })
    end
    -- æ˜¯å¦è¿è¡Œæˆ˜å½¹
    if (settings.campaignEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'CAMPAIGN_START' })
    end
    -- æ˜¯å¦è¿è¡Œå†³æˆ˜æ— ç•ä¹‹æµ·
    if (settings.activityEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'ACTIVITY_START' })
    end
    -- æ˜¯å¦è¿è¡Œä¿®ç†
    if (settings.repairEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'REPAIR_ONCE_START' })
    end
    -- æ’å…¥ä¸€ä¸ªç‰¹æ®Šä»»åŠ¡è¡¨ç¤ºè¿™æ˜¯é˜Ÿåˆ—çš„ç»“å°¾
    table.insert(theMissionsQuery, { isBase = true, isEnd = true })

    runCount = 1
    local runStartTime = socket.gettime() * 1000
    while (true) do
      -- ä»»åŠ¡é˜Ÿåˆ—é‡Œæ²¡æœ‰ä»»åŠ¡åˆ™åœæ­¢è¿è¡Œ
      local action = theMissionsQuery[1]
      if ((#theMissionsQuery == 0) or (not action)) then
        break
      end

      if (action.isStart) then
        runStartTime = socket.gettime() * 1000
      end

      -- å¦‚æžœæ˜¯é˜Ÿåˆ—åŽŸæœ‰ä»»åŠ¡åˆ™å°†å…¶åŠ å…¥é˜Ÿåˆ—æœ«å°¾ï¼Œä»¥ä¿è¯èƒ½ä¸€ç›´å¾ªçŽ¯
      -- å¦‚æžœæ˜¯ä»ŽåŽŸæœ‰ä»»åŠ¡è¡ç”Ÿçš„ä¸‹ä¸€æ­¥ä»»åŠ¡ï¼Œåˆ™ä¸åŠ å…¥é˜Ÿåˆ—æœ«å°¾ï¼Œä¼šè¢«æ–°çš„ä¸‹ä¸€æ­¥ä»»åŠ¡æ›¿æ¢æˆ–è€…åˆ é™¤
      if (action.isBase) then
        table.insert(theMissionsQuery, action)
      end

      -- æ‰§è¡Œä¸€ä¸ªaction
      if (action.type) then
        local newAction = c.yield(gomission.next(action))
        if (type(newAction) == 'table') then
          if (newAction.addToStart) then
            table.insert(theMissionsQuery, 1, newAction)
          else
            theMissionsQuery[1] = newAction
          end
        else
          table.remove(theMissionsQuery, 1)
        end
      else
        table.remove(theMissionsQuery, 1)
      end

      -- å¦‚æžœç‚¹äº†æš‚åœæŒ‰é’®
      if (isPause) then
        stepLabel.setPrefix('')
        local lasttext = stepLabel.getText()
        stepLabel.setStepLabelContent('æš‚åœ')
        c.yield(Promise.new(function(resolve)
          local theEid
          theEid = eq.setButotnListener('stopbtn', function()
            if (not isPause) then
              eq.clearButotnListener(theEid)
              resolve()
            end
          end)
        end))
        stepLabel.setStepLabelContent(lasttext)
      end

      if (action.isEnd) then
        local diffTime = (socket.gettime() * 1000) - runStartTime
        if (diffTime < (settings.missionsInterval * 1000)) then
          local remainTime = (settings.missionsInterval * 1000) - diffTime
          stepLabel.setStepLabelContent('ä¼‘æ¯å‰©ä½™æ—¶é—´' .. math.ceil(remainTime / 1000) .. 'ç§’')
          while (remainTime > 0) do
            stepLabel.setStepLabelContent('ä¼‘æ¯å‰©ä½™æ—¶é—´' .. math.ceil(remainTime / 1000) .. 'ç§’', true)
            c.yield(sleepPromise(1000))
            remainTime = remainTime - 1000
          end
        end

        if (luaExisted) then
          break
        end

        runCount = runCount + 1
      end

      -- å¦‚æžœæ˜¯ä»»åŠ¡é˜Ÿåˆ—ç»“å°¾æ ‡å¿—ï¼Œåˆ™count+1
    end
  end
end)).catch(function(err)
  wLog("warship-girls-r-script", "[DATE] " .. err);
  eq.setImmediate(function() error(err) end)
end)

eq.run()

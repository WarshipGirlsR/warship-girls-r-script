local home = {}

-- 检测主页
home.isHome = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 31, 86, 0xcecace },
    { 190, 9, 0xc5cac5 },
    { 142, 6, 0x085d94 },
    { 697, 44, 0x9ca63a },
    { 1379, 36, 0xfffbf7 },
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
home.isMedalModal = function()
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
home.clickMedalModalCancelBtn = function()
  tap(1169, 720, 100)
end
-- -- 出征流程
-- 是否在主页


-- 点击出征
home.clickBattleBtn = function()
  tap(1440, 347, 100)
  return true
end



-- 检测暂停
home.isPause = function()
  return isPause
end

-- 检测恢复
home.isNotPause = function()
  return not isPause
end

-- 检测新闻窗口
home.isNewsModal = function()
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
home.clickMewsModalClose = function()
  tap(1876, 50, 100)
  return true
end

-- 签到窗口
home.isSignModal = function()
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

home.isSignModalHasReward = function()
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
home.clickSignModalGetReward = function()
  tap(953, 872, 100)
  return true
end

-- 签到确认窗口
home.isSignConfirmModal = function()
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
home.clickSignConfirmModalGetReward = function()
  tap(961, 716, 100)
  return true
end

-- 点击领取签到关闭
home.clickSignModalClose = function()
  tap(1567, 98, 100)
  return true
end

return home
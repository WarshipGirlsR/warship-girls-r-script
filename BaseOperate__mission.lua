local mission = {}

-- -- 任务流程

-- 是否有没领取的任务
mission.isUnreceivedMission = function()
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
mission.clickMission = function()
  tap(785, 1016, 100)
end

-- 等待任务界面
mission.isMission = function()
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
missionClickAllMission = function()
  tap(785, 1016, 100)
end

-- 等待全部任务界面
mission.isMissionAllMission = function()
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
mission.isMissionUnreceivedReward = function()
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
mission.clickGetFirstReward = function()
  tap(1755, 190, 100)
end

-- 等待获得面板
mission.isRewardPannel = function()
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
mission.clickRewardPannelOk = function()
  tap(955, 717, 100)
end

-- 等待新船
mission.isNewShipPage = function()
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
mission.clickNewShip = function()
  tap(972, 399, 100)
end

-- 等待新船锁定对话框
mission.isNewShipPageLockModal = function()
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
mission.clickNewShipPageLockModalOkBtn = function()
  tap(741, 713, 100)
end

-- 点击任务面板的返回港口
mission.clickBackToHome = function()
  tap(136, 986, 100)
end

return mission
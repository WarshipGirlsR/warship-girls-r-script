local network = {}

-- 等待网络连接不通对话框
network.isNetworkFailureModal = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 518, 242, 0x088ece }, { 1105, 291, 0x0875bd }, { 1408, 293, 0xcecabd }, { 1401, 774, 0xbdb69c },
    { 518, 777, 0xbdb69c }, { 828, 679, 0x42ceef }, { 1088, 733, 0xa41000 },

    { 564, 451, 0xcecabd }, { 1356, 451, 0xcecabd },
    { 804, 512, 0xd6cac5 }, { 1116, 512, 0xd6cac5 },
    { 594, 447, 0xf7fbf7 }, { 743, 515, 0xd6cec5 },
    { 1176, 513, 0xcecabd }, { 1203, 443, 0xffffff },
    { 1022, 450, 0xd6cac5 }, { 844, 455, 0xcecabd },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击网络不通 确认
network.clickNetworkFailureModalOk = function()
  tap(741, 717, 100)
  return true
end

-- 点击网络不通 取消
network.clickNetworkFailureModalCancel = function()
  tap(1174, 718, 100)
  return true
end

-- 等待检查您的网络对话框
network.isCheckNetworkModal = function()
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
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击检查您的网络对话框 确认
network.clickCheckNetworkModalOk = function()
  tap(951, 716, 100)
  return true
end

return network
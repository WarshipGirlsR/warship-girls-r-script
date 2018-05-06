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
    { 521, 250, 0x0079bd }, { 1094, 294, 0x0869ad },
    { 1407, 300, 0xcecabd }, { 1402, 777, 0xbdb69c },
    { 512, 771, 0xbdb69c }, { 871, 679, 0x4ad2f7 },
    { 949, 679, 0x4ad2f7 }, { 1036, 676, 0x4ad2f7 },
    { 952, 744, 0x0092c5 }, { 926, 708, 0xffffff },
    { 777, 478, 0xffffff }, { 808, 475, 0x29555a },
    { 850, 480, 0x214952 }, { 889, 478, 0xf7f7f7 },
    { 929, 471, 0x10414a }, { 975, 477, 0xeff3f7 },
    { 1012, 478, 0x103d42 }, { 1050, 479, 0xffffff },
    { 1075, 478, 0x08353a }, { 1117, 479, 0x31555a },
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
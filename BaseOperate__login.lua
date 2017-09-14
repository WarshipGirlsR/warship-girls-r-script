local login = {}


-- 启动游戏
login.startApp = function()
  if (isFrontApp("com.huanmeng.zhanjian2") ~= 1) then
    runApp("com.huanmeng.zhanjian2")
  end
end

-- 重启游戏
login.restartApp = function()
  closeApp("com.huanmeng.zhanjian2")
  mSleep(1000)
  return runApp("com.huanmeng.zhanjian2")
end

-- 游戏正在运行
login.isAppRunning = function()
  if (isFrontApp("com.huanmeng.zhanjian2") == 1) then
    return true
  end
  return false
end

-- 游戏不在运行
login.isAppNotRun = function()
  if (isFrontApp("com.huanmeng.zhanjian2") == 1) then
    return false
  end
  return true
end

-- 是否在登录界面
login.isLoginPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 370, 242, 0x0886ce }, { 1507, 293, 0xd6cec5 },
    { 1533, 772, 0xcec6bd }, { 390, 759, 0xcecabd },
    { 477, 679, 0x42caef }, { 1240, 672, 0xef863a },
    { 443, 405, 0xc5baa4 }, { 539, 397, 0xc5baa4 },
    { 596, 403, 0xffffff }, { 599, 417, 0xc5baa4 },
    { 468, 536, 0xc5b6a4 }, { 524, 545, 0xbdb29c },
    { 552, 531, 0xffffff }, { 607, 535, 0xc5baa4 },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击登录
login.clickLoginBtn = function()
  tap(1343, 701, 100)
  return true
end

-- 是否在选择服务器界面
login.isSelectServerPage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 443, 759, 0x0896d6 }, { 480, 829, 0xc5cac5 },
    { 538, 842, 0x109ad6 }, { 833, 847, 0x1075b5 },
    { 865, 758, 0x0871ad }, { 1130, 846, 0x1071b5 },
    { 1232, 758, 0x086dad }, { 1387, 761, 0x086db5 },
    { 1470, 847, 0x0879bd }, { 1442, 781, 0xc5cac5 },
    { 668, 907, 0xadeff7 }, { 757, 910, 0xbdf3f7 },
    { 843, 907, 0xcef7ff }, { 1104, 912, 0x8cd7de },
    { 1158, 906, 0x9cd7e6 }, { 1248, 906, 0x9cd7de },
    { 1172, 970, 0x8cbed6 }, { 1129, 1022, 0x6b96c5 },
    { 800, 1023, 0xa4c6e6 }, { 769, 1001, 0xadceef },
    { 831, 942, 0xfffbff }, { 869, 966, 0xf7fbff },
    { 925, 957, 0xffffff }, { 1017, 973, 0xffffff },
    { 1076, 953, 0xf7fbff }, { 991, 946, 0xfffbff },
    { 1093, 990, 0xf7fbff },
  }
  local result = multiColorS(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击登录服务器
login.clickLoginServerBtn = function()
  tap(953, 965, 100)
  return true
end

return login
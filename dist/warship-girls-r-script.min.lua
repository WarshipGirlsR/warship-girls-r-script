

do

do
local _ENV = _ENV
package.preload[ "BaseOperate" ] = function( ... ) local arg = _G.arg;
local network = require 'BaseOperate__network'
local home = require 'BaseOperate__home'
local login = require 'BaseOperate__login'
local battle = require 'BaseOperate__battle'
local mission = require 'BaseOperate__mission'
local expedition = require 'BaseOperate__expedition'
local repair = require 'BaseOperate__repair'
local exercise = require 'BaseOperate__exercise'


-- 原子操作列表

local map = {
  network = network, -- 网络检查
  home = home, -- 主页
  login = login, -- 登录
  battle = battle, -- 出征
  mission = mission, -- 任务
  expedition = expedition, -- 远征
  repair = repair, -- 修理
  exercise = exercise, -- 演习
  campaign = campaign, -- 战役
}


return function()
  return map
end
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__ImgInfo" ] = function( ... ) local arg = _G.arg;
require 'TableLib'

local function transRelativePoint(tab, base)
  local newTab = {}
  for key, value in ipairs(tab) do
    newTab[key] = table.assign(value, { value[1] - base[1], value[2] - base[2] })
  end
  return newTab
end

local function transColorListToString(tab)
  local tmp = {}
  for key, value in ipairs(tab) do
    value[3] = string.format('0x%06X', value[3])
    table.insert(tmp, table.concat(value, '|'))
  end
  return table.concat(tmp, ',')
end

return {
  -- 基本方法
  toPoint = function(tab)
    local newTab = {}
    for _, value in ipairs(tab) do
      table.insert(newTab, { value.x, value.y })
    end
    return newTab
  end,
  -- 图片数据
  battle = {
    -- 敌方信息面板
    enemyInfoPanel = {
      -- 雷巡
      Cit = (function()
        local leftTop = { 192, 304 }
        local rightBotton = { 943, 797 }
        local basePoint = { 596, 507, 0xf7f7f7 }
        local posandcolor = transColorListToString(transRelativePoint({
          { 619, 508, 0xdee3de }, { 633, 510, 0xe6e7e6 },
          { 667, 517, 0x3ab2ce }, { 678, 520, 0xcecece },
          { 675, 530, 0x00cade }, { 651, 531, 0x42555a },
          { 635, 531, 0xded7de }, { 614, 532, 0x5a5d5a },
          { 603, 519, 0x4a494a }, { 603, 524, 0x4a4d4a },
          { 599, 530, 0xd6d2d6 }, { 601, 538, 0xdedfde },
          { 614, 537, 0xd6d2d6 }, { 629, 537, 0x6b6d6b },
          { 651, 536, 0x4a4d4a }, { 664, 539, 0x3aaec5 },
          { 682, 552, 0x3a5152 }, { 678, 552, 0xeff3ef },
          { 671, 554, 0x42454a }, { 643, 563, 0x21bade },
          { 633, 557, 0x52b2ce }, { 614, 574, 0xcecace },
          { 641, 594, 0xcecace }, { 637, 584, 0x00c2e6 },
        }, basePoint))
        return { leftTop = leftTop, rightBotton = rightBotton, basePoint = basePoint, posandcolor = posandcolor, }
      end)(),
      -- 航母
      CV = (function()
        local leftTop = { 192, 304 }
        local rightBotton = { 943, 797 }
        local basePoint = { 213, 325, 0xefebef }
        local posandcolor = transColorListToString(transRelativePoint({
          { 242, 323, 0xcecace }, { 254, 323, 0xcecace },
          { 264, 323, 0x296573 }, { 273, 328, 0x7b797b },
          { 266, 328, 0x94e7ef }, { 254, 328, 0x5a595a },
          { 241, 328, 0x8c8a8c }, { 232, 328, 0xd6d2d6 },
          { 224, 328, 0xe6e3e6 }, { 218, 347, 0x525552 },
          { 233, 347, 0x424142 }, { 237, 347, 0xffffff },
          { 246, 347, 0x94babd }, { 264, 347, 0x7bd7de },
          { 270, 347, 0x7bd7e6 }, { 288, 356, 0x00bede },
          { 272, 370, 0x19819c }, { 244, 383, 0x21bede },
          { 260, 393, 0xe6ebe6 }, { 281, 386, 0x424542 },
          { 288, 372, 0x008aa4 }, { 284, 390, 0xa4a6a4 },
          { 244, 403, 0x00bede }, { 237, 407, 0xcecece },
        }, basePoint))
        return { leftTop = leftTop, rightBotton = rightBotton, basePoint = basePoint, posandcolor = posandcolor, }
      end)(),
      -- 潜艇
      SS = (function()
        local leftTop = { 192, 304 }
        local rightBotton = { 943, 797 }
        local basePoint = { 207, 328, 0xefefef }
        local posandcolor = transColorListToString(transRelativePoint({
          { 222, 328, 0xdedfde }, { 231, 327, 0xd6d2d6 },
          { 258, 319, 0xc5cac5 }, { 250, 326, 0x524d52 },
          { 234, 329, 0x424542 }, { 236, 337, 0x31393a },
          { 260, 324, 0x7bbece }, { 285, 353, 0x00c2de },
          { 248, 343, 0x3a494a }, { 250, 350, 0xe6e7e6 },
          { 232, 356, 0x424542 }, { 212, 357, 0x425152 },
          { 203, 368, 0x211c19 }, { 222, 370, 0x427984 },
          { 234, 365, 0x31494a }, { 253, 350, 0xfffbff },
          { 269, 367, 0xd6d7d6 }, { 289, 375, 0x19454a },
          { 287, 387, 0x525152 }, { 250, 375, 0x42a2b5 },
          { 258, 403, 0x00a6bd }, { 265, 398, 0xf7fbf7 },
          { 278, 399, 0xefefef }, { 285, 391, 0x525152 },
        }, basePoint))
        return { leftTop = leftTop, rightBotton = rightBotton, basePoint = basePoint, posandcolor = posandcolor, }
      end)(),
      -- 补给（捞战利品）
      AP = (function()
        local leftTop = { 192, 304 }
        local rightBotton = { 943, 797 }
        local basePoint = { 206, 509, 0xefefef }
        local posandcolor = transColorListToString(transRelativePoint({
          { 222, 507, 0xdedfde }, { 230, 508, 0x737573 },
          { 231, 522, 0x3a494a }, { 222, 517, 0xf7f7f7 },
          { 241, 509, 0xdedbde }, { 250, 503, 0x6b797b },
          { 246, 531, 0x4a454a }, { 234, 536, 0x42454a },
          { 234, 550, 0x63a6bd }, { 216, 551, 0x42868c },
          { 271, 540, 0xd6d7d6 }, { 263, 545, 0x424142 },
          { 268, 555, 0xf7fbf7 }, { 270, 561, 0x007184 },
          { 257, 556, 0x4abed6 }, { 252, 568, 0x108eb5 },
          { 256, 580, 0x00799c }, { 268, 573, 0x636163 },
          { 283, 575, 0x424142 }, { 288, 554, 0x08798c },
        }, basePoint))
        return { leftTop = leftTop, rightBotton = rightBotton, basePoint = basePoint, posandcolor = posandcolor, }
      end)(),
    },
  },
}
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__battle" ] = function( ... ) local arg = _G.arg;
local ImgInfo = require 'BaseOperate__ImgInfo'

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
  local result = multiColor(list)
  local result2 = multiColor(list2)
  if (not __keepScreenState) then keepScreen(false) end
  return (result and (not result2))
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
  local result = multiColor(list)
  local result2 = multiColor(list2)
  if (not __keepScreenState) then keepScreen(false) end
  return (result and result2)
end

-- 点击出征
battle.clickBattleBtn = function()
  tap(101, 110, 100)
  return true
end

-- 移动到m-n章节
battle.moveToChapter = function(chapter)
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
battle.clickReadyBattleBtn = function()
  tap(1061, 523, 100)
end

-- 等待出征准备界面
battle.isReadyBattlePage = function()
  local __keepScreenState = keepScreenState
  if (not __keepScreenState) then keepScreen(true) end
  local list = {
    { 77, 125, 0x105d9c },
    { 51, 237, 0xd6cec5 },
    { 50, 842, 0xd6cac5 },
    { 1631, 823, 0xc5baa4 },
    { 1647, 243, 0xd6cec5 },
    { 517, 703, 0xd6cec5 },
    { 1837, 445, 0xdeaa3a },
    { 1828, 648, 0xd6a631 },
    { 1220, 86, 0xcecace },
    { 1647, 136, 0xcecace },
  }
  local result = multiColor(list)
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
  local result = multiColor(list, 60)
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
battle.clickReadyBattlePageQuickSupplyModalOkBtn = function()
  tap(1269, 785, 100)
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
    { 443, 621, 0x9cff8c },
    { 640, 621, 0x94fb84 },
    { 837, 621, 0x9cff8c },
    { 1034, 621, 0x94fb84 },
    { 1231, 621, 0x9cff8c },
    { 1428, 621, 0x94fb84 },
  }
  -- 中破
  local list22 = {
    { 278, 621, 0xefe310 },
    { 474, 621, 0xe6df08 },
    { 671, 621, 0xefe310 },
    { 868, 621, 0xe6df08 },
    { 1065, 621, 0xefe310 },
    { 1262, 621, 0xe6df08 },
  }
  -- 大破
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
battle.clickQuickRepairModalSingleShip = function(shipList)
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
  local result = not multiColor(list, 70)
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
  local result = multiColor(list)
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
    { 92, 210, 0xd6cabd },
    { 931, 211, 0xd6cec5 },
    { 1824, 226, 0xd6cabd },
    { 84, 981, 0xcecabd },
    { 909, 994, 0xcecabd },
    { 1820, 993, 0xcecabd },
    { 1205, 942, 0xcecabd },
    { 1427, 951, 0xad4d08 },
    { 1180, 512, 0xd6cac5 },
  }
  local result = multiColor(list)
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
  local result = multiColor(list)
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
  local pointList = findMultiColorInRegionFuzzyExt(theCV.basePoint[3], theCV.posandcolor, 90, theCV.leftTop[1], theCV.leftTop[2], theCV.rightBotton[1], theCV.rightBotton[2])
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
  local pointList = findMultiColorInRegionFuzzyExt(theCit.basePoint[3], theCit.posandcolor, 90, theCit.leftTop[1], theCit.leftTop[2], theCit.rightBotton[1], theCit.rightBotton[2])
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
  local pointList = findMultiColorInRegionFuzzyExt(theSS.basePoint[3], theSS.posandcolor, 90, theSS.leftTop[1], theSS.leftTop[2], theSS.rightBotton[1], theSS.rightBotton[2])
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
  local pointList = findMultiColorInRegionFuzzyExt(theAP.basePoint[3], theAP.posandcolor, 90, theAP.leftTop[1], theAP.leftTop[2], theAP.rightBotton[1], theAP.rightBotton[2])
  pointList = ImgInfo.toPoint(pointList)
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
  local result = multiColor(list)
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
  local result = multiColor(list)
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
  local result = multiColor(list)
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
    if ((multiColor({ list[i] })) and (not multiColor({ list2[i] }))) then
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
  local result = multiColor(list)
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
  local result = multiColor(list)
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
  local result = multiColor(list)
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
  local result = multiColor(list)
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
battle.clickLevelStepModalContinueBtn = function()
  tap(727, 751, 100)
end

-- 等待前进点击回港
battle.clickLevelStepModalBackBtn = function()
  tap(1181, 748, 100)
end


return battle
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__campaign" ] = function( ... ) local arg = _G.arg;
local battle = require 'BaseOperate__battle';

local campaign = {}


-- 战役流程

-- 是否在出征界面
campaign.isBattlePage = function()
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
campaign.clickCampaignBtn = function()
  tap(102, 530, 100)
  return true
end

-- 是否在战役界面
campaign.isCampaignPage = function()
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
campaign.moveToCampaignMission = function(m)
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
campaign.clickCampainReadyBtn = function(difficulty)
  if (difficulty == 'default') then
    tap(651, 317, 100)
  else
    tap(1504, 309, 100)
  end
  return true
end

-- 等待出征准备界面
campaign.isReadyBattlePage = function()
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
campaign.isReadyBattlePageShipStatusAllRight = function()
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
campaign.isReadyBattlePageShipHPSafe = function(checkLevel)
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
campaign.clickReadyBattlePageBackBtn = battle.clickReadyBattlePageBackBtn

-- 点击快速补给
campaign.clickReadyBattlePageQuickSupplyBtn = battle.clickReadyBattlePageQuickSupplyBtn

-- 等待快速补给界面
campaign.isQuickSupplyModal = battle.isQuickSupplyModal

-- 点击快速补给
campaign.clickReadyBattlePageQuickSupplyModalOkBtn = battle.clickReadyBattlePageQuickSupplyModalOkBtn

-- 点击快速修理
campaign.clickQuickRepairBtn = battle.clickQuickRepairBtn

-- 等待快速修理界面
campaign.isQuickRepairModal = battle.isQuickRepairModal

-- 点击快速修理
campaign.clickQuickRepairModalOkBtn = battle.clickQuickRepairModalOkBtn

-- 检测快速修理界面HP是否安全，有几艘船需要快速修理
campaign.isQuickRepairModalShipNeedRepair = battle.isQuickRepairModalShipNeedRepair

-- 点击快速修理单个船
campaign.clickQuickRepairModalSingleShip = battle.clickQuickRepairModalSingleShip

-- 点击快速补给关闭
campaign.clickQuickSupplyModalCloseBtn = battle.clickQuickSupplyModalCloseBtn

-- 点击快速修理关闭
campaign.clickQuickRepairModalCloseBtn = battle.clickQuickRepairModalCloseBtn

-- 检测舰队可以出征
campaign.isFleetsCanBattle = battle.isFleetsCanBattle

-- 点击出征开始
campaign.clickBattleStartBtn = battle.clickBattleStartBtn

-- 等待额外获得资源面板
campaign.isExtraReceiveModal = battle.isExtraReceiveModal

-- 点击额外获得确定
campaign.clickExtraReceiveModalOk = battle.clickExtraReceiveModalOk

-- 等待快开始战斗界面
campaign.isBattleStartPage = function()
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
campaign.clickBattleStartModalStartBtn = function()
  tap(1326, 862, 100)
  return true
end

-- 等待阵型界面
campaign.isFormationPage = battle.isFormationPage

-- 点击阵型
campaign.clickFormationPageStartBtn = battle.clickFormationPageStartBtn

-- 等待追击页面
campaign.isPursueModal = battle.isPursueModal

-- 点击追击
campaign.clickPursueModalOk = battle.clickPursueModalOk

-- 点击放弃
campaign.clickPursuePageCancel = battle.clickPursuePageCancel

-- 等待胜利界面
campaign.isVictoryPage = battle.isVictoryPage

-- 胜利界面检测船是否受损
campaign.isVictoryPageShipDamaged = battle.isVictoryPageShipDamaged

-- 胜利界面检测船HP是否安全
campaign.isVictoryPageShipHPSafe = battle.isVictoryPageShipHPSafe

-- 点击胜利继续
campaign.clickVictoryPageContinueBtn = battle.clickVictoryPageContinueBtn

-- 等待胜利继续面板
campaign.isVictoryPage2 = battle.isVictoryPage2

-- 点击胜利继续2
campaign.clickVictoryPageContinueBtn2 = battle.clickVictoryPageContinueBtn2

-- 检测胜利对手详情页面
campaign.isVictoryOpponentDetailPage = function()
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
campaign.clickVictoryOpponentDetailPageClose = function()
  tap(1803, 217, 100)
end

-- 返回home
campaign.clickBackToHomeBtn = battle.clickBackToHomeBtn
-- 战役流程


return campaign
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__exercise" ] = function( ... ) local arg = _G.arg;
local battle = require 'BaseOperate__battle';

local exercise = {}


-- 演习流程

-- 是否在出征页面
exercise.isBattlePage = function()
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
exercise.clickExerciseBtn = function()
  tap(103, 252, 100)
  return true
end

--  检测演习界面
exercise.isExercisePage = function()
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
exercise.isExercisePageHaveExercise = function()
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
exercise.clickToNExerciseBtn = function(n)
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
exercise.isReadyBattlePage = battle.isReadyBattlePage

-- 点击选择舰队
exercise.selectFleet = battle.selectFleet

-- 检测所有状态正常
exercise.isReadyBattlePageShipStatusAllRight = battle.isReadyBattlePageShipStatusAllRight

-- 检测hp是否安全
exercise.isReadyBattlePageShipHPSafe = battle.isReadyBattlePageShipHPSafe

-- 不满血，返回出征
exercise.clickReadyBattlePageBackBtn = battle.clickReadyBattlePageBackBtn

-- 点击快速补给
exercise.clickReadyBattlePageQuickSupplyBtn = battle.clickReadyBattlePageQuickSupplyBtn

-- 等待快速补给界面
exercise.isQuickSupplyModal = battle.isQuickSupplyModal

-- 点击快速补给
exercise.clickReadyBattlePageQuickSupplyModalOkBtn = battle.clickReadyBattlePageQuickSupplyModalOkBtn

-- 点击快速修理
exercise.clickQuickRepairBtn = battle.clickQuickRepairBtn

-- 等待快速修理界面
exercise.isQuickRepairModal = battle.isQuickRepairModal

-- 点击快速修理
exercise.clickQuickRepairModalOkBtn = battle.clickQuickRepairModalOkBtn

-- 检测快速修理界面HP是否安全，有几艘船需要快速修理
exercise.isQuickRepairModalShipNeedRepair = battle.isQuickRepairModalShipNeedRepair

-- 点击快速修理单个船
exercise.clickQuickRepairModalSingleShip = battle.clickQuickRepairModalSingleShip

-- 点击快速补给关闭
exercise.clickQuickSupplyModalCloseBtn = battle.clickQuickSupplyModalCloseBtn

-- 点击快速修理关闭
exercise.clickQuickRepairModalCloseBtn = battle.clickQuickRepairModalCloseBtn

-- 检测舰队可以出征
exercise.isFleetsCanBattle = battle.isFleetsCanBattle

-- 点击出征开始
exercise.clickBattleStartBtn = battle.clickBattleStartBtn

-- 等待额外获得资源面板
exercise.isExtraReceiveModal = battle.isExtraReceiveModal

-- 点击额外获得确定
exercise.clickExtraReceiveModalOk = battle.clickExtraReceiveModalOk

-- 等待快开始战斗界面
exercise.isBattleStartPage = function()
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
exercise.clickBattleStartModalStartBtn = function()
  tap(1326, 862, 100)
  return true
end

-- 等待阵型界面
exercise.isFormationPage = battle.isFormationPage

-- 点击阵型
exercise.clickFormationPageStartBtn = battle.clickFormationPageStartBtn

-- 等待追击页面
exercise.isPursueModal = battle.isPursueModal

-- 点击追击
exercise.clickPursueModalOk = battle.clickPursueModalOk

-- 点击放弃
exercise.clickPursuePageCancel = battle.clickPursuePageCancel

-- 等待胜利界面
exercise.isVictoryPage = battle.isVictoryPage

-- 胜利界面检测船是否受损
exercise.isVictoryPageShipDamaged = battle.isVictoryPageShipDamaged

-- 胜利界面检测船HP是否安全
exercise.isVictoryPageShipHPSafe = battle.isVictoryPageShipHPSafe

-- 点击胜利继续
exercise.clickVictoryPageContinueBtn = battle.clickVictoryPageContinueBtn

-- 等待胜利继续面板
exercise.isVictoryPage2 = battle.isVictoryPage2

-- 点击胜利继续2
exercise.clickVictoryPageContinueBtn2 = battle.clickVictoryPageContinueBtn2

-- 检测胜利对手详情页面
exercise.isVictoryOpponentDetailPage = function()
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
exercise.clickVictoryOpponentDetailPageClose = function()
  tap(1803, 217, 100)
  return true
end

-- 返回home
exercise.clickBackToHomeBtn = battle.clickBackToHomeBtn


return exercise
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__expedition" ] = function( ... ) local arg = _G.arg;
local battle = require 'BaseOperate__battle';
local home = require 'BaseOperate__home';

local expedition = {}

-- -- 远征流程
-- 检测有远征完成
expedition.isExpeditionCompleted = function()
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
expedition.clickBattle = home.clickBattleBtn

-- 检测在出征界面
expedition.isBattlePage = function()
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
expedition.clickExpedition = function()
  tap(108, 394, 100)
  return true
end

-- 检测在出征远征界面
expedition.isBattleExpedition = function()
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
expedition.moveToChapter = function(n, m)
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
expedition.isThisExpeditionPageHasReward = function()
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
  local result = false
  if (result1 or result2 or result3 or result4) then
    result = true
  end
  local hasTable = {}
  if (result1) then table.insert(hasTable, 1) end
  if (result2) then table.insert(hasTable, 2) end
  if (result3) then table.insert(hasTable, 3) end
  if (result4) then table.insert(hasTable, 4) end
  if (not __keepScreenState) then keepScreen(false) end
  return result, hasTable
end

-- 点击第n个按钮
expedition.clickExpeditionBtn = function(n)
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
  return true
end

-- 检测在远征完成界面
expedition.isExpeditionCompletedPage = function()
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
expedition.clickRewardPannelOk = function()
  tap(1644, 1022, 100)
  return true
end

-- 检测第n章能否远征
expedition.isChapterCanExpedition = function(n)
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
expedition.isReadyBattlePage = battle.isReadyBattlePage

-- 选择舰队
expedition.clickSelectFleet = battle.selectFleet

-- 检测所有状态正常
expedition.isReadyBattlePageShipStatusAllRight = battle.isReadyBattlePageShipStatusAllRight

-- 检测hp是否安全
expedition.isReadyBattlePageShipHPSafe = battle.isReadyBattlePageShipHPSafe

-- 点击快速补给
expedition.clickReadyBattlePageQuickSupplyBtn = battle.clickReadyBattlePageQuickSupplyBtn

-- 检测快速补给界面
expedition.isQuickSupplyModal = battle.isQuickSupplyModal

-- 点击快速补给确定
expedition.clickReadyBattlePageQuickSupplyModalOkBtn = battle.clickReadyBattlePageQuickSupplyModalOkBtn

-- 点击快速补给关闭
expedition.clickQuickSupplyModalCloseBtn = battle.clickQuickSupplyModalCloseBtn

-- 点击快速维修
expedition.clickQuickRepairBtn = battle.clickQuickRepairBtn

-- 等待快速维修界面
expedition.isQuickRepairModal = battle.isQuickRepairModal

-- 点击快速维修确定
expedition.clickQuickRepairModalOkBtn = battle.clickQuickRepairModalOkBtn

-- 点击快速修理关闭
expedition.clickQuickRepairModalCloseBtn = battle.clickQuickRepairModalCloseBtn

-- 检测快速修理界面HP是否安全，有几艘船需要快速修理
expedition.isQuickRepairModalShipNeedRepair = battle.isQuickRepairModalShipNeedRepair

-- 点击快速修理单个船
expedition.clickQuickRepairModalSingleShip = battle.clickQuickRepairModalSingleShip

-- 检测舰队可以出征
expedition.isFleetsCanBattle = battle.isFleetsCanBattle

-- 点击返回远征界面
expedition.clickBackToExpedition = function()
  tap(1812, 974, 100)
  return true
end

-- 点击远征开始
expedition.clickBattleStartBtn = battle.clickBattleStartBtn

-- 点击返回港口
expedition.clickBackToHome = function()
  tap(101, 1015, 100)
  return true
end

return expedition
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__home" ] = function( ... ) local arg = _G.arg;
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
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__login" ] = function( ... ) local arg = _G.arg;
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

-- 是否在选择服务器界面
login.isSelectServerPage = function()
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
login.clickLoginBtn = function()
  tap(953, 965, 100)
  return true
end

return login
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__mission" ] = function( ... ) local arg = _G.arg;
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
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__network" ] = function( ... ) local arg = _G.arg;
local network = {}

-- 等待网络连接不通对话框
network.isNetworkFailureModal = function()
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
  local result = multiColor(list)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 点击检查您的网络对话框 确认
network.clickCheckNetworkModalOk = function()
  tap(951, 716, 100)
  return true
end

return network
end
end

do
local _ENV = _ENV
package.preload[ "BaseOperate__repair" ] = function( ... ) local arg = _G.arg;
local repair = {}


-- -- 修理流程

-- 点击船坞按钮
repair.clickDockBtn = function()
  tap(1442, 743, 100)
  return true
end

-- 检测船坞界面
repair.isDockPage = function()
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
repair.clickRepairBtn = function()
  tap(101, 253, 100)
  return true
end

-- 检测修理界面
repair.isRepairPage = function()
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
repair.hasEmptyRepairSlot = function()
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
  local result = false
  if (result1 or result2 or result3 or result4) then
    result = true
  end
  local hasTable = {}
  if (result1) then table.insert(hasTable, 1) end
  if (result2) then table.insert(hasTable, 2) end
  if (result3) then table.insert(hasTable, 3) end
  if (result4) then table.insert(hasTable, 4) end
  if (not __keepScreenState) then keepScreen(false) end
  return result, hasTable
end

-- 检测第n个修理槽位可用
repair.isSlotEmpty = function(n)
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
repair.isSlotNotEmpty = function(n)
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
repair.clickRepairSlotBtn = function(n)
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
repair.isSelectShipPage = function()
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

-- 寻找一个不在舰队里的船
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

-- 寻找一个不在舰队里的船。
-- 先找到所有船的位置，再找到所有在舰队里船的位置，将两个数组相差
repair.findFirstShipNotInFleet = function()
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

-- 点击第一艘船
repair.clickFirstShip = function()
  tap(151, 432, 100)
  return true
end

-- 点击一搜船
repair.clickAShip = function(point)
  tap(point[1], point[2], 100)
end

-- 滑动到下一页
repair.moveToNextPage = function()
  local point = {
    { 1477, 824, 0x3a516b },
    { 265, 814, 0xcecabd },
  }
  moveTo(point[1][1], point[1][2], point[2][1], point[2][2], 100)
end

-- 点击返回港口
repair.clickSelectShipPageBackBtn = function()
  tap(1819, 974, 100)
end

-- 点击返回港口
repair.clickBackToHomeBtn = function()
  tap(100, 1015, 100)
  return true
end

return repair
end
end

do
local _ENV = _ENV
package.preload[ "CheckColor" ] = function( ... ) local arg = _G.arg;
init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080

local list = {
  { 77, 125, 0x105d9c },
  { 51, 237, 0xd6cec5 },
  { 50, 842, 0xd6cac5 },
  { 1631, 823, 0xc5baa4 },
  { 1647, 243, 0xd6cec5 },
  { 517, 703, 0xd6cec5 },
  { 1837, 445, 0xdeaa3a },
  { 1828, 648, 0xd6a631 },
  { 1220, 86, 0xcecace },
  { 1647, 136, 0xcecace },
}

local resultStr = ''

for key, value in ipairs(list) do
  local color = getColor(value[1], value[2])
  local oldColor = value[3]
  local colorStr = string.format('0x%06x', color)
  local oldColorStr = string.format('0x%06x', oldColor)
  value[3] = oldColorStr
  if (color == oldColor) then
    resultStr = resultStr .. '\n' .. console.getJsStr(value)
  else
    value[3] = colorStr
    resultStr = resultStr .. '\n' .. console.getJsStr(value) .. '  old Color: ' .. oldColorStr
  end
end

console.log(resultStr)
mSleep(6000)
keepScreen(false)
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

-- 0=竖屏，1=右旋（home键在右边），2=左旋（home键在左边），3=倒立
__init(0)
local w, h = getScreenSize()
local m = math.max(w, h)
local sideLength = math.min(w, h)
local orient = 0;
local nextUpdateTime = 0

-- 计算方向辅助界面，一像素宽度的白色边界，一像素宽的黑色边界，用于检测方向
fwShowWnd("orientwid1", 0, 0, 2, m, 0)
fwShowTextView("orientwid1", "text1", "", "center", "000000", "FEFEFE", 15, 0, 0, 0, 1, m, 1)
fwShowTextView("orientwid1", "text2", "", "center", "000000", "010101", 15, 0, 1, 0, 2, m, 1)
mSleep(100)

-- 计算当前方向
function calOrient(_orient)
  local result = _orient
  -- 寻找白色边界
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

  -- 如果方向没变则不旋转
  if (multiColor(checkPointList)) then
    return _orient
  end
  -- 如果方向变了则旋转
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

-- 获取当前方向
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
  if (theEventObj) then
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
package.preload[ "GetColor" ] = function( ... ) local arg = _G.arg;
init(1)
require 'console'
mSleep(6000)

keepScreen(false)
keepScreen(true)
local sideLength = 1080
local list = {
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

local resultStr = ''

for key, value in ipairs(list) do
  local color = getColor(value[1], value[2])
  local oldColor = value[3]
  local colorStr = string.format('0x%06x', color)
  local oldColorStr = string.format('0x%06x', oldColor)
  value[3] = oldColorStr
  resultStr = resultStr .. '\n' .. '{ ' .. value[1] .. ', ' .. value[2] .. ', ' .. colorStr .. ' },'
end
resultStr = resultStr .. '\n'
console.log(resultStr)
mSleep(6000)
keepScreen(false)
end
end

do
local _ENV = _ENV
package.preload[ "GoMission" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local homeFactory = require 'GoMission__home'
local networkFactory = require 'GoMission__network'
local pauseFactory = require 'GoMission__pause'
local loginFactory = require 'GoMission__login'
local battleOnceFactory = require 'GoMission__battleOnce'
local missionFactory = require 'GoMission__mission'
local expeditionRewardFactory = require 'GoMission__expeditionReward'
local expeditionOnceFactory = require 'GoMission__expeditionOnce'
local repairOnceFactory = require 'GoMission__repairOnce'
local exerciseOnceFactory = require 'GoMission__exerciseOnce'
local campaignOnceFactory = require 'GoMission__campaignOnce'

-- 运行时的变量，全局共享
local stateTree = require 'GoMission__stateTree'
-- 保存整个GoMission共享的参数
local allOptions = require 'GoMission__options'

local c = coroutine






-- 将分散在各个文件的任务集合到一起
local missions = {
  home = homeFactory(stateTree),
  network = networkFactory(stateTree),
  pause = pauseFactory(stateTree),
  login = loginFactory(stateTree),
  battleOnce = battleOnceFactory(stateTree),
  mission = missionFactory(stateTree),
  expeditionReward = expeditionRewardFactory(stateTree),
  expeditionOnce = expeditionOnceFactory(stateTree),
  repairOnce = repairOnceFactory(stateTree),
  exerciseOnce = exerciseOnceFactory(stateTree),
  campaignOnce = campaignOnceFactory(stateTree),
}

return {
  init = function(map, settings)
    -- 定义需要全局监听状态
    allOptions.map = map
    allOptions.settings = settings

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
package.preload[ "GoMission__battleOnce" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local allOptions = require 'GoMission__options'
local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener


local battleOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

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

      -- 出征后就应该需要维修
      state.repair.needRepair = true

      stepLabel.setStepLabelContent('2-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_HOME_CLICK_BATTLE') then

      stepLabel.setStepLabelContent('2-2.点击出征')
      map.home.clickBattleBtn()
      stepLabel.setStepLabelContent('2-3.等待出征页面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage },
        { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_BATTLE_PAGE') then

      stepLabel.setStepLabelContent('2-5.出征页面点击出征的出征按钮')
      c.yield(sleepPromise(500))
      map.battle.clickBattleBtn()
      stepLabel.setStepLabelContent('2-6.等待出征的出征界面')

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
      stepLabel.setStepLabelContent('2-7.出征的出征页面')
      stepLabel.setStepLabelContent('2-8.移动到章节' .. state.battle.battleChapter)
      c.yield(sleepPromise(300))
      map.battle.moveToChapter(state.battle.battleChapter)
      stepLabel.setStepLabelContent('2-9.进入章节')
      c.yield(sleepPromise(300))
      map.battle.clickReadyBattleBtn()
      c.yield(sleepPromise(100))
      stepLabel.setStepLabelContent('2-10.等待出征准备界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage, 2000 },
        { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage, 2000 },
        { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE') then

      if ((state.battle.quickSupplyCount <= 0) and (state.battle.quickRepairCount <= 0)) then
        -- 还没快速补给，还没维修
        stepLabel.setStepLabelContent('2-11.选择舰队:' .. settings.battleFleet)
        map.battle.selectFleet(settings.battleFleet)
        stepLabel.setStepLabelContent('2-12.检测所有状态正常')
        c.yield(sleepPromise(1000))
        local res = map.battle.isReadyBattlePageShipStatusAllRight()
        if (res) then
          stepLabel.setStepLabelContent('2-13.状态正常')
          state.battle.quickSupplyCount = 1
          state.battle.quickRepairCount = 1
          return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
        else
          stepLabel.setStepLabelContent('2-14.状态不正常')
          map.battle.clickReadyBattlePageQuickSupplyBtn()
          stepLabel.setStepLabelContent('6-12.等待快速补给界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
            { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.isQuickSupplyModal },
          }))
          return makeAction(newstateTypes), state
        end
      elseif (state.battle.quickRepairCount <= 0) then
        -- 已经快速补给，还没维修
        stepLabel.setStepLabelContent('2-15.检测血量是否安全')
        c.yield(sleepPromise(1000))
        local res = map.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('2-16.血量安全')
          state.battle.quickRepairCount = 1
          return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
        else
          if (settings.battleQuickRepair > 0) then
            stepLabel.setStepLabelContent('2-17.血量不安全，快修')
            map.battle.clickQuickRepairBtn()

            state.battle.quickRepairSingleLastShip = 0
            state.battle.quickRepairSingleCount = 0

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
              { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('2-18.血量不安全')
            state.battle.quickRepairCount = 1
            return { type = 'BATTLE_READY_BATTLE_PAGE' }, state
          end
        end
      else
        -- 已经快速补给，已经维修
        stepLabel.setStepLabelContent('2-19.再次检测血量是否安全')
        c.yield(sleepPromise(500))
        -- 不允许大破出征
        local res = map.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('2-20.血量安全，继续')
          return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
        else
          stepLabel.setStepLabelContent('2-21.血量不安全，返回')
          return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO'), state
        end
      end

    elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL') then

      stepLabel.setStepLabelContent('2-22.快速补给界面点击确定')
      map.battle.clickReadyBattlePageQuickSupplyModalOkBtn()
      stepLabel.setStepLabelContent('2-23.等待出征准备界面')
      state.battle.quickSupplyCount = state.battle.quickSupplyCount + 1
      if (state.battle.quickSupplyCount < 3) then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
          { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.isQuickSupplyModal, 2000 },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('2-24.资源数量不足')
        return { type = 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE' }, state
      end

    elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('2-25.点击快速补给关闭')
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
        -- 不满血则快修
        stepLabel.setStepLabelContent('2-26.点击快速修理确定')
        c.yield(sleepPromise(500))
        map.battle.clickQuickRepairModalOkBtn()
        state.battle.quickRepairCount = state.battle.quickRepairCount + 1
        stepLabel.setStepLabelContent('2-27.等待出征准备界面')
        if (state.battle.quickRepairCount < 3) then
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
            { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 2000 },
          }))
          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('2-28.快修数量不足')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.battleQuickRepair == 2) then
        -- 中破或大破快修
        stepLabel.setStepLabelContent('2-29.寻找中破或大破的船')
        c.yield(sleepPromise(1000))
        local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
        if (#res > 0) then

          if ((state.battle.quickRepairSingleLastShip ~= res[1]) or (state.battle.quickRepairSingleCount < 3)) then
            state.battle.quickRepairSingleLastShip = res[1]
            state.battle.quickRepairSingleCount = state.battle.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('2-30.中破或大破:' .. table.concat(res, ','))
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
            stepLabel.setStepLabelContent('2-31.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('2-32.修理完成')
          state.battle.quickRepairCount = state.battle.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.battleQuickRepair == 1) then
        -- 大破快修
        stepLabel.setStepLabelContent('2-33.寻找大破的船')
        c.yield(sleepPromise(1000))
        local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
        if (#res > 0) then
          if ((state.battle.quickRepairSingleLastShip ~= res[1]) or (state.battle.quickRepairSingleCount < 3)) then
            state.battle.quickRepairSingleLastShip = res[1]
            state.battle.quickRepairSingleCount = state.battle.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('2-34.大破:' .. table.concat(res, ','))
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
            stepLabel.setStepLabelContent('2-35.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('2-36.修理完成')
          state.battle.quickRepairCount = state.battle.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end
      end

    elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('2-37.点击快速修理关闭')
      c.yield(sleepPromise(500))
      map.battle.clickQuickRepairModalCloseBtn()
      c.yield(sleepPromise(300))
      stepLabel.setStepLabelContent('2-38.等待出征准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal, 2000 },
        { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

      stepLabel.setStepLabelContent('2-39.检测舰队可以出征')
      c.yield(sleepPromise(500))
      local fleetCanBattle = map.battle.isFleetsCanBattle()
      if (fleetCanBattle) then
        stepLabel.setStepLabelContent('2-40.可以出征')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.battle.isReadyBattlePage },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('2-41.返回HOME')
        return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO'), state
      end

    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CAN_GO') then

      stepLabel.setStepLabelContent('2-42.出征准备界面，点击出征开始')
      c.yield(sleepPromise(100))
      map.battle.clickBattleStartBtn()
      return { type = 'BATTLE_GO_A_BATTLE' }, state

    elseif (action.type == 'BATTLE_GO_A_BATTLE') then

      state.battle.passBattleStartPage = false

      if (state.battle.battleNum < settings.battleMaxBattleNum) then
        stepLabel.setStepLabelContent('2-43.第' .. state.battle.battleNum .. '战开始')
      else
        stepLabel.setStepLabelContent('2-44.第' .. state.battle.battleNum .. '战Boss战开始')
      end
      stepLabel.setStepLabelContent('2-45.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
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

      stepLabel.setStepLabelContent('2-46.额外获得面板，点击确定')
      map.battle.clickExtraReceiveModalOk()
      stepLabel.setStepLabelContent('2-47.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
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

      -- 6-1第一战，遇到2航母，返回港口
      state.battle.passBattleStartPage = true
      if (settings.battleRebootAt6_1AMeetCV) then
        stepLabel.setStepLabelContent('2-48.开始检测航母')
        if (state.battle.battleChapter == '6-1') then
          if (state.battle.battleNum == 1) then
            c.yield(sleepPromise(500))
            if (map.battle.isEnemyShipIsCV()) then
              stepLabel.setStepLabelContent('2-49.遇到航母，返回港口')
              return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' }), state
            end
          end
        end
      end
      -- 6-1第一战，遇到2雷巡，返回港口
      if (settings.battleRebootAt6_1AMeetCit) then
        stepLabel.setStepLabelContent('2-48.开始检测雷巡')
        if (state.battle.battleChapter == '6-1') then
          if (state.battle.battleNum == 1) then
            c.yield(sleepPromise(500))
            if (map.battle.isEnemyShipIsCit()) then
              stepLabel.setStepLabelContent('2-49.遇到雷巡，返回港口')
              return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' }), state
            end
          end
        end
      end
      -- 所有关卡，遇到补给船就继续，没遇到就返回港口
      if (settings.battleRebootAtNotMeetAP) then
        stepLabel.setStepLabelContent('2-48.开始检测补给')
        c.yield(sleepPromise(500))
        if (not map.battle.isEnemyShipIsAP()) then
          stepLabel.setStepLabelContent('2-49.没遇到补给，返回港口')
          return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' }), state
        end
      end


      stepLabel.setStepLabelContent('2-50.开始面板，点击开始')
      c.yield(sleepPromise(200))
      if (settings.battleRoundabout and map.battle.isBattleStartPageCanRoundabout()) then
        map.battle.clickBattleStartModalRoundaboutBtn()
      else
        map.battle.clickBattleStartModalStartBtn()
      end
      stepLabel.setStepLabelContent('2-51.等待阵型面板，追击面板，胜利界面')
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

      -- 6-1未发现敌舰
      if (settings.battleRebootAt6_1AMeetCV) then
        if (not state.battle.passBattleStartPage) then
          if (state.battle.battleChapter == '6-1') then
            if (state.battle.battleNum == 1) then
              c.yield(sleepPromise(500))
              stepLabel.setStepLabelContent('2-52.未发现敌舰，SL大法')
              return makeAction({ type = 'LOGIN_START_APP' }), state
            end
          end
        end
      end

      stepLabel.setStepLabelContent('2-53.阵型面板')
      c.yield(sleepPromise(100))
      map.battle.clickFormationPageStartBtn(settings.battleFormation)
      stepLabel.setStepLabelContent('2-54.等待追击面板，胜利界面')
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

      stepLabel.setStepLabelContent('2-55.追击面板')
      if ((settings.battlePursue and (state.battle.battleNum < settings.battleMaxBattleNum))
        or (settings.battlePursueBoss and (state.battle.battleNum == settings.battleMaxBattleNum))) then
        stepLabel.setStepLabelContent('2-56.追击')
        map.battle.clickPursueModalOk()
      else
        stepLabel.setStepLabelContent('2-57.放弃追击')
        map.battle.clickPursuePageCancel()
      end
      stepLabel.setStepLabelContent('2-58.等待胜利界面')
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
      stepLabel.setStepLabelContent('2-59.胜利界面检测HP是否安全')
      c.yield(sleepPromise(300))
      -- 有大破就回港
      state.battle.HPIsSafe = map.battle.isVictoryPageShipHPSafe(1)
      if (state.battle.HPIsSafe) then
        stepLabel.setStepLabelContent('2-60.HP安全')
      else
        stepLabel.setStepLabelContent('2-61.HP不安全')
      end
      c.yield(sleepPromise(200))
      stepLabel.setStepLabelContent('2-62.点击胜利继续')
      map.battle.clickVictoryPageContinueBtn()
      stepLabel.setStepLabelContent('2-63.等待胜利继续界面')
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

      stepLabel.setStepLabelContent('2-64.点击胜利继续')
      map.battle.clickVictoryPageContinueBtn2()
      stepLabel.setStepLabelContent('2-65.等待大破警告，新船，下回合窗口，勋章对话框，home')
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

      stepLabel.setStepLabelContent('2-66.大破警告框点击返回')
      map.battle.clickShipSevereDamageModalBack()
      stepLabel.setStepLabelContent('2-67.等待新船，下回合窗口，勋章对话框，home')
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

      stepLabel.setStepLabelContent('2-68.无法前进警告框点击返回')
      map.battle.clickShipCantGoOnModalBackBtn()
      stepLabel.setStepLabelContent('2-69.等待新船，下回合窗口，勋章对话框，home')
      state.battle.HPIsSafe = false
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
        { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_NEW_SHIP_PAGE') then

      stepLabel.setStepLabelContent('2-70.获取新船')
      c.yield(sleepPromise(500))
      map.battle.clickNewShip()
      stepLabel.setStepLabelContent('2-71.等待新船锁定窗口，下回合窗口，勋章对话框，home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
        { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage, 2000 },
        { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.isNewShipPageLockModal },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL') then

      stepLabel.setStepLabelContent('2-72.新船锁定窗口点击确认')
      map.battle.clickNewShipPageLockModalOkBtn()
      stepLabel.setStepLabelContent('2-73.等待下回合窗口，勋章对话框，home')
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
        stepLabel.setStepLabelContent('2-74.点击继续下一关')
        map.battle.clickLevelStepModalContinueBtn()
        state.battle.battleNum = state.battle.battleNum + 1
        return { type = 'BATTLE_GO_A_BATTLE' }, state
      else
        stepLabel.setStepLabelContent('2-75.点击回港')
        map.battle.clickLevelStepModalBackBtn()
        stepLabel.setStepLabelContent('2-76.等待主界面')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal, 2000 },
        }))
        return makeAction(newstateTypes), state
      end

    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CANT_GO') then

      -- 震动提示不能战斗
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

    elseif (action.type == 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME') then

      map.battle.clickBattleStartModalBackToHomeBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleStartPage },
        { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME') then

      map.battle.clickReadyBattlePageBackBtn()
      stepLabel.setStepLabelContent('2-77.等待出征界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME') then

      map.battle.clickBackToHomeBtn()
      stepLabel.setStepLabelContent('2-78.等待主界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage, 2000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil, state
  end))
end

return function(state)
  state.battle = {}
  return battleOnce
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__campaignOnce" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local commonListenerFactory = require 'GoMission__commonListener'
local allOptions = require 'GoMission__options'

local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener

local campaignOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'CAMPAIGN_START') then

      stepLabel.setStepLabelContent('7-1.等待home')
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
      -- 出征后就应该需要维修
      state.repair.needRepair = true

      stepLabel.setStepLabelContent('7-2.点击出征')
      map.home.clickBattleBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage },
        { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_BATTLE_PAGE') then

      stepLabel.setStepLabelContent('7-3.点击战役')
      map.campaign.clickCampaignBtn()
      stepLabel.setStepLabelContent('7-4.等待战役页面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome },
        { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage, 2000 },
        { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_CAMPAIGN_PAGE') then

      c.yield(sleepPromise(100))
      stepLabel.setStepLabelContent('7-5.移动到战役' .. settings.campaignChapter)
      map.campaign.moveToCampaignMission(settings.campaignChapter)
      c.yield(sleepPromise(300))
      stepLabel.setStepLabelContent('7-6.点击战役')
      map.campaign.clickCampainReadyBtn(settings.campaignDifficulty)
      stepLabel.setStepLabelContent('7-7.等待战役准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage, 2000 },
        { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage, 2000 },
        { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE') then

      if ((state.campaign.quickSupplyCount <= 0) and (state.campaign.quickRepairCount <= 0)) then
        stepLabel.setStepLabelContent('7-10.检测所有状态')
        c.yield(sleepPromise(1000))
        local res = map.campaign.isReadyBattlePageShipStatusAllRight()
        if (not res) then
          stepLabel.setStepLabelContent('7-11.状态不正常')
          map.campaign.clickReadyBattlePageQuickSupplyBtn()
          stepLabel.setStepLabelContent('7-12.等待快速补给界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
            { 'CAMPAIGN_QUICK_SUPPLY_MODAL', 'missionsGroup', map.campaign.isQuickSupplyModal },
          }))
          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('7-11.状态正常')
          state.campaign.quickSupplyCount = state.campaign.quickSupplyCount + 1
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE' }, state
        end
      elseif (state.campaign.quickRepairCount <= 0) then
        stepLabel.setStepLabelContent('7-13.检测血量是否安全')
        c.yield(sleepPromise(1000))
        local res = map.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))
        if (res) then
          state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
          stepLabel.setStepLabelContent('7-14.血量安全，继续')
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }, state
        else
          if (settings.campaignQuickRepair > 0) then
            stepLabel.setStepLabelContent('7-15.血量不安全，点击快修')
            map.campaign.clickQuickRepairBtn()
            stepLabel.setStepLabelContent('7-16.等待快修界面')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('7-17.血量不安全，返回')
            return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }, state
          end
        end
      else
        stepLabel.setStepLabelContent('7-18.再次检测血量是否安全')
        c.yield(sleepPromise(1000))
        -- 不允许大破出征
        local res = map.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('7-19.血量安全，继续')
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }, state
        else
          stepLabel.setStepLabelContent('7-20.血量不安全，返回')
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }, state
        end
      end

    elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL') then

      stepLabel.setStepLabelContent('7-22.快速补给界面点击确定')
      map.campaign.clickReadyBattlePageQuickSupplyModalOkBtn()
      stepLabel.setStepLabelContent('7-23.等待出征准备界面')
      state.campaign.quickSupplyCount = state.campaign.quickSupplyCount + 1
      if (state.campaign.quickSupplyCount < 3) then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
          { 'CAMPAIGN_QUICK_SUPPLY_MODAL', 'missionsGroup', map.campaign.isQuickSupplyModal, 2000 },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('7-24.资源数量不足')
        return { type = 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE' }, state
      end

    elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('7-25.点击快速补给关闭')
      c.yield(sleepPromise(100))
      map.campaign.clickQuickSupplyModalCloseBtn()
      stepLabel.setStepLabelContent('7-26.等待出征准备界面')
      c.yield(sleepPromise(300))
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
        { 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickSupplyModal, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL') then

      if (settings.campaignQuickRepair == 3) then
        stepLabel.setStepLabelContent('7-27.点击快速修理确定')
        map.campaign.clickQuickRepairModalOkBtn()
        state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
        stepLabel.setStepLabelContent('7-28.等待出征准备界面')
        if (state.campaign.quickRepairCount < 3) then
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal, 2000 },
          }))
          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('7-29.快修数量不足')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.campaignQuickRepair == 2) then
        -- 中破或大破快修
        stepLabel.setStepLabelContent('7-30.寻找中破或大破的船')
        c.yield(sleepPromise(1000))
        local res = map.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
        if (#res > 0) then
          if ((state.campaign.quickRepairSingleLastShip ~= res[1]) or (state.campaign.quickRepairSingleCount < 3)) then
            state.campaign.quickRepairSingleLastShip = res[1]
            state.campaign.quickRepairSingleCount = state.campaign.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('7-31.中破或大破:' .. table.concat(res, ','))
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
            stepLabel.setStepLabelContent('7-32.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('7-33.修理完成')
          state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.campaignQuickRepair == 1) then
        -- 大破快修
        stepLabel.setStepLabelContent('7-34.寻找大破的船')

        c.yield(sleepPromise(500))
        local res = map.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
        if (#res > 0) then
          if ((state.campaign.quickRepairSingleLastShip ~= res[1]) or (state.campaign.quickRepairSingleCount < 3)) then
            state.campaign.quickRepairSingleLastShip = res[1]
            state.campaign.quickRepairSingleCount = state.campaign.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('7-35.大破:' .. table.concat(res, ','))
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
            stepLabel.setStepLabelContent('7-36.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('7-37.修理完成')
          state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end
      end

    elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('7-38.点击快速修理关闭')
      c.yield(sleepPromise(500))
      map.campaign.clickQuickRepairModalCloseBtn()
      c.yield(sleepPromise(300))
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal, 2000 },
        { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO') then

      stepLabel.setStepLabelContent('7-39.出征准备界面出征开始')
      c.yield(sleepPromise(100))
      map.campaign.clickBattleStartBtn()
      -- 如果没有开始说明无法远征
      return { type = 'CAMPAIGN_GO_A_EXERCISE' }, state

    elseif (action.type == 'CAMPAIGN_GO_A_EXERCISE') then

      stepLabel.setStepLabelContent('7-40.等待出征准备界面，...')
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

      stepLabel.setStepLabelContent('7-41.开始面板，点击开始')
      c.yield(sleepPromise(100))
      map.campaign.clickBattleStartModalStartBtn()
      stepLabel.setStepLabelContent('7-42.等待阵型面板，追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_GO_A_EXERCISE', 'missionsGroup', map.campaign.isReadyBattlePage },
        { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage, 2000 },
        { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_FORMATION_PAGE') then

      stepLabel.setStepLabelContent('7-43.阵型面板')
      c.yield(sleepPromise(100))
      map.campaign.clickFormationPageStartBtn(settings.exerciseFormation)
      stepLabel.setStepLabelContent('7-44.等待追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage },
        { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage, 2000 },
        { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_PURSUE_MODAL') then

      stepLabel.setStepLabelContent('7-45.追击面板')
      c.yield(sleepPromise(100))
      if (settings.exercisePursue) then
        stepLabel.setStepLabelContent('7-46.追击')
        map.campaign.clickPursueModalOk()
      else
        stepLabel.setStepLabelContent('7-47.放弃追击')
        map.campaign.clickPursuePageCancel()
      end
      stepLabel.setStepLabelContent('7-48.等待胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal, 2000 },
        { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_VICTORY_PAGE') then

      stepLabel.setStepLabelContent('7-49.点击胜利继续')
      map.campaign.clickVictoryPageContinueBtn()
      stepLabel.setStepLabelContent('7-50.等待胜利继续界面')
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

      stepLabel.setStepLabelContent('7-51.点击胜利继续')
      map.campaign.clickVictoryPageContinueBtn2()
      stepLabel.setStepLabelContent('7-52.等待演习界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO') then

      -- 震动提示不能战斗
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
      stepLabel.setStepLabelContent("7-53.等待出征界面")
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_BATTLE_PAGE2') then

      stepLabel.setStepLabelContent('7-54.点击回港')
      map.campaign.clickBackToHomeBtn()
      stepLabel.setStepLabelContent('7-55.等待home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state
    end
    return nil, state
  end))
end

return function(state)
  state.campaign = {}
  return campaignOnce
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__commonListener" ] = function( ... ) local arg = _G.arg;
local allOptions = require 'GoMission__options'

local getComListener = function()
  local map = allOptions.map
  local settings = allOptions.settings

  return {
    { { type = 'NETWORK_NETWORK_FAILURE_MODAL', addToStart = true }, 'homeGroup', map.network.isNetworkFailureModal, 6000 },
    { { type = 'NETWORK_CHECK_NETWORK_MODAL', addToStart = true }, 'homeGroup', map.network.isCheckNetworkModal, 6000 },
    { 'LOGIN_START_APP', 'homeGroup', map.login.isAppNotRun, 20000 },
    -- 5分钟界面不变化则重启游戏
    { 'LOGIN_START_APP', 'homeGroup', function() return true end, settings.restartInterval * 1000 },
    --        { { type = 'PAUSE_PAUSE', addToStart = true }, 'homeGroup', map.home.isPause },
  }
end
local getHomeListener = function()
  local map = allOptions.map
  local settings = allOptions.settings

  return {
    { 'HOME_HOME', 'homeGroup', map.home.isHome, 2000 },
    { { type = 'HOME_MEDAL_MODAL', addToStart = true }, 'homeGroup', map.home.isMedalModal, 6000 },
    { { type = 'HOME_NEWS_MODAL', addToStart = true }, 'homeGroup', map.home.isNewsModal, 6000 },
    { { type = 'HOME_SIGN_MODAL', addToStart = true }, 'homeGroup', map.home.isSignModal, 6000 },
  }
end

local getLoginListener = function()
  local map = allOptions.map
  local settings = allOptions.settings

  return {
    { { type = 'LOGIN_SELECT_SERVER', addToStart = true }, 'loginGroup', map.login.isSelectServerPage, 6000 },
  }
end

return {
  getComListener = getComListener,
  getHomeListener = getHomeListener,
  getLoginListener = getLoginListener,
}
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__exerciseOnce" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local commonListenerFactory = require 'GoMission__commonListener'
local allOptions = require 'GoMission__options'

local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener

local exerciseOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'EXERCISE_START') then

      stepLabel.setStepLabelContent('6-1.等待home')
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

      stepLabel.setStepLabelContent('6-2.点击出征')
      map.home.clickBattleBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome, 2000 },
        { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage },
        { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXERCISE_BATTLE_PAGE') then

      stepLabel.setStepLabelContent('6-3.点击演习')
      map.exercise.clickExerciseBtn()
      stepLabel.setStepLabelContent('6-4.等待演习页面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome },
        { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage, 2000 },
        { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXERCISE_EXERCISE_PAGE') then

      c.yield(sleepPromise(100))
      stepLabel.setStepLabelContent('6-5.寻找演习对手')
      local res, exeList = map.exercise.isExercisePageHaveExercise()
      local nBtn = exeList[1]
      if (type(nBtn) ~= 'nil') then
        stepLabel.setStepLabelContent('6-6.发现演习对手' .. nBtn)
        map.exercise.clickToNExerciseBtn(nBtn)
        stepLabel.setStepLabelContent('6-7.等待出征准备界面')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage, 2000 },
          { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage, 2000 },
          { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('6-8.没有可以挑战的人')
        return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
      end

    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE') then

      if ((state.exercise.quickSupplyCount <= 0) and (state.exercise.quickRepairCount <= 0)) then
        stepLabel.setStepLabelContent('6-9.选择舰队:' .. settings.exerciseFleet)
        map.exercise.selectFleet(settings.exerciseFleet)
        stepLabel.setStepLabelContent('6-10.检测所有状态')
        c.yield(sleepPromise(1000))
        local res = map.exercise.isReadyBattlePageShipStatusAllRight()
        if (res) then
          stepLabel.setStepLabelContent('6-10.状态正常')
          state.exercise.quickSupplyCount = 1
          state.exercise.quickRepairCount = 1
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
        else
          stepLabel.setStepLabelContent('6-11.状态不正常')
          map.exercise.clickReadyBattlePageQuickSupplyBtn()
          stepLabel.setStepLabelContent('6-12.等待快速补给界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal },
          }))
          return makeAction(newstateTypes), state
        end
      elseif (state.exercise.quickRepairCount <= 0) then
        stepLabel.setStepLabelContent('6-13.检测血量是否安全')
        c.yield(sleepPromise(1000))
        local res = map.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('6-14.血量安全')
          state.exercise.quickRepairCount = 1
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
        else
          if (settings.exerciseQuickRepair > 0) then
            stepLabel.setStepLabelContent('6-15.血量不安全，点击快修')
            map.exercise.clickQuickRepairBtn()
            stepLabel.setStepLabelContent('6-16.等待快修界面')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
              { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('6-17.血量不安全，返回')
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }, state
          end
        end
      else
        stepLabel.setStepLabelContent('6-18.再次检测血量是否安全')
        c.yield(sleepPromise(1000))
        -- 不允许大破出征
        local res = map.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('6-19.血量安全，继续')
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
        else
          stepLabel.setStepLabelContent('6-20.血量不安全，返回')
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }, state
        end
      end

    elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL') then

      stepLabel.setStepLabelContent('6-22.快速补给界面点击确定')
      map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()
      stepLabel.setStepLabelContent('6-23.等待出征准备界面')
      state.exercise.quickSupplyCount = state.exercise.quickSupplyCount + 1
      if (state.exercise.quickSupplyCount < 3) then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
          { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('6-24.资源数量不足')
        return { type = 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE' }, state
      end

    elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('6-25.点击快速补给关闭')
      c.yield(sleepPromise(100))
      map.exercise.clickQuickSupplyModalCloseBtn()
      stepLabel.setStepLabelContent('6-26.等待出征准备界面')
      c.yield(sleepPromise(300))
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
        { 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL') then

      if (settings.exerciseQuickRepair == 3) then
        -- 不满血则快修
        stepLabel.setStepLabelContent('6-27.点击快速修理确定')
        c.yield(sleepPromise(500))
        map.exercise.clickQuickRepairModalOkBtn()
        state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
        stepLabel.setStepLabelContent('6-28.等待出征准备界面')
        if (state.exercise.quickRepairCount < 3) then
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
          }))
          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('6-29.快速修理数量不足')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.exerciseQuickRepair == 2) then
        -- 中破或大破快修
        stepLabel.setStepLabelContent('6-30.寻找中破或大破的船')
        c.yield(sleepPromise(1000))
        local res = map.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
        if (#res > 0) then

          if ((state.exercise.quickRepairSingleLastShip ~= res[1]) or (state.exercise.quickRepairSingleCount < 3)) then
            state.exercise.quickRepairSingleLastShip = res[1]
            state.exercise.quickRepairSingleCount = state.exercise.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('6-31.中破或大破:' .. table.concat(res, ','))
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
            stepLabel.setStepLabelContent('6-32.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('6-33.修理完成')
          state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.exerciseQuickRepair == 1) then
        -- 大破快修
        stepLabel.setStepLabelContent('6-34.寻找大破的船')
        c.yield(sleepPromise(1000))
        local res = map.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
        if (#res > 0) then
          if ((state.exercise.quickRepairSingleLastShip ~= res[1]) or (state.exercise.quickRepairSingleCount < 3)) then
            state.exercise.quickRepairSingleLastShip = res[1]
            state.exercise.quickRepairSingleCount = state.exercise.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('6-35.大破:' .. table.concat(res, ','))
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
            stepLabel.setStepLabelContent('6-36.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('6-37.修理完成')
          state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end
      end

    elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('6-38.点击快速修理关闭')
      c.yield(sleepPromise(500))
      map.exercise.clickQuickRepairModalCloseBtn()
      c.yield(sleepPromise(300))
      stepLabel.setStepLabelContent('6-39.等待出征准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
        { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

      stepLabel.setStepLabelContent('6-40.检测舰队是否可以出征')
      c.yield(sleepPromise(300))
      local fleetCanBattle = map.exercise.isFleetsCanBattle()
      if (not fleetCanBattle) then

        stepLabel.setStepLabelContent('6-41.舰队无法战斗')
        return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }, state
      else
        return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
      end

    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CAN_GO') then

      stepLabel.setStepLabelContent('6-42.出征准备界面出征开始')
      c.yield(sleepPromise(100))
      map.exercise.clickBattleStartBtn()
      return { type = 'EXERCISE_GO_A_EXERCISE' }, state

    elseif (action.type == 'EXERCISE_GO_A_EXERCISE') then

      stepLabel.setStepLabelContent('6-43.等待出征准备界面，...')
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

      stepLabel.setStepLabelContent('6-44.开始面板，点击开始')
      c.yield(sleepPromise(100))
      map.exercise.clickBattleStartModalStartBtn()
      stepLabel.setStepLabelContent('6-45.等待阵型面板，追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_GO_A_EXERCISE', 'missionsGroup', map.exercise.isReadyBattlePage },
        { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage, 2000 },
        { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
        { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
        { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXERCISE_FORMATION_PAGE') then

      stepLabel.setStepLabelContent('6-46.阵型面板')
      c.yield(sleepPromise(100))
      map.exercise.clickFormationPageStartBtn(settings.exerciseFormation)
      stepLabel.setStepLabelContent('6-47.等待追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage },
        { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage, 2000 },
        { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
        { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXERCISE_PURSUE_MODAL') then

      stepLabel.setStepLabelContent('6-48.追击面板')
      c.yield(sleepPromise(100))
      if (settings.exercisePursue) then
        stepLabel.setStepLabelContent('6-49.追击')
        map.exercise.clickPursueModalOk()
      else
        stepLabel.setStepLabelContent('6-50.放弃追击')
        map.exercise.clickPursuePageCancel()
      end
      stepLabel.setStepLabelContent('6-51.等待胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
        { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal, 2000 },
        { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
        { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXERCISE_VICTORY_PAGE') then

      stepLabel.setStepLabelContent('6-52.点击胜利继续')
      map.exercise.clickVictoryPageContinueBtn()
      stepLabel.setStepLabelContent('6-53.等待胜利继续界面')
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

      stepLabel.setStepLabelContent('6-54.点击胜利继续')
      map.exercise.clickVictoryPageContinueBtn2()
      stepLabel.setStepLabelContent('6-55.等待演习界面')
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
      stepLabel.setStepLabelContent("6-56.等待出征界面")
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME') then

      stepLabel.setStepLabelContent('6-57.点击回港')
      map.exercise.clickBackToHomeBtn()
      stepLabel.setStepLabelContent('6-68.等待home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage, 2000 },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage, 2000 },
      }))
      return makeAction(newstateTypes), state
    end
    return nil, state
  end))
end

return function(state)
  state.exercise = {}
  return exerciseOnce
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__expeditionOnce" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local commonListenerFactory = require 'GoMission__commonListener'
local allOptions = require 'GoMission__options'

local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener

local expeditionOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'EXPEDITION_ONCE_START') then

      if (not state.expedition.needExpedition) then
        stepLabel.setStepLabelContent('4-18.跳过远征派遣，返回港口')
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
        stepLabel.setStepLabelContent('4-18.没有远征任务！返回港口')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
        return makeAction(newstateTypes), state
      end

      stepLabel.setStepLabelContent('4-16.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_INIT', 'missionsGroup', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_INIT') then
      stepLabel.setStepLabelContent('4-17.准备远征派遣舰队')
      -- 准备开始远征派遣舰队任务

      -- 将出征派遣列表复制到缓存中
      state.expedition.expeditionFleetToChapter = {}
      for i, v in ipairs(settings.expeditionFleetToChapter) do
        if (v) then
          table.insert(state.expedition.expeditionFleetToChapter, { i, v })
        end
      end


      -- 此任务使用的变量恢复默认值
      state.expedition.quickSupplyCount = 0
      state.expedition.quickRepairCount = 0
      state.expedition.quickRepairSingleLastShip = 0
      state.expedition.quickRepairSingleCount = 0
      state.expedition.lastChapter = nil
      state.expedition.fleet = nil
      state.expedition.chapters = nil
      state.expedition.hasShipCantExpedition = false


      stepLabel.setStepLabelContent('4-19.点击出征')
      map.expedition.clickBattle()
      stepLabel.setStepLabelContent('4-20.等待出征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
        { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattlePage },
        { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then
      -- 进入出征大页面
      stepLabel.setStepLabelContent('4-21.点击远征')
      map.expedition.clickExpedition()
      stepLabel.setStepLabelContent('4-22.等待远征界面')


      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
        { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
        { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_IS_EXPEDITION_PAGE') then
      -- 进入远征页面
      if (#state.expedition.expeditionFleetToChapter > 0) then
        state.expedition.quickSupplyCount = 0
        state.expedition.quickRepairCount = 0

        state.expedition.fleet, state.expedition.chapters = table.unpack(state.expedition.expeditionFleetToChapter[1])

        local chapter, section = table.unpack(strSplit(state.expedition.chapters, '-'))
        if (state.expedition.lastChapter ~= chapter) then
          stepLabel.setStepLabelContent('4-21.移动到第' .. chapter .. '章')
          map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
          state.expedition.lastChapter = chapter
          c.yield(sleepPromise(300))
        end
        stepLabel.setStepLabelContent('4-23.检测第' .. section .. '节能否远征')
        c.yield(sleepPromise(200))
        local res = map.expedition.isChapterCanExpedition(section)
        if (res) then
          stepLabel.setStepLabelContent('4-24.点击按钮' .. section)
          map.expedition.clickExpeditionBtn(section)
          stepLabel.setStepLabelContent('4-25.等待远征准备界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
            { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('4-26.本章不能远征')
          -- 执行下一个章节
          table.remove(state.expedition.expeditionFleetToChapter, 1)
          return { type = 'EXPEDITION_IS_EXPEDITION_PAGE' }, state
        end
      else
        stepLabel.setStepLabelContent('4-27.没有远征')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
        }))
        return makeAction(newstateTypes), state
      end

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE') then

      if ((state.expedition.quickSupplyCount <= 0) and (state.expedition.quickRepairCount <= 0)) then
        -- 还没快速补给，还没维修
        stepLabel.setStepLabelContent('4-28.选择舰队' .. state.expedition.fleet)
        map.expedition.clickSelectFleet(state.expedition.fleet)
        stepLabel.setStepLabelContent('4-29.检测所有状态正常')
        c.yield(sleepPromise(300))
        -- 检测舰队是否在最佳状态
        local res = map.expedition.isReadyBattlePageShipStatusAllRight()
        if (res) then
          stepLabel.setStepLabelContent('4-30.状态正常')
          state.expedition.quickSupplyCount = 1
          state.expedition.quickRepairCount = 1
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
        else
          stepLabel.setStepLabelContent('4-31.状态不正常')
          map.expedition.clickReadyBattlePageQuickSupplyBtn()
          stepLabel.setStepLabelContent('4-32.等待快速补给界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_QUICK_SUPPLY_MODAL', 'missionsGroup', map.expedition.isQuickSupplyModal },
            { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
          }))
          return makeAction(newstateTypes), state
        end
      elseif (state.expedition.quickRepairCount <= 0) then
        -- 已经快速补给，还没维修
        stepLabel.setStepLabelContent('4-33.检测血量是否安全')
        c.yield(sleepPromise(1000))
        local res = map.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('4-34.血量安全')
          state.expedition.quickRepairCount = 1
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
        else
          if (settings.expeditionQuickRepair > 0) then
            stepLabel.setStepLabelContent('4-35.血量不安全，快修')
            map.expedition.clickQuickRepairBtn()
            stepLabel.setStepLabelContent('4-36.等待快速修理界面')

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal },
              { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
            }))

            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('4-37.血量不安全')
            state.expedition.quickRepairCount = 1
            return { type = 'EXPEDITION_READY_BATTLE_PAGE' }, state
          end
        end
      else
        -- 已经快速补给，已经维修
        stepLabel.setStepLabelContent('4-38.再次检测血量是否安全')
        c.yield(sleepPromise(500))
        -- 不允许大破出征
        local res = map.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('4-39.血量安全，继续')
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
        else
          stepLabel.setStepLabelContent('4-40.血量不安全，返回')
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO' }, state
        end
      end

    elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL') then
      -- 快速补给界面
      stepLabel.setStepLabelContent('4-41.快速补给界面点击确定')
      map.expedition.clickReadyBattlePageQuickSupplyModalOkBtn()
      stepLabel.setStepLabelContent('4-42.等待远征准备界面')
      state.expedition.quickSupplyCount = state.expedition.quickSupplyCount + 1
      if (state.expedition.quickSupplyCount < 3) then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_QUICK_SUPPLY_MODAL', 'missionsGroup', map.expedition.isQuickSupplyModal, 2000 },
          { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('4-43.资源数量不足')
        return { type = 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE' }, state
      end

    elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('4-44.点击快速补给关闭')
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
        -- 不满血则快修
        stepLabel.setStepLabelContent('4-45.点击快速修理确定')
        c.yield(sleepPromise(500))
        map.expedition.clickQuickRepairModalOkBtn()
        state.expedition.quickRepairCount = state.expedition.quickRepairCount + 1
        stepLabel.setStepLabelContent('4-46.等待出征准备界面')
        if (state.expedition.quickRepairCount < 3) then
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
            { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal, 2000 },
          }))
          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('4-47.快修数量不足')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.expeditionQuickRepair == 2) then
        -- 中破或大破快修
        stepLabel.setStepLabelContent('4-48.寻找中破或大破的船')
        c.yield(sleepPromise(1000))
        local res = map.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)
        if (#res > 0) then
          if ((state.expedition.quickRepairSingleLastShip ~= res[1]) or (state.expedition.quickRepairSingleCount < 3)) then
            state.expedition.quickRepairSingleLastShip = res[1]
            state.expedition.quickRepairSingleCount = state.expedition.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('4-49.中破或大破:' .. table.concat(res, ','))
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
            stepLabel.setStepLabelContent('4-50.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('4-51.修理完成')
          state.expedition.quickRepairCount = state.expedition.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
            { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.expeditionQuickRepair == 1) then
        -- 大破快修
        stepLabel.setStepLabelContent('4-52.寻找大破的船')
        c.yield(sleepPromise(1000))
        local res = map.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)
        if (#res > 0) then
          if ((state.expedition.quickRepairSingleLastShip ~= res[1]) or (state.expedition.quickRepairSingleCount < 3)) then
            state.expedition.quickRepairSingleLastShip = res[1]
            state.expedition.quickRepairSingleCount = state.expedition.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('4-53.大破:' .. table.concat(res, ','))
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
            stepLabel.setStepLabelContent('4-54.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('4-55.修理完成')
          state.expedition.quickRepairCount = state.expedition.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
            { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end
      end

    elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('4-56.点击快速修理关闭')
      c.yield(sleepPromise(500))
      map.expedition.clickQuickRepairModalCloseBtn()
      c.yield(sleepPromise(300))
      stepLabel.setStepLabelContent('4-57.等待出征准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal, 2000 },
        { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO') then

      stepLabel.setStepLabelContent('4-58.检测舰队可以出征')
      c.yield(sleepPromise(500))
      local fleetCanBattle = map.expedition.isFleetsCanBattle()
      if (fleetCanBattle) then
        stepLabel.setStepLabelContent('4-59.可以出征')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.expedition.isReadyBattlePage },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('4-60.返回')
        return makeAction('EXPEDITION_READY_BATTLE_PAGE_CANT_GO'), state
      end

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO') then

      stepLabel.setStepLabelContent('4-61.出征准备界面，点击出征开始')
      c.yield(sleepPromise(100))
      stepLabel.setStepLabelContent('4-62.点击远征开始')
      map.expedition.clickBattleStartBtn()
      stepLabel.setStepLabelContent('4-63.等待战斗开始')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
        { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then
      -- 舰队不能远征，准备返回远征页
      state.expedition.hasShipCantExpedition = true

      -- 震动提示不能远征
      if (settings.expeditionAlertWhenNoHp) then
        vibrator(500)
        mSleep(500)
        vibrator(500)
      end

      stepLabel.setStepLabelContent('4-64.点击返回远征界面')
      map.expedition.clickBackToExpedition()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
        { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
      }))

      -- 如果离开这一页，则从远征队列里退出一个队伍
      if (newstateTypes ~= 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then
        table.remove(state.expedition.expeditionFleetToChapter, 1)
      end

      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME') then

      if (not state.expedition.hasShipCantExpedition) then
        state.expedition.needExpedition = false
      end

      stepLabel.setStepLabelContent('4-66.返回远征页')
      map.expedition.clickBackToExpedition()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
        { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME') then

      stepLabel.setStepLabelContent('4-67.返回港口')
      map.expedition.clickBackToHome()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
        { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
      }))
      return makeAction(newstateTypes), state
    end
  end))
end

return function(state)
  state.expedition = {}
  return expeditionOnce
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__expeditionReward" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local commonListenerFactory = require 'GoMission__commonListener'
local allOptions = require 'GoMission__options'

local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener

local expeditionReward = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'EXPEDITION_REWARD_START') then

      stepLabel.setStepLabelContent('4-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'EXPEDITION_REWARD_INIT', 'missionsGroup', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_REWARD_INIT') then

      -- 远征章节
      state.expeditionReward.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }

      return makeAction('EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED'), state

    elseif (action.type == 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED') then

      stepLabel.setStepLabelContent('4-3.检测是否有远征奖励')
      c.yield(sleepPromise(100))
      local res = map.expedition.isExpeditionCompleted()
      if (not res) then
        stepLabel.setStepLabelContent('4-4.没有远征奖励和任务')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
        return makeAction(newstateTypes), state
      end
      stepLabel.setStepLabelContent('4-5.点击出征')
      map.expedition.clickBattle()
      stepLabel.setStepLabelContent('4-6.等待出征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
        { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
        { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

      stepLabel.setStepLabelContent('4-7.点击远征')
      map.expedition.clickExpedition()
      stepLabel.setStepLabelContent('4-8.等待远征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
        { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
        { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

      if (#state.expeditionReward.enableChapter > 0) then
        local chapter = state.expeditionReward.enableChapter[1]
        stepLabel.setStepLabelContent('4-9.移动到第' .. chapter .. '章')
        c.yield(sleepPromise(300))
        map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
        state.expedition.lastChapter = chapter
        stepLabel.setStepLabelContent('4-10.检测本页有可收获奖励')
        return { type = 'EXPEDITION_REWARD_CHECK_HAS_REWARD' }, state
      else
        return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }, state
      end

    elseif (action.type == 'EXPEDITION_REWARD_CHECK_HAS_REWARD') then

      local res, list = map.expedition.isThisExpeditionPageHasReward()
      if (res) then
        local v = list[1]

        -- 当回收一个远征奖励时，就需要远征派遣
        state.expedition.needExpedition = true

        stepLabel.setStepLabelContent('4-11.点击第' .. v .. '节')
        map.expedition.clickExpeditionBtn(v)
        stepLabel.setStepLabelContent('4-12.等待远征完成页面')

        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage },
        }))
        return makeAction(newstateTypes), state
      end

      stepLabel.setStepLabelContent('4-13.本页没有可收获的奖励')
      table.remove(state.expeditionReward.enableChapter, 1)
      return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }, state

    elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then

      map.expedition.clickRewardPannelOk()
      stepLabel.setStepLabelContent('4-14.等待远征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage, 2000 },
        { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_REWARD_RETURN_TO_HOME') then

      map.expedition.clickBackToHome()
      stepLabel.setStepLabelContent('4-15.返回HOME')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'EXPEDITION_REWARD_RETURN_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil
  end))
end

return function(state)
  state.expeditionReward = {}
  return expeditionReward
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__home" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local allOptions = require 'GoMission__options'


local home = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'HOME_HOME') then

      return nil, state

    elseif (action.type == 'HOME_MEDAL_MODAL') then

      stepLabel.setStepLabelContent('1-2勋章取消')
      map.home.clickMedalModalCancelBtn()
      c.yield(sleepPromise(2000))
      local res = map.home.isMedalModal()
      if (res) then
        return makeAction('HOME_MEDAL_MODAL'), state
      end
      return nil, state

    elseif (action.type == 'HOME_NEWS_MODAL') then

      stepLabel.setStepLabelContent('1-3.关闭新闻')
      map.home.clickMewsModalClose()
      c.yield(sleepPromise(2000))
      local res = map.home.isNewsModal()
      if (res) then
        return makeAction('HOME_NEWS_MODAL'), state
      end
      return nil, state

    elseif (action.type == 'HOME_SIGN_MODAL') then

      stepLabel.setStepLabelContent('1-4.获取签到奖励')
      local res = map.home.isSignModalHasReward()
      if (res) then
        stepLabel.setStepLabelContent('1-5.有奖励，点击获取')
        map.home.clickSignModalGetReward()
        stepLabel.setStepLabelContent('1-6.等待获取确认')
        local newstateTypes = c.yield(setScreenListeners({
          { 'HOME_SIGN_CONFIRM_MODAL', 'missionsGroup', map.home.isSignConfirmModal },
          { 'HOME_SIGN_MODAL', 'missionsGroup', map.home.isSignModal, 2000 },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('1-7.没有奖励')
        map.home.clickSignModalClose()
        c.yield(sleepPromise(2000))
        local res = map.home.isSignModal()
        if (res) then
          return makeAction('HOME_SIGN_MODAL'), state
        end
        return nil, state
      end

    elseif (action.type == 'HOME_SIGN_CONFIRM_MODAL') then

      stepLabel.setStepLabelContent('1-8.点击获取确认')
      map.home.clickSignConfirmModalGetReward()
      stepLabel.setStepLabelContent('1-9.等待获取签到奖励面板')
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

return function(state)
  state.home = {}

  return home
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__login" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local allOptions = require 'GoMission__options'


local login = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'LOGIN_START_APP') then

      stepLabel.setStepLabelContent('1-11.启动游戏')
      map.login.restartApp()
      local newstateTypes = c.yield(setScreenListeners({
        { 'LOGIN_SELECT_SERVER', 'missionsGroup', map.login.isSelectServerPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'LOGIN_SELECT_SERVER') then

      stepLabel.setStepLabelContent('1-12.登录界面')
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

return function()
  return login
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__mission" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local commonListenerFactory = require 'GoMission__commonListener'
local allOptions = require 'GoMission__options'

local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener

local mission = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'MISSION_START') then

      stepLabel.setStepLabelContent('3-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'MISSION_IS_UNRECEIVED_MISSION', 'missionsGroup', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then

      stepLabel.setStepLabelContent('3-2.检测是否有任务奖励')
      c.yield(sleepPromise(100))
      local res = map.mission.isUnreceivedMission()
      if (res) then
        return { type = 'MISSION_INIT' }, state
      end
      stepLabel.setStepLabelContent('3-3.没有任务奖励')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_INIT') then

      stepLabel.setStepLabelContent('3-4点击任务按钮')
      map.mission.clickMission()
      stepLabel.setStepLabelContent('3-5.等待任务界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'MISSION_INIT', 'homeGroup', map.home.isHome, 2000 },
        { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
        { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_PAGE') then

      stepLabel.setStepLabelContent('3-6.点击全部任务')
      map.missionClickAllMission()
      stepLabel.setStepLabelContent('3-7.等待任务全部任务界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
        { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_IS_MISSION_ALL_MISSION') then

      c.yield(sleepPromise(100))
      local res = map.mission.isMissionUnreceivedReward()
      if (not res) then
        stepLabel.setStepLabelContent('3-8.没有任务奖励')
        return { type = 'MISSION_PAGE_NO_REWAR' }, state
      else
        stepLabel.setStepLabelContent('3-9.有任务奖励')
        map.mission.clickGetFirstReward()
        stepLabel.setStepLabelContent('3-10.等待获得面板')

        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
          { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel },
        }))

        return makeAction(newstateTypes), state
      end

    elseif (action.type == 'MISSION_REWAR_PANNEL') then

      stepLabel.setStepLabelContent('3-11.点击确定')
      map.mission.clickRewardPannelOk()
      stepLabel.setStepLabelContent('3-12.等待新船，任务全部任务')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
        { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
        { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 1000 },
        { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_IS_NEW_SHIP') then

      stepLabel.setStepLabelContent('3-13.点击新船')
      map.mission.clickNewShip()
      stepLabel.setStepLabelContent('3-14.等待新船锁定，任务全部任务')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
        { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
        { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
        { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL') then

      stepLabel.setStepLabelContent('3-15.点击新船')
      map.mission.clickNewShipPageLockModalOkBtn()
      stepLabel.setStepLabelContent('3-16.等待任务全部任务')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
        { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
        { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_PAGE_NO_REWAR') then

      stepLabel.setStepLabelContent('3-17.等待返回home')
      map.mission.clickBackToHome()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_PAGE_NO_REWAR', 'missionsGroup', map.mission.isMission, 2000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil
  end))
end

return function(state)
  state.mission = {}
  return mission
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__network" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local allOptions = require 'GoMission__options'


local network = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'NETWORK_NETWORK_FAILURE_MODAL') then

      stepLabel.setStepLabelContent('1-10.网络不通，点击确认')
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

      stepLabel.setStepLabelContent('1-11.检查您的网络，点击确认')
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

return function(state)
  state.network = {}
  return network
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__options" ] = function( ... ) local arg = _G.arg;
return {
  map = {},
  settings = {},
}
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__pause" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local allOptions = require 'GoMission__options'


local pause = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'PAUSE_PAUSE') then

      state.pause.lasttext = stepLabel.getText()
      stepLabel.setPrefix('')
      stepLabel.setStepLabelContent('暂停')
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

return function(state)
  state.pause = {}
  return pause
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__repairOnce" ] = function( ... ) local arg = _G.arg;
local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local commonListenerFactory = require 'GoMission__commonListener'
local allOptions = require 'GoMission__options'

local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener

local repairOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'REPAIR_ONCE_START') then

      state.repair.repairNum = 0
      -- 维修滑动界面次数
      state.repair.moveCount = 4

      if (not state.repair.needRepair) then
        stepLabel.setStepLabelContent('5-1.跳过维修，返回港口')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener()))
        return makeAction(newstateTypes), state
      end

      stepLabel.setStepLabelContent('5-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'REPAIR_INIT', 'missionsGroup', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_INIT') then
      state.repair.slot = nil

      stepLabel.setStepLabelContent('5-2.点击出征')
      c.yield(sleepPromise(100))
      map.repair.clickDockBtn()
      stepLabel.setStepLabelContent('5-3.等待船坞界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
        { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_DOCK_PAGE') then

      stepLabel.setStepLabelContent('5-4.点击修理按钮')
      c.yield(sleepPromise(100))
      map.repair.clickRepairBtn()
      stepLabel.setStepLabelContent('5-5.等待修理界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
        { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_REPAIR_PAGE') then

      if (state.repair.repairNum < 6) then
        stepLabel.setStepLabelContent('5-6.检测空闲槽位')
        c.yield(sleepPromise(500))
        local res, hasList = map.repair.hasEmptyRepairSlot()
        if (res) then
          state.repair.slot = hasList[1]
          stepLabel.setStepLabelContent('5-7.有空闲槽位')
          stepLabel.setStepLabelContent('5-8.点击第' .. state.repair.slot .. '个空闲槽位')
          c.yield(sleepPromise(100))
          map.repair.clickRepairSlotBtn(state.repair.slot)
          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('5-9.检测修理界面，选船界面')

          -- 如果一没进入修船选船页面说明没有需要维修的船
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage },
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
          }))

          if (newstateTypes == 'REPAIR_REPAIR_FINISH') then
            state.repair.needRepair = false
            stepLabel.setStepLabelContent('5-10.没有船需要维修')
          end

          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('5-11.没有空位')
          state.repair.needRepair = true

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
          }))
          return makeAction(newstateTypes), state
        end
      else
        stepLabel.setStepLabelContent('5-12.维修出现意外')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
        }))
        return makeAction(newstateTypes), state
      end

    elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then

      if (settings.repairAll) then
        stepLabel.setStepLabelContent('5-13.选择第一个船')
        c.yield(sleepPromise(200))
        map.repair.clickFirstShip()

        state.repair.repairNum = state.repair.repairNum + 1
        stepLabel.setStepLabelContent('5-14.等待返回修理界面')

        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
          { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
        }))

        return makeAction(newstateTypes), state
      else
        if (state.repair.moveCount > 0) then
          stepLabel.setStepLabelContent('5-15.寻找一个不在舰队里的船')
          c.yield(sleepPromise(600))
          local point = map.repair.findFirstShipNotInFleet()
          if (point) then
            stepLabel.setStepLabelContent('5-16.找到 [' .. point[1] .. ',' .. point[2] .. ']，点击')
            map.repair.clickAShip(point)
            state.repair.repairNum = state.repair.repairNum + 1
          else
            -- 没找到点，移动一次
            stepLabel.setStepLabelContent('5-17.没找到，向左滑一次')
            map.repair.moveToNextPage()
            state.repair.moveCount = state.repair.moveCount - 1

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
              { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage },
            }))

            return makeAction(newstateTypes), state
          end
        end

        stepLabel.setStepLabelContent('5-18.等待返回修理界面')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
          { 'REPAIR_SELECT_SHIP_PAGE_RETURN', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
        }))

        if (newstateTypes == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then
          state.repair.needRepair = false
          stepLabel.setStepLabelContent('5-19.没有需要修理的船')
        end

        return makeAction(newstateTypes), state
      end

    elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then

      stepLabel.setStepLabelContent('5-20.等待第' .. state.repair.slot .. '个槽位变成修理状态')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isSlotNotEmpty(state.repair.slot) },
        { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then

      stepLabel.setStepLabelContent('5-21.没有可以修的船，返回维修页面')
      map.repair.clickSelectShipPageBackBtn()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_SELECT_SHIP_PAGE_RETURN', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
        { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_REPAIR_FINISH') then

      stepLabel.setStepLabelContent('5-22.完成维修')
      map.repair.clickBackToHomeBtn()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 2000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil, state
  end))
end

return function(state)
  state.repair = {}
  return repairOnce
end
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__stateTree" ] = function( ... ) local arg = _G.arg;
return {}
end
end

do
local _ENV = _ENV
package.preload[ "GoMission__utils" ] = function( ... ) local arg = _G.arg;
local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
local c = coroutine

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

local makeAction = function(action)
  if (type(action) == 'table') then return action end
  return { type = action }
end

return {
  combineListener = combineListener,
  sleepPromise = sleepPromise,
  setScreenListenerPromise = setScreenListenerPromise,
  setScreenListeners = setScreenListeners,
  makeAction = makeAction,
}
end
end

do
local _ENV = _ENV
package.preload[ "KeepScreenHock" ] = function( ... ) local arg = _G.arg;
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
package.preload[ "Promise" ] = function( ... ) local arg = _G.arg;
--------------------------------------------------------------------------------------
-- es2015 Promise for lua 5.1 and 5.2

--------------------------------------------------------------------------------------

local PENDING = 0
local RESOLVED = 1
local REJECTED = 2

-- 是否需要显示stack traceback里的错误信息
-- stack traceback错误信息很长，所以这个功能作为可选项
local stackTraceback = true
-- 封装了xpcall方法
function tryCatch(cb)
  return xpcall(cb, function(e)
    return stackTraceback and
      (e .. '\n' .. debug.traceback())
      or (e)
  end)
end

-- 绑定self到某个方法
function bindSelf(fn, self)
  return function(...)
    return fn(self, ...)
  end
end

-- 隔离函数，为了防止回调过多导致爆栈需要隔离回调操作
function asap(callback)
  local co = coroutine.wrap(callback)
  co()
end

-- 类
local Promise = {
  setStackTraceback = function(value)
    stackTraceback = value
  end
}

-- 类方法 （静态方法）
function Promise.new(resolver)
  if (type(resolver) ~= 'function') then
    error('Promise resolver ' .. type(resolver) .. ' is not a function')
  end

  local newPromise = {
    PromiseStatus = PENDING,
    PromiseValue = nil,
    deferreds = {},
  }
  -- promise的主要方法，这么写是为了绑定self
  newPromise.andThen = bindSelf(andThen, newPromise)
  newPromise.catch = bindSelf(catch, newPromise)

  -- 执行传入promise的方法
  resolver(bindSelf(resolve, newPromise), bindSelf(reject, newPromise))

  return newPromise
end

function Promise.isPromise(obj)
  return (type(obj) == 'table') and type(obj.andThen) == 'function'
end

--- - Promise.resolve方法相当于实例化一个Promise对象，状态变为RESOLVED
function Promise.resolve(value)
  if (Promise.isPromise(value)) then return value end
  return Promise.new(function(resolve, reject)
    resolve(value)
  end)
end

--- - Promise.reject方法相当于实例化一个Promise对象，状态变为REJECTED
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

-- 对象方法
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
    -- 当前promise的状态转换事件处理函数
    onResolved = type(onResolved) == 'function' and onResolved or nil,
    -- 当前promise的状态转换事件处理函数
    onRejected = type(onRejected) == 'function' and onRejected or nil,
    resolve = resolve,
    reject = reject,
  }
end

-- promise的主要方法。由于lua中then是关键字，所以用andThen取代
function andThen(self, onResolved, onRejected)
  -- then本身也会返回一个promise，实现promise链
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
      -- 执行当前promise的状态转换事件处理函数
      ret = cb(self.PromiseValue)
    end)
    if (not xpcallRes) then
      -- 修改promise链表中下一个promise对象的状态为rejected
      deferred.reject(xpcallErr)
      return
    end
    -- 修改promise链表中下一个promise对象的状态为resolved
    deferred.resolve(ret)
  end)
end

-- 对状态转换事件处理函数进行封装后，再传给执行函数
function doResolve(self, andThenFn, onResolved, onRejected)
  -- done作为开关以防止fn内同时调用resolve和reject方法
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

-- 移动到链表的下一个promise
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

-- promise的主要方法
function catch(self, onRejected)
  -- then本身也会返回一个promise，实现promise链
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
���B\3�\1\000\000\23�\000���B\3�\1\000\1\23�\8�\31\000\000\1\23\000\8�@\1�\000�\1\000\2�A\2\000��\1\3]�\000\1[\1\000\000\23\000\6�G��\1�\1\000\2�A\2\000��\1\3]�\000\1�\1�\2�\1\000\000\23�\000��\1�\2�\1\000\1\23�\3����\2�\1\000\000\23�\000����\2�\1\000\1\23\000\2����\2�\1\000\000\23�\000����\2�\1\000\1\23�\000�\31\000\000\1\23\000\000�\31\000\000\1\31\000�\000\6\7\21 \9��0\27{(>�4?\31Y��\12\9\9\16I\25�6i\1�;�;�.tq\3��$\21o�x��z,���IB \24L\2\000\000\000\1\2\000\000\6\7!\25���[G��4&�kp���\26��M\2%��2���\4\14\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000�����ä\4\8\000\000\000��������\4\3\000\000\000�ޤ\4\6\000\000\000����Ф\4\14\000\000\000������������̤\4\31\000\000\000����������΋��������Њ������פ\4\5\000\000\000�����\4\20\000\000\000��������������������\4\12\000\000\000����ˊ����Ф\4\r\000\000\000�������������\4\19\000\000\000�������������������\4!\000\000\000��̉���׊����΋��������Њ������פ\4!\000\000\000��̉���Њ����΋��������Њ������פ\1\000\000\000\1\9\20 [��P�E�&=#�\11�6ee/�[\
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
B\2���\000\1�\000\2�����ƁB\1\24\000�\3\23�\1���E\1�A�\3\000\2�\2A�\6\000�\1�\1�\1\000\000\23@\000��\1\000\000�\1\000\1\31\000�\000\6\7\21 \15q\rW�4�\20%\3[}�n�k\11\11\16I\25zr�v]\3r\000��A\20m&A`��7ʶ�!,c2}�@�a\"��Y_c�z\3\000\000\000\1\2\1\3\000\000\2\7!\25fm|7\15I�[ΨG\8\27\000\000\000\3\000\000\000\000\000\000�?\4\7\000\000\000������\3\000\000\000\000\000\000\000@\3\000\000\000\000\000\000\8@\4\7\000\000\000�������\3\000\000\000\000\000\000\20@\4\8\000\000\000�������\4\3\000\000\000���\4\r\000\000\000�����������\4\4\000\000\000����\4\5\000\000\000����\4\8\000\000\000��������\4\4\000\000\000���\4\7\000\000\000�������\4\5\000\000\000���Є\4\8\000\000\000��������\4\8\000\000\000��������\4\r\000\000\000�����������\4\"\000\000\000�������������������������������\4\15\000\000\000�������������\4\7\000\000\000������\4\6\000\000\000��굶�\4\5\000\000\000����\4\6\000\000\000�����\3\000\000\000\000\000\000i@\4\7\000\000\000�������\4\1\000\000\000�\000\000\000\000\27pi\23E��\r���>܅\
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
\r\18-��h(,)\5�m:\14�t\6<\000(\8\6 ���U\1\11\8\8 �a�D彘\29���/A|V4\18�D�\19I`M,��\27%��Cd\23\000\000\000$AAA�A\1A�AAA��A@\25\1\1@V\1A��\000\000\000�\000\000\1��\000\000�\000\000\000��@\000\000\1\000\1@\1�\000�\1\000\000�\1�\1\1\2\1\000]�\000\2�@\1\2\000\1\000\1AA\1\000�@\1\2�\000\000\1\31\000�\000\5\7\21 e%�\14�K�J~>�\31�G5*\0265�\6�A\
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
\8\8 A��?`y�S�{V4\0187͞%]YpQ�9�@�\000\000\000��-����-����m���-歭��m�,+��m���0������-�-,�\15-����R����-*-m�k-l�x�-��--��-�-+m�l����,l�����{�,��쯭0�-�+��*-�k-l��,m�j�,���-�0�-��-�-��-����-���mo�����E\000\000\1��\000\000�\000\3\000&\1\000\000]�\000\000�\000�\1�@\2\000\1�\2\000AA\3\000�\1\000\000��\000\000�\000�\1\1�\3\000A\1\3\000��\3\000�\1\000\000݀\000\000\5\1�\1A\1\4\000�\1\3\000�A\4\000&\2\000\000\29�\000\000E\1�\1��\4\000��\2\000\1�\4\000f\2\000\000]�\000\000�\1�\1�\1\5\000\1�\2\000AB\5\000�\2\000\000��\000\000��\1\000�AA��A\000�ʁ����\000��\1��ʁ\1��A��\24��\2\23@\000��\1G��\1Ǎ\6��\000\21\2\000\4\25\000\000\4\23�\1�\6�A\000A\2\2\000���\000�\2\000\5V��\4�B\2\000\29B�\1\6B@\000\7�B\4F��\000G\2�\4�\2�\3\29B�\1\23\000\r�F\000@\000�\000\000\000]�\000\1\24\000�\000\23�\11�E\000�\1��\000\000��\2\000\1A\3\000f\1\000\000]�\000\000�\000�\1�@\2\000\1\1\3\000A�\3\000�\1\000\000��\000\000�\000�\1\1�\3\000A\1\3\000�A\4\000�\1\000\000݀\000\000\5\1�\1A\1\4\000��\2\000��\4\000&\2\000\000\29�\000\000E\1�\1��\4\000��\2\000\1B\5\000f\2\000\000]�\000\000��\1\000�AA��\1\000��A����\000������A\1��\1��\24�D\2\23@\000��\1G��\1Ǎ�A@\000ǁ�\3\6��\000\7�@\4@\2\000\3�A�\1\31\000�\000\5\7\21 L,B]\12�5d�\27�{�Х:#��~X\3XK��\24N\11\8\16I\25��\21lN�*u\24�7I��c1՜{R��\19\4�aQ)���\000���s\4\000\000\000\000\000\1\1\000\2\000\1\000\7!\25�̖Q\29\000\000\000\4\5\000\000\000\20\25\16\5`\4\6\000\000\000\20\1\2\12\5`\4\4\000\000\000\14\21\r`\3\000\000\000\000\000\000�?\4\6\000\000\000\16\1\9\18\19`\4\6\000\000\000,\1\2\5\12`\4\6\000\000\000\16\1\7\5\19`\4\6\000\000\000\5\18\18\15\18`\0044\000\000\000��ׅ�Ȇ�����Ն�Ѕ������L�����5)�����ǉ�Ն�І��`\3\000\000\000\000\000\000\000@\4\7\000\000\000\9\14\19\5\18\20`\4\7\000\000\000\14\21\r\2\5\18`\4\7\000\000\000\19\20\18\9\14\7`\3\000\000\000\000\000\000.@\3\000\000\000\000\000\000\8@\4\5\000\000\000\12\5\6\20`\3\000\000\000\000\000\000\16@\4\8\000\000\000PLPLRUU`\3\000\000\000\000\000\000\20@\3\000\000\000\000\000\000�\3\000\000\000\000\000\000\24@\3\000\000\000\000\000\000\000\000\4\5\000\000\000\20\5\24\20`\4\5\000\000\000\19\9\26\5`\4\6\000\000\000\1\12\9\7\14`\4\6\000\000\000\3\15\12\15\18`\4\7\000\000\000\14\15\23\18\1\16`\4\6\000\000\000\23\9\4\20\8`\000\000\000\000\000\16pi\23 4i\"��9>\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 ��b��\127<[`�\4���\31\15}S|��Z\0049G�\29tv�:��={u\
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
It֪J\28\000\000\000����Y���\28����Y���\25�ڝ�X؅�X�\29A\000\000\1\1\1\000@\1\000\000�\1\1\000!\1\3�\6�@\000\7BA\4A�\1\000\29�\000\1�\000\000\4\000\2�\000F�A\000G\2�\4�\2\000\1�\2�\1\000\3�\1]�\000\2V@\2\4 A�\127_\000\000\1\31\000�\000\4\7\21 ���\17��b:�\19�.+\25\6\7m%�$��Zi\r\6\16I\25]��\15�\20*\20�C�C�2@e#݃{\25D�\127\14*�y\2\000\000\000\000\2\000\3\8\7!\25C��\5�'�,�LwL{=�m2�4&�\16f\18QЊz\15luV�H%X\9\000\000\000\4\1\000\000\000@\4%\000\000\000!\"#$%&'(9*+,-./0123456789:pqrstuvwxy@\4\5\000\000\000-!4(@\4\11\000\000\0002!.$/-3%%$@\3\000\000\000\000\000\000�?\4\7\000\000\0002!.$/-@\3\000\000\000\000\000\000B@\4\7\000\000\000342).'@\4\4\000\000\00035\"@\000\000\000\000\22pi\23\28\"AK$]I\12���\19�xK\20\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\1\9\20 \11V�\7�tXv+'�k�3_;�)�\14��b_$��N&�\14F�\000\9\20 Id�/��kt)\26SH��ji��7\7I�\17&c�\19+\30\26\7}��g^H\000t\0256\8t\25Y�\02433\\�BR2\18\22���\19\8C\16LE�\23\31p\1v\25\27\9v\25w��[rE�Z�1T+\000.\8\6 }��bv��!���Ly�\4\30;Х09�9,�`�l\000\000\8\8 \28%\23bT\30y'�\11�&���V}8�o���\15ME�]���\21�~V4\18g�Et/��4���\r���6���JT�l!/\000\000\000�ё�֑���QQє�Q�PQ��\20����\16��G���\16�����QА���T��\2��\1\000��\000\1ր�\1]��\1[\000\000\000\23�\4���A\000�\000B\1�\000�\000\1A\2\000���\1�@\000\000\23@\000�\24��\000\23�\000��\000\000\000�\000�\000�\000�\1\23��\127�\000�\000��B\000\000\1�\000�\000\000\1�\000\000\000\23@�\127�\000@\000�@@\1���\000�\000\000\1\26�\000�\23��\127�\000\000\000�\000\000\1\23\000�\127\31\000�\000\1\7\21 �k\5j\r��1\25\17�^\8\4\16I\25���\\��\5@�L�'\8z�~=��\12\5\000\000\000\000\2\1\000\1\9\1\3\1\7\9\7!\25CJ2/vT\0229�|,2���%�y-\27\"��YN�vL:/�q\r\000\000\000\4\3\000\000\000���\4\5\000\000\000����\4\8\000\000\000��������\4\15\000\000\000��������������\4\6\000\000\000������\4\4\000\000\000����\3\000\000\000\000\000\000$@\4\7\000\000\000������\4\5\000\000\000�����\4\2\000\000\000��\4\1\000\000\000�\4\9\000\000\000��������\3\000\000\000\000\000\000\8@\000\000\000\000\16pi\23�q\\�tjO\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\9\20 v�\000\000�\27�r#�#9�\2�\7���\3�%ApU�\18lΩ\4-VR\3'�\15\9\20 ��(1<��c.\8)l\31��Vb��W�]�\2�\000t\0257\8t\25�/�(Y�p[*~\25m�:9\19\000_s\":+�\21v�:\2b\1v\25\27\9v\25��\5\16pFK7��:\1*\8\6 ��M*h&�:�?\r/\000\9\8\8 g)�BM\127V4\18���.\r��_�C�z�U\12M\4H�\26���+4\6�0�\000\000\000kMMI\22\12MMZMM�\12LMM�\12MMZMM��\12MM��\rML�MM\rOMM�O�M�OMLMN�L\rNMN�\12�N�L\12ML\15LM�\12ML�L�MK�\12MP��M\12�LM[\15OI��MLKO\15MJ\15\15I\rO�NP�MLTM��Z�V�K�\15MJ�\15IP��M\9OMM�ONM�OMLLC\3\000E\3�\1��\3\000\22�\3\6A�\3\000�\3\000\2�\3\4\000\000\4\000\2AD\4\000�\4�\2��\4\000\5\5�\2A�\4\000�\5\000\3�\5\5\000��\000\1�E\5\000\000\6�\3V\3�\6݂�\1@\2�\5[\2\000\000\23�\5��\2B\000ǂ�\5\000\3�\4A�\5\000݂�\1�B\000\000\23\000\2�X\000�\4\23�\1��\2B\000ǂ�\5\000\3�\4AC\6\000݂�\1�\2\000\000\23�\000��\2\000\000\000\3�\4�\2�\1\23��\127I\2�\3\23@\2�\23��\127ƂB\000���\5݂�\000�\2�\5\26��\2\23@�\127�\2\000\000�\2\000\1\23��\127��B\000��B\5���\000�\2\000\1\1C\3\000E\3�\1��\6\000\22�\3\6A�\6\000�\3�\3�\3\7\000\5\4\000\3A\4\5\000\29�\000\1V\3�\6݂�\1@\2�\5[\2\000\000\23\000\5��\2B\000ǂ�\5\000\3�\4A�\5\000݂�\1�B\000\000\23@\000�\24\000�\4\23�\000��\2\000\000\000\3�\4�\2�\1\23��\127�BG\000\000\3�\4݂\000\1\6CG\000E\3�\3\29\3\000\1�\2\000\000\23��\127ƂB\000���\5݂�\000΂�\5\26��\2\23\000�\127�\2\000\000�\2\000\1\23@�\127\23�\000�\4\2\000\000A�\7\000\31\2�\1\31\000�\000\11\7\21 ��\2��M\8���\9���&s��0\26C#e�@\4\20)\21\17D\27��\7\25\7\16I\25��KFq��:\1S�9\16;�}d��u�v~v\8\000\000\000\000\2\1\5\1\000\1\9\1\3\1\8\1\7\1\4\3\7!\25̶�0|��%\31\000\000\000\3\000\000\000\000\000\000>@\3\000\000\000\000\000\000�?\4\9\000\000\000���������\4\14\000\000\000���������ӗ���\4\7\000\000\000�������\3\000\000\000\000\000@\127@\4\9\000\000\000���������\4\19\000\000\000ҏ��Ғ��������ӗ���\4\7\000\000\000�������\4\4\000\000\000����\4\3\000\000\000���\4\5\000\000\000�����\3\000\000\000\000\000\000\000\000\4\8\000\000\000��������\4\15\000\000\000҈�������Ӝ����\4\9\000\000\000���������\4\9\000\000\000ۚ�������\4\
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
, '@'..".\\TSLib.lua" ) )

do
local _ENV = _ENV
package.preload[ "TableLib" ] = function( ... ) local arg = _G.arg;
-- table方法添加
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

  -- 后覆盖前的unique
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

  -- 对key排序后放入数组中再返回，结果类似entries
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
  local js = table.concat(runTable(obj, 2), "\n")
  print(js)
  nLog(js)
  return js
end

__console.getJsStr = function(obj)
  return table.concat(runTable(obj, 2), ",\n")
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

do
local _ENV = _ENV
package.preload[ "warship-girls-r-script" ] = function( ... ) local arg = _G.arg;
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
require 'DeviceOrientHock'
local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
local sz = require 'sz'
local json = sz.json
local socket = require 'szocket.core'
local mapMaker = require 'BaseOperate'
local gomission = require 'GoMission'
local stepLabel = (require 'StepLabel').init('stopbtn')


Promise.setStackTraceback(false)


local width, height = getScreenSize()

local c = coroutine


local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    eq.setTimeout(resolve, ms)
  end)
end

stepLabel.setStepLabelContent('开始')

function closeStepLabel()
  fwCloseView('steplabel', 'text1')
end

stepLabel.setStepLabelContent('等待音量面板收起')
mSleep(500)



-- 设置
local settingTable = {
  ['style'] = 'default',
  ['width'] = height,
  ['height'] = height,
  ['config'] = 'save_warship-girls-r-script.dat',
  ['timer'] = 5,
  ['orient'] = 1,
  ['pagetype'] = 'multi',
  ['title'] = '选项',
  ['cancelname'] = '取消',
  ['okname'] = '开始',
  ['rettype'] = 'table',
  ['pages'] = {
    {
      {
        ['type'] = 'Label',
        ['text'] = '第一次设置建议在竖屏下设置，设置好后再切换到游戏界面',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '向左滑动查看其他选项',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '任务',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'missionEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '远征',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '出征',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '修理',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'repairEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '演习',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '战役',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '每一轮的间隔时间(秒)',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'missionsInterval',
        ['type'] = 'Edit',
        ['prompt'] = '最短间隔时间(秒)',
        ['text'] = '15',
        ['kbtype'] = 'number',
      },
      {
        ['type'] = 'Label',
        ['text'] = '多长时间画面不变则重启游戏(秒)最少60秒',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'restartInterval',
        ['type'] = 'Edit',
        ['prompt'] = '多长时间画面不变则重启游戏(秒)最少60秒',
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
        ['text'] = '任务设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
    {
      {
        ['type'] = 'Label',
        ['text'] = '远征设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '收获和派遣是否连着',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionTogether',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '使用快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能远征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '自动参加的远征章节',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '1队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet1',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '2队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet2',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '3队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet3',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '4队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet4',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
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
        ['text'] = '出征设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '章节',
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
        ['text'] = '舰队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1队,2队,3队,4队',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battlePursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击Boss',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battlePursueBoss',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '使用快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '迂回',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRoundabout',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能出征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '最多几战',
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
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '6-1a点遇到航母SL',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRebootAt6_1AMeetCV',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '6-1a点遇到雷巡SL',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRebootAt6_1AMeetCit',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '没遇到补给就SL（捞胖次）',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRebootAtNotMeetAP',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
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
        ['text'] = '演习设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '舰队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1队,2队,3队,4队',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exercisePursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
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
        ['text'] = '战役设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '关卡',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignChapter',
        ['type'] = 'RadioGroup',
        ['list'] = '驱逐,巡洋,战列,航母,潜艇',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '难度',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignDifficulty',
        ['type'] = 'RadioGroup',
        ['list'] = '普通,困难',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignPursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能出征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
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
        ['text'] = '修理设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '修理目标',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'repairAll',
        ['type'] = 'RadioGroup',
        ['list'] = '所有,不在舰队里的',
        ['select'] = '1',
      },
    },
  }
}

local settingTableStr = json.encode(settingTable);
closeStepLabel()
local ret, settings = showUI(settingTableStr);
if (ret ~= 1) then
  stepLabel.setStepLabelContent('取消运行')
  mSleep(100000)
  lua_exit()
end
stepLabel.setStepLabelContent('正在载入...')
-- --转换settings结果
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

  -- 出征
  settings.battleEnable = (function(battleEnable)
    local list = transStrToTable({ true, false, })
    return list[battleEnable] or false
  end)(settings.battleEnable)
  -- 修理
  settings.repairEnable = (function(repairEnable)
    local list = transStrToTable({ true, false, })
    return list[repairEnable] or false
  end)(settings.repairEnable)
  -- 任务
  settings.missionEnable = (function(missionEnable)
    local list = transStrToTable({ true, false, })
    return list[missionEnable] or false
  end)(settings.missionEnable)
  -- 远征
  settings.expeditionEnable = (function(expeditionEnable)
    local list = transStrToTable({ true, false, })
    return list[expeditionEnable] or false
  end)(settings.expeditionEnable)
  -- 演习
  settings.exerciseEnable = (function(exerciseEnable)
    local list = transStrToTable({ true, false, })
    return list[exerciseEnable] or false
  end)(settings.exerciseEnable)
  -- 战役
  settings.campaignEnable = (function(campaignEnable)
    local list = transStrToTable({ true, false, })
    return list[campaignEnable] or false
  end)(settings.campaignEnable)
  -- 总循环间隔时间
  settings.missionsInterval = tonumber(settings.missionsInterval) or 0
  -- 多长时间界面不变则重启，最少60秒
  settings.restartInterval = tonumber(settings.restartInterval) or 120
  settings.restartInterval = math.max(settings.restartInterval, 60)

  -- 远征收获和派遣是否连续（否则先收获，再出征，再派遣），为了可以在远征的间隙出征一次
  settings.expeditionTogether = (function(expeditionTogether)
    local list = transStrToTable({ true, false, })
    return list[expeditionTogether] or false
  end)(settings.expeditionTogether)
  -- 选择远征要参加的章节
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
  -- 远征是否使用快速修理
  settings.expeditionQuickRepair = (function(expeditionQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[expeditionQuickRepair] or 2
  end)(settings.expeditionQuickRepair)
  -- 当无法远征时是否震动提示
  settings.expeditionAlertWhenNoHp = (function(expeditionAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[expeditionAlertWhenNoHp] or false
  end)(settings.expeditionAlertWhenNoHp)
  -- 选择关卡
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
  -- 选择舰队
  settings.battleFleet = (function(battleFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[battleFleet] or 1
  end)(settings.battleFleet)
  -- 是否追击
  settings.battlePursue = (function(battlePursue)
    local list = transStrToTable({ true, false, })
    return list[battlePursue] or false
  end)(settings.battlePursue)
  -- 是否追击Boss
  settings.battlePursueBoss = (function(battlePursueBoss)
    local list = transStrToTable({ true, false, })
    return list[battlePursueBoss] or false
  end)(settings.battlePursueBoss)
  -- 是否使用快速修理
  settings.battleQuickRepair = (function(battleQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[battleQuickRepair] or 2
  end)(settings.battleQuickRepair)
  -- 迂回战术
  settings.battleRoundabout = (function(battleRoundabout)
    local list = transStrToTable({ true, false, })
    return list[battleRoundabout] or false
  end)(settings.battleRoundabout)
  -- 当无法出征时是否跳过出征
  settings.battleAlertWhenNoHp = (function(battleAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[battleAlertWhenNoHp] or false
  end)(settings.battleAlertWhenNoHp)
  -- 出征最大战斗次数
  settings.battleMaxBattleNum = (function(battleMaxBattleNum)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[battleMaxBattleNum] or 1
  end)(settings.battleMaxBattleNum)
  -- 阵型
  settings.battleFormation = (function(battleFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[battleFormation] or 2
  end)(settings.battleFormation)
  -- 6-1a点遇到航母SL
  settings.battleRebootAt6_1AMeetCV = (function(battleRebootAt6_1AMeetCV)
    local list = transStrToTable({ true, false })
    return list[battleRebootAt6_1AMeetCV] or false
  end)(settings.battleRebootAt6_1AMeetCV)
  -- 6-1a点遇到雷巡SL
  settings.battleRebootAt6_1AMeetCit = (function(battleRebootAt6_1AMeetCit)
    local list = transStrToTable({ true, false })
    return list[battleRebootAt6_1AMeetCit] or false
  end)(settings.battleRebootAt6_1AMeetCit)
  -- 没遇到补给就SL（捞胖次）
  settings.battleRebootAtNotMeetAP = (function(battleRebootAtNotMeetAP)
    local list = transStrToTable({ true, false })
    return list[battleRebootAtNotMeetAP] or false
  end)(settings.battleRebootAtNotMeetAP)

  -- 演习
  -- 选择舰队
  settings.exerciseFleet = (function(exerciseFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[exerciseFleet] or 1
  end)(settings.exerciseFleet)
  -- 是否追击
  settings.exercisePursue = (function(exercisePursue)
    local list = transStrToTable({ true, false, })
    return list[exercisePursue] or false
  end)(settings.exercisePursue)
  -- 是否使用快速修理
  settings.exerciseQuickRepair = (function(exerciseQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[exerciseQuickRepair] or 2
  end)(settings.exerciseQuickRepair)
  -- 阵型
  settings.exerciseFormation = (function(exerciseFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[exerciseFormation] or 2
  end)(settings.exerciseFormation)

  -- 战役
  -- 选择关卡
  settings.campaignChapter = (function(campaignChapter)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignChapter] or 1
  end)(settings.campaignChapter)
  -- 选择难度
  settings.campaignDifficulty = (function(campaignDifficulty)
    local list = transStrToTable({ 'default', 'hard' })
    return list[campaignDifficulty] or 'default'
  end)(settings.campaignDifficulty)
  -- 是否追击
  settings.campaignPursue = (function(campaignPursue)
    local list = transStrToTable({ true, false, })
    return list[campaignPursue] or false
  end)(settings.campaignPursue)
  -- 是否使用快速修理
  settings.campaignQuickRepair = (function(campaignQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[campaignQuickRepair] or 2
  end)(settings.campaignQuickRepair)
  -- 不能出征则震动提示
  settings.campaignAlertWhenNoHp = (function(campaignAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[campaignAlertWhenNoHp] or false
  end)(settings.campaignAlertWhenNoHp)
  -- 阵型
  settings.campaignFormation = (function(campaignFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignFormation] or 2
  end)(settings.campaignFormation)
  -- 修理
  -- 是否修理所有船
  settings.repairAll = (function(repairAll)
    local list = transStrToTable({ true, false, })
    return list[repairAll] or false
  end)(settings.repairAll)
end)(settings)

-- --转换settings结果

-- 注册按钮事件，目前只有暂停按钮
eq.setButotnListener('stopbtn', function()
  if (isPause) then
    --    stepLabel.setPrefix('')
    --    isPause = false
  else
    stepLabel.setPrefix('即将暂停 ')
    isPause = true
  end
end)

gomission.init(mapMaker(), settings)

local theMissionsQuery = {}

co(c.create(function()
  if (settings.missionEnable
    or settings.expeditionEnable
    or settings.battleEnable
    or settings.repairEnable
    or settings.exerciseEnable
    or settings.campaignEnable) then

    -- 插入一个特殊的任务表示这是队列的开头
    table.insert(theMissionsQuery, { isBase = true, isStart = true })
    -- 是否运行任务
    if (settings.missionEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'MISSION_START' })
    end
    -- 是否运行远征
    if (settings.expeditionEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_REWARD_START' })
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_ONCE_START' })
    end
    -- 是否运行出征
    if (settings.battleEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'BATTLE_START' })
    end
    -- 是否运行演习
    if (settings.exerciseEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'EXERCISE_START' })
    end
    -- 是否运行战役
    if (settings.campaignEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'CAMPAIGN_START' })
    end
    -- 是否运行修理
    if (settings.repairEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'REPAIR_ONCE_START' })
    end
    -- 插入一个特殊任务表示这是队列的结尾
    table.insert(theMissionsQuery, { isBase = true, isEnd = true })

    runCount = 1
    local runStartTime = socket.gettime() * 1000
    while (true) do
      -- 任务队列里没有任务则停止运行
      local action = theMissionsQuery[1]
      if ((#theMissionsQuery == 0) or (not action)) then
        break
      end

      if (action.isStart) then
        runStartTime = socket.gettime() * 1000
      end

      -- 如果是队列原有任务则将其加入队列末尾，以保证能一直循环
      -- 如果是从原有任务衍生的下一步任务，则不加入队列末尾，会被新的下一步任务替换或者删除
      if (action.isBase) then
        table.insert(theMissionsQuery, action)
      end

      -- 执行一个action
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

      -- 如果点了暂停按钮
      if (isPause) then
        stepLabel.setPrefix('')
        local lasttext = stepLabel.getText()
        stepLabel.setStepLabelContent('暂停')
        c.yield(Promise.new(function(resolve)
          local theEid
          theEid = eq.setButotnListener('stopbtn', function()
            isPause = false
            stepLabel.setPrefix('')
            eq.clearButotnListener(theEid)
            resolve()
          end)
        end))
        stepLabel.setStepLabelContent(lasttext)
      end

      if (action.isEnd) then
        local diffTime = (socket.gettime() * 1000) - runStartTime
        if (diffTime < (settings.missionsInterval * 1000)) then
          local remainTime = (settings.missionsInterval * 1000) - diffTime
          stepLabel.setStepLabelContent('休息剩余时间' .. math.ceil(remainTime / 1000) .. '秒')
          while (remainTime > 0) do
            stepLabel.setStepLabelContent('休息剩余时间' .. math.ceil(remainTime / 1000) .. '秒', true)
            c.yield(sleepPromise(1000))
            remainTime = remainTime - 1000
          end
        end

        if (luaExisted) then
          break
        end

        runCount = runCount + 1
      end

      -- 如果是任务队列结尾标志，则count+1
    end
  end
end)).catch(function(err)
  wLog("warship-girls-r-script", "[DATE] " .. err);
  eq.setImmediate(function() error(err) end)
end)

eq.run()

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
require 'DeviceOrientHock'
local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
local sz = require 'sz'
local json = sz.json
local socket = require 'szocket.core'
local mapMaker = require 'BaseOperate'
local gomission = require 'GoMission'
local stepLabel = (require 'StepLabel').init('stopbtn')


Promise.setStackTraceback(false)


local width, height = getScreenSize()

local c = coroutine


local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    eq.setTimeout(resolve, ms)
  end)
end

stepLabel.setStepLabelContent('开始')

function closeStepLabel()
  fwCloseView('steplabel', 'text1')
end

stepLabel.setStepLabelContent('等待音量面板收起')
mSleep(500)



-- 设置
local settingTable = {
  ['style'] = 'default',
  ['width'] = height,
  ['height'] = height,
  ['config'] = 'save_warship-girls-r-script.dat',
  ['timer'] = 5,
  ['orient'] = 1,
  ['pagetype'] = 'multi',
  ['title'] = '选项',
  ['cancelname'] = '取消',
  ['okname'] = '开始',
  ['rettype'] = 'table',
  ['pages'] = {
    {
      {
        ['type'] = 'Label',
        ['text'] = '第一次设置建议在竖屏下设置，设置好后再切换到游戏界面',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '向左滑动查看其他选项',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '任务',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'missionEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '远征',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '出征',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '修理',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'repairEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '演习',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '战役',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignEnable',
        ['type'] = 'RadioGroup',
        ['list'] = '开启,关闭',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '每一轮的间隔时间(秒)',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'missionsInterval',
        ['type'] = 'Edit',
        ['prompt'] = '最短间隔时间(秒)',
        ['text'] = '15',
        ['kbtype'] = 'number',
      },
      {
        ['type'] = 'Label',
        ['text'] = '多长时间画面不变则重启游戏(秒)最少60秒',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'restartInterval',
        ['type'] = 'Edit',
        ['prompt'] = '多长时间画面不变则重启游戏(秒)最少60秒',
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
        ['text'] = '任务设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
    },
    {
      {
        ['type'] = 'Label',
        ['text'] = '远征设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '收获和派遣是否连着',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionTogether',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '使用快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能远征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '自动参加的远征章节',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '1队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet1',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '2队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet2',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '3队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet3',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '4队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'expeditionFleet4',
        ['type'] = 'RadioGroup',
        ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
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
        ['text'] = '出征设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '章节',
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
        ['text'] = '舰队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1队,2队,3队,4队',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battlePursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击Boss',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battlePursueBoss',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '使用快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '迂回',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRoundabout',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能出征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '最多几战',
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
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '6-1a点遇到航母SL',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRebootAt6_1AMeetCV',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '6-1a点遇到雷巡SL',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRebootAt6_1AMeetCit',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '没遇到补给就SL（捞胖次）',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'battleRebootAtNotMeetAP',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
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
        ['text'] = '演习设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '舰队',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseFleet',
        ['type'] = 'RadioGroup',
        ['list'] = '1队,2队,3队,4队',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exercisePursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'exerciseFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
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
        ['text'] = '战役设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '关卡',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignChapter',
        ['type'] = 'RadioGroup',
        ['list'] = '驱逐,巡洋,战列,航母,潜艇',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '难度',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignDifficulty',
        ['type'] = 'RadioGroup',
        ['list'] = '普通,困难',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '追击',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignPursue',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '快修',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignQuickRepair',
        ['type'] = 'RadioGroup',
        ['list'] = '不满血,中破,大破,不使用',
        ['select'] = '1',
      },
      {
        ['type'] = 'Label',
        ['text'] = '不能出征则震动提示',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignAlertWhenNoHp',
        ['type'] = 'RadioGroup',
        ['list'] = '是,否',
        ['select'] = '0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '阵型',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'campaignFormation',
        ['type'] = 'RadioGroup',
        ['list'] = '单纵,复纵,轮型,梯形,单横',
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
        ['text'] = '修理设置',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['type'] = 'Label',
        ['text'] = '修理目标',
        ['size'] = 15,
        ['align'] = 'left',
        ['color'] = '0,0,0',
      },
      {
        ['id'] = 'repairAll',
        ['type'] = 'RadioGroup',
        ['list'] = '所有,不在舰队里的',
        ['select'] = '1',
      },
    },
  }
}

local settingTableStr = json.encode(settingTable);
closeStepLabel()
local ret, settings = showUI(settingTableStr);
if (ret ~= 1) then
  stepLabel.setStepLabelContent('取消运行')
  mSleep(100000)
  lua_exit()
end
stepLabel.setStepLabelContent('正在载入...')
-- --转换settings结果
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

  -- 出征
  settings.battleEnable = (function(battleEnable)
    local list = transStrToTable({ true, false, })
    return list[battleEnable] or false
  end)(settings.battleEnable)
  -- 修理
  settings.repairEnable = (function(repairEnable)
    local list = transStrToTable({ true, false, })
    return list[repairEnable] or false
  end)(settings.repairEnable)
  -- 任务
  settings.missionEnable = (function(missionEnable)
    local list = transStrToTable({ true, false, })
    return list[missionEnable] or false
  end)(settings.missionEnable)
  -- 远征
  settings.expeditionEnable = (function(expeditionEnable)
    local list = transStrToTable({ true, false, })
    return list[expeditionEnable] or false
  end)(settings.expeditionEnable)
  -- 演习
  settings.exerciseEnable = (function(exerciseEnable)
    local list = transStrToTable({ true, false, })
    return list[exerciseEnable] or false
  end)(settings.exerciseEnable)
  -- 战役
  settings.campaignEnable = (function(campaignEnable)
    local list = transStrToTable({ true, false, })
    return list[campaignEnable] or false
  end)(settings.campaignEnable)
  -- 总循环间隔时间
  settings.missionsInterval = tonumber(settings.missionsInterval) or 0
  -- 多长时间界面不变则重启，最少60秒
  settings.restartInterval = tonumber(settings.restartInterval) or 120
  settings.restartInterval = math.max(settings.restartInterval, 60)

  -- 远征收获和派遣是否连续（否则先收获，再出征，再派遣），为了可以在远征的间隙出征一次
  settings.expeditionTogether = (function(expeditionTogether)
    local list = transStrToTable({ true, false, })
    return list[expeditionTogether] or false
  end)(settings.expeditionTogether)
  -- 选择远征要参加的章节
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
  -- 远征是否使用快速修理
  settings.expeditionQuickRepair = (function(expeditionQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[expeditionQuickRepair] or 2
  end)(settings.expeditionQuickRepair)
  -- 当无法远征时是否震动提示
  settings.expeditionAlertWhenNoHp = (function(expeditionAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[expeditionAlertWhenNoHp] or false
  end)(settings.expeditionAlertWhenNoHp)
  -- 选择关卡
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
  -- 选择舰队
  settings.battleFleet = (function(battleFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[battleFleet] or 1
  end)(settings.battleFleet)
  -- 是否追击
  settings.battlePursue = (function(battlePursue)
    local list = transStrToTable({ true, false, })
    return list[battlePursue] or false
  end)(settings.battlePursue)
  -- 是否追击Boss
  settings.battlePursueBoss = (function(battlePursueBoss)
    local list = transStrToTable({ true, false, })
    return list[battlePursueBoss] or false
  end)(settings.battlePursueBoss)
  -- 是否使用快速修理
  settings.battleQuickRepair = (function(battleQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[battleQuickRepair] or 2
  end)(settings.battleQuickRepair)
  -- 迂回战术
  settings.battleRoundabout = (function(battleRoundabout)
    local list = transStrToTable({ true, false, })
    return list[battleRoundabout] or false
  end)(settings.battleRoundabout)
  -- 当无法出征时是否跳过出征
  settings.battleAlertWhenNoHp = (function(battleAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[battleAlertWhenNoHp] or false
  end)(settings.battleAlertWhenNoHp)
  -- 出征最大战斗次数
  settings.battleMaxBattleNum = (function(battleMaxBattleNum)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[battleMaxBattleNum] or 1
  end)(settings.battleMaxBattleNum)
  -- 阵型
  settings.battleFormation = (function(battleFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[battleFormation] or 2
  end)(settings.battleFormation)
  -- 6-1a点遇到航母SL
  settings.battleRebootAt6_1AMeetCV = (function(battleRebootAt6_1AMeetCV)
    local list = transStrToTable({ true, false })
    return list[battleRebootAt6_1AMeetCV] or false
  end)(settings.battleRebootAt6_1AMeetCV)
  -- 6-1a点遇到雷巡SL
  settings.battleRebootAt6_1AMeetCit = (function(battleRebootAt6_1AMeetCit)
    local list = transStrToTable({ true, false })
    return list[battleRebootAt6_1AMeetCit] or false
  end)(settings.battleRebootAt6_1AMeetCit)
  -- 没遇到补给就SL（捞胖次）
  settings.battleRebootAtNotMeetAP = (function(battleRebootAtNotMeetAP)
    local list = transStrToTable({ true, false })
    return list[battleRebootAtNotMeetAP] or false
  end)(settings.battleRebootAtNotMeetAP)

  -- 演习
  -- 选择舰队
  settings.exerciseFleet = (function(exerciseFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[exerciseFleet] or 1
  end)(settings.exerciseFleet)
  -- 是否追击
  settings.exercisePursue = (function(exercisePursue)
    local list = transStrToTable({ true, false, })
    return list[exercisePursue] or false
  end)(settings.exercisePursue)
  -- 是否使用快速修理
  settings.exerciseQuickRepair = (function(exerciseQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[exerciseQuickRepair] or 2
  end)(settings.exerciseQuickRepair)
  -- 阵型
  settings.exerciseFormation = (function(exerciseFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[exerciseFormation] or 2
  end)(settings.exerciseFormation)

  -- 战役
  -- 选择关卡
  settings.campaignChapter = (function(campaignChapter)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignChapter] or 1
  end)(settings.campaignChapter)
  -- 选择难度
  settings.campaignDifficulty = (function(campaignDifficulty)
    local list = transStrToTable({ 'default', 'hard' })
    return list[campaignDifficulty] or 'default'
  end)(settings.campaignDifficulty)
  -- 是否追击
  settings.campaignPursue = (function(campaignPursue)
    local list = transStrToTable({ true, false, })
    return list[campaignPursue] or false
  end)(settings.campaignPursue)
  -- 是否使用快速修理
  settings.campaignQuickRepair = (function(campaignQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[campaignQuickRepair] or 2
  end)(settings.campaignQuickRepair)
  -- 不能出征则震动提示
  settings.campaignAlertWhenNoHp = (function(campaignAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[campaignAlertWhenNoHp] or false
  end)(settings.campaignAlertWhenNoHp)
  -- 阵型
  settings.campaignFormation = (function(campaignFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignFormation] or 2
  end)(settings.campaignFormation)
  -- 修理
  -- 是否修理所有船
  settings.repairAll = (function(repairAll)
    local list = transStrToTable({ true, false, })
    return list[repairAll] or false
  end)(settings.repairAll)
end)(settings)

-- --转换settings结果

-- 注册按钮事件，目前只有暂停按钮
eq.setButotnListener('stopbtn', function()
  if (isPause) then
    --    stepLabel.setPrefix('')
    --    isPause = false
  else
    stepLabel.setPrefix('即将暂停 ')
    isPause = true
  end
end)

gomission.init(mapMaker(), settings)

local theMissionsQuery = {}

co(c.create(function()
  if (settings.missionEnable
    or settings.expeditionEnable
    or settings.battleEnable
    or settings.repairEnable
    or settings.exerciseEnable
    or settings.campaignEnable) then

    -- 插入一个特殊的任务表示这是队列的开头
    table.insert(theMissionsQuery, { isBase = true, isStart = true })
    -- 是否运行任务
    if (settings.missionEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'MISSION_START' })
    end
    -- 是否运行远征
    if (settings.expeditionEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_REWARD_START' })
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_ONCE_START' })
    end
    -- 是否运行出征
    if (settings.battleEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'BATTLE_START' })
    end
    -- 是否运行演习
    if (settings.exerciseEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'EXERCISE_START' })
    end
    -- 是否运行战役
    if (settings.campaignEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'CAMPAIGN_START' })
    end
    -- 是否运行修理
    if (settings.repairEnable) then
      table.insert(theMissionsQuery, { isBase = true, type = 'REPAIR_ONCE_START' })
    end
    -- 插入一个特殊任务表示这是队列的结尾
    table.insert(theMissionsQuery, { isBase = true, isEnd = true })

    runCount = 1
    local runStartTime = socket.gettime() * 1000
    while (true) do
      -- 任务队列里没有任务则停止运行
      local action = theMissionsQuery[1]
      if ((#theMissionsQuery == 0) or (not action)) then
        break
      end

      if (action.isStart) then
        runStartTime = socket.gettime() * 1000
      end

      -- 如果是队列原有任务则将其加入队列末尾，以保证能一直循环
      -- 如果是从原有任务衍生的下一步任务，则不加入队列末尾，会被新的下一步任务替换或者删除
      if (action.isBase) then
        table.insert(theMissionsQuery, action)
      end

      -- 执行一个action
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

      -- 如果点了暂停按钮
      if (isPause) then
        stepLabel.setPrefix('')
        local lasttext = stepLabel.getText()
        stepLabel.setStepLabelContent('暂停')
        c.yield(Promise.new(function(resolve)
          local theEid
          theEid = eq.setButotnListener('stopbtn', function()
            isPause = false
            stepLabel.setPrefix('')
            eq.clearButotnListener(theEid)
            resolve()
          end)
        end))
        stepLabel.setStepLabelContent(lasttext)
      end

      if (action.isEnd) then
        local diffTime = (socket.gettime() * 1000) - runStartTime
        if (diffTime < (settings.missionsInterval * 1000)) then
          local remainTime = (settings.missionsInterval * 1000) - diffTime
          stepLabel.setStepLabelContent('休息剩余时间' .. math.ceil(remainTime / 1000) .. '秒')
          while (remainTime > 0) do
            stepLabel.setStepLabelContent('休息剩余时间' .. math.ceil(remainTime / 1000) .. '秒', true)
            c.yield(sleepPromise(1000))
            remainTime = remainTime - 1000
          end
        end

        if (luaExisted) then
          break
        end

        runCount = runCount + 1
      end

      -- 如果是任务队列结尾标志，则count+1
    end
  end
end)).catch(function(err)
  wLog("warship-girls-r-script", "[DATE] " .. err);
  eq.setImmediate(function() error(err) end)
end)

eq.run()

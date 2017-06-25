

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
local campaign = require 'BaseOperate__campaign'


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


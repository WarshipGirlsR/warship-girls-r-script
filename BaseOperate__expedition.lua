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
  local result = multiColorS(list)
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
  local result = multiColorS(list) and (not multiColorS(list2))
  if (not __keepScreenState) then keepScreen(false) end
  return result
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
  local result = multiColorS(list) and multiColorS(list2)
  if (not __keepScreenState) then keepScreen(false) end
  return result
end

-- 从第m章移动到第n章
expedition.moveToChapter = function(n, m)
  n = tonumber(n) or 1
  local oneChapter = {
    { 523, 848, 0xffffff }, { 568, 848, 0xffffe6 },
    { 534, 890, 0xffffff }, { 528, 930, 0xffffff },
    { 540, 948, 0xef7131 }, { 613, 961, 0x5ae7ad },
    { 680, 973, 0x52e3a4 }, { 753, 1005, 0xced7de },
    { 791, 1004, 0xeff3ef }, { 735, 960, 0x8cceef },
  }

  if (type(m) == "nil") then
    -- 先移动到第1章
    for i = 1, 12 do
      tap(358, 962, 100)
      mSleep(80)
    end
    -- 再移动到第n章
    for i = 2, n do
      tap(1835, 963, 100)
      mSleep(500)
    end
  else
    m = tonumber(m) or 1
    local diff = n - m
    -- 移动到第n章
    if (diff > 0) then
      -- 右移
      for i = 1, diff do
        tap(1835, 963, 100)
        mSleep(300)
      end
    elseif (diff < 0) then
      -- 左移
      for i = 1, (0 - diff) do
        tap(358, 962, 100)
        mSleep(300)
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
  local result1 = multiColorS(list1)
  local result2 = multiColorS(list2)
  local result3 = multiColorS(list3)
  local result4 = multiColorS(list4)
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
  local result = multiColorS(list)
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
  local result = multiColorS(list)
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
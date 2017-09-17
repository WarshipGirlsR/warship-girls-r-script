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
  local result = multiColorS(list) and (not multiColorS(list2))
  if (not __keepScreenState) then keepScreen(false) end
  return result
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
  local result = multiColorS(list) and multiColorS(list2)
  if (not __keepScreenState) then keepScreen(false) end
  return result
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
  local result = multiColorS(list)
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
    if (multiColorS(value, 80)) then
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
      if ((not multiColorS({ list[i] }, 80)) and (not multiColorS({ list23[i] }, 80))) then
        result = false
        break
      end
    end
  elseif (checkLevel == 2) then
    -- 有中破或者大破
    for i = 1, #list do
      if ((not multiColorS({ list[i] }, 80)) and (multiColorS({ list22[i] }, 80) or multiColorS({ list21[i] }, 80))) then
        result = false
        break
      end
    end

  elseif (checkLevel == 1) then
    -- 有大破
    for i = 1, #list do
      if ((not multiColorS({ list[i] }, 80)) and multiColorS({ list21[i] }, 80)) then
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
  local result = multiColorS(list)
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
  local result = multiColorS(list)
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
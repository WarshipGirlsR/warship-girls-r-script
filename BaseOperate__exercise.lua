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
  local result = multiColorS(list)
  local result2 = multiColorS(list2)
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
  local result = multiColorS(list)
  local result2 = multiColorS(list2)
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
    if (multiColorS({ item })) then
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
  local result = multiColorS(list)
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
  local result = multiColorS(list)
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

package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/img.lua"] = { path = "./meta-operation/img.lua", name = "./meta-operation/img.lua", source = "local function transRelativePoint(tab, base)\
  if not base then\
    base = tab[1]\
    table.remove(tab, 1)\
  end\
  local newTab = {}\
  for key, value in ipairs(tab) do\
    newTab[key] = table.assign(value, { value[1] - base[1], value[2] - base[2] })\
  end\
\
  local tmp = {}\
  for _, value in ipairs(newTab) do\
    value[3] = string.format('0x%06X', value[3])\
    table.insert(tmp, table.concat(value, '|'))\
  end\
\
  return base, table.concat(tmp, ',')\
end\
\
return {\
  -- 基本方法\
  toPoint = function(tab)\
    local newTab = {}\
    for key = 1, #tab do\
      local value = tab[key]\
      table.insert(newTab, { value.x, value.y })\
    end\
    return newTab\
  end,\
  -- 图片数据\
  battle = {\
    -- 敌方信息面板\
    enemyInfoPanel = {\
      -- 雷巡\
      Cit = (function()\
        local leftTop = { 192, 304 }\
        local rightBotton = { 943, 797 }\
        local basePoint, posandcolor = transRelativePoint({\
          { 596, 507, 0xf7f7f7 },\
          { 619, 508, 0xdee3de }, { 633, 510, 0xe6e7e6 },\
          { 667, 517, 0x3ab2ce }, { 678, 520, 0xcecece },\
          { 675, 530, 0x00cade }, { 651, 531, 0x42555a },\
          { 635, 531, 0xded7de }, { 614, 532, 0x5a5d5a },\
          { 603, 519, 0x4a494a }, { 603, 524, 0x4a4d4a },\
          { 599, 530, 0xd6d2d6 }, { 601, 538, 0xdedfde },\
          { 614, 537, 0xd6d2d6 }, { 629, 537, 0x6b6d6b },\
          { 651, 536, 0x4a4d4a }, { 664, 539, 0x3aaec5 },\
          { 682, 552, 0x3a5152 }, { 678, 552, 0xeff3ef },\
          { 671, 554, 0x42454a }, { 643, 563, 0x21bade },\
          { 633, 557, 0x52b2ce }, { 614, 574, 0xcecace },\
          { 641, 594, 0xcecace }, { 637, 584, 0x00c2e6 },\
        })\
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }\
      end)(),\
      -- 航母\
      CV = (function()\
        local leftTop = { 192, 304 }\
        local rightBotton = { 943, 797 }\
        local basePoint, posandcolor = transRelativePoint({\
          { 213, 325, 0xefebef },\
          { 242, 323, 0xcecace }, { 254, 323, 0xcecace },\
          { 264, 323, 0x296573 }, { 273, 328, 0x7b797b },\
          { 266, 328, 0x94e7ef }, { 254, 328, 0x5a595a },\
          { 241, 328, 0x8c8a8c }, { 232, 328, 0xd6d2d6 },\
          { 224, 328, 0xe6e3e6 }, { 218, 347, 0x525552 },\
          { 233, 347, 0x424142 }, { 237, 347, 0xffffff },\
          { 246, 347, 0x94babd }, { 264, 347, 0x7bd7de },\
          { 270, 347, 0x7bd7e6 }, { 288, 356, 0x00bede },\
          { 272, 370, 0x19819c }, { 244, 383, 0x21bede },\
          { 260, 393, 0xe6ebe6 }, { 281, 386, 0x424542 },\
          { 288, 372, 0x008aa4 }, { 284, 390, 0xa4a6a4 },\
          { 244, 403, 0x00bede }, { 237, 407, 0xcecece },\
        })\
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }\
      end)(),\
      -- 潜艇\
      SS = (function()\
        local leftTop = { 192, 304 }\
        local rightBotton = { 943, 797 }\
        local basePoint, posandcolor = transRelativePoint({\
          { 596, 689, 0xefefef }, { 603, 694, 0xf7f3f7 },\
          { 616, 689, 0xe6e7e6 }, { 632, 684, 0xd6d7d6 },\
          { 651, 696, 0x94d2de }, { 634, 715, 0x525552 },\
          { 610, 716, 0x424d4a }, { 610, 709, 0x313131 },\
          { 620, 705, 0x4a4d4a }, { 627, 698, 0x42454a },\
          { 680, 718, 0x00c2de }, { 654, 727, 0x9c9e9c },\
          { 658, 730, 0xefefef }, { 651, 754, 0x212d31 },\
          { 688, 750, 0x4a3d42 }, { 666, 747, 0x313131 },\
          { 645, 758, 0x313d42 }, { 668, 722, 0xdedfde },\
          { 664, 717, 0x52595a }, { 670, 730, 0x4a454a },\
        })\
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }\
      end)(),\
      -- 补给（捞战利品）\
      AP = (function()\
        local leftTop = { 192, 304 }\
        local rightBotton = { 943, 797 }\
        local basePoint, posandcolor = transRelativePoint({\
          { 206, 509, 0xefefef },\
          { 222, 507, 0xdedfde }, { 230, 508, 0x737573 },\
          { 231, 522, 0x3a494a }, { 222, 517, 0xf7f7f7 },\
          { 241, 509, 0xdedbde }, { 250, 503, 0x6b797b },\
          { 246, 531, 0x4a454a }, { 234, 536, 0x42454a },\
          { 234, 550, 0x63a6bd }, { 216, 551, 0x42868c },\
          { 271, 540, 0xd6d7d6 }, { 263, 545, 0x424142 },\
          { 268, 555, 0xf7fbf7 }, { 270, 561, 0x007184 },\
          { 257, 556, 0x4abed6 }, { 252, 568, 0x108eb5 },\
          { 256, 580, 0x00799c }, { 268, 573, 0x636163 },\
          { 283, 575, 0x424142 }, { 288, 554, 0x08798c },\
        })\
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }\
      end)(),\
    },\
    victoryPanel = {\
      -- 大破\
      bigBreak = (function()\
        local leftTop = { 344, 218 }\
        local rightBotton = { 543, 1046 }\
        local basePoint, posandcolor = transRelativePoint({\
          { 430, 431, 0x292421 }, { 445, 431, 0x313131 },\
          { 431, 459, 0xff695a }, { 439, 465, 0xff6563 },\
          { 458, 466, 0xf75142 }, { 480, 465, 0xf75142 },\
          { 498, 446, 0xffcabd }, { 501, 463, 0x3a3142 },\
          { 409, 470, 0xff6563 }, { 443, 465, 0xff9294 },\
        })\
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }\
      end)(),\
      -- 中破\
      middleBreak = (function()\
        local leftTop = { 344, 218 }\
        local rightBotton = { 543, 1046 }\
        local basePoint, posandcolor = transRelativePoint({\
          { 436, 291, 0xffefbd }, { 456, 312, 0xe6ba63 },\
          { 469, 327, 0xdeae52 }, { 475, 309, 0xffeba4 },\
          { 488, 292, 0x4a4531 }, { 482, 282, 0xf7ca6b },\
          { 426, 311, 0x212019 }, { 415, 323, 0x312d29 },\
          { 406, 331, 0xad8621 }, { 429, 332, 0xb58a31 },\
        })\
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }\
      end)(),\
    },\
  },\
}" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./lib/get-time.lua"] = { path = "./lib/get-time.lua", name = "./lib/get-time.lua", source = "local sz\
local socket\
\
-- get the time\
local gettimeFunc = function()\
  return os.time() * 1000\
end\
\
-- for touchsprite socket\
local _ = (function()\
  local pcallRes = pcall(function()\
    sz = require 'sz'\
    socket = require 'szocket.core'\
    gettimeFunc = function()\
      return socket.gettime() * 1000\
    end\
    mSleep = mSleep or function(n)\
      socket.select(nil, nil, n / 1000)\
    end\
  end)\
  if (pcallRes) then return end\
  local pcallRes2 = pcall(function()\
    socket = require 'socket'\
    gettimeFunc = function()\
      return socket.gettime() * 1000\
    end\
    mSleep = mSleep or function(n)\
      socket.select(nil, nil, n / 1000)\
    end\
  end)\
end)()\
\
return gettimeFunc\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/campaign.lua"] = { path = "./meta-operation/campaign.lua", name = "./meta-operation/campaign.lua", source = "local battle = require './battle';\
\
local campaign = {}\
\
\
-- 战役流程\
\
-- 是否在出征界面\
campaign.isBattlePage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 174, 739, 0x10557b },\
    { 278, 1007, 0x635d52 },\
    { 224, 613, 0xc5cac5 },\
    { 92, 969, 0xa47d42 },\
    { 169, 1014, 0xffffff },\
    { 195, 1033, 0xb58a5a },\
  }\
  -- 四个按钮的颜色\
  local list2 = {\
    { 110, 148, 0x008ebd },\
    { 111, 290, 0x008ebd },\
    { 107, 429, 0x0092c5 },\
    { 111, 572, 0xad4900 },\
  }\
  local result = multiColorS(list) and (not multiColorS(list2))\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击战役按钮\
campaign.clickCampaignBtn = function()\
  tap(102, 530, 100)\
  return true\
end\
\
-- 是否在战役界面\
campaign.isCampaignPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 174, 739, 0x10557b },\
    { 278, 1007, 0x635d52 },\
    { 224, 613, 0xc5cac5 },\
    { 92, 969, 0xa47d42 },\
    { 169, 1014, 0xffffff },\
    { 195, 1033, 0xb58a5a },\
\
    { 318, 703, 0xcecabd },\
    { 284, 842, 0xcecace },\
  }\
  -- 四个按钮的颜色\
  local list2 = {\
    { 110, 148, 0x008ebd },\
    { 111, 290, 0x008ebd },\
    { 107, 429, 0x0092c5 },\
    { 111, 572, 0xad4900 },\
  }\
  local result = multiColorS(list) and multiColorS(list2)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 移动到战役\
campaign.moveToCampaignMission = function(m)\
  m = tonumber(m) or 1\
  -- 先移动到第1章\
  for i = 1, 5 do\
    tap(358, 962, 100)\
    mSleep(200)\
  end\
  -- 再移到第m章\
  for i = 2, m do\
    tap(1836, 960, 100)\
    mSleep(200)\
  end\
  return true\
end\
\
-- 点击准备开始战斗\
campaign.clickCampainReadyBtn = function(difficulty)\
  if (difficulty == 'default') then\
    tap(651, 317, 100)\
  else\
    tap(1504, 309, 100)\
  end\
  return true\
end\
\
-- 等待出征准备界面\
campaign.isReadyBattlePage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 660, 197, 0xcecabd },\
    { 1636, 197, 0xcecabd },\
    { 1627, 336, 0xcecabd },\
    { 1799, 423, 0xd6aa31 },\
    { 1803, 680, 0xcea229 },\
    { 454, 1040, 0xd6cabd },\
    { 1753, 1041, 0xd6cec5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 检测所有状态正常\
campaign.isReadyBattlePageShipStatusAllRight = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local result = true\
  local list = {\
    -- 弹药不足\
    {\
      { 347, 218, 0xb53129 },\
      { 383, 274, 0x9c2021 },\
      { 349, 325, 0x941419 },\
    }, {\
      { 348, 357, 0xad2d29 },\
      { 383, 414, 0x941819 },\
      { 349, 464, 0x8c1410 },\
    }, {\
      { 347, 495, 0xb53131 },\
      { 383, 552, 0x942021 },\
      { 349, 603, 0x8c1419 },\
    }, {\
      { 347, 634, 0xad3131 },\
      { 383, 691, 0x941c21 },\
      { 349, 742, 0x8c1410 },\
    }, {\
      { 347, 773, 0xb53131 },\
      { 383, 830, 0x941c21 },\
      { 349, 880, 0x8c1410 },\
    }, {\
      { 347, 912, 0xad3129 },\
      { 383, 969, 0x8c1419 },\
      { 349, 1019, 0x941810 },\
    },\
    -- 远征中\
    {\
      { 348, 229, 0xc5ba21 },\
      { 382, 262, 0xb58e08 },\
      { 364, 320, 0xb59210 },\
    }, {\
      { 348, 368, 0xcebe31 },\
      { 382, 410, 0xbd9a19 },\
      { 364, 459, 0xb59210 },\
    }, {\
      { 348, 507, 0xcebe21 },\
      { 381, 549, 0xb59210 },\
      { 364, 598, 0xb58e08 },\
    }, {\
      { 348, 646, 0xcebe29 },\
      { 382, 688, 0xbd9a10 },\
      { 364, 737, 0xb58e08 },\
    }, {\
      { 348, 784, 0xceba29 },\
      { 382, 826, 0xbd9a19 },\
      { 364, 875, 0xb58e08 },\
    }, {\
      { 348, 923, 0xc5ba21 },\
      { 382, 966, 0xb59208 },\
      { 364, 1014, 0xb58a08 },\
    },\
  }\
  for key, value in ipairs(list) do\
    if (multiColorS(value, 80)) then\
      result = false\
      break\
    end\
  end\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 检测hp是否安全\
campaign.isReadyBattlePageShipHPSafe = function(checkLevel)\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local result = true\
  -- 槽位上没有船\
  local list = {\
    { 469, 331, 0xbdae9c },\
    { 469, 470, 0xb5aa94 },\
    { 469, 608, 0xb5ae9c },\
    { 469, 747, 0xbdae9c },\
    { 469, 886, 0xb5aa94 },\
    { 469, 1024, 0xb5ae9c },\
  }\
  -- 满血\
  local list23 = {\
    { 469, 214, 0x9cfb8c },\
    { 469, 353, 0x9cff8c },\
    { 469, 491, 0x9cff8c },\
    { 469, 630, 0x9cfb8c },\
    { 469, 769, 0x9cff8c },\
    { 469, 908, 0x94fb84 },\
  }\
  -- 有中破\
  local list22 = {\
    { 469, 332, 0xefe310 },\
    { 469, 471, 0xefe308 },\
    { 469, 609, 0xefe308 },\
    { 469, 748, 0xefe310 },\
    { 469, 887, 0xefe308 },\
    { 469, 1026, 0xefe310 },\
  }\
  -- 有大破\
  local list21 = {\
    { 469, 332, 0xef0c10 },\
    { 469, 470, 0xce0808 },\
    { 469, 609, 0xef0c08 },\
    { 469, 748, 0xef0c10 },\
    { 469, 887, 0xef0c08 },\
    { 469, 1026, 0xef0c10 },\
  }\
  console.log(checkLevel)\
  if (checkLevel == 3) then\
    -- 有不满血\
    for i = 1, #list do\
      if ((not multiColorS({ list[i] }, 80)) and (not multiColorS({ list23[i] }, 80))) then\
        result = false\
        break\
      end\
    end\
  elseif (checkLevel == 2) then\
    -- 有中破或者大破\
    for i = 1, #list do\
      if ((not multiColorS({ list[i] }, 80)) and (multiColorS({ list22[i] }, 80) or multiColorS({ list21[i] }, 80))) then\
        result = false\
        break\
      end\
    end\
\
  elseif (checkLevel == 1) then\
    -- 有大破\
    for i = 1, #list do\
      if ((not multiColorS({ list[i] }, 80)) and multiColorS({ list21[i] }, 80)) then\
        result = false\
        break\
      end\
    end\
  end\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 不满血，返回出征\
campaign.clickReadyBattlePageBackBtn = battle.clickReadyBattlePageBackBtn\
\
-- 点击快速补给\
campaign.clickReadyBattlePageQuickSupplyBtn = battle.clickReadyBattlePageQuickSupplyBtn\
\
-- 等待快速补给界面\
campaign.isQuickSupplyModal = battle.isQuickSupplyModal\
\
-- 点击快速补给\
campaign.clickReadyBattlePageQuickSupplyModalOkBtn = battle.clickReadyBattlePageQuickSupplyModalOkBtn\
\
-- 点击快速修理\
campaign.clickQuickRepairBtn = battle.clickQuickRepairBtn\
\
-- 等待快速修理界面\
campaign.isQuickRepairModal = battle.isQuickRepairModal\
\
-- 点击快速修理\
campaign.clickQuickRepairModalOkBtn = battle.clickQuickRepairModalOkBtn\
\
-- 检测快速修理界面HP是否安全，有几艘船需要快速修理\
campaign.isQuickRepairModalShipNeedRepair = battle.isQuickRepairModalShipNeedRepair\
\
-- 点击快速修理单个船\
campaign.clickQuickRepairModalSingleShip = battle.clickQuickRepairModalSingleShip\
\
-- 点击快速补给关闭\
campaign.clickQuickSupplyModalCloseBtn = battle.clickQuickSupplyModalCloseBtn\
\
-- 点击快速修理关闭\
campaign.clickQuickRepairModalCloseBtn = battle.clickQuickRepairModalCloseBtn\
\
-- 检测舰队可以出征\
campaign.isFleetsCanBattle = battle.isFleetsCanBattle\
\
-- 点击出征开始\
campaign.clickBattleStartBtn = battle.clickBattleStartBtn\
\
-- 等待额外获得资源面板\
campaign.isExtraReceiveModal = battle.isExtraReceiveModal\
\
-- 点击额外获得确定\
campaign.clickExtraReceiveModalOk = battle.clickExtraReceiveModalOk\
\
-- 等待快开始战斗界面\
campaign.isBattleStartPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 81, 146, 0xcecabd },\
    { 1836, 147, 0xcec6bd },\
    { 1837, 928, 0xd6cabd },\
    { 74, 931, 0xcecabd },\
    { 1327, 891, 0xad4d08 },\
    { 1116, 481, 0xcec6bd },\
    { 153, 577, 0xd6cec5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
\
-- 点击开始战斗\
campaign.clickBattleStartModalStartBtn = function()\
  tap(1326, 862, 100)\
  return true\
end\
\
-- 等待阵型界面\
campaign.isFormationPage = battle.isFormationPage\
\
-- 点击阵型\
campaign.clickFormationPageStartBtn = battle.clickFormationPageStartBtn\
\
-- 等待追击页面\
campaign.isPursueModal = battle.isPursueModal\
\
-- 点击追击\
campaign.clickPursueModalOk = battle.clickPursueModalOk\
\
-- 点击放弃\
campaign.clickPursuePageCancel = battle.clickPursuePageCancel\
\
-- 等待胜利界面\
campaign.isVictoryPage = battle.isVictoryPage\
\
-- 胜利界面检测船是否受损\
campaign.isVictoryPageShipDamaged = battle.isVictoryPageShipDamaged\
\
-- 胜利界面检测船HP是否安全\
campaign.isVictoryPageShipHPSafe = battle.isVictoryPageShipHPSafe\
\
-- 点击胜利继续\
campaign.clickVictoryPageContinueBtn = battle.clickVictoryPageContinueBtn\
\
-- 等待胜利继续面板\
campaign.isVictoryPage2 = battle.isVictoryPage2\
\
-- 点击胜利继续2\
campaign.clickVictoryPageContinueBtn2 = battle.clickVictoryPageContinueBtn2\
\
-- 检测胜利对手详情页面\
campaign.isVictoryOpponentDetailPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 185, 218, 0x0881bd },\
    { 137, 863, 0xcecac5 },\
    { 1772, 867, 0xc5c6b5 },\
    { 1741, 243, 0xd6cec5 },\
    { 1495, 837, 0xb54d08 },\
    { 298, 204, 0xffffff },\
    { 372, 204, 0xefefef },\
    { 441, 208, 0xffffff },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击关闭挑战\
campaign.clickVictoryOpponentDetailPageClose = function()\
  tap(1803, 217, 100)\
end\
\
-- 返回home\
campaign.clickBackToHomeBtn = battle.clickBackToHomeBtn\
-- 战役流程\
\
\
return campaign" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/exercise.lua"] = { path = "./meta-operation/exercise.lua", name = "./meta-operation/exercise.lua", source = "local battle = require './battle';\
\
local exercise = {}\
\
\
-- 演习流程\
\
-- 是否在出征页面\
exercise.isBattlePage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 174, 739, 0x10557b },\
    { 278, 1007, 0x635d52 },\
    { 224, 613, 0xc5cac5 },\
    { 92, 969, 0xa47d42 },\
    { 169, 1014, 0xffffff },\
    { 195, 1033, 0xb58a5a },\
  }\
  -- 四个按钮的颜色\
  local list2 = {\
    { 110, 148, 0x008ebd },\
    { 111, 290, 0xad4900 },\
    { 107, 429, 0x0092c5 },\
    { 111, 572, 0x008ebd },\
  }\
  local result = multiColorS(list) and not multiColorS(list2)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
-- 点击演习\
exercise.clickExerciseBtn = function()\
  tap(103, 252, 100)\
  return true\
end\
\
--  检测演习界面\
exercise.isExercisePage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 174, 739, 0x10557b },\
    { 278, 1007, 0x635d52 },\
    { 224, 613, 0xc5cac5 },\
    { 92, 969, 0xa47d42 },\
    { 169, 1014, 0xffffff },\
    { 195, 1033, 0xb58a5a },\
\
    { 671, 39, 0x0871b5 },\
    { 254, 404, 0xcecace },\
    { 253, 759, 0xcecace },\
  }\
  local list2 = {\
    { 687, 33, 0x0875b5 },\
  }\
  -- 四个按钮的颜色\
  local list3 = {\
    { 110, 148, 0x008ebd },\
    { 111, 290, 0xad4900 },\
    { 107, 429, 0x0092c5 },\
    { 111, 572, 0x008ebd },\
  }\
  local result = multiColorS(list) and multiColorS(list2) and multiColorS(list3)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
--  检测是否有演习\
exercise.isExercisePageHaveExercise = function()\
  local __keepScreenState = keepScreenState\
  keepScreen(true)\
  local list = {\
    { 1688, 147, 0xef8a42 },\
    { 1688, 327, 0xe6863a },\
    { 1687, 497, 0xf78e4a },\
    { 1684, 672, 0xf78e4a },\
    { 1687, 851, 0xf78e4a },\
  }\
  local result = false\
  local resList = {}\
  for i, item in ipairs(list) do\
    if (multiColorS({ item })) then\
      table.insert(resList, i)\
      result = true\
    end\
  end\
  if (not __keepScreenState) then keepScreen(false) end\
  return result, resList\
end\
\
--  点击第n个演习\
exercise.clickToNExerciseBtn = function(n)\
  if (n == 1) then\
    tap(1799, 186, 100)\
  elseif (n == 2) then\
    tap(1799, 362, 100)\
  elseif (n == 3) then\
    tap(1799, 538, 100)\
  elseif (n == 4) then\
    tap(1799, 714, 100)\
  elseif (n == 5) then\
    tap(1799, 890, 100)\
  end\
  return true\
end\
\
-- 等待出征准备界面\
exercise.isReadyBattlePage = battle.isReadyBattlePage\
\
-- 点击选择舰队\
exercise.selectFleet = battle.selectFleet\
\
-- 检测所有状态正常\
exercise.isReadyBattlePageShipStatusAllRight = battle.isReadyBattlePageShipStatusAllRight\
\
-- 检测hp是否安全\
exercise.isReadyBattlePageShipHPSafe = battle.isReadyBattlePageShipHPSafe\
\
-- 不满血，返回出征\
exercise.clickReadyBattlePageBackBtn = battle.clickReadyBattlePageBackBtn\
\
-- 点击快速补给\
exercise.clickReadyBattlePageQuickSupplyBtn = battle.clickReadyBattlePageQuickSupplyBtn\
\
-- 等待快速补给界面\
exercise.isQuickSupplyModal = battle.isQuickSupplyModal\
\
-- 点击快速补给\
exercise.clickReadyBattlePageQuickSupplyModalOkBtn = battle.clickReadyBattlePageQuickSupplyModalOkBtn\
\
-- 点击快速修理\
exercise.clickQuickRepairBtn = battle.clickQuickRepairBtn\
\
-- 等待快速修理界面\
exercise.isQuickRepairModal = battle.isQuickRepairModal\
\
-- 点击快速修理\
exercise.clickQuickRepairModalOkBtn = battle.clickQuickRepairModalOkBtn\
\
-- 检测快速修理界面HP是否安全，有几艘船需要快速修理\
exercise.isQuickRepairModalShipNeedRepair = battle.isQuickRepairModalShipNeedRepair\
\
-- 点击快速修理单个船\
exercise.clickQuickRepairModalSingleShip = battle.clickQuickRepairModalSingleShip\
\
-- 点击快速补给关闭\
exercise.clickQuickSupplyModalCloseBtn = battle.clickQuickSupplyModalCloseBtn\
\
-- 点击快速修理关闭\
exercise.clickQuickRepairModalCloseBtn = battle.clickQuickRepairModalCloseBtn\
\
-- 检测舰队可以出征\
exercise.isFleetsCanBattle = battle.isFleetsCanBattle\
\
-- 点击出征开始\
exercise.clickBattleStartBtn = battle.clickBattleStartBtn\
\
-- 等待额外获得资源面板\
exercise.isExtraReceiveModal = battle.isExtraReceiveModal\
\
-- 点击额外获得确定\
exercise.clickExtraReceiveModalOk = battle.clickExtraReceiveModalOk\
\
-- 等待快开始战斗界面\
exercise.isBattleStartPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 81, 146, 0xcecabd },\
    { 1836, 147, 0xcec6bd },\
    { 1837, 928, 0xd6cabd },\
    { 74, 931, 0xcecabd },\
    { 1327, 891, 0xad4d08 },\
    { 1116, 481, 0xcec6bd },\
    { 153, 577, 0xd6cec5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
\
-- 点击开始战斗\
exercise.clickBattleStartModalStartBtn = function()\
  tap(1326, 862, 100)\
  return true\
end\
\
-- 等待阵型界面\
exercise.isFormationPage = battle.isFormationPage\
\
-- 点击阵型\
exercise.clickFormationPageStartBtn = battle.clickFormationPageStartBtn\
\
-- 等待追击页面\
exercise.isPursueModal = battle.isPursueModal\
\
-- 点击追击\
exercise.clickPursueModalOk = battle.clickPursueModalOk\
\
-- 点击放弃\
exercise.clickPursuePageCancel = battle.clickPursuePageCancel\
\
-- 等待胜利界面\
exercise.isVictoryPage = battle.isVictoryPage\
\
-- 胜利界面检测船是否受损\
exercise.isVictoryPageShipDamaged = battle.isVictoryPageShipDamaged\
\
-- 胜利界面检测船HP是否安全\
exercise.isVictoryPageShipHPSafe = battle.isVictoryPageShipHPSafe\
\
-- 点击胜利继续\
exercise.clickVictoryPageContinueBtn = battle.clickVictoryPageContinueBtn\
\
-- 等待胜利继续面板\
exercise.isVictoryPage2 = battle.isVictoryPage2\
\
-- 点击胜利继续2\
exercise.clickVictoryPageContinueBtn2 = battle.clickVictoryPageContinueBtn2\
\
-- 检测胜利对手详情页面\
exercise.isVictoryOpponentDetailPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 185, 218, 0x0881bd },\
    { 137, 863, 0xcecac5 },\
    { 1772, 867, 0xc5c6b5 },\
    { 1741, 243, 0xd6cec5 },\
    { 1495, 837, 0xb54d08 },\
    { 298, 204, 0xffffff },\
    { 372, 204, 0xefefef },\
    { 441, 208, 0xffffff },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击关闭挑战\
exercise.clickVictoryOpponentDetailPageClose = function()\
  tap(1803, 217, 100)\
  return true\
end\
\
-- 返回home\
exercise.clickBackToHomeBtn = battle.clickBackToHomeBtn\
\
\
return exercise" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/repair.lua"] = { path = "./meta-operation/repair.lua", name = "./meta-operation/repair.lua", source = "local repair = {}\
\
\
-- -- 修理流程\
\
-- 点击船坞按钮\
repair.clickDockBtn = function()\
  tap(1442, 743, 100)\
  return true\
end\
\
-- 检测船坞界面\
repair.isDockPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 180, 632, 0x105984 },\
    { 99, 963, 0xb5814a },\
    { 241, 229, 0x4a6184 },\
    { 250, 450, 0x5a718c },\
    { 248, 756, 0x425d7b },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击修理按钮\
repair.clickRepairBtn = function()\
  tap(101, 253, 100)\
  return true\
end\
\
-- 检测修理界面\
repair.isRepairPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 180, 632, 0x105984 },\
    { 99, 963, 0xb5814a },\
    { 241, 229, 0x4a6184 },\
    { 250, 450, 0x5a718c },\
    { 248, 756, 0x425d7b },\
    { 103, 149, 0x0092c5 },\
    { 101, 288, 0xad4900 },\
    { 100, 431, 0x008ebd },\
    { 105, 575, 0x008ec5 },\
    { 1402, 138, 0xcecace },\
    { 1572, 135, 0x7b7d7b },\
    { 1791, 97, 0x848184 },\
    { 1874, 137, 0xc5cac5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 检测可用的修理槽位\
repair.hasEmptyRepairSlot = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list1 = {\
    { 691, 306, 0x0092c5 },\
    { 952, 350, 0x52aaf7 },\
  }\
  local list2 = {\
    { 691, 531, 0x0096c5 },\
    { 952, 575, 0x52a6ef },\
  }\
  local list3 = {\
    { 691, 755, 0x0096c5 },\
    { 952, 805, 0x5aa6ef },\
  }\
  local list4 = {\
    { 691, 980, 0x0092bd },\
    { 952, 1035, 0x6baade },\
  }\
\
  local result1 = multiColorS(list1)\
  local result2 = multiColorS(list2)\
  local result3 = multiColorS(list3)\
  local result4 = multiColorS(list4)\
  local result = false\
  if (result1 or result2 or result3 or result4) then\
    result = true\
  end\
  local hasTable = {}\
  if (result1) then table.insert(hasTable, 1) end\
  if (result2) then table.insert(hasTable, 2) end\
  if (result3) then table.insert(hasTable, 3) end\
  if (result4) then table.insert(hasTable, 4) end\
  if (not __keepScreenState) then keepScreen(false) end\
  return result, hasTable\
end\
\
-- 检测第n个修理槽位可用\
repair.isSlotEmpty = function(n)\
  return function()\
    local __keepScreenState = keepScreenState\
    if (not __keepScreenState) then keepScreen(true) end\
    local result = false\
    if (n == 1) then\
      local list = {\
        { 691, 306, 0x0092c5 },\
        { 952, 350, 0x52aaf7 },\
      }\
      result = multiColorS(list)\
    elseif (n == 2) then\
      local list = {\
        { 691, 531, 0x0096c5 },\
        { 952, 575, 0x52a6ef },\
      }\
      result = multiColorS(list)\
    elseif (n == 3) then\
      local list = {\
        { 691, 751, 0x0096c5 },\
        { 952, 794, 0x52a6f7 },\
      }\
      result = multiColorS(list)\
    elseif (n == 4) then\
      local list = {\
        { 691, 976, 0x0096c5 },\
        { 952, 1022, 0x52a6f7 },\
      }\
      result = multiColorS(list)\
    end\
    if (not __keepScreenState) then keepScreen(false) end\
    return result\
  end\
end\
\
-- 检测第n个修理槽位不可用\
repair.isSlotNotEmpty = function(n)\
  return function()\
    local __keepScreenState = keepScreenState\
    if (not __keepScreenState) then keepScreen(true) end\
    local result = false\
    if (n == 1) then\
      local list = {\
        { 691, 306, 0x0092c5 },\
        { 952, 350, 0x52aaf7 },\
      }\
      result = not multiColorS(list)\
    elseif (n == 2) then\
      local list = {\
        { 691, 531, 0x0096c5 },\
        { 952, 575, 0x52a6ef },\
      }\
      result = not multiColorS(list)\
    elseif (n == 3) then\
      local list = {\
        { 691, 751, 0x0096c5 },\
        { 952, 794, 0x52a6f7 },\
      }\
      result = not multiColorS(list)\
    elseif (n == 4) then\
      local list = {\
        { 691, 976, 0x0096c5 },\
        { 952, 1022, 0x52a6f7 },\
      }\
      result = not multiColorS(list)\
    end\
    if (not __keepScreenState) then keepScreen(false) end\
    return result\
  end\
end\
\
-- 点击第n个修理按钮\
repair.clickRepairSlotBtn = function(n)\
  n = tonumber(n)\
  if (n == 1) then\
    tap(602, 283, 100)\
  elseif (n == 2) then\
    tap(602, 512, 100)\
  elseif (n == 3) then\
    tap(598, 733, 100)\
  elseif (n == 4) then\
    tap(601, 957, 100)\
  end\
  return true\
end\
\
-- 检测修理选船界面\
repair.isSelectShipPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 75, 131, 0x085594 },\
    { 304, 1059, 0x00558c },\
    { 1035, 116, 0x3a556b },\
    { 1658, 130, 0x4a617b },\
    { 1765, 136, 0x1092e6 },\
    { 1824, 463, 0x19a2e6 },\
    { 1803, 815, 0x198ade },\
    { 1749, 973, 0x42c2ef },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 寻找一个不在舰队里的船\
local function transColorListToString(tab)\
  local tmp = {}\
  for key = 1, #tab do\
    local value = tab[key]\
    value[3] = string.format('0x%06X', value[3])\
    table.insert(tmp, table.concat(value, '|'))\
  end\
  return table.concat(tmp, ',')\
end\
\
local function transRelativePoint(tab, basePoint)\
  local newTab = {}\
  for key = 1, #tab do\
    local value = tab[key]\
    newTab[key] = { value[1] - basePoint[1], value[2] - basePoint[2], value[3] }\
  end\
  return newTab\
end\
\
local function transPointList(tab)\
  local newTab = {}\
  for key = 1, #tab do\
    local value = tab[key]\
    table.insert(newTab, { value.x, value.y })\
  end\
  return newTab\
end\
\
local function subtractionList(target, ...)\
  local sources = { ... }\
  local sourcesMap = {}\
  local newTab = {}\
  for key = 1, #sources do\
    local source = sources[key]\
    for key2 = 1, #source do\
      local value = source[key2]\
      sourcesMap[value[1] .. ',' .. value[2]] = value\
    end\
  end\
  for key = 1, #target do\
    local value = target[key]\
    if (not sourcesMap[value[1] .. ',' .. value[2]]) then\
      table.insert(newTab, value)\
    end\
  end\
  return newTab\
end\
\
-- 寻找一个不在舰队里的船。\
-- 先找到所有船的位置，再找到所有在舰队里船的位置，将两个数组相差\
repair.findFirstShipNotInFleet = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
\
  local result = false\
  local leftTop = { 33, 182 }\
  local rightBotton = { 1000, 800 }\
\
  local point1 = { 33, 799, 0x425d7b }\
  local posandcolorBase = transRelativePoint({\
    { 34, 799, 0x00203a },\
    { 40, 722, 0x002042 },\
    { 40, 724, 0xb5babd },\
  }, { point1[1], point1[2], })\
  local thePointBase = transPointList(findMultiColorInRegionFuzzyExt(point1[3], transColorListToString(posandcolorBase), 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2]))\
\
  local posandcolorFleet = transRelativePoint({\
    { 34, 799, 0x00203a },\
    { 40, 722, 0x002042 },\
    { 40, 724, 0xb5babd },\
\
    { 48, 231, 0xffffff },\
    { 52, 208, 0x193542 },\
    { 65, 222, 0x193942 },\
    { 79, 207, 0x193942 },\
    { 65, 193, 0x21394a },\
    { 89, 192, 0xffffff },\
  }, { point1[1], point1[2], })\
  local thePointFleet = transPointList(findMultiColorInRegionFuzzyExt(point1[3], transColorListToString(posandcolorFleet), 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2]))\
  local posandcolorFleetFlatShip = transRelativePoint({\
    { 34, 799, 0x00203a },\
    { 40, 722, 0x002042 },\
    { 40, 724, 0xb5babd },\
\
    { 48, 231, 0xf7d773 },\
    { 52, 208, 0x845500 },\
    { 65, 222, 0x7b5100 },\
    { 79, 207, 0x845908 },\
    { 65, 193, 0x8c6108 },\
    { 89, 192, 0xfff3ad },\
  }, { point1[1], point1[2], })\
  local thePointFleetFlatShip = transPointList(findMultiColorInRegionFuzzyExt(point1[3], transColorListToString(posandcolorFleetFlatShip), 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2]))\
\
  local resultList = subtractionList(thePointBase, thePointFleet, thePointFleetFlatShip)\
\
  if (not __keepScreenState) then keepScreen(false) end\
  if (#resultList > 0) then\
    local result = resultList[1]\
    return { result[1] + 132, 393 }\
  end\
  return nil\
end\
\
-- 点击第一艘船\
repair.clickFirstShip = function()\
  tap(151, 432, 100)\
  return true\
end\
\
-- 点击一搜船\
repair.clickAShip = function(point)\
  tap(point[1], point[2], 100)\
end\
\
-- 滑动到下一页\
repair.moveToNextPage = function()\
  local point = {\
    { 1477, 824, 0x3a516b },\
    { 265, 814, 0xcecabd },\
  }\
  moveTo(point[1][1], point[1][2], point[2][1], point[2][2], 100)\
end\
\
-- 检测修理页面是否还需要滑动到下一页\
repair.isNeedMoveToNextPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 1557, 278, 0x4a6984 },\
    { 1544, 505, 0x426584 },\
    { 1542, 781, 0x3a516b },\
  }\
  local result = not multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击返回港口\
repair.clickSelectShipPageBackBtn = function()\
  tap(1819, 974, 100)\
end\
\
-- 点击返回港口\
repair.clickBackToHomeBtn = function()\
  tap(100, 1015, 100)\
  return true\
end\
\
return repair" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/expedition.lua"] = { path = "./meta-operation/expedition.lua", name = "./meta-operation/expedition.lua", source = "local battle = require './battle';\
local home = require './home';\
\
local expedition = {}\
\
-- -- 远征流程\
-- 检测有远征完成\
expedition.isExpeditionCompleted = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 1374, 135, 0xffffff },\
    { 1609, 134, 0xffffff },\
    { 1597, 208, 0xffffff },\
    { 1390, 209, 0xffffff },\
    { 1478, 173, 0xc52008 },\
    { 1564, 165, 0xc52408 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击出征\
expedition.clickBattle = home.clickBattleBtn\
\
-- 检测在出征界面\
expedition.isBattlePage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 174, 739, 0x10557b },\
    { 278, 1007, 0x635d52 },\
    { 224, 613, 0xc5cac5 },\
    { 92, 969, 0xa47d42 },\
    { 169, 1014, 0xffffff },\
    { 195, 1033, 0xb58a5a },\
  }\
  -- 四个按钮的颜色\
  local list2 = {\
    { 110, 148, 0x008ebd },\
    { 111, 290, 0x008ebd },\
    { 107, 429, 0xb54d08 },\
    { 111, 572, 0x008ebd },\
  }\
  local result = multiColorS(list) and (not multiColorS(list2))\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击远征\
expedition.clickExpedition = function()\
  tap(108, 394, 100)\
  return true\
end\
\
-- 检测在出征远征界面\
expedition.isBattleExpedition = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 174, 739, 0x10557b },\
    { 278, 1007, 0x635d52 },\
    { 224, 613, 0xc5cac5 },\
    { 92, 969, 0xa47d42 },\
    { 169, 1014, 0xffffff },\
    { 195, 1033, 0xb58a5a },\
\
    { 300, 704, 0xc5c2c5 },\
    { 288, 494, 0xcecace },\
  }\
  -- 四个按钮的颜色\
  local list2 = {\
    { 110, 148, 0x008ebd },\
    { 111, 290, 0x008ebd },\
    { 107, 429, 0xb54d08 },\
    { 111, 572, 0x008ebd },\
  }\
  local result = multiColorS(list) and multiColorS(list2)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 从第m章移动到第n章\
expedition.moveToChapter = function(n, m)\
  n = tonumber(n) or 1\
  local oneChapter = {\
    { 523, 848, 0xffffff }, { 568, 848, 0xffffe6 },\
    { 534, 890, 0xffffff }, { 528, 930, 0xffffff },\
    { 540, 948, 0xef7131 }, { 613, 961, 0x5ae7ad },\
    { 680, 973, 0x52e3a4 }, { 753, 1005, 0xced7de },\
    { 791, 1004, 0xeff3ef }, { 735, 960, 0x8cceef },\
  }\
\
  if (type(m) == \"nil\") then\
    -- 先移动到第1章\
    for i = 1, 12 do\
      tap(358, 962, 100)\
      mSleep(80)\
    end\
    -- 再移动到第n章\
    for i = 2, n do\
      tap(1835, 963, 100)\
      mSleep(500)\
    end\
  else\
    m = tonumber(m) or 1\
    local diff = n - m\
    -- 移动到第n章\
    if (diff > 0) then\
      -- 右移\
      for i = 1, diff do\
        tap(1835, 963, 100)\
        mSleep(300)\
      end\
    elseif (diff < 0) then\
      -- 左移\
      for i = 1, (0 - diff) do\
        tap(358, 962, 100)\
        mSleep(300)\
      end\
    end\
  end\
  return true\
end\
\
-- 检测本页有收获奖励，同时获取哪条有奖励\
expedition.isThisExpeditionPageHasReward = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list1 = {\
    { 1378, 50, 0x9c4110 },\
    { 1539, 149, 0xb54d08 },\
  }\
  local list2 = {\
    { 821, 297, 0x9c5921 },\
    { 1539, 369, 0xb54d08 },\
  }\
  local list3 = {\
    { 821, 517, 0x9c5921 },\
    { 1539, 589, 0xb54d08 },\
  }\
  local list4 = {\
    { 821, 747, 0x9c5921 },\
    { 1539, 819, 0xbd4d08 },\
  }\
  local result1 = multiColorS(list1)\
  local result2 = multiColorS(list2)\
  local result3 = multiColorS(list3)\
  local result4 = multiColorS(list4)\
  local result = false\
  if (result1 or result2 or result3 or result4) then\
    result = true\
  end\
  local hasTable = {}\
  if (result1) then table.insert(hasTable, 1) end\
  if (result2) then table.insert(hasTable, 2) end\
  if (result3) then table.insert(hasTable, 3) end\
  if (result4) then table.insert(hasTable, 4) end\
  if (not __keepScreenState) then keepScreen(false) end\
  return result, hasTable\
end\
\
-- 点击第n个按钮\
expedition.clickExpeditionBtn = function(n)\
  n = tonumber(n) or 1\
  if (n == 1) then\
    tap(1668, 123, 100)\
  elseif (n == 2) then\
    tap(1674, 351, 100)\
  elseif (n == 3) then\
    tap(1675, 576, 100)\
  elseif (n == 4) then\
    tap(1676, 801, 100)\
  end\
  return true\
end\
\
-- 检测在远征完成界面\
expedition.isExpeditionCompletedPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 919, 225, 0x085994 },\
    { 1139, 44, 0x08558c },\
    { 1072, 895, 0x082d4a },\
    { 1696, 876, 0x298aad },\
    { 1464, 374, 0xffffff },\
    { 987, 589, 0x52698c },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击继续\
expedition.clickRewardPannelOk = function()\
  tap(1644, 1022, 100)\
  return true\
end\
\
-- 检测第n章能否远征\
expedition.isChapterCanExpedition = function(n)\
  n = tonumber(n) or 1\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {}\
  if (n == 1) then\
    list = {\
      { 1361, 49, 0x005dad },\
      { 1539, 149, 0x0092c5 },\
    }\
  elseif (n == 2) then\
    list = {\
      { 821, 297, 0x0071b5 },\
      { 1539, 369, 0x0096c5 },\
    }\
  elseif (n == 3) then\
    list = {\
      { 821, 517, 0x0071b5 },\
      { 1539, 589, 0x009ac5 },\
    }\
  elseif (n == 4) then\
    list = {\
      { 821, 747, 0x0071bd },\
      { 1539, 819, 0x0096c5 },\
    }\
  end\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 等待出征准备界面\
expedition.isReadyBattlePage = battle.isReadyBattlePage\
\
-- 选择舰队\
expedition.clickSelectFleet = battle.selectFleet\
\
-- 检测所有状态正常\
expedition.isReadyBattlePageShipStatusAllRight = battle.isReadyBattlePageShipStatusAllRight\
\
-- 检测hp是否安全\
expedition.isReadyBattlePageShipHPSafe = battle.isReadyBattlePageShipHPSafe\
\
-- 点击快速补给\
expedition.clickReadyBattlePageQuickSupplyBtn = battle.clickReadyBattlePageQuickSupplyBtn\
\
-- 检测快速补给界面\
expedition.isQuickSupplyModal = battle.isQuickSupplyModal\
\
-- 点击快速补给确定\
expedition.clickReadyBattlePageQuickSupplyModalOkBtn = battle.clickReadyBattlePageQuickSupplyModalOkBtn\
\
-- 点击快速补给关闭\
expedition.clickQuickSupplyModalCloseBtn = battle.clickQuickSupplyModalCloseBtn\
\
-- 点击快速维修\
expedition.clickQuickRepairBtn = battle.clickQuickRepairBtn\
\
-- 等待快速维修界面\
expedition.isQuickRepairModal = battle.isQuickRepairModal\
\
-- 点击快速维修确定\
expedition.clickQuickRepairModalOkBtn = battle.clickQuickRepairModalOkBtn\
\
-- 点击快速修理关闭\
expedition.clickQuickRepairModalCloseBtn = battle.clickQuickRepairModalCloseBtn\
\
-- 检测快速修理界面HP是否安全，有几艘船需要快速修理\
expedition.isQuickRepairModalShipNeedRepair = battle.isQuickRepairModalShipNeedRepair\
\
-- 点击快速修理单个船\
expedition.clickQuickRepairModalSingleShip = battle.clickQuickRepairModalSingleShip\
\
-- 检测舰队可以出征\
expedition.isFleetsCanBattle = battle.isFleetsCanBattle\
\
-- 点击返回远征界面\
expedition.clickBackToExpedition = function()\
  tap(1812, 974, 100)\
  return true\
end\
\
-- 点击远征开始\
expedition.clickBattleStartBtn = battle.clickBattleStartBtn\
\
-- 点击返回港口\
expedition.clickBackToHome = function()\
  tap(101, 1015, 100)\
  return true\
end\
\
return expedition" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/disintegrateShip.lua"] = { path = "./meta-operation/disintegrateShip.lua", name = "./meta-operation/disintegrateShip.lua", source = "local ImgInfo = require './img'\
local battle = require './battle';\
\
local disintegrateShip = {}\
\
\
-- 点击建造按钮\
disintegrateShip.clickBuildPageBtn = function()\
  tap(1235, 546, 100)\
  return true\
end\
\
--  是否在建造界面\
disintegrateShip.isBuildPage = function()\
  local __keepScreenState = keepScreenState\
  if not __keepScreenState then keepScreen(true) end\
  local list = {\
    { 28, 29, 0x08456b }, { 170, 182, 0x105584 },\
    { 34, 324, 0x104d73 }, { 178, 462, 0x105984 },\
    { 178, 714, 0x085584 }, { 226, 557, 0xc5cac5 },\
    { 251, 394, 0x5a758c }, { 252, 616, 0x5a7594 },\
    { 252, 776, 0x4a6584 }, { 249, 956, 0x4a617b },\
    { 269, 146, 0x0065a4 },\
  }\
  -- 四个按钮的颜色\
  local list2 = {\
    { 163, 151, 0x008ec5 },\
    { 164, 289, 0xad4900 },\
    { 166, 432, 0x008ebd },\
    { 162, 573, 0x008ebd },\
  }\
  local result = multiColorS(list) and not multiColorS(list2)\
  if not __keepScreenState then keepScreen(false) end\
  return result\
end\
\
-- 点击解体按钮\
disintegrateShip.clickDisintegratePageBtn = function()\
  tap(102, 257, 100)\
  return true\
end\
\
--  是否在解体界面\
disintegrateShip.isDisintegrateShipPage = function()\
  local __keepScreenState = keepScreenState\
  if not __keepScreenState then keepScreen(true) end\
  local list = {\
    { 28, 29, 0x08456b }, { 170, 182, 0x105584 },\
    { 34, 324, 0x104d73 }, { 178, 462, 0x105984 },\
    { 178, 714, 0x085584 }, { 226, 557, 0xc5cac5 },\
    { 251, 394, 0x5a758c }, { 252, 616, 0x5a7594 },\
    { 252, 776, 0x4a6584 }, { 249, 956, 0x4a617b },\
    { 269, 146, 0x0065a4 },\
\
    { 1884, 721, 0xcecabd }, { 1874, 209, 0xbdb69c },\
    { 1293, 204, 0xd6cabd }, { 1818, 952, 0xc5b69c },\
    { 1079, 928, 0xbdb69c },\
\
    { 1176, 747, 0xbdb69c }, { 748, 725, 0xcecabd },\
  }\
  -- 四个按钮的颜色\
  local list2 = {\
    { 163, 151, 0x008ec5 },\
    { 164, 289, 0xad4900 },\
    { 166, 432, 0x008ebd },\
    { 162, 573, 0x008ebd },\
  }\
  local result = multiColorS(list) and multiColorS(list2)\
  if not __keepScreenState then keepScreen(false) end\
  return result\
end\
\
-- 点击添加按钮\
disintegrateShip.clickAddShipBtn = function()\
  tap(392, 408, 100)\
  return true\
end\
\
--  是否在解体添加界面\
disintegrateShip.addShipPage = function()\
  local __keepScreenState = keepScreenState\
  if not __keepScreenState then keepScreen(true) end\
  local list = {\
    { 77, 136, 0x085994 }, { 1159, 80, 0xcecace },\
    { 1320, 122, 0xcecace }, { 1645, 148, 0xcecace },\
    { 1714, 12, 0x0069ce }, { 1737, 653, 0x109aef },\
    { 1804, 852, 0xad4908 }, { 1811, 1010, 0x008abd },\
    { 1620, 1051, 0x00558c }, { 85, 1066, 0x087dbd },\
  }\
  local result = multiColorS(list)\
  if not __keepScreenState then keepScreen(false) end\
  return result\
end\
\
--  是否有船需要解体\
disintegrateShip.hasShip = function()\
  local __keepScreenState = keepScreenState\
  if not __keepScreenState then keepScreen(true) end\
  local list = {\
    { 74, 241, 0x425d7b }, { 76, 287, 0x42617b },\
    { 72, 371, 0x526d8c }, { 159, 369, 0x5a7594 },\
    { 159, 292, 0x52718c }, { 164, 219, 0x42617b },\
  }\
  local result = not multiColorS(list)\
  if not __keepScreenState then keepScreen(false) end\
  return result\
end\
\
--  点击要解体的船\
disintegrateShip.clickAllShip = function()\
  local list = {\
    { 130, 388, 0x31313a }, { 338, 396, 0x7b8694 },\
    { 545, 397, 0xded7bd }, { 748, 386, 0x5a2431 },\
    { 956, 386, 0x734d29 }, { 1160, 385, 0xf7f3f7 },\
    { 1374, 390, 0xefdbf7 }, { 1577, 387, 0xd6b6de },\
\
    { 130, 840, 0xffffff }, { 330, 835, 0xd6dbd6 },\
    { 547, 848, 0x8c7d7b }, { 757, 840, 0xd6cece },\
    { 958, 842, 0xd6d2ce }, { 1164, 844, 0xadaead },\
    { 1367, 853, 0xbdaeb5 }, { 1576, 855, 0xefe7de },\
  }\
  for key, value in ipairs(list) do\
    tap(value[1], value[2], 80)\
  end\
end\
\
--  点击确定\
disintegrateShip.selectAllShipClickOk = function()\
  tap(1812, 804, 100)\
end\
\
--  点击返回\
disintegrateShip.selectAllShipClickCancel = function()\
  tap(1810, 979, 100)\
end\
\
--  点击解体\
disintegrateShip.clickDisintegrateShipBtn = function()\
  tap(1623, 869, 100)\
end\
\
--  检查是否选中卸下所有装备\
disintegrateShip.checkIsRemoveAllEquipmentEnable = function()\
  local __keepScreenState = keepScreenState\
  if not __keepScreenState then keepScreen(true) end\
  local list = {\
    { 1017, 776, 0xde7d6b }, { 1030, 786, 0xe69284 },\
    { 1048, 773, 0xd65131 }, { 1064, 753, 0xce4931 },\
  }\
  local result = multiColorS(list)\
  if not __keepScreenState then keepScreen(false) end\
  return result\
end\
\
--  点击卸下所有装备\
disintegrateShip.clickRemoveAllEquipmentCheckbox = function()\
  tap(1031, 774, 100)\
end\
\
--  稀有解体确认窗口\
disintegrateShip.disintegrateSRPanel = function()\
  local __keepScreenState = keepScreenState\
  if not __keepScreenState then keepScreen(true) end\
  local list = {\
    { 516, 244, 0x0886ce }, { 1404, 303, 0xcecabd },\
    { 1401, 771, 0xc5baa4 }, { 516, 763, 0xbdb69c },\
    { 1069, 292, 0x08659c }, { 740, 681, 0x42ceef },\
    { 1174, 679, 0xce493a }, { 1204, 709, 0xffffff },\
    { 789, 717, 0xffffff }, { 1070, 796, 0xd6cabd },\
\
    { 565, 449, 0xffffff }, { 610, 445, 0x7b6921 },\
    { 734, 441, 0x6b5910 }, { 830, 456, 0xfffbff },\
    { 1002, 447, 0xf7f7f7 }, { 1107, 441, 0x846d29 },\
    { 1248, 450, 0xf7f7f7 }, { 1315, 452, 0x7b6521 },\
    { 940, 508, 0x735d19 }, { 986, 508, 0xffffff },\
  }\
  local result = multiColorS(list)\
  if not __keepScreenState then keepScreen(false) end\
  return result\
end\
\
--  点击解体确认窗口确定\
disintegrateShip.clickDisintegratePanelOkBtn = function()\
  tap(745, 713, 100)\
end\
\
--  返回home\
disintegrateShip.disintegrateShipPageClickBackToHome = function()\
  tap(103, 1007, 100)\
end\
\
return disintegrateShip\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/mission.lua"] = { path = "./meta-operation/mission.lua", name = "./meta-operation/mission.lua", source = "local mission = {}\
\
-- -- 任务流程\
\
-- 是否有没领取的任务\
mission.isUnreceivedMission = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 888, 970, 0xc51c08 },\
    { 924, 978, 0xc50808 },\
    { 905, 961, 0xd6c242 },\
    { 784, 1002, 0xffffff },\
    { 784, 1039, 0xffffff },\
    { 808, 1039, 0xffffff },\
    { 808, 1000, 0xffffff },\
    { 844, 999, 0xffffff },\
    { 873, 999, 0xffffff },\
    { 856, 1012, 0xffffff },\
    { 847, 1027, 0xffffff },\
    { 878, 1027, 0xffffff },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击任务按钮\
mission.clickMission = function()\
  tap(785, 1016, 100)\
end\
\
-- 等待任务界面\
mission.isMission = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 30, 35, 0x08456b },\
    { 179, 39, 0x105584 },\
    { 180, 761, 0x08557b },\
    { 255, 259, 0x5a7194 },\
    { 1869, 526, 0x42617b },\
    { 1635, 190, 0xd6cabd },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击全部任务按钮\
mission.clickAllMission = function()\
  tap(785, 1016, 100)\
end\
\
-- 等待全部任务界面\
mission.isMissionAllMission = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 30, 35, 0x08456b },\
    { 179, 39, 0x105584 },\
    { 180, 761, 0x08557b },\
    { 255, 259, 0x5a7194 },\
    { 1869, 526, 0x42617b },\
    { 1635, 190, 0xd6cabd },\
    { 102, 150, 0xad4908 },\
    { 102, 292, 0x008ebd },\
    { 104, 435, 0x008abd },\
    { 103, 571, 0x0092c5 },\
    { 104, 711, 0x008ebd },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 检测全部任务界面是否有未领取的奖励\
mission.isMissionUnreceivedReward = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 288, 49, 0xcecabd },\
    { 290, 208, 0xd6cabd },\
    { 1824, 62, 0xc5b69c },\
    { 1676, 172, 0xef863a },\
    { 1673, 210, 0xad4900 },\
    { 1824, 186, 0xde7521 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击领取第一个奖励\
mission.clickGetFirstReward = function()\
  tap(1755, 190, 100)\
end\
\
-- 等待获得面板\
mission.isRewardPannel = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 487, 286, 0x0879bd },\
    { 1086, 277, 0x0061a4 },\
    { 463, 355, 0xd6cec5 },\
    { 1454, 329, 0xcecabd },\
    { 469, 753, 0xc5baa4 },\
    { 1436, 755, 0xbdb69c },\
    { 874, 733, 0x0092bd },\
    { 1032, 727, 0x0096c5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击获得面板确定\
mission.clickRewardPannelOk = function()\
  tap(955, 717, 100)\
end\
\
-- 等待新船\
mission.isNewShipPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 110, 865, 0xadaaad },\
    { 114, 984, 0xcecace },\
    { 582, 1013, 0x00558c },\
    { 1386, 1012, 0x085994 },\
    { 1768, 964, 0x085994 },\
    { 1803, 951, 0xcecece },\
    { 1844, 949, 0x5a5d5a },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击新船\
mission.clickNewShip = function()\
  tap(972, 399, 100)\
end\
\
-- 等待新船锁定对话框\
mission.isNewShipPageLockModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 839, 293, 0x1065a4 },\
    { 1412, 296, 0xd6cac5 },\
    { 503, 337, 0xd6cec5 },\
    { 521, 772, 0xc5b69c },\
    { 1396, 771, 0xbdb69c },\
    { 743, 747, 0x0092c5 },\
    { 1172, 745, 0xa41400 },\
    { 959, 519, 0xd6cec5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 船锁定对话框点击确认\
mission.clickNewShipPageLockModalOkBtn = function()\
  tap(741, 713, 100)\
end\
\
-- 点击任务面板的返回港口\
mission.clickBackToHome = function()\
  tap(136, 986, 100)\
end\
\
return mission" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/battle.lua"] = { path = "./meta-operation/battle.lua", name = "./meta-operation/battle.lua", source = "local ImgInfo = require './img'\
\
local battle = {}\
\
--  是否在出征界面\
battle.isBattlePage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 178, 622, 0x10597b },\
    { 278, 1007, 0x635d52 },\
    { 224, 613, 0xc5cac5 },\
    { 92, 969, 0xa47d42 },\
    { 169, 1014, 0xffffff },\
    { 195, 1033, 0xb58a5a },\
  }\
  -- 四个按钮的颜色\
  local list2 = {\
    { 110, 148, 0xad4908 },\
    { 111, 290, 0x008ebd },\
    { 107, 429, 0x0092c5 },\
    { 111, 572, 0x008ebd },\
  }\
  local result = multiColorS(list) and (not multiColorS(list2))\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击回港\
battle.clickBackToHomeBtn = function()\
  tap(98, 1016, 100)\
  return true\
end\
\
-- 出征页面\
\
--  是否在出征的出征界面\
battle.isBattleBattlePage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 178, 622, 0x10597b },\
    { 278, 1007, 0x635d52 },\
    { 224, 613, 0xc5cac5 },\
    { 92, 969, 0xa47d42 },\
    { 169, 1014, 0xffffff },\
    { 195, 1033, 0xb58a5a },\
  }\
  -- 四个按钮的颜色\
  local list2 = {\
    { 110, 148, 0xad4908 },\
    { 111, 290, 0x008ebd },\
    { 107, 429, 0x0092c5 },\
    { 111, 572, 0x008ebd },\
  }\
  local result = multiColorS(list) and multiColorS(list2)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击出征\
battle.clickBattleBtn = function()\
  tap(101, 110, 100)\
  return true\
end\
\
-- 移动到m-n章节\
battle.moveToChapter = function(chapter)\
  local chapterArr = strSplit(chapter, '-')\
  local m = tonumber(chapterArr[1]) or 1\
  local n = tonumber(chapterArr[2]) or 1\
\
  local leftSissionButton = {\
    { 246, 463, 0x3a92a4 }, { 249, 510, 0x218a9c },\
    { 250, 489, 0x21dbd6 }, { 272, 488, 0x29fbf7 },\
    { 281, 488, 0x217594 },\
  }\
\
  -- 先移到第一章\
  for i = 1, 12 do\
    tap(360, 958, 100)\
    mSleep(80)\
  end\
  -- 再移到第m章\
  for i = 2, m do\
    tap(1827, 961, 100)\
    mSleep(500)\
  end\
  -- 先移到第一节\
  for i = 1, 8 do\
    tap(256, 493, 100)\
    mSleep(80)\
  end\
  -- 再移到第n章\
  for i = 2, n do\
    tap(1889, 485, 100)\
    mSleep(500)\
  end\
end\
\
-- 点击准备出征\
battle.clickReadyBattleBtn = function()\
  tap(1481, 729, 100)\
end\
\
-- 等待出征准备界面\
battle.isReadyBattlePage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 77, 125, 0x105d9c },\
    { 51, 237, 0xd6cec5 },\
    { 50, 842, 0xd6cac5 },\
    { 1631, 823, 0xc5baa4 },\
    { 1647, 243, 0xd6cec5 },\
    { 517, 703, 0xd6cec5 },\
    { 1837, 445, 0xdeaa3a },\
    { 1828, 648, 0xd6a631 },\
    { 1220, 86, 0xcecace },\
    { 1647, 136, 0xcecace },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击选择舰队\
battle.selectFleet = function(fleet)\
  if (fleet == 1) then\
    tap(707, 711, 100)\
  elseif (fleet == 2) then\
    tap(903, 725, 100)\
  elseif (fleet == 3) then\
    tap(1092, 723, 100)\
  elseif (fleet == 4) then\
    tap(1282, 724, 100)\
  end\
  return true\
end\
\
-- 检测所有状态正常\
battle.isReadyBattlePageShipStatusAllRight = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 477, 802, 0xbdb69c },\
    { 490, 802, 0xc5b6a4 },\
    { 514, 802, 0xc5b6a4 },\
    { 541, 802, 0xbdb69c },\
    { 566, 802, 0xc5b6a4 },\
    { 594, 802, 0xc5b6a4 },\
    { 622, 802, 0xc5b6a4 },\
    { 649, 802, 0xbdb69c },\
    { 674, 802, 0xc5b6a4 },\
    { 706, 802, 0xc5b6a4 },\
  }\
  local result = multiColorS(list, 60)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 检测hp是否安全\
battle.isReadyBattlePageShipHPSafe = function(checkLevel)\
  checkLevel = checkLevel or 1\
  -- checklevel = 不满血 or 中破 or 大破 or 不使用\
  -- { 3, 2, 1, 0 }\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
\
  local result = true\
\
  local list = {\
    { 634, 631, 0x085994 },\
    { 829, 631, 0x105d94 },\
    { 1029, 631, 0x105d94 },\
    { 1229, 631, 0x105d94 },\
    { 1419, 631, 0x105d94 },\
    { 1619, 631, 0x105d94 },\
  }\
\
  -- 满血\
  local list23 = {\
    { 640, 600, 0x9cfb8c },\
    { 837, 600, 0x9cfb8c },\
    { 1034, 600, 0x9cfb8c },\
    { 1231, 600, 0x9cfb8c },\
    { 1428, 600, 0x9cfb8c },\
    { 1625, 600, 0x9cfb8c },\
  }\
  -- 黄血 中破\
  local list22 = {\
    { 1459, 599, 0xefdb21 },\
    { 1262, 599, 0xe6d719 },\
    { 1065, 599, 0xefdb21 },\
    { 868, 599, 0xe6d719 },\
    { 671, 599, 0xefdb21 },\
    { 474, 599, 0xe6d719 },\
  }\
  -- 红血 大破\
  local list21 = {\
    { 474, 600, 0xef1010 },\
    { 671, 600, 0xe61010 },\
    { 868, 600, 0xef1010 },\
    { 1065, 600, 0xe61010 },\
    { 1262, 600, 0xef1010 },\
    { 1459, 600, 0xe61010 },\
  }\
  if (checkLevel == 3) then\
    -- 有不满血\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and (not multiColorS({ list23[i] }, 80))) then\
        result = false\
        break\
      end\
    end\
  elseif (checkLevel == 2) then\
    -- 有中破或大破\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and (multiColorS({ list22[i] }, 80) or multiColorS({ list21[i] }, 80))) then\
        result = false\
        break\
      end\
    end\
  elseif (checkLevel == 1) then\
    -- 有大破\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and multiColorS({ list21[i] }, 80)) then\
        result = false\
        break\
      end\
    end\
  end\
\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 不满血，返回出征\
battle.clickReadyBattlePageBackBtn = function()\
  tap(1814, 974, 100)\
end\
\
-- 点击快速补给\
battle.clickReadyBattlePageQuickSupplyBtn = function()\
  tap(1812, 109, 100)\
end\
\
-- 等待快速补给界面\
battle.isQuickSupplyModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 264, 173, 0x0079bd }, { 1012, 214, 0x08619c },\
    { 1412, 226, 0xd6cabd }, { 1439, 842, 0xc5b69c },\
    { 285, 835, 0xd6cec5 }, { 1144, 764, 0x42ceef },\
    { 1398, 806, 0x0096c5 }, { 1258, 779, 0xffffff },\
    { 477, 187, 0x08518c }, { 555, 200, 0x10598c },\
    { 514, 201, 0x08598c }, { 516, 170, 0x005d9c },\
    { 554, 184, 0xffffff }, { 547, 209, 0xffffff },\
    { 505, 205, 0xfffbff },\
  }\
  -- 带支援的快速补给\
  local list2 = {\
    { 152, 173, 0x0081c5 }, { 922, 173, 0x00619c },\
    { 1601, 174, 0xde1c00 }, { 153, 855, 0xd6cabd },\
    { 1552, 853, 0xc5b69c }, { 274, 172, 0x085d9c },\
    { 296, 183, 0x004d7b }, { 317, 182, 0x004973 },\
    { 342, 190, 0xe6ebef }, { 302, 190, 0xffffff },\
    { 361, 185, 0xffffff }, { 400, 184, 0xffffff },\
    { 429, 183, 0xffffff }, { 457, 181, 0xf7fbff },\
    { 449, 201, 0x105d94 }, { 357, 203, 0x105d94 },\
    { 371, 205, 0x106194 }, { 390, 205, 0x105d94 },\
    { 442, 202, 0xffffff }, { 1265, 767, 0x42caef },\
    { 1503, 805, 0x0096c5 }, { 1446, 780, 0xffffff },\
    { 1294, 780, 0x42c2ef }, { 1363, 800, 0xffffff },\
  }\
  local result = multiColorS(list) or multiColorS(list2)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击快速补给\
battle.clickReadyBattlePageQuickSupplyModalOkBtn = function()\
  tap(1310, 793, 100)\
end\
\
-- 点击快速修理\
battle.clickQuickRepairBtn = function()\
  tap(1813, 252, 100)\
end\
\
-- 等待快速修理界面\
battle.isQuickRepairModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 254, 168, 0x008ace }, { 1023, 207, 0x1061a4 },\
    { 1417, 228, 0xd6cabd }, { 1443, 841, 0xc5baa4 },\
    { 268, 841, 0xcecabd }, { 1402, 761, 0x42caef },\
    { 1142, 806, 0x0096c5 }, { 1189, 793, 0xffffff },\
    { 481, 181, 0xffffff }, { 523, 196, 0x08558c },\
    { 532, 186, 0xffffff }, { 555, 179, 0xffffff },\
    { 554, 208, 0xffffff }, { 576, 192, 0x19619c },\
    { 521, 196, 0x08558c }, { 491, 202, 0xf7f7f7 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击快速修理\
battle.clickQuickRepairModalOkBtn = function()\
  tap(1269, 785, 100)\
end\
\
-- 检测快速修理界面HP是否安全，有几艘船需要快速修理\
battle.isQuickRepairModalShipNeedRepair = function(checkLevel)\
  checkLevel = checkLevel or 1\
  -- checklevel = 不满血 or 中破 or 大破 or 不使用\
  -- { 3, 2, 1, 0 }\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 444, 643, 0x0069a4 },\
    { 641, 643, 0x086dad },\
    { 838, 643, 0x0869a4 },\
    { 1035, 643, 0x086dad },\
    { 1232, 643, 0x0069a4 },\
    { 1428, 643, 0x0069a4 },\
  }\
  -- 满血\
  local list23 = {\
    { 281, 621, 0x08ba08 },\
    { 478, 621, 0x08ba08 },\
    { 675, 621, 0x08ba08 },\
    { 872, 621, 0x08ba08 },\
    { 1069, 621, 0x08ba08 },\
    { 1266, 621, 0x08ba08 },\
  }\
  -- 中破\
  local list22 = {\
    { 281, 621, 0xbd8e08 },\
    { 477, 621, 0xbd8e08 },\
    { 674, 621, 0xbd8e08 },\
    { 871, 621, 0xbd8e08 },\
    { 1068, 621, 0xbd8e08 },\
    { 1265, 621, 0xbd8e08 },\
  }\
  -- 大破\
  local list21 = {\
    { 281, 621, 0xbd0808 },\
    { 477, 621, 0xbd0808 },\
    { 674, 621, 0xbd0808 },\
    { 871, 621, 0xbd0808 },\
    { 1068, 621, 0xbd0808 },\
    { 1265, 621, 0xbd0808 },\
  }\
  local result = {}\
  if (checkLevel == 3) then\
    -- 不满血\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and (not multiColorS({ list23[i] }, 80))) then\
        table.insert(result, i)\
      end\
    end\
  elseif (checkLevel == 2) then\
    -- 有中破或大破\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and (multiColorS({ list22[i] }, 80) or multiColorS({ list21[i] }, 80))) then\
        table.insert(result, i)\
      end\
    end\
  elseif (checkLevel == 1) then\
    -- 有大破\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and multiColorS({ list21[i] }, 80)) then\
        table.insert(result, i)\
      end\
    end\
  end\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击快速修理单个船\
battle.clickQuickRepairModalSingleShip = function(shipList)\
  if (type(shipList) ~= 'table') then\
    shipList = { shipList }\
  end\
  for key = 1, #shipList do\
    local value = shipList[key]\
    if (value == 1) then\
      tap(360, 397, 100)\
    elseif (value == 2) then\
      tap(557, 397, 100)\
    elseif (value == 3) then\
      tap(754, 397, 100)\
    elseif (value == 4) then\
      tap(951, 397, 100)\
    elseif (value == 5) then\
      tap(1148, 397, 100)\
    elseif (value == 6) then\
      tap(1345, 397, 100)\
    end\
  end\
end\
\
-- 点击快速补给关闭\
battle.clickQuickSupplyModalCloseBtn = function()\
  tap(1473, 195, 100)\
end\
\
-- 点击快速修理关闭\
battle.clickQuickRepairModalCloseBtn = battle.clickQuickSupplyModalCloseBtn\
\
-- 检测舰队可以出征\
battle.isFleetsCanBattle = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 781, 999, 0xfff3e6 },\
    { 968, 971, 0xfff7ef },\
    { 1017, 971, 0xfffbf7 },\
    { 1083, 990, 0xfff7ef },\
  }\
  local result = not multiColorS(list, 70)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击出征开始\
battle.clickBattleStartBtn = function()\
  tap(956, 987, 100)\
end\
\
-- 等待额外获得资源面板\
battle.isExtraReceiveModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 491, 298, 0x087dbd },\
    { 1473, 327, 0xd6cec5 },\
    { 1090, 319, 0x0869a4 },\
    { 1469, 771, 0xc5baa4 },\
    { 455, 766, 0xc5b69c },\
    { 956, 748, 0x008ebd },\
    { 962, 655, 0xbdb69c },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击额外获得确定\
battle.clickExtraReceiveModalOk = function()\
  tap(957, 715, 100)\
end\
\
-- 等待快开始战斗界面\
battle.isBattleStartPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 92, 210, 0xd6cabd },\
    { 931, 211, 0xd6cec5 },\
    { 1824, 226, 0xd6cabd },\
    { 84, 981, 0xcecabd },\
    { 909, 994, 0xcecabd },\
    { 1820, 993, 0xcecabd },\
    { 1205, 942, 0xcecabd },\
    { 1427, 951, 0xad4d08 },\
    { 1180, 512, 0xd6cac5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 快开始页面能否迂回\
battle.isBattleStartPageCanRoundabout = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 1169, 895, 0x4acef7 },\
    { 1223, 890, 0x42cef7 },\
    { 1317, 890, 0x42ceef },\
    { 1326, 943, 0x0092bd },\
    { 1231, 916, 0xffffff },\
    { 1201, 928, 0xffffff },\
    { 1184, 948, 0x008ec5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
\
-- 点击战术迂回\
battle.clickBattleStartModalRoundaboutBtn = function()\
  tap(1251, 918, 100)\
end\
\
-- 检测敌方队伍有没有航母\
battle.isEnemyShipIsCV = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local theCV = ImgInfo.battle.enemyInfoPanel.CV\
  local pointList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(theCV)))\
  pointList = ImgInfo.toPoint(pointList)\
  if (not __keepScreenState) then keepScreen(false) end\
  if (#pointList > 0) then\
    return true\
  end\
  return false\
end\
\
-- 检测敌方队伍有没有雷巡\
battle.isEnemyShipIsCit = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local theCit = ImgInfo.battle.enemyInfoPanel.Cit\
  local pointList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(theCit)))\
  pointList = ImgInfo.toPoint(pointList)\
  if (not __keepScreenState) then keepScreen(false) end\
  if (#pointList > 0) then\
    return true\
  end\
  return false\
end\
\
-- 检测敌方队伍有没有潜艇\
battle.isEnemyShipIsSS = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local theSS = ImgInfo.battle.enemyInfoPanel.SS\
  local pointList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(theSS)))\
  pointList = ImgInfo.toPoint(pointList)\
  if (not __keepScreenState) then keepScreen(false) end\
  if (#pointList > 0) then\
    return true\
  end\
  return false\
end\
\
-- 检测敌方队伍有没有补给\
battle.isEnemyShipIsAP = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local theAP = ImgInfo.battle.enemyInfoPanel.AP\
  local pointList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(theAP)))\
  if (not __keepScreenState) then keepScreen(false) end\
  if (#pointList > 0) then\
    return true\
  end\
  return false\
end\
\
-- 点击开始战斗\
battle.clickBattleStartModalStartBtn = function()\
  tap(1421, 919, 100)\
end\
\
-- 点击返回港口\
battle.clickBattleStartModalBackToHomeBtn = function()\
  tap(1650, 918, 100)\
end\
\
-- 等待阵型界面\
battle.isFormationPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 771, 787, 0xffffff },\
    { 1408, 880, 0x085994 },\
    { 1537, 679, 0x085994 },\
    { 1617, 487, 0x085d94 },\
    { 1542, 293, 0x005994 },\
    { 1410, 84, 0x005d9c },\
    { 1520, 140, 0x7be794 },\
    { 1638, 343, 0x6bdf84 },\
    { 1706, 540, 0x73df8c },\
    { 1631, 737, 0x6bd27b },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击阵型\
battle.clickFormationPageStartBtn = function(formation)\
  formation = formation or 0\
  if (formation == 1) then\
    -- 单纵\
    tap(1553, 140, 100)\
  elseif (formation == 2) then\
    -- 复纵\
    tap(1685, 344, 100)\
  elseif (formation == 3) then\
    -- 轮型\
    tap(1760, 541, 100)\
  elseif (formation == 4) then\
    -- 梯形\
    tap(1684, 734, 100)\
  elseif (formation == 5) then\
    -- 单横\
    tap(1553, 931, 100)\
  else\
    -- 复纵\
    tap(1685, 344, 100)\
  end\
end\
\
-- 等待追击页面\
battle.isPursueModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 554, 285, 0xc5cac5 },\
    { 765, 443, 0x10595a },\
    { 1320, 313, 0x42ceef },\
    { 1338, 336, 0xffffff },\
    { 572, 757, 0xc5cac5 },\
    { 951, 716, 0x08353a },\
    { 1353, 751, 0xcecece },\
    { 734, 705, 0xe6863a },\
    { 1196, 702, 0x42cef7 },\
    -- 追击\
    { 659, 723, 0xe68131 },\
    { 671, 725, 0xffffff },\
    { 714, 750, 0xffffff },\
    { 698, 765, 0x5a4129 },\
    { 677, 765, 0xf7f3f7 },\
    { 740, 733, 0xde7521 },\
    { 779, 726, 0x4a2408 },\
    { 780, 739, 0x422008 },\
    { 787, 748, 0xf7fbff },\
    { 798, 760, 0xa44500 },\
    -- 放弃\
    { 1109, 729, 0x42c2e6 },\
    { 1122, 729, 0x636d73 },\
    { 1143, 732, 0x6b868c },\
    { 1144, 747, 0xe6efef },\
    { 1163, 749, 0x3a5563 },\
    { 1188, 748, 0x29b6de },\
    { 1213, 729, 0xfffbff },\
    { 1240, 725, 0x002d3a },\
    { 1225, 755, 0xa4a6ad },\
    { 1236, 771, 0x000408 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击追击\
battle.clickPursueModalOk = function()\
  tap(726, 746, 100)\
end\
\
-- 点击放弃\
battle.clickPursuePageCancel = function()\
  tap(1178, 754, 100)\
end\
\
-- 等待胜利界面\
battle.isVictoryPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 88, 234, 0x29415a },\
    { 87, 649, 0x31415a },\
    { 73, 1011, 0x29415a },\
    { 876, 991, 0x42597b },\
    { 1071, 87, 0x42557b },\
    { 1071, 313, 0x19395a },\
    { 1122, 870, 0x0875a4 },\
    { 1271, 994, 0x0875a4 },\
    { 1714, 970, 0x085184 },\
    { 1767, 801, 0x298ead },\
    { 1774, 799, 0x218aa4 },\
    { 1761, 892, 0x00558c },\
    { 1405, 990, 0x107dad },\
    { 1111, 1022, 0x0081ad },\
    { 1565, 1016, 0xffffff },\
    { 1620, 1020, 0xffffff },\
    { 1675, 1016, 0xffffff },\
    { 1726, 1014, 0xffffff },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 胜利界面检测船是否受损\
battle.isVictoryPageShipDamaged = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 682, 246, 0xc5b6a4 },\
    { 682, 390, 0xc5b6a4 },\
    { 682, 530, 0xc5b6a4 },\
    { 682, 674, 0xc5b6a4 },\
    { 682, 810, 0xc5b6a4 },\
    { 682, 950, 0xc5b6a4 },\
  }\
  local list2 = {\
    { 697, 325, 0x5af752 },\
    { 697, 465, 0x5af752 },\
    { 697, 606, 0x52f34a },\
    { 697, 747, 0x5af752 },\
    { 697, 887, 0x5af752 },\
    { 697, 1028, 0x52f34a },\
  }\
  local result = false\
  for i = 1, #list do\
    if ((multiColorS({ list[i] })) and (not multiColorS({ list2[i] }))) then\
      result = true\
      break\
    end\
  end\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 胜利界面检测船HP是否安全\
battle.isVictoryPageShipHPSafe = function(checkLevel)\
  checkLevel = checkLevel or 1\
  -- '有中破,有大破'\
  -- checkLevel == 2 or 1\
  local __keepScreenState = keepScreenState\
  keepScreen(false)\
  keepScreen(true)\
  local bigBreak = ImgInfo.battle.victoryPanel.bigBreak\
  local middleBreak = ImgInfo.battle.victoryPanel.middleBreak\
  local positionList = {\
    { 443, 209, 0x3a517b },\
    { 443, 347, 0x4a5d84 },\
    { 443, 488, 0x425573 },\
    { 443, 628, 0x42597b },\
    { 443, 769, 0x425573 },\
    { 443, 910, 0x3a5173 },\
    { 443, 1049, 0x42557b },\
  }\
\
  local result = true\
  if checkLevel == 2 then\
    -- 有中破或者大破\
    local bigBreakList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(bigBreak)))\
    local middleBreakList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(middleBreak)))\
    if #bigBreakList > 0 or #middleBreakList > 0 then\
      result = false\
    end\
  elseif checkLevel == 1 then\
    -- 有大破\
    local bigBreakList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(bigBreak)))\
    if #bigBreakList > 0 then\
      result = false\
    end\
  end\
  if not __keepScreenState then keepScreen(false) end\
  return result\
end\
\
-- 点击胜利继续\
battle.clickVictoryPageContinueBtn = function()\
  tap(1650, 1020, 100)\
end\
\
-- 等待胜利继续面板\
battle.isVictoryPage2 = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 88, 38, 0x2181bd },\
    { 306, 42, 0x10558c },\
    { 24, 191, 0x314d73 },\
    { 15, 625, 0x3a5173 },\
    { 575, 1066, 0x425173 },\
    { 957, 111, 0x085994 },\
    { 575, 227, 0xc5baa4 },\
    { 1649, 958, 0x42ceef },\
    { 1734, 956, 0x42cef7 },\
    { 1816, 1021, 0x008ebd },\
    { 1651, 1008, 0x0096c5 },\
    { 1705, 986, 0xffffff },\
    { 1823, 1010, 0x0096c5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
\
-- 点击胜利继续2\
battle.clickVictoryPageContinueBtn2 = function()\
  tap(1730, 993, 100)\
end\
\
-- 等待大破警告\
battle.isShipSevereDamageModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 562, 289, 0xc5cac5 },\
    { 550, 682, 0x083942 },\
    { 1368, 681, 0x08353a },\
    { 1063, 304, 0x001c19 },\
    { 834, 771, 0xc51400 },\
    { 1083, 774, 0x0092c5 },\
    { 586, 336, 0xff2800 },\
    { 725, 339, 0xff2800 },\
    { 872, 354, 0xff2800 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 大破警告框点击回港\
battle.clickShipSevereDamageModalBack = function()\
  tap(1182, 753, 100)\
end\
\
-- 等待无法前进警告框\
battle.isShipCantGoOnModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 1064, 280, 0x088ece },\
    { 1638, 283, 0x006db5 },\
    { 1059, 369, 0xd6cec5 },\
    { 1060, 627, 0xcecabd },\
    { 1824, 630, 0xd6cabd },\
    { 1824, 335, 0xcecabd },\
    { 1203, 449, 0xd6cec5 },\
    { 1646, 451, 0xcecabd },\
    { 1702, 452, 0xd6cabd },\
    { 1191, 570, 0xc5b69c },\
    { 1694, 570, 0xc5b6a4 },\
    { 1433, 562, 0xbdb69c },\
    { 1458, 576, 0xc5b69c },\
    { 1490, 576, 0xc5b69c },\
    { 1667, 577, 0xc5baa4 },\
    { 1232, 568, 0xfffbf7 },\
    { 1302, 566, 0xffffff },\
    { 1405, 569, 0xffffff },\
    { 1564, 567, 0xffffff },\
    -- 返回母港按钮\
    { 1319, 821, 0x3ac2ef },\
    { 1567, 817, 0x42c2ef },\
    { 1352, 818, 0xffffff },\
    { 1394, 818, 0xffffff },\
    { 1435, 821, 0xffffff },\
    { 1458, 823, 0xffffff },\
    { 1489, 823, 0xffffff },\
    { 1531, 818, 0xffffff },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 受损过重警告框点击回港\
battle.clickShipCantGoOnModalBackBtn = function()\
  tap(1449, 825, 100)\
end\
\
-- 等待新船\
battle.isNewShipPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 110, 865, 0xadaaad }, { 114, 984, 0xcecace },\
    { 1386, 1012, 0x085994 }, { 1768, 964, 0x085994 },\
    { 1803, 951, 0xcecece }, { 1844, 949, 0x5a5d5a },\
    { 114, 940, 0xcecace }, { 73, 996, 0x636563 },\
    { 482, 1018, 0x0861a4 }, { 1805, 981, 0xcecece },\
    { 1845, 975, 0x6b656b }, { 1848, 921, 0x525552 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击新船\
battle.clickNewShip = function()\
  tap(972, 399, 100)\
end\
\
-- 等待新船锁定对话框\
battle.isNewShipPageLockModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 839, 293, 0x1065a4 },\
    { 1412, 296, 0xd6cac5 },\
    { 503, 337, 0xd6cec5 },\
    { 521, 772, 0xc5b69c },\
    { 1396, 771, 0xbdb69c },\
    { 743, 747, 0x0092c5 },\
    { 1172, 745, 0xa41400 },\
    { 959, 519, 0xd6cec5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 船锁定对话框点击确认\
battle.clickNewShipPageLockModalOkBtn = function()\
  tap(741, 713, 100)\
end\
\
-- 等待前进对话框\
battle.isNextLevelStepModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 554, 285, 0xc5cac5 },\
    { 765, 443, 0x10595a },\
    { 1320, 313, 0x42ceef },\
    { 1338, 336, 0xffffff },\
    { 572, 757, 0xc5cac5 },\
    { 951, 716, 0x08353a },\
    { 1353, 751, 0xcecece },\
    { 734, 705, 0xe6863a },\
    { 1196, 702, 0x42cef7 },\
  }\
  local list2 = {\
    -- 前进\
    { 659, 723, 0xe68131 },\
    { 671, 725, 0x5a3d29 },\
    { 714, 750, 0xffffff },\
    { 698, 765, 0x4a2410 },\
    { 677, 765, 0x633d29 },\
    { 740, 733, 0xde7521 },\
    { 779, 726, 0x633110 },\
    { 780, 739, 0x4a2408 },\
    { 787, 748, 0xf7fbff },\
    { 798, 760, 0xbd5100 },\
  }\
  local list3 = {\
    -- 回港\
    { 1109, 729, 0x4acaf7 },\
    { 1122, 729, 0xf7f7f7 },\
    { 1143, 732, 0x000c21 },\
    { 1144, 747, 0x08313a },\
    { 1163, 749, 0xffffff },\
    { 1188, 748, 0x29b6de },\
    { 1213, 729, 0xffffff },\
    { 1240, 725, 0x31414a },\
    { 1225, 755, 0x082031 },\
    { 1236, 771, 0xffffff },\
  }\
  local result = multiColorS(list) and multiColorS(list2) and multiColorS(list3)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 等待前进点击前进\
battle.clickLevelStepModalContinueBtn = function()\
  tap(727, 751, 100)\
end\
\
-- 等待前进点击回港\
battle.clickLevelStepModalBackBtn = function()\
  tap(1181, 748, 100)\
end\
\
\
return battle" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./utils/ajax-sent-to-push-bullet.lua"] = { path = "./utils/ajax-sent-to-push-bullet.lua", name = "./utils/ajax-sent-to-push-bullet.lua", source = "local sz = require 'sz'\
local json = sz.json\
\
function sendToPushBullet(token, title, body)\
  local requestBody = {\
    title = title,\
    body = body,\
    type = 'note',\
  }\
  local requestHeader = {\
    ['Access-Token'] = token,\
    ['Content-Type'] = 'application/json';\
    ['Content-Length'] = string.len(json.encode(requestBody));\
  }\
  local commandTable = {}\
  table.insert(commandTable, '--connect-timeout 1')\
  table.insert(commandTable, '-m 0')\
  for k, v in pairs(requestHeader) do\
    table.insert(commandTable, '--header ' .. k .. ':' .. v)\
  end\
  table.insert(commandTable, '--data-binary ' .. json.encode(json.encode(requestBody)))\
  table.insert(commandTable, '--request POST')\
  table.insert(commandTable, 'https://api.pushbullet.com/v2/pushes')\
  local res = io.popen('curl ' .. table.concat(commandTable, ' '));\
  local responseBody = res:read('*a')\
  return responseBody\
end\
\
return sendToPushBullet\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./utils/vibrator-promise.lua"] = { path = "./utils/vibrator-promise.lua", name = "./utils/vibrator-promise.lua", source = "if type(Promise) ~= 'table' then\
  error('SleepPromise need Promise module to work. Please require \\'Promise\\' as global variable.', 2)\
end\
if type(EventQuery) ~= 'table' then\
  error('SleepPromise need EventQuery module to work. Please require \\'EventQuery\\' as global variableß .', 2)\
end\
\
local sleepPromise = function(ms)\
  return Promise.new(function(resolve)\
    EventQuery.setTimeout(resolve, ms)\
  end)\
end\
\
local vibratorPromise = function(num, ms)\
  num = num or 1\
  ms = ms or 500\
  local res = Promise.resolve(1)\
  for key = 1, num do\
    res = res.andThen(function()\
      return vibrator()\
    end).andThen(function()\
      return sleepPromise(ms)\
    end)\
  end\
  return res\
end\
return vibratorPromise\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/common-listener.lua"] = { path = "./missions/common-listener.lua", name = "./missions/common-listener.lua", source = "local moBattle = require '../meta-operation/battle'\
local moHome = require '../meta-operation/home'\
local moNetwork = require '../meta-operation/network'\
local moLogin = require '../meta-operation/login'\
\
local store = require '../store'\
\
local o = {\
  home = moHome,\
  battle = moBattle,\
  network = moNetwork,\
  login = moLogin,\
}\
\
local getComListener = function()\
  local settings = store.settings\
  return {\
    { { type = 'NETWORK_NETWORK_FAILURE_MODAL', addToStart = true }, o.network.isNetworkFailureModal, 6000 },\
    { { type = 'NETWORK_CHECK_NETWORK_MODAL', addToStart = true }, o.network.isCheckNetworkModal, 6000 },\
    { 'LOGIN_START_APP', o.login.isAppNotRun, 20000 },\
    -- 5分钟界面不变化则重启游戏\
    { 'LOGIN_START_APP', function() return true end, settings.restartInterval * 1000 },\
    --        { { type = 'PAUSE_PAUSE', addToStart = true },  o.home.isPause },\
  }\
end\
local getHomeListener = function()\
  local settings = store.settings\
\
  return {\
    { 'HOME_HOME', o.home.isHome, 2000 },\
    { { type = 'HOME_MEDAL_MODAL', addToStart = true }, o.home.isMedalModal, 6000 },\
    { { type = 'HOME_NEWS_MODAL', addToStart = true }, o.home.isNewsModal, 6000 },\
    { { type = 'HOME_SIGN_MODAL', addToStart = true }, o.home.isSignModal, 6000 },\
  }\
end\
\
local getLoginListener = function()\
  local settings = store.settings\
\
  return {\
    { { type = 'LOGIN_SELECT_SERVER' }, o.login.isSelectServerPage, 6000 },\
    { { type = 'LOGIN_SELECT_SERVER' }, o.login.isLoginPage, 6000 },\
  }\
end\
\
return {\
  getComListener = getComListener,\
  getHomeListener = getHomeListener,\
  getLoginListener = getLoginListener,\
}" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/login.lua"] = { path = "./meta-operation/login.lua", name = "./meta-operation/login.lua", source = "local login = {}\
\
\
-- 启动游戏\
login.startApp = function()\
  if (isFrontApp(\"com.huanmeng.zhanjian2\") ~= 1) then\
    runApp(\"com.huanmeng.zhanjian2\")\
  end\
end\
\
-- 重启游戏\
login.restartApp = function()\
  closeApp(\"com.huanmeng.zhanjian2\")\
  mSleep(1000)\
  return runApp(\"com.huanmeng.zhanjian2\")\
end\
\
-- 游戏正在运行\
login.isAppRunning = function()\
  if (isFrontApp(\"com.huanmeng.zhanjian2\") == 1) then\
    return true\
  end\
  return false\
end\
\
-- 游戏不在运行\
login.isAppNotRun = function()\
  if (isFrontApp(\"com.huanmeng.zhanjian2\") == 1) then\
    return false\
  end\
  return true\
end\
\
-- 是否在登录界面\
login.isLoginPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 370, 242, 0x0886ce }, { 1507, 293, 0xd6cec5 },\
    { 1533, 772, 0xcec6bd }, { 390, 759, 0xcecabd },\
    { 477, 679, 0x42caef }, { 1240, 672, 0xef863a },\
    { 443, 405, 0xc5baa4 }, { 539, 397, 0xc5baa4 },\
    { 596, 403, 0xffffff }, { 599, 417, 0xc5baa4 },\
    { 468, 536, 0xc5b6a4 }, { 524, 545, 0xbdb29c },\
    { 552, 531, 0xffffff }, { 607, 535, 0xc5baa4 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击登录\
login.clickLoginBtn = function()\
  tap(1343, 701, 100)\
  return true\
end\
\
-- 是否在选择服务器界面\
login.isSelectServerPage = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 443, 759, 0x0896d6 }, { 480, 829, 0xc5cac5 },\
    { 538, 842, 0x109ad6 }, { 833, 847, 0x1075b5 },\
    { 865, 758, 0x0871ad }, { 1130, 846, 0x1071b5 },\
    { 1232, 758, 0x086dad }, { 1387, 761, 0x086db5 },\
    { 1470, 847, 0x0879bd }, { 1442, 781, 0xc5cac5 },\
    { 668, 907, 0xadeff7 }, { 757, 910, 0xbdf3f7 },\
    { 843, 907, 0xcef7ff }, { 1104, 912, 0x8cd7de },\
    { 1158, 906, 0x9cd7e6 }, { 1248, 906, 0x9cd7de },\
    { 1172, 970, 0x8cbed6 }, { 1129, 1022, 0x6b96c5 },\
    { 800, 1023, 0xa4c6e6 }, { 769, 1001, 0xadceef },\
    { 831, 942, 0xfffbff }, { 869, 966, 0xf7fbff },\
    { 925, 957, 0xffffff }, { 1017, 973, 0xffffff },\
    { 1076, 953, 0xf7fbff }, { 991, 946, 0xfffbff },\
    { 1093, 990, 0xf7fbff },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击登录服务器\
login.clickLoginServerBtn = function()\
  tap(953, 965, 100)\
  return true\
end\
\
return login" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/network.lua"] = { path = "./meta-operation/network.lua", name = "./meta-operation/network.lua", source = "local network = {}\
\
-- 等待网络连接不通对话框\
network.isNetworkFailureModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 518, 242, 0x088ece }, { 1105, 291, 0x0875bd }, { 1408, 293, 0xcecabd }, { 1401, 774, 0xbdb69c },\
    { 518, 777, 0xbdb69c }, { 828, 679, 0x42ceef }, { 1088, 733, 0xa41000 },\
\
    { 564, 451, 0xcecabd }, { 1356, 451, 0xcecabd },\
    { 804, 512, 0xd6cac5 }, { 1116, 512, 0xd6cac5 },\
    { 594, 447, 0xf7fbf7 }, { 743, 515, 0xd6cec5 },\
    { 1176, 513, 0xcecabd }, { 1203, 443, 0xffffff },\
    { 1022, 450, 0xd6cac5 }, { 844, 455, 0xcecabd },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击网络不通 确认\
network.clickNetworkFailureModalOk = function()\
  tap(741, 717, 100)\
  return true\
end\
\
-- 点击网络不通 取消\
network.clickNetworkFailureModalCancel = function()\
  tap(1174, 718, 100)\
  return true\
end\
\
-- 等待检查您的网络对话框\
network.isCheckNetworkModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 521, 250, 0x0079bd }, { 1094, 294, 0x0869ad },\
    { 1407, 300, 0xcecabd }, { 1402, 777, 0xbdb69c },\
    { 512, 771, 0xbdb69c }, { 871, 679, 0x4ad2f7 },\
    { 949, 679, 0x4ad2f7 }, { 1036, 676, 0x4ad2f7 },\
    { 952, 744, 0x0092c5 }, { 926, 708, 0xffffff },\
    { 777, 478, 0xffffff }, { 808, 475, 0x29555a },\
    { 850, 480, 0x214952 }, { 889, 478, 0xf7f7f7 },\
    { 929, 471, 0x10414a }, { 975, 477, 0xeff3f7 },\
    { 1012, 478, 0x103d42 }, { 1050, 479, 0xffffff },\
    { 1075, 478, 0x08353a }, { 1117, 479, 0x31555a },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击检查您的网络对话框 确认\
network.clickCheckNetworkModalOk = function()\
  tap(951, 716, 100)\
  return true\
end\
\
return network" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/home.lua"] = { path = "./meta-operation/home.lua", name = "./meta-operation/home.lua", source = "local home = {}\
\
-- 检测主页\
home.isHome = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 31, 86, 0xcecace },\
    { 190, 9, 0xc5cac5 },\
    { 142, 6, 0x085d94 },\
    { 697, 44, 0x9ca63a },\
    { 1379, 36, 0xfffbf7 },\
    { 81, 85, 0xcecece },\
    { 1855, 64, 0xb54d00 },\
    { 1651, 1027, 0xcecece },\
    { 1435, 443, 0xbd4d00 },\
    { 1132, 532, 0x3abee6 },\
    { 1749, 531, 0x3ac2e6 },\
    { 1430, 862, 0x0092c5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 等待弹出勋章对话框\
home.isMedalModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 524, 248, 0x0881c5 }, { 1098, 293, 0x0869a4 }, { 1407, 295, 0xd6cec5 }, { 1398, 777, 0xbdb69c },\
    { 513, 773, 0xc5baa4 }, { 514, 486, 0xd6cac5 }, { 660, 485, 0xcecabd }, { 708, 484, 0xd6cac5 },\
    { 763, 486, 0xd6cabd }, { 788, 484, 0x5a7173 }, { 812, 484, 0xf7f7f7 }, { 842, 488, 0x214952 },\
    { 873, 488, 0xbdc6ce }, { 895, 486, 0x19454a }, { 933, 489, 0xbdc6c5 }, { 971, 489, 0xced2d6 },\
    { 1015, 488, 0xcecabd }, { 1033, 488, 0x42656b }, { 1071, 485, 0xd6cac5 }, { 1098, 484, 0x4a6973 },\
    { 1122, 481, 0x3a5d63 }, { 1153, 484, 0xf7fbf7 }, { 1171, 470, 0x738e94 }, { 1194, 491, 0x6b868c },\
    { 1224, 485, 0x42656b }, { 1245, 491, 0xffffff },\
    -- 确认\
    { 650, 685, 0x42caef }, { 692, 711, 0xffffff }, { 725, 711, 0x42616b }, { 753, 713, 0x42c2ef },\
    { 807, 699, 0x42c6ef }, { 842, 681, 0x42ceef }, { 832, 739, 0x0092bd }, { 724, 743, 0x008ebd },\
    -- 取消\
    { 1078, 692, 0xce493a }, { 1106, 714, 0xc54131 }, { 1106, 747, 0xa41400 }, { 1206, 732, 0x6b868c },\
    { 1173, 707, 0xce453a }, { 1265, 684, 0xce493a }, { 1264, 733, 0xa41000 }, { 1246, 709, 0xc54131 },\
    { 1209, 710, 0x7b9294 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击勋章取消\
home.clickMedalModalCancelBtn = function()\
  tap(1169, 720, 100)\
end\
-- -- 出征流程\
-- 是否在主页\
\
\
-- 点击出征\
home.clickBattleBtn = function()\
  tap(1440, 347, 100)\
  return true\
end\
\
\
\
-- 检测暂停\
home.isPause = function()\
  return isPause\
end\
\
-- 检测恢复\
home.isNotPause = function()\
  return not isPause\
end\
\
-- 检测新闻窗口\
home.isNewsModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 75, 28, 0x007dbd },\
    { 1140, 69, 0x085d9c },\
    { 1809, 85, 0xd6cec5 },\
    { 1872, 78, 0x9c0c08 },\
    { 75, 521, 0xd1cabf },\
    { 59, 1000, 0xcecabd },\
    { 943, 1002, 0xc5b69c },\
    { 1863, 957, 0xd6cec5 },\
    { 1864, 460, 0xd6cac5 },\
    { 956, 103, 0xcecabd },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击新闻 取消\
home.clickMewsModalClose = function()\
  tap(1876, 50, 100)\
  return true\
end\
\
-- 签到窗口\
home.isSignModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 1142, 118, 0x0865a4 },\
    { 1567, 120, 0x940c08 },\
    { 368, 154, 0xd6cabd },\
    { 426, 207, 0xbdb69c },\
    { 731, 206, 0xc5b69c },\
    { 992, 233, 0xbdb69c },\
    { 1500, 211, 0xbdb69c },\
    { 621, 512, 0xc5b69c },\
    { 1492, 506, 0xc5b29c },\
    { 515, 879, 0xd6cec5 },\
    { 1407, 857, 0xc5bab5 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
home.isSignModalHasReward = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 832, 887, 0xb54d00 },\
    { 943, 879, 0xffffff },\
    { 978, 878, 0xffffff },\
    { 1045, 876, 0xb54d00 },\
    { 883, 894, 0xb54900 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击领取签到奖励\
home.clickSignModalGetReward = function()\
  tap(953, 872, 100)\
  return true\
end\
\
-- 签到确认窗口\
home.isSignConfirmModal = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local list = {\
    { 452, 274, 0x0086c5 },\
    { 1095, 322, 0x0875b5 },\
    { 1480, 326, 0xd6cabd },\
    { 445, 360, 0xd6cabd },\
    { 480, 682, 0xc5b69c },\
    { 1410, 718, 0xc5b6a4 },\
    { 875, 722, 0x009ac5 },\
    { 1043, 713, 0x42c2ef },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- 点击签到确认窗口关闭\
home.clickSignConfirmModalGetReward = function()\
  tap(961, 716, 100)\
  return true\
end\
\
-- 点击领取签到关闭\
home.clickSignModalClose = function()\
  tap(1567, 98, 100)\
  return true\
end\
\
return home" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/utils.lua"] = { path = "./missions/utils.lua", name = "./missions/utils.lua", source = "local eq = require '../lib/event-query'\
local co = require '../lib/co'\
local Promise = require '../lib/promise'\
local gettimeFunc = require '../lib/get-time'\
local c = coroutine\
\
local combineListener = function(target, ...)\
  local sources = { ... }\
  if (type(target) ~= 'table') then target = {} end\
  for k = 1, #sources do\
    local source = sources[k]\
    for key = 1, #source do\
      local value = source[key]\
      table.insert(target, value)\
    end\
  end\
  local targetReverse = table.reverse(target)\
  local resultIndex = {}\
  local result = {}\
  for key = 1, #targetReverse do\
    local value = targetReverse[key]\
    if (not resultIndex[value[3]]) then\
      resultIndex[value[3]] = value\
      table.insert(result, value)\
    end\
  end\
\
  local resultReverse = table.reverse(result)\
  return resultReverse\
end\
\
local sleepPromise = function(ms)\
  return Promise.new(function(resolve)\
    eq.setTimeout(resolve, ms)\
  end)\
end\
\
local setScreenListeners = function(theArr, ...)\
\
  if ((type(theArr) ~= 'table') or (#theArr == 0)) then\
    return Promise.resolve(nil)\
  end\
\
  theArr = table.merge(theArr, ...)\
  for key = 1, #theArr do\
    if not theArr[2] then\
      error('listener ' .. theArr[1] .. ' is nil.')\
      return\
    end\
  end\
\
  local theArrUnique = table.uniqueLast(theArr, 2)\
  for key = 1, #theArrUnique do\
    local value = theArrUnique[key]\
    value.isOnce = true\
  end\
  return co(c.create(function()\
    local newArr = {}\
    local ids = {}\
    local done = false\
    for key = 1, #theArrUnique do\
      local listenerEvent = theArrUnique[key]\
\
      if ((type(listenerEvent[3]) == 'number') and (listenerEvent[3] > 0)) then\
        table.insert(newArr, Promise.new(function(resolve)\
          local id = eq.setTimeout(resolve, listenerEvent[3])\
          table.insert(ids, id)\
        end).andThen(function()\
          if (not done) then\
            return Promise.new(function(resolve)\
              local id = eq.setScreenListener(listenerEvent[2], function() resolve(listenerEvent[1]) end)\
              table.insert(ids, id)\
            end)\
          end\
        end))\
      else\
        table.insert(newArr, co(c.create(function()\
          return Promise.new(function(resolve)\
            local id = eq.setScreenListener(listenerEvent[2], function() resolve(listenerEvent[1]) end)\
            table.insert(ids, id)\
          end)\
        end)))\
      end\
    end\
    local res = c.yield(Promise.race(newArr))\
    done = true\
    for key = 1, #ids do\
      eq.clearScreenListener(ids[key])\
      eq.clearTimeout(ids[key])\
    end\
    return res\
  end))\
end\
\
local makeAction = function(action)\
  if (type(action) == 'table') then return action end\
  return { type = action }\
end\
\
return {\
  combineListener = combineListener,\
  sleepPromise = sleepPromise,\
  setScreenListeners = setScreenListeners,\
  makeAction = makeAction,\
}" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./lib/json.lua"] = { path = "./lib/json.lua", name = "./lib/json.lua", source = "--\
-- json.lua\
--\
-- Copyright (c) 2018 rxi\
--\
-- Permission is hereby granted, free of charge, to any person obtaining a copy of\
-- this software and associated documentation files (the \"Software\"), to deal in\
-- the Software without restriction, including without limitation the rights to\
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies\
-- of the Software, and to permit persons to whom the Software is furnished to do\
-- so, subject to the following conditions:\
--\
-- The above copyright notice and this permission notice shall be included in all\
-- copies or substantial portions of the Software.\
--\
-- THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\
-- SOFTWARE.\
--\
\
local json = { _version = \"0.1.1\" }\
\
-------------------------------------------------------------------------------\
-- Encode\
-------------------------------------------------------------------------------\
\
local encode\
\
local escape_char_map = {\
  [ \"\\\\\" ] = \"\\\\\\\\\",\
  [ \"\\\"\" ] = \"\\\\\\\"\",\
  [ \"\\b\" ] = \"\\\\b\",\
  [ \"\\f\" ] = \"\\\\f\",\
  [ \"\\n\" ] = \"\\\\n\",\
  [ \"\\r\" ] = \"\\\\r\",\
  [ \"\\t\" ] = \"\\\\t\",\
}\
\
local escape_char_map_inv = { [ \"\\\\/\" ] = \"/\" }\
for k, v in pairs(escape_char_map) do\
  escape_char_map_inv[v] = k\
end\
\
\
local function escape_char(c)\
  return escape_char_map[c] or string.format(\"\\\\u%04x\", c:byte())\
end\
\
\
local function encode_nil(val)\
  return \"null\"\
end\
\
\
local function encode_table(val, stack)\
  local res = {}\
  stack = stack or {}\
\
  -- Circular reference?\
  if stack[val] then error(\"circular reference\") end\
\
  stack[val] = true\
\
  if val[1] ~= nil or next(val) == nil then\
    -- Treat as array -- check keys are valid and it is not sparse\
    local n = 0\
    for k in pairs(val) do\
      if type(k) ~= \"number\" then\
        error(\"invalid table: mixed or invalid key types\")\
      end\
      n = n + 1\
    end\
    if n ~= #val then\
      error(\"invalid table: sparse array\")\
    end\
    -- Encode\
    for i, v in ipairs(val) do\
      table.insert(res, encode(v, stack))\
    end\
    stack[val] = nil\
    return \"[\" .. table.concat(res, \",\") .. \"]\"\
\
  else\
    -- Treat as an object\
    for k, v in pairs(val) do\
      if type(k) ~= \"string\" then\
        error(\"invalid table: mixed or invalid key types\")\
      end\
      table.insert(res, encode(k, stack) .. \":\" .. encode(v, stack))\
    end\
    stack[val] = nil\
    return \"{\" .. table.concat(res, \",\") .. \"}\"\
  end\
end\
\
\
local function encode_string(val)\
  return '\"' .. val:gsub('[%z\\1-\\31\\\\\"]', escape_char) .. '\"'\
end\
\
\
local function encode_number(val)\
  -- Check for NaN, -inf and inf\
  if val ~= val or val <= -math.huge or val >= math.huge then\
    error(\"unexpected number value '\" .. tostring(val) .. \"'\")\
  end\
  return string.format(\"%.14g\", val)\
end\
\
\
local type_func_map = {\
  [ \"nil\"     ] = encode_nil,\
  [ \"table\"   ] = encode_table,\
  [ \"string\"  ] = encode_string,\
  [ \"number\"  ] = encode_number,\
  [ \"boolean\" ] = tostring,\
}\
\
\
encode = function(val, stack)\
  local t = type(val)\
  local f = type_func_map[t]\
  if f then\
    return f(val, stack)\
  end\
  error(\"unexpected type '\" .. t .. \"'\")\
end\
\
\
function json.encode(val)\
  return ( encode(val) )\
end\
\
\
-------------------------------------------------------------------------------\
-- Decode\
-------------------------------------------------------------------------------\
\
local parse\
\
local function create_set(...)\
  local res = {}\
  for i = 1, select(\"#\", ...) do\
    res[ select(i, ...) ] = true\
  end\
  return res\
end\
\
local space_chars   = create_set(\" \", \"\\t\", \"\\r\", \"\\n\")\
local delim_chars   = create_set(\" \", \"\\t\", \"\\r\", \"\\n\", \"]\", \"}\", \",\")\
local escape_chars  = create_set(\"\\\\\", \"/\", '\"', \"b\", \"f\", \"n\", \"r\", \"t\", \"u\")\
local literals      = create_set(\"true\", \"false\", \"null\")\
\
local literal_map = {\
  [ \"true\"  ] = true,\
  [ \"false\" ] = false,\
  [ \"null\"  ] = nil,\
}\
\
\
local function next_char(str, idx, set, negate)\
  for i = idx, #str do\
    if set[str:sub(i, i)] ~= negate then\
      return i\
    end\
  end\
  return #str + 1\
end\
\
\
local function decode_error(str, idx, msg)\
  local line_count = 1\
  local col_count = 1\
  for i = 1, idx - 1 do\
    col_count = col_count + 1\
    if str:sub(i, i) == \"\\n\" then\
      line_count = line_count + 1\
      col_count = 1\
    end\
  end\
  error( string.format(\"%s at line %d col %d\", msg, line_count, col_count) )\
end\
\
\
local function codepoint_to_utf8(n)\
  -- http://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=iws-appendixa\
  local f = math.floor\
  if n <= 0x7f then\
    return string.char(n)\
  elseif n <= 0x7ff then\
    return string.char(f(n / 64) + 192, n % 64 + 128)\
  elseif n <= 0xffff then\
    return string.char(f(n / 4096) + 224, f(n % 4096 / 64) + 128, n % 64 + 128)\
  elseif n <= 0x10ffff then\
    return string.char(f(n / 262144) + 240, f(n % 262144 / 4096) + 128,\
                       f(n % 4096 / 64) + 128, n % 64 + 128)\
  end\
  error( string.format(\"invalid unicode codepoint '%x'\", n) )\
end\
\
\
local function parse_unicode_escape(s)\
  local n1 = tonumber( s:sub(3, 6),  16 )\
  local n2 = tonumber( s:sub(9, 12), 16 )\
  -- Surrogate pair?\
  if n2 then\
    return codepoint_to_utf8((n1 - 0xd800) * 0x400 + (n2 - 0xdc00) + 0x10000)\
  else\
    return codepoint_to_utf8(n1)\
  end\
end\
\
\
local function parse_string(str, i)\
  local has_unicode_escape = false\
  local has_surrogate_escape = false\
  local has_escape = false\
  local last\
  for j = i + 1, #str do\
    local x = str:byte(j)\
\
    if x < 32 then\
      decode_error(str, j, \"control character in string\")\
    end\
\
    if last == 92 then -- \"\\\\\" (escape char)\
      if x == 117 then -- \"u\" (unicode escape sequence)\
        local hex = str:sub(j + 1, j + 5)\
        if not hex:find(\"%x%x%x%x\") then\
          decode_error(str, j, \"invalid unicode escape in string\")\
        end\
        if hex:find(\"^[dD][89aAbB]\") then\
          has_surrogate_escape = true\
        else\
          has_unicode_escape = true\
        end\
      else\
        local c = string.char(x)\
        if not escape_chars[c] then\
          decode_error(str, j, \"invalid escape char '\" .. c .. \"' in string\")\
        end\
        has_escape = true\
      end\
      last = nil\
\
    elseif x == 34 then -- '\"' (end of string)\
      local s = str:sub(i + 1, j - 1)\
      if has_surrogate_escape then\
        s = s:gsub(\"\\\\u[dD][89aAbB]..\\\\u....\", parse_unicode_escape)\
      end\
      if has_unicode_escape then\
        s = s:gsub(\"\\\\u....\", parse_unicode_escape)\
      end\
      if has_escape then\
        s = s:gsub(\"\\\\.\", escape_char_map_inv)\
      end\
      return s, j + 1\
\
    else\
      last = x\
    end\
  end\
  decode_error(str, i, \"expected closing quote for string\")\
end\
\
\
local function parse_number(str, i)\
  local x = next_char(str, i, delim_chars)\
  local s = str:sub(i, x - 1)\
  local n = tonumber(s)\
  if not n then\
    decode_error(str, i, \"invalid number '\" .. s .. \"'\")\
  end\
  return n, x\
end\
\
\
local function parse_literal(str, i)\
  local x = next_char(str, i, delim_chars)\
  local word = str:sub(i, x - 1)\
  if not literals[word] then\
    decode_error(str, i, \"invalid literal '\" .. word .. \"'\")\
  end\
  return literal_map[word], x\
end\
\
\
local function parse_array(str, i)\
  local res = {}\
  local n = 1\
  i = i + 1\
  while 1 do\
    local x\
    i = next_char(str, i, space_chars, true)\
    -- Empty / end of array?\
    if str:sub(i, i) == \"]\" then\
      i = i + 1\
      break\
    end\
    -- Read token\
    x, i = parse(str, i)\
    res[n] = x\
    n = n + 1\
    -- Next token\
    i = next_char(str, i, space_chars, true)\
    local chr = str:sub(i, i)\
    i = i + 1\
    if chr == \"]\" then break end\
    if chr ~= \",\" then decode_error(str, i, \"expected ']' or ','\") end\
  end\
  return res, i\
end\
\
\
local function parse_object(str, i)\
  local res = {}\
  i = i + 1\
  while 1 do\
    local key, val\
    i = next_char(str, i, space_chars, true)\
    -- Empty / end of object?\
    if str:sub(i, i) == \"}\" then\
      i = i + 1\
      break\
    end\
    -- Read key\
    if str:sub(i, i) ~= '\"' then\
      decode_error(str, i, \"expected string for key\")\
    end\
    key, i = parse(str, i)\
    -- Read ':' delimiter\
    i = next_char(str, i, space_chars, true)\
    if str:sub(i, i) ~= \":\" then\
      decode_error(str, i, \"expected ':' after key\")\
    end\
    i = next_char(str, i + 1, space_chars, true)\
    -- Read value\
    val, i = parse(str, i)\
    -- Set\
    res[key] = val\
    -- Next token\
    i = next_char(str, i, space_chars, true)\
    local chr = str:sub(i, i)\
    i = i + 1\
    if chr == \"}\" then break end\
    if chr ~= \",\" then decode_error(str, i, \"expected '}' or ','\") end\
  end\
  return res, i\
end\
\
\
local char_func_map = {\
  [ '\"' ] = parse_string,\
  [ \"0\" ] = parse_number,\
  [ \"1\" ] = parse_number,\
  [ \"2\" ] = parse_number,\
  [ \"3\" ] = parse_number,\
  [ \"4\" ] = parse_number,\
  [ \"5\" ] = parse_number,\
  [ \"6\" ] = parse_number,\
  [ \"7\" ] = parse_number,\
  [ \"8\" ] = parse_number,\
  [ \"9\" ] = parse_number,\
  [ \"-\" ] = parse_number,\
  [ \"t\" ] = parse_literal,\
  [ \"f\" ] = parse_literal,\
  [ \"n\" ] = parse_literal,\
  [ \"[\" ] = parse_array,\
  [ \"{\" ] = parse_object,\
}\
\
\
parse = function(str, idx)\
  local chr = str:sub(idx, idx)\
  local f = char_func_map[chr]\
  if f then\
    return f(str, idx)\
  end\
  decode_error(str, idx, \"unexpected character '\" .. chr .. \"'\")\
end\
\
\
function json.decode(str)\
  if type(str) ~= \"string\" then\
    error(\"expected argument of type string, got \" .. type(str))\
  end\
  local res, idx = parse(str, next_char(str, 1, space_chars, true))\
  idx = next_char(str, idx, space_chars, true)\
  if idx <= #str then\
    decode_error(str, idx, \"trailing garbage\")\
  end\
  return res\
end\
\
\
return json\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/campaign.lua"] = { path = "./missions/campaign.lua", name = "./missions/campaign.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
local setScreenListeners = (require './utils').setScreenListeners\
local getHomeListener = (require './common-listener').getHomeListener\
local getLoginListener = (require './common-listener').getLoginListener\
local getComListener = (require './common-listener').getComListener\
local store = require '../store'\
\
local sendToPushBullet = require '../utils/ajax-sent-to-push-bullet'\
\
local moBattle = require '../meta-operation/battle'\
local moHome = require '../meta-operation/home'\
local moCampaign = require '../meta-operation/campaign'\
\
local o = {\
  home = moHome,\
  battle = moBattle,\
  campaign = moCampaign,\
}\
\
store.campaign = store.campaign or {\
  nextStartTime = os.time()\
}\
\
local campaign = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'CAMPAIGN_START') then\
\
      -- 没有到检查战役的时间\
      if store.campaign.nextStartTime > os.time() then\
        stepLabel.setStepLabelContent('7-1.跳过战役，下次检查时间：' .. os.date(\"%Y-%m-%d %H:%M:%S\", store.campaign.nextStartTime))\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
          { '', o.home.isHome }\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('7-2.等待home')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'CAMPAIGN_INIT', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_INIT') then\
\
      store.campaign.quickSupplyCount = 0\
      store.campaign.quickRepairCount = 0\
      store.campaign.quickRepairSingleLastShip = 0\
      store.campaign.quickRepairSingleCount = 0\
      store.campaign.battleNum = 1\
      store.campaign.HPIsSafe = true\
      -- 出征后就应该需要维修\
      store.repair.nextRepairStartTime = os.time()\
\
      stepLabel.setStepLabelContent('7-3.点击出征')\
      o.home.clickBattleBtn()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_INIT', o.home.isHome, 2000 },\
        { 'CAMPAIGN_BATTLE_PAGE', o.campaign.isBattlePage },\
        { 'CAMPAIGN_CAMPAIGN_PAGE', o.campaign.isCampaignPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_BATTLE_PAGE') then\
\
      stepLabel.setStepLabelContent('7-4.点击战役')\
      o.campaign.clickCampaignBtn()\
      stepLabel.setStepLabelContent('7-5.等待战役页面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_INIT', o.home.isHome },\
        { 'CAMPAIGN_BATTLE_PAGE', o.campaign.isBattlePage, 2000 },\
        { 'CAMPAIGN_CAMPAIGN_PAGE', o.campaign.isCampaignPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_CAMPAIGN_PAGE') then\
\
      c.yield(sleepPromise(100))\
      stepLabel.setStepLabelContent('7-6.移动到战役' .. settings.campaignChapter)\
      o.campaign.moveToCampaignMission(settings.campaignChapter)\
      c.yield(sleepPromise(300))\
      stepLabel.setStepLabelContent('7-7.点击战役')\
      o.campaign.clickCampainReadyBtn(settings.campaignDifficulty)\
      stepLabel.setStepLabelContent('7-8.等待战役准备界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_BATTLE_PAGE', o.campaign.isBattlePage, 2000 },\
        { 'CAMPAIGN_CAMPAIGN_PAGE', o.campaign.isCampaignPage, 2000 },\
        { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE') then\
\
      if ((store.campaign.quickSupplyCount <= 0) and (store.campaign.quickRepairCount <= 0)) then\
        stepLabel.setStepLabelContent('7-9.检测所有状态')\
        c.yield(sleepPromise(1000))\
        local res = o.campaign.isReadyBattlePageShipStatusAllRight()\
        if (not res) then\
          stepLabel.setStepLabelContent('7-10.状态不正常')\
          o.campaign.clickReadyBattlePageQuickSupplyBtn()\
          stepLabel.setStepLabelContent('7-11.等待快速补给界面')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage, 2000 },\
            { 'CAMPAIGN_QUICK_SUPPLY_MODAL', o.campaign.isQuickSupplyModal },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('7-12.状态正常')\
          store.campaign.quickSupplyCount = store.campaign.quickSupplyCount + 1\
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE' }\
        end\
      elseif (store.campaign.quickRepairCount <= 0) then\
        stepLabel.setStepLabelContent('7-13.检测血量是否安全')\
        c.yield(sleepPromise(1000))\
        local res = o.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))\
        if (res) then\
          store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1\
          stepLabel.setStepLabelContent('7-14.血量安全，继续')\
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }\
        else\
          if (settings.campaignQuickRepair > 0) then\
            stepLabel.setStepLabelContent('7-15.血量不安全，点击快修')\
            o.campaign.clickQuickRepairBtn()\
            stepLabel.setStepLabelContent('7-16.等待快修界面')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage, 2000 },\
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          else\
            stepLabel.setStepLabelContent('7-17.血量不安全，返回')\
            return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }\
          end\
        end\
      else\
        stepLabel.setStepLabelContent('7-18.再次检测血量是否安全')\
        c.yield(sleepPromise(1000))\
        -- 不允许大破出征\
        local res = o.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('7-19.血量安全，继续')\
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('7-20.血量不安全，返回')\
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }\
        end\
      end\
\
    elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL') then\
\
      stepLabel.setStepLabelContent('7-22.快速补给界面点击确定')\
      o.campaign.clickReadyBattlePageQuickSupplyModalOkBtn()\
      stepLabel.setStepLabelContent('7-23.等待出征准备界面')\
      store.campaign.quickSupplyCount = store.campaign.quickSupplyCount + 1\
      if (store.campaign.quickSupplyCount < 3) then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
          { 'CAMPAIGN_QUICK_SUPPLY_MODAL', o.campaign.isQuickSupplyModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('7-24.资源数量不足')\
        return { type = 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE' }\
      end\
\
    elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('7-25.点击快速补给关闭')\
      c.yield(sleepPromise(100))\
      o.campaign.clickQuickSupplyModalCloseBtn()\
      stepLabel.setStepLabelContent('7-26.等待出征准备界面')\
      c.yield(sleepPromise(300))\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
        { 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE', o.campaign.isQuickSupplyModal, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL') then\
\
      if (settings.campaignQuickRepair == 3) then\
        stepLabel.setStepLabelContent('7-27.点击快速修理确定')\
        o.campaign.clickQuickRepairModalOkBtn()\
        store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1\
        stepLabel.setStepLabelContent('7-28.等待出征准备界面')\
        if (store.campaign.quickRepairCount < 3) then\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
            { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('7-29.快修数量不足')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.campaignQuickRepair == 2) then\
        -- 中破或大破快修\
        stepLabel.setStepLabelContent('7-30.寻找中破或大破的船')\
        c.yield(sleepPromise(1000))\
        local res = o.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)\
        if (#res > 0) then\
          if ((store.campaign.quickRepairSingleLastShip ~= res[1]) or (store.campaign.quickRepairSingleCount < 3)) then\
            store.campaign.quickRepairSingleLastShip = res[1]\
            store.campaign.quickRepairSingleCount = store.campaign.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('7-31.中破或大破:' .. table.concat(res, ','))\
            o.campaign.clickQuickRepairModalSingleShip(res[1])\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal, 500 },\
            }))\
            return makeAction(newstateTypes)\
          else\
            store.campaign.quickRepairSingleLastShip = 0\
            store.campaign.quickRepairSingleCount = 0\
            store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1\
            stepLabel.setStepLabelContent('7-32.快修数量不足')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('7-33.修理完成')\
          store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.campaignQuickRepair == 1) then\
        -- 大破快修\
        stepLabel.setStepLabelContent('7-34.寻找大破的船')\
\
        c.yield(sleepPromise(500))\
        local res = o.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)\
        if (#res > 0) then\
          if ((store.campaign.quickRepairSingleLastShip ~= res[1]) or (store.campaign.quickRepairSingleCount < 3)) then\
            store.campaign.quickRepairSingleLastShip = res[1]\
            store.campaign.quickRepairSingleCount = store.campaign.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('7-35.大破:' .. table.concat(res, ','))\
            o.campaign.clickQuickRepairModalSingleShip(res[1])\
            c.yield(sleepPromise(500))\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          else\
            store.campaign.quickRepairSingleLastShip = 0\
            store.campaign.quickRepairSingleCount = 0\
            store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1\
            stepLabel.setStepLabelContent('7-36.快修数量不足')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('7-37.修理完成')\
          store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
      end\
\
    elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('7-38.点击快速修理关闭')\
      c.yield(sleepPromise(500))\
      o.campaign.clickQuickRepairModalCloseBtn()\
      c.yield(sleepPromise(300))\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal, 2000 },\
        { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO') then\
\
      stepLabel.setStepLabelContent('7-39.出征准备界面出征开始')\
      c.yield(sleepPromise(100))\
      o.campaign.clickBattleStartBtn()\
      -- 如果没有开始说明无法战役\
\
      return makeAction('CAMPAIGN_GO_A_EXERCISE')\
\
    elseif (action.type == 'CAMPAIGN_GO_A_EXERCISE') then\
\
      stepLabel.setStepLabelContent('7-40.等待出征准备界面，...')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO', o.campaign.isReadyBattlePage, 3000 },\
        { 'CAMPAIGN_START_PAGE', o.campaign.isBattleStartPage },\
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage },\
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal },\
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },\
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', o.campaign.isVictoryPage2 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_START_PAGE') then\
\
      stepLabel.setStepLabelContent('7-41.开始面板，点击开始')\
      c.yield(sleepPromise(100))\
      o.campaign.clickBattleStartModalStartBtn()\
      stepLabel.setStepLabelContent('7-42.等待阵型面板，追击面板，胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_GO_A_EXERCISE', o.campaign.isReadyBattlePage },\
        { 'CAMPAIGN_START_PAGE', o.campaign.isBattleStartPage, 2000 },\
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage },\
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal },\
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_FORMATION_PAGE') then\
\
      stepLabel.setStepLabelContent('7-43.阵型面板')\
      c.yield(sleepPromise(100))\
      o.campaign.clickFormationPageStartBtn(settings.exerciseFormation)\
      stepLabel.setStepLabelContent('7-44.等待追击面板，胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_START_PAGE', o.campaign.isBattleStartPage },\
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage, 2000 },\
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal },\
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_PURSUE_MODAL') then\
\
      stepLabel.setStepLabelContent('7-45.追击面板')\
      c.yield(sleepPromise(100))\
      if (settings.exercisePursue) then\
        stepLabel.setStepLabelContent('7-46.追击')\
        o.campaign.clickPursueModalOk()\
      else\
        stepLabel.setStepLabelContent('7-47.放弃追击')\
        o.campaign.clickPursuePageCancel()\
      end\
      stepLabel.setStepLabelContent('7-48.等待胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage },\
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal, 2000 },\
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },\
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', o.campaign.isVictoryPage2 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_VICTORY_PAGE') then\
\
      stepLabel.setStepLabelContent('7-49.点击胜利继续')\
      o.campaign.clickVictoryPageContinueBtn()\
      stepLabel.setStepLabelContent('7-50.等待胜利继续界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage },\
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal },\
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage, 2000 },\
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', o.campaign.isVictoryPage2 },\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage },\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_VICTORY_NEXT_PAGE') then\
\
      stepLabel.setStepLabelContent('7-51.点击胜利继续')\
      o.campaign.clickVictoryPageContinueBtn2()\
      stepLabel.setStepLabelContent('7-52.等待演习界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },\
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', o.campaign.isVictoryPage2, 2000 },\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage },\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO') then\
\
      -- 提示不能战役\
      if (settings.campaignAlertWhenCantBattle) then\
        if settings.alertUseVibrate then\
          vibrator(500)\
          mSleep(500)\
          vibrator(500)\
        end\
        if settings.alertUsePushbullet then\
          local datestr = os.date('%Y-%m-%d %X')\
          sendToPushBullet(settings.pushbulletsToken,\
            datestr .. ' ' .. settings.pushbulletNickname,\
            datestr .. '  ' .. getDeviceModel() .. '  ' .. '战役失败')\
        end\
      end\
\
      -- 设置下一次检查战役的时间\
      store.campaign.nextStartTime = os.time() + settings.campaignInterval\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', o.campaign.isReadyBattlePage },\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage },\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME') then\
\
      o.campaign.clickReadyBattlePageBackBtn()\
      stepLabel.setStepLabelContent(\"7-53.等待出征界面\")\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', o.campaign.isReadyBattlePage, 2000 },\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage },\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'CAMPAIGN_BATTLE_PAGE2') then\
\
      stepLabel.setStepLabelContent('7-54.点击回港')\
      o.campaign.clickBackToHomeBtn()\
      stepLabel.setStepLabelContent('7-55.等待home')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage, 2000 },\
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage, 2000 },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
    end\
    return nil\
  end))\
end\
\
return campaign" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/exercise.lua"] = { path = "./missions/exercise.lua", name = "./missions/exercise.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
local setScreenListeners = (require './utils').setScreenListeners\
local commonListenerFactory = require './common-listener'\
\
local getHomeListener = (require './common-listener').getHomeListener\
local getLoginListener = (require './common-listener').getLoginListener\
local getComListener = (require './common-listener').getComListener\
local store = require '../store'\
\
local moHome = require '../meta-operation/home'\
local moExercise = require '../meta-operation/exercise'\
\
local o = {\
  home = moHome,\
  exercise = moExercise,\
}\
\
store.exercise = store.exercise or {\
  nextStartTime = os.time(),\
}\
\
local exerciseOnce = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'EXERCISE_START') then\
\
      -- 没有到检查演习的时间\
      if store.exercise.nextStartTime > os.time() then\
        stepLabel.setStepLabelContent('6-1.跳过演习，下次检查时间：' .. os.date(\"%Y-%m-%d %H:%M:%S\", store.exercise.nextStartTime))\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { '', o.home.isHome, 1000 }\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('6-2.等待home')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'EXERCISE_INIT', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_INIT') then\
\
      store.exercise.quickSupplyCount = 0\
      store.exercise.quickRepairCount = 0\
      store.exercise.quickRepairSingleLastShip = 0\
      store.exercise.quickRepairSingleCount = 0\
      store.exercise.battleNum = 1\
      store.exercise.HPIsSafe = true\
\
      stepLabel.setStepLabelContent('6-3.点击出征')\
      o.home.clickBattleBtn()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_INIT', o.home.isHome, 2000 },\
        { 'EXERCISE_BATTLE_PAGE', o.exercise.isBattlePage },\
        { 'EXERCISE_EXERCISE_PAGE', o.exercise.isExercisePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_BATTLE_PAGE') then\
\
      stepLabel.setStepLabelContent('6-4.点击演习')\
      o.exercise.clickExerciseBtn()\
      stepLabel.setStepLabelContent('6-5.等待演习页面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_INIT', o.home.isHome },\
        { 'EXERCISE_BATTLE_PAGE', o.exercise.isBattlePage, 2000 },\
        { 'EXERCISE_EXERCISE_PAGE', o.exercise.isExercisePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_EXERCISE_PAGE') then\
\
      stepLabel.setStepLabelContent('6-6.寻找演习对手')\
      local res, exeList = o.exercise.isExercisePageHaveExercise()\
      local nBtn = exeList[1]\
      if (type(nBtn) ~= 'nil') then\
        stepLabel.setStepLabelContent('6-7.发现演习对手' .. nBtn)\
        o.exercise.clickToNExerciseBtn(nBtn)\
        stepLabel.setStepLabelContent('6-8.等待出征准备界面')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXERCISE_BATTLE_PAGE', o.exercise.isBattlePage, 2000 },\
          { 'EXERCISE_EXERCISE_PAGE', o.exercise.isExercisePage, 2000 },\
          { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('6-9.没有可以挑战的人')\
\
        -- 设置下一次演习检查时间\
        store.exercise.nextStartTime = os.time() + settings.exerciseInterval\
\
        return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }\
      end\
\
    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE') then\
\
      if ((store.exercise.quickSupplyCount <= 0) and (store.exercise.quickRepairCount <= 0)) then\
        stepLabel.setStepLabelContent('6-10.选择舰队:' .. settings.exerciseFleet)\
        o.exercise.selectFleet(settings.exerciseFleet)\
        stepLabel.setStepLabelContent('6-11检测所有状态')\
        c.yield(sleepPromise(1000))\
        local res = o.exercise.isReadyBattlePageShipStatusAllRight()\
        if (res) then\
          stepLabel.setStepLabelContent('6-12.状态正常')\
          store.exercise.quickSupplyCount = 1\
          store.exercise.quickRepairCount = 1\
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('6-13.状态不正常')\
          o.exercise.clickReadyBattlePageQuickSupplyBtn()\
          stepLabel.setStepLabelContent('6-14.等待快速补给界面')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage, 2000 },\
            { 'EXERCISE_QUICK_SUPPLY_MODAL', o.exercise.isQuickSupplyModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
      elseif (store.exercise.quickRepairCount <= 0) then\
        stepLabel.setStepLabelContent('6-15.检测血量是否安全')\
        c.yield(sleepPromise(1000))\
        local res = o.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('6-16.血量安全')\
          store.exercise.quickRepairCount = 1\
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          if (settings.exerciseQuickRepair > 0) then\
            stepLabel.setStepLabelContent('6-17.血量不安全，点击快修')\
            o.exercise.clickQuickRepairBtn()\
            stepLabel.setStepLabelContent('6-18.等待快修界面')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage, 2000 },\
              { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          else\
            stepLabel.setStepLabelContent('6-19.血量不安全，返回')\
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }\
          end\
        end\
      else\
        stepLabel.setStepLabelContent('6-20.再次检测血量是否安全')\
        c.yield(sleepPromise(1000))\
        -- 不允许大破出征\
        local res = o.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('6-21.血量安全，继续')\
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('6-22.血量不安全，返回')\
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }\
        end\
      end\
\
    elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL') then\
\
      stepLabel.setStepLabelContent('6-23快速补给界面点击确定')\
      o.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()\
      stepLabel.setStepLabelContent('6-24.等待出征准备界面')\
      store.exercise.quickSupplyCount = store.exercise.quickSupplyCount + 1\
      if (store.exercise.quickSupplyCount < 3) then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
          { 'EXERCISE_QUICK_SUPPLY_MODAL', o.exercise.isQuickSupplyModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('6-25.资源数量不足')\
        return { type = 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE' }\
      end\
\
    elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('6-26.点击快速补给关闭')\
      c.yield(sleepPromise(100))\
      o.exercise.clickQuickSupplyModalCloseBtn()\
      stepLabel.setStepLabelContent('6-27.等待出征准备界面')\
      c.yield(sleepPromise(300))\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
        { 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE', o.exercise.isQuickSupplyModal, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL') then\
\
      if (settings.exerciseQuickRepair == 3) then\
        -- 不满血则快修\
        stepLabel.setStepLabelContent('6-28.点击快速修理确定')\
        c.yield(sleepPromise(500))\
        o.exercise.clickQuickRepairModalOkBtn()\
        store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1\
        stepLabel.setStepLabelContent('6-29.等待出征准备界面')\
        if (store.exercise.quickRepairCount < 3) then\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
            { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('6-30.快速修理数量不足')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickSupplyModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.exerciseQuickRepair == 2) then\
        -- 中破或大破快修\
        stepLabel.setStepLabelContent('6-31.寻找中破或大破的船')\
        c.yield(sleepPromise(1000))\
        local res = o.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)\
        if (#res > 0) then\
\
          if ((store.exercise.quickRepairSingleLastShip ~= res[1]) or (store.exercise.quickRepairSingleCount < 3)) then\
            store.exercise.quickRepairSingleLastShip = res[1]\
            store.exercise.quickRepairSingleCount = store.exercise.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('6-32.中破或大破:' .. table.concat(res, ','))\
            o.exercise.clickQuickRepairModalSingleShip(res[1])\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
              { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal, 500 },\
            }))\
            return makeAction(newstateTypes)\
          else\
            store.exercise.quickRepairSingleLastShip = 0\
            store.exercise.quickRepairSingleCount = 0\
            store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1\
            stepLabel.setStepLabelContent('6-33快修数量不足')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
              { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickSupplyModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('6-34.修理完成')\
          store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.exerciseQuickRepair == 1) then\
        -- 大破快修\
        stepLabel.setStepLabelContent('6-35.寻找大破的船')\
        c.yield(sleepPromise(1000))\
        local res = o.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)\
        if (#res > 0) then\
          if ((store.exercise.quickRepairSingleLastShip ~= res[1]) or (store.exercise.quickRepairSingleCount < 3)) then\
            store.exercise.quickRepairSingleLastShip = res[1]\
            store.exercise.quickRepairSingleCount = store.exercise.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('6-36.大破:' .. table.concat(res, ','))\
            o.exercise.clickQuickRepairModalSingleShip(res[1])\
            c.yield(sleepPromise(500))\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
              { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          else\
            store.exercise.quickRepairSingleLastShip = 0\
            store.exercise.quickRepairSingleCount = 0\
            store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1\
            stepLabel.setStepLabelContent('6-37.快修数量不足')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
              { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickSupplyModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('6-38修理完成')\
          store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
      end\
\
    elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('6-39点击快速修理关闭')\
      c.yield(sleepPromise(500))\
      o.exercise.clickQuickRepairModalCloseBtn()\
      c.yield(sleepPromise(300))\
      stepLabel.setStepLabelContent('6-40.等待出征准备界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickRepairModal, 2000 },\
        { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO') then\
\
      stepLabel.setStepLabelContent('6-41.检测舰队是否可以出征')\
      c.yield(sleepPromise(300))\
      local fleetCanBattle = o.exercise.isFleetsCanBattle()\
      if (not fleetCanBattle) then\
\
        stepLabel.setStepLabelContent('6-42.舰队无法战斗')\
        return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }\
      else\
        return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }\
      end\
\
    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CAN_GO') then\
\
      stepLabel.setStepLabelContent('6-43.出征准备界面出征开始')\
      c.yield(sleepPromise(100))\
      o.exercise.clickBattleStartBtn()\
      return { type = 'EXERCISE_GO_A_EXERCISE' }\
\
    elseif (action.type == 'EXERCISE_GO_A_EXERCISE') then\
\
      stepLabel.setStepLabelContent('6-44.等待出征准备界面，...')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_GO_A_EXERCISE', o.exercise.isReadyBattlePage, 2000 },\
        { 'EXERCISE_START_PAGE', o.exercise.isBattleStartPage },\
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage },\
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal },\
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },\
        { 'EXERCISE_VICTORY_NEXT_PAGE', o.exercise.isVictoryPage2 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_START_PAGE') then\
\
      stepLabel.setStepLabelContent('6-45.开始面板，点击开始')\
      c.yield(sleepPromise(100))\
      o.exercise.clickBattleStartModalStartBtn()\
      stepLabel.setStepLabelContent('6-46等待阵型面板，追击面板，胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_GO_A_EXERCISE', o.exercise.isReadyBattlePage },\
        { 'EXERCISE_START_PAGE', o.exercise.isBattleStartPage, 2000 },\
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage },\
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal },\
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_FORMATION_PAGE') then\
\
      stepLabel.setStepLabelContent('6-47.阵型面板')\
      c.yield(sleepPromise(100))\
      o.exercise.clickFormationPageStartBtn(settings.exerciseFormation)\
      stepLabel.setStepLabelContent('6-48.等待追击面板，胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_START_PAGE', o.exercise.isBattleStartPage },\
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage, 2000 },\
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal },\
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_PURSUE_MODAL') then\
\
      stepLabel.setStepLabelContent('6-49.追击面板')\
      c.yield(sleepPromise(100))\
      if (settings.exercisePursue) then\
        stepLabel.setStepLabelContent('6-50.追击')\
        o.exercise.clickPursueModalOk()\
      else\
        stepLabel.setStepLabelContent('6-51.放弃追击')\
        o.exercise.clickPursuePageCancel()\
      end\
      stepLabel.setStepLabelContent('6-52.等待胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage },\
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal, 2000 },\
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },\
        { 'EXERCISE_VICTORY_NEXT_PAGE', o.exercise.isVictoryPage2 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_VICTORY_PAGE') then\
\
      stepLabel.setStepLabelContent('6-53.点击胜利继续')\
      o.exercise.clickVictoryPageContinueBtn()\
      stepLabel.setStepLabelContent('6-54.等待胜利继续界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage },\
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal },\
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage, 2000 },\
        { 'EXERCISE_VICTORY_NEXT_PAGE', o.exercise.isVictoryPage2 },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_VICTORY_NEXT_PAGE') then\
\
      stepLabel.setStepLabelContent('6-55点击胜利继续')\
      o.exercise.clickVictoryPageContinueBtn2()\
      stepLabel.setStepLabelContent('6-56.等待演习界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },\
        { 'EXERCISE_VICTORY_NEXT_PAGE', o.exercise.isVictoryPage2, 2000 },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CANT_GO') then\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isReadyBattlePage },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME') then\
\
      o.exercise.clickReadyBattlePageBackBtn()\
      stepLabel.setStepLabelContent(\"6-57等待出征界面\")\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isReadyBattlePage, 2000 },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME') then\
\
      stepLabel.setStepLabelContent('6-58.点击回港')\
      o.exercise.clickBackToHomeBtn()\
      stepLabel.setStepLabelContent('6-59.等待home')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage, 2000 },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage, 2000 },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
    end\
    return nil\
  end))\
end\
\
return exerciseOnce" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/repair.lua"] = { path = "./missions/repair.lua", name = "./missions/repair.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
local setScreenListeners = (require './utils').setScreenListeners\
local commonListenerFactory = require './common-listener'\
\
local getHomeListener = (require './common-listener').getHomeListener\
local getLoginListener = (require './common-listener').getLoginListener\
local getComListener = (require './common-listener').getComListener\
\
local store = require '../store'\
store.repair = store.repair or {}\
\
local moHome = require '../meta-operation/home'\
local moRepair = require '../meta-operation/repair'\
\
local o = {\
  home = moHome,\
  repair = moRepair,\
}\
\
local repair = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'REPAIR_ONCE_START') then\
\
      store.repair.repairNum = 0\
      -- 维修滑动界面次数\
      store.repair.moveCount = 4\
\
      if store.repair.nextRepairStartTime > os.time() then\
        stepLabel.setStepLabelContent('5-1.跳过维修，返回港口')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener()), {\
          { '', o.home.isHome }\
        })\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('5-1.等待HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'REPAIR_INIT', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'REPAIR_INIT') then\
\
      store.repair.slot = nil\
\
      stepLabel.setStepLabelContent('5-2.点击出征')\
      c.yield(sleepPromise(100))\
      o.repair.clickDockBtn()\
      stepLabel.setStepLabelContent('5-3.等待船坞界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'REPAIR_INIT', o.home.isHome, 2000 },\
        { 'REPAIR_REPAIR_PAGE', o.repair.isRepairPage },\
        { 'REPAIR_DOCK_PAGE', o.repair.isDockPage },\
      }))\
\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'REPAIR_DOCK_PAGE') then\
\
      stepLabel.setStepLabelContent('5-4.点击修理按钮')\
      c.yield(sleepPromise(100))\
      o.repair.clickRepairBtn()\
      stepLabel.setStepLabelContent('5-5.等待修理界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'REPAIR_REPAIR_PAGE', o.repair.isRepairPage },\
        { 'REPAIR_DOCK_PAGE', o.repair.isDockPage, 2000 },\
      }))\
\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'REPAIR_REPAIR_PAGE') then\
\
      if (store.repair.repairNum < 6) then\
        stepLabel.setStepLabelContent('5-6.检测空闲槽位')\
        c.yield(sleepPromise(500))\
        local res, hasList = o.repair.hasEmptyRepairSlot()\
        if (res) then\
          store.repair.slot = hasList[1]\
          stepLabel.setStepLabelContent('5-7.有空闲槽位')\
          stepLabel.setStepLabelContent('5-8.点击第' .. store.repair.slot .. '个空闲槽位')\
          c.yield(sleepPromise(100))\
          o.repair.clickRepairSlotBtn(store.repair.slot)\
          c.yield(sleepPromise(100))\
          stepLabel.setStepLabelContent('5-9.检测修理界面，选船界面')\
\
          -- 如果一没进入修船选船页面说明没有需要维修的船\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
            { 'REPAIR_SELECT_SHIP_PAGE', o.repair.isSelectShipPage },\
            { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage, 3000 },\
          }))\
\
          if (newstateTypes == 'REPAIR_REPAIR_FINISH') then\
            store.repair.nextRepairStartTime = os.time() + 1800\
            stepLabel.setStepLabelContent('5-10.没有船需要维修')\
          end\
\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('5-11.没有空位')\
          store.repair.nextRepairStartTime = os.time()\
\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
            { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage },\
          }))\
          return makeAction(newstateTypes)\
        end\
      else\
        stepLabel.setStepLabelContent('5-12.维修出现意外')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
    elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then\
\
      if (settings.repairAll) then\
        stepLabel.setStepLabelContent('5-13.选择第一个船')\
        c.yield(sleepPromise(200))\
        o.repair.clickFirstShip()\
\
        store.repair.repairNum = store.repair.repairNum + 1\
        stepLabel.setStepLabelContent('5-14.等待返回修理界面')\
\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', o.repair.isRepairPage },\
          { 'REPAIR_SELECT_SHIP_PAGE', o.repair.isSelectShipPage, 2000 },\
        }))\
\
        return makeAction(newstateTypes)\
      else\
        if (store.repair.moveCount > 0) then\
          stepLabel.setStepLabelContent('5-15.寻找一个不在舰队里的船')\
          c.yield(sleepPromise(600))\
          local point = o.repair.findFirstShipNotInFleet()\
          if (point) then\
            stepLabel.setStepLabelContent('5-16.找到 [' .. point[1] .. ',' .. point[2] .. ']，点击')\
            o.repair.clickAShip(point)\
            store.repair.repairNum = store.repair.repairNum + 1\
          else\
            -- 没找到点，移动一次\
            stepLabel.setStepLabelContent('5-17.检测是否需要向左滑动')\
            local needMove = o.repair.isNeedMoveToNextPage();\
            if needMove then\
              stepLabel.setStepLabelContent('5-18.向左滑一次')\
              o.repair.moveToNextPage()\
              store.repair.moveCount = store.repair.moveCount - 1\
\
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
                { 'REPAIR_RETURN_TO_REPAIR_PAGE', o.repair.isRepairPage },\
                { 'REPAIR_SELECT_SHIP_PAGE', o.repair.isSelectShipPage },\
              }))\
\
              return makeAction(newstateTypes)\
            else\
              stepLabel.setStepLabelContent('5-19.不需要向左滑')\
              store.repair.moveCount = 0\
            end\
          end\
        end\
\
        stepLabel.setStepLabelContent('5-20.等待返回修理界面')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', o.repair.isRepairPage },\
          { 'REPAIR_SELECT_SHIP_PAGE_RETURN', o.repair.isSelectShipPage, 2000 },\
        }))\
\
        if (newstateTypes == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then\
          store.repair.nextRepairStartTime = os.time() + 1800\
          stepLabel.setStepLabelContent('5-21.没有需要修理的船')\
        end\
\
        return makeAction(newstateTypes)\
      end\
\
    elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then\
\
      stepLabel.setStepLabelContent('5-22.等待第' .. store.repair.slot .. '个槽位变成修理状态')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'REPAIR_REPAIR_PAGE', o.repair.isSlotNotEmpty(store.repair.slot) },\
        { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage, 3000 },\
      }))\
\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then\
\
      stepLabel.setStepLabelContent('5-23.没有可以修的船，返回维修页面')\
      o.repair.clickSelectShipPageBackBtn()\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'REPAIR_SELECT_SHIP_PAGE_RETURN', o.repair.isSelectShipPage, 2000 },\
        { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'REPAIR_REPAIR_FINISH') then\
\
      stepLabel.setStepLabelContent('5-24.完成维修')\
      o.repair.clickBackToHomeBtn()\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'REPAIR_SELECT_SHIP_PAGE_RETURN', o.repair.isSelectShipPage, 3000 },\
        { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage, 2000 },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
    end\
\
    return nil\
  end))\
end\
\
return repair" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/expedition.lua"] = { path = "./missions/expedition.lua", name = "./missions/expedition.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
local setScreenListeners = (require './utils').setScreenListeners\
local commonListenerFactory = require './common-listener'\
local vibratorPromise = require '../utils/vibrator-promise'\
\
local getHomeListener = (require './common-listener').getHomeListener\
local getLoginListener = (require './common-listener').getLoginListener\
local getComListener = (require './common-listener').getComListener\
\
local sendToPushBullet = require '../utils/ajax-sent-to-push-bullet'\
\
local store = require '../store'\
\
local moHome = require '../meta-operation/home'\
local moExpedition = require '../meta-operation/expedition'\
\
local o = {\
  home = moHome,\
  expedition = moExpedition,\
}\
\
store.expedition = store.expedition or {\
  needExpedition = true,\
}\
\
local expedition = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'EXPEDITION_ONCE_START') then\
\
      if (not store.expedition.needExpedition) then\
        stepLabel.setStepLabelContent('4-18.跳过远征派遣，返回港口')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
          { '', 'homeGroup', o.home.isHome },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      if (type(settings.expeditionFleetToChapter) ~= 'table') then\
        store.expedition.expeditionFleetToChapter = { false, false, false, false }\
      end\
\
      if ((not settings.expeditionFleetToChapter[1])\
        and (not settings.expeditionFleetToChapter[2])\
        and (not settings.expeditionFleetToChapter[3])\
        and (not settings.expeditionFleetToChapter[4])) then\
        stepLabel.setStepLabelContent('4-18.没有远征任务！返回港口')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('4-16.等待HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_INIT', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_INIT') then\
      stepLabel.setStepLabelContent('4-17.准备远征派遣舰队')\
      -- 准备开始远征派遣舰队任务\
\
      -- 将出征派遣列表复制到缓存中\
      store.expedition.expeditionFleetToChapter = {}\
      for k = 1, #settings.expeditionFleetToChapter do\
        local v = settings.expeditionFleetToChapter[k]\
        if (v) then\
          table.insert(store.expedition.expeditionFleetToChapter, { k, v })\
        end\
      end\
\
\
      -- 此任务使用的变量恢复默认值\
      store.expedition.quickSupplyCount = 0\
      store.expedition.quickRepairCount = 0\
      store.expedition.quickRepairSingleLastShip = 0\
      store.expedition.quickRepairSingleCount = 0\
      store.expedition.lastChapter = nil\
      store.expedition.fleet = nil\
      store.expedition.chapters = nil\
      store.expedition.hasShipCantExpedition = false\
\
\
      stepLabel.setStepLabelContent('4-19.点击出征')\
      o.expedition.clickBattle()\
      stepLabel.setStepLabelContent('4-20.等待出征界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_INIT', o.home.isHome, 2000 },\
        { 'EXPEDITION_IS_BATTLE_PAGE', o.expedition.isBattlePage },\
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then\
      -- 进入出征大页面\
      stepLabel.setStepLabelContent('4-21.点击远征')\
      o.expedition.clickExpedition()\
      stepLabel.setStepLabelContent('4-22.等待远征界面')\
\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_INIT', o.home.isHome, 2000 },\
        { 'EXPEDITION_IS_BATTLE_PAGE', o.expedition.isBattlePage, 2000 },\
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_IS_EXPEDITION_PAGE') then\
      -- 进入远征页面\
      if (#store.expedition.expeditionFleetToChapter > 0) then\
        c.yield(sleepPromise(500))\
\
        store.expedition.quickSupplyCount = 0\
        store.expedition.quickRepairCount = 0\
\
        store.expedition.fleet, store.expedition.chapters = table.unpack(store.expedition.expeditionFleetToChapter[1])\
\
        local chapter, section = table.unpack(strSplit(store.expedition.chapters, '-'))\
        if (store.expedition.lastChapter ~= chapter) then\
          stepLabel.setStepLabelContent('4-21.移动到第' .. chapter .. '章')\
          o.expedition.moveToChapter(chapter, store.expedition.lastChapter)\
          store.expedition.lastChapter = chapter\
          c.yield(sleepPromise(500))\
        end\
\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXPEDITION_EXPEDITION_PAGE_CLICK_START_EXPEDITION_BTN', o.expedition.isBattleExpedition, 2000 },\
          { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('4-27.没有远征')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isReadyBattlePage, 2000 },\
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isBattleExpedition, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
    elseif (action.type == 'EXPEDITION_EXPEDITION_PAGE_CLICK_START_EXPEDITION_BTN') then\
\
      if (#store.expedition.expeditionFleetToChapter > 0) then\
        local chapter, section = table.unpack(strSplit(store.expedition.chapters, '-'))\
        stepLabel.setStepLabelContent('4-23.检测第' .. section .. '节能否远征')\
        local res = o.expedition.isChapterCanExpedition(section)\
        if (res) then\
          stepLabel.setStepLabelContent('4-24.点击按钮' .. section)\
          o.expedition.clickExpeditionBtn(section)\
          stepLabel.setStepLabelContent('4-25.等待远征准备界面')\
\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_EXPEDITION_PAGE_CLICK_START_EXPEDITION_BTN', o.expedition.isBattleExpedition, 2000 },\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('4-26.本章不能远征')\
          -- 执行下一个章节\
          table.remove(store.expedition.expeditionFleetToChapter, 1)\
          return makeAction('EXPEDITION_IS_EXPEDITION_PAGE')\
        end\
      else\
        stepLabel.setStepLabelContent('4-27.没有远征')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isReadyBattlePage, 2000 },\
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isBattleExpedition, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE') then\
\
      if ((store.expedition.quickSupplyCount <= 0) and (store.expedition.quickRepairCount <= 0)) then\
        -- 还没快速补给，还没维修\
        stepLabel.setStepLabelContent('4-28.选择舰队' .. store.expedition.fleet)\
        o.expedition.clickSelectFleet(store.expedition.fleet)\
        stepLabel.setStepLabelContent('4-29.检测所有状态正常')\
        c.yield(sleepPromise(500))\
        -- 检测舰队是否在最佳状态\
        local res = o.expedition.isReadyBattlePageShipStatusAllRight()\
        if (res) then\
          stepLabel.setStepLabelContent('4-30.状态正常')\
          store.expedition.quickSupplyCount = 1\
          store.expedition.quickRepairCount = 1\
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('4-31.状态不正常')\
          o.expedition.clickReadyBattlePageQuickSupplyBtn()\
          stepLabel.setStepLabelContent('4-32.等待快速补给界面')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_QUICK_SUPPLY_MODAL', o.expedition.isQuickSupplyModal },\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        end\
      elseif (store.expedition.quickRepairCount <= 0) then\
        -- 已经快速补给，还没维修\
        stepLabel.setStepLabelContent('4-33.检测血量是否安全')\
        c.yield(sleepPromise(1000))\
        local res = o.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('4-34.血量安全')\
          store.expedition.quickRepairCount = 1\
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          if (settings.expeditionQuickRepair > 0) then\
            stepLabel.setStepLabelContent('4-35.血量不安全，快修')\
            o.expedition.clickQuickRepairBtn()\
            stepLabel.setStepLabelContent('4-36.等待快速修理界面')\
\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal },\
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage, 2000 },\
            }))\
\
            return makeAction(newstateTypes)\
          else\
            stepLabel.setStepLabelContent('4-37.血量不安全')\
            store.expedition.quickRepairCount = 1\
            return { type = 'EXPEDITION_READY_BATTLE_PAGE' }\
          end\
        end\
      else\
        -- 已经快速补给，已经维修\
        stepLabel.setStepLabelContent('4-38.再次检测血量是否安全')\
        c.yield(sleepPromise(500))\
        -- 不允许大破出征\
        local res = o.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('4-39.血量安全，继续')\
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('4-40.血量不安全，返回')\
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO' }\
        end\
      end\
\
    elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL') then\
      -- 快速补给界面\
      stepLabel.setStepLabelContent('4-41.快速补给界面点击确定')\
      o.expedition.clickReadyBattlePageQuickSupplyModalOkBtn()\
      stepLabel.setStepLabelContent('4-42.等待远征准备界面')\
      store.expedition.quickSupplyCount = store.expedition.quickSupplyCount + 1\
      if (store.expedition.quickSupplyCount < 3) then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXPEDITION_QUICK_SUPPLY_MODAL', o.expedition.isQuickSupplyModal, 2000 },\
          { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('4-43.资源数量不足')\
        return { type = 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE' }\
      end\
\
    elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('4-44.点击快速补给关闭')\
      c.yield(sleepPromise(100))\
      o.expedition.clickQuickSupplyModalCloseBtn()\
      c.yield(sleepPromise(300))\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE', o.expedition.isQuickSupplyModal, 2000 },\
        { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', o.expedition.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL') then\
\
\
      if (settings.expeditionQuickRepair == 3) then\
        -- 不满血则快修\
        stepLabel.setStepLabelContent('4-45.点击快速修理确定')\
        c.yield(sleepPromise(500))\
        o.expedition.clickQuickRepairModalOkBtn()\
        store.expedition.quickRepairCount = store.expedition.quickRepairCount + 1\
        stepLabel.setStepLabelContent('4-46.等待出征准备界面')\
        if (store.expedition.quickRepairCount < 3) then\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
            { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('4-47.快修数量不足')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.expeditionQuickRepair == 2) then\
        -- 中破或大破快修\
        stepLabel.setStepLabelContent('4-48.寻找中破或大破的船')\
        c.yield(sleepPromise(1000))\
        local res = o.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)\
        if (#res > 0) then\
          if ((store.expedition.quickRepairSingleLastShip ~= res[1]) or (store.expedition.quickRepairSingleCount < 3)) then\
            store.expedition.quickRepairSingleLastShip = res[1]\
            store.expedition.quickRepairSingleCount = store.expedition.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('4-49.中破或大破:' .. table.concat(res, ','))\
            o.expedition.clickQuickRepairModalSingleShip(res[1])\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
              { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal, 500 },\
            }))\
            return makeAction(newstateTypes)\
          else\
            store.expedition.quickRepairSingleLastShip = 0\
            store.expedition.quickRepairSingleCount = 0\
            store.expedition.quickRepairCount = store.battle.quickRepairCount + 1\
            stepLabel.setStepLabelContent('4-50.快修数量不足')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('4-51.修理完成')\
          store.expedition.quickRepairCount = store.expedition.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
            { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.expeditionQuickRepair == 1) then\
        -- 大破快修\
        stepLabel.setStepLabelContent('4-52.寻找大破的船')\
        c.yield(sleepPromise(1000))\
        local res = o.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)\
        if (#res > 0) then\
          if ((store.expedition.quickRepairSingleLastShip ~= res[1]) or (store.expedition.quickRepairSingleCount < 3)) then\
            store.expedition.quickRepairSingleLastShip = res[1]\
            store.expedition.quickRepairSingleCount = store.expedition.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('4-53.大破:' .. table.concat(res, ','))\
            o.expedition.clickQuickRepairModalSingleShip(res[1])\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
              { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal, 500 },\
            }))\
            return makeAction(newstateTypes)\
          else\
            store.expedition.quickRepairSingleLastShip = 0\
            store.expedition.quickRepairSingleCount = 0\
            store.expedition.quickRepairCount = store.battle.quickRepairCount + 1\
            stepLabel.setStepLabelContent('4-54.快修数量不足')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('4-55.修理完成')\
          store.expedition.quickRepairCount = store.expedition.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
            { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
      end\
\
    elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('4-56.点击快速修理关闭')\
      c.yield(sleepPromise(500))\
      o.expedition.clickQuickRepairModalCloseBtn()\
      c.yield(sleepPromise(300))\
      stepLabel.setStepLabelContent('4-57.等待出征准备界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal, 2000 },\
        { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO') then\
\
      stepLabel.setStepLabelContent('4-58.检测舰队可以出征')\
      c.yield(sleepPromise(500))\
      local fleetCanBattle = o.expedition.isFleetsCanBattle()\
      if (fleetCanBattle) then\
        stepLabel.setStepLabelContent('4-59.可以出征')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO', o.expedition.isReadyBattlePage },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('4-60.返回')\
        return makeAction('EXPEDITION_READY_BATTLE_PAGE_CANT_GO')\
      end\
\
    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO') then\
\
      stepLabel.setStepLabelContent('4-61.出征准备界面，点击出征开始')\
      c.yield(sleepPromise(100))\
      stepLabel.setStepLabelContent('4-62.点击远征开始')\
      o.expedition.clickBattleStartBtn()\
      stepLabel.setStepLabelContent('4-63.等待战斗开始')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO', o.expedition.isReadyBattlePage, 2000 },\
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then\
      -- 舰队不能远征，准备返回远征页\
      store.expedition.hasShipCantExpedition = true\
\
      -- 震动提示不能远征\
      if (settings.expeditionAlertWhenNoHp) then\
        if settings.alertUseVibrate then\
          vibratorPromise(3)\
        end\
        if settings.alertUsePushbullet then\
          local datestr = os.date('%Y-%m-%d %X')\
          sendToPushBullet(settings.pushbulletsToken,\
            datestr .. ' ' .. settings.pushbulletNickname,\
            datestr .. '  ' .. getDeviceModel() .. '  ' .. '远征失败')\
        end\
      end\
\
      stepLabel.setStepLabelContent('4-64.点击返回远征界面')\
      o.expedition.clickBackToExpedition()\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', o.expedition.isReadyBattlePage, 2000 },\
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition },\
      }))\
\
      -- 如果离开这一页，则从远征队列里退出一个队伍\
      if (newstateTypes ~= 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then\
        table.remove(store.expedition.expeditionFleetToChapter, 1)\
      end\
\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME') then\
\
      if (not store.expedition.hasShipCantExpedition) then\
        store.expedition.needExpedition = false\
      end\
\
      stepLabel.setStepLabelContent('4-66.返回远征页')\
      o.expedition.clickBackToExpedition()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isReadyBattlePage, 2000 },\
        { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', o.expedition.isBattleExpedition, 2000 },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME') then\
\
      stepLabel.setStepLabelContent('4-67.返回港口')\
      o.expedition.clickBackToHome()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isReadyBattlePage, 2000 },\
        { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', o.expedition.isBattleExpedition, 2000 },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
    end\
  end))\
end\
\
return expedition" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/expedition-reward.lua"] = { path = "./missions/expedition-reward.lua", name = "./missions/expedition-reward.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
local setScreenListeners = (require './utils').setScreenListeners\
local commonListenerFactory = require './common-listener'\
\
local getHomeListener = (require './common-listener').getHomeListener\
local getLoginListener = (require './common-listener').getLoginListener\
local getComListener = (require './common-listener').getComListener\
\
local store = require '../store'\
\
local moHome = require '../meta-operation/home'\
local moExpedition = require '../meta-operation/expedition'\
\
local o = {\
  home = moHome,\
  expedition = moExpedition,\
}\
\
store.expeditionReward = store.expeditionReward or {}\
\
local expeditionReward = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'EXPEDITION_REWARD_START') then\
\
      stepLabel.setStepLabelContent('4-1.等待HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'EXPEDITION_REWARD_INIT', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_REWARD_INIT') then\
\
      -- 远征章节\
      store.expeditionReward.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }\
\
      -- 此任务使用的变量恢复默认值\
      store.expedition.lastChapter = nil\
\
      return makeAction('EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED')\
\
    elseif (action.type == 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED') then\
\
      stepLabel.setStepLabelContent('4-3.检测是否有远征奖励')\
      c.yield(sleepPromise(100))\
      local res = o.expedition.isExpeditionCompleted()\
      if (not res) then\
        stepLabel.setStepLabelContent('4-4.没有远征奖励和任务')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { '', 'homeGroup', o.home.isHome },\
        }))\
        return makeAction(newstateTypes)\
      end\
      stepLabel.setStepLabelContent('4-5.点击出征')\
      o.expedition.clickBattle()\
      stepLabel.setStepLabelContent('4-6.等待出征界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', o.expedition.isBattleExpedition },\
        { 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED', o.home.isHome, 3000 },\
        { 'EXPEDITION_REWARD_IS_BATTLE', o.expedition.isBattlePage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then\
\
      stepLabel.setStepLabelContent('4-7.点击远征')\
      o.expedition.clickExpedition()\
      stepLabel.setStepLabelContent('4-8.等待远征界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', o.expedition.isBattleExpedition },\
        { 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED', o.home.isHome, 3000 },\
        { 'EXPEDITION_REWARD_IS_BATTLE', o.expedition.isBattlePage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then\
\
      c.yield(sleepPromise(500))\
      if (#store.expeditionReward.enableChapter > 0) then\
        local chapter = store.expeditionReward.enableChapter[1]\
        stepLabel.setStepLabelContent('4-9.移动到第' .. chapter .. '章')\
        c.yield(sleepPromise(500))\
        o.expedition.moveToChapter(chapter, store.expedition.lastChapter)\
        store.expedition.lastChapter = chapter\
        stepLabel.setStepLabelContent('4-10.检测本页有可收获奖励')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', o.expedition.isBattleExpedition, 1000 },\
        }))\
        return makeAction(newstateTypes)\
      else\
        return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }\
      end\
\
    elseif (action.type == 'EXPEDITION_REWARD_CHECK_HAS_REWARD') then\
\
      local res, list = o.expedition.isThisExpeditionPageHasReward()\
      if (res) then\
        local v = list[1]\
\
        -- 当回收一个远征奖励时，就需要远征派遣\
        store.expedition.needExpedition = true\
\
        stepLabel.setStepLabelContent('4-11.点击第' .. v .. '节')\
        o.expedition.clickExpeditionBtn(v)\
        stepLabel.setStepLabelContent('4-12.等待远征完成页面')\
\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', o.expedition.isBattleExpedition, 2000 },\
          { 'EXPEDITION_REWARD_COMPLETED_PAGE', o.expedition.isExpeditionCompletedPage },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('4-13.本页没有可收获的奖励')\
      table.remove(store.expeditionReward.enableChapter, 1)\
      return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }\
\
    elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then\
\
      o.expedition.clickRewardPannelOk()\
      stepLabel.setStepLabelContent('4-14.等待远征界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_REWARD_COMPLETED_PAGE', o.expedition.isExpeditionCompletedPage, 2000 },\
        { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', o.expedition.isBattleExpedition },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_REWARD_RETURN_TO_HOME') then\
\
      o.expedition.clickBackToHome()\
      stepLabel.setStepLabelContent('4-15.返回HOME')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'EXPEDITION_REWARD_RETURN_TO_HOME', o.expedition.isBattleExpedition, 2000 },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
    end\
\
    return nil\
  end))\
end\
\
return expeditionReward" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/disintegrate-ship.lua"] = { path = "./missions/disintegrate-ship.lua", name = "./missions/disintegrate-ship.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
local setScreenListeners = (require './utils').setScreenListeners\
local getHomeListener = (require './common-listener').getHomeListener\
local getLoginListener = (require './common-listener').getLoginListener\
local getComListener = (require './common-listener').getComListener\
\
local store = require '../store'\
\
local moHome = require '../meta-operation/home'\
local moDisintegrateShip = require '../meta-operation/disintegrateShip'\
\
local o = {\
  home = moHome,\
  disintegrateShip = moDisintegrateShip,\
}\
\
store.disintegrateShip = store.disintegrateShip or {\
  nextStartTime = os.time(),\
}\
\
local disintegrateShip = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if action.type == 'DISINTEGRATE_SHIP_INIT' then\
      if store.disintegrateShip.nextStartTime > os.time() then\
        stepLabel.setStepLabelContent('8-1.跳过解体，下次检查时间：' .. os.date(\"%Y-%m-%d %H:%M:%S\", store.disintegrateShip.nextStartTime))\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { '', o.home.isHome, 1000 }\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      store.disintegrateShip.clickDisintegrateShipBtnCount = 0\
      return makeAction('DISINTEGRATE_SHIP_START')\
\
    elseif action.type == 'DISINTEGRATE_SHIP_START' then\
\
      stepLabel.setStepLabelContent('8-2.等待HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', o.home.isHome },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', o.disintegrateShip.addShipPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN' then\
\
      stepLabel.setStepLabelContent('8-3.点击建造按钮')\
      o.disintegrateShip.clickBuildPageBtn()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', o.home.isHome, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', o.disintegrateShip.addShipPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN' then\
\
      stepLabel.setStepLabelContent('8-4.点击解体页面按钮')\
      o.disintegrateShip.clickDisintegratePageBtn()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', o.home.isHome, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', o.disintegrateShip.addShipPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN' then\
\
      stepLabel.setStepLabelContent('8-5.点击添加按钮')\
      o.disintegrateShip.clickAddShipBtn()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', o.home.isHome, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', o.disintegrateShip.addShipPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP' then\
\
      stepLabel.setStepLabelContent('8-6.检测是否有船')\
      c.yield(sleepPromise(500))\
      local hasShipRes = o.disintegrateShip.hasShip()\
\
      if hasShipRes then\
        stepLabel.setStepLabelContent('8-7.有船，选中所有船')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
          { '', o.home.isHome, 2000 },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage, 2000 },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('8-8.没船，返回')\
      return makeAction('DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK')\
\
    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK' then\
\
      stepLabel.setStepLabelContent('8-9.点击返回')\
      o.disintegrateShip.selectAllShipClickCancel()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { '', o.home.isHome, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isDisintegrateShipPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.addShipPage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP' then\
\
      stepLabel.setStepLabelContent('8-10.点击所有船')\
      o.disintegrateShip.clickAllShip()\
      stepLabel.setStepLabelContent('8-11.点击确定')\
      c.yield(sleepPromise(500))\
      o.disintegrateShip.selectAllShipClickOk()\
      store.disintegrateShip.clickDisintegrateShipBtnCount = 0\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { '', o.home.isHome, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },\
        { 'DISINTEGRATE_SHIP_CHECK_REMOVED_ALL_EQUIPMENT_ENABLE', o.disintegrateShip.isDisintegrateShipPage, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_CHECK_REMOVED_ALL_EQUIPMENT_ENABLE' then\
\
      stepLabel.setStepLabelContent('8-12.检测是否选中卸下所有装备选项')\
      local res = o.disintegrateShip.checkIsRemoveAllEquipmentEnable()\
      if res then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
          { '', o.home.isHome, 2000 },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },\
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      end\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { '', o.home.isHome, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },\
        { 'DISINTEGRATE_SHIP_SELECT_REMOVED_ALL_EQUIPMENT', o.disintegrateShip.isDisintegrateShipPage, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_SELECT_REMOVED_ALL_EQUIPMENT' then\
\
      stepLabel.setStepLabelContent('8-13.选中卸下所有装备选项')\
      o.disintegrateShip.clickRemoveAllEquipmentCheckbox()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { '', o.home.isHome, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL' then\
\
      stepLabel.setStepLabelContent('8-14.稀有解体确认面板')\
      o.disintegrateShip.clickDisintegratePanelOkBtn()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { '', o.home.isHome, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel, 2000 },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN' then\
\
      stepLabel.setStepLabelContent('8-15.点击解体')\
      o.disintegrateShip.clickDisintegrateShipBtn()\
      store.disintegrateShip.clickDisintegrateShipBtnCount = store.disintegrateShip.clickDisintegrateShipBtnCount + 1\
      if store.disintegrateShip.clickDisintegrateShipBtnCount <= 2 then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
          { '', o.home.isHome, 2000 },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage },\
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', o.disintegrateShip.isDisintegrateShipPage, 1000 },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel, 2000 },\
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      -- 如果是快速解体模式，则不再进行第二次检查，直接退出\
      if settings.disintegrateShipFastMode then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
          { '', o.home.isHome, 2000 },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isDisintegrateShipPage, 2000 },\
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel, 2000 },\
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.addShipPage, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { '', o.home.isHome, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel, 2000 },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.addShipPage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK' then\
\
      store.disintegrateShip.nextStartTime = os.time() + settings.disintegrateShipInterval\
      stepLabel.setStepLabelContent('8-16.点击返回')\
      o.disintegrateShip.disintegrateShipPageClickBackToHome()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage, 2000 },\
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isDisintegrateShipPage, 2000 },\
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.addShipPage, 2000 },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
    end\
\
    return nil\
  end))\
end\
\
return disintegrateShip" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/mission.lua"] = { path = "./missions/mission.lua", name = "./missions/mission.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
local setScreenListeners = (require './utils').setScreenListeners\
local commonListenerFactory = require './common-listener'\
\
local getHomeListener = (require './common-listener').getHomeListener\
local getLoginListener = (require './common-listener').getLoginListener\
local getComListener = (require './common-listener').getComListener\
\
local store = require '../store'\
store.mission = store.mission or {}\
\
local moHome = require '../meta-operation/home'\
local moMission = require '../meta-operation/mission'\
\
local o = {\
  home = moHome,\
  mission = moMission,\
}\
\
local mission = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'MISSION_START') then\
\
      stepLabel.setStepLabelContent('3-1.等待HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'MISSION_IS_UNRECEIVED_MISSION', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then\
\
      stepLabel.setStepLabelContent('3-2.检测是否有任务奖励')\
      c.yield(sleepPromise(100))\
      local res = o.mission.isUnreceivedMission()\
      if (res) then\
        return { type = 'MISSION_INIT' }\
      end\
      stepLabel.setStepLabelContent('3-3.没有任务奖励')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'MISSION_INIT') then\
\
      stepLabel.setStepLabelContent('3-4点击任务按钮')\
      o.mission.clickMission()\
      stepLabel.setStepLabelContent('3-5.等待任务界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'MISSION_INIT', 'homeGroup', o.home.isHome, 2000 },\
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission },\
        { 'MISSION_PAGE', o.mission.isMission },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'MISSION_PAGE') then\
\
      stepLabel.setStepLabelContent('3-6.点击全部任务')\
      o.mission.clickAllMission()\
      stepLabel.setStepLabelContent('3-7.等待任务全部任务界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission },\
        { 'MISSION_PAGE', o.mission.isMission, 2000 },\
      }))\
\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'MISSION_IS_MISSION_ALL_MISSION') then\
\
      c.yield(sleepPromise(100))\
      local res = o.mission.isMissionUnreceivedReward()\
      if (not res) then\
        stepLabel.setStepLabelContent('3-8.没有任务奖励')\
        return { type = 'MISSION_PAGE_NO_REWAR' }\
      else\
        stepLabel.setStepLabelContent('3-9.有任务奖励')\
        o.mission.clickGetFirstReward()\
        stepLabel.setStepLabelContent('3-10.等待获得面板')\
\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission, 2000 },\
          { 'MISSION_REWAR_PANNEL', o.mission.isRewardPannel },\
        }))\
\
        return makeAction(newstateTypes)\
      end\
\
    elseif (action.type == 'MISSION_REWAR_PANNEL') then\
\
      stepLabel.setStepLabelContent('3-11.点击确定')\
      o.mission.clickRewardPannelOk()\
      stepLabel.setStepLabelContent('3-12.等待新船，任务全部任务')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', o.mission.isNewShipPageLockModal },\
        { 'MISSION_IS_NEW_SHIP', o.mission.isNewShipPage },\
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission, 1000 },\
        { 'MISSION_REWAR_PANNEL', o.mission.isRewardPannel, 2000 },\
      }))\
\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'MISSION_IS_NEW_SHIP') then\
\
      stepLabel.setStepLabelContent('3-13.点击新船')\
      o.mission.clickNewShip()\
      stepLabel.setStepLabelContent('3-14.等待新船锁定，任务全部任务')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', o.mission.isNewShipPageLockModal },\
        { 'MISSION_IS_NEW_SHIP', o.mission.isNewShipPage },\
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission, 2000 },\
        { 'MISSION_REWAR_PANNEL', o.mission.isRewardPannel, 2000 },\
      }))\
\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL') then\
\
      stepLabel.setStepLabelContent('3-15.点击新船')\
      o.mission.clickNewShipPageLockModalOkBtn()\
      stepLabel.setStepLabelContent('3-16.等待任务全部任务')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'MISSION_IS_NEW_SHIP', o.mission.isNewShipPage },\
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', o.mission.isNewShipPageLockModal },\
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission },\
        { 'MISSION_REWAR_PANNEL', o.mission.isRewardPannel, 2000 },\
      }))\
\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'MISSION_PAGE_NO_REWAR') then\
\
      stepLabel.setStepLabelContent('3-17.等待返回home')\
      o.mission.clickBackToHome()\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'MISSION_PAGE_NO_REWAR', o.mission.isMission, 2000 },\
      }))\
      return makeAction(newstateTypes)\
    end\
\
    return nil\
  end))\
end\
\
return mission" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/battle.lua"] = { path = "./missions/battle.lua", name = "./missions/battle.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require '../missions/utils').makeAction\
local sleepPromise = (require '../missions/utils').sleepPromise\
local setScreenListeners = (require '../missions/utils').setScreenListeners\
local getHomeListener = (require '../missions/common-listener').getHomeListener\
local getLoginListener = (require '../missions/common-listener').getLoginListener\
local getComListener = (require '../missions/common-listener').getComListener\
local vibratorPromise = require '../utils/vibrator-promise'\
local store = require '../store'\
\
local sendToPushBullet = require '../utils/ajax-sent-to-push-bullet'\
\
local moBattle = require '../meta-operation/battle'\
local moHome = require '../meta-operation/home'\
\
local o = {\
  home = moHome,\
  battle = moBattle,\
}\
\
store.battle = store.battle or {}\
\
local battle = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'BATTLE_INIT') then\
\
      store.battle.quickSupplyCount = 0\
      store.battle.quickRepairCount = 0\
      store.battle.quickRepairSingleLastShip = 0\
      store.battle.quickRepairSingleCount = 0\
      store.battle.HPIsSafe = true\
      store.battle.battleNum = 1\
      store.battle.cantBattle = true\
      store.battle.passBattleStartPage = false\
      store.battle.battleStartPageHasSS = false\
      -- 出征后就应该需要维修\
      store.repair.nextRepairStartTime = os.time()\
\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'BATTLE_START', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_START') then\
\
      stepLabel.setStepLabelContent('2-1.等待HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'BATTLE_HOME_CLICK_BATTLE', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_HOME_CLICK_BATTLE') then\
\
      stepLabel.setStepLabelContent('2-2.点击出征')\
      o.home.clickBattleBtn()\
      stepLabel.setStepLabelContent('2-3.等待出征页面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_HOME_CLICK_BATTLE', o.home.isHome, 2000 },\
        { 'BATTLE_BATTLE_BATTLE_PAGE', o.battle.isBattleBattlePage },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_LAG_AND_BACK', o.battle.isBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE_LAG_AND_BACK') then\
\
      stepLabel.setStepLabelContent('2-4.由于在主界面卡住，一直点击出征导致直接跳进准备战斗页面，点击返回')\
      o.battle.clickReadyBattlePageBackBtn()\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_HOME_CLICK_BATTLE', o.home.isHome, 2000 },\
        { 'BATTLE_BATTLE_BATTLE_PAGE', o.battle.isBattleBattlePage, 2000 },\
        { 'BATTLE_BATTLE_PAGE', o.battle.isBattlePage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_BATTLE_PAGE') then\
\
      stepLabel.setStepLabelContent('2-5.出征页面点击出征的出征按钮')\
      c.yield(sleepPromise(500))\
      o.battle.clickBattleBtn()\
      stepLabel.setStepLabelContent('2-6.等待出征的出征界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_HOME_CLICK_BATTLE', o.home.isHome, 2000 },\
        { 'BATTLE_BATTLE_BATTLE_PAGE', o.battle.isBattleBattlePage, 2000 },\
        { 'BATTLE_BATTLE_PAGE', o.battle.isBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE') then\
\
      stepLabel.setStepLabelContent('2-7.出征的出征页面')\
      stepLabel.setStepLabelContent('2-8.移动到章节' .. settings.battleChapter)\
      c.yield(sleepPromise(300))\
      o.battle.moveToChapter(settings.battleChapter)\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_HOME_CLICK_BATTLE', o.home.isHome, 2000 },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_CLICK_CHAPTER', o.battle.isBattleBattlePage, 1000 },\
        { 'BATTLE_BATTLE_PAGE', o.battle.isBattlePage, 3000 },\
        { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE_CLICK_CHAPTER') then\
\
      stepLabel.setStepLabelContent('2-9.进入章节')\
      c.yield(sleepPromise(100))\
      o.battle.clickReadyBattleBtn()\
      c.yield(sleepPromise(100))\
      stepLabel.setStepLabelContent('2-10.等待出征准备界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_HOME_CLICK_BATTLE', o.home.isHome, 2000 },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_CLICK_CHAPTER', o.battle.isBattleBattlePage, 1000 },\
        { 'BATTLE_BATTLE_PAGE', o.battle.isBattlePage, 3000 },\
        { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE') then\
\
      if ((store.battle.quickSupplyCount <= 0) and (store.battle.quickRepairCount <= 0)) then\
        -- 还没快速补给，还没维修\
        stepLabel.setStepLabelContent('2-11.选择舰队:' .. settings.battleFleet)\
        o.battle.selectFleet(settings.battleFleet)\
        stepLabel.setStepLabelContent('2-12.检测所有状态正常')\
        c.yield(sleepPromise(1000))\
        local res = o.battle.isReadyBattlePageShipStatusAllRight()\
        if (res) then\
          stepLabel.setStepLabelContent('2-13.状态正常')\
          store.battle.quickSupplyCount = 1\
          store.battle.quickRepairCount = 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO', o.battle.isReadyBattlePage, 2000 },\
            { 'BATTLE_QUICK_SUPPLY_MODAL', o.battle.isQuickSupplyModal },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('2-14.状态不正常')\
          o.battle.clickReadyBattlePageQuickSupplyBtn()\
          stepLabel.setStepLabelContent('2-15.等待快速补给界面')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage, 2000 },\
            { 'BATTLE_QUICK_SUPPLY_MODAL', o.battle.isQuickSupplyModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
      elseif (store.battle.quickRepairCount <= 0) then\
        -- 已经快速补给，还没维修\
        stepLabel.setStepLabelContent('2-16.检测血量是否安全')\
        c.yield(sleepPromise(1000))\
        local res = o.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('2-17.血量安全')\
          store.battle.quickRepairCount = 1\
          return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          if (settings.battleQuickRepair > 0) then\
            stepLabel.setStepLabelContent('2-18.血量不安全，快修')\
            o.battle.clickQuickRepairBtn()\
\
            store.battle.quickRepairSingleLastShip = 0\
            store.battle.quickRepairSingleCount = 0\
\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage, 2000 },\
              { 'BATTLE_QUICK_REPAIR_MODAL', o.battle.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          else\
            stepLabel.setStepLabelContent('2-19.血量不安全')\
            store.battle.quickRepairCount = 1\
            return { type = 'BATTLE_READY_BATTLE_PAGE' }\
          end\
        end\
      else\
        -- 已经快速补给，已经维修\
        stepLabel.setStepLabelContent('2-20.再次检测血量是否安全')\
        c.yield(sleepPromise(500))\
        -- 不允许大破出征\
        local res = o.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('2-21.血量安全，继续')\
          return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('2-22.血量不安全，返回')\
          return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO')\
        end\
      end\
\
    elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL') then\
\
      stepLabel.setStepLabelContent('2-23.快速补给界面点击确定')\
      o.battle.clickReadyBattlePageQuickSupplyModalOkBtn()\
      stepLabel.setStepLabelContent('2-24.等待出征准备界面')\
      store.battle.quickSupplyCount = store.battle.quickSupplyCount + 1\
      if (store.battle.quickSupplyCount < 3) then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage, 1000 },\
          { 'BATTLE_QUICK_SUPPLY_MODAL', o.battle.isQuickSupplyModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('2-25.资源数量不足')\
        return { type = 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE' }\
      end\
\
    elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('2-26.点击快速补给关闭')\
      c.yield(sleepPromise(100))\
      o.battle.clickQuickSupplyModalCloseBtn()\
      c.yield(sleepPromise(300))\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE', o.battle.isQuickSupplyModal, 2000 },\
        { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL') then\
\
      if (settings.battleQuickRepair == 3) then\
        -- 不满血则快修\
        stepLabel.setStepLabelContent('2-27.点击快速修理确定')\
        c.yield(sleepPromise(500))\
        o.battle.clickQuickRepairModalOkBtn()\
        store.battle.quickRepairCount = store.battle.quickRepairCount + 1\
        stepLabel.setStepLabelContent('2-28.等待出征准备界面')\
        if (store.battle.quickRepairCount < 3) then\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage, 1000 },\
            { 'BATTLE_QUICK_REPAIR_MODAL', o.battle.isQuickRepairModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('2-29.快修数量不足')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.battleQuickRepair == 2) then\
        -- 中破或大破快修\
        stepLabel.setStepLabelContent('2-30.寻找中破或大破的船')\
        c.yield(sleepPromise(1000))\
        local res = o.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)\
        if (#res > 0) then\
\
          if ((store.battle.quickRepairSingleLastShip ~= res[1]) or (store.battle.quickRepairSingleCount < 3)) then\
            store.battle.quickRepairSingleLastShip = res[1]\
            store.battle.quickRepairSingleCount = store.battle.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('2-31.中破或大破:' .. table.concat(res, ','))\
            o.battle.clickQuickRepairModalSingleShip(res[1])\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL', o.battle.isQuickRepairModal, 500 },\
            }))\
            return makeAction(newstateTypes)\
          else\
            store.battle.quickRepairSingleLastShip = 0\
            store.battle.quickRepairSingleCount = 0\
            store.battle.quickRepairCount = store.battle.quickRepairCount + 1\
            stepLabel.setStepLabelContent('2-32快修数量不足')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('2-33.修理完成')\
          store.battle.quickRepairCount = store.battle.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.battleQuickRepair == 1) then\
        -- 大破快修\
        stepLabel.setStepLabelContent('2-34.寻找大破的船')\
        c.yield(sleepPromise(1000))\
        local res = o.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)\
        if (#res > 0) then\
          if ((store.battle.quickRepairSingleLastShip ~= res[1]) or (store.battle.quickRepairSingleCount < 3)) then\
            store.battle.quickRepairSingleLastShip = res[1]\
            store.battle.quickRepairSingleCount = store.battle.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('2-35.大破:' .. table.concat(res, ','))\
            o.battle.clickQuickRepairModalSingleShip(res[1])\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL', o.battle.isQuickRepairModal, 500 },\
            }))\
            return makeAction(newstateTypes)\
          else\
            store.battle.quickRepairSingleLastShip = 0\
            store.battle.quickRepairSingleCount = 0\
            store.battle.quickRepairCount = store.battle.quickRepairCount + 1\
            stepLabel.setStepLabelContent('2-36.快修数量不足')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('2-37.修理完成')\
          store.battle.quickRepairCount = store.battle.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
      end\
\
    elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('2-38.点击快速修理关闭')\
      c.yield(sleepPromise(500))\
      o.battle.clickQuickRepairModalCloseBtn()\
      c.yield(sleepPromise(300))\
      stepLabel.setStepLabelContent('2-39.等待出征准备界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal, 2000 },\
        { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage, 1000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO') then\
\
      stepLabel.setStepLabelContent('2-40.检测舰队可以出征')\
      c.yield(sleepPromise(500))\
      local fleetCanBattle = o.battle.isFleetsCanBattle()\
      if (fleetCanBattle) then\
        stepLabel.setStepLabelContent('2-41.可以出征')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', o.battle.isReadyBattlePage },\
        }))\
        return makeAction(newstateTypes)\
      else\
        -- 不能出征，需要开启解体舰船功能\
        store.disintegrateShip.nextStartTime = os.time()\
        stepLabel.setStepLabelContent('2-42.返回HOME')\
        return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO')\
      end\
\
    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CAN_GO') then\
\
      stepLabel.setStepLabelContent('2-43.出征准备界面，点击出征开始')\
      c.yield(sleepPromise(100))\
      o.battle.clickBattleStartBtn()\
      return { type = 'BATTLE_GO_A_BATTLE' }\
\
    elseif (action.type == 'BATTLE_GO_A_BATTLE') then\
\
      store.battle.passBattleStartPage = false\
\
      if (store.battle.battleNum < settings.battleMaxBattleNum) then\
        stepLabel.setStepLabelContent('2-44.第' .. store.battle.battleNum .. '战开始')\
      else\
        stepLabel.setStepLabelContent('2-45.第' .. store.battle.battleNum .. '战Boss战开始')\
      end\
      stepLabel.setStepLabelContent('2-46.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getLoginListener(), getLoginListener(), {\
        { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', o.battle.isReadyBattlePage, 2000 },\
        { 'BATTLE_EXTRA_RECEIVE_MODAL', o.battle.isExtraReceiveModal },\
        { 'BATTLE_BATTLE_START_PAGE', o.battle.isBattleStartPage },\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage },\
        { 'BATTLE_VICTORY_NEXT_PAGE', o.battle.isVictoryPage2 },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage },\
        -- { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL',  o.battle.isNewShipPageLockModal },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_EXTRA_RECEIVE_MODAL') then\
\
      stepLabel.setStepLabelContent('2-47.额外获得面板，点击确定')\
      o.battle.clickExtraReceiveModalOk()\
      stepLabel.setStepLabelContent('2-48.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'BATTLE_EXTRA_RECEIVE_MODAL', o.battle.isExtraReceiveModal, 2000 },\
        { 'BATTLE_BATTLE_START_PAGE', o.battle.isBattleStartPage },\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage },\
        { 'BATTLE_VICTORY_NEXT_PAGE', o.battle.isVictoryPage2 },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_BATTLE_START_PAGE') then\
\
      -- 6-1第一战，遇到2航母，返回港口\
      store.battle.passBattleStartPage = true\
      if (settings.battleRebootAt6_1AMeetCV) then\
        stepLabel.setStepLabelContent('2-49.开始检测航母')\
        if (settings.battleChapter == '6-1') then\
          if (store.battle.battleNum == 1) then\
            c.yield(sleepPromise(500))\
            if (o.battle.isEnemyShipIsCV()) then\
              stepLabel.setStepLabelContent('2-49.遇到航母，返回港口')\
              return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' })\
            end\
          end\
        end\
      end\
      -- 6-1第一战，遇到2雷巡，返回港口\
      if (settings.battleRebootAt6_1AMeetCit) then\
        stepLabel.setStepLabelContent('2-50.开始检测雷巡')\
        if (settings.battleChapter == '6-1') then\
          if (store.battle.battleNum == 1) then\
            c.yield(sleepPromise(500))\
            if (o.battle.isEnemyShipIsCit()) then\
              stepLabel.setStepLabelContent('2-51.遇到雷巡，返回港口')\
              return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' })\
            end\
          end\
        end\
      end\
      -- 所有关卡，遇到补给船就继续，没遇到就返回港口\
      if (settings.battleRebootAtNotMeetAP) then\
        stepLabel.setStepLabelContent('2-52.开始检测补给')\
        c.yield(sleepPromise(500))\
        if (not o.battle.isEnemyShipIsAP()) then\
          stepLabel.setStepLabelContent('2-53.没遇到补给，返回港口')\
          return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' })\
        end\
      end\
      -- 所有关卡，遇到潜艇就切换单横阵\
      local battleOption = settings.battleOption[store.battle.battleNum] or settings.battleOption.main\
      if battleOption.autoChangeFormation then\
        stepLabel.setStepLabelContent('2-52.开始检测潜艇')\
        c.yield(sleepPromise(500))\
        if (not o.battle.isEnemyShipIsSS()) then\
          stepLabel.setStepLabelContent('2-53.遇到潜艇，切换单横阵')\
          store.battle.battleStartPageHasSS = true\
        end\
      end\
\
      stepLabel.setStepLabelContent('2-54.开始面板，点击开始')\
      c.yield(sleepPromise(200))\
      if (settings.battleRoundabout and o.battle.isBattleStartPageCanRoundabout()) then\
        o.battle.clickBattleStartModalRoundaboutBtn()\
      else\
        o.battle.clickBattleStartModalStartBtn()\
      end\
      stepLabel.setStepLabelContent('2-55.等待阵型面板，追击面板，胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_BATTLE_START_PAGE', o.battle.isBattleStartPage, 2000 },\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_FORMATION_PAGE') then\
\
      -- 6-1未发现敌舰\
      if (settings.battleRebootAt6_1AMeetCV) then\
        if (not store.battle.passBattleStartPage) then\
          if (settings.battleChapter == '6-1') then\
            if (store.battle.battleNum == 1) then\
              c.yield(sleepPromise(500))\
              stepLabel.setStepLabelContent('2-56.未发现敌舰，SL大法')\
              return makeAction({ type = 'LOGIN_START_APP' })\
            end\
          end\
        end\
      end\
\
      stepLabel.setStepLabelContent('2-57.阵型面板')\
      c.yield(sleepPromise(100))\
      local battleOption = settings.battleOption[store.battle.battleNum] or settings.battleOption.main\
      if battleOption.autoChangeFormation and store.battle.battleStartPageHasSS then\
        -- 遇到潜艇自动换单横阵\
        o.battle.clickFormationPageStartBtn(5)\
      else\
        o.battle.clickFormationPageStartBtn(battleOption.battleFormation)\
      end\
      stepLabel.setStepLabelContent('2-58.等待追击面板，胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_BATTLE_START_PAGE', o.battle.isBattleStartPage, 2000 },\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage, 2000 },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_PURSUE_PAGE') then\
\
      stepLabel.setStepLabelContent('2-59.追击面板')\
      local battleOption = settings.battleOption[store.battle.battleNum] or settings.battleOption.main\
      if battleOption.battlePursue and store.battle.battleNum <= settings.battleMaxBattleNum then\
        stepLabel.setStepLabelContent('2-60.追击')\
        o.battle.clickPursueModalOk()\
      else\
        stepLabel.setStepLabelContent('2-61.放弃追击')\
        o.battle.clickPursuePageCancel()\
      end\
      stepLabel.setStepLabelContent('2-62.等待胜利界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage, 2000 },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal, 2000 },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_VICTORY_PAGE') then\
\
      c.yield(sleepPromise(1000))\
      stepLabel.setStepLabelContent('2-63.胜利界面检测HP是否安全')\
      c.yield(sleepPromise(300))\
      -- 有大破就回港\
      store.battle.HPIsSafe = o.battle.isVictoryPageShipHPSafe(1)\
      if (store.battle.HPIsSafe) then\
        stepLabel.setStepLabelContent('2-64.HP安全')\
      else\
        stepLabel.setStepLabelContent('2-65.HP不安全')\
      end\
      c.yield(sleepPromise(200))\
      stepLabel.setStepLabelContent('2-66.点击胜利继续')\
      o.battle.clickVictoryPageContinueBtn()\
      stepLabel.setStepLabelContent('2-67.等待胜利继续界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal, 2000 },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage, 2000 },\
        { 'BATTLE_VICTORY_NEXT_PAGE', o.battle.isVictoryPage2 },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_VICTORY_NEXT_PAGE') then\
\
      stepLabel.setStepLabelContent('2-68.点击胜利继续')\
      o.battle.clickVictoryPageContinueBtn2()\
      stepLabel.setStepLabelContent('2-69.等待大破警告，新船，下回合窗口，勋章对话框，home')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage, 2000 },\
        { 'BATTLE_VICTORY_NEXT_PAGE', o.battle.isVictoryPage2, 2000 },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_SHIP_SERVER_DAMAGE_MODAL') then\
\
      stepLabel.setStepLabelContent('2-70.大破警告框点击返回')\
      o.battle.clickShipSevereDamageModalBack()\
      stepLabel.setStepLabelContent('2-71.等待新船，下回合窗口，勋章对话框，home')\
      store.battle.HPIsSafe = false\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage },\
        { 'BATTLE_VICTORY_NEXT_PAGE', o.battle.isVictoryPage2, 2000 },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal, 2000 },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_SHIP_CANT_GO_ON_MODAL') then\
\
      stepLabel.setStepLabelContent('2-72.无法前进警告框点击返回')\
      o.battle.clickShipCantGoOnModalBackBtn()\
      stepLabel.setStepLabelContent('2-73.等待新船，下回合窗口，勋章对话框，home')\
      store.battle.HPIsSafe = false\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage },\
        { 'BATTLE_VICTORY_NEXT_PAGE', o.battle.isVictoryPage2 },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal, 2000 },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal, 2000 },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage, 500 },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_NEW_SHIP_PAGE') then\
\
      stepLabel.setStepLabelContent('2-74.获取新船')\
      o.battle.clickNewShip()\
      stepLabel.setStepLabelContent('2-75.等待新船锁定窗口，下回合窗口，勋章对话框，home')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage },\
        { 'BATTLE_VICTORY_NEXT_PAGE', o.battle.isVictoryPage2 },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal, 2000 },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal, 2000 },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage, 2000 },\
        { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', o.battle.isNewShipPageLockModal },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL') then\
\
      stepLabel.setStepLabelContent('2-76.新船锁定窗口点击确认')\
      o.battle.clickNewShipPageLockModalOkBtn()\
      stepLabel.setStepLabelContent('2-77.等待下回合窗口，勋章对话框，home')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_FORMATION_PAGE', o.battle.isFormationPage },\
        { 'BATTLE_PURSUE_PAGE', o.battle.isPursueModal },\
        { 'BATTLE_VICTORY_PAGE', o.battle.isVictoryPage },\
        { 'BATTLE_VICTORY_NEXT_PAGE', o.battle.isVictoryPage2 },\
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', o.battle.isShipSevereDamageModal, 2000 },\
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', o.battle.isShipCantGoOnModal, 2000 },\
        { 'BATTLE_NEW_SHIP_PAGE', o.battle.isNewShipPage, 2000 },\
        { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', o.battle.isNewShipPageLockModal, 2000 },\
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_NEXT_LEVEL_STEP_MODAL') then\
      if ((store.battle.battleNum < settings.battleMaxBattleNum) and store.battle.HPIsSafe) then\
        stepLabel.setStepLabelContent('2-78.点击继续下一关')\
        o.battle.clickLevelStepModalContinueBtn()\
        store.battle.battleNum = store.battle.battleNum + 1\
        return { type = 'BATTLE_GO_A_BATTLE' }\
      else\
        stepLabel.setStepLabelContent('2-79.点击回港')\
        o.battle.clickLevelStepModalBackBtn()\
        stepLabel.setStepLabelContent('2-80.等待主界面')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CANT_GO') then\
\
      -- 提示不能战斗\
      if (settings.battleAlertWhenNoHp) then\
        if settings.alertUseVibrate then\
          vibratorPromise(3)\
        end\
        if settings.alertUsePushbullet then\
          local datestr = os.date('%Y-%m-%d %X')\
          sendToPushBullet(settings.pushbulletsToken,\
            datestr .. ' ' .. settings.pushbulletNickname,\
            datestr .. '  ' .. getDeviceModel() .. '  ' .. '不能出征')\
        end\
      end\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', o.battle.isReadyBattlePage },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', o.battle.isBattleBattlePage },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', o.battle.isBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME') then\
\
      o.battle.clickBattleStartModalBackToHomeBtn()\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME', o.battle.isBattleStartPage },\
        { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', o.battle.isReadyBattlePage },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', o.battle.isBattleBattlePage },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', o.battle.isBattlePage },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME') then\
\
      o.battle.clickReadyBattlePageBackBtn()\
      stepLabel.setStepLabelContent('2-81.等待出征界面')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', o.battle.isReadyBattlePage, 2000 },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', o.battle.isBattleBattlePage },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', o.battle.isBattlePage },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME') then\
\
      o.battle.clickBackToHomeBtn()\
      stepLabel.setStepLabelContent('2-82.等待主界面')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', o.battle.isBattleBattlePage, 2000 },\
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', o.battle.isBattlePage, 2000 },\
        { '', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
    end\
\
    return nil\
  end))\
end\
\
return battle" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/login.lua"] = { path = "./missions/login.lua", name = "./missions/login.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
local setScreenListeners = (require './utils').setScreenListeners\
\
local store = require '../store'\
store.login = store.login or {}\
\
local moHome = require '../meta-operation/home'\
local moLogin = require '../meta-operation/login'\
\
local o = {\
  home = moHome,\
  login = moLogin,\
}\
\
local login = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'LOGIN_START_APP') then\
\
      stepLabel.setStepLabelContent('1-11.启动游戏')\
      o.login.restartApp()\
      local newstateTypes = c.yield(setScreenListeners({\
        { 'LOGIN_LOGIN', o.login.isLoginPage, 2000 },\
        { 'LOGIN_SELECT_SERVER', o.login.isSelectServerPage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'LOGIN_LOGIN') then\
\
      stepLabel.setStepLabelContent('1-12.输入用户名界面')\
      local newstateTypes = c.yield(setScreenListeners({\
        { 'LOGIN_LOGIN', o.login.isLoginPage, 10000 },\
        { 'LOGIN_SELECT_SERVER', o.login.isSelectServerPage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'LOGIN_SELECT_SERVER') then\
\
      stepLabel.setStepLabelContent('1-13.登录界面')\
      o.login.clickLoginServerBtn()\
      local newstateTypes = c.yield(setScreenListeners({\
        { 'LOGIN_LOGIN', o.login.isLoginPage, 2000 },\
        { 'LOGIN_SELECT_SERVER', o.login.isSelectServerPage, 10000 },\
        { '', function() return true end, 6000 },\
      }))\
      return makeAction(newstateTypes)\
    end\
\
    return nil\
  end))\
end\
\
return login" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/pause.lua"] = { path = "./missions/pause.lua", name = "./missions/pause.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
\
local store = require '../store'\
store.pause = store.pause or {}\
\
local moHome = require '../meta-operation/home'\
\
local o = {\
  home = moHome,\
  network = moNetwork,\
}\
\
local pause = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'PAUSE_PAUSE') then\
\
      store.pause.lasttext = stepLabel.getText()\
      stepLabel.setPrefix('')\
      stepLabel.setStepLabelContent('暂停')\
      c.yield(sleepPromise(500))\
      if (o.home.isPause()) then\
        return makeAction('PAUSE_PAUSE_CONTINUE')\
      else\
        return nil\
      end\
    elseif (action.type == 'PAUSE_PAUSE_CONTINUE') then\
      c.yield(sleepPromise(500))\
      if (o.home.isPause()) then\
        return makeAction('PAUSE_PAUSE_CONTINUE')\
      else\
        stepLabel.setStepLabelContent(store.pause.lasttext)\
        return nil\
      end\
    end\
\
    return nil\
  end))\
end\
\
return pause" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/network.lua"] = { path = "./missions/network.lua", name = "./missions/network.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
\
local store = require '../store'\
store.network = store.network or {}\
\
local moHome = require '../meta-operation/home'\
local moNetwork = require '../meta-operation/network'\
\
local o = {\
  home = moHome,\
  network = moNetwork,\
}\
\
local network = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'NETWORK_NETWORK_FAILURE_MODAL') then\
\
      stepLabel.setStepLabelContent('1-10.网络不通，点击确认')\
      store.network.networkFalureCount = store.network.networkFalureCount or 0\
      store.network.networkFalureCount = store.network.networkFalureCount + 1\
      if (store.network.networkFalureCount > 50) then\
        return makeAction('LOGIN_START_APP')\
      end\
      o.network.clickNetworkFailureModalOk()\
      c.yield(sleepPromise(2000))\
      local res = o.network.isNetworkFailureModal()\
      if (res) then\
        return makeAction('NETWORK_NETWORK_FAILURE_MODAL')\
      end\
      return ''\
\
    elseif (action.type == 'NETWORK_CHECK_NETWORK_MODAL') then\
\
      stepLabel.setStepLabelContent('1-11.检查您的网络，点击确认')\
      store.network.networkFalureCount = store.network.networkFalureCount or 0\
      store.network.networkFalureCount = store.network.networkFalureCount + 1\
      if (store.network.networkFalureCount > 50) then\
        return makeAction('LOGIN_START_APP')\
      end\
      o.network.clickCheckNetworkModalOk()\
      c.yield(sleepPromise(2000))\
      local res = o.network.isCheckNetworkModal()\
      if (res) then\
        return makeAction('NETWORK_CHECK_NETWORK_MODAL')\
      end\
      return ''\
    end\
\
    return nil\
  end))\
end\
\
return network" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/home.lua"] = { path = "./missions/home.lua", name = "./missions/home.lua", source = "local co = require '../lib/co'\
local c = coroutine\
local stepLabel = require '../utils/step-label'\
local makeAction = (require './utils').makeAction\
local sleepPromise = (require './utils').sleepPromise\
local setScreenListeners = (require './utils').setScreenListeners\
\
local store = require '../store'\
store.home = store.home or {}\
\
local moHome = require '../meta-operation/home'\
\
local o = {\
  home = moHome,\
}\
\
local home = function(action)\
  local settings = store.settings\
\
  return co(c.create(function()\
    if (action.type == 'HOME_HOME') then\
\
      return ''\
\
    elseif (action.type == 'HOME_MEDAL_MODAL') then\
\
      stepLabel.setStepLabelContent('1-2勋章取消')\
      o.home.clickMedalModalCancelBtn()\
      c.yield(sleepPromise(2000))\
      local res = o.home.isMedalModal()\
      if (res) then\
        return makeAction('HOME_MEDAL_MODAL')\
      end\
      return ''\
\
    elseif (action.type == 'HOME_NEWS_MODAL') then\
\
      stepLabel.setStepLabelContent('1-3.关闭新闻')\
      o.home.clickMewsModalClose()\
      c.yield(sleepPromise(2000))\
      local res = o.home.isNewsModal()\
      if (res) then\
        return makeAction('HOME_NEWS_MODAL')\
      end\
      return ''\
\
    elseif (action.type == 'HOME_SIGN_MODAL') then\
\
      stepLabel.setStepLabelContent('1-4.获取签到奖励')\
      local res = o.home.isSignModalHasReward()\
      if (res) then\
        stepLabel.setStepLabelContent('1-5.有奖励，点击获取')\
        o.home.clickSignModalGetReward()\
        stepLabel.setStepLabelContent('1-6.等待获取确认')\
        local newstateTypes = c.yield(setScreenListeners({\
          { 'HOME_SIGN_CONFIRM_MODAL', o.home.isSignConfirmModal },\
          { 'HOME_SIGN_MODAL', o.home.isSignModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('1-7.没有奖励')\
        o.home.clickSignModalClose()\
        c.yield(sleepPromise(2000))\
        local res = o.home.isSignModal()\
        if (res) then\
          return makeAction('HOME_SIGN_MODAL')\
        end\
        return ''\
      end\
\
    elseif (action.type == 'HOME_SIGN_CONFIRM_MODAL') then\
\
      stepLabel.setStepLabelContent('1-8.点击获取确认')\
      o.home.clickSignConfirmModalGetReward()\
      stepLabel.setStepLabelContent('1-9.等待获取签到奖励面板')\
      c.yield(sleepPromise(2000))\
      local newstateTypes = c.yield(setScreenListeners({\
        { 'HOME_SIGN_CONFIRM_MODAL', o.home.isSignConfirmModal, 2000 },\
        { 'HOME_SIGN_MODAL', o.home.isSignModal },\
      }))\
      return makeAction(newstateTypes)\
    end\
\
    return nil\
  end))\
end\
\
return home" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./utils/lfs.lua"] = { path = "./utils/lfs.lua", name = "./utils/lfs.lua", source = "local lfs = {}\
\
lfs.dir = function(path)\
  local res = io.popen('ls ' .. path);\
  local text = {};\
  for line in res:lines() do\
    table.insert(text, line)\
  end\
  return text\
end\
\
lfs.rm = function(path)\
  local res = io.popen('rm ' .. path);\
  local text = {};\
  for line in res:lines() do\
    table.insert(text, line)\
  end\
  local res = table.concat(text, '\\n')\
  return res\
end\
\
lfs.rmdir = function(path)\
  local res = io.popen('rm -rf' .. path);\
  local text = {};\
  for line in res:lines() do\
    table.insert(text, line)\
  end\
  local res = table.concat(text, '\\n')\
  return res\
end\
\
return lfs" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./store.lua"] = { path = "./store.lua", name = "./store.lua", source = "return {}" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./options-label.lua"] = { path = "./options-label.lua", name = "./options-label.lua", source = "local json = require './lib/json'\
local stepLabel = require './utils/step-label'\
\
local width, height = getScreenSize()\
\
-- 从name提取路径\
local nameToTablePath = function(name)\
  local tablePath = {}\
  local tmp = name\
  while tmp and tmp ~= '' do\
    if tmp:match('^%[') then\
      local res = tmp:match('^%[([^%]]*)%]')\
      local num = tonumber(res)\
      table.insert(tablePath, num and num or res)\
      tmp = tmp:gsub('^%[[^%]]*%]', '')\
    elseif tmp:match('^%.') then\
      table.insert(tablePath, '')\
      tmp = tmp:gsub('^%.', '')\
    else\
      table.insert(tablePath, tmp:match('^[^%[^%]^%.]*'))\
      tmp = tmp:gsub('^[^%[^%]^%.]*', ''):gsub('^[%.]', '')\
    end\
  end\
  return tablePath\
end\
\
-- 根据路径在 table 中添加一个值\
local setValue = function(tab, thePath, value)\
  thePath = thePath or {}\
  if type(thePath) == 'string' then\
    thePath = nameToTablePath(thePath)\
  end\
  local headPoint = tab\
  for k, v in ipairs(thePath) do\
    if k < #thePath then\
      headPoint[v] = headPoint[v] or {}\
      headPoint = headPoint[v]\
    else\
      headPoint[v] = value\
    end\
  end\
  return tab\
end\
\
-- 设置\
return function()\
  local settingTable = {\
    ['style'] = 'default',\
    ['width'] = height,\
    ['height'] = height,\
    ['config'] = 'save_warship-girls-r-script.dat',\
    ['timer'] = 5,\
    ['orient'] = 1,\
    ['pagetype'] = 'multi',\
    ['title'] = '选项',\
    ['cancelname'] = '取消',\
    ['okname'] = '开始',\
    ['rettype'] = 'table',\
    ['pages'] = {\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '第一次设置建议在竖屏下设置，设置好后再切换到游戏界面',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '向左滑动查看其他选项',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '任务',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'missionEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = '开启,关闭',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '远征',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = '开启,关闭',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '出征',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = '开启,关闭',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '修理',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'repairEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = '开启,关闭',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '解体',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'disintegrateShipEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = '开启,关闭',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '演习',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = '开启,关闭',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '战役',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = '开启,关闭',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '每一轮的间隔时间(秒)',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'missionsInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = '最短间隔时间(秒)',\
          ['text'] = '15',\
          ['kbtype'] = 'number',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '多长时间画面不变则重启游戏(秒)最少60秒',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'restartInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = '多长时间画面不变则重启游戏(秒)最少60秒',\
          ['text'] = '120',\
          ['kbtype'] = 'number',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '使用震动方式提醒',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'alertUseVibrate',\
          ['type'] = 'RadioGroup',\
          ['list'] = '开启,关闭',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '使用pushbullet推送提醒(开启后必须填写token)',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'alertUsePushbullet',\
          ['type'] = 'RadioGroup',\
          ['list'] = '开启,关闭',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'pushbullet的token',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'pushbulletsToken',\
          ['type'] = 'Edit',\
          ['prompt'] = 'token',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '设备别名，显示在pushbullet中',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'pushbulletNickname',\
          ['type'] = 'Edit',\
          ['prompt'] = '别名',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = ' \\n \\n \\n \\n \\n \\n \\n \\n \\n \\n',\
          ['size'] = 50,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '远征设置',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '使用快修',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionQuickRepair',\
          ['type'] = 'RadioGroup',\
          ['list'] = '不满血,中破,大破,不使用',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '不能远征则报警',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionAlertWhenNoHp',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '自动参加的远征章节',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '5队',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionFleet1',\
          ['type'] = 'RadioGroup',\
          ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',\
          ['select'] = '2',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '6队',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionFleet2',\
          ['type'] = 'RadioGroup',\
          ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',\
          ['select'] = '3',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '7队',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionFleet3',\
          ['type'] = 'RadioGroup',\
          ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',\
          ['select'] = '5',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '8队',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionFleet4',\
          ['type'] = 'RadioGroup',\
          ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',\
          ['select'] = '6',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = ' \\n \\n \\n \\n \\n \\n \\n \\n \\n \\n',\
          ['size'] = 50,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '演习设置',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '舰队',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseFleet',\
          ['type'] = 'RadioGroup',\
          ['list'] = '1队,2队,3队,4队',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '追击',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exercisePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '快修',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseQuickRepair',\
          ['type'] = 'RadioGroup',\
          ['list'] = '不满血,中破,大破,不使用',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '单纵,复纵,轮型,梯形,单横',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '间隔多长时间检查一次',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = '间隔多长时间检查一次',\
          ['text'] = '900',\
          ['kbtype'] = 'number',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = ' \\n \\n \\n \\n \\n \\n \\n \\n \\n \\n',\
          ['size'] = 50,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
      },\
\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '战役设置',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '关卡',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignChapter',\
          ['type'] = 'RadioGroup',\
          ['list'] = '驱逐,巡洋,战列,航母,潜艇',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '难度',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignDifficulty',\
          ['type'] = 'RadioGroup',\
          ['list'] = '普通,困难',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '追击',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignPursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '快修',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignQuickRepair',\
          ['type'] = 'RadioGroup',\
          ['list'] = '不满血,中破,大破,不使用',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '不能出征则报警',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignAlertWhenCantBattle',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '单纵,复纵,轮型,梯形,单横',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '间隔多长时间检查一次',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = '间隔多长时间检查一次',\
          ['text'] = '900',\
          ['kbtype'] = 'number',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = ' \\n \\n \\n \\n \\n \\n \\n \\n \\n \\n',\
          ['size'] = 50,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
      },\
\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '修理设置',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '修理目标',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'repairAll',\
          ['type'] = 'RadioGroup',\
          ['list'] = '所有,不在舰队里的',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '间隔多长时间检查一次',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'repairInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = '间隔多长时间检查一次',\
          ['text'] = '1800',\
          ['kbtype'] = 'number',\
        },\
      },\
\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '解体设置',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '快速解体模式',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'disintegrateShipFastMode',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '间隔多长时间检查一次',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'disintegrateShipInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = '间隔多长时间检查一次',\
          ['text'] = '1800',\
          ['kbtype'] = 'number',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = ' \\n \\n \\n \\n \\n \\n \\n \\n \\n \\n',\
          ['size'] = 50,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '出征设置',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '章节',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleChapter',\
          ['type'] = 'RadioGroup',\
          ['list'] = '1-1,1-2,1-3,1-4,1-5,2-1,2-2,2-3,2-4,2-5,2-6,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,5-5,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4,7-5',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '舰队',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleFleet',\
          ['type'] = 'RadioGroup',\
          ['list'] = '1队,2队,3队,4队',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '使用快修',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleQuickRepair',\
          ['type'] = 'RadioGroup',\
          ['list'] = '不满血,中破,大破,不使用',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '迂回',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleRoundabout',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '不能出征则报警',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleAlertWhenNoHp',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '最多几战',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleMaxBattleNum',\
          ['type'] = 'RadioGroup',\
          ['list'] = '1,2,3,4,5,6',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '特殊功能',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '6-1a点遇到航母SL',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleRebootAt6_1AMeetCV',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '6-1a点遇到雷巡SL',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleRebootAt6_1AMeetCit',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '没遇到补给就SL（捞胖次）',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleRebootAtNotMeetAP',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '战斗选项',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '战斗选项使用统一配置',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOptionUseMain',\
          ['type'] = 'RadioGroup',\
          ['list'] = '统一配置(在本页配置),单独配置(在后面的页面配置)',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[main]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '单纵,复纵,轮型,梯形,单横',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '遇到潜艇自动切换单横阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[main]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '追击',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[main]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '第1战 -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[1]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '单纵,复纵,轮型,梯形,单横',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '遇到潜艇自动切换单横阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[1]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '追击',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[1]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '第2战 -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[2]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '单纵,复纵,轮型,梯形,单横',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '遇到潜艇自动切换单横阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[2]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '追击',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[2]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '第3战 -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[3]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '单纵,复纵,轮型,梯形,单横',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '遇到潜艇自动切换单横阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[3]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '追击',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[3]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '第4战 -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[4]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '单纵,复纵,轮型,梯形,单横',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '遇到潜艇自动切换单横阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[4]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '追击',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[4]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '第5战 -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[5]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '单纵,复纵,轮型,梯形,单横',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '遇到潜艇自动切换单横阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[5]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '追击',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[5]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = '第6战 -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[6]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '单纵,复纵,轮型,梯形,单横',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '遇到潜艇自动切换单横阵型',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[6]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '追击',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[6]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = '是,否',\
          ['select'] = '1',\
        },\
      },\
    },\
  }\
\
  local settingTableStr = json.encode(settingTable);\
  local ret, settings = showUI(settingTableStr);\
  if (ret ~= 1) then\
    stepLabel.setStepLabelContent('取消运行')\
    mSleep(100000)\
    lua_exit()\
  end\
  stepLabel.setStepLabelContent('正在载入...')\
  -- --转换settings结果\
  function transStrToTable(str)\
    local list = {}\
    local strArr = {}\
    if (type(str) == 'string') then\
      strArr = strSplit(str, ',')\
    elseif (type(str) == 'table') then\
      strArr = str\
    end\
    for i = 1, #strArr do\
      local v = strArr[i]\
      list['' .. (i - 1)] = v\
    end\
    return list\
  end\
\
  -- 出征\
  settings.battleEnable = (function(battleEnable)\
    local list = transStrToTable({ true, false, })\
    return list[battleEnable] or false\
  end)(settings.battleEnable)\
  -- 修理\
  settings.repairEnable = (function(repairEnable)\
    local list = transStrToTable({ true, false, })\
    return list[repairEnable] or false\
  end)(settings.repairEnable)\
  -- 解体\
  settings.disintegrateShipEnable = (function(disintegrateShipEnable)\
    local list = transStrToTable({ true, false, })\
    return list[disintegrateShipEnable] or false\
  end)(settings.disintegrateShipEnable)\
  -- 任务\
  settings.missionEnable = (function(missionEnable)\
    local list = transStrToTable({ true, false, })\
    return list[missionEnable] or false\
  end)(settings.missionEnable)\
  -- 远征\
  settings.expeditionEnable = (function(expeditionEnable)\
    local list = transStrToTable({ true, false, })\
    return list[expeditionEnable] or false\
  end)(settings.expeditionEnable)\
  -- 演习\
  settings.exerciseEnable = (function(exerciseEnable)\
    local list = transStrToTable({ true, false, })\
    return list[exerciseEnable] or false\
  end)(settings.exerciseEnable)\
  -- 战役\
  settings.campaignEnable = (function(campaignEnable)\
    local list = transStrToTable({ true, false, })\
    return list[campaignEnable] or false\
  end)(settings.campaignEnable)\
  -- 总循环间隔时间\
  settings.missionsInterval = tonumber(settings.missionsInterval) or 0\
  -- 多长时间界面不变则重启，最少60秒\
  settings.restartInterval = tonumber(settings.restartInterval) or 120\
  settings.restartInterval = math.max(settings.restartInterval, 60)\
  -- 使用震动提醒\
  settings.alertUseVibrate = (function(alertUseVibrate)\
    local list = transStrToTable({ true, false, })\
    return list[alertUseVibrate] or false\
  end)(settings.alertUseVibrate)\
  -- 使用pushbullet推送提醒\
  settings.alertUsePushbullet = (function(alertUsePushbullet)\
    local list = transStrToTable({ true, false, })\
    return list[alertUsePushbullet] or false\
  end)(settings.alertUsePushbullet)\
  -- pushbullet的token\
  settings.pushbulletsToken = settings.pushbulletsToken or ''\
  -- pushbullet的设备别名\
  settings.pushbulletNickname = settings.pushbulletNickname or ''\
\
  -- 选择远征要参加的章节\
  settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 = (function(fleet1, fleet2, fleet3, fleet4)\
    local list = transStrToTable({\
      false, '1-1', '1-2', '1-3', '1-4',\
      '2-1', '2-2', '2-3', '2-4',\
      '3-1', '3-2', '3-3', '3-4',\
      '4-1', '4-2', '4-3', '4-4',\
      '5-1', '5-2', '5-3', '5-4',\
      '6-1', '6-2', '6-3', '6-4',\
      '7-1', '7-2', '7-3', '7-4',\
    })\
    return (list[fleet1] or false), (list[fleet2] or false), (list[fleet3] or false), (list[fleet4] or false)\
  end)(settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4)\
  settings.expeditionFleetToChapter = { settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 }\
  -- 远征是否使用快速修理\
  settings.expeditionQuickRepair = (function(expeditionQuickRepair)\
    -- '不满血,中破,大破,不使用'\
    local list = transStrToTable({ 3, 2, 1, 0 })\
    return list[expeditionQuickRepair] or 2\
  end)(settings.expeditionQuickRepair)\
  -- 当无法远征时是否报警\
  settings.expeditionAlertWhenNoHp = (function(expeditionAlertWhenNoHp)\
    local list = transStrToTable({ true, false, })\
    return list[expeditionAlertWhenNoHp] or false\
  end)(settings.expeditionAlertWhenNoHp)\
  -- 选择关卡\
  settings.battleChapter = (function(battleChapter)\
    local list = transStrToTable({\
      '1-1', '1-2', '1-3', '1-4', '1-5',\
      '2-1', '2-2', '2-3', '2-4', '2-5', '2-6',\
      '3-1', '3-2', '3-3', '3-4',\
      '4-1', '4-2', '4-3', '4-4',\
      '5-1', '5-2', '5-3', '5-4', '5-5',\
      '6-1', '6-2', '6-3', '6-4',\
      '7-1', '7-2', '7-3', '7-4', '7-5'\
    })\
    return list[battleChapter] or '1-1'\
  end)(settings.battleChapter)\
  -- 选择舰队\
  settings.battleFleet = (function(battleFleet)\
    local list = transStrToTable({ 1, 2, 3, 4, })\
    return list[battleFleet] or 1\
  end)(settings.battleFleet)\
  -- 是否使用快速修理\
  settings.battleQuickRepair = (function(battleQuickRepair)\
    -- '不满血,中破,大破,不使用'\
    local list = transStrToTable({ 3, 2, 1, 0 })\
    return list[battleQuickRepair] or 2\
  end)(settings.battleQuickRepair)\
  -- 迂回战术\
  settings.battleRoundabout = (function(battleRoundabout)\
    local list = transStrToTable({ true, false, })\
    return list[battleRoundabout] or false\
  end)(settings.battleRoundabout)\
  -- 当无法出征时是否跳过出征\
  settings.battleAlertWhenNoHp = (function(battleAlertWhenNoHp)\
    local list = transStrToTable({ true, false, })\
    return list[battleAlertWhenNoHp] or false\
  end)(settings.battleAlertWhenNoHp)\
  -- 出征最大战斗次数\
  settings.battleMaxBattleNum = (function(battleMaxBattleNum)\
    local list = transStrToTable({ 1, 2, 3, 4, 5, 6 })\
    return list[battleMaxBattleNum] or 1\
  end)(settings.battleMaxBattleNum)\
  -- 阵型\
  settings.battleFormation = (function(battleFormation)\
    local list = transStrToTable({ 1, 2, 3, 4, 5 })\
    return list[battleFormation] or 2\
  end)(settings.battleFormation)\
  -- 6-1a点遇到航母SL\
  settings.battleRebootAt6_1AMeetCV = (function(battleRebootAt6_1AMeetCV)\
    local list = transStrToTable({ true, false })\
    return list[battleRebootAt6_1AMeetCV] or false\
  end)(settings.battleRebootAt6_1AMeetCV)\
  -- 6-1a点遇到雷巡SL\
  settings.battleRebootAt6_1AMeetCit = (function(battleRebootAt6_1AMeetCit)\
    local list = transStrToTable({ true, false })\
    return list[battleRebootAt6_1AMeetCit] or false\
  end)(settings.battleRebootAt6_1AMeetCit)\
  -- 没遇到补给就SL（捞胖次）\
  settings.battleRebootAtNotMeetAP = (function(battleRebootAtNotMeetAP)\
    local list = transStrToTable({ true, false })\
    return list[battleRebootAtNotMeetAP] or false\
  end)(settings.battleRebootAtNotMeetAP)\
  -- 使用统一战斗配置\
  settings.battleOptionUseMain = (function(battleOptionUseMain)\
    local list = transStrToTable({ true, false })\
    return list[battleOptionUseMain] or false\
  end)(settings.battleOptionUseMain)\
\
  -- 演习\
  -- 选择舰队\
  settings.exerciseFleet = (function(exerciseFleet)\
    local list = transStrToTable({ 1, 2, 3, 4, })\
    return list[exerciseFleet] or 1\
  end)(settings.exerciseFleet)\
  -- 是否追击\
  settings.exercisePursue = (function(exercisePursue)\
    local list = transStrToTable({ true, false, })\
    return list[exercisePursue] or false\
  end)(settings.exercisePursue)\
  -- 是否使用快速修理\
  settings.exerciseQuickRepair = (function(exerciseQuickRepair)\
    -- '不满血,中破,大破,不使用'\
    local list = transStrToTable({ 3, 2, 1, 0 })\
    return list[exerciseQuickRepair] or 2\
  end)(settings.exerciseQuickRepair)\
  -- 阵型\
  settings.exerciseFormation = (function(exerciseFormation)\
    local list = transStrToTable({ 1, 2, 3, 4, 5 })\
    return list[exerciseFormation] or 2\
  end)(settings.exerciseFormation)\
  -- 间隔时间，最小0秒\
  settings.exerciseInterval = tonumber(settings.exerciseInterval) or 0\
  settings.exerciseInterval = math.max(0, settings.exerciseInterval)\
\
  -- 战役\
  -- 选择关卡\
  settings.campaignChapter = (function(campaignChapter)\
    local list = transStrToTable({ 1, 2, 3, 4, 5 })\
    return list[campaignChapter] or 1\
  end)(settings.campaignChapter)\
  -- 选择难度\
  settings.campaignDifficulty = (function(campaignDifficulty)\
    local list = transStrToTable({ 'default', 'hard' })\
    return list[campaignDifficulty] or 'default'\
  end)(settings.campaignDifficulty)\
  -- 是否追击\
  settings.campaignPursue = (function(campaignPursue)\
    local list = transStrToTable({ true, false, })\
    return list[campaignPursue] or false\
  end)(settings.campaignPursue)\
  -- 是否使用快速修理\
  settings.campaignQuickRepair = (function(campaignQuickRepair)\
    -- '不满血,中破,大破,不使用'\
    local list = transStrToTable({ 3, 2, 1, 0 })\
    return list[campaignQuickRepair] or 2\
  end)(settings.campaignQuickRepair)\
  -- 不能出征则报警\
  settings.campaignAlertWhenCantBattle = (function(campaignAlertWhenCantBattle)\
    local list = transStrToTable({ true, false, })\
    return list[campaignAlertWhenCantBattle] or false\
  end)(settings.campaignAlertWhenCantBattle)\
  -- 阵型\
  settings.campaignFormation = (function(campaignFormation)\
    local list = transStrToTable({ 1, 2, 3, 4, 5 })\
    return list[campaignFormation] or 2\
  end)(settings.campaignFormation)\
  -- 修理\
  -- 是否修理所有船\
  settings.repairAll = (function(repairAll)\
    local list = transStrToTable({ true, false, })\
    return list[repairAll] or false\
  end)(settings.repairAll)\
  -- 多长时间修理一次\
  settings.repairInterval = tonumber(settings.repairInterval) or 0\
  -- 解体\
  -- 快速解体模式\
  settings.disintegrateShipFastMode = (function(disintegrateShipFastMode)\
    local list = transStrToTable({ true, false, })\
    return list[disintegrateShipFastMode] or false\
  end)(settings.disintegrateShipFastMode)\
  -- 多长时间解体一次\
  settings.disintegrateShipInterval = tonumber(settings.disintegrateShipInterval) or 0\
\
  -- 战斗选项组合成数组\
  settings.battleOption = (function(settings)\
    local battleOption = {}\
    for key, value in pairs(settings) do\
      local thePath = nameToTablePath(key)\
      if thePath[1] == 'battleOption' then\
        local tmpPath = table.assign({}, thePath)\
        table.remove(tmpPath, 1)\
        if thePath[2] == 'main' or not settings.battleOptionUseMain then\
          if thePath[3] == 'battleFormation' then\
            local res = transStrToTable({ 1, 2, 3, 4, 5 })[value] or 2\
            setValue(battleOption, tmpPath, res)\
          elseif thePath[3] == 'battlePursue' then\
            local res = transStrToTable({ true, false })[value] or false\
            setValue(battleOption, tmpPath, res)\
          else\
            setValue(battleOption, tmpPath, value)\
          end\
        end\
      end\
    end\
    return battleOption\
  end)(settings)\
\
  return ret, settings\
  -- --转换settings结果\
end" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./utils/step-label.lua"] = { path = "./utils/step-label.lua", name = "./utils/step-label.lua", source = "local StepLable = {\
  originText = '',\
  text = '',\
  labelId = '',\
  prefix = '',\
}\
\
local fontSize = 16\
local tsver = getTSVer(); --获取触动精灵引擎版本\
local tsint = tonumber(string.sub(tsver, 1, 1) .. string.sub(tsver, 3, 3) .. string.sub(tsver, 5, 5));\
--转化为数字版本号\
if tsint >= 170 then\
  fontSize = 7\
end\
\
if tsint < 230 then\
  fwShowWnd('steplabel', 650, 50, 300, 100, 0)\
else\
  fwShowWnd('steplabel', 650, 50, 950, 150, 0)\
end\
\
StepLable.init = function(labelId)\
  StepLable.labelId = labelId\
  return StepLable\
end\
\
StepLable.setPrefix = function(prefix)\
  StepLable.prefix = prefix\
  local finalText = StepLable.prefix .. StepLable.text\
  fwShowButton('steplabel', StepLable.labelId, finalText, '90333333', '90FFFFFF', '', fontSize, 0, 0, 300, 100)\
  return StepLable\
end\
\
StepLable.setStepLabelContent = function(text, noNLog)\
  StepLable.originText = text\
  if ((type(runCount) == 'number') or (type(runCode) == 'string')) then\
    text = tostring(runCount) .. '.. ' .. text\
  end\
  StepLable.text = text\
  local finalText = StepLable.prefix .. text\
  fwShowButton('steplabel', StepLable.labelId, finalText, '90333333', '90FFFFFF', '', 7, 0, 0, 300, 100)\
  local dateStr = os.date('%Y-%m-%d %X')\
  if not noNLog then\
    local info = debug.getinfo(2, 'Sl')\
    local lineInfo = ''\
    if info.currentline then\
      lineInfo = info.source .. ': ' .. info.currentline .. ': '\
    end\
    wLog('azur_lane', '[DATE] ' .. lineInfo .. finalText);\
  end\
  if useNlog then\
    local info = debug.getinfo(2, 'Sl')\
    local lineInfo = ''\
    if info.currentline then\
      lineInfo = info.source .. ': ' .. info.currentline .. ':\\n'\
    end\
    nLog(lineInfo .. dateStr .. ' ' .. finalText .. '\\n')\
  end\
end\
\
\
StepLable.getText = function()\
  return StepLable.originText\
end\
\
return StepLable\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./missions/index.lua"] = { path = "./missions/index.lua", name = "./missions/index.lua", source = "local home = require './home'\
local network = require './network'\
local pause = require './pause'\
local login = require './login'\
local battle = require './battle'\
local mission = require './mission'\
local disintegrateShip = require './disintegrate-ship'\
local expeditionReward = require './expedition-reward'\
local expedition = require './expedition'\
local repair = require './repair'\
local exercise = require './exercise'\
local campaign = require './campaign'\
\
-- 将分散在各个文件的任务集合到一起\
local missions = {\
  home,\
  network,\
  pause,\
  login,\
  battle,\
  mission,\
  disintegrateShip,\
  expeditionReward,\
  expedition,\
  repair,\
  exercise,\
  campaign,\
}\
\
return missions" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./lib/mission-chain.lua"] = { path = "./lib/mission-chain.lua", name = "./lib/mission-chain.lua", source = "local socket = require 'socket'\
local co = require './co'\
local c = coroutine\
\
return {\
  createChain = function(missionStoreList)\
    assert(type(missionStoreList) == 'table', ' bad argument # 1 \"createChain\"(table excepted, got ' .. type(missionStoreList) .. ')')\
\
    local defaultOptions = {\
      runCount = 0,\
      missionsQuery = {},\
      beforeAction = function() end,\
      afterAction = function() end,\
    }\
    local chainObj\
    chainObj = {\
      runMission = function(options)\
        options = options or {}\
        options.runCount = options.runCount or defaultOptions.runCount\
        options.missionsQuery = options.missionsQuery or defaultOptions.missionsQuery\
        options.beforeAction = options.beforeAction or defaultOptions.beforeAction\
        options.afterAction = options.afterAction or defaultOptions.afterAction\
\
        local runStartTime = socket.gettime() * 1000\
        local missionsQuery = {}\
        table.insert(missionsQuery, { isBase = true, isStart = true })\
        for key = 1, #options.missionsQuery do\
          table.insert(missionsQuery, options.missionsQuery[key])\
        end\
        table.insert(missionsQuery, { isBase = true, isEnd = true })\
\
        while (#missionsQuery > 0 and not luaExisted) do\
          local action = missionsQuery[1]\
\
          if (action.isStart) then\
            runStartTime = socket.gettime() * 1000\
          end\
\
          c.yield(options.beforeAction({\
            action = action,\
            missionsQuery = missionsQuery,\
            runCount = options.runCount,\
            runStartTime = runStartTime,\
          }))\
\
          -- 如果是队列原有任务则将其加入队列末尾，以保证能一直循环\
          -- 如果是从原有任务衍生的下一步任务，则不加入队列末尾，会被新的下一步任务替换或者删除\
          if (action.isBase) then\
            table.insert(missionsQuery, action)\
          end\
\
          -- 执行一个 action\
          if action.type then\
            local nextAction = c.yield(chainObj.next(action))\
            if type(nextAction) == 'table' and type(nextAction[1]) == 'table' and nextAction[1].type then\
              -- 返回的是 action 列表，将列表插入到 missionsQuery 的开头\
              table.remove(missionsQuery, 1)\
              for key = #nextAction, 1, -1 do\
                table.insert(missionsQuery, 1, nextAction[key])\
              end\
            elseif type(nextAction) == 'table' and nextAction.type then\
              -- 返回的是单个 action\
              if nextAction.addToStart then\
                table.insert(missionsQuery, 1, nextAction)\
              else\
                missionsQuery[1] = nextAction\
              end\
            else\
              table.remove(missionsQuery, 1)\
            end\
          else\
            table.remove(missionsQuery, 1)\
          end\
\
          c.yield(options.afterAction({\
            action = action,\
            nextAction = missionsQuery[1],\
            missionsQuery = missionsQuery,\
            runCount = options.runCount,\
            runStartTime = runStartTime,\
          }))\
\
          if (action.isEnd) then\
            options.runCount = options.runCount + 1\
          end\
\
          -- 如果是任务队列结尾标志，则count+1\
        end\
      end,\
      next = function(action)\
        if type(action) ~= 'table' then\
          error(' bad argument # 1 \"next\"(table excepted, got ' .. type(action) .. ')', 2)\
        end\
        return co(c.create(function()\
          if action.type and action.type ~= '' then\
            local nextAction\
            for key = 1, #missionStoreList do\
              local item = missionStoreList[key]\
              local theAction = c.yield(item(action))\
              if theAction then\
                nextAction = theAction\
              end\
            end\
            if not nextAction then\
              error('Action \"' .. action.type .. '\" not found')\
            end\
            return nextAction\
          end\
        end))\
      end,\
    }\
    return chainObj\
  end,\
}\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./lib/co.lua"] = { path = "./lib/co.lua", name = "./lib/co.lua", source = "-----------------------------------------------------------------------------\
-- ES6 co lib in lua 5.1\
-- Author: fgfg163@163.com\
-- Copyright (c) 2015.11\
--\
-- This is a lib porting from Co v4 in JavaScript\
-- It has some different before.\
-- to see https://github.com/tj/co\
-- Useage:\
-- co(coroutine.create(function()\
-- local v1 = coroutine.yield(Promise.resolve(123))\
-- local v2 = coroutine.yield({\
-- a = Promise.resolve(234),\
-- b = Promise.resolve(456),\
-- })\
-- console.log(v1)\
-- console.log(v2)\
-- end)):catch(function(err)\
-- print(err)\
-- end)\
\
-----------------------------------------------------------------------------\
\
\
local Promise = Promise\
\
if type(Promise) ~= 'table' then\
  error('Co need Promise module to work. Please add \\'Promise\\' and require it.', 2)\
end\
\
local unpack = unpack or table.unpack\
local isArray = table.isArray or function(tab)\
  if (type(tab) ~= \"table\") then\
    return false\
  end\
  local length = #tab\
  for k, v in pairs(tab) do\
    if ((type(k) ~= \"number\") or (k > length)) then\
      return false\
    end\
  end\
  return true\
end\
function tryCatch(cb)\
  return xpcall(cb, function(e)\
    return setStackTraceback and\
      (e .. '\\n' .. debug.traceback())\
      or (e)\
  end)\
end\
\
----------------------------------------------------------------------\
function new(gen, ...)\
  return Promise.new(function(resolve, reject)\
    if (type(gen) == 'function') then gen = coroutine.create(gen) end\
    if (type(gen) ~= 'thread') then return resolve(gen) end\
\
    local onResolved, onRejected, next\
\
    onResolved = function(res)\
      local done, ret\
      local coStatus = true\
      local xpcallRes, xpcallErr = tryCatch(function()\
        coStatus, ret = coroutine.resume(gen, res)\
      end)\
      if (not xpcallRes) then\
        return reject(xpcallErr)\
      end\
      if (not coStatus) then\
        return reject(ret)\
      end\
      done = (coroutine.status(gen) == 'dead')\
      next(done, ret)\
    end\
\
    onRejected = function(err)\
      local done, ret\
      local coStatus = true\
      local xpcallRes, xpcallErr = tryCatch(function()\
        coStatus, ret = coroutine.resume(gen, error(tostring(err)))\
      end)\
      if (not xpcallRes) then\
        return reject(xpcallErr)\
      end\
      if (not coStatus) then\
        return reject(xpcallErr)\
      end\
      done = (coroutine.status(gen) == 'dead')\
      next(done, ret)\
    end\
\
    next = function(done, ret)\
      if (done) then\
        return resolve(ret)\
      end\
      local value = toPromise(ret)\
      if (value and (isPromise(value))) then\
        return value.andThen(onResolved, onRejected)\
      end\
      return onResolved(value)\
      --       onRejected(error('You may only yield a function, promise, generator, array, or object, '\
      --          .. 'but the following object was passed: \"' .. type(ret) .. '\"'))\
    end\
\
    onResolved();\
  end)\
end\
\
\
-- Convert a `yield`ed value into a promise.\
--\
-- @param {Mixed} obj\
-- @return {Promise}\
-- @api private\
function toPromise(obj)\
  if (not obj) then return obj end\
\
  if (isPromise(obj)) then return obj end\
  if (isCoroutine(obj)) then return new(obj) end\
  if (type(obj) == 'function') then return thunkToPromise(obj) end\
\
  if (isArray(obj)) then\
    return arrayToPromise(obj)\
  elseif (type(obj) == 'table') then\
    return objectToPromise(obj)\
  end\
\
  return obj\
end\
\
-- Check if `obj` is a promise.\
--\
-- @param {Object} obj\
-- @return {Boolean}\
-- @api private\
function isPromise(obj)\
  if ((type(obj) == 'table') and (type(obj.andThen) == 'function')) then\
    return true\
  end\
  return false\
end\
\
-- Check if `obj` is a generator.\
--\
-- @param {Mixed} obj\
-- @return {Boolean}\
-- @api private\
function isCoroutine(obj)\
  if (type(obj) == 'thread') then\
    return true\
  end\
  return false\
end\
\
\
-- Convert a thunk to a promise.\
--\
-- @param {Function}\
-- @return {Promise}\
-- @api private\
function thunkToPromise(fn)\
  return Promise.new(function(resolve, reject)\
    fn(function(err, res)\
      if (err) then return reject(err) end\
      if (#res > 2) then\
        res = { res[2] }\
      end\
      resolve(res)\
    end)\
  end)\
end\
\
-- Convert an array of \"yieldables\" to a promise.\
-- Uses `Promise.all()` internally.\
--\
-- @param {Array} obj\
-- @return {Promise}\
-- @api private\
function arrayToPromise(obj)\
  local newArr = {}\
  for k, v in ipairs(obj) do\
    table.insert(newArr, toPromise(v))\
  end\
  return Promise.all(newArr);\
end\
\
-- Convert an object of \"yieldables\" to a promise.\
-- Uses `Promise.all()` internally.\
--\
-- @param {Object} obj\
-- @return {Promise}\
-- @api private\
function objectToPromise(obj)\
  local results = {}\
  local promises = {}\
\
  local function defer(promise, key)\
    results[key] = nil\
    table.insert(promises, promise.andThen(function(res)\
      results[key] = res\
    end))\
  end\
\
  for key, value in pairs(obj) do\
    local promise = toPromise(value)\
    if (promise and isPromise(promise)) then\
      defer(promise, key)\
    else\
      results[key] = obj[key]\
    end\
  end\
\
  return Promise.all(promises).andThen(function()\
    return results\
  end)\
end\
\
\
\
return setmetatable({\
  new = new,\
  Promise = Promise,\
}, {\
  __call = function(_, ...)\
    return new(...)\
  end\
})\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./lib/promise.lua"] = { path = "./lib/promise.lua", name = "./lib/promise.lua", source = "--------------------------------------------------------------------------------------\
-- es2015 Promise for lua 5.1 and 5.2\
\
--------------------------------------------------------------------------------------\
local PENDING = 0\
local RESOLVED = 1\
local REJECTED = 2\
\
-- 是否需要显示stack traceback里的错误信息\
-- stack traceback错误信息很长，所以这个功能作为可选项\
local stackTraceback = false\
-- 封装了xpcall方法\
function tryCatch(cb)\
  return xpcall(cb, function(e)\
    return stackTraceback and\
      (e .. '\\n' .. debug.traceback())\
      or (e)\
  end)\
end\
\
-- 绑定self到某个方法\
function bindSelf(fn, self)\
  return function(...)\
    return fn(self, ...)\
  end\
end\
\
-- 隔离函数，为了防止回调过多导致爆栈需要隔离回调操作\
function asap(callback)\
  local co = coroutine.wrap(callback)\
  co()\
end\
\
-- 类\
local Promise = {\
  setStackTraceback = function(value)\
    stackTraceback = value\
  end\
}\
\
-- 类方法 （静态方法）\
function Promise.new(resolver)\
  if (type(resolver) ~= 'function') then\
    error('Promise resolver ' .. type(resolver) .. ' is not a function')\
  end\
\
  local newPromise = {\
    PromiseStatus = PENDING,\
    PromiseValue = nil,\
    deferreds = {},\
  }\
  -- promise的主要方法，这么写是为了绑定self\
  newPromise.andThen = bindSelf(andThen, newPromise)\
  newPromise.catch = bindSelf(catch, newPromise)\
\
  -- 执行传入promise的方法\
  resolver(bindSelf(resolve, newPromise), bindSelf(reject, newPromise))\
\
  return newPromise\
end\
\
function Promise.isPromise(obj)\
  return (type(obj) == 'table') and type(obj.andThen) == 'function'\
end\
\
--- - Promise.resolve方法相当于实例化一个Promise对象，状态变为RESOLVED\
function Promise.resolve(value)\
  if (Promise.isPromise(value)) then return value end\
  return Promise.new(function(resolve, reject)\
    resolve(value)\
  end)\
end\
\
--- - Promise.reject方法相当于实例化一个Promise对象，状态变为REJECTED\
function Promise.reject(value)\
  return Promise.new(function(resolve, reject)\
    reject(value)\
  end)\
end\
\
function Promise.all(args)\
  if (type(args) ~= 'table') then args = {} end\
  return Promise.new(function(resolve, reject)\
    if (#args == 0) then return resolve({}) end\
    local remaining = #args\
    local function getRes(k, value)\
      if (Promise.isPromise(value)) then\
        value.andThen(function(res)\
          getRes(k, res)\
        end, function(err)\
          reject(err)\
        end)\
        return\
      end\
\
      args[k] = value\
      remaining = remaining - 1\
      if (remaining == 0) then\
        resolve(args)\
      end\
    end\
\
    for k = 1, #args do\
      getRes(k, args[k])\
    end\
  end)\
end\
\
function Promise.race(args)\
  if (type(args) ~= 'table') then args = {} end\
  return Promise.new(function(resolve, reject)\
    for k = 1, #args do\
      local value = args[k]\
      Promise.resolve(value).andThen(resolve, reject)\
    end\
  end)\
end\
\
-- 对象方法\
function resolve(self, value)\
  local xpcallRes, xpcallErr = tryCatch(function()\
    if (Promise.isPromise(value)) then\
      doResolve(self, value.andThen, resolve, reject)\
      return\
    end\
    self.PromiseStatus = RESOLVED\
    self.PromiseValue = value\
    finale(self)\
  end)\
  if (not xpcallRes) then\
    reject(self, xpcallErr)\
  end\
end\
\
function reject(self, value)\
  value = value or ''\
  self.PromiseStatus = REJECTED\
  self.PromiseValue = value\
  if (stackTraceback and (not string.find(value, '\\n'))) then\
    self.PromiseValue = value .. '\\n' .. debug.traceback()\
  end\
  finale(self)\
end\
\
function Handler(onResolved, onRejected, resolve, reject)\
  return {\
    -- 当前promise的状态转换事件处理函数\
    onResolved = type(onResolved) == 'function' and onResolved or nil,\
    -- 当前promise的状态转换事件处理函数\
    onRejected = type(onRejected) == 'function' and onRejected or nil,\
    resolve = resolve,\
    reject = reject,\
  }\
end\
\
-- promise的主要方法。由于lua中then是关键字，所以用andThen取代\
function andThen(self, onResolved, onRejected)\
  -- then本身也会返回一个promise，实现promise链\
  return Promise.new(function(resolve, reject)\
    local deferred = Handler(onResolved, onRejected, resolve, reject)\
    handle(self, deferred)\
  end)\
end\
\
\
function handle(self, deferred)\
  if (self.PromiseStatus == PENDING) then\
    table.insert(self.deferreds, deferred)\
    return\
  end\
\
  asap(function()\
    local cb\
    if (self.PromiseStatus == RESOLVED) then\
      cb = deferred.onResolved\
    else\
      cb = deferred.onRejected\
    end\
    if (type(cb) == 'nil') then\
      if (self.PromiseStatus == RESOLVED) then\
        deferred.resolve(self.PromiseValue)\
      else\
        deferred.reject(self.PromiseValue)\
      end\
      return\
    end\
\
    local ret\
    local xpcallRes, xpcallErr = tryCatch(function()\
      -- 执行当前promise的状态转换事件处理函数\
      ret = cb(self.PromiseValue)\
    end)\
    if (not xpcallRes) then\
      -- 修改promise链表中下一个promise对象的状态为rejected\
      deferred.reject(xpcallErr)\
      return\
    end\
    -- 修改promise链表中下一个promise对象的状态为resolved\
    deferred.resolve(ret)\
  end)\
end\
\
-- 对状态转换事件处理函数进行封装后，再传给执行函数\
function doResolve(self, andThenFn, onResolved, onRejected)\
  -- done作为开关以防止fn内同时调用resolve和reject方法\
  local done = false\
  local xpcallRes, xpcallErr = tryCatch(function()\
    andThenFn(function(value)\
      if (done) then return end\
      done = true\
      onResolved(self, value)\
    end, function(value)\
      if (done) then return end\
      done = true\
      onRejected(self, value)\
    end)\
  end)\
  if (not xpcallRes) then\
    if (done) then return end\
    done = true\
    onRejected(self, xpcallErr)\
  end\
end\
\
-- 移动到链表的下一个promise\
function finale(self)\
  local theDef = self.deferreds\
  for k = 1, #theDef do\
    handle(self, theDef[k]);\
  end\
  self.deferreds = {};\
  if self.PromiseStatus == REJECTED and #theDef == 0 then\
    local errStr = 'Uncatch error in Promise '\
    local resErr = tostring(self.PromiseValue)\
    error(errStr .. '\\n' .. resErr .. '\\n')\
  end\
end\
\
-- promise的主要方法\
function catch(self, onRejected)\
  -- then本身也会返回一个promise，实现promise链\
  self.andThen(nil, onRejected)\
end\
\
return Promise\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./lib/event-query.lua"] = { path = "./lib/event-query.lua", name = "./lib/event-query.lua", source = "local socket = require 'socket'\
\
-- get the time\
local gettimeFunc = function()\
  return socket.gettime() * 1000\
end\
-- sleep\
local mSleep = mSleep or function(n)\
  socket.select(nil, nil, n / 1000)\
end\
\
-- fwGetPressedButton\
-- keepScreen(true);\
\
local function isEmpty(tab)\
  for _, v in pairs(tab) do\
    return false\
  end\
  return true\
end\
\
\
\
\
\
\
\
local function tryCatch(cb)\
  return xpcall(cb, function(e)\
    return stackTraceback and\
      (e .. '\\n' .. debug.traceback())\
      or (e)\
  end)\
end\
\
local function bindSelf(func, self)\
  return function(...) return func(self, ...) end\
end\
\
local getEventId = (function()\
  local id = 0\
  return function()\
    id = id + 1\
    return id\
  end\
end)()\
\
-- main query\
local eventQuery = {}\
-- sub query\
local screenListenerQuery = {}\
local screenListenerQueryIndex = {}\
local buttonListenerQuery = {}\
local buttonListenerQueryIndex = {}\
local timerQuery = {}\
local timerQueryIndex = {}\
\
\
function getEventObj(func, time, isInterval, ms)\
  return {\
    id = getEventId() or 0,\
    time = time or 0,\
    func = func,\
    isInterval = isInterval or false,\
    ms = ms or 0,\
    drop = false,\
  }\
end\
\
function getScreenEventObj(checker, func)\
  return {\
    id = getEventId() or 0,\
    checker = checker,\
    func = func,\
    drop = false,\
  }\
end\
\
function getButtonEventObj(btnId, func)\
  return {\
    id = getEventId() or 0,\
    btnId = btnId,\
    func = func,\
    drop = false,\
  }\
end\
\
\
\
\
function setImmediate(func)\
  if (type(func) ~= 'function') then return 0 end\
  local eventObj = getEventObj(func)\
  table.insert(timerQuery, eventObj)\
  return eventObj.id\
end\
\
function setTimeout(func, ms)\
  if (type(func) ~= 'function') then return 0 end\
  if ((type(ms) ~= 'number') or (ms < 4)) then ms = 4 end\
  local time = gettimeFunc() + ms\
  local eventObj = getEventObj(func, time)\
  table.insert(timerQuery, eventObj)\
  timerQueryIndex[eventObj.id] = eventObj\
  return eventObj.id\
end\
\
function clearTimeout(id)\
  local theEventObj = timerQueryIndex[id]\
  if (theEventObj) then\
    theEventObj.drop = true\
    timerQueryIndex[id] = nil\
  end\
end\
\
function setInterval(func, ms)\
  if (type(func) ~= 'function') then return 0 end\
  if ((type(ms) ~= 'number') or (ms < 4)) then ms = 4 end\
  local time = gettimeFunc() + ms\
  local eventObj = getEventObj(func, time, true, ms)\
  table.insert(timerQuery, eventObj)\
  timerQueryIndex[eventObj.id] = eventObj\
  return eventObj.id\
end\
\
-- param: checker, func\
function setScreenListener(...)\
  local args = { ... }\
  local checker = table.remove(args, 1)\
  local func = table.remove(args, 1)\
\
  if (type(checker) ~= 'function') then return 0 end\
  if (type(func) ~= 'function') then return 0 end\
  local screenEventObj = getScreenEventObj(checker, func)\
  table.insert(screenListenerQuery, screenEventObj)\
  screenListenerQueryIndex[screenEventObj.id] = screenEventObj\
  return screenEventObj.id\
end\
\
function clearScreenListener(id)\
  local theEventObj = screenListenerQueryIndex[id]\
  if (theEventObj) then\
    theEventObj.drop = true\
  end\
end\
\
function setButotnListener(btnId, func)\
  if (type(func) ~= 'function') then return 0 end\
  local btnEventObj = getButtonEventObj(btnId, func)\
  table.insert(buttonListenerQuery, btnEventObj)\
  buttonListenerQueryIndex[btnEventObj.id] = btnEventObj\
  return btnEventObj.id\
end\
\
function clearButotnListener(id)\
  local theEventObj = buttonListenerQueryIndex[id]\
  if (theEventObj) then\
    theEventObj.drop = true\
  end\
end\
\
function clearListenersOnButton(btnId)\
  for key = 1, #buttonListenerQuery do\
    local value = buttonListenerQuery[key]\
    if (value.btnId ~= btnId) then\
      value.drop = true\
    end\
  end\
end\
\
function run()\
  local continue = 0\
  local thisTime = 0\
  local sleepTime = 3600000\
\
\
  repeat\
    continue = 0\
    sleepTime = 3600000\
\
    -- run eventQuery\
    if #eventQuery > 0 then\
      for key = 1, #eventQuery do\
        local value = eventQuery[key]\
        value.func()\
      end\
      eventQuery = {}\
    end\
\
\
    -- read event from other Query\
    thisTime = gettimeFunc()\
\
    -- timeQuery\
    if (#timerQuery > 0) then\
      continue = continue + 1\
      local hasDropEvent = false\
      for key = 1, #timerQuery do\
        local value = timerQuery[key]\
        if (not value.drop) then\
          if (value.time <= thisTime) then\
            table.insert(eventQuery, value)\
\
            -- setInterval event\
            if (value.isInterval) then\
              value.drop = false\
              repeat\
                value.time = value.time + value.ms\
              until (value.time > thisTime)\
              sleepTime = math.min(sleepTime, value.time - thisTime)\
            else\
              value.drop = true\
              hasDropEvent = true\
            end\
          else\
            sleepTime = math.min(sleepTime, value.time - thisTime)\
          end\
        else\
          hasDropEvent = true\
          timerQueryIndex[value.id] = nil\
        end\
      end\
\
      if hasDropEvent then\
        local newTimeQuery = {}\
        for key = 1, #timerQuery do\
          local value = timerQuery[key]\
          if not value.drop then\
            table.insert(newTimeQuery, value)\
          else\
            timerQueryIndex[value.id] = nil\
          end\
        end\
        timerQuery = newTimeQuery\
      end\
    end\
\
    -- screenListenerQuery\
    if #screenListenerQuery > 0 then\
      keepScreen(false);\
      if type(getDeviceOrient) == 'function' then getDeviceOrient() end\
      local hasDropEvent = false\
      continue = continue + 1\
      sleepTime = math.min(sleepTime, 200)\
      getColor(0, 0)\
      keepScreen(true);\
      for key = 1, #screenListenerQuery do\
        local value = screenListenerQuery[key]\
        if not value.drop then\
          if (value.checker()) then\
            table.insert(eventQuery, value)\
            if (value.isOnce) then\
              value.drop = true\
              hasDropEvent = true\
            end\
          end\
        else\
          hasDropEvent = true\
        end\
      end\
      keepScreen(false);\
\
      if (hasDropEvent) then\
        local newScreenListenerQuery = {}\
        for key = 1, #screenListenerQuery do\
          local value = screenListenerQuery[key]\
          if (not value.drop) then\
            table.insert(newScreenListenerQuery, value)\
          else\
            screenListenerQueryIndex[value.id] = nil\
          end\
        end\
        screenListenerQuery = newScreenListenerQuery\
      end\
    end\
\
    -- buttonListenerQuery\
    if (#buttonListenerQuery > 0) then\
      sleepTime = math.min(sleepTime, 200)\
      continue = continue + 1\
      local btnIdList = {}\
      local hasBtnClick = false\
      local hasDropEvent = false\
      while (true) do\
        local btnId = fwGetPressedButton()\
        if (type(btnId) ~= 'string') then break end\
        btnIdList[btnId] = btnId\
        hasBtnClick = true\
      end\
      if (hasBtnClick) then\
        for key = 1, #buttonListenerQuery do\
          local value = buttonListenerQuery[key]\
          if (not value.drop) then\
            if (btnIdList[value.btnId] == value.btnId) then\
              table.insert(eventQuery, value)\
            end\
          else\
            hasDropEvent = true\
          end\
        end\
\
        if (hasDropEvent) then\
          local newButtonListenerQuery = {}\
          for key = 1, #buttonListenerQuery do\
            local value = buttonListenerQuery[key]\
            if (not value.drop) then\
              table.insert(newButtonListenerQuery, value)\
            else\
              buttonListenerQueryIndex[value.id] = nil\
            end\
          end\
          buttonListenerQuery = newButtonListenerQuery\
        end\
      end\
    end\
\
    if (luaExisted) then\
      break\
    end\
    if (#eventQuery <= 0) then\
      mSleep(sleepTime)\
    end\
  until (false)\
end\
\
return {\
  setImmediate = setImmediate,\
  setTimeout = setTimeout,\
  clearTimeout = clearTimeout,\
  setInterval = setInterval,\
  clearInterval = clearTimeout,\
  setScreenListener = setScreenListener,\
  clearScreenListener = clearScreenListener,\
  setButotnListener = setButotnListener,\
  clearListenersOnButton = clearListenersOnButton,\
  clearButotnListener = clearButotnListener,\
  run = run,\
}" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./utils/clear-log.lua"] = { path = "./utils/clear-log.lua", name = "./utils/clear-log.lua", source = "-- 删除大于7天并且大于50条的log，避免日志过大\
local lfs = require './lfs'\
local logPath = userPath() .. '/log'\
local dirs = lfs.dir(logPath)\
local sevenDayBeforeTime = os.time() - (7 * 24 * 60 * 60)\
local theTime = os.time()\
\
local dirsLen = #dirs\
\
dirs = table.filter(dirs, function(e, index)\
  if (string.startWith(e, 'warship-girls-r-script_')) then\
    local res = string.match(e, 'warship-girls-r-script_(%d+)')\
    res = tonumber(res) or theTime\
    if ((index < (dirsLen - 50)) and (res < sevenDayBeforeTime)) then\
      return true\
    end\
  end\
  return false\
end)\
\
for k, v in ipairs(dirs) do\
  lfs.rm(logPath .. '/' .. v)\
end\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./utils/device-orient-hock.lua"] = { path = "./utils/device-orient-hock.lua", name = "./utils/device-orient-hock.lua", source = "local __init = init\
\
-- 0=竖屏，1=右旋（home键在右边），2=左旋（home键在左边），3=倒立\
__init(0)\
local w, h = getScreenSize()\
local m = math.max(w, h)\
local sideLength = math.min(w, h)\
local orient = 0;\
local nextUpdateTime = 0\
\
-- 计算方向辅助界面，一像素宽度的白色边界，一像素宽的黑色边界，用于检测方向\
fwShowWnd(\"orientwid1\", 0, 0, 2, m, 0)\
fwShowTextView(\"orientwid1\", \"text1\", \"\", \"center\", \"000000\", \"FEFEFE\", 15, 0, 0, 0, 1, m, 1)\
fwShowTextView(\"orientwid1\", \"text2\", \"\", \"center\", \"000000\", \"010101\", 15, 0, 1, 0, 2, m, 1)\
mSleep(100)\
\
-- 计算当前方向\
function calOrient(_orient)\
  local result = _orient\
  -- 寻找白色边界\
  __init(_orient)\
\
  local checkOrder = { 0, 1, 2 }\
  if (_orient == 0) then\
    checkOrder = { 1, 2 }\
  elseif (_orient == 1) then\
    checkOrder = { 0, 2 }\
  elseif (_orient == 2) then\
    checkOrder = { 0, 1 }\
  end\
\
  local checkPointList = {\
    { 0, math.floor(0.333 * sideLength), 0xfefefe },\
    { 0, math.floor(0.5 * sideLength), 0xfefefe },\
    { 0, math.floor(0.667 * sideLength), 0xfefefe },\
    { 0, math.floor(0.833 * sideLength), 0xfefefe },\
    { 1, math.floor(0.333 * sideLength), 0x010101 },\
    { 1, math.floor(0.5 * sideLength), 0x010101 },\
    { 1, math.floor(0.667 * sideLength), 0x010101 },\
    { 1, math.floor(0.833 * sideLength), 0x010101 },\
  }\
\
  -- 如果方向没变则不旋转\
  if (multiColorS(checkPointList)) then\
    return _orient\
  end\
  -- 如果方向变了则旋转\
  for k, v in ipairs(checkOrder) do\
    __init(v)\
    if (multiColorS(checkPointList)) then\
      return v\
    end\
  end\
  __init(_orient)\
  return _orient\
end\
\
local _orient = calOrient(orient)\
orient = _orient\
\
-- 获取当前方向\
getDeviceOrient = function()\
  local newOrient = orient\
  if (os.time() > nextUpdateTime) then\
    local _keepScreenState = keepScreenState\
    keepScreen(true)\
    newOrient = calOrient(orient)\
    nextUpdateTime = os.time() + 1\
    keepScreen(false)\
  end\
  return newOrient\
end\
\
\
-- 设置当前方向，当然只能设置init的方向\
setDeviceOrient = function(n)\
  orient = n\
  __init(n)\
  nextUpdateTime = os.time() + 1\
end\
init = setDeviceOrient\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./utils/multi-color-hock.lua"] = { path = "./utils/multi-color-hock.lua", name = "./utils/multi-color-hock.lua", source = "multiColorS = multiColorS or function(array, s)\
  s = s or 90\
\
  local __keepScreenState = keepScreenState\
  if not __keepScreenState then keepScreen(true) end\
\
  local result = true\
  for var = 1, #array do\
    local lr, lg, lb = getColorRGB(array[var][1], array[var][2])\
    local r = math.floor(array[var][3] / 0x10000)\
    local g = math.floor(array[var][3] % 0x10000 / 0x100)\
    local b = math.floor(array[var][3] % 0x100)\
    if math.abs(lr - r) > s or math.abs(lg - g) > s or math.abs(lb - b) > s then\
      result = false\
      break\
    end\
  end\
\
  if not __keepScreenState then keepScreen(false) end\
  return result\
end\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./utils/keep-screen-hock.lua"] = { path = "./utils/keep-screen-hock.lua", name = "./utils/keep-screen-hock.lua", source = "-- 全局函数生成，由于部分计算过程不想暴露所以用了闭包\
\
if (type(keepScreenState) == 'nil') then\
  local __tmp = (function()\
    local __keepScreen = keepScreen\
    keepScreen = nil\
    keepScreenState = false\
    keepScreen = function(...)\
      local arr = { ... }\
      keepScreenState = arr[1] or false\
      return __keepScreen(...)\
    end\
  end)()\
end\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./lib/console.lua"] = { path = "./lib/console.lua", name = "./lib/console.lua", source = "local nLog = nLog or function() end\
\
local getLength = table.length or function(target)\
  local length = 0\
  for k, v in ipairs(target) do\
    length = k\
  end\
  return length\
end\
\
local isArray = table.isArray or function(tab)\
  if (type(tab) ~= \"table\") then\
    return false\
  end\
  local length = getLength(tab)\
  for k, v in pairs(tab) do\
    if ((type(k) ~= \"number\") or (k > length)) then\
      return false\
    end\
  end\
  return true\
end\
\
local __console = console or {}\
\
local function runTable(tab, space)\
  if type(tab) == 'number' then\
    return { tostring(tab) }\
  end\
  if type(tab) == 'string' then\
    if string.len(tab) > 1000 then\
      return { '\"' .. string.sub(tab, 1, 1000) .. '...\"' }\
    end\
    return { '\"' .. tab .. '\"' }\
  end\
  if type(tab) == 'boolean' then\
    if (tab) then\
      return { 'true' }\
    else\
      return { 'false' }\
    end\
  end\
  if type(tab) ~= 'table' then\
    return { '(' .. type(tab) .. ')' }\
  end\
  if type(space) == 'number' then\
    space = string.rep(' ', space)\
  end\
  if type(space) ~= 'string' then\
    space = ''\
  end\
\
  local resultStrList = {}\
  local newTabPairs = {}\
  local newTabPairsKeys = {}\
  local tabIsArray = true\
  local tabLength = 0\
  local hasSubTab = false\
\
  -- 将 table 的数组部分取出\
  for k, v in ipairs(tab) do\
    tabLength = k\
    table.insert(newTabPairs, { k, runTable(v, space) })\
    if (type(v) == 'table') then\
      hasSubTab = true\
    end\
  end\
\
  -- 将 table 的 map 部分取出，并按照字典顺序排序\
  for k, v in pairs(tab) do\
    if type(k) ~= 'number' or k > tabLength or k <= 0 then\
      tabIsArray = false\
      table.insert(newTabPairsKeys, k)\
      if (type(v) == 'table') then\
        hasSubTab = true\
      end\
    end\
  end\
\
  table.sort(newTabPairsKeys)\
  for _, k in ipairs(newTabPairsKeys) do\
    table.insert(newTabPairs, { k, runTable(tab[k], space) })\
  end\
\
  if (tabIsArray) then\
    local newTabArr = newTabPairs\
\
    if (hasSubTab) then\
      table.insert(resultStrList, '[')\
      for k, v in ipairs(newTabArr) do\
        local v2Length = getLength(v[2])\
        v[2][v2Length] = v[2][v2Length] .. ','\
        for k2, v2 in ipairs(v[2]) do\
          table.insert(resultStrList, space .. v2)\
        end\
      end\
      table.insert(resultStrList, ']')\
    else\
      local theStr = {}\
      for k, v in ipairs(newTabPairs) do\
        table.insert(theStr, v[2][1])\
      end\
      local childStr = table.concat(theStr, ', ')\
      table.insert(resultStrList, '[' .. childStr .. ']')\
    end\
  else\
    local newTabArr = newTabPairs\
\
    table.insert(resultStrList, '{')\
    for k, v in ipairs(newTabArr) do\
      v[2][1] = v[1] .. ': ' .. v[2][1]\
      local v2Length = getLength(v[2])\
      v[2][v2Length] = v[2][v2Length] .. ','\
      for k2, v2 in ipairs(v[2]) do\
        table.insert(resultStrList, space .. v2 .. '')\
      end\
    end\
    table.insert(resultStrList, '}')\
  end\
  return resultStrList\
end\
\
\
__console.log = __console.log or function(obj)\
  local js = table.concat(runTable(obj, 2), \"\\n\")\
  print(js)\
  if useNlog then\
    local info = debug.getinfo(2, 'Sl')\
    local lineInfo = ''\
    if info.currentline then\
      lineInfo = info.source .. ': ' .. info.currentline .. ':\\n'\
    end\
    nLog(lineInfo .. js)\
  end\
  return js\
end\
\
__console.getJsStr = function(obj)\
  return table.concat(runTable(obj, 2), \",\\n\")\
end\
\
__console.color = function(value)\
  local resultStr = ''\
  local color = getColor(value[1], value[2])\
  local oldColor = value[3]\
  local colorStr = string.format('0x%06x', color)\
  local oldColorStr = string.format('0x%06x', oldColor)\
  value[3] = oldColorStr\
  if (color == oldColor) then\
    resultStr = resultStr .. '\\n' .. table.concat(runTable(value), \"\")\
  else\
    value[3] = colorStr\
    resultStr = resultStr .. '\\n' .. table.concat(runTable(value), \"\") .. '  old Color: ' .. oldColorStr\
  end\
  __console.log(resultStr)\
end\
\
console = __console" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./lib/string-polyfill.lua"] = { path = "./lib/string-polyfill.lua", name = "./lib/string-polyfill.lua", source = "string.split = string.split or function(str, d)\
  if str == '' and d ~= '' then\
    return { str }\
  elseif str ~= '' and d == '' then\
    local lst = {}\
    for key = 1, string.len(str) do\
      table.insert(lst, string.sub(str, key, 1))\
    end\
    return lst\
  else\
    local lst = {}\
    local n = string.len(str) --长度\
    local start = 1\
    while start <= n do\
      local i = string.find(str, d, start) -- find 'next' 0\
      if i == nil then\
        table.insert(lst, string.sub(str, start, n))\
        break\
      end\
      table.insert(lst, string.sub(str, start, i - 1))\
      if i == n then\
        table.insert(lst, '')\
        break\
      end\
      start = i + 1\
    end\
    return lst\
  end\
end\
\
string.startWith = string.startWith or function(str, pattern)\
  if (type(str) ~= 'string') then\
    return false\
  end\
  if (type(pattern) ~= 'string') then\
    return false\
  end\
  if (string.sub(str, 1, string.len(pattern)) == pattern) then\
    return true\
  end\
  return false\
end\
\
string.endWith = string.endWith or function(str, pattern)\
  if (type(str) ~= 'string') then\
    return false\
  end\
  if (type(pattern) ~= 'string') then\
    return false\
  end\
  if (string.sub(str, 1, (0 - string.len(pattern))) == pattern) then\
    return true\
  end\
  return false\
end" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./lib/table-polyfill.lua"] = { path = "./lib/table-polyfill.lua", name = "./lib/table-polyfill.lua", source = "-- table方法添加\
local myTable = {}\
do\
  for key, value in pairs(table) do\
    myTable[key] = table[key]\
  end\
end\
\
local function runTable(tab, space)\
  if (type(tab) == 'number') then\
    return { tostring(tab) }\
  end\
  if (type(tab) == 'string') then\
    return { '\"' .. tab .. '\"' }\
  end\
  if (type(tab) == 'boolean') then\
    if (tab) then\
      return { 'true' }\
    else\
      return { 'false' }\
    end\
  end\
  if (type(tab) ~= 'table') then\
    return { '(' .. type(tab) .. ')' }\
  end\
  if (type(space) == 'number') then\
    space = string.rep(' ', space)\
  end\
  if (type(space) ~= 'string') then\
    space = ''\
  end\
\
  local resultStrList = {}\
\
  local newTabPairs = {}\
  local tabIsArray = true\
  local tabLength = 0\
  local hasSubTab = false\
\
  for k = 1, #tab do\
    local v = tab[k]\
    tabLength = k\
    myTable.insert(newTabPairs, { k, runTable(v, space) })\
    if (type(v) == 'table') then\
      hasSubTab = true\
    end\
  end\
\
  for k, v in pairs(tab) do\
    if ((type(k) ~= 'number') or k > tabLength) then\
      tabIsArray = false\
      myTable.insert(newTabPairs, { k, runTable(v, space) })\
      if (type(v) == 'table') then\
        hasSubTab = true\
      end\
    end\
  end\
\
  if (tabIsArray) then\
    local newTabArr = newTabPairs\
\
    if (hasSubTab) then\
      myTable.insert(resultStrList, '[')\
      for k = 1, #newTabArr do\
        local v = newTabArr[k]\
        local v2Length = getLength(v[2])\
        v[2][v2Length] = v[2][v2Length] .. ','\
        for k2 = 1, #v[2] do\
          local v2 = v[2][k2]\
          myTable.insert(resultStrList, space .. v2)\
        end\
      end\
      myTable.insert(resultStrList, ']')\
    else\
      local theStr = {}\
      for k = 1, #newTabPairs do\
        local v = newTabPairs[k]\
        myTable.insert(theStr, v[2][1])\
      end\
      local childStr = myTable.concat(theStr, ', ')\
      myTable.insert(resultStrList, '[' .. childStr .. ']')\
    end\
  else\
    local newTabArr = newTabPairs\
\
    myTable.insert(resultStrList, '{')\
    for k = 1, #newTabArr do\
      local v = newTabArr[k]\
      v[2][1] = v[1] .. ': ' .. v[2][1]\
      local v2Length = getLength(v[2])\
      v[2][v2Length] = v[2][v2Length] .. ','\
      for k2 = 1, #v[2] do\
        local v2 = v[2][k2]\
        myTable.insert(resultStrList, space .. v2 .. '')\
      end\
    end\
    myTable.insert(resultStrList, '}')\
  end\
  return resultStrList\
end\
\
myTable.length = myTable.length or function(tab)\
  return #tab\
end\
\
myTable.isArray = myTable.isArray or function(tab)\
  if (type(tab) ~= 'table') then\
    return false\
  end\
  local length = myTable.length(tab)\
  for k, v in pairs(tab) do\
    if ((type(k) ~= 'number') or (k > length)) then\
      return false\
    end\
  end\
  return true\
end\
\
myTable.unpack = myTable.unpack or unpack\
\
myTable.slice = myTable.slice or function(tab, startIndex, endIndex)\
  local length = myTable.length(tab)\
  if ((type(endIndex) == 'nil') or (endIndex == 0)) then\
    endIndex = length\
  end\
  if (endIndex < 0) then\
    endIndex = length + 1 + endIndex\
  end\
  local newTab = {}\
\
  for i = startIndex, endIndex do\
    myTable.insert(newTab, tab[i])\
  end\
\
  return newTab\
end\
\
myTable.merge = myTable.merge or function(tab, ...)\
  local args = { ... }\
  for k = 1, #args do\
    local tabelement = args[k]\
    local length = myTable.length(tabelement)\
    for k2 = 1, #tabelement do\
      local value = tabelement[k2]\
      if ((type(k2) == 'number') and (k2 <= length)) then\
        myTable.insert(tab, value)\
      end\
    end\
    for k2 = 1, #tabelement do\
      local value = tabelement[k2]\
      if ((type(k2) == 'number') and (k2 <= length)) then\
      elseif (type(k2) == 'number') then\
        tab[tostring(k2)] = value\
      else\
        tab[k2] = value\
      end\
    end\
  end\
  return tab\
end\
\
myTable.assign = myTable.assign or function(target, ...)\
  local sources = { ... }\
  if (type(target) ~= 'table') then\
    target = {}\
  end\
  for key1 = 1, #sources do\
    local source = sources[key1]\
    for key2, value in pairs(source) do\
      target[key2] = value\
    end\
  end\
  return target\
end\
\
myTable.reverse = myTable.reverse or function(target)\
  local result = {}\
  local theLength = myTable.length(target)\
  for key = 1, #target do\
    local value = target[key]\
    result[theLength - key + 1] = value\
  end\
  return result\
end\
\
myTable.filter = myTable.filter or function(target, func)\
  local result = {}\
  local theLength = myTable.length(target)\
  for key = 1, #target do\
    local value = target[key]\
    if (func(value, key, target)) then\
      myTable.insert(result, value)\
    end\
  end\
  return result\
end\
\
myTable.unique = myTable.unique or function(target, path)\
  local theMap = {}\
  local result = {}\
  local pathType = type(path)\
  if (pathType == 'nil') then\
    for key = 1, #target do\
      local value = target[key]\
      if (type(theMap[value]) == 'nil') then\
        theMap[value] = { key = key, value = value }\
        myTable.insert(result, value)\
      end\
    end\
  elseif ((pathType == 'number') or (pathType == 'string')) then\
    for key = 1, #target do\
      local value = target[key]\
      if (type(theMap[value[path]]) == 'nil') then\
        theMap[value[path]] = { key = key, value = value }\
        myTable.insert(result, value)\
      end\
    end\
  elseif (pathType == 'function') then\
    for key = 1, #target do\
      local value = target[key]\
      if (type(theMap[path(value)]) == 'nil') then\
        theMap[path(value)] = { key = key, value = value }\
        myTable.insert(result, value)\
      end\
    end\
  end\
  return result\
end\
\
-- 后覆盖前的unique\
myTable.uniqueLast = myTable.uniqueLast or function(target, path)\
  local theMap = {}\
  local result = {}\
  local pathType = type(path)\
  local targetLength = myTable.length(target)\
  if (pathType == 'nil') then\
    for key = 1, #target do\
      local value = target[key]\
      theMap[value] = { key = key, value = value }\
    end\
    for key = 1, #target do\
      local value = target[key]\
      if (key == theMap[value].key) then\
        myTable.insert(result, value)\
      end\
    end\
  elseif ((pathType == 'number') or (pathType == 'string')) then\
    for key = 1, #target do\
      local value = target[key]\
      local res, err = pcall(function()\
        theMap[value[path]] = { key = key, value = value }\
      end)\
      if not res then\
        error(console.log(value))\
      end\
    end\
    for key = 1, #target do\
      local value = target[key]\
      if (key == theMap[value[path]].key) then\
        myTable.insert(result, value)\
      end\
    end\
  elseif (pathType == 'function') then\
    for key = 1, #target do\
      local value = target[key]\
      theMap[path(value)] = { key = key, value = value }\
    end\
    for key = 1, #target do\
      local value = target[key]\
      if (key == theMap[path(value)].key) then\
        myTable.insert(result, value)\
      end\
    end\
  end\
  return result\
end\
\
myTable.map = myTable.map or function(tab, callback)\
  local values = {}\
  for k, v in ipairs(tab) do\
    myTable.insert(values, callback(v, k, tab))\
  end\
  return values\
end\
\
myTable.values = myTable.values or function(tab)\
  local values = {}\
  for k, v in pairs(tab) do\
    myTable.insert(values, v)\
  end\
  return values\
end\
\
myTable.keys = myTable.keys or function(tab)\
  local keys = {}\
  for k in pairs(tab) do\
    myTable.insert(keys, k)\
  end\
  return keys\
end\
\
-- 对key排序后放入数组中再返回，结果类似entries\
myTable.sortByKey = myTable.sortByKey or function(tab, call)\
  local keys = myTable.keys(tab)\
  if (type(call) == 'function') then\
    myTable.sort(keys, call)\
  else\
    myTable.sort(keys)\
  end\
  local newTable = {}\
  for k = 1, #keys do\
    local key = keys[k]\
    myTable.insert(newTable, { key, tab[key] })\
  end\
  return newTable\
end\
\
myTable.findIndex = myTable.findIndex or function(tab, call)\
  local index = -1\
  if type(call) == 'function' then\
    if myTable.isArray(tab) then\
      for key = 1, #tab do\
        local value = tab[key]\
        if call(value) then\
          index = key\
        end\
      end\
    else\
      for key = 1, #tab do\
        local value = tab[key]\
        if call(value) then\
          index = key\
        end\
      end\
    end\
  else\
    if myTable.isArray(tab) then\
      for key = 1, #tab do\
        local value = tab[key]\
        if value == call then\
          index = key\
        end\
      end\
    else\
      for key = 1, #tab do\
        local value = tab[key]\
        if value == call then\
          index = key\
        end\
      end\
    end\
  end\
  return index\
end\
\
myTable.find = myTable.find or function(tab, call)\
  local result\
  if type(call) == 'function' then\
    if myTable.isArray(tab) then\
      for key = 1, #tab do\
        local value = tab[key]\
        if call(value) then\
          result = value\
        end\
      end\
    else\
      for _, value in pairs(tab) do\
        if call(value) then\
          result = value\
        end\
      end\
    end\
  else\
    if myTable.isArray(tab) then\
      for _, value in pairs(tab) do\
        if value == call then\
          result = tab[call]\
        end\
      end\
    else\
      for key = 1, #tab do\
        local value = tab[key]\
        if value == call then\
          result = tab[call]\
        end\
      end\
    end\
  end\
  return result\
end\
\
myTable.toString = myTable.toString or function(tab)\
  return myTable.concat(runTable(tab), '')\
end\
\
myTable.from = myTable.from or function(target)\
  if (type(target) ~= 'function') then\
    return target\
  end\
  local result = {}\
  for k, v in target do\
    result[k] = v\
  end\
  return result\
end\
\
myTable.toJsString = myTable.toJsString or function(tab, space)\
  space = space or '  '\
  return myTable.concat(runTable(tab, space), '\\n')\
end\
\
do\
  for key, value in pairs(myTable) do\
    table[key] = table[key] or myTable[key]\
  end\
end\
" }


package.preload["TSLib"] = assert(load("\27TS1R\0\1\4\4\4\8\0\25�\13\
\26\
\14\9\20 6\30�\11Fo<'Q�\30gIW.X�qqC�\2\24Ac�2V\8\9\20 �kV80\8t\25:\8t\25i\19�.hzN!b� g%��]=�vS���W��K({��5,��\\�`h$\24\9v\25\30\9v\25r�6)���b\24�At�\"]}R�\25C ��\7\1!\8\6 |a�<�\15�6\23�\5+��\5dB��\29a�3\3NBw'*��5\0\11\8\8 �7\16@R��F��Sn�pV4\18�&�\0151�\\!��7S3�\24c*�1ync�{�Y�\24Vu\17Vg\0\0\0�������\2\2�\5�B�E�B��Â����\3�\3����\3\3�C�����\0������\3\0�Ã����\1�\3����\3\1�C�����\6������\3\6�À����\7�\3����\3\7�C�\0\8\0\1�%\1\3\0\8\0��%A\3\0\8\0\1�%�\3\0\8\0��%�\3\0\8\0\1�%\1\4\0\8\0��%A\4\0\8\0\1�%�\4\0\8\0��%�\4\0\8\0\1�%\1\5\0\8\0��%A\5\0\8\0\1�%�\5\0\8\0��%�\5\0\8\0\1�%\1\6\0\8\0��%A\6\0\8\0\1�%�\6\0\8\0��%�\6\0\8\0\1�%\1\7\0\8\0��%A\7\0\8\0\1�%�\7\0\8\0��%�\7\0\8\0\1�%\1\8\0\8\0��%A\8\0\8\0\1�%�\8\0\8\0��%�\8\0\8\0\1�\6\1I\0\8\0��%\1\9\0\8\0\1�%A\9\0\8\0��%�\9\0F\1J\0J\1��e�\9\0\8@\1�e\1\
\0\8@��eA\
\0\8@\1�e�\
\0\8@��e�\
\0\8@\1�e\1\11\0\8@��eA\11\0\8@\1�e�\11\0\8@��e�\11\0\8@\1�\31\0�\0\5\7\21 u�\16\2�\30H\127!��\2��Rv�A�|sQ�E�Q'~\6\3\16I\25ﲠ\2�a�4\1\0\0\0\1\0\6\7!\25���f�Z�R\1\13�I\0�\29\14\
\16`\8�M�\127��-N3\0\0\0\4\8\0\0\0\2%\21>35=V\4\
\0\0\0009&\"\9 7:#3V\4\11\0\0\0\2\5\0003$%?98%V\4\4\0\0\0\"7&V\4\
\0\0\0$7829;\0027&V\4\11\0\0\0$7829;%\0027&V\4\7\0\0\0;9 3\0029V\4\12\0\0\0;9 3\0029!7$2%V\4\12\0\0\0;9 3\01299;\25#\"V\4\11\0\0\0;9 3\01299;\0318V\4\17\0\0\0;9 3\21?$5:3\02138\"3$V\4\17\0\0\0;9 3\21?$5:3\00698?\"%V\4\9\0\0\0?8\"\0029\00414V\4\9\0\0\0$14\0029\0318\"V\4\8\0\0\0?%\0219:9$V\4\11\0\0\0;#:\"?\0219:9$V\4\12\0\0\0;#:\"?\0219:\0027&V\4\9\0\0\0%\"$\5&:?\"V\4\12\0\0\0?%\16?:3\19.?%\"V\4\15\0\0\0$372\16?:3\5\"$?81V\4\9\0\0\0$372\16?:3V\4\
\0\0\0!$?\"3\16?:3V\4\16\0\0\0!$?\"3\16?:3\5\"$?81V\4\8\0\0\00023:\16?:3V\4\15\0\0\0%3\"\0183 ?53\23:?7%V\4\8\0\0\0:#7\19.?\"V\4\9\0\0\00013\"\0243\"\31\6V\4\4\0\0\0:91V\4\11\0\0\00013\"\23&&\0247;3V\4\11\0\0\00013\"\3%3$\23&&V\4\9\0\0\0>\"\"&\0069%\"V\4\8\0\0\0>\"\"&\0173\"V\4\9\0\0\0?8&#\"\5\"$V\4\16\0\0\0005:37$\0067%\"3497$2V\4\13\0\0\0005:37$\02199=?3%V\4\11\0\0\0005:37$\31\18\16\23\0V\4\15\0\0\0005:37$\23::\6>9\"9%V\4\12\0\0\0\0183:\23::\6>9\"9V\4\18\0\0\0005:37$\23::\0293/\21>7?8%V\4\
\0\0\00013\"\5\"$\24#;V\4\3\0\0\0\9\17V\4\
\0\0\00013\"\00482\24#;V\4\6\0\0\0\3\31\0243!V\4\12\0\0\0%87&\02382\0057 3V\4\14\0\0\000233&\0219&/\00274:3V\4\
\0\0\00013\"\0043823$V\4\6\0\0\0?%\0187/V\4\11\0\0\0005>35=\00274:3V\4#\0\0\0000?82\27#:\"?\0219:9$\0318\00431?98\16#,,/\20/\00274:3V\4\7\0\0\000839%\3\31V\4\8\0\0\00095$\031809V0\0\0\0\11\9\20 ��\22D_l\25Fm\3\9\20 4��fw�+=�ӅL\16��\20���+9�\"�o�E\8\13�;| !lM�\23'}\8t\0254\8t\25�Y{n&\25$\11�\7��mu\25\9v\25\18\9v\25���Z�>D3�\20�\11U�Y\30�5N f��0\25SZbgc�[\
�&)��\22O\0(\8\6 �b=m\0\0\8\8 \6��('Av\7S�\18|}�\
f�\20�Sc��\16�U�\17,\2�vHyV4\18�\"�b\31\0\0\0C�IH\14H\8HB\8H�\14\8\8HB\8��\14�\8HB\8H�\14�\8\0\
@��K�\0\0�\0A\0�@A\1J����\0A\0��A\1J�\0�\
@\0�K@\0\0��A\0�\0B\1J�\0�\
@��e\0\0\0�@\0\0�\0\0\11�\0\0\
���\
�\0�\
A��\31\1\0\1\31\0�\0\8\7\21 \127M�*��2^�$�!�@\0252\127��S[&�h:$�\12(��\6\1;�t��L+\5\2\16I\25h\26�%�9�\0138��\2\1\0\0\0\0\0\6\7!\25i�\\�'�}\8R�;���q���&/�cC��\0n\12\0\0\0\4\9\0\0\0\25\2\3\24\0\15\8\31m\4\5\0\0\0\25\20\29\8m\4\6\0\0\0\8\31\31\2\31m\4\7\0\0\0\30\8\1\8\14\25m\4\7\0\0\0\30\25\31\4\3\
m\4\7\0\0\0\11\2\31\0\12\25m\4\5\0\0\0\11\4\3\9m\4\6\0\0\0\9\8\15\24\
m\4\8\0\0\0\
\8\25\4\3\11\2m\4\8\0\0\0009\30.\5\8\14\6m\4\
\0\0\0\2\29\0252\27\12\1\24\8m\4\8\0\0\0\15\12\0092\12\31\
m\3\0\0\0\11\9\20 ʵ'J�a�k�\12\9\20 ���w�1�d�W�F��\12B \25�L(\8t\0258\8t\25e��<���c�24\\\1\20�XH0]I\30�&O5\15�;�]0\24\23\9v\25\18\9v\25���Tkp�l\16;�\21\24��\27]�u^�<�\24��O<e��En(�\14�&B@\0 \8\6 ?#�Sl�i\
��\16g���\\�Fa\31�e�^z�mA���evc� \6\11\8\8 �Q#\16�3�]t�\15r�{V4\18�(m;�]~;\18W�r:\0\0\0q���7�w�jv���������w����qv��p6��:��ujv��1����u��*v���76��w\0�ǁA\3�A\0\0\23\0\0��\1\2\0\6BA\0GBB\3\29�\0\1\24�A\4\23�\0�\7BB\3\27B\0\0\23�\1�\6BA\0@\2\0\0\29�\0\1\24�A\4\23@\0�\28B\0\0\23\0\0�\1�\2\0X\0B\2\23@\1�F�A\0G��\4�\2\3\0�\2\0\2]��\1\0\1�\4FBC\0��A\0��B\5��\3\0\0\3�\0@\3\0\1�\3�\3�\3\0\4\0\4�\1@\4\0\2��\0\4�B��^\2�\1_\2\0\0\31\0�\0\8\7\21 ^�r~�\20nG$��@o�\12\20�Yc��\12\31n��,�H�\31� �d�%^;\18\3\16I\25\12g�_\28I[\15\1\0\0\0\1\0\11\7!\25\12\15\6G��Clɒ�\9�t�%Nֱ-v1�o\17�yF���;t��\127�\0114$\16\0\0\0\4\9\0\0\0���������\3\0\0\0\0\0\0\0\0\4\6\0\0\0������\4\8\0\0\0��������\3\0\0\0\0\0\0\0@\4\5\0\0\0�����\4\9\0\0\0���������\4\7\0\0\0�������\4\1\0\0\0�\4\5\0\0\0�����\4\2\0\0\0��\4\7\0\0\0�������\4\12\0\0\0��\19Ha\19~F�Ӆ�\4\6\0\0\0������\4D\0\0\0\16j\\\30uK\16~f\19|i\30If\30Wz�\19yt\16cF\19Ly\19yA��ӒӅ�\19qK\16cF�Ӆ��Ӆ���\31jv\30Pw�Ӆ�Ӆ��\3\0\0\0\0\0\0\8@\0\0\0\0\26pi\23#\8\29l�S�Z\26�vi�e�'۪WM�v\20=O�\13&���\20\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 �y�B�\5�^�\0�s�\5�]�ƴ\1�C�\3�Η-U��p�BX1u\15\9\20 �0{\28\\�\25i_��+�F�li��n�*�)\30\8t\0251\8t\25�%\28G\2\9v\25\31\9v\25���h�A�Q,y4t\0d%,�F�\22���&�m�\8\1.\8\6 Y&�[���<���~韷\30y\3�\27m�DrѥJ|\2\13\8\8 _��u�t�)�q`\14:\18L'��/�~V4\18H��\24[\20D=}�q0�H�\7\24?�f�u�cV\0\0\0g��!���|a�๡�����ad�a� a��� �����`���'������<���|���g��!�a�|a�๡�����ad�a� a���`\1\0A�\1\0�A\1\0�\1@\0\0\2�\0�\1\0\1�@\0\0�\0B\0�@\2\0&\1\0\0��\0\0\25\0\0\1\23\0\2��\0�\0\1�\2\0@\1\0\0��\2\0�\1�\0\1�\2\0�\0\0\3�\0\0\0\23@\
��\0B\0\0\1\0\0f\1\0\0݀\0\0\6AA\0\7\1C\2@\1�\0�A\0\0\29��\1\27\1\0\0\23@\2�\6AC\0@\1�\1\29�\0\1\27\1\0\0\23\0\1�\6AC\0@\1�\1\30\1\0\1\31\1\0\0\23\0\5�\6AA\0\7\1C\2@\1�\0�\1@\0�\1�\1�\1\0\1\29�\0\0\27A\0\0\23�\2�\5\1�\0A�\2\0�\1\0\0��\2\0\0\2�\0F\2@\0�\2�\1]\2\0\1\30\1\0\0\31\1\0\0\23\0\0��\0\0\1\31\0�\0\1\7\21 �\28�\0099%�LK�� \11\3\16I\25:��x3�Y7\2\0\0\0\1\0\1\1\5\7!\25\14��\1)aN\4�MP\0��r>\14\0\0\0\4\5\0\0\0\1\12\5\16u\4\7\0\0\0\27\0\24\23\16\7u\4\8\0\0\0!\0066\29\16\22\30u\3\0\0\0\0\0\0�?\4\12\0\0\0]\20\7\18*\22\26\0\27\1\\u\4\7\0\0\0\6\1\7\28\27\18u\3\0\0\0\0\0\0\0@\4\16\0\0\0]\16\13\5\16\22\1\16\17*\1\12\5\16\\u\4\7\0\0\0\6\16\25\16\22\1u\4\2\0\0\0Vu\4\1\0\0\0u\4\9\0\0\0\27\26U\3\20\25\0\16u\4\5\0\0\0\19\28\27\17u\4\9\0\0\0\1\26\27\0\24\23\16\7u\0\0\0\0\17pi\23��\7\31@�\31ZGw7u\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 j}P|o��\26��\26+�(;iI\
\9\20 �\24|\3t:�\25��iXw\8t\0251\8t\25ԍ\25&(\9v\25\18\9v\25\22��\17/>�B�4�e\0*fZ��L\\{Rfe��\"b�V�mI��a���R\1,\8\6 �3\31I�֥X�\8yH�-9\13s��6\3\1\8\8 y\13�\25 ��\25Q\2�\6��4�X�D�*\15p���2�t�\29�C�s-~V4\18���\24�{�r g�\31���*\26��5ޛ�\5h\0\0\0�-m--,--�-,um�,:-/��-�-,�--l�--�,,-�l--+/m-m/--0/-,�m--�-m--,�-�-,um�,:-/��-�-,�--l�,-��,-�l,-+/m-m/�-\29\2\0\1�@\0\0�@A\0�\0�\1\0\1�\0F\1@\0�\1\0\1]\1\0\1݀\0\0�@\0\0\23@\3��\0@\0\0\1\0\1݀\0\1X@�\1\23\0\2��\0�\0\1�\0\0A�\2\0��\2\0�\1�\0\6\2@\0@\2\0\1\29\2\0\1�@\0\0�\0C\0\1A\3\0f\1\0\0݀\0\0\25\0�\1\23@\0��\0\0\1\23�\
�\6\1C\0@\1\0\0�\1\0\0\29�\0\0FAA\0G\1�\2�\1�\0�A\0\0]��\1[\1\0\0\23@\2�F�C\0�\1\0\2]�\0\1[\1\0\0\23\0\1�F�C\0�\1\0\2^\1\0\1_\1\0\0\23�\5�FAA\0G\1�\2�\1�\0�\1@\0\0\2\0\2�\1\0\1]�\0\0[A\0\0\23\0\3�E\1�\0��\3\0�\1\0\0\1�\3\0A\2\4\0�\2�\0V��\4�\2@\0�\2\0\2�\2\0\1^\1\0\0_\1\0\0\23\0\0�\31\1\0\1\31\0�\0\1\7\21 ���\17Y��j��\25g\12\8\16I\25���LFS�9�в\26���\21�)�\18��+cC\7\14#_�@I�^�m\2\0\0\0\1\0\1\1\11\7!\25\127]�b1a�t�\7qq(��'\23��dI�i$�*FE��\29Xa�Dq�k5;\17\0\0\0\4\5\0\0\0=09,I\4\7\0\0\0'<$+,;I\4\
\0\0\0&9=\22?(%<,I\3\0\0\0\0\0\0�?\4\12\0\0\0a(;.\22*&<'=`I\4\7\0\0\0:=; '.I\3\0\0\0\0\0\0\0@\4\16\0\0\0a,19,*=,-\22=09,`I\4\5\0\0\0/ '-I\4\4\0\0\0' %I\3\0\0\0\0\0\0\8@\4\14\0\0\0a-,/(<%=\22?(%`I\4\7\0\0\0:,%,*=I\4\2\0\0\0jI\4\9\0\0\0=&'<$+,;I\4\1\0\0\0I\4\5\0\0\0&9=gI\0\0\0\0\27pi\23L%9d���Z�/�\27g��\25�nx`�� \27r�+\12]cK5r�\7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\16pi\23�\2\25\24|ŜA\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 79\8c1\15\9\20 \20?\0058,��\15��7T�n�M*a.x�~�%e\8t\0256\8t\25\26�Bg���Y\22�\26D��7\0003��3_��\31K\9v\25\25\9v\25}\1&d\0+\8\6 \29��O���\26\0\15\8\8 Q�\0193�\9�\18z��*\30��S�\13UV\22S�\17�OX-5{V4\18\17�`\16�\15+\26 �\5,\3\0\0\000455\0\31\0\0\1\31\0�\0\4\7\21 ��**\21�=\0\0177I\22�>Y\"�\16�%�\4:'\2\0\16I\25��}\127\0\0\0\0\7\7!\25�\18�\9�H%3b�?\11�\3\21eAJK\0233z�/\1\0\0\0\4\6\0\0\0\0\31\3\31\0011\0\0\0\0\27pi\23�\11\0242���iS|�g�\21�D\27��\20qu�;�#%\0271��&K��h\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 \5��x�z�L�\12\9\20 N��Rxg�_Xr9\0282��<�\3/fR\8t\0251\8t\25���'O\9v\25\26\9v\25��Gݠ=l\1 \8\6 ;!Swu\15{\17�\20}F9��#vz�x|��\9ѫ�\2�,�l\27��.\0\
\8\8 7d�S���`�pV4\18\15\20�\3���Q�\"\6y��NP\9W�U�\23d3�-2#��X54\0\0\0�А�א�ЖP�Ѝ�P�͐����PБ\16��Q���6����P�Е�P�Q���\17���&\1\0\0]�\0\0�\0\0\1��\1\0\1\1\1\0F\1@\0G��\2�\1\2\0�A\2\0]��\1�\1\0\0��\0\0�\0@\0���\1\1�\0\0A�\2\0݀�\1\6�B\0@\1�\1�\1\0\0�\1�\0\29A\0\2\6\1C\0A�\0\0\29A\0\1\6AC\0@\1�\1�\1\0\0�\1�\0\29A\0\2\6\1C\0@\1\0\1\29A\0\1\6�C\0@\1�\1�\1\0\0�\1�\0\29A\0\2\31\0�\0\7\7\21 '��_l\27v��\3���\7uY�}\8\0\16I\25�w1t\3\0\0\0\0\0\1\2\1\3\7\7!\25���B7��\5���7�G\127f�\1�~[�\127A\15\0\0\0\4\5\0\0\0�����\4\11\0\0\0�����������\4\
\0\0\0����������\3\0\0\0\0\0\0�?\4\7\0\0\0�������\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\7\0\0\0�������\3\0\0\0\0\0\0>@\3\0\0\0\0\0\0I@\3\0\0\0\0\0\0\"@\4\
\0\0\0����������\4\7\0\0\0�������\4\
\0\0\0����������\4\8\0\0\0��������\0\0\0\0\22pi\23;.$kv�Tp\6�R)r��>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 �MB ���}]�'z\30%\0055'\22p\127N��x�\19co�\0\9\20 �/@Zf%�j��\17\27�ج\21�8�\11!ȵS\27\26�H�6�*�>\9\6^\8t\0254\8t\25f�\31Y`zLB\13\16�(s�h.{\9v\25\27\9v\25�Q�/T$nU\24�`*\1/\8\6 j�e\31�_\16\18D\22_\0178\18�?�^�\15���\11\0\9\8\8 �t`\15\\\127V4\18\13K�\8���:�zP>sp�s���U�S�SJ�F\1278\0\0\0Y\\\\\\\29\\\\\\�\28\\\\�\\\\\\A�\\\\\25\\\\\\��\\\\�\28\\\\z]\\\\\1�\\\\�\\�\\��\\\\]\29\\\\\29]]\\�\1\0\0��\0\0�@A\1ǀ�\1\6�A\1\29\1�\0�@\0\0�@A\1�\0�\1\19\1\0\1@\1\0\1݀�\1\13�\0\0�@A\1�\0�\1\19\1\0\1@\1\0\1݀�\1M��\0�@B\1\1\1\0\0@\1\0\0�\1�\0�@\0\2ƀB\1\1\1\0\0@\1\0\0�\1�\0�@\0\2��B\1\6AA\1\7\1B\2A\1\3\0�A\3\0\29\1�\1�@\0\0ƀC\1\1\1\0\0@\1\0\0�\1�\0�@\0\2\31\0�\0\3\7\21 �m�\28\7\3\16I\25R�v/��\31\4\3\0\0\0\1\2\1\3\0\0\7\7!\25�\28�q���,�>�1L\16\0221�Q�\\�b-\7\15\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�������\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\20@\4\5\0\0\0�����\4\11\0\0\0�����������\4\
\0\0\0����������\4\7\0\0\0�������\4\
\0\0\0����������\4\
\0\0\0����������\4\7\0\0\0�������\3\0\0\0\0\0\0D@\3\0\0\0\0\0\0N@\4\8\0\0\0��������\0\0\0\0\24pi\23'�\9hg'�&\2\14�mk�hy�9;f�lw}\12��\4�p�Zb��\12��\9\9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 ���\20�\15VaH<\31x��\4t�{sO#ʛe�y#أ(]\
\
\9\20 5��ak�K���L�\8t\0259\8t\25�2�T��0\13O�\127s�I�\18!�&�Q��GBw�,iR�hw\9v\25\30\9v\25�\12�1��'y�y�G�\6W\20\21\3�:\0080�\23\1-\8\6 շ�O�?�xc*�Uҫ�C\0\13\8\8 ��B;�Q\1gX_�%�}G\18\21 \12`�zV4\18���,��hpu\0\0\0����ѐ��\17А�v����\16��Ր��\17\16��QА������\16��\21�\16�QP���ѐ�ё��6���\13\16��u�����\16�ё��\17ё��\17\16��ѐ����\16�\17��\16�\16�C�\16���\16�\13\17\16�\29\17��P\1�\1\19\2�\2@\2�\2݁�\1���\0\6�A\1@\2\0\2�\2\0\3�\2�\3\29B\0\2\0\2�\1A\2\2\0��\1\0\29��\1A\2\0\0�\2\0\4�\2\0\0a\2\
�\26�@\4\23�\4�FCB\1�\3�\1��\2\0\1�\2\0�\3�\1]C\0\0F\3C\1�\3\0\2�\3�\1\19\4�\2@\4�\2݃�\1��\3\3\0\4�\1S\4�\2�\4�\2\29��\1\13\4�\3]C\0\2\23�\4�FCB\1�\3�\1��\2\0\1\4\1\0�\3�\1]C\0\0F\3C\1�\3\0\2�\3�\1\19\4�\2@\4�\2݃�\1��\3\3\0\4�\1S\4�\2�\4�\2\29��\1\13\4�\3]C\0\2`B�\127FBB\1�\2�\1�B\3\0\1�\2\0�\2�\1]B\0\0\24\0B\4\23@\1�F�C\1�\2\0\2�\2\0\3\0\3�\3]B\0\2\23\0\3�F�C\1�\2\0\2�\2�\1\19\3�\2@\3�\2݂�\1��\2\3\0\3�\1S\3�\2�\3�\2\29��\1\13\3�\3]B\0\2\31\0�\0\8\7\21 ��{]�G[p^��|~��~MnUB,^�>��\22+��\7+cg�Z��\\\19\0\16I\25��N\"\3\0\0\0\1\2\1\3\0\0\3\7!\25Y\127�^�\16�9\15\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0d\127ghox\
\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0004@\3\0\0\0\0\0\0\"@\3\0\0\0\0\0\0\20@\4\
\0\0\0~e\127ibNe}d\
\3\0\0\0\0\0\0\0\0\4\7\0\0\0gYfooz\
\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0Y@\4\
\0\0\0~e\127ibGe|o\
\3\0\0\0\0\0\0>@\4\8\0\0\0~e\127ib_z\
\1\0\0\0\13\9\20 ;��*@�'�.���\12�\14\9\20 ˃�\11�FOZu��&{��Z�\"c]`�K�n�\1F\8t\0255\8t\25x\\�\23?��\0147H�\25�oi0Q��Kk\9v\25\17\9v\25��\21Q���\21B��\0247�\25:s\7\22���k��P)\13��:�8�\23\1-\8\6 �H�\4��lB5i>\4��^3\0\9\8\8 ��\02255~V4\18\0317f\15���c���5\8Z�l\2��/�Bu7\11\0\0\00035u52uu5s�u\0]\0�\0\29@\0\0\6\0@\0\7�@\0f\0\0\0\30\0\0\0\31\0\0\0\31\0�\0\11\7\21 z\12<G&��E\17�!A9|�wxk�\17o��d R�HV;�'��~}\2\2\16I\25���=8�Vi���\11\1\0\0\0\0\2\11\7!\25��\5\1�>Xhv\127�|��rC\4��l;y-0YW�\18���!gH*mۛ�m\4\0\0\0\4\5\0\0\0�����\4\11\0\0\0�����������\4\
\0\0\0����������\4\7\0\0\0�������\0\0\0\0\23pi\23\9\14\2Q�o�#�)�\29\11��\0��b[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\26pi\23���G�a!�]�\6�Fp?^\3�2\8Yhkߘ+\8�>yZ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 jIX:��3V6��\2�S�b\\��\2hج\11?��nI]�bI\3\9\20 �s!d��dg�<]Uh>\13\30ܷ�Y��P2$E�\1��\31;Q��\31�;�b�\8t\0259\8t\0257|F._�\
\"���@��-gɤI`W\28r$\6��\20\18\2�w�l�:�\9v\25\30\9v\25|K.2�=�\16��g%(��\20\13��\19\4�\0201\1 \8\6 WVov��#\14�v?k\3ʐZ�]�u.��@k\8�x�\21KO���r\0\14\8\8 M�j\
\5;�\18#�1]J��\21<��@��<\127�~V4\18L,�_m�5{���<^.\\We.�5\\��_j\0\0\0���Ք���T���3����U�Ր���TU��\20������ՈU��P���\20\21��Ԕ�ճ���HU��\16������Ք���s���\8U����UՔ���T���\20T�������T�ՐԀ\0��\1\0�A\0\0\1\2\2\0f\2\0\0]�\0\0�AB\1��B\3΁\0\0��\0\1�AB\1ǁ�\3\14\0݁\0\1\4\2\0\1\25��\3\23�\0�\16\2\1\3@\2\0\2�\2�\3\23�\0�\16\2�\3P\2\2\3�\2\0\2\25\0\0\1\23�\0��\2�\4����\23\0\0��@��\25@�\1\23�\0��\2\0\5��\2�\23\0\0���\2��BB\1�B�\5\6�C\1\29\3�\0�B\0\0�BB\1���\5\1\3\0\0A\3\4\0݂�\1\6CD\1@\3�\5�\3\0\0�\3�\0\29C\0\2\6�D\1A�\4\0\29C\0\1\1\3\0\0@\3\0\4�\3\0\0!�\2�\6�B\1\13\0\4\0\6\4C\1M\0�\0\6\4E\1@\4�\5�\4\0\0�\4�\0\29D\0\2\6�D\1A�\1\0\29D\0\1 ��\127\6�D\1@\3�\2\29C\0\1\6CE\1@\3�\5�\3\0\1�\3�\1\29C\0\2\31\0�\0\5\7\21 \22l�F��.\5\3\25A\30#e�Z��C6kw�!z�\23Q\20\2\16I\25��1\13~��+���9\3\0\0\0\1\2\1\3\0\0\0\7!\25�F$\22\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0'<$+,;I\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0I@\4\5\0\0\0$(=!I\4\4\0\0\0(+:I\4\3\0\0\0001zI\4\3\0\0\0000zI\4\11\0\0\0;('-&$:,,-I\4\
\0\0\0.,=\27'-\7<$I\4\7\0\0\0;('-&$I\3\0\0\0\0\0\0\"@\4\
\0\0\0=&<*!\13&>'I\4\7\0\0\0$\26%,,9I\3\0\0\0\0\0\0Y@\4\
\0\0\0=&<*!\4&?,I\4\8\0\0\0=&<*!\0289I\0\0\0\0\26pi\23�0�@yۊ\30�@�\19�khS�d�{�\7l)\15#[\20\31��z\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 �q�4���&�Tnq�&}j\
\9\20 �e\26t��w&�\27_�\8t\0257\8t\25�ck\28>��O2k�$z|�\16o��\27^/X\9��\16W�\9v\25\26\9v\25ω{\24���Q\1+\8\6 ��\7f�Dv[\0\
\8\8 Jȶ\7\28��!\12\127V4\18�,%Y`��,p\19�W���\13\1�iSR�*F\24+\16\11\\\0\0\0\9\12\12\12M\12\12\12�L\12\12�\12\12\12\17�\12\12I\12\12\12��\12\12�L\12\12*\13\12\12Q�\12\12�\12\12\12��\12\12\13M\12\12j\13\12\12��\12\12�\12\12\12\13\13\13\12MM\12\12�\13\12\12ь\12\12\9\13�\12MM\13\12�M\12\12��\1\0&\2\0\0\29�\0\0�\0\0\1P\1�\1��A\1�\1B\3��A\1�A�\3\0\2\0\1�\1\0\1��\0\0��\1\2��A\1ǁ�\3\6�A\1\7BB\4@\2\0\1\29\2\0\1݁\0\0��\1\2\6�B\1A\2\3\0�\2\0\0�\2�\0\29B\0\2\6BC\1A�\3\0\29B\0\1\1\2\0\0@\2�\2�\2\0\0!B\2�\13�\1\0M��\0\6�C\1A\3\3\0�\3\0\0�\3�\0\29C\0\2\6CC\1A�\1\0\29C\0\1 \2�\127\6BC\1A\2\4\0\29B\0\1\6BD\1A\2\3\0��A\1�\2B\5��A\1�B�\5\0\3\0\1�\2\0\1��\0\0���\1��\2\0��A\1ǂ�\5\6�A\1\7CB\6@\3\0\1\29\3\0\1݂\0\0�\1�\0\29B\0\2\31\0�\0\11\7\21 �\1c<��*\127�|�`\16�~\27�\31A5/�\22}O�Ck\26�+Z�\\�\13\16\6\16I\25x��ctC�d07�jGD�{\8�b6\13�U\0095D\7b\3\0\0\0\1\2\1\3\0\0\8\7!\25(J�*\127\12�i�Ħ3k�M;�@ Mv��\12�\13�gBT�$\30��\26\18\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0\4\31\7\8\15\24j\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0$@\4\5\0\0\0\7\11\30\2j\4\4\0\0\0\9\5\25j\4\4\0\0\0\24\11\14j\4\4\0\0\0\25\3\4j\4\
\0\0\0\30\5\31\9\2.\5\29\4j\3\0\0\0\0\0\0\0\0\4\7\0\0\0\0079\6\15\15\26j\3\0\0\0\0\0\0Y@\4\
\0\0\0\30\5\31\9\2'\5\28\15j\3\0\0\0\0\0\0I@\4\8\0\0\0\30\5\31\9\2?\26j\0\0\0\0\20pi\23�\9!k6��%p-S$\127\11�'�K�$\17��\4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 �7w\\<M?I�i\14p}Z\24q�\14\9\20 !p�4gd�>\22\29z\27���o+��uP�K!\127EJ|�\8t\0256\8t\25)�\12\24���^��5\15Ks�\14.�Zq���q�\9v\25\18\9v\25�U�K\\i�+>��\31�4#\1��F!��H\27�6�F��\26Mpt�>�}�&\1+\8\6 ��!\0083�\22\0\9\8\8 C��hU|V4\18�[�'�.�5\5�M?�\4^\29p\0\0\0PUUU\20UUU�\21UU�UUUH�UU\16UUU��UU�\21UUsTUU\8�UU�UUU��UUT\20UU3TUU��UU�UUUTTTU\20\20UU�TUU��UUPT�U\20\20TU�\20UU��TUsWUUH�UU\19�\20T\18T�W��\0\0]�\0\1P��\2��A\1�\1B\3���\0��\0\1��@\3�\1\0\2\25@\1\3\23�\0��\1�\2\0\2\0\2P�\1\3\23�\0��\1\1\3\16\2@\2\0\2\6CB\1A�\2\0\29C\0\1\25\0\0\1\23@\0��\2\0\4\23\0\0��\2\0\4\25@�\1\23@\0��\2�\4\23\0\0��\2�\4\6�B\1A\3\0\0�\3\0\0�\3�\0\29C\0\2\6�B\1A�\0\0�\3\0\1�\3�\1\29C\0\2\6CB\1A�\2\0\29C\0\1\1\3\0\0@\3�\3�\3\0\0!\3\4�\13�\2\0M��\0��\2\1���\1\6\4C\1A\4\0\0�\4\0\0�\4�\0\29D\0\2\6\4C\1A�\0\0�\4\0\1�\4�\1\29D\0\2\6DB\1A�\1\0\29D\0\1 C�\127\6CB\1AC\3\0\29C\0\1\6�C\1A\3\0\0��\0\0��@\7�À\0Ѓ�\7\29C\0\2\6�C\1A�\0\0��\0\0��@\7�À\0Ѓ�\7\29C\0\2\31\0�\0\4\7\21 �Ɨ;i��\3`�*o4fp\26;�\22\19�_\17~\20\2\16I\25�:�\4�[{U/y�W\3\0\0\0\1\2\1\3\0\0\8\7!\0255\19]u���XՓ�Q���\16g�Z\31�\22�\30.)�O�a�E шH\15\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�������\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0$@\4\5\0\0\0�����\4\4\0\0\0����\4\7\0\0\0�������\3\0\0\0\0\0\0Y@\4\
\0\0\0����������\4\
\0\0\0����������\3\0\0\0\0\0\0I@\4\8\0\0\0��������\0\0\0\0\27pi\23-I�\\)�2c\29�@�Z�vRk�2�=>h剸,W�\2r�B�\5\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 �\11U�K\30�y<|\21�\25g\30\8\9\20 O�\7\0258\9t\0255\8t\25�\16�\12�,�e1q�\14�a\9e���a�\9v\25\18\9v\25��A)�?|\20�eB�hj�\25{L��$ � 2P9�X�c�`�,~\13\1#\8\6 Y�\16'��\5p\9��W��u\19\16��O��>�x\
\31e�\31nY]�:�\20$\6\0\9\8\8 إ�5\5}V4\18Ķ�B��\20\5�Y�Ub\24�'?��f�\0\0\0\0\5\5\5D\5\5\5�E\5\5�\5\5\5\24�\5\5@\5\5\5��\5\5�E\5\5#\4\5\5X�\5\5�\5\5\5��\5\5\4D\5\5c\4\5\5��\5\5�\5\5\5\4\4\4\5DD\5\5�\4\5\5؅\5\5\0\4�\5DD\4\5�D\5\5Ą\4\5#\7\5\5\24�\5\5C�D\4B\4�\7��\5\5X�\5\4U��\7��D\4�\4G\6���\0��\0\1��@\3�\1\0\2\25@\1\3\23�\0��\1�\2\0\2\0\2P�\1\3\23�\0��\1\1\3\16\2@\2\0\2\6CB\1A�\2\0\29C\0\1\1\3\0\0\25\0\0\1\23@\0��\2\0\4\23\0\0��\2\0\4\25@�\1\23@\0��\2�\4\23\0\0��\2�\4F�B\1�\3\0\0̓\0\0Ѓ�\7\15�\2\6�\3�\7\13Ā\0\16�@\8O�\2\6\14D\4\8]C\0\2F�B\1��\0\0̓\0\0Ѓ�\7\15�\2\6�\3�\7\13Ā\0\16�@\8O�\2\6\13D\4\8]C\0\2M�\0\0P��\6��\0\0��@\7\0\0�\6MÀ\0P��\6�À\0Ѐ@\7@\0�\6FCB\1��\2\0]C\0\1A\3\0\0�\3�\3�\3\0\0a�\4�\14�\2\0N��\0��\2\1���\1\26\0\4\6\23@\2�F\4C\1�\4\0\0�\4\0\0\0\5�\0]D\0\2F\4C\1��\0\0�\4\0\1\0\5�\1]D\0\2FDB\1��\1\0]D\0\1`��\127FCB\1�C\3\0]C\0\1F�C\1�\3\0\0�\3\0\0\0\4�\0]C\0\2F�C\1��\0\0�\3\0\1\0\4�\1]C\0\2\31\0�\0\3\7\21 4�\6Q\21\9\16I\25��,)v٠9�\3{!�](N���k�<=z��\0/$�?y\3\0\0\0\1\2\1\3\0\0\3\7!\25.�\17V��Ei\15\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0pks|{l\30\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0$@\4\5\0\0\0s\127jv\30\4\4\0\0\0\127|m\30\4\7\0\0\0sMr{{n\30\3\0\0\0\0\0\0Y@\4\
\0\0\0jqk}vZqip\30\4\
\0\0\0jqk}vSqh{\30\3\0\0\0\0\0\0I@\4\8\0\0\0jqk}vKn\30\0\0\0\0\27pi\23�E�iђ\0259\20�5\15o��\008699'n\"�I\30ӵ\14`��@Fȵ\127\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 3\15�h�+�\15�\0\9\20 ���O\4g�[\127�$\30�;*sK\14�-d\20�tB&�[�)�@�\8+\11\29\9t\0253\8t\25�H�Cu)\0024\20��X\17\8v\25\26\9v\25@SPR�D,\19\1*\8\6 �ʶS���Ed;0Y\0\1\8\8 �\22�`'�b\19P�P\26^�k\19\2C�vCh^:���{�n�\6/g�\16�\127V4\0183΃l(��[��pI~܁\26���P�� %a\6=[�\0\0\0����͌��\13̌�j����\12��Ɍ��\13\12��M̌������\12��\9���ML���͌�ꍌ�\17\12��I��������͌�*���Q\12����\12��͍�\13͌�M\13�������\13��ɍ\12�\13M��M͌�����ꎌ��\13��\9�\12�M͎��Ό�͎��*���\17\13��J�B\1���\3\6�B\1\7\2C\4F�B\1GB�\4�\0]�\0\1��B\1�BC\5΂\0\0��\0\1P��\4\29\2\0\1݁\0\0\6�B\1\7�C\4F�B\1G��\4��\0\0��\0\0]��\1��B\1��C\5�\0\1�\0\0���\1M��\4\29�\0\1N\2\0\1�B�\1O��\4�\2�\0\24\0D\3\23\0\0�S\2�\4\6CD\1A�\4\0�\3\0\1�\3�\1\29C\0\2\6�D\1A\3\5\0\29C\0\1\1�\4\0@\3\0\2�\3\0\0!\3\14�\25@\2�\23�\0�\14ă\3�\0��\23@\0�\13ă\3�\0��\25\0\0\1\23@\2�\6�B\1\7�E\8F�B\1G��\8�DE\1]\4\0\1\29�\0\0\15\4\4\4�\2\4\0\23\0\2�\6�B\1\7�E\8F�B\1G��\8�DE\1]\4\0\1\29�\0\0\15\4\4\4�\2\4\0\25@�\1\23@\2�\6�B\1\7\4F\8F�B\1G��\8�DE\1]\4\0\1\29�\0\0\15\4\4\4�\2�\0\23\0\2�\6�B\1\7\4F\8F�B\1G��\8�DE\1]\4\0\1\29�\0\0\15\4\4\4�\2�\0\6DF\1A�\4\0�\4\0\5�\4�\5\29D\0\2\6�D\1@\4�\2\29D\0\1 C�\127\6�D\1A�\6\0\29C\0\1\6�F\1A�\4\0�\3\0\1�\3�\1\29C\0\2\31\0�\0\11\7\21 A\11�\18\30O�\30��\9\16U�\\k�W\11g\20\29Zb\28܈~}\4[*��\0166\20\7\16I\25�?�\3D\15�*V\127T%\9��\22��\
E�'�8\3\0\0\0\1\2\1\3\0\0\7\7!\25�ci\127F߽4��u\20\6�d\16滛r�\
�j\28\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�������\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0�v@\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0\28@\4\5\0\0\0�����\4\4\0\0\0����\4\5\0\0\0�����\4\4\0\0\0����\4\5\0\0\0�����\4\4\0\0\0����\3\0\0\0\0\0\0�\4\
\0\0\0����������\3\0\0\0\0\0\0\0\0\4\7\0\0\0�������\3\0\0\0\0\0\0Y@\4\
\0\0\0����������\4\4\0\0\0����\4\4\0\0\0����\4\4\0\0\0����\4\
\0\0\0����������\3\0\0\0\0\0\0I@\4\8\0\0\0��������\0\0\0\0\17pi\23\23.�N\\�,4�uj\23\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 �#2I���<�\
\9\20 .k�\13ǽ�K�\8r\19m\9t\25:\8t\25ٝ�w�X\22\6��z*\28��*;\\�\9��ga�X< 6��k���\18�J?\\6\8v\25\28\9v\25k�x�0\8~�\9܅YD\1#\8\6 x��bL�<Kl>�uĤ�1͐syig�\24�w�M���B\17_�U��n@\0\9\8\8 @�Dc�~V4\18׼Wf\"�\3\16�MZ~i�\16>�k.K<'d�\0\0\0��������7���P����6��󶶶76��w��������6��3���wv������з��+6��s�����������\16���k6����������7���P����7��󷶶77��w��������7��3�6�ww����������\16���+7��s�6���������74��P���k7����6��t��7���w��������4���������7�B�\1��\2�ς\0\1\15À\1�\2�\5\15\3\0\0�\2�\5\15C�\0�\2�\5\14�\0\2\15\3\3�NÀ\2OC\3��\3\1\2�C�\2��\3\7σ\0\1��\3\7�À\1��\3\7σ\3\5\15Ă\6�\3�\7\15\4\3\5OD�\6\14D\4\8�\3�\7\15�\2\6O��\4\14D\4\8O\4\3\5�D�\6N��\8\16D\4\8F\4C\1GD�\8�\4C\1��C\9�\4C\1���\9\14E\0\8݄\0\1\6\5C\1\7�C\
N\5�\7\29�\0\1�\4�\9�\4\0\1]�\0\0�\4C\1�\4D\9�\4�\7\14\5�\7�\4�\9\14E\0\8NE\0\8\15E\5\
�\4�\9��\0\1��\3\0\14\5�\0�\4�\9\4\5\0\0�A\0\0\23\0\0��\1\0\0\24@D\4\23\0\0��\4�\9F�D\1��\4\0�\5\0\0\0\6�\0]E\0\2F\5E\1�E\5\0]E\0\1A�\4\0�\5\0\3�\5\0\0a�\14�\25���\23@\0�\14\5�\8\23\0\0�\13\5�\8\25�\3\0\23�\2�F\6C\1G��\12�\6C\1�\6F\13�\6\0\
�\6\0\1]�\0\0OF\6\9NF�\7�@\6�\23@\2�F\6C\1G��\12�\6C\1�\6F\13�\6\0\
�\6\0\1]�\0\0OF\6\9MF�\7�@\6�\25\0�\0\23�\2�F\6C\1G��\12�\6C\1�\6F\13�\6\0\
�\6\0\1]�\0\0OF\6\9NF\6\8�@��\23@\2�F\6C\1G��\12�\6C\1�\6F\13�\6\0\
�\6\0\1]�\0\0OF\6\9MF\6\8�@��F�F\1��\4\0ƆE\1\6GF\1]F\0\2F\6E\1��\2\0]F\0\1`��\127F\5E\1�\5\7\0]E\0\1FEG\1��\4\0�\5\0\0\0\6�\0]E\0\2\31\0�\0\5\7\21 ���N���O��\"\5�?�*�hY|\27��}�p�(\29\5\16I\25�6\26BL�.fF��hD�V\13\3\0\0\0\1\2\1\3\0\0\5\7!\25\
|�\26\18j�\6\"R�t���h\30\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�����ץ\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0\28@\3\0\0\0\0\0�v@\3\0\0\0\0\0\0 @\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0\"@\4\5\0\0\0���ͥ\4\4\0\0\0��¥\4\5\0\0\0���˥\4\4\0\0\0��֥\4\5\0\0\0���ѥ\3\0\0\0\0\0\0�\4\
\0\0\0��������˥\3\0\0\0\0\0\0\0\0\4\7\0\0\0�����ե\3\0\0\0\0\0\0Y@\4\2\0\0\0ݥ\4\4\0\0\0��֥\4\4\0\0\0����\4\2\0\0\0ܥ\4\4\0\0\0��˥\4\
\0\0\0����������\3\0\0\0\0\0\0I@\4\8\0\0\0������ե\0\0\0\0\27pi\0233�XJs�>)P�5\
s{�-��O5�$m^K8�\19���8�\4�8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 \1�8s�\8\9\20 �C�YT\9t\0254\8t\0250�\13a�G\2F\11�(\15��C;G\8v\25\28\9v\25�-�.��J_dJ�s��`'\1.\8\6 �@6@�w\
\6��Lo�a2J�n�:�#\15�k8\0\13\8\8 \15>�\22�\13E\22\18<q$�:\24PK��\14�}V4\18���K�+\0172�\12dAD'=$po�\11\22\0\0\0���ߞ���^���9����_�ߙ_�\0G��\0�\0�\0�\0A\0��\0\1�\0�\0\17\1A\0\16AA\2݀\0\1\0\1�\0QAA\0\29�\0\1@\1\0\1�\1�\1�\1\0\2_\1\0\2\31\0�\0\8\7\21 t�J\5\18��Qf\22�f2��@�y\1~�C�\21�A�\31\7ĺq�9\25=���%\8\3\16I\25T�#C��\20\21\2\0\0\0\1\2\0\0\0\7!\25���1\6\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�������\4\5\0\0\0�����\4\6\0\0\0������\3\0\0\0\0\0\0�@\3\0\0\0\0\0\0p@\0\0\0\0\26pi\23�4�\28��>�=cOqB\0033�\31�bzx{\31���AS[�!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 M��N�\"\19\29߼�(Չ#C�\8�IC\3\9\20 !y�<\16i�1l�6-�R\27\18�]SF\"�Suּ�N~&f\31��\27\28�Б\2Z\9t\0259\8t\25�92=\
��v���F`roc�U�\24���sS|�{��\9\13��\20}}\8v\25\26\9v\25y��k\1��9\1/\8\6 ǀ�:���VW�=e�\
�}Sɭ ��r7\0\14\8\8 uB�]�Q)iE�<1J��o��|/h��&H}V4\18���B�\")A�m�g}��\127��\0238\21\0\0\0MHHH\9HHH�\8HH�HHHU�HH\13\0\0\0��\0\0�@\0\0&\1\0\0]�\0\0�\0\0\0��\0\0\1A\0\0f\1\0\0��\0\0�\0A\0\15A�\0�\0�\1̀�\1�\0\0\1\31\0�\0\11\7\21 �CNc�0�P��\28\"1�!_���]}�1\31���\22\15��I~m�X\6\9\16I\25�6�\4P.�/���8rA�\2���P�~+pL\19�\6\24:\17.\1\0\0\0\1\2\9\7!\25���7cϹ\29���\8�Tk^�!Q\\�V�W��\23!xDz\29\6\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0-6.!&1C\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0�@\3\0\0\0\0\0\0p@\0\0\0\0\19pi\23n�� \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 \31<A �\3\9\20 Ő�Ms�e\\���2\27K�?9�\0176��BW#rg? �\"Xo\9�\19�x\18\9H\9t\0253\8t\25\21+/S\9\11�6��Mis\8v\25\30\9v\25���\18��\13\26y�-�4�D4�E~�\30f[\1+\8\6 픀!܌TF\0\12\8\8 �=�u��\15\4�d�j�y�\21�}V4\18�\
oc��RO\7��g�UP#3Hd\5A\0\0\0���Â���B���%����C�Æ���BC��\2������ÞC��F���\2\3���å���^C��\6�C��\1\1\0AA\0\0�A\1\0�\1\0\0݀\0\0\6�A\1\7�A\2F�A\1G\1�\2�\1\0\2������\1����\3��\0\1�\0\0\3�\1\0\2�\1C\1��\0\1�\1\0\2\17\2C\1\16BC\4݁\0\1\0\2\0\2QBC\1\29�\0\1F�C\1�\2\0\0�\2�\0]\2�\1\0\3�\2NC\2\3\29�\0\1\26�\0\6\23�\2�\0\3�\2N��\3\29�\0\1\26�\0\6\23�\1�\0\3�\2N�\2\4\29�\0\1\26�\0\6\23@\0�\3\3�\0\31\3\0\1\3\3\0\0\31\3\0\1\31\0�\0\6\7\21 �ǷbSD�]\
�R�@�k\14\4\16I\25\31\21�%�K`\"�Zc=�M�\26%�R5\3\0\0\0\1\2\1\3\0\0\5\7!\25��AH�\"Jz\3�AI{�#\15\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�������\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0�V@\4\5\0\0\0�����\4\6\0\0\0������\4\4\0\0\0����\3\0\0\0\0\0\0Y@\3\0\0\0\0\0�o@\3{\20�G�z�?\3\0\0\0\0\0\0�@\3\0\0\0\0\0\0p@\4\12\0\0\0������������\0\0\0\0\19pi\23�m�j\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 Vb\23n�\0\26PHD\0046�Y�A|�14BeIc�$:��-��hv�\3\9\20 \18��C�|QcD\
\0123\28p�\17uA$W\7u�\25�_/1��V�\15�J�p\7\27�\9t\0254\8t\25�v<>���x���\13v3�`a\8v\25\25\9v\25��g\4\1+\8\6 \15ԁ\27R�\127c\0\15\8\8 �ԛk�5�\25LlE^H��\31ݚ�|?��\2�L�M}rV4\18\"3�i�\0�6�kK0f=�\28�p�H��o\7m�B6Q��y��\12^T�\4\1P\0\0\0x}}}<}}}�=}}�}}}`�}}8}�}��}}��}}|||}\27|}} �}}�=<|��<|�=����}��=�|��}|=}}|��?|�}�}�@\0\1�\0\0\0�\0\0\0\1\1\0\0��\11���B\1�A\1\0�\1�\3\7B\1\0\7�@\4�\1�\1FBA\1G��\4�B\1\0�\2C\5�BC\5]�\0\1�BA\1��A\5�B\1\0�\2�\5�B�\5Ђ�\5��\0\1�BA\1ǂ�\5\7C\1\0\7\3C\6\17�C\6݂\0\1\6CA\1\7�C\6NC\2\3\29�\0\1Y\0�\0\23�\2�\6CA\1\7�C\6N��\3\29�\0\1Y\0�\0\23@\1�\6CA\1\7�C\6N�\2\4\29�\0\1\25\0�\0\23\0\1�\6�B\1C\3\0\0\29C\0\1\3\3\0\0\31\3\0\1���\127��B\1�\0\0\0�@\0\1�\0�\0�\0\0\1\31\0�\0\11\7\21 g��+=9A?��n\0131�d9�l\5 �,4\"+L�=�\28|N�\0�=\14\7\16I\25 /\
k��Q)\24s�:l�OI�g\31I�\13�7\3\0\0\0\1\2\1\3\0\0\0\7!\25S��\22\16\0\0\0\3\0\0\0\0\0\0�?\4\6\0\0\0������\3\0\0\0\0\0\0\0@\4\7\0\0\0�������\3\0\0\0\0\0�V@\4\5\0\0\0�����\4\6\0\0\0������\3\0\0\0\0\0\0Y@\3\0\0\0\0\0�o@\3{\20�G�z�?\4\11\0\0\0�����������\4\12\0\0\0������������\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0�@\3\0\0\0\0\0\0p@\4\4\0\0\0����\0\0\0\0\27pi\23�{G\25u�M\0\6c�a-�I�$\4\29��k*(�\2QI�FS\6�F$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 �\18�\1�:�}v\15\9\20 *\5�?��P9��\21\4�K\15h\22:�d���\8�\9t\0257\8t\25*7�\25\22a�\24�U\
P��UO��y?J��z|��T�\8v\25\16\9v\25T\3�,���5�W�3��\"e�ڍt\31i�\31���\1\31��8\1(\8\6 u��I\0\
\8\8 Y��6q��Kn~V4\18v�HWA\31�Z�n�*\1�^[�j\5C\8��\15�\0\0\0knnn/nnn�.nn�nnns�nn+n�n��nn��nnooon\8onn3�nn�./o��/o�.��n�.�o��no.nno��,o�n�n�.no�nnnw�.oy.n��nnn�nno�nnn�nnn�n�ooonnϮe��,o�/on�o�mi,oni�.j�o�o(,/oG��\4�B\1\0�\2C\5�BC\5]�\0\1�BA\1��A\5�B\1\0�\2�\5�B�\5Ђ�\5��\0\1�BA\1ǂ�\5\7C\1\0\7\3C\6\17�C\6݂\0\1\6CA\1\7�C\6NC\2\3\29�\0\1Y\0�\0\23�\2�\6CA\1\7�C\6N��\3\29�\0\1Y\0�\0\23@\1�\6CA\1\7�C\6N�\2\4\29�\0\1\25\0�\0\23\0\1�\6�B\1C\3\0\0\29C\0\1\3\3\0\0\31\3\0\1���\127�@A\1�\0D\1�@D\1�\0�\0�@\0\0�@A\1��D\1��\4\0\1\1\5\0���\1�@A\1ǀ�\1\1A\5\0A�\5\0݀�\1\6AA\1\7�D\2A\1\0\0��\5\0\29��\1F\1F\1�\1\0\2�\1\0\0��\1\0�\1�\3́�\3\21\2\0\0\7\2\2\0\7�@\4\13�\0\4]A\0\2FAF\1�\1\0\0]A\0\1F�F\1�\1\0\2�\1\0\0��\1\0�\1�\3́�\3\21\2\0\0\7\2\2\0\7�@\4\13�\0\4]A\0\2FAF\1�AA\1��D\3��\6\0\1\2\7\0�\1�\1]A\0\0FAG\1�\1\0\2�\1\0\0��\1\0�\1�\3́�\3\21\2\0\0\7\2\2\0\7�@\4\13�\0\4]A\0\2F�B\1�\1\0\0]A\0\1FAF\1�\1�\1]A\0\1C\1�\0_\1\0\1\31\0�\0\0\7\21 ��_32�)\14\0\16I\25~�i\3\3\0\0\0\1\2\1\3\0\0\9\7!\25�+�<�h\13~�W�MFr3&\28l�*j$j\3\17��Y�L\7\16\30\0\0\0\3\0\0\0\0\0\0�?\4\6\0\0\0\2\23\20\26\19v\3\0\0\0\0\0\0\0@\4\7\0\0\0\24\3\27\20\19\4v\3\0\0\0\0\0�V@\4\5\0\0\0\27\23\2\30v\4\6\0\0\0\16\26\25\25\4v\3\0\0\0\0\0\0Y@\3\0\0\0\0\0�o@\3{\20�G�z�?\4\11\0\0\0\29\19\19\6%\21\4\19\19\24v\4\12\0\0\0\17\19\0025\25\26\25\4$14v\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0�@\3\0\0\0\0\0\0p@\4\4\0\0\0\23\20\5v\4\11\0\0\0\4\23\24\18\25\27\5\19\19\18v\4\
\0\0\0\17\19\2$\24\0188\3\27v\4\7\0\0\0\4\23\24\18\25\27v\3\0\0\0\0\0\0\20�\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0y@\3\0\0\0\0\0��@\3\0\0\0\0\0\0\"@\4\
\0\0\0\2\25\3\21\0302\25\1\24v\4\7\0\0\0\27%\26\19\19\6v\4\
\0\0\0\2\25\3\21\30;\25\0\19v\3\0\0\0\0\0\0D@\3\0\0\0\0\0\0N@\4\8\0\0\0\2\25\3\21\30#\6v\0\0\0\0\19pi\02313uy\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 �\3�)\19K1\5�� \11��vrS�G@9\15\9\20 s��em�?h)�h4}�DU�ۓo��4\17�\9t\0257\8t\25P&\3\2sq(\22�x�u{��f�7\17\24���`ӌ�J�\8v\25\31\9v\25�@\7\127\27��1�&�C\26e<H��[k�)�F�i�q\1*\8\6 �8tdWm�\27�s�(\0\11\8\8 :7%\14�\2=i���^\24}V4\18k�\29G5n�n�Ym$)��6,Y�\127X\0\0\0\29\24\24\24Y\24\24\24�X\24\24�\24\24\24\5�\24\24]\24�\24��\24\24�X\24\24\25�\24\24~\25\24\24E�\24\24�\24�\24�\24\25\24\25Y\25\24Y\25\24\24�\25\24\24��\24\24�X\24\25\15\24\24��\24\24\24\4Y�\24\15\24\24�\1�\0\0A\1\0\0�\1\0\0��\1\0\1\2\0\0U\2\0\2�\2\0\0!B\7�\6C@\1\7�A\6A\3\2\0�C@\1�CB\7�\3\0\2\0\4�\5@\4�\5�\3\0\2\29�\0\0\27\3\0\0\23@\2�@\3�\3��\2\0�C@\1�C�\7\0\4\0\2@\4�\5�\4�\5݃\0\2���\6\23�\1�@\3�\3�C@\1�CB\7�\3\0\2\0\4�\5@\4�\5��\0\2ց�\6 \2�\127\6B@\1\7�A\4@\2\0\0�\2�\3�\2�\1\29�\0\2\27B\0\0\23�\1��B@\1�BB\5�\2\0\0\0\3�\1���\1���\2\23@\2��B@\1�BB\5�\2\0\0\0\3�\1N\3@\4��\0\2���\2�\0�\4M\1�\2\23��\127�\1\0\1\31\0�\0\7\7\21 y�8���\21��'�nq\31/\2�-\19\11\16I\25��\28jwhA+\9'K\7��\23\28\31��n#��O��s\7\24��5��qA\5�7+\3\0\0\0\1\2\1\3\0\0\7\7!\25\"c ]�*-T\9\14�\9\\�Ek{-j=\7\1qh\11\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0JMKPW^9\3\0\0\0\0\0\0\0@\4\2\0\0\0y9\3\0\0\0\0\0\0\8@\4\7\0\0\0WLT[\\K9\4\1\0\0\0009\4\5\0\0\0_PW]9\4\12\0\0\0\17\16\23\28\18\20\19\6bg\0299\4\4\0\0\0JL[9\4\2\0\0\0\0289\0\0\0\0\22pi\23��\12r�/���\19�=\0001\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 N�Lv�-�Q�d�BD�JW\18�o\1O\11\17\
��G!,\12\9\20 \26\19�\15�?�\3�\0134\4 �\14D\16\0�-�\9t\0258\8t\25�y�\
<\29�\2�4sl�G�=���xS�R\29\0037�\14�t+�\8v\25\30\9v\25��\127\127|��&6�j\17���~7a�v\30b>e\1 \8\6 �H\28m\30��6V�E��fD0{g8��O���e\127ƈ)*_�{\0\
\8\8 )\6.-\5m\20\0�~V4\18\25�wm�YDu#6]�\23\16d7'�\1\14\27\13V\19\0\0\0���ז���V���1����W�\0F��\0G��\0�\0\0\0�\0\1\0]��\1X@�\0\23�\0����\0��\0\1\23@\0��@\0\0�\0�\0�\0\0\1\31\0�\0\7\7\21 :^�\16�\1\3\2p\12�\23U\16o9\"(\4\3\16I\25g��\14���\30\2\0\0\0\1\2\0\0\11\7!\25�N�\17+�\13\12u�\16:&5YW��tP�nxr�&�&|Q#6%5\1\28���\"\7\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0_X^EBK,\4\3\0\0\0EC,\4\5\0\0\0C\\IB,\4\2\0\0\0^,\0\4\6\0\0\0O@C_I,\0\0\0\0\26pi\23N;/I���\"�M\1e�A�#\21ր\26L-[)�d\27\1��~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 `��\21^(�}qvkm_�\14\29Y�rf\26e�\26s\14\9\20 �\
h\23\29y�?a\7PO���+�-�Tş\8txq>1�\9t\0252\8t\25J~}Eku�\30�\8v\25\25\9v\25bJv&\1-\8\6 �N\9\0004ɓm{~�ia�s\0\0\11\8\8 Ĵe\0058?�S\\�\25 |~V4\18���5���\11;�\1k\28{�R�p6rU+�\5\22\0\0\0y|||=|||�<||�|||a�||:��\0G��\0�\0\0\0�\0\1\0]��\1[\0\0\0\23�\1��@�\0\1�\1\0���\1���\0�@\0\1�\0\0\1\23@\0��\0\0\0�\0\0\1\31\0�\0\8\7\21 1x�-*60\29�\14�U�\127 }���Hl<g*W\31)qU:*z���H���6\5\9\16I\25\0�?[\4�\28]�?(\7��H[8��Jc��p)��[f0\18@\2\0\0\0\1\2\0\0\7\7!\25a�i/�\18,`_�\23\4*>\0-\127�\27\22�m�\15\8\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0\0\7\1\26\29\20s\4\3\0\0\0\26\28s\4\5\0\0\0\28\3\22\29s\4\2\0\0\0\1s\4\5\0\0\0\1\22\18\23s\4\5\0\0\0Y\18\31\31s\4\6\0\0\0\16\31\28\0\22s\0\0\0\0\16pi\23�l\26i��\17\2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 \16�\4My\14�5/ds<���an��'���\"\1\
\9\20 N\26AC��W!\0o�0�\9t\0259\8t\25�\22�\0�\\)&�\22�^�D8a+\20�\29��Wg#s�*�\2Kfb��\16�\8v\25\29\9v\25~�6\27��\31?ohIP(��n�o�!\1(\8\6 �\4�{\0\12\8\8 ��+a��H-��\1\27P�\29}~V4\18��x@�8*n�{�\22\26\16�\3R݁\15��G\28\0\0\0x}}}<}}}�=}}�}}}`�}};��}:��}�\0\0\0�\0\1\0]��\1�\0\0\0�\0\0\0[\0\0\0\23@\2�\12A�\0\29\1\1\1\23@\0����\1�\0�\1\"A\0\0���\127\12��\0\29A\0\1\23@\0�\3\1\0\0\31\1\0\1�\0\0\1\31\0�\0\7\7\21 K�,\16�G�ms\27,\25*9eq�[\\\11\
\3\16I\25M�2\28�^�q\2\0\0\0\1\2\0\0\3\7!\25\9`\31xQ<�\12\7\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0rushof\1\4\3\0\0\0hn\1\4\5\0\0\0nqdo\1\4\2\0\0\0s\1\4\6\0\0\0mhodr\1\4\6\0\0\0bmnrd\1\0\0\0\0\26pi\23x�hHy��{\19�'r��gc\17�Mw�f�>|�D���?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 Ί?\7�\12�;P>�D�vww��z\14�\14\9\20 w��HL\19[w�@�f�0�!Gj�Y��?\0�\24\19'1\
t\0255\8t\25�\29�$�\25�\6C�bA�0v[\16\27q>�\8v\25\25\9v\25#��<\1*\8\6 �G}g\\��u���\2\0\12\8\8 Um�H\20ڶS_��)�Nq3�~V4\18�\1x}�mRǊ�s'\15�R׾�#>4�<$\0\0\0����٘��\25ؘ�~����\24��ݘ��\25\24��YX������]�\0\0�\0�\0�\0\1\0\1A\0\0AA\1\0�\1\0\0��\0\0ƀA\1���\1\0\1\0\0@\1\0\1݀�\1�\0\0\0\23@\2�%\1\0\0@\1\0\2�\1�\0]A\0\1L\1�\1]A\0\1C\1�\0_\1\0\1W�\0�\23@\0�\3\1\0\0\31\1\0\1\31\0�\0\1\7\21 y��\
�d�^���#\7\2\16I\25�}�\5%��\21\31�/\3\0\0\0\1\2\1\3\0\0\9\7!\25i_HW�\28\17\11S��J-�}:�\24�G��g���!$\16�=\9\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�����ֱ\3\0\0\0\0\0\0\0@\4\6\0\0\0����Ա\3\0\0\0\0\0\0\8@\4\2\0\0\0Ʊ\4\3\0\0\0�ޱ\4\5\0\0\0���߱\4\6\0\0\0����Ա\1\0\0\0\8\9\20 я]h�\1\9\20 \20d\24*\16�\127\15�ۚ\9\16\23�<e�\0s���&��*S\17��p�\9t\0251\8t\25)\11Cn�\8v\25\30\9v\25%�+@\17��\5�L�&�}�v̤js߷�,\0+\8\6 -)h/bԚ\12\1\13\8\8 �a(W��\23\12:��\0045Bg7�=\24>\22pV4\18g�u&\6��\25]\18\16q{1�P\0224=)F�z�H4\13|\31>\28\26\0\0\0W\22\22\22�\22\22\22�\22\22\22w�\18�PWV\22�\23\23\22K�\0\1\24��\2\23�\0�E\1�\0�\1\1\0]A\0\1\23�\2�E\1\0\1L��\2�\1\1\0]A�\1U\1\0\0X@\1\2\23�\0�E\1\0\1L��\2�\1\1\0]A�\1`��\127\31\0�\0\6\7\21 \17�^`��5\13�h�l:�N\8\4\16I\25!\22\18-K�iT%H'E���#\24��G\3\0\0\0\0\2\1\4\1\3\6\7!\25\23�g\25E�<wfԓ~\28�ii1\18eN-��\
VhIn\5\0\0\0\3\0\0\0\0\0\0�?\4\5\0\0\0�����\4\6\0\0\0������\4\6\0\0\0������\4\3\0\0\0���\0\0\0\0\19pi\23���H\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\17pi\23L?ge*�9oׄ�e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 'tu\30\7$,o\13\1\9\20 ��\1\3IY�\14t��JS��\31�>\\&g4�\16�K\\r\\>�\17\"\
t\0256\8t\25F\6D`\12\14\0261_�SW��]/Mu�&͑ .\26\11v\25\28\9v\25��-��\0302s��\1\5��_\1*\8\6 �D�\
ğ�_��/7\0\2\8\8 ��DLB��O¦�f��p;��\13D~6,\\��r>�'�R�� ')�d^�qV4\18\
��Pڤ�\
\1R�@P�\0041��;a�:\24N�b`3(�b.p[F-\0\0\0�����.ﯯI����/��꯯�./��nﯯ�����/��*�/�n�\0\0\1A\0\0A\1\1\0�\1\0\0��\0\0�\0�\0\1A\1\0A�\1\0��\1\0�\1\0\0݀\0\0\6\1B\1\7AB\2@\1\0\0�\1\0\1\29��\1\27\1\0\0\23\0\3�L�B\2�\1�\0]A�\1\24\0�\1\23�\0�L�B\2��\2\0]A�\1L\1C\2]A\0\1C\1�\0_\1\0\1\23@\0�C\1\0\0_\1\0\1\31\0�\0\4\7\21 �\16\17\16�Jzx��{Ӓ�o��E`~0\"\6\8\2\16I\25��u\23\25c�N�\12�\27\3\0\0\0\1\2\1\3\0\0\9\7!\25�\9Z5x\
 WS\21f+Z@�\17N˒\21\29=[~L4�8wj�s\13\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0~y\127dcj\13\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\2\0\0\0z\13\3\0\0\0\0\0\0\16@\4\7\0\0\0cx`oh\127\13\3\0\0\0\0\0\0\0\0\4\3\0\0\0db\13\4\5\0\0\0b}hc\13\4\6\0\0\0z\127dyh\13\4\3\0\0\0\0\7\13\4\6\0\0\0nab~h\13\0\0\0\0\24pi\23�\\�p�U�DuH~\2��w1�F�u[�i>\9��I\31# V�#� 7�\13\16\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 gk\19\2.r�NB�t\25Pb�\27�\3\9\20 MPg\7���0.�\27aY\23\
LЂg8I�=\127GT\14\13b�\"?�˩O��j\30&\
t\0259\8t\25�@v\25�/�d��]\2\15�~-���}�l�\0�[~.W\25|\6��f5\11\11v\25\25\9v\25�n�\7\1.\8\6 /T\5:e<~h�^�/^ƒ\8�'�\1��QK�'�\22\0\13\8\8 G\17�R/�pG!�\\�(�\30�1�\127\31qV4\18a��>�E�+�Y<J�)o\11���D��&/R��\13�@}r\27N�,\
\0\0\0\26\31\31\31^\31\31\31�_\0\0�\0\0\0\29�\0\0F��\0G��\0�\0\0\0]@\0\1\31\0�\0\7\7\21 l�� rgv3��\5D~~N4��?;\4\8\16I\25��SnY\18�#�/� \12��v\0:�%��Ll���\13�Y6!\5\2\6?\2\0\0\0\1\2\0\0\8\7!\25\20;�}�*�]ҡ�T~��Y���\0093��\19l�=\5K\1�S��?\31\4\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�����ܻ\4\3\0\0\0�Ȼ\4\7\0\0\0�����޻\0\0\0\0\23pi\23��\0024x\12-�¹<\1��/h��;\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 ���f!\23\18\30L��!���^e\13\9\20 =\30�E^ܮ\30�Q$�\11o0\23\
t\25:\8t\25��r&���2�ّf\0��\"S��'�u�\4�\0�^5?(\28��\12\4��{N\15\11v\25\17\9v\25\18�(>�\0237\5.�*Ll\28+kN/2�)�\0309K�4�u�\12�\20�\30\0(\8\6 ٌ\8+\1\15\8\8 ��Qz[�cc�aZ5���?��\18\2��Yj�]p�yV4\18\25z<#%\0\0\0ҔԔ�\20\20�\16���R�ԔI\20\20��\20T����\20�UԔ��Ֆ�\1�\1�A\1\0V��\2��\1\0\29��\1�\0\0\2\23�\1�\6�@\0\7\1A\2@\1�\1��\1\0V��\2��\1\0\29��\1�\0\0\2�\0\0\0\23�\1�\12\1B\1�\1\0\0\29A�\1\12AB\1\29A\0\1\3\1�\0\31\1\0\1\23@\0�\3\1\0\0\31\1\0\1\31\0�\0\
\7\21 �!�\"m\5�J0�S^�\"C\1�D�f\19�`b3!�O��rO\7\3\16I\25q��\6�\17\23z\1\0\0\0\0\0\2\7!\25�D\0069�;�\24�9\8k\
\0\0\0\4\
\0\0\0\2\0\17*61\28\21\0e\4\9\0\0\0\16\22\0\0235\4\17\13e\4\8\0\0\0\4\11\1\23\
\12\1e\4\3\0\0\0\12\
e\4\5\0\0\0\
\21\0\11e\4\17\0\0\0J\9\16\4J\17\22:\0\0:\4\9\12\4\22e\4\2\0\0\0\18e\4\18\0\0\0J\6\
\11\3\12\2J\4\9\12\4\22K\6\3\2e\4\6\0\0\0\18\23\12\17\0e\4\6\0\0\0\6\9\
\22\0e\0\0\0\0\19pi\23dP�7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 \18\6b[�Y�\18v�,\23E�\22\20��m\
\21Ӷz�\8\9\20 �\16|\\\27\
t\25:\8t\25.��R3B+\5PK\0254\19*�K\22)�g��Y\25\0A�\25k\22^\30�\11\17L6��z1\11v\25\29\9v\25��8{4�5b�\17\25\0030�\0150�\19fZ\0+\8\6 �\3�J\27-�S\0\13\8\8 S�#\12-3$/O\127Y\16��P#r�:C$~V4\18k��P��^\4���z��W\25\"b�V��\127\4\0\0\0\"$d$A@\0\0\29@\0\1\31\0�\0\0\7\21 5�r\"�\23Ug\2\6\16I\0256�\"<9.�\5���2l˿6�~�E!i\20.���\24\1\0\0\0\0\0\7\7!\25RZ$^��[sZ�I|\0^�(��\29G($\14z\2\0\0\0\4\6\0\0\0�����\4\11\0\0\0����������\0\0\0\0\26pi\23��Avw�g\
\29�qXA�|9S\9/%��yv��c\
G��)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 �\25�\\��+'��OK9n*c\0208� '\13\9\20 �\30�U.�Y7��zw>G\1(v\
t\0251\8t\25+�7[4\11v\25\30\9v\25�\3\\0.O�D'\20�|\2��\20TF�)ao7_\1#\8\6 a/�1��V5zW�F��\14;{�:V��\26�`q/r56G�$\3\19qp�e\0\0\8\8 {�.:VG'1v��\6�&\28[�\14DA���\3QE�0���x(~V4\18�ݷX���V�\5�@��\19\9��|\27�\25�=C\0\0\0.(h(ih((5�()n(h(��((u�()b(驯h�(�)(��()0��)?h+�.)j(/ij*h)()��*(5�\1\27\1\0\0\23�\1��\1B\0��B\3�\1\0\1\0\2\0\2@\2�\2�\1\0\2�\1\0\0\7A�\0A\1\3\0\29�\0\1\24��\2\23@\3��\1B\0�AB\3�\1\0\2\1�\2\0���\1�\1\0\0\23�\1�\6\2B\0\7�B\4@\2\0\2�\2\0\3�\2�\3\30\2\0\2\31\2\0\0�A�\0�A\3\0��\0\1\24��\3\23@\3�\6\2B\0\7BB\4@\2\0\3��\2\0\29\1\27\2\0\0\23�\1��\2B\0��B\5�\2\0\3\0\3\0\4@\3�\4�\2\0\2�\2\0\0\3\2\0\0\31\2\0\1\31\0�\0\0\7\21 0\23EE\15��\28\14\0\16I\25�F;w\1\0\0\0\0\0\6\7!\25\24\31\8?X9�\5/��\12o�\3Z\3�H5�\13\31T\27�\6m\14\0\0\0\4\8\0\0\0UBVRNUB'\4\3\0\0\0T]'\4\13\0\0\0T]HDLBS\9OSSW'\4\8\0\0\0snjbhrs'\3\0\0\0\0\0\0\8@\4\8\0\0\0UBVRBTS'\4 \0\0\0OSSW\29\8\8NW\9DONIF]\9DHJ\8@BSNW\9FTW_'\3\0\0\0\0\0\0i@\4\7\0\0\0TSUNI@'\4\5\0\0\0ANIC'\4\19\0\0\0\2C\12\2\9\2C\12\2\9\2C\12\2\9\2C\12'\4\4\0\0\0TRE'\4\18\0\0\0OSSW\29\8\8PPP\9NW\9DI\8'\0041\0\0\0OSSW\29\8\8PPP\9IBS\9DI\8TSFSND\8DRTSHJBUDFUB\8^HRUNW\9FTW'\0\0\0\0\19pi\23�\\�w\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\3\9\20 ���\14��\23S�^�\2�\0239\127\6nJ\27�c�\3L\17�H�-Mj�L\7\25�{�Pg\3\9\20 R$�A\6�gp���\19�&�!\22�Z\16,�aM(�-/��\127':L\6i<�vZa\
t\0251\8t\25\18��0_\11v\25\30\9v\25\20�\21\16|�`gc��V7�\18E�th\0065_\0\1#\8\6 �1�;��E\3�g�R��VB��\6 y�\27n�#A\15D�\31\22��l87$t\0\1\8\8 h\25g.>��d<�W$@�OT��th��$L+\31\127�Kf\28���\13^yV4\18���>\"\0\0\0[^^^\31^^^�\30^^�^^^C�^^\27^�^��^^�\30^^_�\0\0f\1\0\0]�\0\0�\0A\1�\0�\0\1A\1\0�@�\1��A\1���\0\24�A\1\23�\1��\0B\1�\0�\0\1A\2\0@\1\0\0\22A\1\2�@�\1\23�\0��\0B\1�\0�\0\0\1\0\0�@�\1��B\1�\0�\0�@\0\1\31\0�\0\0\7\21 a��k0c+&\6\6\16I\25�m\0151\20\2�\14��s\5}��\4�3,J^W�\8R%�W\3\0\0\0\1\2\1\3\0\0\0\7!\25�N�\15\11\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0\20\19\21\14\9\0g\3\0\0\0\0\0\0\0@\4\13\0\0\0�����ˁ���g\4\8\0\0\0\14\9\14\19+\8\0g\3\0\0\0\0\0\0\0\0\4\
\0\0\0\0\2\19(43\30\23\2g\4\4\0\0\0\14\8\20g\4\5\0\0\0\16+\8\0g\4\8\0\0\0<#&3\":]g\4\9\0\0\0\4\11\8\20\2+\8\0g\0\0\0\0\17pi\23D�&b��t/���_\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\3\9\20 \17x�{�&hA��F6h�\11L\5؞M�>`U�;^m75N���\11�]�:�\13\9\20 �{�;q\6�\11 \13\21~��\12X�\
t\0257\8t\25q��7��m3hұH@r-rT?\0\\�U�)0r�KJ\11v\25\18\9v\25\00175t���j�_�^��7\20O�\
}� @n�!�\15F\19s>3��$\14��[\1#\8\6 \
��y��\1:�\"GZ\2��\5�\6�t.��\26\
\6f>n�Y0�֒&*\19{<\0\15\8\8 ��2U��%t���;6��\29�<Sf�\25�\23�%�G�yV4\18�\\�;�\0\0\0���ܝ���]���:����\\�ܹ���Z\\\28�\29\28��A\\��\27ܝ�ڝ\29ܜ����]�ݜ�\\�\\���\29]��J\29�߁]�݇����\\�\\�\29\29�\\���\29]��J\29�߁]��[�\30�G����\\�\\[�\30�C������\\\\�\\�\28���ݞ��\
�^�A]��G���˜�\\[\29\29�\28���ݞ��\
�^�A]��\27ݞ�\7����\\�\\\27ݞ�\3����\\�\\\27�B\3�\1\0\0\23�\0�ǁB\3�\1\0\1\23\0#���B\3�\1\0\0\23�\0���B\3�\1\0\1\23�!�\31\0\0\1\23\0!�@\1�\0�\1\0\2�\1\3\0��\1\3]�\0\1[\1\0\0\23�\
�G��\1�\1\0\2�\1\3\0��\1\3]�\0\1�\1�\2�\1\0\0\23�\0��\1�\2�\1\0\1\23�\28��\1�\0�\1\0\2\1B\2\0�\1�\3��\0\1�\1\0\0\23�\26����\1�\1\0\2\1B\2\0�\1�\3��\0\1�\1B\3�\1\0\0\23�\0��\1B\3�\1\0\1\23\0\24�ǁB\3�\1\0\0\23�\0�ǁB\3�\1\0\1\23�\22���B\3�\1\0\0\23�\0���B\3�\1\0\1\23\0\21�\31\0\0\1\23�\20�@\1�\0�\1\0\2�A\3\0��\1\3]�\0\1[\1\0\0\23�\
�G��\1�\1\0\2�A\3\0��\1\3]�\0\1�\1�\2�\1\0\0\23�\0��\1�\2�\1\0\1\23\0\16��\1�\0�\1\0\2\1B\2\0�\1�\3��\0\1�\1\0\0\23@\14����\1�\1\0\2\1B\2\0�\1�\3��\0\1�\1B\3�\1\0\0\23�\0��\1B\3�\1\0\1\23�\11�ǁB\3�\1\0\0\23�\0�ǁB\3�\1\0\1\23\0\
���B\3�\1\0\0\23�\0���B\3�\1\0\1\23�\8�\31\0\0\1\23\0\8�@\1�\0�\1\0\2�A\2\0��\1\3]�\0\1[\1\0\0\23\0\6�G��\1�\1\0\2�A\2\0��\1\3]�\0\1�\1�\2�\1\0\0\23�\0��\1�\2�\1\0\1\23�\3����\2�\1\0\0\23�\0����\2�\1\0\1\23\0\2����\2�\1\0\0\23�\0����\2�\1\0\1\23�\0�\31\0\0\1\23\0\0�\31\0\0\1\31\0�\0\8\7\21 \12�a)�\6\21PZ��\25�\25�\0239(�_��4X��(<G\27�;�Fd��\0156\9\2\16I\25���>�f�;��\26j\2\0\0\0\1\2\0\0\3\7!\25�l\19zbMt\26\14\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�������\4\8\0\0\0��������\4\3\0\0\0���\4\6\0\0\0������\4\14\0\0\0��������������\4\31\0\0\0ԁ����՗����Բ��������Ո�������\4\5\0\0\0�����\4\20\0\0\0��������������������\4\12\0\0\0Բ���Ջ�����\4\13\0\0\0�������������\4\19\0\0\0�������������������\4!\0\0\0ԁ�ֳ���՗����Բ��������Ո�������\4!\0\0\0ԁ�ֳ���՗����Բ��������Ո�������\1\0\0\0\14\9\20 \2p''\\�\25OWg�Vx��q���%�\25�l�Q8iN\12\9\20 ̧+b)��<SԇS`\9�Jˊ?rg\
t\0257\8t\25a.�(�^\5|X{�O\14�p~b�\21#�s29�\14WL\11v\25\17\9v\25�I�:\3��\5]��a���\127_̬/\2\127k\9�6h\127uU�\26\5�0\0*\8\6 ͼOq}ۉ\"�}rt\1\11\8\8 5-�\0117\5�\24�2(\0303yV4\18�\6�q\14\0\0\0u3s3ts�3�333�\0\0]��\1X��\0\23�\0��\0�\0��\0\1\23@\0��@\0\0�\0�\0�\0\0\1\31\0�\0\1\7\21 +y�G�¨J�\12\\a\4\5\16I\25�=o\26���_I�aY\21��L\1\0\0\0\0\1\5\7!\25<9'\16�\23w\7\14>�<���q\5\0\0\0\4\3\0\0\0'!N\4\5\0\0\0!>+ N\4\2\0\0\0<N\0\4\6\0\0\0-\"!=+N\0\0\0\0\23pi\23n\
`l�nL{WN�\6�_�\6�]�+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\20pi\23�\28Nx\0299iN\21��I\20�pVSf+ZL�?b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 �\11�e?��jK\11\9\20 �tjk=�&Q�\
t\0254\8t\25�7ls%�\23E 6�Wz�;S�\11v\25\29\9v\25Z�r\22�\21a?d,uN<�e*qهU\0-\8\6 j��K\19��#W\"T\1���;\0\12\8\8 �y�PZb�h,\25�\
m��0(zV4\18�^Q\24\
kfXW\0\0\0\13(((n(h(�hh(��h)��h(���()))(�(�)u�((�(((2h��?h(���)(?()�2h��?h(��(*(?((��h*(�(((()()��(\1\11\1\0\0F�B\0�\1�\1]\1\1\1\23�\13���B\0�\2C\5�B\3\0\0\3\0\1A�\3\0�\3�\4ւ�\5��\0\1��C\5�\2\1\1\23�\
��C@\0�\3�\7\0\4\0\7AD\4\0݃�\1\24��\7\23�\8���B\0���\7\0\4\0\1A�\3\0�\4�\4��\3\0\0\5\0\7A\5\5\0\22D\5\8AD\5\0݃�\1�\3\0\0\23�\5�\12��\7\29D\0\1\6�E\0A\4\6\0\29�\0\1GDF\8���\8�\4\0\1\1�\3\0@\5�\4��\3\0�\5\0\7\1\6\5\0�\4�\9��\0\1��F\9�\4\0\0\23\0\1��\4G\0�D�\9\0\5\0\2G�F\9�D�\1�B\0\0c��\127b�\0\0�A�\127\31\1\0\1\31\0�\0\5\7\21 \24\12�\2���\
�P\15\
ʀdn\0294�[�B\7TN��a\25\11\16I\25�x�+Ȃ\0125��+Q\26�NB��mt\17\
�\31V�l\"r�Iy�5f��b8\1\0\0\0\0\0\9\7!\25�ĉg�l$tF��\30�>\0298��\30]r��)6\14�h���\2\30\0\0\0\4\9\0\0\0?$%>&).9K\4\7\0\0\0008?9\"%,K\4\6\0\0\0&*?(#K\4\9\0\0\0,.?\4\24\29.9K\4\8\0\0\0n/`en/`K\3������\"@\4+\0\0\0d;9\"=*?.d=*9d($%?*\"%.98d\9>%/'.d\
;;'\"(*?\"$%K\3\0\0\0\0\0\0 @\0042\0\0\0d;9\"=*?.d=*9d&$)\"'.d\8$%?*\"%.98d\9>%/'.d\
;;'\"(*?\"$%K\4!\0\0\0d;9\"=*?.d=*9d&$)\"'.d\
;;'\"(*?\"$%8K\4\7\0\0\0\";*\"98K\4\3\0\0\0\"$K\4\6\0\0\0;$;.%K\4\4\0\0\0'8kK\4\2\0\0\0dK\4\6\0\0\0'\"%.8K\4\4\0\0\0008>)K\3\0\0\0\0\0\0\16�\4\5\0\0\0e*;;K\4\5\0\0\0$;.%K\4\12\0\0\0d\2%-$e;'\"8?K\4\3\0\0\0009`K\4\6\0\0\0('$8.K\4\8\0\0\0009.:>\"9.K\4\3\0\0\00081K\4\6\0\0\0;'\"8?K\4\5\0\0\0009.*/K\4\19\0\0\0\8\13\9>%/'.\2/.%?\"-\".9K\4\6\0\0\0?*)'.K\4\7\0\0\0\"%8.9?K\1\0\0\0\3\9\20 5\29�,F)�X\7�\13]�bJ$�:]u<+Z0`\23}�\\�W��?w�K$\"W\14\9\20 HK�Z\25��V��\1!\20�\22\17�\21�\"��,\0�\28�p�\
t\0252\8t\25\6s:C\18�<�\11v\25\30\9v\25\31_�Zd\"�{\5��Wk�y�G\23��r\0 \8\6 �3M\8M�A\31���q�\31[e�:�Cg1�NF\\�?\"��@\1��&\1\15\8\8 ���by��\30��\29\30\0262b=���u}#\31?/\6yN�zV4\18 #5?���*\19\0\0\0������\1�@A��\1���W\1�\1]�\0\1�\0\0\0���\0�\0\1\1\23\0\1��\1A\0�A�\3\0\2\0\1@\2\0\3�A�\1�@\0\0c\1�\127�\0\0\1\31\0�\0\3\7\21 3\23�{\
\11\16I\25K�e]�9�w\4\23M59��HE��?\28��'s\8�a\15��Gi�0G�yS\1\0\0\0\0\0\4\7!\25[�\
Z�v\"&c�l}�`K[nJI\6\0\0\0\4\3\0\0\0>8W\4\6\0\0\0'8'29W\4\4\0\0\0;$wW\4\6\0\0\0;>92$W\4\6\0\0\0#65;2W\4\7\0\0\0>9$2%#W\0\0\0\0\21pi\23Og(.�H8h�!�Aj��kf\23\27^\11E�\0��\3:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\24pi\0231T\6@��8yJ��!]֌B���tI\9$\127���\31�\19�lN q4�B�h\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 �6�\4\26��\27`3 n�T�\2�d1\6�Q�z?).\6� Xz\13�v6�\14\9\20 �q�yݱ�M5\23<\30\4�g>���%�4\6N\3Wu\127�\
t\0257\8t\25�\0�;��k\0173\24\31\22\0��-��+J%h�$N��n�\11v\25\29\9v\25ƀ�'BL)5���i,3� ,��9\1!\8\6 �f�\14�ׅ<�\13�\11O��\9\28\1�B\27.(\6\\i\7@k|+.\0\14\8\8 \29��9H.\
|2�gf!�_xH\
�!�/n4�qV4\18�0�o��@\9I��z���\29��lSn%�\31���\12��gw4�jG>\0\0\0����Б��\16ё�w����\17��ԑ��\16\17��Pё������\17��\20�\17�PQ�������А�7���\12\17\0\0ƀA\1\1�\1\0݀\0\1\6�A\1A\1\2\0\29�\0\1K\1\0\0�\1�\0��B\2\11�\1\0\
\2\0�\
�Æ\
���K�\0\0J�Ĉ�\2\0\3J���\
B\2�FBE\1G\2�\4GB�\4�\2\0\3]�\0\1\
B\2�FBE\1G��\4G��\4�\2�\2]�\0\1\
B\2���\0\1�\0\2�����ƁB\1\24\0�\3\23�\1���E\1�A�\3\0\2�\2A�\6\0�\1�\1�\1\0\0\23@\0��\1\0\0�\1\0\1\31\0�\0\8\7\21 �u9aa�Ch[��{�\30�f�?=w8im8{,�r=��\0Tj!{�Z�x\11\8\16I\25��L)�>�@�<�z\8\21W%�9d'�\4-sP\31IG�i�[�#\2k\3\0\0\0\1\2\1\3\0\0\0\7!\25%��K\27\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�����ʭ\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\7\0\0\0�����߭\3\0\0\0\0\0\0\20@\4\8\0\0\0������ȭ\4\3\0\0\0�׭\4\13\0\0\0������ك���ݭ\4\4\0\0\0��ޭ\4\5\0\0\0���ȭ\4\8\0\0\0������٭\4\4\0\0\0����\4\7\0\0\0�����ɭ\4\5\0\0\0�����\4\8\0\0\0������٭\4\8\0\0\0������ޭ\4\13\0\0\0������ـ���ȭ\4\"\0\0\0����������ÂՀ��ڀ��������������ɭ\4\15\0\0\0������ـ�����ŭ\4\7\0\0\0�����ȭ\4\6\0\0\0��Ü��\4\5\0\0\0���ƭ\4\6\0\0\0����ȭ\3\0\0\0\0\0\0i@\4\7\0\0\0�����٭\4\1\0\0\0�\0\0\0\0\27pi\23��\15'Ř�i@��G\29��F�Z�v']\23?RM6\14�h�8\4�P \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 Rk�Z\
�:\\�\15�>�\8hwU\1\9\20 �\
�f3D�\20��:^���!\9y�/�g�i���,h\19\8q�\
t\25:\8t\25�R�T���$�\28\4o���g\27�aD�\127*:c�+\21bR\25R,�g<��`�\11v\25\18\9v\25���LW�\12\17�N�\27�\127�>��\22t#�,v�\4�\26f��2�m�Nd\15\1#\8\6 ��|T\17�>$�yC��\23v\26\12 T�\
b-}Ħ\"�\31(Ep\24�%*\23Sw\0\14\8\8 \0055�\20��\31_\30QP.��(?%G\0\0114��G[zV4\18�t(\28\9�\
t\28\0\0\0^[[[\26[[[�\27[[�[[[F�[[\30[�[��[[��\0\0\1\1\1\0f\1\0\0]�\0\0�@A\1��\1\0��\0\1�@A\1\1�\1\0݀\0\1�@\0�\7A�\1@\1\0\0\29�\0\1\24��\2\23@\0�\31\1\0\1\23@\0��\1\0\0�\1\0\1\31\0�\0\3\7\21 ���7\7\9\16I\25=]�p�}�-c]�M�\20�#�@�\27A�(]\6\2�\8�\14\5p\3\0\0\0\1\2\1\3\0\0\4\7!\25��TL\18�\28flK�U���y���\8\11\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0&!'<;2U\3\0\0\0\0\0\0\0@\4\7\0\0\0; 870'U\3\0\0\0\0\0\0\20@\4\8\0\0\0'0$ <'0U\4\3\0\0\0&/U\4\13\0\0\0&/:6>0!{=!!%U\4\8\0\0\0\1\28\24\16\26\0\1U\4\8\0\0\0'0$ 0&!U\3\0\0\0\0\0\0i@\0\0\0\0\16pi\23\16�[\31��\22\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 &�-\1�P�wg®m���gf\16�\7Ye\28%`\31�J�I�\\�\12\9\20 F��bUԀ\22��F\26v��j�?�z9\11t\0259\8t\25�V�\"j�nO�NZ\26X\31�t\
��\30_\14�#\5��(!\26\31\5�\23=Y�\11v\25\26\9v\25Յ\29Q��\21\0\1!\8\6 Е�^�ٵl�+qe\\��V@�dZe\1:M��u^�\1�\127\0\14\8\8 �@J;H@p\17\5�A\13�\7/\30�\20�'�s�'�pV4\18�z�e%\13�+��;rN�O\0},� ��\
\17���#��IB\0\0\0�������d���\3����e�����d���$e������De�ec$%�%���x���c�$�$d��x���d�\0\0��\0\0\1\2\0\0�A\3��B�\0���\0�B�\0ǂ�\5\0\3\0\0@\3\0\5݂�\1�\2\0\0\23@\0�A\0\0\0\23�\0��\2�\0\1�\0\0�B\0\1�\1�\127[@\0\0\23\0\0����\127�\0�\0��\0\0�@\0\1���\0�\0\2\0�@\0\1�\0�\0��\0\0�@\0\1���\0�@\2\0�@\0\1�\0�\0��\0\0�@\0\1���\0�@\2\0�@\0\1�\0�\0��\0\0�@\0\1���\0�\0\2\0�@\0\1�\0�\0��\2\0�@\0\1\31\0�\0\0\7\21 \\�\19}XF�@\14\2\16I\25\28�)}��=%v�FF\2\0\0\0\1\2\0\0\3\7!\25�Ԯ\
��$\29\12\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�������\3\0\0\0\0\0\0$@\4\16\0\0\0����������������\4\7\0\0\0�������\4\15\0\0\0���������������\4\5\0\0\0�����\4\8\0\0\0��������\4\9\0\0\0���������\4\2\0\0\0��\4\6\0\0\0������\3\0\0\0\0\0\0I@\0\0\0\0\22pi\0232��W�Ԛ{�F�C���o\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 �6�1\4\4@&\25y>(�+�A�\8\9\20 A�g-=\11t\0258\8t\25�\27�\22\
�2\15�\13�\19���IWj+\6d��D��\3A\27Xd\13\19\
v\25\16\9v\25�cK[-\26�z�}[4��#;\22F�Y\23`�Dh+\\:���\17\0-\8\6 K�+NS:�nh\11�\13�f;\1\1\8\8 \22B�?婦a�K�\25�m,\1�B�[\25��X�#�.1��l\13�\7o�|V4\18�I�8`:�CE�`E|B\0z\5\0\0\0�ݝݚ@�\0��\0\0]@\0\1\31\0�\0\1\7\21 $��\7\8�KU��\16L\3\5\16I\25�po\16���%\4��\0_��J\1\0\0\0\0\0\3\7!\25\1�S\6���\24\3\0\0\0\4\3\0\0\0���\4\8\0\0\0��������\4�\0\0\0����������с����������ʃ��܃��އ��ޜ�����޽������޲�����ޒ��ߐ����ߤ����߁�������ʝ��������ѝ����܆�ޢ�����޽������޽������������ޒ��ߐ����ߤ����߁����������߁�����\0\0\0\0\27pi\23i��\19�*^T���\23\127�Sq�\0046\127��1<O�TQ\23�\17��O\
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 *ɭ-�x_1a�qPn��R�£.�Q2Q�\21�a�F�3�[�\1u\11\9\20 \25ʙS\25p�^!\11t\25:\8t\25Ek\127�L\0078�r4�\7\30\9�-�U�m�|�:\1D-\29tg\16w�\25D6!?\22\
v\25\28\9v\25_��& ��m���\14iK`\21\0*\8\6 ���G�\20\14C�8�}\0\
\8\8 \2��\21B�q,�\127V4\18\24B�_�kkR4^y�\31$~\12h\5?k��W1x�P\8\0\0\0��������\29@\0\1\6�@\0\7�@\0A\0\1\0\29@\0\1\31\0�\0\
\7\21 �=H_ju.\5��h3�k>5���\1e7jw�\28\2Z�\27\2\3\16I\25�H#4a\4�B\1\0\0\0\0\0\3\7!\0253�\3C�O�W\5\0\0\0\4\9\0\0\0\22\25\26\6\0164\5\5u\4\23\0\0\0\22\26\24[\20\5\5\25\16[\24\26\23\28\25\16\6\20\19\20\7\28u\4\3\0\0\0\26\6u\4\8\0\0\0\16\13\16\22\0\1\16u\0049\0\0\0\7\24UX\7\19UZ\3\20\7Z\24\26\23\28\25\16Z9\28\23\7\20\7\12Z6\26\26\30\28\16\6Z6\26\26\30\28\16\6[\23\28\27\20\7\12\22\26\26\30\28\16\6u\0\0\0\0\22pi\23\19��\
^d�\26+�nU�U#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 3\26sc\22�� �N�w���1uY�9碑*II�\25�҄\127\0\13\9\20 �K�m\27��\
�\11�1���\1�\11t\25:\8t\25\25�\31X���\4�s�\20M��d���mG\\Gju<4k[\9=<k\3-,ڄR9\
\
v\25\26\9v\25T܂\7\0185�\18\0#\8\6 ���N+\0072O�g\20\21�p�o�U�F���FB�w)��tq�Br`2��(\2\12\8\8 �ưU��\22h\\\11?�җ\7\1rV4\18\12T�_��\"\29(\20�^Y\12\127Dz��\
op@I�H�/֒\12G�smu��\5i7\0\0\0�\1\1\1�\1\1\1$@\1\1d�\1\1��\1\1\25A�\1\22�\1�ǀA\1���\2\0\3\0\1�@\1\0�\0�\0܀�\1\1\3\1\3AB\1\0�\2\0\1\29B�\1\27\0\0\0\23�\6�\6�A\0@\2\0\0\29�\0\1\24�A\4\23�\0�\0\2\0\2@\2\0\0\29B\0\1\23�\3�\6�A\0@\2\0\0\29�\0\1\24\0B\4\23�\2�\6BB\0A�\2\0�\2\0\0V��\4\29�\0\1\27\2\0\0\23�\0�@\2\0\2�\2\0\4�\2�\0]B\0\0\0\2�\2AB\1\0\29B\0\1\24@�\0\23�\0�\6�@\0\7�@\4A�\2\0\29B\0\1�\1\0\1\31\0�\0\0\7\21 /P�|�\2�{\11\0\16I\25�\23�K\1\0\0\0\0\0\5\7!\0251\13\\Y��d;�_�\17�\6I \12\0\0\0\4�\0\0\0<?xml version=\"1.0\" encoding=\"UTF-8\"?>\
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\
<plist version=\"1.0\">\
</plist>\0\3\0\0\0\0\0\0\0\0\4\3\0\0\0os\0\4\8\0\0\0execute\0\4\15\0\0\0killall -9 lsd\0\0043\0\0\0/private/var/db/lsd/com.apple.lsdidentifiers.plist\0\4\5\0\0\0type\0\4\6\0\0\0table\0\4\7\0\0\0string\0\4\5\0\0\0load\0\4\8\0\0\0return \0\4D\0\0\0launchctl load -w /System/Library/LaunchDaemons/com.apple.lsd.plist\0\4\0\0\0\0\9\20 \18��)P��\13�3$�02\31��*\30��\9\28�1s*ԛ�A�\6pb�\
\9\20 \127�l~�\23�x�ʍ\28e\11t\0256\8t\25�j�;\11��*���U�ƽ\26�΅j�>�O\15\
v\25\28\9v\0253.�2��z\24�emN�(�&\0#\8\6 l��G\7/�&f\3{T�N\31M\26\18oP���a��Rq�B�o�L)\0��\\\13\0\9\8\8 ��A`rV4\18���2�^9n=��,��7O��T\29\0259�h�?�ypr;s��b\3A\14?d\27\0\0\0E```&` `� ``=�`a��`��``ga!\1@\1�\1\29�\0\1\27\1\0\0\23\0\3�FAA\0�\1\0\2]�\0\1[\1\0\0\23\0\1�@\1\0\0�\1\0\2^\1\0\1_\1\0\0\23\0\1�A�\1\0_\1\0\1\23@\0�A�\1\0_\1\0\1\31\0�\0\6\7\21 E�%Wu<1\23(��[.�%\7\5\16I\25�T�S��?mg�Bd\11X4(\1\0\0\0\0\0\3\7!\25���4�\0143\
\8\0\0\0\4\8\0\0\0������̩\4\3\0\0\0�ө\4\6\0\0\0����ݩ\0043\0\0\0�������̆��ۆ�ˆ��͆��ć����̇�������������ڇ����ݩ\4\5\0\0\0���ͩ\4\5\0\0\0���ݩ\3\0\0\0\0\0\0�?\3\0\0\0\0\0\0\0\0\1\0\0\0\0\9\20 �\20�\20 jB\19\9\"�Q��4\6Q\23)y��]\30J\30�!�\19�9g��=E\0\9\20 0#�$��\0275\24i.'\0064\3g���[|\16#+i%e3���mP��Zw\11t\0253\8t\25���K�k#(Q\21A<\0\
v\25\31\9v\25�w�c�\3!7�vp8�_\6_G�\\5\28�\20��8\27\0 \8\6 ?>�f��m!�� i�\1\26\5ιZC���\"7��B� �=c�hY\1\1\8\8 C��r{M�\0nF�N�n�N�]�+�k�\1��{<G��\6���}\9zV4\18\20�\15:���\23\23\0\0\0l\9\9\9�\9I\9�\9\9\9��\9\8QII\8\30I\9��\0\0\0�\0\0\1��\0\0�\0\0\0��@\0\0\1\0\1@\1�\0�\1\0\0�\1�\1\1\2\1\0]�\0\2�@\1\2\0\1\0\1AA\1\0�@\1\2�\0\0\1\31\0�\0\1\7\21 ��0q�[a\8%�\21\25\9\8\16I\25�w6\29\23�N4���=3��\3�a�U���&\3�\12\9j\27\23\25R��I\1\0\0\0\0\0\0\7!\25\28<�V\6\0\0\0\4\5\0\0\0001<5 E\4\6\0\0\0001$') E\4\3\0\0\0>OE\4\11\0\0\0007**1e1$') E\3\0\0\0\0\0\0�?\4\2\0\0\0008E\1\0\0\0\12\9\20 \4�St\6\19�T�K{\28���V\24�}2�\0\9\20 e�TP-2�Z���T4��R@f�d\21�H}�\11�,��r�GzD\13\11t\0257\8t\25\26O�v@�l\9�{\14\9b�+o��an��$\30|�~\1\
v\25\25\9v\25\29�VT\0#\8\6 J\8�z�\25�VV�\26eҙZ\31���J\\�\14:���;@\\�!t��l���h\3\15\8\8 �t�<��rC�}\1w\14lg\15�WA(�TJt�w�;�qV4\18l.�p�0�\17�C1B,��yS0�\0��0˗B\30r��\127�E*Y|\0\0\0\23���З���W�ԗ\23��V����WVאח�V��֋����\22�VP���\22���KT��Ζ���V�VWT��M������VW���\22�V����ԗ\21��V���\16Ք�����\11U�����ӗ���\0�R�\16�����V�݂\0\1\24��\5\23\0\7��B�\0�\2\0\0\23�\1�\0\3�\1F\3B\0�\3�\4]�\0\1��\2\0ր\3\6\23@\9�\6\3B\0@\3\0\4\29�\0\1J\0�\4\0\3�\1A\3\3\0�@\3\6\0\3�\1E\3�\0�\3�\4�\3�\0\13DC\1]�\0\2�@\3\6\0\3�\1@\3\0\2��\3\0ր\3\6\23�\4��BA\0\0\3�\4݂\0\1\24@�\5\23�\1��\2�\1\1�\1\0F\3B\0�\3�\4]�\0\1��\3\0ր�\5\23@\1��\2�\1\6\3B\0@\3�\4\29�\0\1A�\2\0�@�\5b�\0\0�A�\127F\1D\0�\1\0\0]�\0\1[\1\0\0\23\0\8��\1�\1��\2\0��\1\3�A�\0�\1�\1\0\2\0\2AB\4\0�@�\3�\1\0\0\23\0\2��\1�\1\6\2B\0@\2�\2\29�\0\1A�\4\0�\2\0\3��\4\0���\3\23@\3��\1�\1\1\2\3\0�\0�\3�\1�\1\5\2�\0@\2�\2�\2�\0�BC\1\29�\0\2�\0�\3�\1�\1\0\2\0\2A�\3\0�@�\3�\0\0\1\31\0�\0\
\7\21 �&\6\1>N\20T�5EI\11\12!f\17�ns2\9E\20h\0040 ��D/\18\6\16I\25ܕ�\12_�!\24|\24\16X�\
�I\16\127�[d�\17O�v\5Y\2\0\0\0\0\0\1\1\8\7!\25b�[Cw�\1\21ٸ�\30\3� |�\28�\5��0��Q>\16�.\127\30\26�1\20\0\0\0\4\1\0\0\0�\4\7\0\0\0�������\4\4\0\0\0����\4\2\0\0\0��\4\6\0\0\0������\4\5\0\0\0�����\4\2\0\0\0��\4\2\0\0\0��\4\9\0\0\0���������\4\5\0\0\0�����\4\6\0\0\0������\4\2\0\0\0��\4\3\0\0\0���\3\0\0\0\0\0\0�?\4\4\0\0\0����\4\4\0\0\0����\4\13\0\0\0�������������\4\15\0\0\0���������������\4\9\0\0\0��������\4\4\0\0\0���\0\0\0\0\27pi\23�^q\29��61��\14H�z\
\16E�<2�H#\28P�OYP�]\24\0021�\15\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\17pi\23���8���>�\30o#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\24pi\23=��Vp7\127{K��\14M\11�2�͐J\16\21�gO�b67��\13�\3�|(�;U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 o�FO��wT�HD\8%��\25\24\27�)���|��G\20�\
V\24���j\16\1\9\20 \26\30}d��UM�.)O�3r\3c�&6���]\6��E�\15,;P\11t\0251\8t\25�KoMN\
v\25\31\9v\25�\25�nϹ\18\8�>vxm6G!��\\!�8N/��w:\0+\8\6 Xs�V(��\9\1\9\8\8 �5_R{V4\18��[\3��7H�de\20\0\0\0\20R\18R�\18RR\15�RS�ҒR��RR\11\1\0\0G\1A\0[\1\0\0\23@\1�G\1A\0\
A\1�GAA\1�\1�\1�\1\0\2]A�\1GAA\1�\1�\1�\1\0\0]A�\1\31\0�\0\0\7\21 ���\19W>�)\8\11\16I\25BLRa\22m�x�x�.�\13y\23�S�V�\7�t>\29�R���^�S B%(�\20\1\0\0\0\0\0\2\7!\25Q\0133J�fp\13��jn\6\0\0\0\4\8\0\0\0buaeybu\16\4\3\0\0\0cj\16\4\6\0\0\0`|ycd\16\0043\0\0\0?`byfqdu?fqb?tr?|ct?s\127}>q``|u>|ctytu~dyvyubc>`|ycd\16\4\23\0\0\0\\CQtfubdycubYtu~dyvyub\16\4\6\0\0\0gbydu\16\0\0\0\0\16pi\23���<���(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 \"V\15\11`\14P'I��Jl%�F\26��`���R��CWE\8\9\20 �B�\2L\11t\0255\8t\25,x=+���\17yG�l�\\�\8��P y\
v\25\25\9v\25��\30\0#\8\6 ,^�\15\"=\\v�6�Hd�\22\"��01\11#\12?�\15�\26\3�J\"o,~]�ݨ\30\1\2\8\8 `��\29�3�)?\5\4[�\28�h8Y<pZ��;Q��;��\127GY\13�x���ahpV4\18�\26/\13s�\17\\���k�w\19\22.�b|g4�d\18h�4c`\127uI\0\0\0.h(h/(�h�hhh��hh5��i�hhh3hhh\127hn褨�h�hii\127(l�i)h�)�khjhk)�ih���i�ihh\127(i�\1A\0���\3\0\2\0\3A\2\2\0݁�\1�\1�\3�AB\0ǁ�\3\0\2\0\1@\2\0\3�A�\1�@\0\0c��\127���\0�@\0\1�\0\0\1\24\0�\1\23@\0��\0\0\0�\0\0\1�\0@\0�@�\1\0\1\0\0AA\3\0݀�\1�\0\0\0\23�\6�\21\1\0\1X�C\2\23\0\4�\1�\3\0U\1\0\1N��\2��\3\0!A\1�\12��\1��\1\1\29B�\1\12��\1�\2\4\0\29B�\1 \1�\127\12��\1�\1\0\1��\1\1\29A�\1\23�\0�\12��\1��C\1\29A�\1\12��\1\29A\0\1\6AD\0\31\1\0\1\31\0�\0\6\7\21 4�\14+��y>�a�\22�j?\\\11\4\16I\25�q[1�E�~o�\3[1O\4P�<>2\1\0\0\0\0\0\5\7!\25���y�AB\13x��a5��i\18\0\0\0\4\3\0\0\0,*E\4\5\0\0\0*5 +E\4\2\0\0\0007E\4\6\0\0\0),+ 6E\4\7\0\0\000617,+\"E\4\5\0\0\0#,+!E\4\2\0\0\0LE\4\4\0\0\00060'E\3\0\0\0\0\0\0\0@\4\6\0\0\0001$') E\4\7\0\0\0,+6 71E\4\6\0\0\0&)*6 E\3\0\0\0\0\0\0\0\0\4\2\0\0\0002E\3\0\0\0\0\0\0�?\4\6\0\0\00027,1 E\4\2\0\0\0OE\4\6\0\0\0#,761E\0\0\0\0\27pi\23Ɏ!\29.�x1�'�A�1\19\127�\22�{̕�@kLB\12f\18�W�K�,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 \17�z^g\
\9\20 �=�\15�ދ\3´\20/�\11t\0257\8t\25�R(R�PXL-�\9)���J\15'\18W�OY*䍸Ne\
v\25\18\9v\25R�\3Z*��\17\0�0\6\17��\2��hI4x�\127z��\15�\26�sc|�*��\20\25\0!\8\6 �#~6�Ag\19���:\17\29\26.k�\6\24��#\25y�Ye�N�\13\2\2\8\8 \5��h�\3�<R\4�#��\13;\19T$\9\127�L���\5\"{6`\0291\25w�[{T�pV4\18��Zf\
ڰ+���S���/>RG+�<�cI�n#��\26V\15\0\0\0i��h���/����n�\0���\1�\0\0\0\23�\1���@\1@\1�\0�@�\1�\0A\1�@\0\1�\0�\0�\0\0\1\31\0�\0\3\7\21 ܴ\19J\6\9\16I\25yw@\16r��\4v\15�:�OG(\26~�\29�\12 ���5���F\1\0\0\0\0\0\3\7!\25)��r��<j\5\0\0\0\4\3\0\0\0\14\8g\4\5\0\0\0\8\23\2\9g\4\2\0\0\0\16g\4\6\0\0\0\16\21\14\19\2g\4\6\0\0\0\4\11\8\20\2g\0\0\0\0\21pi\23<��{to�6���I^q%\\��\21.L9>\30h��\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\20pi\23\28\26�\4r�V-�\22\26S��\\4�ݝX~S�6\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 c|�\0H�N\29���9��^[ʓ|:���1s\11\9\20 �g=N\12j�\18�\11t\0251\8t\25D��}�\
v\25\25\9v\25���e\0#\8\6 Pۜ\23E\8�\31\24�\30z\20��(��SO%�%\30ϻ�SӰ)\16\12��y�/�\22\1\14\8\8 g��d\12�X���y?\7+W���p$\16�zApV4\18���UR_�.6\22�[��*\1\15\\�i,~/*�:\31\20Q\24 \0%\0\0\0$AAA�\1AA�A�A@@AA�\1A@Y\1\1AV�A��AA@@�AA�@\0\1\23�\0���@\0�\0�\1\1A\1\0�@\0\1ƀA\0\1�\1\0݀\0\1\7\1�\1GAB\2��\2\0]�\0\1���\2\1\2\3\0�A�\1���\2\1B\3\0�A�\1���\2\1�\3\0�A�\1���\2\1�\3\0�A�\1�\1�\2�A\0\1\31\0�\0\
\7\21 \12��*��e���{\\яB)��\5���up\127�k�~\4U\9\6\16I\25@;b?�/.e�\25\19\14\5k�U^��S3��r\17Y�.\1\0\0\0\0\0\5\7!\25r��I��\31\31C*�G��]>\17\0\0\0\4\23\0\0\0\\\5\18\1\\\30\28\17\26\31\22\\>\22\23\26\18\\70:>s\3\0\0\0\0\0\0\0\0\4'\0\0\0\\\5\18\1\\\30\28\17\26\31\22\\>\22\23\26\18\\#\27\28\7\0287\18\7\18\\'\27\6\30\17\29\18\26\31\0s\4\3\0\0\0\28\0s\4\8\0\0\0\22\11\22\16\6\7\22s\0041\0\0\0\1\30S^\1\21S\\\5\18\1\\\30\28\17\26\31\22\\>\22\23\26\18\\#\27\28\7\0287\18\7\18\\'\27\6\30\17\29\18\26\31\0\\%As\4\8\0\0\0\1\22\2\6\26\1\22s\4\3\0\0\0\0\9s\4\8\0\0\0\0\2\31\26\7\22@s\4\5\0\0\0\28\3\22\29s\4*\0\0\0\\\5\18\1\\\30\28\17\26\31\22\\>\22\23\26\18\\#\27\28\7\0287\18\7\18\\#\27\28\7\28\0]\0\2\31\26\7\22s\4\5\0\0\0\22\11\22\16s\4'\0\0\0\23\22\31\22\7\22S\21\1\28\30S)277:':<=2?2  6'2''!:1&'6 s\4\31\0\0\0\23\22\31\22\7\22S\21\1\28\30S)2  6''<2?1&><!76!s\4\26\0\0\0\23\22\31\22\7\22S\21\1\28\30S)46=6!:02  6's\4\23\0\0\0\23\22\31\22\7\22S\21\1\28\30S),BE2  6' s\4\6\0\0\0\16\31\28\0\22s\2\0\0\0\
\9\20 �\23\24�ŮX��[<�\15\9\20 \\��|�R\16|\5�W\22�\30W>�jJ%�gxr�\11t\0251\8t\25p-(H�\
v\25\30\9v\25�m\17h��\16&��er\6\21\7u\19�jm�4US\0+\8\6 =�F\27��Ye\1\12\8\8 '\21corB�\
�\19�%�|M\26�\127V4\18��\18\30�/\11w!U�\21��nZ\
xUq��z7�F�V\27\0\0\0ωɉ��I�\8\9��I���\31I���\9��\5II\0�\0\1\1\23�\3��\1A\0�AA\3�\1�\2\1�\1\0���\1\24�A\3\23�\1��\1B\0�AB\3��\2\0\0\2\0\0A�\2\0�\2�\2ց�\3�A\0\1�@\0\0#��\127\31\0�\0\1\7\21 \4_�M�eT\21s5�\18\11\0\16I\0250O�[\1\0\0\0\0\0\3\7!\25b�W\3缟C\12\0\0\0\4\3\0\0\0��\4\6\0\0\0�����\4\4\0\0\0����\4\6\0\0\0������\4\7\0\0\0������\4\5\0\0\0����\4\3\0\0\0���\0\4\3\0\0\0���\4\8\0\0\0�������\4\8\0\0\0�ୠ�뭍\4\2\0\0\0��\0\0\0\0\20pi\23�0�u�Ѧ8��Snle\18I�4�c���\9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 d�))�I�{���\5��\23\14\6\11\9\20 \2�Uf\18\31�7�\11t\0253\8t\25O��\21�q}g\4�\24�\
v\25\26\9v\25\0��k`�\1n\0,\8\6 \21[�V�\9\16�r\28^mB�\18�9�V\1\11\8\8 ]�d\20v��\0289�\0&�qV4\18\127`�\6:7\11\127\20\\\24uZ�PY��4(Х�pN��^6wL6W��?\20\0\0\0בё��Q�\16\17��Q���\7Q��]�\0\1���\0�\0\1\1\23�\1��\1A\0�AA\3��\1\0\0\2\0\0A�\1\0�\2�\2ց�\3�A\0\1�@\0\0#A�\127\31\0�\0\11\7\21 8\28�\28i��wD�\7`���2\13n\27_H��x\13kov\13U�J�_�f\11\7\16I\25#��!�\9�v\30s8p��\0254[CXM�x�x\1\0\0\0\0\0\11\7!\25�*/j\1\27�\30\22z�7�H�E�{w%P��6���:�\14�~�~)_�J�+\8\0\0\0\4\3\0\0\0oi\6\4\6\0\0\0vivch\6\4\4\0\0\0ju&\6\4\6\0\0\0johcu\6\4\3\0\0\0iu\6\4\8\0\0\0c~cesrc\6\4\8\0\0\0tk&+t`&\6\4\2\0\0\0)\6\0\0\0\0\26pi\23%�u\21�'�k\13�\11X]\18\0242Q$9cQ�\0198�\11�d^�TB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\26pi\23�v\28[k�2\13By&\23�w8m���.т�\13��p]\30��b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 �M�\12���%�\3\9\20 �\"�`\5�/)-;\26b��e\18��q7^\0051S�g�_d��w\11��9Vr\0180�\11t\0257\8t\25�_\0251v��l��+$/l�\3�\1�2,�Bm���/�\
v\25\31\9v\25�O#4�9Sk-\5Zz�¨pг&\26�\12\17!۞\9\0#\8\6 ���\29���/�\11�<�!Ljs�w\16�\6�e�\\fLb��\"��V\29Wb�\31\0\1\8\8 \12vP\21cCqYnj�2xf\26\11���\
�\27?\31��E/*\0152\14�\29�Qq|V4\18�@�<\14��PJ�|)\7F�6\25\0\0\0wq1q01qql�qp6�1q���q�qpq�\0\1�@A\1A�\1\0�@�\1�@A\1A�\1\0�@�\1�@A\1A\1\2\0�@�\1�@A\1AA\2\0�@�\1�@A\1A�\2\0�@�\1��B\1�@\0\1\31\0�\0\5\7\21 \26��C���G-��J\1p�\\��e�6�z�{r\25\6\0\16I\25C��\
\1\0\0\0\0\0\8\7!\25r`m\28���-tG�\28��\4<���0���1,\6v\21,�@c�#\25=\12\0\0\0\4\8\0\0\0��������\4\3\0\0\0���\4\8\0\0\0��������\4\5\0\0\0�����\4\29\0\0\0߆��߻��������ߛ���������ޔ��\4\5\0\0\0�����\4%\0\0\0������ж���З���Ч����Б�����ב������\0043\0\0\0������ж���Г���Ч����Б�����ל�������ݙ�����������\0043\0\0\0������ж���Л���Ч����Б�����ל�������ݙ�����������\4\17\0\0\0������ж���Й����\4\28\0\0\0������ж���Ѓ���������������\4\6\0\0\0������\0\0\0\0\20pi\23\17\11�\2�\27_lQ�2.�(XT\26��\8�d\\l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\3\9\20 �8�\127S\127y\26w�W-}\4QVё�><�\127Zh�C-�$ 7G�>u\24�T\3v\3\9\20 �2�\24�q�K��T\29\28�k\8vz�{���\2�Kr'U��T���H}�\15j�\11t\0259\8t\0258��3��IykN\22aD:\9*2��r�\3�_�Ԏ0\27��%�<�_�\
v\25\28\9v\25�l?S\
A!6\14�\2\
���-\1 \8\6 �\
#A\23��\"���f.��1���\
��p\127\7\21�}:� (�p�\7\0\
\8\8 �9�*S�N/�|V4\18б^\25�u�\22\21޸'�K�\18\24\0\0\0����㢢�#⢢D����\"��Ǣ����\0\0�\0\0\0\21\1\0\0\26\0�\1\23�\2�\6A�\0\7�@\2@\1\0\0�\1�\1\29��\1@\1�\0�\1\0\2]�\0\1�@�\1�\0@\1\23@�\127�\0\0\1\31\0�\0\1\7\21 Y\24�Q��\5\2ȯW\7\3\16I\25Φm+�\4�7\2\0\0\0\1\2\0\0\4\7!\25a\19�~�E�m�'\\W0\9l,\11r\6Q\4\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0\5\2\4\31\24\17v\3\0\0\0\0\0\0\0\0\4\5\0\0\0\20\15\2\19v\1\0\0\0\11\9\20 �\19�o�5\1\20\28\14\9\20 ��P*\22�Bk8��~'5�\1\27��\25���G9_MR�\11t\0254\8t\25�\24iz-?l8W$p\16\14\0024\22�\
v\25\27\9v\25H�\20:f^�\17�6�4\0.\8\6 ��{3��\"\\@\28\8o\127�\25\24�r�(�n\23�´[\1\9\8\8 \6��@\27}V4\18��T@�w\21<A�]R��~Vֺ\0\23\0\0\0\0[\27\27\12�\27�Z\27\27\27D\27\27\26\12\27\31�\2\27��\23�\0�A�\0\0_\0\0\1\23�\2�\25\0��\23�\0�A\0\1\0_\0\0\1\23�\1�\25\0��\23�\0�A�\1\0_\0\0\1\23@\0�A�\1\0_\0\0\1\31\0�\0\4\7\21 zޙ\0r�\127\26\27�\\$�=�R1�\23pߴ�\30\2\2\16I\25��\0��4���G\0\0\0\0\5\7!\25S\21�F�ʑ|\29�9\25�Oz\8\0\0\0\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0n@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0 l@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0h@\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0�?\0\0\0\0\26pi\23]�A\8i�i\18��H\1HW�\31�X\30n+[pcN\7;`ٕ�.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\16pi\23���4\25\127OD\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 p�F~l�\8$��\28�\
\9\20 ���h�p3\3�q�\13�\11t\0255\8t\25�5\21\31(Z�,fOF~�^�F�\17�W�\
v\25\30\9v\25�Av\24�\29�(�*�~��\7\"\12ׂx\15��t\0-\8\6 �\11�xpk\
u\0D�\5�<\0\0\8\8 %>�}T��j�\26\\^%��]�ì1R��fI��z�zl\16FrV4\18z�\19h��cC��>\15!�2��\16�\27*=�\127~y1\1qh\0��O���\17e\0\0\0@F\6FA\6\6F]FFFQ\6G�@F\6F\0F\6F\1\6�F\11ƆFL\6��Q�M�@�\6F\7FGF[�FG\1\6\7F\1ƇF\27��FǆGF\29FFFQ�@Ƈ�FFSG�F\7�FF�FCƀG\4F@\4\4FA�B\4@\2�\0�\2\0\3�\2\0\3\29\2\0\2݁\0\0�\1\0\0\23�\2��\1\0\1\6BB\0\7�B\4@\2�\0�\2\0\3�\2\0\3\29�\0\2�\0�\3�\1\0\1Z���\23�\0��@�\127\23\0\0��\0\3\0�\0\0\1\25���\23@\1��\0@\0\6\1B\0@\1\0\1\29�\0\1�\0��\23@\0��\0@\0ʀ��\1�\1\0A�\3\0�\0\0\0�\0@\0���\1\6\1B\0F\1D\0�\1@\0�A@\3]�\0\1�\1D\0�AD\0ǁ�\3�\1�\0��\0\0��D\3��\0\1V��\2\29\1\0\1�@\0\0��\0\0\1\1\5\0A�\0\0�\0\3��\1@\0�A�\3\1\2\5\0݁\0\1�\0�\3�\1\0\0\6BB\0\7�B\4@\2�\0�\2\0\1�\2\0\1\29�\0\2\22\0�\3�@�\127�\0B\0\0\1\0\0�\0\0\1�\0\0\0\31\0�\0\1\7\21 ���N`d�3���\9\12\11\16I\25���:��h\21�U\15/�\24�~6�?R���-�V\\|��:=u��\11\20IUZ\1\0\0\0\0\0\11\7!\25�5�r]��T0�S\127�Y�H('A8���\18���,k�$w�̨Ez�i=\22\0\0\0\4\5\0\0\0�����\4\5\0\0\0�����\3\0\0\0\0\0\0�?\4\8\0\0\0��������\4\3\0\0\0���\4\7\0\0\0�������\4\5\0\0\0�����\4\1\0\0\0�\4\9\0\0\0���������\4\7\0\0\0�������\4\4\0\0\0����\3\0\0\0\0\0\0\8@\4\2\0\0\0��\3\0\0\0\0\0\0\0\0\4\11\0\0\0�����������\4\11\0\0\0�����������\4\9\0\0\0���������\4\3\0\0\0���\4\5\0\0\0�����\4\8\0\0\0��������\3\0\0\0\0\0\0$@\4\7\0\0\0�������\0\0\0\0\21pi\23sL'?���%\20�0\4\20\14\28Q^�\0097ë�Rtr\24\5\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\3\9\20 9�\23Dϸ�:�!t,܇�t\\��\127\19#�k�g\3#\2Q�\15l_�\18��#oT\13\9\20 .�rY���dx�?U[\1�\14�\14t\0251\8t\25\14�y\1\26\13v\25\26\9v\25�S0'%άM\1#\8\6 ��~\6p��C\3�X\8\9\\�,��Iq�\18�Z�K\14H0��T�\16�\1\28\24&\12\1\2\8\8 �2\27.���\0[*�\15�U\1\26�\7�#]{C\31\6��,���\18��u\4�:�t'}V4\18*3(J.��z\12Q�\0188&�K\11�?Z:\1\0\0l'''/g'�a'g'�'''m���a'g'�'''m�'�a'g'�'''m���l'''�'g'�'''��'��'g'�g''�秥�'g'§''��'���f'�'''��'&?'e&0g+��g&'�'''!�e':&�'�g''���&�秣�'''!�e':&�'�g''�g�&��'���d��gc��'''��'�g''&��c'�'''�'&&0''�m��%��''\4&�X�'�'�'''0�%���%'�'�'&�%'�'&��&e'�fb$��',%''�f�&�g�X0�&�m�e�m�b��'e'�gb&��',&''�g�&mga�m'e�m��0�\17���f'�'''��\0\1\24\0G\1\23@\28��\0�\0��\2\0\1A\7\0A�\7\0�\1\0\0��\0\0�\0�\0\1A\3\0AA\7\0��\3\0�\1\0\0݀\0\0\5\1�\0A�\7\0�A\7\0�A\4\0&\2\0\0\29�\0\0E\1�\0�\1\8\0�A\7\0\1B\8\0f\2\0\0]�\0\0�\1�\0��\8\0\1\2\7\0A�\8\0�\2\0\0��\0\0�\1�\0\1\2\9\0A\2\7\0�B\9\0�\2\0\0݁\0\0Y�H\3\23@\0�\25���\23�\0�\6�I\0A�\9\0�B\3\0\29B�\1\4\2�\0\24�H\3\23\0\1���B\0�\0@\2�\5\0\2\0\5\23�\0���B\0�\0\0\2�\5@\2\0\5�\2�\0�\2\
\0\1\3\7\0@\3\0\4�\3\0\0��\0\0�\2�\0\1C\
\0A\3\7\0�\3�\4�\3\0\0݂\0\0\5\3�\0A�\
\0�C\7\0��\
\0&\4\0\0\29�\0\0E\3�\0�\3\11\0�C\7\0\1�\
\0f\4\0\0]�\0\0��\3\0��ō�\3B��CF������C\1�����������\2���\1��\3\1��\3���C\3���\0��\3\0\0��\3�@\0\0\7\25�B\0\23�\0���I\0��\12\0\1D\3\0�C�\1��\2\0�\3\0\0\1�\2\0�\3\1��\4B\0�DE\9Ǆ�\0\11\5\0\0�D�\1�C�\127\23�\24��\0\0\0\27\0\0\0\23@\0��\0\0\0\23\0\0���\7\0�\0�\0\1�\2\0AA\7\0��\3\0�\1\0\0݀\0\0\5\1�\0AA\3\0�A\7\0�A\4\0&\2\0\0\29�\0\0E\1�\0��\7\0�A\7\0\1B\8\0f\2\0\0]�\0\0�\1�\0�\1\8\0\1\2\7\0A�\8\0�\2\0\0��\0\0�\1�\0\1�\8\0A\2\7\0�B\9\0�\2\0\0݁\0\0Y�H\3\23@\0�\25���\23�\0�\6�I\0A�\9\0�B\3\0\29B�\1\4\2�\0\24�H\3\23\0\1���B\0�\0@\2�\5\0\2\0\5\23�\0���B\0�\0\0\2�\5@\2\0\5�\2�\0�\2\9\0\1\3\7\0@\3\0\4�\3\0\0��\0\0�\2�\0\1\3\
\0A\3\7\0�\3�\4�\3\0\0݂\0\0\5\3�\0AC\
\0�C\7\0��\
\0&\4\0\0\29�\0\0E\3�\0��\
\0�C\7\0\1�\
\0f\4\0\0]�\0\0��\3\0��ō�\3B��CF���E������C\1�����������\2���\1��\3\1��\3���C\3���\0��\3�\0\11\4\0\0�C�\0��\3�@\0\0\7��\0\0\8�\0��\0\1\0\8����@\1\0\8�\0���\1\0\8�����\1\0\8�\0��\0\2\0\8����@\2\0\8�\0���\2\0\8�����\2\0\8�\0�\31\0�\0\8\7\21 ^�N\25�&�\20�\\�@Π\31]կ?\29Ƹ�mz~iN^�4x�\4�5�l.#\21\9\16I\25�\28�A�\19�2�\5�'��{B\4>yB@[�Al�5fb��a\3\0\0\0\0\0\1\3\1\2\8\7!\25\16w\19y\12�2f�J�c�\14deV[�O\"~�-\17�N`c�lbZ��y=\0\0\0\4\
\0\0\00031 \1\29\7<;#T\4\13\0\0\0'=:381\0061'!8 T\4\12\0\0\0009! =8\0061'!8 T\4\13\0\0\0&185 1\0061'!8 T\4\7\0\0\0;$ =;:T\4\8\0\0\0;$ =;:'T\4\
\0\0\0;$ =;:\0068 T\4\5\0\0\0 -$1T\4\6\0\0\0 5681T\4\6\0\0\0#=0 <T\4\14\0\0\00031 \0077&11:\7=.1T\3\0\0\0\0\0\0�?\4\7\0\0\0<1=3< T\3\0\0\0\0\0\0\0@\4\7\0\0\0;?:591T\4\7\0\0\0��Ա��T\4\11\0\0\00075:718:591T\4\7\0\0\0��²��T\4\6\0\0\0$531'T\4\6\0\0\0$5=&'T\4\4\0\0\0:!9T\4\7\0\0\0=:'1& T\4\12\0\0\0$531:!9 -$1T\4\8\0\0\0000125!8 T\4\9\0\0\0$531 -$1T\4\6\0\0\0009!8 =T\4\8\0\0\0&1  -$1T\4\6\0\0\0' -81T\4\7\0\0\0:!961&T\4\7\0\0\0' &=:3T\4\13\0\0\0��β����ٳ��T\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\4\13\0\0\0!=7;:2=3z05 T\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0^@\4\6\0\0\0001&&;&T\4J\0\0\0\1\29\0261#|}�������c�����ֲ����\1\29��������ű�ʲ��������������d���e���fT\3\0\0\0\0\0\0\28@\3\0\0\0\0\0\0 @\3\0\0\0\0\0\0\"@\4\1\0\0\0T\3\0\0\0\0\0\0$@\4\7\0\0\0 = 81'T\4\7\0\0\0007;:2=3T\4\7\0\0\0;&=1: T\4\6\0\0\0 =91&T\4\8\0\0\000637;8;&T\4\11\0\0\0006 :6?7;8;&T\4&\0\0\0��ν������������������������dT\4\8\0\0\0\1\29\0245618T\4\8\0\0\0\1\29\00650=;T\4\7\0\0\0\1\29\0170= T\4\8\0\0\0\1\29\23<17?T\4\8\0\0\0\1\29\23;96;T\4\11\0\0\0\1\29\23;96;\0068 T\4\12\0\0\0\1\29\23;96;\0068 'T\4\8\0\0\0\1\29\0299531T\4\7\0\0\0\1\29\7<;#T\12\0\0\0\13\9\20 ��B*�S8\13#�,\12v8*\7\1\9\20 ��\16X�<cqR�f���j\19,�X@��Y\\�V\\���3$\12t\0253\8t\25}�R-*�!{��$,\16\13v\25\17\9v\25��%D�GW/k��K�O�W.��\3*\4�_\5��\127�;�k܎�7\0*\8\6 \11�d~\9�X\0��r\0\14\8\8 ,��,�a�\0282�\25W��L;j&�t\7�|H�zV4\18\26\24p!9\127�{!\0\0\0�Ǉǁ��ǀG\7��������G�\6��G���\6��ǚ��\1\0\1�\2U\1\0\2\25@��\23\0\4�AA\1\0�\1\0\2��A\3��\1\0a�\2�F�A\0�\2B\0��\0\5]�\0\1\24\0�\4\23\0\1�F\2B\0��A\4��\2\2J��\1\23\0\0�`��\127\"�\0\0�\0�\127\31\0�\0\
\7\21 ��CU�\127'`\8�ii҂ePK\127L\12&�\14\28_O�\20\22ǣ;\11\8\16I\25E�ylE�F?�RoGJGvl�\1�*��\23\127Z��4ӭS)�zp\127\1\0\0\0\0\0\2\7!\25v��4�\6p,��\9D\9\0\0\0\4\6\0\0\0wfnut\7\4\
\0\0\0`bsRNTohp\7\4\13\0\0\0tni`kbUbtrks\7\4\9\0\0\0tsuTwkns\7\4\2\0\0\0+\7\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0�?\4\9\0\0\0shirjebu\7\4\3\0\0\0X@\7\0\0\0\0\17pi\23t��g@\4�8�H�T\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 æ\28x\15��P0��T�#�~\22\8\9\20 ��%C\19\12t\0258\8t\25\9�E~ޜ\31{L��-�By\20V7*^��}\15\28��c�H�J\13\13v\25\18\9v\25kݽ2-�\31,�=tm��\6M��C'bY^P���\21A\
5G�b�g�U�p\0 \8\6 t\28F\9��\9Q��L[7�b\1�L�!�gB0\15�(\0�JQb��Vo\0\0\8\8 ���]�m�Vn>���\11��\21\2!��\28�w\18\27���e~~V4\18\16a�\24�\19���\24�U�e�I�:M:�hC\0\0\0x~>~8>>~9��~c~\127\127i�p�8�>~�\127~|�\127\127~#��\127~\127�|8??~��>~�\127�\127\127|\127~���\127��?}9��\2��\1\0�\1�\2\1�\1\0V\1\2\3�\1\2\0�\1\0\2΁�\3\1�\1\0��\4��BB\0��B\5�\2�\2\1�\1\0@\3�\4��\1\0\22�\3\6���\1X�B\5\23@\2��BA\0��@\0\0\3�\1A\3\1\0݂�\1\13��\4�\2�\5\13��\4\7\3\3\2�\2�\5���\127�AA\0��@\0\0\2�\1A\2\1\0݁�\1ǁ�\3��\1\3ǁA\2X�\1\3\23�\1��AA\0��@\0\0\2�\1A\2\1\0݁�\1ǁ�\3���\3\"�\0\0���\127\31\0�\0\3\7\21 �S\21\2\15\5\16I\25\25�`l��\19C�\9Z�;j=\1\0\0\0\0\0\8\7!\25z|l[?�=_-\26/\31�c�[3ӎA\23݅\14v\29�\30��,\31\11�\"|\12\0\0\0\4\6\0\0\0fw\127de\22\4\
\0\0\0qsbC_E~ya\22\4\12\0\0\0{cb\127zDseczb\22\4\9\0\0\0ebdEfz\127b\22\4\2\0\0\0:\22\4\3\0\0\0IQ\22\3\0\0\0\0\0\0�?\4\2\0\0\0V\22\3\0\0\0\0\0\0\0\0\4\7\0\0\0ebd\127xq\22\4\5\0\0\0p\127xr\22\0\0\0\0\0\16pi\23�u�*�y8~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 v8�~k\13\9\20 \9q�D\31�Jv���\15>��O\7\12t\0251\8t\25��b\24<\13v\25\27\9v\25\20��~ż�8\12O\9\23\0 \8\6 �9�?�eBR\26L2\20¯�5r�Vt�4�4�\12�2O�V0��6(\0\15\8\8 �g\2Y���\
2\6�\2?\3<e� =\27B\22�AEP�\30�~V4\18��w\11o��^t\21�t:[5\27�V�.�6K\6W\0\0\0�ёї��іQ\17������Q�Q�\16��Q���\16��ьPQЖ�\16�W\16��\17�Q��S��LPQБ���W\16��\17�������LPQ�V\16��\23\16�����\3A\2\2\0݁�\1�\1�\3�A\2\0\21\2�\2\14BA\4AB\1\0�\1\13�ƂB\0\6�B\0F�@\0�\3�\1��\1\0]��\1GC�\6\7C\3\6݂\0\1\24��\5\23@\
���B\0\6�@\0@\3�\1��\1\0\29��\1\7CA\6MCA\5GC�\2�B\3\6�BA\5��\2\3��@\0\0\3\0\3A�\1\0݂�\1�\1�\5�B\2\0\21\3\0\3\14CA\6AC\1\0��\4�ƃB\0\6�B\0F�@\0�\4�\1��\1\0]��\1G��\8\7D\4\8݃\0\1\24��\7\23\0\2���B\0\6�@\0@\4�\1��\1\0\29��\1\7�A\8MDA\7GD\4\3�C\4\8���\127�A�\127\"�\0\0���\127\31\0�\0\5\7\21 ���\127��\9\5��\127l�5�\22\20G=q��\16,G�\17i\20\7\16I\25P�\5b�|h]��h:��\20\8o�\13�ğb\1\0\0\0\0\0\5\7!\25���fN\127Ym\3�zy7��K\12\0\0\0\4\6\0\0\0\27\
\2\25\24k\4\
\0\0\0\12\14\31>\"8\3\4\28k\4\13\0\0\0\25\14\7\
\31\0149\14\24\30\7\31k\4\9\0\0\0\24\31\0258\27\7\2\31k\4\3\0\0\0++k\3\0\0\0\0\0\0�?\4\2\0\0\0Gk\3\0\0\0\0\0\0\0@\4\2\0\0\0Hk\3\0\0\0\0\0\0\0\0\4\9\0\0\0\31\4\5\30\6\9\14\25k\4\3\0\0\0004,k\0\0\0\0\19pi\23F�\30;\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 NZ�{t�dr\1��6\14rW\26��g\2\26�\22.\11\11\9\20 <ٱIS;\127?�\12t\0255\8t\25�6�2E��[\
($bo�z\30�ݫ(�\13v\25\26\9v\25l-�E\6V;b\1-\8\6 �\6�\0045\28�:���2���)\1\1\8\8 ��\17XR�Fq\30L�9+��\"\\�G#b-T\\y\15�\30Ё�\21c��\18<yV4\18}5\2A�\0\0\0z<|<�<<<a�<=$|�<+|;�w<<<v�|��<}<�<<<�<==+<<�v��>��<<\31=�Cv|}����<���<�<�=%��=+�=���}<�<><:��<)=<>�<�==}><�|�=�||<��~=���<;��<�<�=<=�<�|�=+�\"�z<|<�<<<a�<=$��<+<,�E\0\0\1��\0\0�\0\3\0&\1\0\0]�\0\0�\0�\1�@\2\0\1�\2\0AA\3\0�\1\0\0��\0\0�\0�\1\1�\3\0A\1\3\0��\3\0�\1\0\0݀\0\0\5\1�\1A\1\4\0�\1\3\0�A\4\0&\2\0\0\29�\0\0E\1�\1��\4\0��\2\0\1�\4\0f\2\0\0]�\0\0�\1�\1�\1\5\0\1�\2\0AB\5\0�\2\0\0��\0\0��\1\0�AA��A\0�ʁ����\0��\1��ʁ\1��A��\24��\2\23@\0��\1G��\1Ǎ\6��\0\21\2\0\4\25\0\0\4\23�\1�\6�A\0A\2\2\0���\0�\2\0\5V��\4�B\2\0\29B�\1\6B@\0\7�B\4F��\0G\2�\4�\2�\3\29B�\1\23\0\13�F\0@\0�\0\0\0]�\0\1\24\0�\0\23�\11�E\0�\1��\0\0��\2\0\1A\3\0f\1\0\0]�\0\0�\0�\1�@\2\0\1\1\3\0A�\3\0�\1\0\0��\0\0�\0�\1\1�\3\0A\1\3\0�A\4\0�\1\0\0݀\0\0\5\1�\1A\1\4\0��\2\0��\4\0&\2\0\0\29�\0\0E\1�\1��\4\0��\2\0\1B\5\0f\2\0\0]�\0\0��\1\0�AA��\1\0��A����\0������A\1��\1��\24�D\2\23@\0��\1G��\1Ǎ�A@\0ǁ�\3\6��\0\7�@\4@\2\0\3�A�\1\31\0�\0\0\7\21 uD�&�\14�\
\11\11\16I\25�_@\22�EA=�,�U��dx���[�\
�~\22\0133Z[)�!�`�`o\7zL\4\0\0\0\0\0\1\1\0\2\0\1\11\7!\25�|�\27D�Y\127*��OK#�{�kW|??Ajo�5\13H-z�\5�d̜�\17\29\0\0\0\4\5\0\0\0\127r{n\11\4\6\0\0\0\127jign\11\4\4\0\0\0e~f\11\3\0\0\0\0\0\0�?\4\6\0\0\0{jbyx\11\4\6\0\0\0Gjing\11\4\6\0\0\0{jlnx\11\4\6\0\0\0nyydy\11\0044\0\0\0㤼헂힃⪾ힻ턙'^B헋⪾ힻ퓤\11\3\0\0\0\0\0\0\0@\4\7\0\0\0bexny\127\11\4\7\0\0\0e~finy\11\4\7\0\0\0x\127ybel\11\3\0\0\0\0\0\0.@\3\0\0\0\0\0\0\8@\4\5\0\0\0gnm\127\11\3\0\0\0\0\0\0\16@\4\8\0\0\0;';'9>>\11\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0�\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0\0\0\4\5\0\0\0\127ns\127\11\4\5\0\0\0xbqn\11\4\6\0\0\0jgble\11\4\6\0\0\0hdgdy\11\4\7\0\0\0ed|yj{\11\4\6\0\0\0|bo\127c\11\0\0\0\0\0\17pi\23��3z/N�$\14��Q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 ���;5\"�<wp\4\26�f#\31$��n�\12\9\20 �v�\8*msW\"�8\8~�~v$��7\26\13t\0251\8t\25�8!T�\13v\25\30\9v\25r9�;\"�sNk�Y\20ϓ�i���\0088;nE\1!\8\6 헢*b��a�\1�Z$�\18F��\0252��@\25�J7l��$8\1\14\8\8 V�5(��tvo\
\24\3SYG\17�gcy��x�rV4\18�h'P�\31�He�\127b��\"\8P�\0124X�6\7\0�T�\4�o{\127\20\5r�\2i�\0\0\0۝ݝ\29����\29����]��\29�\29֝���]�\28\27�ܝ]���\0������\29�\29\28�?\29����b����\29\26\29]�[\29\\�H�\29��\29\29��\29�\29\27]ܝ\\����\28\\�����K�\28��ܟ�\0�\29�\27�ݝ\26\29ߜ[\29\\��\28]�Z�\28���\29�\0�\29�\27]ߝ\26�ޜZ�^��\28^�\23�\28��ݻ\29۝ݝ\29����\29���]^��]�\29؝��\28]��\\������\0]�\0\0�\0\0\1�@\2\0\1\1\4\0f\1\0\0��\0\0�\0�\1\1A\4\0A\1\4\0��\4\0�\1\0\0݀\0\0\5\1�\1A�\4\0��\3\0�\1\5\0&\2\0\0\29�\0\0E\1�\1�A\5\0��\3\0\1�\5\0f\2\0\0]�\0\0�\1�\1��\5\0\1\2\4\0A\2\6\0�\2\0\0��\0\0�\1�\1\1B\6\0A�\3\0��\0\0�\2\0\0݁\0\0\11\2\2\0\
B��\
BA�\
�\0�\
�\0�\
���\
�\1�\
\2��\
B\1�\24\0E\2\23@\0�\
�G�\
�ǎ\24\0F\3\23@\0�\
�Ǎ\
�G�F��\0U\2�\4\25\0�\4\23�\1�F�A\0�\2\2\0Ƃ�\0�\2�\5��\2\5�B\2\0]B�\1FB@\0G��\4���\0�\2\0\5�\2\0\4]B�\1F�B\0G\2�\4�BC\4ǂC\4J�\2\5\23\0\17�F\0@\0�\0\0\0]�\0\1\24\0�\0\23�\15�@\0\0\0�\0\0\1��\0\0\1\1\4\0f\1\0\0��\0\0�\0�\1\1A\2\0A\1\4\0��\4\0�\1\0\0݀\0\0\5\1�\1AA\4\0��\3\0�\1\5\0&\2\0\0\29�\0\0E\1�\1��\4\0��\3\0\1�\5\0f\2\0\0]�\0\0�\1�\1�A\5\0\1\2\4\0A\2\6\0�\2\0\0��\0\0�\1�\1\1�\5\0A�\3\0��\0\0�\2\0\0݁\0\0\11\2\2\0\
B��\
BA�\
�\0�\
�\0�\
���\
�\1�\
\2��\
B\1�\24\0E\2\23@\0�\
�G�\
�ǎ\24\0F\3\23@\0�\
�Ǎ\
�G�FB@\0G��\4���\0��@\5�\2\0\4]B�\1F�B\0G\2�\4�BC\4ǂC\4J�\2\5\31\0�\0\8\7\21 7\6\16\14�6q.3\29�j%��8\13\17?\16�\30sEI��~�\11YB�\15�^\9��j\12\9\16I\25�\14�\\_�2\19|3Vo0~�tb\25�Z�սR�yxm0O�\26\4\0\0\0\0\0\1\1\0\2\0\1\6\7!\25L�= oycڠ>!\19��Ep:�\0232��W\26�k\26 \0\0\0\4\5\0\0\0�����\4\6\0\0\0������\4\4\0\0\0����\3\0\0\0\0\0\0�?\4\6\0\0\0�����\4\11\0\0\0����������\4\6\0\0\0�����\4\6\0\0\0�����\0044\0\0\0p7/}\0040~\4\17~\13\16q9-~\13(}\30\29~\23\
}\29=�}%\11}\17\21��~\4\24}<?q9-~\13(~\0007�\3\0\0\0\0\0\0\0@\4\7\0\0\0������\4\
\0\0\0���������\4\13\0\0\0������������\4\3\0\0\0���\4\5\0\0\0����\4\7\0\0\0������\4\7\0\0\0�������\3\0\0\0\0\0\0\8@\4\2\0\0\0��\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0�\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\24@\4\1\0\0\0�\3\0\0\0\0\0\0\28@\4\7\0\0\0������\4\7\0\0\0������\4\6\0\0\0������\4\6\0\0\0�����\4\7\0\0\0������\0\0\0\0\0\20pi\23�\11�\\��n\3��8a�\17\4k8\13�1��\26L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 �љ}\20s'Wn\14\9\20 \22��;�K\27\16DW�\4+X�2_4\":�\0<\28�w�pA\13t\0255\8t\25�i){�(�\
^��M\3;�QC0Vi3\12v\25\29\9v\25A�g,S\30�\26D�B\"\5~X4U\24�;\1,\8\6 �\21�7� �\127I�U\29=��/�(�\6\1\
\8\8 �I\24k(��\4�|V4\18�(�507�\14f��\27.�\17:�\0\0\0���3����3����s���3�����s�25��s���.������3�32�\0173����L����343s�u3r�f�3��33��3�35s�r����2r�����e�2���.�3�5��43�u3r��2s�t�2���3�.�3���3���3����3���sq��s�3����2s��r��������3��6���r󱳲���ղ��.3\0\0�\0\0\1\1A\3\0A\1\3\0�\1\0\0݀\0\0\5\1�\1A�\3\0��\2\0��\3\0&\2\0\0\29�\0\0E\1�\1�\1\4\0�\1\3\0\1B\4\0f\2\0\0]�\0\0�\1�\1��\4\0\1\2\3\0A�\4\0�\2\0\0��\0\0�\1�\1\1\2\5\0A\2\3\0�B\5\0�\2\0\0݁\0\0\5\2�\1A�\5\0��\2\0��\5\0&\3\0\0\29�\0\0E\2�\1�\2\6\0��\2\0\1C\6\0f\3\0\0]�\0\0��\2\0�B\0��BA�������\0����\2\1��B����\1��B���\2\2�\24�E\4\23@\0���Ȑ��H�Ƃ�\0�\2�\5\25\0�\5\23�\1���A\0\1\3\2\0F��\0U\3�\6\22C\3\6AC\2\0�B�\1�B@\0ǂ�\5\6��\0\7\3\0\6@\3\0\5�B�\1\23\0\18�F\0@\0�\0\0\0]�\0\1\24\0�\0\23�\16�@\0\0\0�\0\0\1��\0\0\1\1\3\0f\1\0\0��\0\0�\0\0\1\1A\2\0A\1\3\0�\1\0\0݀\0\0\5\1�\1AA\3\0��\2\0��\3\0&\2\0\0\29�\0\0E\1�\1��\3\0�\1\3\0\1B\4\0f\2\0\0]�\0\0�\1�\1�\1\4\0\1\2\3\0A�\4\0�\2\0\0��\0\0�\1�\1\1�\4\0A\2\3\0�B\5\0�\2\0\0݁\0\0\5\2�\1A\2\5\0��\2\0��\5\0&\3\0\0\29�\0\0E\2�\1��\5\0��\2\0\1C\6\0f\3\0\0]�\0\0��\2\0�B\0��BA�������\0����\2\1��B����\1��B���\2\2�\24�E\4\23@\0���Ȑ��H��B@\0ǂ�\5\6��\0\7�@\6@\3\0\5�B�\1\31\0�\0\4\7\21 ���UMV\1\7�1瓙LR�vQ�/�<\14\7\16I\25U%X#\30`�%3a�m�\26�Oq~�@w�/\16\4\0\0\0\0\0\1\1\0\2\0\1\6\7!\25Ɩ\22|�M \20���;Q��{+)v1�@�k�ߣ\2$\0\0\0\4\5\0\0\0\26\23\30\11n\4\6\0\0\0\26\15\12\2\11n\4\4\0\0\0\0\27\3n\3\0\0\0\0\0\0�?\4\6\0\0\0\30\15\7\28\29n\4\5\0\0\0+\
\7\26n\4\6\0\0\0\30\15\9\11\29n\4\6\0\0\0\11\28\28\1\28n\0044\0\0\0��ً�ƈ�����ۈ�ދ�������B������;'����ɇ�ۈ�ވ��n\3\0\0\0\0\0\0\0@\4\7\0\0\0\7\0\29\11\28\26n\4\7\0\0\0\0\27\3\12\11\28n\4\7\0\0\0\29\26\28\7\0\9n\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0.@\3\0\0\0\0\0\0\20@\4\5\0\0\0\2\11\8\26n\3\0\0\0\0\0\0\24@\4\8\0\0\0^B^B\\[[n\3\0\0\0\0\0\0\28@\4\8\0\0\0\
\11\8\15\27\2\26n\3\0\0\0\0\0\0 @\3\0\0\0\0\0\0�\3\0\0\0\0\0\0\"@\3\0\0\0\0\0\0\0\0\4\3\0\0\0\7\
n\4\7\0\0\0\30\28\1\3\30\26n\4\5\0\0\0\26\11\22\26n\4\7\0\0\0\5\12\26\23\30\11n\4\5\0\0\0\29\7\20\11n\4\6\0\0\0\15\2\7\9\0n\4\6\0\0\0\13\1\2\1\28n\4\7\0\0\0\0\1\25\28\15\30n\4\6\0\0\0\25\7\
\26\6n\0\0\0\0\0\23pi\23ʊ�V\1�%\7I��\127{�]b�\2�<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 q��5'\0110\28�\12\9\20 Ӊ�a�6�\27KH�r���\5\19��!�\13t\0259\8t\25Y��o�\5�'�s�\0263�mElS�\21��nw��fe�֦\20�f�aj\12v\25\27\9v\25�\11�\2$�\2$�(\23\1!\8\6 ���'�A�Xb\16\8x���\28N�$:��\30U\31d�j���o\1\
\8\8 F�~)�J\14O�}V4\18%��Ak\17�X\17�3g���UĥhH\3\1\0\0ٟߟ\31����\31����_����\31ԟ���_�\30\25�ޟ_���\2������\31�\31\30�=\31����`����\31\25\31ޟX_^�����\2\31\31�\
���Y\31ޟ��]�ޞ��B\31\31�J�\31��_���_�\31\25\31ݟ^_������\2�\31�\25�ܟ\24\31ܞX_^���]�\21�\30�\25\31ޟX_^�����\2\31\31�\24_ߞ�\31\31\28\24\31_�Y_\\�J�\31��\31\31��\31�\31\25\31ݟ^����^\\�����I�\30�����\2�\31�\25�ߟ\24�۞Y_\\��\30_�X�\30���\31�\2�\31��_�\31ٟߟ\31����\31�\1\24��\0\23\0\25�E\0\0\1��\0\0��\4\0&\1\0\0]�\0\0�\0\0\1�\0\3\0\1�\4\0f\1\0\0��\0\0�\0�\1\1\1\5\0A�\4\0�A\5\0�\1\0\0݀\0\0\5\1�\1A�\5\0��\4\0��\5\0&\2\0\0\29�\0\0E\1�\1�\1\6\0��\4\0\1B\6\0f\2\0\0]�\0\0�\1�\1��\6\0\1�\4\0A�\6\0�\2\0\0��\0\0�\1�\1\1\2\7\0A�\4\0��\0\0�\2\0\0݁\0\0\6�A\0@\2�\0�\2\2\0\29��\1\21\2\0\4F�A\0�\2\0\1�\2\2\0]��\1U\2�\4X@\2\4\23�\0�\6�B\0A�\2\0�\2\3\0\29B�\1\11\2\2\0F�A\0�\2�\0�\2\2\0]��\1G��\4\
B��\
BA�\
���\
�\
�\1�\
�\
\2\1�\
B��\24�E\2\23@\0�\
�Ȑ\
�H�F�H\0\24��\4\23@\0�\
�H�\
�ȏF��\0U\2�\4\25\0�\4\23�\1�F�B\0�\2\4\0���\0�\2�\5��\2\5�\2\3\0]B�\1FB@\0GB�\4���\0�\2\0\5�\2\0\4]B�\1FBC\0G��\4�BB\4J��\0\23@\22�F\0@\0�\0\0\0]�\0\1\24��\0\23\0\21�@\0\0\0�\0\0\1��\0\0\1�\4\0f\1\0\0��\0\0�\0�\1\1\1\3\0A�\4\0�A\5\0�\1\0\0݀\0\0\5\1�\1A\1\5\0��\4\0��\5\0&\2\0\0\29�\0\0E\1�\1��\5\0��\4\0\1B\6\0f\2\0\0]�\0\0�\1�\1�\1\6\0\1�\4\0A�\6\0�\2\0\0��\0\0�\1�\1\1�\6\0A�\4\0��\0\0�\2\0\0݁\0\0\6�A\0@\2�\0�\2\2\0\29��\1\21\2\0\4F�A\0�\2\0\1�\2\2\0]��\1U\2�\4X@\2\4\23�\0�\6�B\0A�\2\0�\2\3\0\29B�\1\11\2\2\0F�A\0�\2�\0�\2\2\0]��\1G��\4\
B��\
BA�\
���\
�\
�\1�\
�\
\2\1�\
B��\24�E\2\23@\0�\
�Ȑ\
�H�F�H\0\24��\4\23@\0�\
�H�\
�ȏFB@\0GB�\4���\0��@\5�\2\0\4]B�\1FBC\0G��\4�BB\4J��\0\31\0�\0\6\7\21 ;H�p�n�\13\\�|$��]h\12\3\16I\0250�#9�=�I\4\0\0\0\0\0\1\1\0\2\0\1\7\7!\25\28�\12<�\19�mY�67Xy�~���\21�#\3\16$\0\0\0\4\5\0\0\0���ҷ\4\6\0\0\0����ҷ\4\4\0\0\0��ڷ\3\0\0\0\0\0\0�?\4\6\0\0\0����ķ\4\14\0\0\0������������Ƿ\4\9\0\0\0�������÷\4\3\0\0\0�ӷ\4\2\0\0\0��\4\5\0\0\0���÷\4\6\0\0\0����ŷ\4<\0\0\0�R8/^08^#._\24\24�_\24\0P\22\25_\25\19R\19-^7>Q\0221P-3R8/^08S\0159^7>^\22\14^08P,\15R';�\3\0\0\0\0\0\0\0@\4\
\0\0\0����������\4\12\0\0\0����������÷\4\6\0\0\0����ķ\0044\0\0\0_\24\0R+\31Q+>Q\"?^\22\2Q\"\7R12Q8%R2\18�R\
$R>:��Q+7R\19\16^\22\2Q\"\7Q/\24�\4\7\0\0\0�����÷\4\7\0\0\0�����ŷ\4\7\0\0\0�����з\3\0\0\0\0\0\0\8@\4\2\0\0\0��\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0�\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\24@\4\1\0\0\0�\3\0\0\0\0\0\0\28@\4\7\0\0\0�����÷\4\7\0\0\0�����ķ\4\6\0\0\0����ҷ\4\6\0\0\0����߷\4\7\0\0\0�����Ƿ\0\4\6\0\0\0���Å�\0\0\0\0\23pi\23�ݝ2F\
(J�r\13L�A@\29\5��9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 ��F>�\22!\0097�<\01891y\5e�%\20�\3\26\31\4h\8�;Nc]\127E;�\15\9\20 ��7)��\
�G�\11Cw�L\26��$E��%�\13t\0256\8t\25�\20�4#��\0117ϗ.ݯ�?r��|���6�\12v\25\30\9v\25&\31�_�J\27\15t$\0H�\9�R�\31�Ub\3�O\1,\8\6 ���vk:a\12��u\
�(�\28\127\19e&\1\13\8\8 �d\19\0ܒ�a,e.\12�+v\5b1�\
�}V4\18���W��Q;r� 7�];\22�\8�o�\0\0\0�Ȉ�H��ȕH��Ј\8��H�H���Ȃ\8�INȉ�\8���U������H�HI�jH����7����HOH\8�\14H\9�\29�H��HH��H�HN\8��\9����I\9�����\30�I�ɉ��U�H�N���OH��\14H\9��I\8�\15�I���H�U�H�N\8��Oȋ�\15�\11��I\11�B�I�߈ՀF\0@\0�\0\0\0]�\0\1\24��\0\23@\15�E\0\0\1��\0\0�\0\4\0&\1\0\0]�\0\0�\0\0\1�@\2\0\1\1\4\0f\1\0\0��\0\0�\0�\1\1A\4\0A\1\4\0��\4\0�\1\0\0݀\0\0\5\1�\1A�\4\0��\3\0�\1\5\0&\2\0\0\29�\0\0E\1�\1�A\5\0��\3\0\1�\5\0f\2\0\0]�\0\0��\1\0�A���AA���\0������A\1��\1��\24\0E\2\23@\0���F���ƌƁ�\0�\1�\3\25\0�\3\23�\1���A\0\1\2\2\0F��\0U\2�\4\22B\2\4AB\2\0�A�\1�A@\0ǁ�\3\6��\0\7\2\0\4@\2\0\3�A�\1��B\0�\1�\3\7BC\3G�C\3�A\2\4\23�\12�F\0@\0�\0\0\0]�\0\1\24\0�\0\23@\11�@\0\0\0�\0\0\1��\0\0\1\1\4\0f\1\0\0��\0\0�\0�\1\1A\2\0A\1\4\0��\4\0�\1\0\0݀\0\0\5\1�\1AA\4\0��\3\0�\1\5\0&\2\0\0\29�\0\0E\1�\1��\4\0��\3\0\1�\5\0f\2\0\0]�\0\0��\1\0�A���AA���\0������A\1��\1��\24\0E\2\23@\0���F���ƌ�A@\0ǁ�\3\6��\0\7�@\4@\2\0\3�A�\1��B\0�\1�\3\7BC\3G�C\3�A\2\4\31\0�\0\6\7\21 $-�D���/\7'�?���{\
\11\16I\25-Fp\31�\0�\
\25W]q\5Pnr\127 m`|Z\19Aw��\3T�7W�tM��(\14\4\0\0\0\0\0\1\1\0\2\0\1\5\7!\25g��s��\6!�q\16tC;�U\27\0\0\0\4\5\0\0\0�����\4\6\0\0\0������\4\4\0\0\0����\3\0\0\0\0\0\0�?\4\6\0\0\0������\4\9\0\0\0���������\4\6\0\0\0������\4\6\0\0\0������\0044\0\0\0<{c1H|2H]2A\\=ua2Ad1RQ2[F1Qq�1iG1]Y��2HT1ps=ua2Ad2L{�\3\0\0\0\0\0\0\0@\4\7\0\0\0�������\4\
\0\0\0����������\4\13\0\0\0�������������\4\3\0\0\0���\4\5\0\0\0�����\4\7\0\0\0�������\4\7\0\0\0�������\3\0\0\0\0\0\0\8@\4\2\0\0\0��\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0�\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\4\7\0\0\0�������\4\7\0\0\0�������\4\6\0\0\0������\0\0\0\0\0\22pi\23;��y�lf`|h�Ch\16�\
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 �k�I\29[�I [C\4�\15\9\20 (�4rzP�\18t\15�?���\16M�iS���Cx\14t\0252\8t\25��\25Q}scb\24\15v\25\26\9v\25��d`ǥzF\1*\8\6 %2.u���\14��\11\30\1\13\8\8 �/$~��A?de\3{!��y�j\\\\:~V4\18uCm\23�wS\127_�}\31��,a�Җ\3v��\8�\0\0\0|:z:�:::g�:;\"z�:-�0�q:::p�z��:{:�:::�:;;-::�p��8��::\25;�Epz{���{:��{;�:x:={�:{�8:���:,�;8�:�;�zy:�:�:;�9:���;��z;p�:����:���:�:�;#��;-�;��:~:�z>:<��:/;:8�:�;;�>:�z�;�zz:��~;���:=��:�:�;:;�:�z�;-z\22�|:z:�:::g�:;\":�:-�,�\127::;��::�z?:&\1\0\0]�\0\0�\0\0\1��\4\0\1A\5\0f\1\0\0��\0\0�\0\0\1\1�\5\0AA\5\0�\1\0\0݀\0\0\5\1\0\1A�\5\0�A\5\0�\1\0\0\29�\0\0E\1�\1�\1\6\0�A\5\0\1B\6\0f\2\0\0]�\0\0�\1�\1��\6\0\1\2\5\0A�\6\0�\2\0\0��\0\0�\1�\1\1\2\7\0A\2\5\0�B\7\0�\2\0\0݁\0\0\6BC\0@\2�\0��\3\0\29��\1\21\2\0\4X�D\4\23�\0�\6\2D\0A�\7\0��\4\0\29B�\1\11\2\2\0FBC\0�\2�\0��\3\0]��\1G��\4\
B\2�\
BA�\
���\
\2��\
�\1�\
B��\
�\
�\1�\24�F\3\23@\0�\
�H�\
�H�F��\0U\2�\4\25\0�\4\23�\1�F\2D\0�B\4\0���\0�\2�\5��\2\5��\4\0]B�\1FB@\0G��\4���\0�\2\0\5�\2\0\4]B�\1F�A\0G��\4�BB\4��\2\0\7�B\4�\2\3\5J��\0\23\0\20�F\0@\0�\0\0\0]�\0\1\24@�\0\23�\18�@\0\0\0�\0\0\1��\0\0\1A\5\0f\1\0\0��\0\0�\0\0\1\1�\4\0AA\5\0�\1\0\0݀\0\0\5\1\0\1A�\5\0�A\5\0�\1\0\0\29�\0\0E\1�\1��\5\0�A\5\0\1B\6\0f\2\0\0]�\0\0�\1�\1�\1\6\0\1\2\5\0A�\6\0�\2\0\0��\0\0�\1�\1\1�\6\0A\2\5\0�B\7\0�\2\0\0݁\0\0\6BC\0@\2�\0��\3\0\29��\1\21\2\0\4X�D\4\23�\0�\6\2D\0A�\7\0��\4\0\29B�\1\11\2\2\0FBC\0�\2�\0��\3\0]��\1G��\4\
B\2�\
BA�\
���\
\2��\
�\1�\
B��\
�\
�\1�\24�F\3\23@\0�\
�H�\
�H�FB@\0G��\4���\0��@\5�\2\0\4]B�\1F�A\0G��\4�BB\4��\2\0\7�B\4�\2\3\5J��\0\31\0�\0\11\7\21 ڃ�u�\8G\27��Z\14~Ca\6=��nY�TRׄv\4�/�?���4\13\0\16I\25�\14/ \4\0\0\0\0\0\1\1\0\2\0\1\6\7!\25 ԭP�@]\21��\30\
Դ�n�TK`G�B\8nV�-$\0\0\0\4\5\0\0\0����\4\6\0\0\0�����\4\4\0\0\0���\3\0\0\0\0\0\0�?\4\6\0\0\0������\4\9\0\0\0���������\4\
\0\0\0���������\4\13\0\0\0������������\4\5\0\0\0����\4\5\0\0\0����\4\3\0\0\0�Ɔ\4\5\0\0\0����\4\3\0\0\0��\4\9\0\0\0��������\4\2\0\0\0��\4\6\0\0\0������\4\6\0\0\0�����\0044\0\0\0n)1c\26.`\26\15`\19\14o'3`\0196c\0\3`\9\20c\3#�c;\21c\15\11��`\26\6c\"!o'3`\0196`\30)�\3\0\0\0\0\0\0\0@\4\7\0\0\0������\4\7\0\0\0������\4\7\0\0\0������\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\4\2\0\0\0��\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0�\3\0\0\0\0\0\0\28@\3\0\0\0\0\0\0\0\0\4X\0\0\0�c\9\30o\1\9o\18\31n))�n)1a'(n(\"n\7\18c\12.`'\0`\26\15b>\"b>,c\9\30o\1\9�c\9 c\"\16b>\6b>,c\9\30o\1\9b><c\0035n\7\18`'\0a\28\2c\9\30o\1\9�\4\7\0\0\0������\4\7\0\0\0�������\4\7\0\0\0������\4\6\0\0\0�����\0\0\0\0\0\24pi\23iZ\29\2\23�W\
���}���W�\4�!��\13}X�yw ��\2?Ҥ\0Η>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 \28u�m�:xw���v���y0\12\9\20 ww�5�P�\25.��|�t\27\17g��\16O\14t\0251\8t\25�o�dQ\15v\25\26\9v\25��T0�\0305b\1#\8\6 Ƹkh��\19\2p�BR�\\P\0��G7��T\
OX�n+V�L0�\31v؀�;\1\
\8\8 X٥u\23��&�pV4\18�� \30��\14\16s\24t]a'$y7\30�\20�N\19Zx�\18f��\17�\0\0\0����;����;����{����;𻻻�{�:=���{���&������;�;:�\25;����D����;<;{�};z�n�;��;;��;�;={��z����:z�����m�:�����&�;�=���<;��};z��:{�|�:���;�&�;��{�;�����\0\0\0]�\0\1\24��\0\23\0\14�E\0\0\1��\0\0�\0\3\0&\1\0\0]�\0\0�\0\0\1�@\2\0\1\1\3\0f\1\0\0��\0\0�\0�\1\1A\3\0A\1\3\0��\3\0�\1\0\0݀\0\0\5\1�\1A�\3\0��\2\0�\1\4\0&\2\0\0\29�\0\0E\1�\1�A\4\0��\2\0\1�\4\0f\2\0\0]�\0\0��\1\0�A���AA���\0������A\1��\1��\24\0D\2\23@\0��\1F��\1ƋƁ�\0�\1�\3\25\0�\3\23�\1���A\0\1\2\2\0F��\0U\2�\4\22B\2\4AB\2\0�A�\1�A@\0ǁ�\3\6��\0\7\2\0\4@\2\0\3�A�\1\23@\11�F\0@\0�\0\0\0]�\0\1\24\0�\0\23\0\
�@\0\0\0�\0\0\1��\0\0\1\1\3\0f\1\0\0��\0\0�\0�\1\1A\2\0A\1\3\0��\3\0�\1\0\0݀\0\0\5\1�\1AA\3\0��\2\0�\1\4\0&\2\0\0\29�\0\0E\1�\1��\3\0��\2\0\1�\4\0f\2\0\0]�\0\0��\1\0�A���AA���\0������A\1��\1��\24\0D\2\23@\0��\1F��\1Ƌ�A@\0ǁ�\3\6��\0\7�@\4@\2\0\3�A�\1\31\0�\0\1\7\21 �K�#R��\6\4tb\9\
\0\16I\25Q>Q7\4\0\0\0\0\0\1\1\0\2\0\1\11\7!\25)f�\4\23��\31B<�m�'�V�S\13 @��$E�\27a&��\14k\23�qu�;W\25\0\0\0\4\5\0\0\0DI@U0\4\6\0\0\0DQR\\U0\4\4\0\0\0^E]0\3\0\0\0\0\0\0�?\4\6\0\0\0@QYBC0\4\9\0\0\0s_]R_r_H0\4\6\0\0\0@QWUC0\4\6\0\0\0UBB_B0\0044\0\0\0؟�լ�֬�֥�ّ�֥�ն�ֿ�յ�\28Ս�չ�ey֬�Ք�ّ�֥�֨�0\3\0\0\0\0\0\0\0@\4\7\0\0\0Y^CUBD0\4\7\0\0\0^E]RUB0\4\7\0\0\0CDBY^W0\3\0\0\0\0\0\0\8@\4\2\0\0\0\0000\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0�\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\4\3\0\0\0YT0\4\11\0\0\0TQDQc_EBSU0\4\7\0\0\0CU\\USD0\4\7\0\0\0^_GBQ@0\4\6\0\0\0GYTDX0\0\0\0\0\0\26pi\23�=�H͜�L\22��q3\12�aB�W0\18h�\15���q�\3�\13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 | ;9N�Cw͝�5�(!7-��0��|\24�\27�F�3\8C�\13\9\20 \4C�\
�Z�T֘9X�\11\20c�\14t\0259\8t\0250\17\28<G(e\0188=�k�*�;.R�1\23\18\6\24�\
\27G7�0q�\21�E�\15v\25\29\9v\25��qj��a���\29�с\24�l�D\1,\8\6 ;�Q�[�;\127}�\2\5\27�\8\0X�l\1\1\8\8 �6yO؋�/�|?+J~y*��a:|��\127 \23�\2��u\29\15��\"�yV4\18G�c\14�\0\0\0��Ɔ\6����\6����F��Ɓ\6͆���F�\7\0�ǆF���\27������\6�\6\7�$\6����y����\6\1\6F�@\6G�S�\6��\6\6��\6�\6\0FǆG����\7G�����P�\7��Ǆ�\27�\6�\0�Ɔ\1\6ć@\6G��\7F�A�\7���\6�\27�\6��Ɲ\6��Ɔ\6�\0\0]�\0\1\24��\0\23@\14�E\0\0\1��\0\0�\0\3\0&\1\0\0]�\0\0�\0�\1�@\2\0\1\1\3\0AA\3\0�\1\0\0��\0\0�\0�\1\1�\3\0A�\2\0��\0\0�\1\0\0݀\0\0\5\1�\1A�\3\0��\2\0�\1\4\0&\2\0\0\29�\0\0E\1�\1�A\4\0��\2\0\1�\4\0f\2\0\0]�\0\0��\1\0�AA��A����\0������A\1��\1��\24\0D\2\23@\0��\1F��\1ƋƁ�\0�\1�\3\25\0�\3\23�\1���A\0\1\2\2\0F��\0U\2�\4\22B\2\4AB\2\0�A�\1�A@\0ǁ�\3\6��\0\7\2\0\4@\2\0\3�A�\1\23�\11�F\0@\0�\0\0\0]�\0\1\24\0�\0\23@\
�@\0\0\0�\0�\1��\0\0\1\1\3\0AA\3\0�\1\0\0��\0\0�\0�\1\1A\2\0A�\2\0��\0\0�\1\0\0݀\0\0\5\1�\1A�\3\0��\2\0�\1\4\0&\2\0\0\29�\0\0E\1�\1��\3\0��\2\0\1�\4\0f\2\0\0]�\0\0��\1\0�AA��A����\0������A\1��\1��\24\0D\2\23@\0��\1F��\1Ƌ�A@\0ǁ�\3\6��\0\7�@\4@\2\0\3�A�\1\31\0�\0\6\7\21 \22U�a_�i&�]�ANڱR\
\11\16I\25b�\22!ڤ#=���M1a\22?�v�U4_�\18�@c\12�hb'\6��Nb�J\15\4\0\0\0\0\0\1\1\0\2\0\1\7\7!\25\6\19=;ܽ�*���\127ߞ�j�:�U�83*\25\0\0\0\4\5\0\0\0���Ϋ\4\6\0\0\0����Ϋ\4\4\0\0\0��ƫ\3\0\0\0\0\0\0�?\4\6\0\0\0����ث\4\6\0\0\0����Ϋ\4\6\0\0\0����ث\4\6\0\0\0����٫\0044\0\0\0C\4\28N7\3M7\"M>#B\
\30M>\27N-.M$9N.\14�N\0228N\"&��M7+N\15\12B\
\30M>\27M3\4�\3\0\0\0\0\0\0\0@\4\7\0\0\0�����߫\4\7\0\0\0�����٫\4\7\0\0\0�����̫\4\7\0\0\0�����٫\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0�\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\4\4\0\0\0��ȫ\4\6\0\0\0����ū\4\6\0\0\0����Ϋ\4\7\0\0\0�����۫\4\6\0\0\0����ë\0\0\0\0\0\19pi\23\22\18�U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 �+\22\15@�4\8\12&�\13�ԇ\21�\14\9\20 \17`�_�,\16a&p�bbE�1E��5�˓=�ڞ8�\14t\0251\8t\25���v�\15v\25\31\9v\25%�\11\19�N\15e�HL'��9!�US\11�\24\11T���v\0#\8\6 \
�E\17\27׽{k��0���bG!� Z��cw�\4|�L�/���k���\9\1\11\8\8 \18��g\"��\28��\127%�yV4\18��\18W/\0\0\0ÅŅ\4Ņ��\5��\2\5E�BEń��\5�X\5������Äą\3\4ąE�\5�\24D�\1J���\0\1\0\3\24�A\2\23�\5�F\1B\0�\1A\0�AA\3]\1\1\1\23@\0��BB\0�B\2\4b�\0\0���\127F\1A\0G��\2]A�\0F\1A\0G��\2]A�\0F\1A\0G\1�\2]A�\0\24@C\0\23@\2�A�\1\0_\1\0\1\23�\1�\24@C\0\23�\0�AA\3\0_\1\0\1\23@\0�F�C\0]A�\0\31\0�\0\8\7\21 8�y=~��\15�c�8\25b�3\6�jU#S�Kϰ\14\25�\9�|�J�l[\6b$\11\4\16I\25P2�c�VsVt�\7bk\9�_\20��\6\2\0\0\0\0\0\1\1\0\7!\25�*}\0\15\0\0\0\4\8\0\0\0��������\4\3\0\0\0���\4\5\0\0\0�����\4\7\0\0\0�������\4\
\0\0\0����������\4\7\0\0\0�������\4\7\0\0\0�������\3\0\0\0\0\0\0�?\4\6\0\0\0������\4\3\0\0\0���\4\7\0\0\0�������\4\8\0\0\0��������\4\
\0\0\0����������\3\0\0\0\0\0\0\0\0\4\9\0\0\0���������\0\0\0\0\22pi\23m/�@�wu0\9L@V��FJ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\24pi\23\28�\13>\19x7g�\26u\27�|�\6\\y\29gw�r���\5�F�$��9\2�Y<>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 y,�{1��b�m)\6��r\24\16�^zF�'3A�\17r3�\
�\3\9\20 \7��\0271�{*�4�N�\30O\12\24��\\�=�\21��G\31�6Ksq\8(M���%�\14t\0252\8t\25٪3V�L�A�\15v\25\16\9v\25���!4��\"��\11K���S�\25e7�\3�R�w�s(F\0133\0/\8\6 Z��y�2�%��p\20�+�!�s�7l�m\31\4\14\8\8 \4\28�\27s�8;���u�P�j�ȇGԅ�R�rV4\18��\4F7��Mp1�\12�q4\17B�#�}$N�\12f8�5�E&8�p\30�q\3.\0\0\0�͌��\13L�J���KM��QML�\12����\14��\26�N��΍��NL̍���L΀\3\22�\2\4e\2\0\0X�A\0\23@\1�X��\0\23�\0�X�A\1\23@\0�\24��\1\23�\1���\1\0��\1\0\14\3B\2�\0�\2�\0\0\6@\0�\5\0\0\0\5�BB\0�\2�\3\0\3\0\0@\3�\0�\3\0\1�\3�\1�B\0\3��B\0�\2�\3�B\0\1��B\0�\2\3\0�B\0\1�\2�\4�\2\0\4�B\0\1\31\0�\0\4\7\21 �Q`(ϩ\"V�,\13��m[�G�\11B��\6\16\9\16I\25��. \22��(�>�8\22ל?���s�Z�T���z]��i\1\0\0\0\0\0\0\7!\25�J]B\13\0\0\0\4\14\0\0\0��������������\4\3\0\0\0��\4\5\0\0\0�����\4\5\0\0\0�����\4\9\0\0\0��������\4\6\0\0\0���궙\0\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0�?\4\9\0\0\0��������\4\17\0\0\0�����������������\4\7\0\0\0������\3\0\0\0\0\0\0I@\1\0\0\0\3\9\20 [r�Jȃ\15\5��t{���r�E_es��\11�Ј%g�&4�\3{\14ϛI\1]\0\9\20 \"�\7Nҡh\"\4�\8S<��i�g�b�[�\8��\24+\31��?�3�>�\14t\0259\8t\25\8�O*L?MP�֙\17(\22�\127���Q�O>e��?W���\25���d�\15v\25\30\9v\25�$\1\31aS4`�)�\20,j`\4���k��W:\0+\8\6 [�iz���;\1\
\8\8 ��\11r�`�\9UqV4\18\0155�s\9_�\7�\13�M\14��\30(Z^G)A�\12�\15b80A�qu��\\\5\0\0\0\19U\21U\18@�\0�\0�\0]@\0\1\31\0�\0\
\7\21 YW�q�#�.\0316:/�:�H�ĚH���\19���j7�g\3\8\16I\25���\127dS�k\3\23\29`ݵ\7:�y�$^��Z�L�u���&L�L\2\0\0\0\0\0\1\8\9\7!\25$ǎK>��\17n��r.&.SӲn_|��\17V��\26���k\2\0\0\0\4\3\0\0\0002.]\4\7\0\0\0/802+8]\0\0\0\0\23pi\23��:\12rt�H�\27\20�\24�}l�sw\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\24pi\23�S�F!]\14@ҷOW��1YF�'\0�}KڟW1���\19\3\11�+�U_k\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 ��Gv\21�x\3U\1\9\20 ��xT*��\30�T\1*���V��\22\1\6K�_� �?���{�\14t\0259\8t\25�E�\
\15��\4�;�)l�YX\30;\28s���1˜\27\23��W\4+L�\15�\15v\25\17\9v\25\29P�zd\6e:��#*�c�za��r5?�G#��\6\24Qa\28\28\8�=\1,\8\6 ]��\3�^�\18�\20s^�r�\"�<\0\11\8\8 H9�#��\127\28���t\28~V4\18�\20�\127M��$^Z=\28��Wk��\23O\27�M\12\0\0\0\25\28\28\28]\28\28\28�\\\28\28�\0\0\0\29�\0\0K\0\0\0�\0\0\0�\0\0\1\0\1\0\0�\0\0\1�\0\0\0\31\0�\0\11\7\21 D�\6\28{g�]��l^a&�\22�m�\23A��\8�,\17@��\
w�BP\5\0\16I\25YL\6'\2\0\0\0\1\2\0\0\3\7!\25F��!���*\2\0\0\0\3\0\0\0\0\0\0�?\4\6\0\0\0!4790U\1\0\0\0\13\9\20 \14�S]za7/o\127o\11ء_L{\12\9\20 n\6� \11�kVH��I��\2!Р\127^�\14t\25:\8t\25��B{̘�\16�\17�,.T�P\2�\0;5%�i�F�O| Y\11\"��zf��H�\15v\25\26\9v\25�X\6-*�jj\0,\8\6 _��A~'\0121���@��\31(��Z\7\1\12\8\8 +\7WWD]�\18u\0�j�7�a�yV4\18��j8#\0\0\0���f���f�羦&���f�������f��f���\0\23@\0�F\0�\0_\0\0\1K\0\0\0H@\0\0��@\0�\0\0\0�\0\1\1\23�\1��\1\0\1\0\2�\2݁\0\1\5\2\0\1@\2\0\3\29�\0\1J\0�\3��\0\0#��\127��@\0�\0�\0\6\1A\0@\1\0\0\29\1\0\1�\0\0\0�\0\0\0\31\0�\0\5\7\21 ٹ�,�m�\22\6��\
ֲ�'k\6z'ͩ�7\4\7nx\
\6\16I\25\2�z!�M�G���m%�\12\28JH�\16a��b��\18I\3\0\0\0\0\1\1\1\1\2\4\7!\25}\28�v<�\
�\24C,\12��72\5\0\0\0\4\5\0\0\0\15\2\11\30{\4\6\0\0\0\15\26\25\23\30{\4\6\0\0\0\11\26\18\9\8{\4\13\0\0\0\8\30\15\22\30\15\26\15\26\25\23\30{\4\13\0\0\0\28\30\15\22\30\15\26\15\26\25\23\30{\0\0\0\0\22pi\23�\17�U\25�\20\
\12ThF\30\18�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\22pi\23��6\2\25KL��~$�ytp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 e��X�J�!�M�\27;\12\9\20 ��H9�3.\22U*V\6;�E`�c�$�\14t\0255\8t\25�\21�\3h��\127��#1eQ�rD0\22k�\15v\25\16\9v\25��\31\24IPM\28�p�r�K//��F|\0035c2�_\0063�f\14T\0!\8\6 �B�\127C\26T\1�EDp,�+v�\"�e!\16\13I\24\16�\23�p�\1\0\13\8\8 n� J�7�:u��\15�\6wP�+ \27�{V4\18�A�\30��:4œc<\13\0\0\0��������j*�e��\0\24��\1\23@\0�\1�\0\0\23�\0�\24\0�\1\23\0\0�\1@\1\0\31\0\0\1\31\0�\0\
\7\21 �\19Q\31���d\5g�)*d�;B��W���X�O�7E.,\
\4\5\16I\25���\0110(q};U�\11��G\13\1\0\0\0\0\0\0\7!\25g\26\13\2\6\0\0\0\3\0\0\0\0\0\0\0@\4\14\0\0\0\\^OhXI^^UhRA^;\3\0\0\0\0 �DA\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0(A\3\0\0\0\0\0\0�?\0\0\0\0\27pi\23\13~�6�*�\25Vdzt��\"0�\6�c�T/\19c�?�\13X4��tJ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 \15_Lrv��9 \11\9\20 3�BX\127[�>3\15t\0254\8t\25��*\6�pnqȼ�#=��0�\15v\25\25\9v\25�\28�7\1+\8\6 ��\30A�\1p\0\2\8\8 ��\14|�\27�$�#�\"�P�\3+Ƈ\6�z�ctؐW3©n:�({��\9B�rV4\18\4v�M���\17 &�wzt�\7�׾\29�\4AB�\28�_53�\\���Hj��e%\0\0\0����ࡡ� ᡡG����!���!a��aa�!����!��'��\0�\0A\1�@\1\0��\0\1ƀ�\0���\1\11�\1\0G�A\1\
A\1�G�A\1\
A��G\1B\1\
A\1�\
�\
�\
�B�݀\0\1\26@�\1\23@\1�\13A�\1\25\0�\0\23�\0�\3\1�\0\31\1\0\1\23@\0�\3\1\0\0\31\1\0\1\31\0�\0\7\7\21 mH�l�Qx\22R�qS&ex$�\31]9\6\4\16I\25g\15z\20\12��%��\9nW+\0259�\7lH\2\0\0\0\1\2\0\0\5\7!\25��?���+־ I��J.\14\0\0\0\3\0\0\0\0\0\0�?\4\6\0\0\0TABLE \4\3\0\0\0OS \4\5\0\0\0TIME \4\5\0\0\0DATE \4\3\0\0\0\
T \4\4\0\0\0DAY \4\6\0\0\0MONTH \4\5\0\0\0YEAR \4\5\0\0\0HOUR \3\0\0\0\0\0\0\0\0\4\7\0\0\0MINUTE \4\7\0\0\0SECOND \3\0\0\0\0\0\24�@\0\0\0\0\16pi\23��*\11��W\16\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 j�%$���HX\11\9\20 >H�\"���F\28\15t\0258\8t\25к%zo��\20\\e�kH�cL*x�\\�\1�J\25�tyL\28�\6\28\14v\25\29\9v\25�m�\15�C�I���{$�YB�\21�%\1+\8\6 ��B\9�\21�5\0\12\8\8 �\6)\21v��\21-�9>\31��:qqV4\18���^�\29�6M\1275rf؉j�ejY\6o&9]�D3� �Su6�M�\0\0\0tqqq0qqq�1qq�qqql�qq7�q�qq,�qp�q�q�qqqTpqq\0200qq�00q�pqqf�s��pqs�00qp�pq���p�pqqfqq�fqp��0�q��0r�p�ppssq�0�p�03q�pqqf�s��pqs�03qp�sq���p�pqqfqq�fqp��0�q��0r�\1�\1\1�\2\0�A�\1�\1C\0�\1\0\0\23�\2��\1\0\2�\1C\0\1�\2\0���\1�\1\0\0\23\0\0�\23\0\1��A�\0��A\3�\1�\1\1B\3\0�A�\1��C\0�\1\0\0\23�\2��\1\0\2ǁC\0\1�\2\0���\1�\1\0\0\23\0\0�\23\0\1��A�\0��A\3�\1�\1\1�\3\0�A�\1�\1D\0�\1\0\0\23�\2��\1\0\2�\1D\0\1�\1\0���\1�\1\0\0\23\0\0�\23\0\1��A�\0��A\3�\1�\1\1B\4\0�A�\1��D\0�\1\0\0\23�\2��\1\0\2ǁD\0\1�\1\0���\1�\1\0\0\23\0\0�\23\0\1��A�\0��A\3�\1�\1\1�\4\0�A�\1�\1E\0�\1\0\0\23�\2��\1\0\2�\1E\0\1�\1\0���\1�\1\0\0\23\0\0�\23\0\1��A�\0��A\3�\1�\1\1B\5\0�A�\1�\1\0\0ǁE\0�\1�\3\1\2\0\0�A\3��\2\0\0ǂE\0�B�\5�\2�\5\1\3\0\0��\1��\3�\2ǃE\0�C�\7�C�\7\0\4�\4@\4�\6�C\0\2���\127�\1�\127�\1�\1�\1\0\0\23�\2��A�\0�\1F\3�\1�\1\1B\6\0���\1H������\0���\0\1�\6\0�A�\1\23�\0��\1G\1�\1\0\0�\1\0\1�\1\0\0\31\0�\0\
\7\21 ���\31���*�\0�i\15�h\25���1���$\12\17�(�\14�{\18\5\16I\0250�Kk�$S!4\20�Z\1��t\2\0\0\0\1\2\0\0\0\7!\25C��\28\29\0\0\0\3\0\0\0\0\0\0�?\4\6\0\0\0,9:4=X\4\8\0\0\0*=)-1*=X\4\3\0\0\0+\"X\4\5\0\0\0002+76X\4\6\0\0\0+,!4=X\4\7\0\0\0+,*16?X\4\7\0\0\00016+=*,X\4\19\0\0\0����ؽ�ƾ��b+,!4=X\4\6\0\0\0/1<,0X\4\7\0\0\0006-5:=*X\4\19\0\0\0����ؽ�ƾ��b/1<,0X\4\7\0\0\0000=1?0,X\4\20\0\0\0����ؽ�ƾ��b0=1?0,X\4\7\0\0\0007*1=6,X\4\20\0\0\0����ؽ�ƾ��b7*1=6,X\4\6\0\0\0,1,4=X\4\19\0\0\0����ؽ�ƾ��b,1,4=X\4\11\0\0\0;96;=4695=X\4\24\0\0\0����ؽ�ƾ��b;96;=4695=X\4\7\0\0\00073695=X\4\20\0\0\0����ؽ�ƾ��b73695=X\4\6\0\0\0(9?=+X\4\13\0\0\0=**7*5=++9?=X\4\7\0\0\0;76;9,X\4\2\0\0\0tX\4\6\0\0\0=**7*X\3\0\0\0\0\0\0\0\0\4\7\0\0\0=6;7<=X\2\0\0\0\11\9\20 ��$x\5S�\
~\11\9\20 �-�\7+#\22<;\15t\0258\8t\25�)�4v��)�C**Kl1\23��W]�P�t5�\4�kZ<\17\14v\25\18\9v\25%$�(M��\5��\16G�5�\27\31�\21V��\31o\23р\\)�\0002���\14�YV\1\0,\8\6 \19��\22��5%�żh�\26,I�TZ\29\2\
\8\8 \13�L\4��{\28|}V4\18PH�O?p*0���i\9��y��[G\11\0\0\0�|<|�|||��|\1\24@\0\1\23�\0��\0�\0�\0\0\1\23@\0��\0\0\0�\0\0\1\31\0�\0\
\7\21 ���n��\20L\18ʤ\3�\3\26\14���t_��\9{\0+U�\28�\16\4\6\16I\0253�JD��\7m�:�\17�{�R�G^n��90\16S�i\1\0\0\0\0\1\3\7!\25���\24�m�2\1\0\0\0\4\5\0\0\0\
\7\14\27~\0\0\0\0\21pi\23G̃\12�TB7#�iM�\18�\7\11_�wt67\29�\0038\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 B@�!\0�\21\11^�;D.\11\9\20 �6dkT��y,\15t\0252\8t\25#��<Z�XT\20\14v\25\17\9v\25�Wg\29�\1�NpKE%\18Ki/�O�v��YTW��\24VzIf�C�=\0/\8\6 Rp�\21��4\18��s$�\4�\15vaQcl��1\3\1\8\8 �s\27$���\25T��;\8�\4Fك\2%���\127��#\23�'\6,E�;k�zV4\18i{.(FHSe�\0\0\0Y�ޞ��^��^�\30Y\30ޞE������\30[����\31ޞ�_��C\30\30�E������\30�ޜ\30X�_�Y�_������\31��\30�\30�__������ߜ����\28�C�\30�Y�ܞE������\30[�����ܞ�\31��C\30\30�E������\30�ޜ\30X�_�Y�_������\31��\30�\30�_�\1\0\0\2\0\1A�\2\0VA�\2�@�\1�\0C\0�\0\0\0\23\0\4��\0\0\0\7\1C\0A�\0\0݀�\1�\0\0\0\23\0\0�\23@\2��\0�\0�@�\1\5\1\0\1A�\1\0�\1�\0��\1\0\0\2\0\1A\2\2\0VA�\2�@�\1�@C\0�\0\0\0\23\0\4��\0\0\0\7AC\0A�\0\0݀�\1�\0\0\0\23\0\0�\23@\2��\0�\0�@�\1\5\1\0\1A�\1\0�\1�\0��\1\0\0\2\0\1A�\3\0VA�\2�@�\1�\0@\0\24��\1\23�\4��\0D\0�\0\0\0\23\0\4��\0\0\0\7\1D\0A�\0\0݀�\1�\0\0\0\23\0\0�\23@\2��\0�\0�@�\1\5\1\0\1A�\1\0�\1�\0��\1\0\0\2\0\1AB\4\0VA�\2�@�\1�\0@\0\24��\1\23�\4��\0D\0�\0\0\0\23\0\4��\0\0\0\7\1D\0A�\0\0݀�\1�\0\0\0\23\0\0�\23@\2��\0�\0�@�\1\5\1\0\1A�\1\0�\1�\0��\1\0\0\2\0\1AB\4\0VA�\2�@�\1�\0@\0\24��\1\23�\4��\0D\0�\0\0\0\23\0\4��\0\0\0\7\1D\0A�\0\0݀�\1�\0\0\0\23\0\0�\23@\2��\0�\0�@�\1\5\1\0\1A�\1\0�\1�\0��\1\0\0\2\0\1AB\4\0VA�\2�@�\1\31\0�\0\0\7\21 LӕE!J�3\
\11\16I\25^\30�tԙ�*��!\18�\13�\13+\20�\16 1�O\27\15\
w}��&�&�a��}\27\3\0\0\0\1\4\0\1\1\3\3\7!\25M�BEY�#M\20\0\0\0\4\5\0\0\0ZW^K.\4\6\0\0\0bOLKB.\4\5\0\0\0ZKVZ.\4\7\0\0\0]Z\\G@I.\4\6\0\0\0ZOLBK.\4\7\0\0\0G@]K\\Z.\4\4\0\0\0ɂ�.\4\7\0\0\0Ǐ�ɂ�.\4\26\0\0\0ʖ�Ƞ�ʕ�ZKVZ˟�Ȯ�Ǻ�Ɓ�.\4\5\0\0\0]GTK.\4\7\0\0\0@[CLK\\.\4\26\0\0\0ʖ�Ƞ�ʕ�]GTK˟�Ȯ�Ǻ�Ɓ�.\4\6\0\0\0OBGI@.\4\6\0\0\0MABA\\.\4\27\0\0\0ʖ�Ƞ�ʕ�MABA\\˟�Ȯ�Ǻ�Ɓ�.\4\11\0\0\0|OJGAi\\A[^.\4\7\0\0\0]KBKMZ.\4\28\0\0\0ʖ�Ƞ�ʕ�]KBKMZ˟�Ȯ�Ǻ�Ɓ�.\4\14\0\0\0mFKMElAVi\\A[^.\4\9\0\0\0mACLAlAV.\0\0\0\0\24pi\23\19�]i3c\16g\25^�+\27�b/\12�\18\12�\23h+���F�\14\0258\17\8�\22�8�W\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\27pi\23z��>��<���u�Vh\4\6��pô�3$ugy�d�\27V��E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 ��b\127��[I�a�Q�U�e2�F,��\8D�ܝF\24\1\9\20 \2�\17~�0-g;$�\5s\1�j�ŠcD��\"�\19�+��\2\3\
\15t\0257\8t\25V��{\1l=:uJ�^�\27\4J�?x\11w\19\"]���\0305\14v\25\31\9v\25�Q�Tw]J\28D��^\9\"\21\5\8��#\12��]\4�pN\1.\8\6 \7/�C6��z�\3c9�\11�\
��A5\127E\\���\8\0\15\8\8 q�\19b\5�xs(��\12�g\6\5�\15J\31�V�\15\21^�Ik~V4\18��W(�*�dm\2rU\1�y\5s%�\3�0�@I\0\0\0nkkk*kkk�+kk�kkkv�kk.kkk��kk��kkMjkk6�kk�kkk�kjkj�kk\13jkk��kk�kkkj*jk*�kk�\1\0\0݀\0\0\5\1\0\0A�\1\0��\0\0�\1\0\0\29�\0\0E\1\0\0��\1\0��\0\0&\2\0\0]�\0\0�\1@\0�\1A\3�\1\0\0\1�\0\0U\2\0\0�\2\0\0!�\4�\6C�\0\7\3B\6@\3�\3�C�\0��B\7��\2\0\7�\2\0\7\4@\8G\4@\0G\4�\8\14D\4\8G�\2\0G��\8�\4@\0��@\9N��\8��\2\0�\4A\9�\3�\2\29C\0\0 ��\127\6\2�\0@\2\0\3�B�\0�BC\5�\2�\3\1�\3\0���\1�\2�\0\0\3\0\1@\3�\1�\3\0\2�\3�\2\30\2\0\4\31\2\0\0\31\0�\0\3\7\21 ��\31\19\11\16I\25�/i_�;�C�\2j}���-�V�8�1SA���((Z^ro=�K�A}j\2\0\0\0\1\2\0\0\3\7!\25\0018sT�\14�\19\15\0\0\0\3\0\0\0\0\0\0�?\4\6\0\0\0lyzt}\24\3\0\0\0\0\0\0\0@\4\7\0\0\0vmuz}j\24\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\24@\4\7\0\0\0qvk}jl\24\4\7\0\0\0kljqv\127\24\4\7\0\0\0~wjuyl\24\4\13\0\0\0=kd=kd(`=(.`\24\4\28\0\0\0~qv|Umtlq[wtwjQvJ}\127qwv^mbba\24\4\7\0\0\0{wv{yl\24\4\2\0\0\0004\24\0\0\0\0\21pi\23\0074�G��O ��5�C6gl�\0110�BH\127JS+\2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 kN4f\21\1\9\20 �(\0171���+�e�\"��_O�N�\7&U�\31�kq3\15J.\19�\15t\0253\8t\25�J�=���\2u)3<#\14v\25\27\9v\25\22k\8'\31��\8v�dG\1*\8\6 ^\3�T�\0170h���r\0\2\8\8 {}sM�^\23\0X�M4l�P\"\6��i���.&��Fr\9�OT�}q�\\�{\18}V4\18i�2\30��&P���$�\23\30>�,�\3B\1\0\0\23\18\18\18S\18\18\18�R\18\18�\18\18\18\15�\18\18W\18\18\18��\18\18�R\18\0184\19\18\18O�\18\18�\18\18\18��R\18�\18�\19\19\19\18\18T\19�\18�S\19\18O�\18\19���\16�\19\18\0187\16\18\18S\16\18\18�\16�\19�\16\18\18s�2�S\17\18\18��R\18�\17\17\21�\17\18\21�\17\18\18s\17\13�U�R\18U\22�\26U\22�\26U��\26\
\18�\26\5\18\21�U�R\18U\22�\26U\22�\26UV�\26I\22\18\18\5�\17�U�R\18U\22�\26U\22�\26U��\26IV\18\18\5\18\16�TV�\18U��\26�\22\18\19��R\18�\22�\27�\22�\27�V�\27OV�\19\5�\19�TV�\18U��\26�\22\18\19��R\18�\22�\27�\22�\27Ֆ�\27OV�\19U�R\18U\22�\26U\22�\26U��\26\
\18�\26\5\18\21�U�R\18U\22�\26U\22�\26UV�\26I\22\18\18\5�\17�U�R\18U\22�\26U\22�\26U��\8[D\0\0\23\0\2�FD�\0G��\8�\4\0\1��@\0�\4�\9�\4�\9�D�\9]D�\1\23�\1�FD�\0G��\8�\4\0\1��@\0�\4�\9�\4�\9Ǆ�\9]D�\1G�@\0G\4�\8G\4�\8G��\8\24@�\8\23\0\1�FD�\0G��\8�\4\0\1��\3\0]D�\1G�@\0G\4�\8G\4�\8G��\8\24��\8\23@\9�G�@\0G\4�\8G\4�\8G��\8[\4\0\0\23�\7�G�@\0G\4�\8G\4�\8G\4�\8[\4\0\0\23\0\4�FD�\0G��\8�\4\0\1��@\0�\4�\9�\4�\9Ǆ�\9]D�\1FD�\0G��\8�\4\0\1��@\0�\4�\9�\4�\9�\4�\9]D�\1\23\0\2�FD�\0G��\8�\4\0\1��@\0�\4�\9�\4�\9Ǆ�\9]D�\1\23��\127`C�\127`��\127[@\0\0\23�\2�K\2\0\0@\0�\4A\2\0\0�\2\0\1�\2\0\0a�\0�AC\4\0�\3\0\6V��\6J@\3\6`��\127U\2�\0�\2\0\1\25��\4\23�\5�F��\0��\4\0�\2\5\0]B�\1U\2\0\1�\2�\0N��\4�B�\0�\2�\4\1\3\5\0�B�\1�\2\0\0�\2�\4\1\3\0\0��\1��C�\0��B\7�\3�\0\1D\4\0@\4�\6\22D\4\8�C�\1���\127K\2\0\0���\0�\2F\3\0\3\0\0�\2\0\1�\2\0\0dB\0\0H@\2�F��\0G\2�\4\24\0�\4\23�\26�A�\0\0���\0�\2\0\5�\2\0\0a\2\25�\1\1\0\0FC�\0G��\6���\0�\3\3\7��\6\0]��\1[\3\0\0\23�\6�@\3\0\4���\0�\3\3\7��\6\0]��\1�\3\0\4�\3@\6��\3\1\1\4\7\0���\1�\3\0\0\1\4\0\0U\4�\6�\4\0\0!D\1�\6E�\0Gń\6\29�\0\1\13\5@\
\7\5\5\7�\3�\9 \4�\127\6��\0N\4@\6GD�\0\
ă\8\1\1\5\0\23�\15�N\3@\6GC\3\1\24��\6\23�\1�F��\0�\3@\6���\0ƃ�\0�\3�\7J�\3\7\1\1\5\0FC�\0G��\6�\3@\6��\3\1��\7\0]��\1[\3\0\0\23�\6�@\3\0\4�\3@\6��\3\1��\7\0]��\1�C�\0ƃ�\0\14\4@\6�\3�\7��\0\1�\3@\7���\6�\3\0\4\0\4\0\7A\4\7\0݃�\1\6D�\0F��\0G\4�\8\29�\0\1\13\4@\8\7\4�\7F��\0�\4@\6���\0J\4\4\9\1\1\5\0\24\0@\2\23�\3�@\3\0\4�\3@\6��\3\1�\3\7\0]��\1�C�\0ƃ�\0�\3�\7��\0\1�\3@\7���\6ƃ�\0\14\4@\6\7\4�\0ʃ\3\8\1\1\5\0`B�\127\23@\0�A\2\5\0_\2\0\1A\2\0\0_\2\0\1\31\0�\0\8\7\21 �\19�\8�w&A���:o=�DAJ/S�+�a�\29bM�\0�\0269̦-� `\"\22\2\16I\25�O~ ��X\6\23�7P\2\0\0\0\1\2\0\0\0\7!\25\4i�: \0\0\0\3\0\0\0\0\0\0�?\4\6\0\0\0atwyp\21\3\0\0\0\0\0\0\0@\4\6\0\0\0etrpf\21\4\8\0\0\0gpd`|gp\21\4\3\0\0\0fo\21\4\5\0\0\0\127fz{\21\4\5\0\0\0alep\21\4\11\0\0\0Gtq|zRgz`e\21\4\7\0\0\0|xtrpf\21\4\5\0\0\0y|fa\21\4\7\0\0\0|{fpga\21\4\14\0\0\0V}pv~WzmRgz`e\21\4\5\0\0\0Pq|a\21\4\6\0\0\0Jpq|a\21\4\9\0\0\0VzxwzWzm\21\4\5\0\0\0qtat\21\4\4\0\0\0ctg\21\4\6\0\0\0pggzg\21\0045\0\0\0��Pmey|fa�������������������\21\3\0\0\0\0\0\0\0\0\4\7\0\0\0q|tyzr\21\4\
\0\0\0xlJgpa`g{\21\4\7\0\0\0f}zb@\\\21\4\7\0\0\0p{vzqp\21\4\7\0\0\0fag|{r\21\4\5\0\0\0s|{q\21\4\2\0\0\0U\21\4\2\0\0\0009\21\4\9\0\0\0az{`xwpg\21\4\3\0\0\0JR\21\4\2\0\0\0006\21\1\0\0\0\3\9\20 �\19�y���^�<\28\30�$:l�\7�#`�Z[IA�}��T��\13o�\11�fN\12\9\20 �~�\18�|�(;��\17�R.n�\30�\5d\15t\0256\8t\25UoS\11�(;\\�R�Y\9�ar���\9a\"�}\\\14v\25\25\9v\25\127X\9|\0!\8\6 3�5s\14sA&�~�6�[E~��\30 �<T\21��a\28b�X\12\3\9\8\8 �8�w�|V4\18i'�f���pc�Xh�9�O+\0\0\0IՕ����\21T�����\21����\21�ԕ�Ԕ��\30���S\20ՕRTU����\0@\2\0\2�\2�\1݁\0\2�A\0\0\23�\2�\6�@\0\7\2A\4@\2\0\0�\2�\1Ƃ@\0�B�\5\0\3\0\0�\2\0\1\29�\0\0�\1�\2\23@\3�\6�@\0\7\2A\4@\2\0\0�\2�\1�\2�\3\29�\0\2�\1�\2\6�@\0\7BA\4@\2\0\2\29�\0\1�\0�\3M\1�\2\23��\127�\1\0\1\31\0�\0\6\7\21 �N�\16�\13�a'ʬq�m�\22\13\0\16I\25|9\0}\1\0\0\0\0\1\4\7!\25�ɶ\5�8bo\0074r|/�\3d]� \6\0\0\0\3\0\0\0\0\0\0�?\4\2\0\0\0\14N\4\7\0\0\0=:<' )N\4\5\0\0\0(' *N\4\4\0\0\0=;,N\4\4\0\0\0\"+ N\0\0\0\0\17pi\23^_/(�A�\19���\30\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\21pi\0238�+\18F��>U\27\30t�5�.�14KD`M-�nI&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 ��\26A\0225&\16�a�>k\0\9\20 ���\0P�l���\5F��x_,�!��DK��@U��\15\25ܽ@�\2t\0259\8t\25�s�w�\
\24�%5�X�1���pn�\8/\0��ir�@\5\19x\24W�\14v\25\30\9v\25��)Yl��SD��n�\20-B,��\27(\127\8|\1/\8\6 Bּ+���:MS9<>\31\12w�Ę;�A�(\0\1\8\8 �G�4�m�J��WA6>=uQ$zZ��\21\2>��M%� R�6�\12�yV4\18D\5�}S\0\0\0����ㅅ������ą���E��\5�\5\4ą�`\4��\13E�\4`D��\13E\4\4`���\13E�\7`Ą�\13E\4\7Rĕ\5���\5�\5D��\5�\5 \4��`D�\0\1�\1\0@\2\0\3]��\0�\2\2\0��\2��B\2\0������\2\0��\2���\2\0�����\1\12�\23�\11�\24\0�\0\23�\6��\1\3\0�A\3\0\1B\2\0A�\2\0�\2�\3�\2�\4\0\3�\3@\3�\3�\3\0\1]�\0\1�\3�\3�\3�\1��\0\1V��\6\29�\0\1�\2�\5��\0\1�\3\0��\2���\3\0�����\2\4\0��\2��B\4\0������\4�\23�\4�\24��\0\23\0\4���\4\0��\4\0%\2\5\0A\2\3\0�B\3\0�\2�\3\0\3�\1݂\0\1%C\5\0�\0\3�%�\5\0�\0��%�\5\0�\0\3�%\3\6\0�\0�����\127\31\0�\0\7\7\21 ���m���\2�.=\9�\13�\9��\19\\\16\2\16I\0253ۖx��@\30px\4\0\0\0\1\2\1\3\0\0\1\4\3\7!\25Kz�!��[$\14\0\0\0\4\
\0\0\0\26\26\8\3\
\4\25\14\5k\4\6\0\0\0^ZZX[k\4\11\0\0\0\4\8\25)\
\7\
\5\8\14k\4\
\0\0\0\4\8\0258\8\25\14\14\5k\4\9\0\0\0\4\8\25\"\6\
\12\14k\4\15\0\0\0\4\8\0259\14\27\4\25\31.\25\25\4\25k\4\7\0\0\0\3\
\4\2YXk\4\22\0\0\0ZZZ^\23/SSX-^(.S(X*/^SSk\4\6\0\0\0\15\
\6\
Yk\3\0\0\0\0\0\26�@\4!\0\0\0RZ\9\\\13\14[\14\8\14RXSZ\\\\]\8\13Y[^Z\8\
XS\
\13\8\9[k\4\8\0\0\0\25\30\4\0\30\
\2k\4\6\0\0\0SSY[\\k\4!\0\0\0\14^\13^R_\13\
\
ZSR__R\9S^]\15^\9\13Y\13[\15Z\\_\15\14k\25\0\0\0\11\9\20 \15F�a�V<\29�\8\9\20 �\2�t�\15t\0254\8t\25D\15h=��\0282�K\"{�k�b�\14v\25\26\9v\25�\"J\7��*\20\1#\8\6 {\24�LG�C!x\0vB?,aB�{�*�\12\5\14�\22�\0154\28\25+�\127�8�ݩw\0\2\8\8 � i\\��jl�\5�H�0w\27�+�_�q�\23�v\31}��\19}m��;e�\21\13CqV4\18��}J_[�#Rs�n�^\20-\20x\22\31\20��uC�>AC�*o���B7\0\0\0FCCC\2CCC�\3CC�CCC^�CC\6CCC��CC�\3CCeBCC\30�CC�C�C��CCBBBC\2\2B\0�\1\0\0��\0\0ƀA\1\1�\1\0݀\0\1\6�A\1A\1\2\0\29�\0\1K\1\0\0�\1�\0�AB\2\11�\1\0\
\2\0�\
\2Å\
���K�\0\0J\2ć�\2\0\3J���\
B\2�F�D\1G��\4GB�\4�\2\0\3]�\0\1\
B\2�F�D\1G\2�\4GB�\4�\2�\2]�\0\1\
B\2���\0\1\24�E\4\23�\0�G\2�\2_\2\0\1\23@\0�C\2\0\0_\2\0\1\31\0�\0\5\7\21 ���1��J\5H�\17\13���?���\20|\6+8P96x\11\7\16I\25�1�w\12Z�T;�\9y�7t@ڊ\22p���X\3\0\0\0\0\0\0\1\0\2\8\7!\25�\0016m�L�U��8\20\28�Kz&��G���\7���D�-�k�/_v\23\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0�������\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\7\0\0\0�������\3\0\0\0\0\0\0N@\4\8\0\0\0��������\4\3\0\0\0���\4\13\0\0\0�������������\4\8\0\0\0��������\4\4\0\0\0����\4\7\0\0\0�������\4\5\0\0\0�����\4\8\0\0\0��������\4\8\0\0\0��������\4\13\0\0\0�������������\4\"\0\0\0����������������������������������\4\15\0\0\0���������������\4\7\0\0\0�������\4\6\0\0\0������\4\5\0\0\0�����\4\6\0\0\0������\3\0\0\0\0\0\0i@\0\0\0\0\17pi\23���\
��Ml� \0293\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 'm�\19�]I,m\12\9\20 U�}:�L\8;\31 �\5�3�C�<�F�\15t\25:\8t\25��\11L���nB�~\2X�g\8��\127h�J�\3)�\22/��*o�Py;B2�N�\14v\25\16\9v\25>&�`���\4���\4h��,��0\24�\"\25[HcF[$D|4\0.\8\6 �ө+K�=H�,�sf\28\30n��\17]\20�\0.\24i&)\1\
\8\8 \15\27�q���o\\~V4\18�'�^\7ONP5�%FV\26\8G֙6T^�<u'\0\0\0009\\\\\\�\\\28\\�\28\\\\��\\]��\28\\���]\\]\\\\\29]]\\���]\29\29]\0\24�A\2\23�\5���A\0���\0\24\0B\3\23@\2��\1@\0\1B\0\0݁\0\1\12B�\1��\2\0\29��\1\12�B\4\29�\0\1@\1\0\4\23@\1��\1�\0\12B�\1��\2\0\29\2�\1݁\0\0@\1�\3�\1�\1�A\0\1_\1\0\1\23@\0��A\1\0�\1\0\1\31\0�\0\1\7\21 \127�\15���C�I\20\22\11\7\16I\25$p�H\27�\9\27%�[\29\31G\12a�\15#vm;�x\1\0\0\0\0\2\4\7!\25��\\=e\15L$�<�]V\11�0�+j\18\13\0\0\0\4\8\0\0\0\31\8\28\24\4\31\8m\4\3\0\0\0\30\23m\4\3\0\0\0\4\2m\4\5\0\0\0\2\29\8\3m\4\3\0\0\0\31\15m\4\1\0\0\0m\0\4\
\0\0\0\
\8\25\">9\20\29\8m\4\4\0\0\0\4\2\30m\4\5\0\0\0\31\8\12\9m\4\3\0\0\0G\12m\4\6\0\0\0\25\2\5\8\21m\4\6\0\0\0\14\1\2\30\8m\1\0\0\0\15\9\20  \29�T�\5�}\31��\
)6�\127{��X\23\22~?\14\14\9\20 �L�s���\0127�A\11�U�i4��E���\14YE�D�\15t\0253\8t\25M-�[���;�D�\14v\25\16\9v\25旅}E\2�\26/f�bvr�W���f�j\26H�p�\5���z\0/\8\6 ��\12\23J\11]\12��/���\20i�,\23\15�g/\1\2\8\8 ���V�\
�.\27��6T\14eJ{��;S,�A�c�3�_�\1ճ�P3��x%zV4\18��l41�'g\9\0\0\0c%e%be�%�\0\0\0��\0\0%\1\0\0]�\0\2\0\0�\0\31\0\0\1\31\0�\0\11\7\21 �H�1w��\1�\25\127G\31�z\9\
��h.��\15�+P\15�R�c�\12�j\5\8\16I\25\28^�oڲ�\26C�Z;�\9\13\7�5J|�=)\6˷]Ù2y�6�_\1\0\0\0\0\0\0\7!\25?0\0205\3\0\0\0\4\7\0\0\0}z|g`i\14\4\5\0\0\0i}{l\14\4\4\0\0\0& '\14\1\0\0\0\14\9\20 S�\14\9�Jwdp<v3v!�6.\
�4\28+WmEO�$G\
\9\20 \6�`\13j��\31f\16x\\�\15t\25:\8t\25s��\12��\22\127��\8w$��|)��\19\1�\21\24\16\28�@0@�#\5*k3x5EQ�\14v\25\30\9v\25)�`b\13#�a���]jN�\4\15��\1Q��$\0!\8\6 b7�\
\29�M\9��d7�XPAL�0>���$\29�\12fw4�m\1\11\8\8 #Fms�I\13�S\\\127v}V4\18�Js~]�#vy1�\22\3#K\18_�9\14\
\0\0\0000v6v16�v��\0\0�\0@\0���\1\0\1\0\0�\0\0\1^\0\0\0_\0\0\0\31\0�\0\
\7\21 3c\0216d�A\1�\14)��>*��\5$\15��\
�s4\8���(\5\4\16I\25��\
-\27B�,�h\18\23\0�X6��4d\1\0\0\0\0\0\2\7!\25L��t^��\8uio>\4\0\0\0\4\7\0\0\000435.) G\4\7\0\0\0!(5*&3G\4\5\0\0\0bwu?G\4\5\0\0\0%>3\"G\0\0\0\0\26pi\23���+���1���o�\0311+f��0�\
�\9�j�)ü\27'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\27pi\23���;\"}U5���x��\4r�g�v�\12�!w�C\28\20\
\0\27\12�:,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\17pi\23\12��C*�8���Q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 �1X�c�w`Y�+�\14\9\20 \24��\19ԓ�8��-3\28��Jt@A-�|�{�\"�f�\15t\0252\8t\0254�\
B�>�\27�\14v\25\30\9v\25SD0\14N�\\~�]E4�G�\0G��\20\20�a\127\0!\8\6 v��B�R]K�\11�\"��\21r8S1Y\\g�Tv�^E�\6\19R\0\1\8\8 sY\\=\"`�}m$\15\18�\28�):�]\17A��J��\22]W�6\\���w\4pV4\18��-i���\26\20��^��=\7\12'\2)b�)]�V�;�n�)&\0\0\0\2\4D\4\3DD\4\25��\4A\4�\4��\4\4��\4\4\1\5\4\5E\5\5\4�\5�\5҄�\1]��\1[\0\0\0\23�\3��\0\0\0�@A\0\1�\1\0݀\0\1\7��\1\7\1B\2@\1�\0\29�\0\1�\0\0\2\3\1�\0FAB\0��B\1]\1\0\1\31\1\0\0\23��\127�\0@\0�@@\1���\0�\0\0\1\26���\23\0�\127�\0\0\0�\0\0\1\23@�\127\31\0�\0\
\7\21 �.�:�!y\13 ��4��B\6�-E0���&��s_8��\4\7\6\16I\25�ۆ1�}�1�/�)�;</��C�L�S�:�@\4\0\0\0\0\2\1\0\1\2\1\3\2\7!\25H.�0L��\28�R�\6\12\0\0\0\4\3\0\0\0���\4\5\0\0\0�����\4*\0\0\0������˅���ʗ����ʊ�����ˣ����������ʅ����\4\20\0\0\0�ك���������������\4\11\0\0\0���������\4\8\0\0\0��������\4\3\0\0\0���\4\5\0\0\0�����\4\7\0\0\0�������\4\9\0\0\0���������\4\5\0\0\0�����\3\0\0\0\0\0\0\8@\0\0\0\0\22pi\23���_nJ�o�oS$���>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 pU�MM\14\0261�\2\0286��F\8x�\15#��Y_�W�fF\8\9\20 ���(!\0t\0255\8t\25��.c��QS֭�a�p\31)M�)\1�\14v\25\25\9v\0254��W\1-\8\6 ���F\\E�:!-L\24`�1{\0\15\8\8 �\1K&:Vd2���\
�\
,{�\30�v�&N\26��\1279�~V4\18\8\1�o\26\11�L��wn���N�b�3iKK&g\0\0\0�����ʋ����\11ʊ��\16ʋ����\11\
ʋ�O����\9ˋ�\9\11��Kˏ�\11�\11͉ʋ\
Ɋ�K�����\11�ˈ��\11�\11�K�����\11��\9ʋ\
I���ɋ�Ή\11�\13�ɋ\22\9\11\0�B\2\0��\2\5]�\0\1�\1�\4\23\0\4�F\2A\0��\2\0�\2\0\0\0\3�\0@\3\0\1�\3�\1]B\0\3F�A\0��\1\0]B\0\1E\2�\0�\2B\0���\0��\2\0��\2\5]�\0\1�\1�\4F\2C\0GB�\4�\2�\3]�\0\1\25@��\23\0\11�E\2\0\1��\3\0��\3\0\5\3�\1A\3\4\0�\3\0\2�C\4\0\5\4�\2A�\4\0�\4�\3ւ�\5\0\3�\2]�\0\2[\2\0\0\23�\6��\2\0\0��D\0\1\3\5\0݂\0\1\7C�\5\7�E\6@\3�\4\29�\0\1�\2\0\6\7�E\5\24@@\6\23@\2�\7\3F\5\9\3\0\3\6CF\0G�F\5\29�\0\1FCF\0�\3F\5]\3\0\1\31\3\0\0\23\0\1�\4\3\0\0FCF\0��E\5]\3\0\1\31\3\0\0�\2\0\0�\2\0\1\23�\0�D\2\0\0��\6\0_\2�\1\31\0�\0\7\7\21 �>o\\[��w`�*K�3�/1�HY\19\9\16I\25��0s*{bC*\14Lِ�:h�\14)�o�\6���Rȩ@$\7\0\0\0\0\2\1\5\1\0\1\2\1\3\1\6\1\4\2\7!\25��%y\2\0�V��Ix\28\0\0\0\3\0\0\0\0\0\0>@\3\0\0\0\0\0\0�?\4\
\0\0\0!#2\9\21\18?6#F\4\4\0\0\0/)5F\4\9\0\0\0005('65.)2F\4\14\0\0\0)%4\25/+'!#h,6!F\4\7\0\0\0+\21*##6F\3\0\0\0\0\0@\127@\4\9\0\0\00035#4\22'2.F\4\19\0\0\0i4#5i)%4\25/+'!#h,6!F\4\14\0\0\0)%4\25/+'!#h6(!F\4\19\0\0\0i4#5i)%4\25/+'!#h6(!F\4\7\0\0\000524/(!F\4\4\0\0\0*#(F\4'\0\0\0.226|ii'6/th5<q~\127h(#2|~~i\20#%0\4?2#h'5.>F\4\
\0\0\00035#4('+#{F\4\11\0\0\0`6'551)4\"{F\4\9\0\0\0`5) 2/\"{F\4\
\0\0\0`/+!\"'2'{F\4\8\0\0\0004#73/4#F\4\3\0\0\0005<F\4\5\0\0\0,5)(F\4\7\0\0\0\"#%)\"#F\4\5\0\0\0/( )F\4\6\0\0\0/+!\15\"F\4\9\0\0\0002)524/(!F\4\7\0\0\0004#53*2F\4\19\0\0\0����������֯�߮��F\0\0\0\0\20pi\23�\30�M�ۗ\0183��-f��\17-\17\0^;�m\29\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 \0301^&\
��:\"I�-a\15\9\20 �eEm�\2�x�\
�>\22��Ae��^�U'+\27\0t\0256\8t\25Q\1�\29�}�i���Q~۲F<I&:�N\17Q\11\1v\25\28\9v\25^r�{��I\0024��\7�S�>\1-\8\6 ��s:�3�\26�\26AA�#\27\0\
\8\8 ��a-�6*�rV4\18O�3XĄ�&Nς\29$_yEu�F\31\6�:\\;XR\7�x$~�/b\7�*�NJ\0\0\0����\\������GF���\1���\0G\7����ǆ\6��\26GG���\6����G\1���\26GG��F�Ǉ���чF�\2�G�����\26G\0\1\6A@\0\7�A\2@\1�\1\29�\0\1\25\0\1�\23\0\11�\5\1\0\1AA\2\0��\2\0�\1�\1\1�\2\0E\2\0\2�\2\3\0�\2�\2\1C\3\0@\3�\1�A\3\3�\1\0\1\29�\0\2\27\1\0\0\23�\6�K\1\0\0��C\0��\3\0��\0\1�\1D\3�A�\3\0\2\0\2݁\0\1@\1�\3ǁ�\2\24\0�\3\23@\2����\2�\1\0\3�\1E\0\7B�\2݁\0\1\6\2E\0G��\2\29\2\0\1�\1\0\0\23\0\1��\1\0\0\6\2E\0G��\2\29\2\0\1�\1\0\0C\1\0\0_\1\0\1\23�\0�\4\1\0\0A�\5\0\31\1�\1\31\0�\0\6\7\21 <�Sq�\16� �U�bx�y+\14\5\16I\25+V\8F�hr'\27\
\"t_<�M\7\0\0\0\0\2\1\5\1\0\1\2\1\3\1\6\1\4\11\7!\25z {n\0�G\8\13��\0]��/A�k#�~�uHHo\17nA�M�>�\16>�A.\23\0\0\0\3\0\0\0\0\0\0>@\4\7\0\0\0\18\21\19\8\15\6a\4\5\0\0\0\7\8\15\5a\4\2\0\0\0Na\0\4\9\0\0\0\20\18\4\0191\0\21\9a\4\6\0\0\0N\19\4\18Na\4\4\0\0\0\13\4\15a\3\0\0\0\0\0\0�?\4'\0\0\0\9\21\21\17[NN\0\17\8SO\18\27VYXO\15\4\21[YYN3\4\2\23#\24\21\4O\0\18\9\25a\4\
\0\0\0\20\18\4\19\15\0\12\4\\a\4\11\0\0\0G\17\0\18\18\22\14\19\5\\a\4\9\0\0\0G\18\14\7\21\8\5\\a\4\
\0\0\0G\8\12\6\5\0\21\0\\a\4\8\0\0\0\19\4\16\20\8\19\4a\4\3\0\0\0\18\27a\4\5\0\0\0\11\18\14\15a\4\7\0\0\0\5\4\2\14\5\4a\4\5\0\0\0\8\15\7\14a\4\6\0\0\0\8\12\6(\5a\4\9\0\0\0\21\14\18\21\19\8\15\6a\4\7\0\0\0\19\4\18\20\13\21a\4\19\0\0\0��߆����������a\0\0\0\0\22pi\23b�s7�i�K�Ok�J�V\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 �Ɍ\9�\16&��\
\13M\12\9\20 ���\0063\27�t�,YI�r3Uq\24<g\13\0t\0251\8t\25�{S+5\1v\25\17\9v\25iJ�)ӘS6�)�'P��kp�@\9�!�\17�\3f\22��F�p[z\1,\8\6 �u\2j���H\27*\0�lu��\25>\0\1\8\8 U�b^{�\3\20�K|#?ws\4\2~\14!���[Q�F6�M�'\29�\127PdpV4\18�\11�7�Kx\"�<y(\\,�\\M�\7L���^#V�\4�?�7.\0\0\0Bdde\127$ddsdd�adddmdddaddd\127dddsdm�ad�d%ddd�$dd�d\0\1\1�\0\0E\1�\1��\0\0�\1\0\0��\1\1\29��\1\27\0\0\0\23�\5�K\0\0\0�\0A\2�@\1\0��\0\1ǀA\1���\1\0\1\0\0݀\0\1@\0�\1�\0�\0\24@�\1\23@\1��\0�\0\6�B\2G\1�\0\29\1\0\1�\0\0\0\23\0\1��\0\0\0\6�B\2G\1�\0\29\1\0\1�\0\0\0C\0\0\0_\0\0\1\31\0�\0\0\7\21 \6x1\22�CGN\8\11\16I\25��\16iiO-���\24X�>Y�+�W�oJ\14�lX\23٭�q\9)�lX\9\\+\5\0\0\0\1\4\1\0\1\2\1\3\0\2\3\7!\25H� qZ�jL\11\0\0\0\4*\0\0\0%99=wbb,=$\127c>7zutc#(9wuub\31(=\"?9\8??\"?c,>%5M\4\
\0\0\0008>(?#, (pM\4\11\0\0\0k=,>>:\"?)pM\4\8\0\0\0k$ *$)pM\4\8\0\0\0?(<8$?(M\4\3\0\0\0>7M\4\5\0\0\0'>\"#M\4\7\0\0\0)(.\")(M\4\5\0\0\0$#+\"M\4\12\0\0\0>8..(>>+8!!M\4\9\0\0\0009\">9?$#*M\0\0\0\0\24pi\23��g'V�\\t���A��\7'?��qLЍy�\3�I\1��\25���V홇\21\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 \26\22�+\25W�\19�\"�h�\12\9\20 ��deA��^�y@h:um\12�\31\21\11S\0t\0258\8t\25M\127\31\0020YE$�P�\24v�\28}m��j���\2��.\21T�>?'\1v\25\18\9v\25�R�\17���,���l�-\2,�\18<e��G\20�Z�j~S�?�E%J�$�6\0/\8\6 �[�u�{�J�#�n\29�d:�V<d��_T\0\2\8\8 ��|L�M�`?�2$!\7\
]\22��bo<xH�W�u��\9`���2�U�xvqV4\18+��1���\6�\17�\30)=�\30�\"\0023U$\14\4�:�2\24}�\29�w�CS\0\0\0pv6vq66vk��v0�6v��vv+�vw-vvva�s��v7v�67w�v�vw�wv7�wv��vt6vvw�v7v�v4w�v�vw7tv���w�vv\0\23�\1���B\0�\0�\0\1�\2\0���\1@\0\0\1�\0�\0�\0\0\1\23\0\0�_\0\0\1�\0@\0�@@\1���\0�\0\0\1Y���\23\0\0�\23\0�\127F\0@\0G@�\0]��\0��@\0��\3\0��\0\1�\0\0\0\23�\5��\0A\0�@�\1\0\1\0\1A�\1\0��\1\0݀\0\2�\0�\1�\0A\0�\0�\1\0\1\0\1AA\2\0݀�\1�\0\0\0\23�\1�ƀB\0\0\1\0\1A�\2\0݀�\1�\0�\1�\0C\1�\0\0\1\23\0\0��\0\0\1�\0@\0�@�\1݀�\0�@�\1\25���\23@�\127�\0D\0\1A\4\0A�\4\0�@�\1\23��\127\23��\127\23@�\127\31\0�\0\4\7\21 ���T�x\19J\6��r�\29[\31��\0149#�B-\7\6\16I\25+un\13�k`F�D\20P��;n�N�j\22L\30-\11�(Q\1\0\0\0\0\2\4\7!\25\14��\"�;21\12Q\9f��|\27��j&\19\0\0\0\4\3\0\0\0���\4\5\0\0\0�����\4\8\0\0\0��������\4 \0\0\0��������������������������������\4\7\0\0\0�������\4\4\0\0\0����\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\16�\4\5\0\0\0�����\4\5\0\0\0�����\4\9\0\0\0���������\4\3\0\0\0���\3\0\0\0\0\0\0�?\3\0\0\0\0\0\0$@\4 \0\0\0��������������������������������\3\0\0\0\0\0�r@\4\7\0\0\0�������\4d\0\0\0=}e?Pi>QK?xY=PE=\127S=TN=|i0l}7dT0wo?yv=vB>Dt=Dh?eI?cD>PN=}e?Pi=v@>Na>DU=Ry0gF>V}>u{=``7dT=Uk=h^1_U0wM�\3\0\0\0\0\0\0\20@\0\0\0\0\20pi\23ۋqM��j-��\23w\4�!l\"�l`G\20&{\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 #�U�\22\
q\21D�/�N�zV@�4<��Mv\1\9\20 ��\0287�T�:\28WR%�}QJ#\9iD\9\26b��wXG��\21^\0t\0252\8t\25r�8]��\28T|\1v\25\27\9v\25���a��\15b��\4@\0-\8\6 FS�\23�\"�O���_$�\22'\1\9\8\8 �E�\21[rV4\18�\\�\6[\20�\28���\25�x;�ݭj��\19\23\23S�(���!-%�Q3�6N\28\0\0\0\26[[[�\27[[�[[[]�\27[\\�\27Y\30Z�[\6Z�[\29A\0\0\1\1\1\0@\1\0\0�\1\1\0!\1\3�\6�@\0\7BA\4A�\1\0\29�\0\1�\0\0\4\0\2�\0F�A\0G\2�\4�\2\0\1�\2�\1\0\3�\1]�\0\2V@\2\4 A�\127_\0\0\1\31\0�\0\5\7\21 wH�:w�P0e\20�K��P�K\26׫�(Aw�$\13\9\16I\25�U�\
�P�\6D��(���\0065�P\30?օx~��fYQgE\2\0\0\0\0\2\0\3\9\7!\25!�4|�!?2�!�`�4�\2�5�N�\11�z��e>�\19�9\9\0\0\0\4\1\0\0\0v\4%\0\0\0\23\20\21\18\19\16\17\30\15\28\29\26\27\24\25\6\7\4\5\2\3\0\1\14\15\12FGDEBC@ANOv\4\5\0\0\0\27\23\2\30v\4\11\0\0\0\4\23\24\18\25\27\5\19\19\18v\3\0\0\0\0\0\0�?\4\7\0\0\0\4\23\24\18\25\27v\3\0\0\0\0\0\0B@\4\7\0\0\0\5\2\4\31\24\17v\4\4\0\0\0\5\3\20v\0\0\0\0\24pi\23�$Jg(�o[�\1fc�΀5���N�I\27\30l��e\17\17x\26�1�nY\17\29\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 ŋ�\1\18��K��(Q��W�DcWꃯ\"�A�.�� W\15\15\9\20 ���\
�Q�~zV�>�V\27t��>\127*��eL\0t\25:\8t\25\4<�k��9/�[\18�\28WES�\
d�|�\9c��N�\0\14(e��5=\19�zj\1v\25\18\9v\25�e�^�1CE�<�dR�b`���\16�$X\13��@8Z\8Ph{�\0070��\12g\0.\8\6 ��/n�^\9\0203�dJ�5�l-��R\15\31�>@�-l\0\12\8\8 \3�(tD(\19X�+Nr2m�\6�zV4\18��<\16y��k$\0\0\0�������d�a� ���!a�`a��$���� ���a��\1\1\0]�\0\1�@\1\1\29��\1\27\0\0\0\23@\4�F@A\2G��\0�\0\0\0��\1\0]��\1[@\0\0\23@\0�\24\0B\0\23�\0�D\0\0\0�\0\0\0_\0�\1\23\0\1�C\0�\0�@B\2�\0\0\0�\0\0\1_\0\0\0C\0\0\0_\0\0\1\31\0�\0\4\7\21 9��E�ۘf\28&�\22�Fj$V\13�+�be{\7\4\16I\25\8��<n��\8��\13=b�\24%�/�8\5\0\0\0\1\0\1\9\1\3\1\7\0\2\4\7!\25���d�\19�&\0156$8�o�.pI�\19\
\0\0\0\4\8\0\0\0g{{\1275  \15\4\15\0\0\0 Hj{_`fa{!n|\127w\15\4\6\0\0\0Z|j}2\15\4\4\0\0\0)}2\15\3\0\0\0\0\0\0$@\4\7\0\0\0|{}fah\15\4\5\0\0\0ifak\15\4\2\0\0\0,\15\4\1\0\0\0\15\4\9\0\0\0{`|{}fah\15\0\0\0\0\22pi\23�nm�5\18\0�*�C�N�a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 \28��\"�\8\9\20 �h[K�\0t\25:\8t\25�)�y�~�j\23��9\12�\1P�؅6�\23#,���pKBTb��+{�ߟ\2f\1v\25\16\9v\25Q�%Z�g�!�I��\28<\24�\9o�R+7-�\7?q_�!\1#\8\6 \\�J\26�O� ���,U�vB�3�%�Ժ\24q�\24e���_�o�\9_�s0\0\11\8\8 ,�=\3-w.\27�I�BA\127V4\18Ka\19o��$D��\0084)`?j���F.�{%z$eD�\0\0\0gAAE\26\0AAVAA�\0@AA�\0AAVAA��\0AA�@AAG�\1A\\��AY�\1EV�E�\7C\0A�\3@A�CAAAB�A\1BA@�B�@�BAB\28\3�B\7�\0A��@A\28\3A@\4C�A�C\3A���A�\3CA׃CD\28�A@�@�EVAE�\7C\0A��CA�CAAAB�A\1BA@�B�@\28\3AB\7�\0A��@A\28\3\0\1E\2�\0�\2B\0���\0��\2\0��\2\5]�\0\1�\1�\4F\2C\0GB�\4�\2�\3]�\0\1\25@��\23�\25�F�C\0G��\4]��\0�\2\0\1�\2\4\0\5\3�\1AC\4\0�B�\5\1�\4\0E\3\0\2��\4\0�\3\0\2\1\4\5\0@\4�\2�D\5\0�\4�\2\1�\5\0E\5\0\3��\5\0]�\0\1�\5\6\0�\5�\3\22�\5\6@\3�\2��\0\2�\2\0\0\23@\5��\2C\0�B�\5\0\3\0\5A�\6\0݂�\1�B\0\0\23\0\2�X�F\5\23�\1��\2C\0�B�\5\0\3\0\5A\3\7\0݂�\1�\2\0\0\23�\0��\2\0\0\0\3\0\5�\2�\1\23�\0��\2�\3\23@\0��\2\0\0�\2\0\1ƂC\0���\5݂�\0\5\3\0\1A\3\4\0�\3�\1�C\7\0VÃ\6��\7\0�\3�\3\1�\7\0E\4\0\3��\5\0]�\0\1�C\4\7\29��\1�\2\0\6�\2\0\0\23\0\5�\6\3C\0\7CF\6@\3\0\5��\6\0\29��\1\27C\0\0\23@\0�\24�F\5\23�\0�\4\3\0\0@\3\0\5\31\3�\1\23�\3�\6\3H\0@\3\0\5\29�\0\1F\3H\0�\3�\3]\3\0\1\31\3\0\0\23�\1�\6�C\0\7�C\6\29��\0\14�\2\6\26\0�\2\23@\0�\3\3\0\0\31\3\0\1\6�A\0AC\8\0\29C\0\1\23��\127\23�\0�D\2\0\0��\8\0_\2�\1\31\0�\0\
\7\21 \7�to4ρ\0��\29���&aV�?\11F\30?��Q\14�C�Y\24\6\16I\25N� ;\19*K\28���\5\8��S��c\1�e�e�1e]\8\0\0\0\0\2\1\5\1\0\1\9\1\3\1\8\1\7\1\4\5\7!\25>��n�ʢ`\16)\6M\4\8�1#\0\0\0\3\0\0\0\0\0\0>@\3\0\0\0\0\0\0�?\4\
\0\0\0����������\4\4\0\0\0���\4\9\0\0\0��������\4\14\0\0\0��������������\4\7\0\0\0������\3\0\0\0\0\0@\127@\4\9\0\0\0���������\4\19\0\0\0������������������\4\14\0\0\0��������������\4\19\0\0\0������������������\4\7\0\0\0�������\4\4\0\0\0����\4\3\0\0\0��\4\5\0\0\0�����\4\8\0\0\0���᫾��\4\15\0\0\0��������������\4\9\0\0\0������㬑\4\9\0\0\0���������\4\
\0\0\0�������嬑\4\9\0\0\0���������\4:\0\0\0��������������䬡������䬴����������������������謑\3\0\0\0\0\0\0$@\4\6\0\0\0������\4\5\0\0\0�����\4\2\0\0\0��\4\1\0\0\0�\4\2\0\0\0��\4\16\0\0\0��������������\4\4\0\0\0�լ�\4\4\0\0\0�㬑\4\9\0\0\0���������\3\0\0\0\0\0@�@\4\19\0\0\0t\
/v\24\22y62w\15\1x\5\8y>>�\0\0\0\0\27pi\23�x�\30Oi� �7\7x�\
�Rx��\
�\15�>�>x��DO\30oFm\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 �)�V�F*\22k\15\9\20 \20��)�E�\8f�E\14�� )\25�[=m\\do�\0t\0258\8t\25�]\19#�Y�\31�/�$iB\12}��V-�=r\29�\0,^l\13\1U�\1v\25\26\9v\25�̉_��W\31\1.\8\6 U��\8Tz�\17���:�\0�\30��+R�^@\127�o#b\0\12\8\8 ֈ�Us�Mx\22�<y!�\22(�yV4\18��\\6�\0\0\0����t������on���)���(o/�����.��2oo���.����o)���2oo��n�������n�*�o�����2o��鮯��.���o��n�����k���o�����j�o�.n��.n�n.��*�����\3\0@\2�\0�B\3\0�\2\0\1\1�\3\0E\3�\2��\3\0�\3\0\3\1\4\4\0݃\0\1\1D\4\0@\4�\1�A\4\3�\1\0\1\29�\0\2\27\1\0\0\23@\5�FA@\0G��\2�\1\0\2��\4\0]��\1[A\0\0\23\0\2�X�D\2\23�\1�FA@\0G��\2�\1\0\2�\1\5\0]��\1[\1\0\0\23�\0�D\1\0\0�\1\0\2_\1�\1\23�\0�\9\1�\3\23@\0�C\1\0\0_\1\0\1FAE\0G��\2]��\0�\1\0\1�A\2\0\5\2�\1A�\5\0�A�\3\1\2\6\0E\2�\3�B\6\0�\2\0\3\1\3\4\0݂\0\1\22�\2\4���\1\0\1\0\3\27\1\0\0\23\0\5��A@\0��@\3�\1\0\2\1�\4\0���\1�A\0\0\23@\0�\24�D\2\23�\0��\1\0\0�\1\0\2�\1�\1\23�\3���F\0�\1\0\2��\0\1ƁF\0\5\2�\3�\1\0\1�\1\0\0\23�\1��AE\0��E\3���\0�A\1\3\26�\1\1\23@\0��\1\0\0�\1\0\1��F\0�\1\7\0�A\0\1\23��\127\23�\0�\4\1\0\0AA\7\0\31\1�\1\31\0�\0\0\7\21 ��\27?�\24�%\18\0\16I\25�?/b\8\0\0\0\0\2\1\5\1\0\1\9\1\3\1\8\1\7\1\4\2\7!\25�'\127W\6�;_�:�r\30\0\0\0\3\0\0\0\0\0\0>@\4\7\0\0\0\24\31\25\2\5\12k\4\5\0\0\0\13\2\5\15k\4\2\0\0\0Dk\0\4\9\0\0\0\30\24\14\25;\
\31\3k\4\6\0\0\0D\25\14\24Dk\4\4\0\0\0\7\14\5k\3\0\0\0\0\0\0�?\4\8\0\0\0\3\31\31\27QDDk\4\15\0\0\0D\30\27\7\4\
\15Z]E\
\24\27\19k\4\9\0\0\0\30\24\14\25\24\31\25Vk\4\9\0\0\0M\12\
\6\14\2\15Vk\4\
\0\0\0M\31\2\6\14\4\30\31Vk\4\9\0\0\0M9\14\9\
\31\14Vk\4:\0\0\0M/\
\2'\2V\3\
\4\2M\0\4\30V[M\9\14\2\17\3\30VN\14^N\
^N\9\15N\14\\NSSN\9ZM\29\14\25V\28\14\9YM\0\14\18Vk\3\0\0\0\0\0\0$@\4\6\0\0\0M\2\6\12Vk\4\2\0\0\0Hk\4\1\0\0\0k\4\2\0\0\0Wk\4\3\0\0\0\4\24k\4\5\0\0\0\31\2\6\14k\4\16\0\0\0D,\14\31*\5\24\28\14\25E\
\24\27\19k\4\4\0\0\0\"/Vk\4\4\0\0\0M\25Vk\4\9\0\0\0\31\4\24\31\25\2\5\12k\4\7\0\0\0\0068\7\14\14\27k\3\0\0\0\0\0@�@\4\19\0\0\0��Ռ���ȍ�������k\0\0\0\0\22pi\23ʂg=\9H�G(��=eO�\28\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 �\"�}���/�{�5�\127�\30�}�E���j?�I=�-G\11���C@\14\9\20 ��}0\5��j�&\7\
P+>\20�A�I��<'�G$V�\0t\0251\8t\25]\9�@�\1v\25\18\9v\25�l�\27�p/�\0198w��\17'\22�0���(���=�O_\127W$�@G/MH\1#\8\6 ��Kp۪>~���\27�Y76rz\15i4�\15Y��~A\18L�,�R�\15Wk�G\0\
\8\8 ���zT��Q�{V4\18\11G�x議G��E8*\0\0\0�����Ą����\4�������������������\4��\4�ń��\1�\0\1�@\0\0V��\0��\0\0�\0\0\0\1�\0\0E\1�\1�\1\1\0]�\0\1�@\1\1\29��\1\27\0\0\0\23�\3�F@A\2G��\0�\0\0\0��\1\0]��\1[@\0\0\23@\0�\24\0B\0\23�\0�D\0\0\0�\0\0\0_\0�\1\23�\0�C\0�\0�\0\0\0_\0�\1C\0\0\0_\0\0\1\31\0�\0\5\7\21 ;\20� 89�SU�3i\11(�\23�&\5{k��\25���@\7\5\16I\25\0\26F\25��\12\1�M4\0016�%\22\5\0\0\0\1\4\1\0\1\9\1\7\0\2\6\7!\25��r\127+~�1�\5�',s�h_\\�\
u�\14i>�R\21\9\0\0\0\4\8\0\0\0(440zoo@\4\16\0\0\0o\19%.$\00522/2n!308@\4\4\0\0\0\9\4}@\4\4\0\0\0f2}@\3\0\0\0\0\0\0$@\4\7\0\0\000342).'@\4\5\0\0\0&).$@\4\2\0\0\0c@\4\1\0\0\0@\0\0\0\0\26pi\23���0\13��rM��\21!�h\2-`-d���Y,�U{\22\14�+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 !�$\17�\12<\12u�llɟ�_4\6Vr\21\3\9\20 \19�MuF�{\6�6�o\
~Hl���\15A�4\16v��?��k5`�ZE�j|v�\0t\0251\8t\25:�1c�\1v\25\29\9v\25{�0O���zp\6�\21�\13�( \0�\28\0(\8\6 �n�s\1\9\8\8 ��\21>~V4\18���&oePUh��F�j�\6�k�G\24�?b\19\0\0\0x>~>y~�>�>>>��>>c��\1��\0\0\24\0A\1\23�\1�\12A�\0��\1\0\29��\1�\0\0\2\12��\0\29A\0\1�\0\0\1\23@\0�\1�\0\0\31\1\0\1\31\0�\0\0\7\21 �\9�<^W�h\7\0\16I\25��<)\1\0\0\0\0\2\2\7!\25h\4\"A7?�h���-\8\0\0\0\4\3\0\0\0|z\21\4\5\0\0\0zep{\21\4\3\0\0\0gw\21\4\1\0\0\0\21\0\4\5\0\0\0gptq\21\4\3\0\0\0?t\21\4\6\0\0\0vyzfp\21\0\0\0\0\23pi\23ũV_���[\2��i��\24+)@/+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 \23DW\127�C�\9+;JV>d�B}8�r+\12\9\20 �\02227�\21�EO�\1,�=\5[�\20r\21�\0t\0256\8t\25�\0\24\13���K��'*�}rY\30:\127a,\3�k�\1v\25\31\9v\25��m\5dk�*!�D#���>�.T\11;O�:��\9\30\0!\8\6 nGD9��\9N��zq���8���W\22\15�G��;{\9\4~J\1\9\8\8 �O�\24�~V4\18G٭D�X�\\\17��eP�i�Y�i�N�1\21\0\0\0����@����@����@��������\0\24��\0\23�\1���@\0�\0\1\0��\0\1�@A\0݀\0\1\0\0�\1\23�\0��@A\0�\0\0\0��\0\1\0\0\0\1\31\0\0\1\31\0�\0\3\7\21 (�?C\5\7\16I\25\24r�\127lK�g_]s\24|�w*���\
�>:W\1\0\0\0\0\2\6\7!\25�=�E�;Du��Eq8�\17\127-�MC���b�\16�7\6\0\0\0\4\9\0\0\0_DX_YBEL+\4\
\0\0\0LN_dx\127R[N+\4\4\0\0\0BDX+\4\8\0\0\0YNZ^BYN+\4\3\0\0\0XQ+\4\4\0\0\0FO\30+\0\0\0\0\26pi\23���*�\0�2Ò�e\\\2:5{P�K��Tgف~\5�)C\16\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 f\30�Vx�$ pS�U�S�V�G�U0|�z�[Z\5\23�cb�\12\9\20 됉n\2P�'�J,o0w�Us/Ej?\1t\0256\8t\25��yI=a�+\16Q\1\28林^i�\25_�O�4\26\0v\25\31\9v\25�rs\127�>/K\24��g��\
\30?O�0�\8�G\6�\14u\0!\8\6 \\'>\30~�3\21c��<%{\25uA�j�\21!7\25�szX�\25M\0\13\8\8 B�GrD+�;�0�)�\6tat��\17G}V4\18o)\25[I�{?-Ǝ=UȰ9�z�\0300\0\0\0AG\7G@\7\7G\2G�G�GGF�G�FчGF\26�GF��GG��GGZ�GE\2GGE�GFG�@\1\0\5\1�\2A�\1\0�\1�\1��\1\0\5\2\0\3A\2\2\0�\2\0\0ր�\1]��\1[\0\0\0\23\0\5��@B\0��\2\0��\0\1��B\1�\0�\1\0\1�\0݀\0\1\7A�\1\24�C\2\23@\1�\3\1�\0F�C\0�\1�\1]\1\0\1\31\1\0\0\23\0\1�\4\1\0\0F�C\0�A�\1]\1\0\1\31\1\0\0�\0\0\0�\0\0\1\31\0�\0\11\7\21 yk�\0022�\8\30\29U�=�\"sj�\19<]�Hn�+#2�\"1P�;U\11\3\16I\25i&VF���\17\7\0\0\0\0\2\1\7\1\9\1\2\1\0\1\8\1\
\0\7!\25�\14\0121\17\0\0\0\4\7\0\0\0�������\4\4\0\0\0��Ħ\3\0\0\0\0\0\0�?\3\0\0\0\0\0\0 @\4(\0\0\0���֜����ψ���ǔ���˜�������։������æ\4\7\0\0\0����⛦\4\7\0\0\0����ԛ�\4\6\0\0\0����\4\7\0\0\0����ț�\4\8\0\0\0������æ\4\3\0\0\0�ܦ\4\5\0\0\0���Ȧ\4\7\0\0\0�����æ\4\4\0\0\0��Ҧ\3\0\0\0\0\0\0\0\0\4\9\0\0\0���������\4\8\0\0\0������æ\0\0\0\0\21pi\23\"��?\3�%~�y�Jda62G��9u�\14t9h�\19\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 �+�A�\"�E�!\14M{\8\9\20 \6�+\4u\1t\0254\8t\25*��7J� _\20t�H\12�\26\28\9\0v\25\25\9v\25��q\1.\8\6 �>�z�( \19�\29�H��3\3GM�Nx�U\7U�'2\0\9\8\8 ۥ�3\31yV4\18\8\1�\127�\0\0\0009\31\31\27D^\31\31\8\31\31�^\30\31\31�^\31\31\8\31\31��^\31\31�\30\31\30��_\31���\31\7�_\26\8\31\23��\29^\31\30\\\30\31_\28\31\31�\28�\31�\28\31\30\31\27�\30_\27\31\28�]�\28ٝ^\31\30�\30\31�]\31\30�\29�\31\25\28]\31\2��\31^\\\29\31\9\\\28\25\31\30�\30�\26�\29\31\30\25\28]\31\2��\31^\\\29\31\9\\\28\25\31\30\31\29�\26�\29�\30\26\28\31\29Z\28�\29�\28\31\27\9�\28\25\31\30_\29�\26\8\31\19��\29^\31\30�\29\31_\28\31\31�\28�\31�\28\31\30\31\27�\30�]\31\28ٝA\0\1�\1\0�B\0\1�\2�\0\6\3B\0\29��\0A�\2\0\22C\3\6݂\0\1�\1�\5�\2\0\1\6\3B\0\29��\0A�\2\0\22C\3\6݂\0\1\0\2�\5�\2C\0\0\3\0\0݂\0\1\24@�\5\23\0\2�ƂC\0\0\3\0\0A�\3\0�\3\0\2�\3�\2��\3\7݂\0\2@\2�\5\23�\2�ƂC\0\6\3B\0\29��\0A�\2\0\22C\3\6A�\3\0�\3\0\2�\3�\2��\3\7݂\0\2@\2�\5�BC\0�\2�\5\0\3�\3݂\0\1\25���\23@\26��\2\0\3\1C\4\0A�\4\0�\3�\3��\4\0\5\4�\2A\4\5\0�\4\0\4�D\5\0\0\5\0\2A�\5\0�\5�\3��\5\0\0\6�\4A\6\6\0�\6�\2V��\6�\3�\2݂\0\2�\2\0\0\23@\20�\11\3\0\0FCF\0��\6\0]�\0\1���\6�\3G\7�\3�\5��\0\1\0\3\0\7�CG\6\24�G\7\23�\2���G\0�\3H\6��\0\1�\3�\4��G\0�CH\6��\0\1��G\0\7\4H\6�\3\0\1�\3\0\0\23@\14��CG\6\24�H\7\23@\12���G\0�\3H\6��\0\1�\3�\4�CC\0��H\7�\3�\1\5\4\0\2E\4�\2�\4�\4\22�\4\8݃\0\1\1D\0\0A\4\9\0��\0\2�\3\0\3\1D\9\0A�\4\0�\4�\3��\4\0\5\5�\2A\5\5\0�\5\0\4��\9\0\5\6�\4A�\5\0�\6\0\7V��\8�\4�\2݃\0\2\11\4\0\0FDF\0��\6\0]�\0\1���\8�\4G\9�\4�\7��\0\1\0\4\0\9�DG\8\24�G\9\23\0\3���G\0�DH\8��\0\1��G\0\5\5�\4�\4\0\1�\4\0\0\23\0\1��\3\0\0��G\0\7DG\6�\3\0\1�\3\0\0\3\3\0\0\31\3\0\1\23�\0��\2\0\0\1�\9\0�\2�\1\31\0�\0\11\7\21 Z��]0&Y\28�>xa���9�Q)^�ar'Z��\6Q\8Cw���\3\27\6\16I\25�c9P�M;�:\13j�׼\24��hW�AiUܖ�\
\
\0\0\0\0\2\1\5\1\6\1\7\1\9\1\2\1\0\1\8\1\
\1\4\3\7!\25��3P}��\29(\0\0\0\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0�?\4\
\0\0\0\28\30\0154(/\2\11\30{\4\4\0\0\0\18\20\8{\4\9\0\0\0\8\21\26\11\8\19\20\15{\4\14\0\0\0\20\24\9$\18\22\26\28\30U\17\11\28{\4\7\0\0\0\22(\23\30\30\11{\3\0\0\0\0\0@\127@\4\9\0\0\0\14\8\30\9+\26\15\19{\4\19\0\0\0T\9\30\8T\20\24\9$\18\22\26\28\30U\17\11\28{\4\14\0\0\0\20\24\9$\18\22\26\28\30U\11\21\28{\4\19\0\0\0T\9\30\8T\20\24\9$\18\22\26\28\30U\11\21\28{\4\5\0\0\0\15\2\11\30{\4\7\0\0\0\8\15\9\18\21\28{\4\4\0\0\0\22\31N{\3\0\0\0\0\0\0�\4\4\0\0\0\23\30\21{\4%\0\0\0\19\15\15\11ATT\26\11\18U\31\26\22\26IU\24\20\22ALLMMT\26\11\11T\31I=\18\23\30{\4\7\0\0\0\26\11\0112?F{\4\7\0\0\0]\14\8\30\9F{\4\6\0\0\0]\11\12\31F{\4\7\0\0\0]\15\2\11\30F{\4\11\0\0\0]\29\18\23\30?\26\15\26F{\4\7\0\0\0]\8\18\28\21F{\4\
\0\0\0]\15\18\22\30\20\14\15F{\4\8\0\0\0\9\30\
\14\18\9\30{\4\3\0\0\0\8\1{\4\5\0\0\0\17\8\20\21{\4\7\0\0\0\31\30\24\20\31\30{\4\4\0\0\0\9\30\15{\3\0\0\0\0\0\0\0\0\4\9\0\0\0\15\20\8\15\9\18\21\28{\4\3\0\0\0\18\31{\4\7\0\0\0\9\30\8\14\23\15{\3\0\0\0\0\0�r�\4\4\0\0\0\8\14\25{\3\0\0\0\0\0\0 @\4'\0\0\0\19\15\15\11ATT\26\11\18U\31\26\22\26IU\24\20\22ALLMMT\26\11\11T\31I)\30\8\14\23\15{\4\5\0\0\0]\18\31F{\4\19\0\0\0��Ŝ����؝������{\0\0\0\0\19pi\23-\27gS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 ��m\21J�f$'�V+1�\1277d�!I�\0\9\20 /ztP�\0226EM�C,�v�'��i�\22a?���a\27\23�C\30�T\17E\1t\0253\8t\25���t�>fS�H><_\0v\25\25\9v\25�&�9\1.\8\6 *\7�Gs7�}PK�\9=p�v�\\3Fqσi�@�\
\0\13\8\8 K��~65\19/F\22sh|dq6��4x�~V4\18�x�H�:sF��Q%i�vp�,\0110x�d�\0\0\0����\0ۛ����\27\26���]�ۛ\\\27[������Z��F\27\27���Z����\27]�ڛF\27\27��\26��ۚ����\26�^�\27�����F\27������ۚ���\26��ߚ��\29Zڛ\6\26\27���٘�[�\27^�\27�����ޙ\27�\27����\25��F\26��ۚ\27����\27]�ٛ�\25ٛF\26����[����\27]Zٛ�\25ٛڙ��\30����\2�\2��\2\5݁\0\2@\1�\3\23�\2���B\0\6BA\0\29��\0AB\3\0\22B\2\4A\2\3\0�\2\0\2�\2�\2��\2\5݁\0\2@\1�\3�A@\0ǁ�\3\0\2�\1݁\0\1\25���\23@\26��\1\0\3\1\2\4\0AB\4\0�\2�\3��\4\0\5\3�\2A�\4\0�\3\0\4�\3\5\0\0\4�\0AD\5\0�\4�\1��\5\0\0\5�\2A�\5\0�\5\0\1V��\4�\2\0\1݁\0\2�\1\0\0\23@\20�\11\2\0\0F\2F\0�B\6\0]�\0\1���\4��F\5�\2�\3��\0\1\0\2\0\5�\2G\4\24@G\5\23�\2���G\0��G\4��\0\1�\2�\4��G\0�\2H\4��\0\1ƂG\0\7�G\4�\2\0\1�\2\0\0\23@\14��\2G\4\24@H\5\23@\12���G\0��G\4��\0\1�\2�\4�B@\0��H\5�\2�\1\5\3\0\2E\3�\2�\3�\4\22�\3\6݂\0\1\1�\3\0A�\8\0��\0\2�\2\0\3\1\3\9\0AC\4\0�\3�\3��\4\0\5\4�\2A�\4\0�\4\0\4�D\9\0\5\5�\4A�\5\0�\5\0\5V��\6�\3\0\1݂\0\2\11\3\0\0F\3F\0�C\6\0]�\0\1���\6��F\7�\3�\5��\0\1\0\3\0\7�\3G\6\24@G\7\23\0\3���G\0�\3H\6��\0\1ƃG\0\5\4�\4�\3\0\1�\3\0\0\23\0\1��\2\0\0ƂG\0\7\3G\4�\2\0\1�\2\0\0\3\2\0\0\31\2\0\1\23�\0��\1\0\0\1�\9\0�\1�\1\31\0�\0\6\7\21 �C�s��\7v\20�\0150G�Kh\23\11\16I\25��Ml���p�J6\3K�p/��`8h�\9\1�Cg9\23A\5/&�<G\12\19�\"\
\0\0\0\0\2\1\5\1\6\1\7\1\9\1\2\1\0\1\8\1\
\1\4\9\7!\25E\7Y\4W��!:��h�\29�l�*NXԵ�`�A\9ns�\\Q'\0\0\0\3\0\0\0\0\0\0$@\4\7\0\0\0�������\4\5\0\0\0�����\4\2\0\0\0��\0\4\9\0\0\0���������\4\6\0\0\0̑����\4\
\0\0\0����������\4\4\0\0\0����\4\5\0\0\0�����\4\3\0\0\0���\4\4\0\0\0����\3\0\0\0\0\0\0�\4\19\0\0\0̑��̌��������͉���\4\4\0\0\0����\3\0\0\0\0\0\0�?\4%\0\0\0������̂��͇����̀�������̂��̇ѥ����\4\7\0\0\0�������\4\7\0\0\0Ŗ�����\4\6\0\0\0œ����\4\7\0\0\0ŗ�����\4\11\0\0\0Ņ���������\4\7\0\0\0Ő�����\4\
\0\0\0ŗ��������\4\8\0\0\0��������\4\3\0\0\0���\4\5\0\0\0�����\4\7\0\0\0�������\4\4\0\0\0����\3\0\0\0\0\0\0\0\0\4\9\0\0\0���������\4\3\0\0\0���\4\7\0\0\0�������\3\0\0\0\0\0�r�\4\4\0\0\0����\3\0\0\0\0\0\0 @\4'\0\0\0������̂��͇����̀�������̂��̇ѱ������\4\5\0\0\0Ŋ���\4\19\0\0\0\6x]\4jd\11D@\5}s\
wz\11LL�\0\0\0\0\27pi\23�||4_Z�v\8\30\26\26O��d�Ia[�Վl��\30Xn/iQ\19v�\28\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 CϮj��dG85�N\9`ON\17s\29Mޠ�\12�\1\9\20 �s�od�,��MO3\8�\19�+{9PԷ@\19�\15UŦ\"\4�\1t\0258\8t\25�w�cZ�{\30��\9y\6\\Sp2�s�I\3\14-C,@�!�{o\0v\25\31\9v\25L\30�\18�be\31\19\12�K\25f\4P�0KbWہ6�3i\23\1 \8\6 `;�\4���d�\6�=�5�v�DH`ez�-`\29B#;ٕ/���A\0\12\8\8 ��Mp�\27�\22���`\1n\23/�\127V4\18�V�8��Mp\2�r:��F\20��\13�#�n\12��R=\0\0\0�����������c�����������������#�c��#�䣣����f�c�&�������u��⾀\0\1��\0\0��\0\0\29�\0\2E\0�\2�\0\1\0�@\1\0\5\1\0\3A�\1\0�\1\0\2��\1\0\5\2�\3A\2\2\0�\2\0\0�B\2\0\0\3\0\0�\0�\1]��\1[\0\0\0\23�\5��\0\0\0ƀ�\0\1�\2\0݀\0\1\7\1�\1\7AC\2@\1�\0\29�\0\1�\0\0\2\7�C\1\24�C\2\23@\1�\3\1�\0F\1�\0��C\1]\1\0\1\31\1\0\0\23\0\1�\4\1\0\0F\1�\0��C\1]\1\0\1\31\1\0\0�\0\0\0�\0\0\1\31\0�\0\
\7\21 ��\"\14 \7�\30za\127p\30�mpw�.U\30��\7�\28a!�\29\0Z\13\11\16I\25�#H_�S�Pc��L�\5\0132q�s�YM|� �N\19��P)\7�l,<xe\8\0\0\0\1\4\0\2\1\7\1\9\1\2\1\0\1\8\1\
\9\7!\25*u�\27���_�y�0��\\T�i�-*|�#\15l\
\27�F�;\17\0\0\0\4\7\0\0\0�������\4\4\0\0\0����\3\0\0\0\0\0\0�?\3\0\0\0\0\0\0 @\4,\0\0\0������Ȇ��Ƀ����Ʉ�������Ȇ��ȃյ�����������\4\7\0\0\0�������\4\7\0\0\0�������\4\6\0\0\0������\4\5\0\0\0�����\4\7\0\0\0�������\4\8\0\0\0��������\4\3\0\0\0���\4\5\0\0\0�����\4\7\0\0\0�������\4\4\0\0\0����\3\0\0\0\0\0\0\0\0\4\9\0\0\0���������\0\0\0\0\21pi\23\28g�m�A\14\\�&� <n�\12q��L��\28\17�P�a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 A\0173<�\18�\19\30�\30\8���o�\
\9\20 op�Eg\14\25s�(d~�\1t\0253\8t\0251�7g\24\12p\19v�3�\0v\25\16\9v\25�p�l\16\12�1Z[�G-��~�w�\\\\�m\6͌�]ҍy\24\0(\8\6 �=�a\1\1\8\8 ��\"\2>�Qh�tj=�/�/��#_��+�@�k|\13\0s\17v�3�yV4\18�\12�K\19\0\0\0��ৠ �`���!`�� `\1��\0\0\24\0A\1\23�\1�\12A�\0��\1\0\29��\1�\0\0\2\12��\0\29A\0\1�\0\0\1\23@\0�\1�\0\0\31\1\0\1\31\0�\0\0\7\21 A��\30Y5)J\7\7\16I\25rP�\5qA�]�F�M�^kj3� J\15S[\127\1\0\0\0\0\2\4\7!\25`G�H��$\\��g8-�K&�X�t\8\0\0\0\4\3\0\0\0�ɦ\4\5\0\0\0���Ȧ\4\3\0\0\0�Ħ\4\1\0\0\0�\0\4\5\0\0\0���¦\4\3\0\0\0�Ǧ\4\6\0\0\0����æ\0\0\0\0\21pi\23�\17=\8��\23;��E18\8�p�_�x\23\25�`�\2�O\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 �څ*j�EQM\27�1\28��\18���xV�\2?�;�hk\8\9\20 ���4�\1t\0259\8t\25k��\24�є\8���q\3�-\2\26ݪVi�jn'\13q�\8;%��5_�\0v\25\16\9v\25/��\8)\22�D\3��v�p�4]\"�8�aq\17�l�}�Ś\19\0 \8\6 �\\\30B�� >�3�s\6x�s�~�P<\1�l\\��2K��9��za\1\11\8\8 ���n\29�T7ċ_\8�|V4\18�d�\
\9A�M6u�\0195��{\21\0\0\0���c���c����c㥣�㾀�\0\24��\0\23�\1���@\0�\0\1\0��\0\1�@A\0݀\0\1\0\0�\1\23�\0��@A\0�\0\0\0��\0\1\0\0\0\1\31\0\0\1\31\0�\0\7\7\21 �\15�r'�[\14���{�%\1277*�\2\5\5\9\16I\25DH;p��s\22�5.�\13�\3\22s\0099�\23Tpg��A���,\1\0\0\0\0\2\11\7!\25\19-�\18ᧃ\25���\22^�L�M�zSz�\6Uy\21;�)S2\23\6\6\15D�.2\6\0\0\0\4\9\0\0\0\31\4\24\31\25\2\5\12k\4\
\0\0\0\12\14\31$8?\18\27\14k\4\4\0\0\0\2\4\24k\4\8\0\0\0\25\14\26\30\2\25\14k\4\3\0\0\0\24\17k\4\4\0\0\0\6\15^k\0\0\0\0\23pi\23�j�\25M\30�\127�0So\20�-\21\13h�r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 lX\20E���5\27��Xl.�\21��\5\0074�Pp�f�7\6\0\9\20 \0060�1��Qg9Krs�J�\28�b\5\17\17\29\19\20\23,�O�\27�d�\24C[�\1t\0258\8t\25ʰj\13\6�vEaƏc\7�\17\24�U�\18\127_�\13���YW�6\127�\0v\25\26\9v\25�8[+�%5!\1(\8\6 *�op\0\2\8\8 O��Y��*\6��\20^�_\20Js&\7>i�$\27f��~yV�o*@v\2��pr~}V4\18��\6\24ͤ\\U�tx�\5�a\11��0:\0\0\0{~~~?~~~�>~~�~~~c�~~;~~~��~~�>~~X\127~~#�~~�~�~��~~\127\127\127~??\127~�\127\0\0��\0\0ƀA\1\1�\1\0݀\0\1\6�A\1A\1\2\0\29�\0\1K\1\0\0�\1�\0�AB\2\11�\1\0\
\2\0�\
\2Å\
���KB\1\0J\2ćJ�ĈJ\2ŉJ�Ŋ�\2\0\3J���\
B\2�FBF\1G\2�\4GB�\4�\2\0\3]�\0\1\
B\2�FBF\1G��\4G��\4�\2�\2]�\0\1\
B\2���\0\1\24\0G\4\23�\0�G\2�\2_\2\0\1\23@\0�C\2\0\0_\2\0\1\31\0�\0\4\7\21 ��='mZA\20'R�\29o\"-:� \"���w\11\2\16I\25�Ek2�\20L#�\25�Z\3\0\0\0\0\0\0\1\0\2\4\7!\25ϥ�\19RЧ1g\
\23\13ee�\25�q�\15\29\0\0\0\3\0\0\0\0\0\0�?\4\7\0\0\0urtoha\6\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\7\0\0\0hskdct\6\3\0\0\0\0\0\0$@\4\8\0\0\0tcwsotc\6\4\3\0\0\0u|\6\4\13\0\0\0u|iemcr(nrrv\6\4\8\0\0\0tcwscur\6\4\4\0\0\0stj\6\4\7\0\0\0kcrnib\6\4\5\0\0\0VIUR\6\4\8\0\0\0rokcisr\6\4\8\0\0\0ncgbctu\6\4\7\0\0\0Geecvr\6\4\4\0\0\0,),\6\4\16\0\0\0Geecvr+Jghasgac\6\4\6\0\0\0|n+eh\6\4\13\0\0\0Eihrchr+R\127vc\6\4.\0\0\0ksjrovgtr)`itk+bgrg=&dishbgt\127;+++++++++++++TM\6\4\5\0\0\0Niur\6\4\16\0\0\0gvo(tsimsgo(eik\6\4\15\0\0\0Eihrchr+Jcharn\6\4\7\0\0\0uistec\6\4\6\0\0\0jrh74\6\4\5\0\0\0uohm\6\4\6\0\0\0rgdjc\6\3\0\0\0\0\0\0i@\0\0\0\0\20pi\23؋�WP��*R�)VR��G{9W-�H\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 lE�\0016}�8.e�}��&p\9\12�w[�i\0�nvl�2�\22B\11\9\20 \
D�>P0�\5�\1t\0259\8t\25�Mft\13��\31�z�q�YE%�JBJĠ�rd=�5���3�lp'�\0v\25\30\9v\25�\2w�$�d�J�a�=�\21LT;9�\29�\6\0(\8\6 \7\13\19\31\0\9\8\8 �u�>�~V4\18��Y6�%(\29��\6ey�\3M#�H@�q�\23M\0\0\0������\9���C\2����\2��C��T�\3�����ǃ��\3Ã�B�\2��@��\20���C\3����\2�����\2�\2�C@���@\0�\3�\1\0�\2\0\1\1C\1\0@\3�\0��\0\0\22�\3\6A\3\2\0�\3�\1�C\1\0\0\4�\0A�\0\0�C�\7\1D\2\0@\4\0\0�D\1\0�\4�\0\1�\0\0�\4\5\9�@\0\8ƀB\2���\1\0\1\0\1݀\0\1�\0�\1�\0�\2\1\1\3\0@\1\0\1�\1\0\0݀\0\2�\0\0\0\23�\5�\6AC\2A�\3\0\29�\0\1G�C\2G\1�\2�\1�\1]�\0\1�A�\2�\1\0\0\23@\1��\1�\0ƁD\2\7B�\2�\1\0\1�\1\0\0\23�\1����\2�\1\0\0\23\0\1��\1\0\0ƁD\2\7��\2�\1\0\1�\1\0\0\3\1\0\0\31\1\0\1\31\0�\0\8\7\21 t��Ei��\22-F�\127���e,'�\8��<%J��/�ǀ{Z�([6��c\21\4\16I\25q Eb\31}�ZrY�\7\28k�C��Rp\6\0\0\0\1\2\1\11\1\9\1\
\0\2\1\8\0\7!\25\8��J\20\0\0\0\3\0\0\0\0\0\0>@\4\16\0\0\0ooooooooooooo\16\9B\4\3\0\0\0ooB\4\2\0\0\0HB\0042\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`71'0,#/'`HHB\4\4\0\0\0HooB\0042\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`2#115-0&`HHB\0040\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`1-$6+&`HHB\0041\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`1-$6)';`HHB\0041\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`6+/'-76`HHB\4\6\0\0\0006# .'B\4\7\0\0\0!-,!#6B\4!\0\0\0*662xmm#2+l07-)7#+l!-/m+,$-l(1-,B\4\8\0\0\0000'37+0'B\4\3\0\0\00018B\4\5\0\0\0(1-,B\4\7\0\0\0&'!-&'B\4\6\0\0\0\17!-0'B\4\9\0\0\0006-160+,%B\4\6\0\0\0\00700-0B\0\0\0\0\24pi\23ƺ$`a�\
S�(�4�,�|R\26�Ku�'k�R\11\26\5��0�^+8��SZ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 �F�?�\8\9\20 I[%'.\2t\0255\8t\25���\13}{\",\13V�FP5�2Y�\22w�\0v\25\30\9v\25B�mbƕ\12\6'�5\15\5&.?9u9;�(�\30\1.\8\6 �L�\\��\22Y�'\23\25 \18�\28Sh�|l!FYݦ�-\0\13\8\8 v |H���\31���I\26}�E���w�|V4\18��`c,��0�X�}v� q�\0\0\0���ށ������Z����A������Z[���\30����X���XZ��\26���Z�Z�؛�[���\26�����Zښ���Z�Z�\26��ه�ZٜX��[\24�ڇ��۟�Z�\\ؘ�GXZ�\27���L\24�߇X��\26�Z����Z�؛�[X��\26�����Zښ���Z�Zۇ��ٜX��[\24\1\0]B\0\1E\2�\0�\2B\0���\0��\2\0��\2\5]�\0\1�\1�\4F\2C\0GB�\4�\2�\3]�\0\1\25@��\23�\24�F�C\0G��\4]��\0�\2\4\0�\2�\9\1C\4\0@\3\0\5��\4\0\22�\3\6A�\4\0�\3\0\1�\3\5\0\0\4\0\5A�\4\0�C�\7\1D\5\0E\4�\1�\4\5\0�\4\0\5\1�\4\0�\4\5\9��\5\0\0\5\0\2A\5\5\0�\5\0\5��\4\0VŅ\
��\5\0�\5\0\2\1\6\5\0@\6\0\5��\4\0\22�\6\12A\6\6\0�\6�\2�\6\5\0\0\7\0\5A�\4\0�F�\13\1G\6\0@\7�\2�\7\5\0�\7\0\5\1�\4\0�\7\8\15��\6\0\0\8�\3A\8\5\0�\8\0\5�H\4\0VȈ\16�B\0\11\6�F\0\7\3G\6@\3�\5\29�\0\1�\2\0\6\5\3\0\3AC\7\0�\3�\5�\3�\2\29�\0\2\27\3\0\0\23\0\8�K\3\0\0��G\0��\7\0��\0\1�\3H\7�C�\7\0\4\0\6݃\0\1@\3�\7ǃ�\6�\3\0\0\23�\1���H\0\7��\6݃\0\1\6�H\0G\4�\6\29\4\0\1�\3\0\0\23�\4��C�\6�\3\0\0\23�\3��\3\0\0\6�H\0GD�\6\29�\0\1F�H\0���\6]�\0\1\22D\4\8�\3�\1\23@\1�C\3\0\0_\3\0\1\23�\0�D\2\0\0��\9\0_\2�\1\31\0�\0\8\7\21 ��^D���#\2�\11Tg�\8u\8�.\6�@\24Z�3>\4\14�\\E\2�Q\21]\\�\"$\6\16I\25�\2\14r�[�{�\4�{�\20�\0147Ĥx'&�T��R<\7\0\0\0\0\2\1\6\1\2\1\11\1\9\1\
\1\8\3\7!\25�Fb\29!�\21\\(\0\0\0\3\0\0\0\0\0\0N@\3\0\0\0\0\0\0�?\4\
\0\0\0����������\4\4\0\0\0����\4\9\0\0\0���������\4\14\0\0\0��������������\4\7\0\0\0�������\3\0\0\0\0\0@\127@\4\9\0\0\0���������\4\19\0\0\0�������������������\4\14\0\0\0��������������\4\19\0\0\0�������������������\4\7\0\0\0�������\4\4\0\0\0����\4\3\0\0\0���\4\5\0\0\0�����\4\16\0\0\0����������������\4\3\0\0\0���\4\2\0\0\0��\0042\0\0\0��������������������򴽠�������򼳿��𧡷���������\4\4\0\0\0����\0042\0\0\0��������������������򴽠�������򼳿��𢳡���������\0040\0\0\0��������������������򴽠�������򼳿��𦫢�������\0040\0\0\0��������������������򴽠�������򼳿��𡽴�������\0041\0\0\0��������������������򴽠�������򼳿��𡽴��������\0041\0\0\0��������������������򴽠�������򼳿��𦻿��������\4h\0\0\0��������������������򴽠�������򼳿��𻿳����򴻾�������������ؑ������������򳢢������������������������\4\6\0\0\0������\4\7\0\0\0�������\4#\0\0\0�����������������������������������\4\8\0\0\0��������\4\3\0\0\0���\4\5\0\0\0�����\4\7\0\0\0�������\4\7\0\0\0�������\4\9\0\0\0���������\4\3\0\0\0���\4\6\0\0\0������\4\11\0\0\0�����������\4\19\0\0\0007Il5[U:uq4LB;FK:}}�\0\0\0\0\22pi\23��\7c�p�Sl�[f\31w�\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 ml\26wי\127Nb�%L.�&C\22\16�t$\12\9\20 �\9�2q�D\1K��p-)}\0285�\"\15i\2t\0253\8t\25~�$g\\,�$2r8\3v\25\17\9v\25\2xx1�xpN�\13�N�A\24���R�6�>���\23��oT\5��S\1(\8\6 \11�\5\13\0\0\8\8 �C\1274��\28\17\11#pcx��\2\18CB]9Ζ&���w8�c8{rV4\18���9�9\23q� ,G�n�Hu6\0|\17�P.�\4(u3[2n�2�T�|�&�\0\0\0]{{y�;{{l{{��{{{�;;{���z{z{{:�{{���zc{�zl{z��;:{���{z�z{;z{{m;�z�{�{{z{{��{z}�:{f��{c{9yl{z�>z�{�z{{&�{z�{�yl�{�>z�{�z{{&�{z�{�y=:;{<:�y�z�z&�\0\1\25@\1�\23�\24�F�B\0G\1�\2]��\0�A\3\0�\1�\9\1�\3\0@\2\0\3��\3\0\22�\2\4A\2\4\0�\2\0\1�B\4\0\0\3\0\3A�\3\0�B�\5\1�\4\0E\3�\1�C\4\0�\3\0\3\1�\3\0�\3\4\7��\4\0\0\4�\0AD\4\0�\4\0\3��\3\0VĄ\8�\4\5\0�\4\0\2\1E\4\0@\5\0\3��\3\0\22�\5\
AE\5\0�\5�\2�E\4\0\0\6\0\3A�\3\0�E�\11\1�\5\0@\6\0\1�F\4\0�\6\0\3\1�\3\0�\6\7\13��\5\0\0\7�\1AG\4\0�\7\0\3��\3\0VǇ\14�A\0\11\6\2F\0\7BF\4@\2�\3\29�\0\1�\1\0\4\5\2\0\3A�\6\0�\2�\3�\2\0\1\29�\0\2\27\2\0\0\23\0\8�K\2\0\0��F\0�\2\7\0��\0\1�BG\5ǂ�\5\0\3\0\4݂\0\1@\2�\5���\4�\2\0\0\23�\1��\2H\0\7��\4݂\0\1\6\3H\0GC�\4\29\3\0\1�\2\0\0\23�\4�ǂ�\4�\2\0\0\23�\3��\2\0\0\6\3H\0G��\4\29�\0\1F\3H\0���\4]�\0\1\22C\3\6�\2�\1\23@\1�C\2\0\0_\2\0\1\23�\0�D\1\0\0�\1\9\0_\1�\1\31\0�\0\1\7\21 �@�#�\25�>\127Ɯ\15 \3\16I\25DܸV|I\12d\7\0\0\0\0\2\1\6\1\2\1\11\1\9\1\
\1\8\9\7!\25+��C��\17q\0\31�\"�2hx8�.\2\11Ba\6E\16g{J�p_%\0\0\0\3\0\0\0\0\0\0N@\4\7\0\0\0WPVMJC$\4\5\0\0\0BMJ@$\4\2\0\0\0\11$\0\4\9\0\0\0QWAVtEPL$\4\6\0\0\0\11VAW\11$\4\
\0\0\0CAPkwp]TA$\4\4\0\0\0MKW$\4\4\0\0\0HAJ$\3\0\0\0\0\0\0�?\4\3\0\0\0KW$\4\5\0\0\0PMIA$\4\16\0\0\0\9\9\9\9\9\9\9\9\9\9\9\9\9vo$\4\3\0\0\0\9\9$\4\2\0\0\0.$\0042\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6QWAVJEIA\6..$\4\4\0\0\0.\9\9$\0042\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6TEWWSKV@\6..$\0040\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6P]TAM@\6..$\0040\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6WKBPM@\6..$\0041\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6WKBPOA]\6..$\0041\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6PMIAKQP\6..$\4h\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6MIECA\6\31\4BMHAJEIA\25\6\21\
TJC\6.gKJPAJP\9p]TA\30\4ETTHMGEPMKJ\11KGPAP\9WPVAEI..$\4\6\0\0\0PEFHA$\4\7\0\0\0GKJGEP$\4#\0\0\0LPPT\30\11\11ETM\
VQKOQEM\
GKI\11GVAEPA\
NWKJ$\4\8\0\0\0VAUQMVA$\4\3\0\0\0W^$\4\5\0\0\0NWKJ$\4\7\0\0\0@AGK@A$\4\7\0\0\0vAWQHP$\4\9\0\0\0PKWPVMJC$\4\3\0\0\0m@$\4\6\0\0\0aVVKV$\4\11\0\0\0aVVKV{gK@A$\4\19\0\0\0���í�̃�º�Ͱ�̋�$\0\0\0\0\26pi\23��Ns���\23ǥ[-9��\29+\27}Q��r\30�\21*e\
�H\26\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 'I�\14u֓\18A��\4��,~��t]ʶK_�\12\9\20 ���#À9$3.�\
�sj@��S%�\2t\0251\8t\25*��pC\3v\25\25\9v\25�r�U\1#\8\6 1�\23u���_�\26c\5L�}\12Y\\� E��z�s�\0�^w\30�g3{\127�\
W\0\9\8\8 �T�#�rV4\18q+G6�g�\30H[�.\26��\19h\30�}Si'=F��V��t!\22�`ay�Gab\0\0\0����ъ�����J�����������ʏ��ʑ����\
�J����A���\11J����Jʋ\11��\28�K����ʏ�J�K���\
�J��\8��\\���\11K�����ˋ���JȀ\0��\0\0V\4��\1\0�\2�\1\1C\1\0@\3�\0��\0\0\22�\3\6A\3\2\0�\3\0\2�C\1\0\0\4�\0A�\0\0�C�\7\1D\2\0@\4\0\0�D\1\0�\4�\0\1�\0\0�\4\5\9��\2\0\5\5\0\0AE\1\0�\5�\0��\0\0VŅ\
�@�\9���\2�\0�\1\0\1\0\1݀\0\1�\0�\1�\0\0\3\1A\3\0@\1\0\1�\1\0\0݀\0\2�\0\0\0\23�\7�\11\1\0\0F��\2��\3\0]�\0\1�\1�\2�AD\3�\1�\1��\0\1\0\1\0\3��D\2�\1\0\0\23@\1��\1�\0���\2\7�D\2�\1\0\1�\1\0\0\23�\3��\1E\2�\1\0\0\23�\2��\1\0\0���\2\7\2E\2݁\0\1\6��\2GBE\2\29�\0\1�\1�\3�\1�\1\23@\0�\3\1\0\0\31\1\0\1\31\0�\0\5\7\21 �ô\6\20��=�.�R\25�-O�U{\19��\26\28JnED\24\3\16I\25P�}!�,�P\7\0\0\0\1\4\1\2\1\11\1\9\1\
\0\2\1\8\4\7!\25�*/\28��~Qh�R2,�b\23\17)�(\22\0\0\0\3\0\0\0\0\0\0>@\4\16\0\0\0����������������\4\3\0\0\0���\4\2\0\0\0��\0042\0\0\0������ɐ����������Ӈ����А���܆����؀��������؟���\4\4\0\0\0����\0042\0\0\0������ɐ����������Ӈ����А���܆����؀��������ٟ���\0040\0\0\0������ɐ����������Ӈ����А���܆����؀������ٟ���\0041\0\0\0������ɐ����������Ӈ����А���܆����؀�������ğ���\0041\0\0\0������ɐ����������Ӈ����А���܆����؀�������ɟ���\4,\0\0\0������ɐ����������Ӈ����А���܆����؀��ٟ���\4\6\0\0\0����ؽ\4\7\0\0\0�����ɽ\4(\0\0\0���͇����ԓ������ԓ��В����������ϓ���ӽ\4\8\0\0\0������ؽ\4\3\0\0\0�ǽ\4\5\0\0\0���ӽ\4\7\0\0\0�����ؽ\4\7\0\0\0�����ɽ\4\9\0\0\0�������ڽ\4\6\0\0\0����Ͻ\4\11\0\0\0���������ؽ\0\0\0\0\20pi\23(�\21;m�DB�Q�\4�\18]q\11*�`\25�\0313\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\26pi\23sH�^l\22Gp�Q�[p\14<\0�\0�Qs\
\14=\30H\27bw�\\X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\16pi\23�v�4���'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", "@" .."TSLib.lua"))


package.preload["lua-require"] = assert(load("local originRequire = require\
local _ENV = _ENV\
\
local options = {\
  basePath = './',\
  osExit = os.exit,\
  extensions = { '', '.lua' },\
}\
\
-- 字符串分割\
local myString = {}\
do\
  for key, value in pairs(string) do\
    myString[key] = value\
  end\
  myString.split = myString.split or function(str, d)\
    if str == '' and d ~= '' then\
      return { str }\
    elseif str ~= '' and d == '' then\
      local lst = {}\
      for key = 1, myString.len(str) do\
        table.insert(lst, myString.sub(str, key, 1))\
      end\
      return lst\
    else\
      local lst = {}\
      local n = myString.len(str) --长度\
      local start = 1\
      while start <= n do\
        local i = myString.find(str, d, start) -- find 'next' 0\
        if i == nil then\
          table.insert(lst, myString.sub(str, start, n))\
          break\
        end\
        table.insert(lst, myString.sub(str, start, i - 1))\
        if i == n then\
          table.insert(lst, '')\
          break\
        end\
        start = i + 1\
      end\
      return lst\
    end\
  end\
  for key, value in pairs(myString) do\
    string[key] = string[key] or value\
  end\
end\
\
local path = (function()\
  local path = {}\
  path.basename = function(thePath)\
    thePath = myString.gsub(thePath, '\\\\', '/')\
    thePath = myString.gsub(thePath, '//+', '/')\
    local thePathArray = myString.split(thePath, '/')\
    local res = table.remove(thePathArray)\
    return res\
  end\
  path.dirname = function(thePath)\
    thePath = myString.gsub(thePath, '\\\\', '/')\
    thePath = myString.gsub(thePath, '//+', '/')\
    local thePathArray = myString.split(thePath, '/')\
    table.remove(thePathArray)\
    return table.concat(thePathArray, '/')\
  end\
  path.extname = function()\
  end\
  path.join = function(...)\
    local pathArray = { ... }\
    local resultPathArray = {}\
    for key = 1, #pathArray do\
      if pathArray[key] ~= '' then\
        if type(pathArray[key]) ~= 'string' then\
          error('bad argument #' .. key .. ' to \\'path.join\\' (string expected, got ' .. type(pathArray[key]) .. ')', 2)\
        end\
        local thePath = myString.gsub(pathArray[key], '\\\\', '/')\
        thePath = myString.gsub(thePath, '//+', '/')\
        local thePathArray = myString.split(thePath, '/')\
        for key2 = 1, #thePathArray do\
          local theName = thePathArray[key2]\
          if theName == '' and #resultPathArray > 0 then\
          elseif theName == '.' and #resultPathArray > 0 then\
          elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '' then\
            table.remove(resultPathArray)\
          elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '.' then\
            resultPathArray = { '..' }\
          elseif theName == '..' and #resultPathArray > 0 then\
            table.remove(resultPathArray)\
          else\
            table.insert(resultPathArray, theName)\
          end\
        end\
      end\
    end\
    return table.concat(resultPathArray, '/')\
  end\
  path.relative = function()\
  end\
  path.resolve = function(...)\
    local pathArray = { ... }\
    local resultPathArray = {}\
    for key = 1, #pathArray do\
      if pathArray[key] ~= '' then\
        local thePath = myString.gsub(myString.gsub(pathArray[key], '\\\\', '/'), '/$', '')\
        thePath = myString.gsub(thePath, '//+', '/')\
        local thePathArray = myString.split(thePath, '/')\
        for key2 = 1, #thePathArray do\
          local theName = thePathArray[key2]\
          if theName == '' and key2 == 1 then\
            resultPathArray = { '' }\
          elseif theName == '.' and #resultPathArray > 0 then\
          elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '' then\
            table.remove(resultPathArray)\
          elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '.' then\
            resultPathArray = { '..' }\
          elseif theName == '..' and #resultPathArray > 0 then\
            table.remove(resultPathArray)\
          else\
            table.insert(resultPathArray, theName)\
          end\
        end\
      end\
    end\
    return table.concat(resultPathArray, '/')\
  end\
  return path\
end)()\
\
local requireFactory\
requireFactory = function(dirPath)\
  return function(loadpath)\
    if type(loadpath) ~= 'string' then\
      error('bad argument #1 to \\'require\\' (string expected, got ' .. type(loadpath) .. ')', 2)\
    end\
\
    if myString.match(loadpath, '^%.%/') or myString.match(loadpath, '^%.%.%/') or myString.match(loadpath, '^%/') then\
      -- 相对于项目根目录的路径\
      local requirePath\
      -- 绝对路径\
      local absolutePath\
\
      -- 遍历扩展名列表并尝试在 package.loaded 里寻找已加载的模块\
      for key = 1, #options.extensions do\
        local rp = path.resolve(dirPath, loadpath .. options.extensions[key])\
        if package.loaded[rp] then\
          requirePath = rp\
          absolutePath = path.join(options.basePath, rp)\
          break\
        end\
      end\
      -- 如果 package.loaded 中没有需要的模块\
      if not requirePath or not package.loaded[requirePath] then\
        -- 遍历扩展名列表并尝试在 package.preload 里寻找已加载的模块\
        for key = 1, #options.extensions do\
          local rp = path.resolve(dirPath, loadpath .. options.extensions[key])\
          if package.preload[rp] then\
            requirePath = rp\
            absolutePath = path.join(options.basePath, rp)\
            break\
          end\
        end\
        -- 如果 package.preload 中没有需要的模块\
        if not requirePath or not package.preload[requirePath] then\
          local requireSource\
          local file\
          local errArr = {}\
\
          -- 遍历扩展名列表并尝试在 package.sourceCode 里寻找已加载的模块\
          for key = 1, #options.extensions do\
            local rp = path.resolve(dirPath, loadpath .. options.extensions[key])\
            if package.sourceCode[rp] then\
              requirePath = rp\
              absolutePath = path.join(options.basePath, rp)\
              requireSource = package.sourceCode[rp].source\
              break\
            end\
          end\
\
          -- 如果 package.sourceCode 中没有需要的模块\
          if not requirePath or not package.sourceCode[requirePath] then\
            -- 遍历扩展名列表并尝试从文件中寻找模块\
            for key = 1, #options.extensions do\
              local rp = path.resolve(dirPath, loadpath .. options.extensions[key])\
              local ap = path.join(options.basePath, rp)\
              local res, err = pcall(function()\
                local theFile = assert(io.open(ap, 'r'))\
                file = theFile\
                requireSource = file:read('*a')\
              end)\
              if not res then\
                table.insert(errArr, err)\
              end\
              -- 成功读取文件，返回项目路径和系统路径\
              if requireSource then\
                requirePath = rp\
                absolutePath = ap\
                break\
              end\
            end\
            -- 如果都没找到能执行的文件，则抛出错误\
            if not requireSource then\
              error(table.concat(errArr, '\\r\\n'), 2)\
            end\
            if file then\
              file.close()\
            end\
            --            package.sourceCode[requirePath] = { path = requirePath, source = requireSource }\
          end\
          requireSource = 'local require, modePath = ...; ' .. requireSource\
          package.preload[requirePath] = assert(load(requireSource, '@' .. requirePath))\
        end\
        package.loaded[requirePath] = package.preload[requirePath](requireFactory(path.dirname(requirePath)), requirePath) or true\
        -- 载入完成以后删除 package.preloaded 里的内容\
        package.preload[requirePath] = nil\
      end\
      return package.loaded[requirePath]\
    else\
      local requireRes\
      local res, err = pcall(function()\
        requireRes = originRequire(loadpath)\
      end)\
      if not res then\
        error(err, 2)\
      end\
      return requireRes\
    end\
  end\
end\
\
return function(optionParam)\
  options.osExit = optionParam.osExit or options.osExit\
  options.basePath = optionParam.basePath or options.basePath\
  local result = debug.getinfo(2, 'S')\
  if myString.match(result.short_src, '%[string') then\
    local newMain = myString.gsub(result.source, '%.lua$', '')\
    package.loaded[newMain] = nil\
    originRequire(newMain)\
    options.osExit()\
    return\
  end\
\
  if not _require then\
    _require = originRequire\
    local filePath = myString.gsub(result.source, '^@', '')\
\
    options.basePath = optionParam.basePath or path.dirname(filePath)\
    options.extensions = optionParam.extensions or options.extensions\
\
    require = requireFactory('./')\
  end\
\
  return {\
    basePath = options.basePath,\
  }\
end", "@" .."lua-require.lua"))


package.preload["warship-girls-r-script"] = assert(load("-- 载入 lua-require\
require('lua-require')({\
  osExit = function()\
    lua_exit()\
    mSleep(1)\
    mSleep(1)\
    mSleep(1)\
  end,\
})\
\
isPause = false\
luaExisted = false\
function beforeUserExit()\
  luaExisted = true\
end\
\
-- 解锁手机屏幕\
if (deviceIsLock() ~= 0) then\
  unlockDevice()\
end\
\
initLog('warship-girls-r-script', 1)\
\
require 'TSLib'\
require './lib/table-polyfill'\
require './lib/string-polyfill'\
require './lib/console'\
require './utils/keep-screen-hock'\
require './utils/multi-color-hock'\
require './utils/device-orient-hock'\
require './utils/clear-log'\
\
EventQuery = require './lib/event-query'\
Promise = require './lib/promise'\
\
local co = require './lib/co'\
local socket = require 'socket'\
local createChain = require('./lib/mission-chain').createChain\
local missionsList = require './missions/index'\
local stepLabel = (require './utils/step-label').init('stopbtn')\
local optionsLabel = require './options-label'\
local store = require './store'\
local lfs = require './utils/lfs'\
require './utils/clear-log'\
\
console.log('version 20180506-1847')\
\
Promise.setStackTraceback(setStackTraceback or false)\
\
local c = coroutine\
\
\
local sleepPromise = function(ms)\
  return Promise.new(function(resolve)\
    EventQuery.setTimeout(resolve, ms)\
  end)\
end\
\
stepLabel.setStepLabelContent('开始')\
\
function closeStepLabel()\
  fwCloseView('steplabel', 'text1')\
end\
\
stepLabel.setStepLabelContent('等待音量面板收起')\
mSleep(500)\
\
\
closeStepLabel()\
local ret, settings = optionsLabel()\
stepLabel.setStepLabelContent('正在载入...')\
if (ret ~= 1) then\
  stepLabel.setStepLabelContent('取消运行')\
  mSleep(100000)\
  lua_exit()\
end\
\
store.settings = settings\
\
-- 注册按钮事件，目前只有暂停按钮\
EventQuery.setButotnListener('stopbtn', function()\
  if (isPause) then\
    --    stepLabel.setPrefix('')\
    --    isPause = false\
  else\
    stepLabel.setPrefix('即将暂停 ')\
    isPause = true\
  end\
end)\
\
\
co(c.create(function()\
  if (settings.missionEnable\
    or settings.expeditionEnable\
    or settings.battleEnable\
    or settings.repairEnable\
    or settings.exerciseEnable\
    or settings.disintegrateShipEnable\
    or settings.campaignEnable) then\
\
    local theMissionsQuery = {}\
\
    -- 是否运行任务\
    if (settings.missionEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'MISSION_START' })\
    end\
    -- 是否运行远征\
    if (settings.expeditionEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_REWARD_START' })\
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_ONCE_START' })\
    end\
    -- 是否运行出征\
    if (settings.battleEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'BATTLE_INIT' })\
    end\
    -- 是否运行演习\
    if (settings.exerciseEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'EXERCISE_START' })\
    end\
    -- 是否运行战役\
    if (settings.campaignEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'CAMPAIGN_START' })\
    end\
    -- 是否运行修理\
    if (settings.repairEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'REPAIR_ONCE_START' })\
    end\
    -- 是否运行解体\
    if (settings.disintegrateShipEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'DISINTEGRATE_SHIP_INIT' })\
    end\
\
    local theChain = createChain(missionsList)\
\
    -- 启动任务链\
    c.yield(theChain.runMission({\
      missionsQuery = theMissionsQuery,\
      -- 在每次循环执行过 action 之后调用\
      afterAction = function(res)\
        local action = res.action\
        local nextAction = res.nextAction\
        local missionsQuery = res.missionsQuery\
        local runStartTime = res.runStartTime\
\
        return co(c.create(function()\
          if (action.isEnd) then\
            local diffTime = (socket.gettime() * 1000) - runStartTime\
            if (diffTime < (settings.missionsInterval * 1000)) then\
              local remainTime = (settings.missionsInterval * 1000) - diffTime\
              stepLabel.setStepLabelContent('休息剩余时间' .. math.ceil(remainTime / 1000) .. '秒')\
              while (remainTime > 0) do\
                stepLabel.setStepLabelContent('休息剩余时间' .. math.ceil(remainTime / 1000) .. '秒', true)\
                c.yield(sleepPromise(1000))\
                remainTime = remainTime - 1000\
              end\
            end\
          end\
        end))\
      end,\
    }))\
  end\
end)).catch(function(err)\
  wLog(\"warship-girls-r-script\", \"[DATE] \" .. err);\
  nLog(err)\
  EventQuery.setImmediate(function() error(err) end)\
end)\
\
EventQuery.run()\
", "@" .."warship-girls-r-script.lua"))


require("warship-girls-r-script")

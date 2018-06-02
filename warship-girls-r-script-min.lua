
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
  -- åŸºæœ¬æ–¹æ³•\
  toPoint = function(tab)\
    local newTab = {}\
    for key = 1, #tab do\
      local value = tab[key]\
      table.insert(newTab, { value.x, value.y })\
    end\
    return newTab\
  end,\
  -- å›¾ç‰‡æ•°æ®\
  battle = {\
    -- æ•Œæ–¹ä¿¡æ¯é¢æ¿\
    enemyInfoPanel = {\
      -- é›·å·¡\
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
      -- èˆªæ¯\
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
      -- æ½œè‰‡\
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
      -- è¡¥ç»™ï¼ˆæžæˆ˜åˆ©å“ï¼‰\
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
      -- å¤§ç ´\
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
      -- ä¸­ç ´\
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
-- æˆ˜å½¹æµç¨‹\
\
-- æ˜¯å¦åœ¨å‡ºå¾ç•Œé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
-- ç‚¹å‡»æˆ˜å½¹æŒ‰é’®\
campaign.clickCampaignBtn = function()\
  tap(102, 530, 100)\
  return true\
end\
\
-- æ˜¯å¦åœ¨æˆ˜å½¹ç•Œé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
-- ç§»åŠ¨åˆ°æˆ˜å½¹\
campaign.moveToCampaignMission = function(m)\
  m = tonumber(m) or 1\
  -- å…ˆç§»åŠ¨åˆ°ç¬¬1ç« \
  for i = 1, 5 do\
    tap(358, 962, 100)\
    mSleep(200)\
  end\
  -- å†ç§»åˆ°ç¬¬mç« \
  for i = 2, m do\
    tap(1836, 960, 100)\
    mSleep(200)\
  end\
  return true\
end\
\
-- ç‚¹å‡»å‡†å¤‡å¼€å§‹æˆ˜æ–—\
campaign.clickCampainReadyBtn = function(difficulty)\
  if (difficulty == 'default') then\
    tap(651, 317, 100)\
  else\
    tap(1504, 309, 100)\
  end\
  return true\
end\
\
-- ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢\
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
-- æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸\
campaign.isReadyBattlePageShipStatusAllRight = function()\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local result = true\
  local list = {\
    -- å¼¹è¯ä¸è¶³\
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
    -- è¿œå¾ä¸­\
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
-- æ£€æµ‹hpæ˜¯å¦å®‰å…¨\
campaign.isReadyBattlePageShipHPSafe = function(checkLevel)\
  local __keepScreenState = keepScreenState\
  if (not __keepScreenState) then keepScreen(true) end\
  local result = true\
  -- æ§½ä½ä¸Šæ²¡æœ‰èˆ¹\
  local list = {\
    { 469, 331, 0xbdae9c },\
    { 469, 470, 0xb5aa94 },\
    { 469, 608, 0xb5ae9c },\
    { 469, 747, 0xbdae9c },\
    { 469, 886, 0xb5aa94 },\
    { 469, 1024, 0xb5ae9c },\
  }\
  -- æ»¡è¡€\
  local list23 = {\
    { 469, 214, 0x9cfb8c },\
    { 469, 353, 0x9cff8c },\
    { 469, 491, 0x9cff8c },\
    { 469, 630, 0x9cfb8c },\
    { 469, 769, 0x9cff8c },\
    { 469, 908, 0x94fb84 },\
  }\
  -- æœ‰ä¸­ç ´\
  local list22 = {\
    { 469, 332, 0xefe310 },\
    { 469, 471, 0xefe308 },\
    { 469, 609, 0xefe308 },\
    { 469, 748, 0xefe310 },\
    { 469, 887, 0xefe308 },\
    { 469, 1026, 0xefe310 },\
  }\
  -- æœ‰å¤§ç ´\
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
    -- æœ‰ä¸æ»¡è¡€\
    for i = 1, #list do\
      if ((not multiColorS({ list[i] }, 80)) and (not multiColorS({ list23[i] }, 80))) then\
        result = false\
        break\
      end\
    end\
  elseif (checkLevel == 2) then\
    -- æœ‰ä¸­ç ´æˆ–è€…å¤§ç ´\
    for i = 1, #list do\
      if ((not multiColorS({ list[i] }, 80)) and (multiColorS({ list22[i] }, 80) or multiColorS({ list21[i] }, 80))) then\
        result = false\
        break\
      end\
    end\
\
  elseif (checkLevel == 1) then\
    -- æœ‰å¤§ç ´\
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
-- ä¸æ»¡è¡€ï¼Œè¿”å›žå‡ºå¾\
campaign.clickReadyBattlePageBackBtn = battle.clickReadyBattlePageBackBtn\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™\
campaign.clickReadyBattlePageQuickSupplyBtn = battle.clickReadyBattlePageQuickSupplyBtn\
\
-- ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢\
campaign.isQuickSupplyModal = battle.isQuickSupplyModal\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™\
campaign.clickReadyBattlePageQuickSupplyModalOkBtn = battle.clickReadyBattlePageQuickSupplyModalOkBtn\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†\
campaign.clickQuickRepairBtn = battle.clickQuickRepairBtn\
\
-- ç­‰å¾…å¿«é€Ÿä¿®ç†ç•Œé¢\
campaign.isQuickRepairModal = battle.isQuickRepairModal\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†\
campaign.clickQuickRepairModalOkBtn = battle.clickQuickRepairModalOkBtn\
\
-- æ£€æµ‹å¿«é€Ÿä¿®ç†ç•Œé¢HPæ˜¯å¦å®‰å…¨ï¼Œæœ‰å‡ è‰˜èˆ¹éœ€è¦å¿«é€Ÿä¿®ç†\
campaign.isQuickRepairModalShipNeedRepair = battle.isQuickRepairModalShipNeedRepair\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å•ä¸ªèˆ¹\
campaign.clickQuickRepairModalSingleShip = battle.clickQuickRepairModalSingleShip\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­\
campaign.clickQuickSupplyModalCloseBtn = battle.clickQuickSupplyModalCloseBtn\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­\
campaign.clickQuickRepairModalCloseBtn = battle.clickQuickRepairModalCloseBtn\
\
-- æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾\
campaign.isFleetsCanBattle = battle.isFleetsCanBattle\
\
-- ç‚¹å‡»å‡ºå¾å¼€å§‹\
campaign.clickBattleStartBtn = battle.clickBattleStartBtn\
\
-- ç­‰å¾…é¢å¤–èŽ·å¾—èµ„æºé¢æ¿\
campaign.isExtraReceiveModal = battle.isExtraReceiveModal\
\
-- ç‚¹å‡»é¢å¤–èŽ·å¾—ç¡®å®š\
campaign.clickExtraReceiveModalOk = battle.clickExtraReceiveModalOk\
\
-- ç­‰å¾…å¿«å¼€å§‹æˆ˜æ–—ç•Œé¢\
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
-- ç‚¹å‡»å¼€å§‹æˆ˜æ–—\
campaign.clickBattleStartModalStartBtn = function()\
  tap(1326, 862, 100)\
  return true\
end\
\
-- ç­‰å¾…é˜µåž‹ç•Œé¢\
campaign.isFormationPage = battle.isFormationPage\
\
-- ç‚¹å‡»é˜µåž‹\
campaign.clickFormationPageStartBtn = battle.clickFormationPageStartBtn\
\
-- ç­‰å¾…è¿½å‡»é¡µé¢\
campaign.isPursueModal = battle.isPursueModal\
\
-- ç‚¹å‡»è¿½å‡»\
campaign.clickPursueModalOk = battle.clickPursueModalOk\
\
-- ç‚¹å‡»æ”¾å¼ƒ\
campaign.clickPursuePageCancel = battle.clickPursuePageCancel\
\
-- ç­‰å¾…èƒœåˆ©ç•Œé¢\
campaign.isVictoryPage = battle.isVictoryPage\
\
-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹æ˜¯å¦å—æŸ\
campaign.isVictoryPageShipDamaged = battle.isVictoryPageShipDamaged\
\
-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹HPæ˜¯å¦å®‰å…¨\
campaign.isVictoryPageShipHPSafe = battle.isVictoryPageShipHPSafe\
\
-- ç‚¹å‡»èƒœåˆ©ç»§ç»­\
campaign.clickVictoryPageContinueBtn = battle.clickVictoryPageContinueBtn\
\
-- ç­‰å¾…èƒœåˆ©ç»§ç»­é¢æ¿\
campaign.isVictoryPage2 = battle.isVictoryPage2\
\
-- ç‚¹å‡»èƒœåˆ©ç»§ç»­2\
campaign.clickVictoryPageContinueBtn2 = battle.clickVictoryPageContinueBtn2\
\
-- æ£€æµ‹èƒœåˆ©å¯¹æ‰‹è¯¦æƒ…é¡µé¢\
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
-- ç‚¹å‡»å…³é—­æŒ‘æˆ˜\
campaign.clickVictoryOpponentDetailPageClose = function()\
  tap(1803, 217, 100)\
end\
\
-- è¿”å›žhome\
campaign.clickBackToHomeBtn = battle.clickBackToHomeBtn\
-- æˆ˜å½¹æµç¨‹\
\
\
return campaign" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/exercise.lua"] = { path = "./meta-operation/exercise.lua", name = "./meta-operation/exercise.lua", source = "local battle = require './battle';\
\
local exercise = {}\
\
\
-- æ¼”ä¹ æµç¨‹\
\
-- æ˜¯å¦åœ¨å‡ºå¾é¡µé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
-- ç‚¹å‡»æ¼”ä¹ \
exercise.clickExerciseBtn = function()\
  tap(103, 252, 100)\
  return true\
end\
\
--  æ£€æµ‹æ¼”ä¹ ç•Œé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
--  æ£€æµ‹æ˜¯å¦æœ‰æ¼”ä¹ \
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
--  ç‚¹å‡»ç¬¬nä¸ªæ¼”ä¹ \
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
-- ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢\
exercise.isReadyBattlePage = battle.isReadyBattlePage\
\
-- ç‚¹å‡»é€‰æ‹©èˆ°é˜Ÿ\
exercise.selectFleet = battle.selectFleet\
\
-- æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸\
exercise.isReadyBattlePageShipStatusAllRight = battle.isReadyBattlePageShipStatusAllRight\
\
-- æ£€æµ‹hpæ˜¯å¦å®‰å…¨\
exercise.isReadyBattlePageShipHPSafe = battle.isReadyBattlePageShipHPSafe\
\
-- ä¸æ»¡è¡€ï¼Œè¿”å›žå‡ºå¾\
exercise.clickReadyBattlePageBackBtn = battle.clickReadyBattlePageBackBtn\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™\
exercise.clickReadyBattlePageQuickSupplyBtn = battle.clickReadyBattlePageQuickSupplyBtn\
\
-- ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢\
exercise.isQuickSupplyModal = battle.isQuickSupplyModal\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™\
exercise.clickReadyBattlePageQuickSupplyModalOkBtn = battle.clickReadyBattlePageQuickSupplyModalOkBtn\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†\
exercise.clickQuickRepairBtn = battle.clickQuickRepairBtn\
\
-- ç­‰å¾…å¿«é€Ÿä¿®ç†ç•Œé¢\
exercise.isQuickRepairModal = battle.isQuickRepairModal\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†\
exercise.clickQuickRepairModalOkBtn = battle.clickQuickRepairModalOkBtn\
\
-- æ£€æµ‹å¿«é€Ÿä¿®ç†ç•Œé¢HPæ˜¯å¦å®‰å…¨ï¼Œæœ‰å‡ è‰˜èˆ¹éœ€è¦å¿«é€Ÿä¿®ç†\
exercise.isQuickRepairModalShipNeedRepair = battle.isQuickRepairModalShipNeedRepair\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å•ä¸ªèˆ¹\
exercise.clickQuickRepairModalSingleShip = battle.clickQuickRepairModalSingleShip\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­\
exercise.clickQuickSupplyModalCloseBtn = battle.clickQuickSupplyModalCloseBtn\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­\
exercise.clickQuickRepairModalCloseBtn = battle.clickQuickRepairModalCloseBtn\
\
-- æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾\
exercise.isFleetsCanBattle = battle.isFleetsCanBattle\
\
-- ç‚¹å‡»å‡ºå¾å¼€å§‹\
exercise.clickBattleStartBtn = battle.clickBattleStartBtn\
\
-- ç­‰å¾…é¢å¤–èŽ·å¾—èµ„æºé¢æ¿\
exercise.isExtraReceiveModal = battle.isExtraReceiveModal\
\
-- ç‚¹å‡»é¢å¤–èŽ·å¾—ç¡®å®š\
exercise.clickExtraReceiveModalOk = battle.clickExtraReceiveModalOk\
\
-- ç­‰å¾…å¿«å¼€å§‹æˆ˜æ–—ç•Œé¢\
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
-- ç‚¹å‡»å¼€å§‹æˆ˜æ–—\
exercise.clickBattleStartModalStartBtn = function()\
  tap(1326, 862, 100)\
  return true\
end\
\
-- ç­‰å¾…é˜µåž‹ç•Œé¢\
exercise.isFormationPage = battle.isFormationPage\
\
-- ç‚¹å‡»é˜µåž‹\
exercise.clickFormationPageStartBtn = battle.clickFormationPageStartBtn\
\
-- ç­‰å¾…è¿½å‡»é¡µé¢\
exercise.isPursueModal = battle.isPursueModal\
\
-- ç‚¹å‡»è¿½å‡»\
exercise.clickPursueModalOk = battle.clickPursueModalOk\
\
-- ç‚¹å‡»æ”¾å¼ƒ\
exercise.clickPursuePageCancel = battle.clickPursuePageCancel\
\
-- ç­‰å¾…èƒœåˆ©ç•Œé¢\
exercise.isVictoryPage = battle.isVictoryPage\
\
-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹æ˜¯å¦å—æŸ\
exercise.isVictoryPageShipDamaged = battle.isVictoryPageShipDamaged\
\
-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹HPæ˜¯å¦å®‰å…¨\
exercise.isVictoryPageShipHPSafe = battle.isVictoryPageShipHPSafe\
\
-- ç‚¹å‡»èƒœåˆ©ç»§ç»­\
exercise.clickVictoryPageContinueBtn = battle.clickVictoryPageContinueBtn\
\
-- ç­‰å¾…èƒœåˆ©ç»§ç»­é¢æ¿\
exercise.isVictoryPage2 = battle.isVictoryPage2\
\
-- ç‚¹å‡»èƒœåˆ©ç»§ç»­2\
exercise.clickVictoryPageContinueBtn2 = battle.clickVictoryPageContinueBtn2\
\
-- æ£€æµ‹èƒœåˆ©å¯¹æ‰‹è¯¦æƒ…é¡µé¢\
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
-- ç‚¹å‡»å…³é—­æŒ‘æˆ˜\
exercise.clickVictoryOpponentDetailPageClose = function()\
  tap(1803, 217, 100)\
  return true\
end\
\
-- è¿”å›žhome\
exercise.clickBackToHomeBtn = battle.clickBackToHomeBtn\
\
\
return exercise" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/repair.lua"] = { path = "./meta-operation/repair.lua", name = "./meta-operation/repair.lua", source = "local repair = {}\
\
\
-- -- ä¿®ç†æµç¨‹\
\
-- ç‚¹å‡»èˆ¹åžæŒ‰é’®\
repair.clickDockBtn = function()\
  tap(1442, 743, 100)\
  return true\
end\
\
-- æ£€æµ‹èˆ¹åžç•Œé¢\
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
-- ç‚¹å‡»ä¿®ç†æŒ‰é’®\
repair.clickRepairBtn = function()\
  tap(101, 253, 100)\
  return true\
end\
\
-- æ£€æµ‹ä¿®ç†ç•Œé¢\
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
-- æ£€æµ‹å¯ç”¨çš„ä¿®ç†æ§½ä½\
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
-- æ£€æµ‹ç¬¬nä¸ªä¿®ç†æ§½ä½å¯ç”¨\
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
-- æ£€æµ‹ç¬¬nä¸ªä¿®ç†æ§½ä½ä¸å¯ç”¨\
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
-- ç‚¹å‡»ç¬¬nä¸ªä¿®ç†æŒ‰é’®\
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
-- æ£€æµ‹ä¿®ç†é€‰èˆ¹ç•Œé¢\
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
-- å¯»æ‰¾ä¸€ä¸ªä¸åœ¨èˆ°é˜Ÿé‡Œçš„èˆ¹\
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
-- å¯»æ‰¾ä¸€ä¸ªä¸åœ¨èˆ°é˜Ÿé‡Œçš„èˆ¹ã€‚\
-- å…ˆæ‰¾åˆ°æ‰€æœ‰èˆ¹çš„ä½ç½®ï¼Œå†æ‰¾åˆ°æ‰€æœ‰åœ¨èˆ°é˜Ÿé‡Œèˆ¹çš„ä½ç½®ï¼Œå°†ä¸¤ä¸ªæ•°ç»„ç›¸å·®\
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
-- ç‚¹å‡»ç¬¬ä¸€è‰˜èˆ¹\
repair.clickFirstShip = function()\
  tap(151, 432, 100)\
  return true\
end\
\
-- ç‚¹å‡»ä¸€æœèˆ¹\
repair.clickAShip = function(point)\
  tap(point[1], point[2], 100)\
end\
\
-- æ»‘åŠ¨åˆ°ä¸‹ä¸€é¡µ\
repair.moveToNextPage = function()\
  local point = {\
    { 1477, 824, 0x3a516b },\
    { 265, 814, 0xcecabd },\
  }\
  moveTo(point[1][1], point[1][2], point[2][1], point[2][2], 100)\
end\
\
-- æ£€æµ‹ä¿®ç†é¡µé¢æ˜¯å¦è¿˜éœ€è¦æ»‘åŠ¨åˆ°ä¸‹ä¸€é¡µ\
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
-- ç‚¹å‡»è¿”å›žæ¸¯å£\
repair.clickSelectShipPageBackBtn = function()\
  tap(1819, 974, 100)\
end\
\
-- ç‚¹å‡»è¿”å›žæ¸¯å£\
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
-- -- è¿œå¾æµç¨‹\
-- æ£€æµ‹æœ‰è¿œå¾å®Œæˆ\
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
-- ç‚¹å‡»å‡ºå¾\
expedition.clickBattle = home.clickBattleBtn\
\
-- æ£€æµ‹åœ¨å‡ºå¾ç•Œé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
-- ç‚¹å‡»è¿œå¾\
expedition.clickExpedition = function()\
  tap(108, 394, 100)\
  return true\
end\
\
-- æ£€æµ‹åœ¨å‡ºå¾è¿œå¾ç•Œé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
-- ä»Žç¬¬mç« ç§»åŠ¨åˆ°ç¬¬nç« \
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
    -- å…ˆç§»åŠ¨åˆ°ç¬¬1ç« \
    for i = 1, 12 do\
      tap(358, 962, 100)\
      mSleep(80)\
    end\
    -- å†ç§»åŠ¨åˆ°ç¬¬nç« \
    for i = 2, n do\
      tap(1835, 963, 100)\
      mSleep(500)\
    end\
  else\
    m = tonumber(m) or 1\
    local diff = n - m\
    -- ç§»åŠ¨åˆ°ç¬¬nç« \
    if (diff > 0) then\
      -- å³ç§»\
      for i = 1, diff do\
        tap(1835, 963, 100)\
        mSleep(300)\
      end\
    elseif (diff < 0) then\
      -- å·¦ç§»\
      for i = 1, (0 - diff) do\
        tap(358, 962, 100)\
        mSleep(300)\
      end\
    end\
  end\
  return true\
end\
\
-- æ£€æµ‹æœ¬é¡µæœ‰æ”¶èŽ·å¥–åŠ±ï¼ŒåŒæ—¶èŽ·å–å“ªæ¡æœ‰å¥–åŠ±\
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
-- ç‚¹å‡»ç¬¬nä¸ªæŒ‰é’®\
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
-- æ£€æµ‹åœ¨è¿œå¾å®Œæˆç•Œé¢\
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
-- ç‚¹å‡»ç»§ç»­\
expedition.clickRewardPannelOk = function()\
  tap(1644, 1022, 100)\
  return true\
end\
\
-- æ£€æµ‹ç¬¬nç« èƒ½å¦è¿œå¾\
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
-- ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢\
expedition.isReadyBattlePage = battle.isReadyBattlePage\
\
-- é€‰æ‹©èˆ°é˜Ÿ\
expedition.clickSelectFleet = battle.selectFleet\
\
-- æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸\
expedition.isReadyBattlePageShipStatusAllRight = battle.isReadyBattlePageShipStatusAllRight\
\
-- æ£€æµ‹hpæ˜¯å¦å®‰å…¨\
expedition.isReadyBattlePageShipHPSafe = battle.isReadyBattlePageShipHPSafe\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™\
expedition.clickReadyBattlePageQuickSupplyBtn = battle.clickReadyBattlePageQuickSupplyBtn\
\
-- æ£€æµ‹å¿«é€Ÿè¡¥ç»™ç•Œé¢\
expedition.isQuickSupplyModal = battle.isQuickSupplyModal\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™ç¡®å®š\
expedition.clickReadyBattlePageQuickSupplyModalOkBtn = battle.clickReadyBattlePageQuickSupplyModalOkBtn\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­\
expedition.clickQuickSupplyModalCloseBtn = battle.clickQuickSupplyModalCloseBtn\
\
-- ç‚¹å‡»å¿«é€Ÿç»´ä¿®\
expedition.clickQuickRepairBtn = battle.clickQuickRepairBtn\
\
-- ç­‰å¾…å¿«é€Ÿç»´ä¿®ç•Œé¢\
expedition.isQuickRepairModal = battle.isQuickRepairModal\
\
-- ç‚¹å‡»å¿«é€Ÿç»´ä¿®ç¡®å®š\
expedition.clickQuickRepairModalOkBtn = battle.clickQuickRepairModalOkBtn\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­\
expedition.clickQuickRepairModalCloseBtn = battle.clickQuickRepairModalCloseBtn\
\
-- æ£€æµ‹å¿«é€Ÿä¿®ç†ç•Œé¢HPæ˜¯å¦å®‰å…¨ï¼Œæœ‰å‡ è‰˜èˆ¹éœ€è¦å¿«é€Ÿä¿®ç†\
expedition.isQuickRepairModalShipNeedRepair = battle.isQuickRepairModalShipNeedRepair\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å•ä¸ªèˆ¹\
expedition.clickQuickRepairModalSingleShip = battle.clickQuickRepairModalSingleShip\
\
-- æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾\
expedition.isFleetsCanBattle = battle.isFleetsCanBattle\
\
-- ç‚¹å‡»è¿”å›žè¿œå¾ç•Œé¢\
expedition.clickBackToExpedition = function()\
  tap(1812, 974, 100)\
  return true\
end\
\
-- ç‚¹å‡»è¿œå¾å¼€å§‹\
expedition.clickBattleStartBtn = battle.clickBattleStartBtn\
\
-- ç‚¹å‡»è¿”å›žæ¸¯å£\
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
-- ç‚¹å‡»å»ºé€ æŒ‰é’®\
disintegrateShip.clickBuildPageBtn = function()\
  tap(1235, 546, 100)\
  return true\
end\
\
--  æ˜¯å¦åœ¨å»ºé€ ç•Œé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
-- ç‚¹å‡»è§£ä½“æŒ‰é’®\
disintegrateShip.clickDisintegratePageBtn = function()\
  tap(102, 257, 100)\
  return true\
end\
\
--  æ˜¯å¦åœ¨è§£ä½“ç•Œé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
-- ç‚¹å‡»æ·»åŠ æŒ‰é’®\
disintegrateShip.clickAddShipBtn = function()\
  tap(392, 408, 100)\
  return true\
end\
\
--  æ˜¯å¦åœ¨è§£ä½“æ·»åŠ ç•Œé¢\
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
--  æ˜¯å¦æœ‰èˆ¹éœ€è¦è§£ä½“\
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
--  ç‚¹å‡»è¦è§£ä½“çš„èˆ¹\
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
--  ç‚¹å‡»ç¡®å®š\
disintegrateShip.selectAllShipClickOk = function()\
  tap(1812, 804, 100)\
end\
\
--  ç‚¹å‡»è¿”å›ž\
disintegrateShip.selectAllShipClickCancel = function()\
  tap(1810, 979, 100)\
end\
\
--  ç‚¹å‡»è§£ä½“\
disintegrateShip.clickDisintegrateShipBtn = function()\
  tap(1623, 869, 100)\
end\
\
--  æ£€æŸ¥æ˜¯å¦é€‰ä¸­å¸ä¸‹æ‰€æœ‰è£…å¤‡\
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
--  ç‚¹å‡»å¸ä¸‹æ‰€æœ‰è£…å¤‡\
disintegrateShip.clickRemoveAllEquipmentCheckbox = function()\
  tap(1031, 774, 100)\
end\
\
--  ç¨€æœ‰è§£ä½“ç¡®è®¤çª—å£\
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
--  ç‚¹å‡»è§£ä½“ç¡®è®¤çª—å£ç¡®å®š\
disintegrateShip.clickDisintegratePanelOkBtn = function()\
  tap(745, 713, 100)\
end\
\
--  è¿”å›žhome\
disintegrateShip.disintegrateShipPageClickBackToHome = function()\
  tap(103, 1007, 100)\
end\
\
return disintegrateShip\
" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/mission.lua"] = { path = "./meta-operation/mission.lua", name = "./meta-operation/mission.lua", source = "local mission = {}\
\
-- -- ä»»åŠ¡æµç¨‹\
\
-- æ˜¯å¦æœ‰æ²¡é¢†å–çš„ä»»åŠ¡\
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
-- ç‚¹å‡»ä»»åŠ¡æŒ‰é’®\
mission.clickMission = function()\
  tap(785, 1016, 100)\
end\
\
-- ç­‰å¾…ä»»åŠ¡ç•Œé¢\
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
-- ç‚¹å‡»å…¨éƒ¨ä»»åŠ¡æŒ‰é’®\
mission.clickAllMission = function()\
  tap(785, 1016, 100)\
end\
\
-- ç­‰å¾…å…¨éƒ¨ä»»åŠ¡ç•Œé¢\
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
-- æ£€æµ‹å…¨éƒ¨ä»»åŠ¡ç•Œé¢æ˜¯å¦æœ‰æœªé¢†å–çš„å¥–åŠ±\
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
-- ç‚¹å‡»é¢†å–ç¬¬ä¸€ä¸ªå¥–åŠ±\
mission.clickGetFirstReward = function()\
  tap(1755, 190, 100)\
end\
\
-- ç­‰å¾…èŽ·å¾—é¢æ¿\
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
-- ç‚¹å‡»èŽ·å¾—é¢æ¿ç¡®å®š\
mission.clickRewardPannelOk = function()\
  tap(955, 717, 100)\
end\
\
-- ç­‰å¾…æ–°èˆ¹\
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
-- ç‚¹å‡»æ–°èˆ¹\
mission.clickNewShip = function()\
  tap(972, 399, 100)\
end\
\
-- ç­‰å¾…æ–°èˆ¹é”å®šå¯¹è¯æ¡†\
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
-- èˆ¹é”å®šå¯¹è¯æ¡†ç‚¹å‡»ç¡®è®¤\
mission.clickNewShipPageLockModalOkBtn = function()\
  tap(741, 713, 100)\
end\
\
-- ç‚¹å‡»ä»»åŠ¡é¢æ¿çš„è¿”å›žæ¸¯å£\
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
--  æ˜¯å¦åœ¨å‡ºå¾ç•Œé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
-- ç‚¹å‡»å›žæ¸¯\
battle.clickBackToHomeBtn = function()\
  tap(98, 1016, 100)\
  return true\
end\
\
-- å‡ºå¾é¡µé¢\
\
--  æ˜¯å¦åœ¨å‡ºå¾çš„å‡ºå¾ç•Œé¢\
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
  -- å››ä¸ªæŒ‰é’®çš„é¢œè‰²\
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
-- ç‚¹å‡»å‡ºå¾\
battle.clickBattleBtn = function()\
  tap(101, 110, 100)\
  return true\
end\
\
-- ç§»åŠ¨åˆ°m-nç« èŠ‚\
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
  -- å…ˆç§»åˆ°ç¬¬ä¸€ç« \
  for i = 1, 12 do\
    tap(360, 958, 100)\
    mSleep(80)\
  end\
  -- å†ç§»åˆ°ç¬¬mç« \
  for i = 2, m do\
    tap(1827, 961, 100)\
    mSleep(500)\
  end\
  -- å…ˆç§»åˆ°ç¬¬ä¸€èŠ‚\
  for i = 1, 8 do\
    tap(256, 493, 100)\
    mSleep(80)\
  end\
  -- å†ç§»åˆ°ç¬¬nç« \
  for i = 2, n do\
    tap(1889, 485, 100)\
    mSleep(500)\
  end\
end\
\
-- ç‚¹å‡»å‡†å¤‡å‡ºå¾\
battle.clickReadyBattleBtn = function()\
  tap(1481, 729, 100)\
end\
\
-- ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢\
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
-- ç‚¹å‡»é€‰æ‹©èˆ°é˜Ÿ\
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
-- æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸\
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
-- æ£€æµ‹hpæ˜¯å¦å®‰å…¨\
battle.isReadyBattlePageShipHPSafe = function(checkLevel)\
  checkLevel = checkLevel or 1\
  -- checklevel = ä¸æ»¡è¡€ or ä¸­ç ´ or å¤§ç ´ or ä¸ä½¿ç”¨\
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
  -- æ»¡è¡€\
  local list23 = {\
    { 640, 600, 0x9cfb8c },\
    { 837, 600, 0x9cfb8c },\
    { 1034, 600, 0x9cfb8c },\
    { 1231, 600, 0x9cfb8c },\
    { 1428, 600, 0x9cfb8c },\
    { 1625, 600, 0x9cfb8c },\
  }\
  -- é»„è¡€ ä¸­ç ´\
  local list22 = {\
    { 1459, 599, 0xefdb21 },\
    { 1262, 599, 0xe6d719 },\
    { 1065, 599, 0xefdb21 },\
    { 868, 599, 0xe6d719 },\
    { 671, 599, 0xefdb21 },\
    { 474, 599, 0xe6d719 },\
  }\
  -- çº¢è¡€ å¤§ç ´\
  local list21 = {\
    { 474, 600, 0xef1010 },\
    { 671, 600, 0xe61010 },\
    { 868, 600, 0xef1010 },\
    { 1065, 600, 0xe61010 },\
    { 1262, 600, 0xef1010 },\
    { 1459, 600, 0xe61010 },\
  }\
  if (checkLevel == 3) then\
    -- æœ‰ä¸æ»¡è¡€\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and (not multiColorS({ list23[i] }, 80))) then\
        result = false\
        break\
      end\
    end\
  elseif (checkLevel == 2) then\
    -- æœ‰ä¸­ç ´æˆ–å¤§ç ´\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and (multiColorS({ list22[i] }, 80) or multiColorS({ list21[i] }, 80))) then\
        result = false\
        break\
      end\
    end\
  elseif (checkLevel == 1) then\
    -- æœ‰å¤§ç ´\
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
-- ä¸æ»¡è¡€ï¼Œè¿”å›žå‡ºå¾\
battle.clickReadyBattlePageBackBtn = function()\
  tap(1814, 974, 100)\
end\
\
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™\
battle.clickReadyBattlePageQuickSupplyBtn = function()\
  tap(1812, 109, 100)\
end\
\
-- ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢\
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
  -- å¸¦æ”¯æ´çš„å¿«é€Ÿè¡¥ç»™\
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
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™\
battle.clickReadyBattlePageQuickSupplyModalOkBtn = function()\
  tap(1310, 793, 100)\
end\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†\
battle.clickQuickRepairBtn = function()\
  tap(1813, 252, 100)\
end\
\
-- ç­‰å¾…å¿«é€Ÿä¿®ç†ç•Œé¢\
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
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†\
battle.clickQuickRepairModalOkBtn = function()\
  tap(1269, 785, 100)\
end\
\
-- æ£€æµ‹å¿«é€Ÿä¿®ç†ç•Œé¢HPæ˜¯å¦å®‰å…¨ï¼Œæœ‰å‡ è‰˜èˆ¹éœ€è¦å¿«é€Ÿä¿®ç†\
battle.isQuickRepairModalShipNeedRepair = function(checkLevel)\
  checkLevel = checkLevel or 1\
  -- checklevel = ä¸æ»¡è¡€ or ä¸­ç ´ or å¤§ç ´ or ä¸ä½¿ç”¨\
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
  -- æ»¡è¡€\
  local list23 = {\
    { 281, 621, 0x08ba08 },\
    { 478, 621, 0x08ba08 },\
    { 675, 621, 0x08ba08 },\
    { 872, 621, 0x08ba08 },\
    { 1069, 621, 0x08ba08 },\
    { 1266, 621, 0x08ba08 },\
  }\
  -- ä¸­ç ´\
  local list22 = {\
    { 281, 621, 0xbd8e08 },\
    { 477, 621, 0xbd8e08 },\
    { 674, 621, 0xbd8e08 },\
    { 871, 621, 0xbd8e08 },\
    { 1068, 621, 0xbd8e08 },\
    { 1265, 621, 0xbd8e08 },\
  }\
  -- å¤§ç ´\
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
    -- ä¸æ»¡è¡€\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and (not multiColorS({ list23[i] }, 80))) then\
        table.insert(result, i)\
      end\
    end\
  elseif (checkLevel == 2) then\
    -- æœ‰ä¸­ç ´æˆ–å¤§ç ´\
    for i = 1, #list do\
      if (multiColorS({ list[i] }, 80) and (multiColorS({ list22[i] }, 80) or multiColorS({ list21[i] }, 80))) then\
        table.insert(result, i)\
      end\
    end\
  elseif (checkLevel == 1) then\
    -- æœ‰å¤§ç ´\
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
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å•ä¸ªèˆ¹\
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
-- ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­\
battle.clickQuickSupplyModalCloseBtn = function()\
  tap(1473, 195, 100)\
end\
\
-- ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­\
battle.clickQuickRepairModalCloseBtn = battle.clickQuickSupplyModalCloseBtn\
\
-- æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾\
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
-- ç‚¹å‡»å‡ºå¾å¼€å§‹\
battle.clickBattleStartBtn = function()\
  tap(956, 987, 100)\
end\
\
-- ç­‰å¾…é¢å¤–èŽ·å¾—èµ„æºé¢æ¿\
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
-- ç‚¹å‡»é¢å¤–èŽ·å¾—ç¡®å®š\
battle.clickExtraReceiveModalOk = function()\
  tap(957, 715, 100)\
end\
\
-- ç­‰å¾…å¿«å¼€å§‹æˆ˜æ–—ç•Œé¢\
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
-- å¿«å¼€å§‹é¡µé¢èƒ½å¦è¿‚å›ž\
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
-- ç‚¹å‡»æˆ˜æœ¯è¿‚å›ž\
battle.clickBattleStartModalRoundaboutBtn = function()\
  tap(1251, 918, 100)\
end\
\
-- æ£€æµ‹æ•Œæ–¹é˜Ÿä¼æœ‰æ²¡æœ‰èˆªæ¯\
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
-- æ£€æµ‹æ•Œæ–¹é˜Ÿä¼æœ‰æ²¡æœ‰é›·å·¡\
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
-- æ£€æµ‹æ•Œæ–¹é˜Ÿä¼æœ‰æ²¡æœ‰æ½œè‰‡\
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
-- æ£€æµ‹æ•Œæ–¹é˜Ÿä¼æœ‰æ²¡æœ‰è¡¥ç»™\
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
-- ç‚¹å‡»å¼€å§‹æˆ˜æ–—\
battle.clickBattleStartModalStartBtn = function()\
  tap(1421, 919, 100)\
end\
\
-- ç‚¹å‡»è¿”å›žæ¸¯å£\
battle.clickBattleStartModalBackToHomeBtn = function()\
  tap(1650, 918, 100)\
end\
\
-- ç­‰å¾…é˜µåž‹ç•Œé¢\
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
-- ç‚¹å‡»é˜µåž‹\
battle.clickFormationPageStartBtn = function(formation)\
  formation = formation or 0\
  if (formation == 1) then\
    -- å•çºµ\
    tap(1553, 140, 100)\
  elseif (formation == 2) then\
    -- å¤çºµ\
    tap(1685, 344, 100)\
  elseif (formation == 3) then\
    -- è½®åž‹\
    tap(1760, 541, 100)\
  elseif (formation == 4) then\
    -- æ¢¯å½¢\
    tap(1684, 734, 100)\
  elseif (formation == 5) then\
    -- å•æ¨ª\
    tap(1553, 931, 100)\
  else\
    -- å¤çºµ\
    tap(1685, 344, 100)\
  end\
end\
\
-- ç­‰å¾…è¿½å‡»é¡µé¢\
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
    -- è¿½å‡»\
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
    -- æ”¾å¼ƒ\
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
-- ç‚¹å‡»è¿½å‡»\
battle.clickPursueModalOk = function()\
  tap(726, 746, 100)\
end\
\
-- ç‚¹å‡»æ”¾å¼ƒ\
battle.clickPursuePageCancel = function()\
  tap(1178, 754, 100)\
end\
\
-- ç­‰å¾…èƒœåˆ©ç•Œé¢\
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
-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹æ˜¯å¦å—æŸ\
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
-- èƒœåˆ©ç•Œé¢æ£€æµ‹èˆ¹HPæ˜¯å¦å®‰å…¨\
battle.isVictoryPageShipHPSafe = function(checkLevel)\
  checkLevel = checkLevel or 1\
  -- 'æœ‰ä¸­ç ´,æœ‰å¤§ç ´'\
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
    -- æœ‰ä¸­ç ´æˆ–è€…å¤§ç ´\
    local bigBreakList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(bigBreak)))\
    local middleBreakList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(middleBreak)))\
    if #bigBreakList > 0 or #middleBreakList > 0 then\
      result = false\
    end\
  elseif checkLevel == 1 then\
    -- æœ‰å¤§ç ´\
    local bigBreakList = ImgInfo.toPoint(findMultiColorInRegionFuzzyExt(table.unpack(bigBreak)))\
    if #bigBreakList > 0 then\
      result = false\
    end\
  end\
  if not __keepScreenState then keepScreen(false) end\
  return result\
end\
\
-- ç‚¹å‡»èƒœåˆ©ç»§ç»­\
battle.clickVictoryPageContinueBtn = function()\
  tap(1650, 1020, 100)\
end\
\
-- ç­‰å¾…èƒœåˆ©ç»§ç»­é¢æ¿\
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
-- ç‚¹å‡»èƒœåˆ©ç»§ç»­2\
battle.clickVictoryPageContinueBtn2 = function()\
  tap(1730, 993, 100)\
end\
\
-- ç­‰å¾…å¤§ç ´è­¦å‘Š\
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
-- å¤§ç ´è­¦å‘Šæ¡†ç‚¹å‡»å›žæ¸¯\
battle.clickShipSevereDamageModalBack = function()\
  tap(1182, 753, 100)\
end\
\
-- ç­‰å¾…æ— æ³•å‰è¿›è­¦å‘Šæ¡†\
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
    -- è¿”å›žæ¯æ¸¯æŒ‰é’®\
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
-- å—æŸè¿‡é‡è­¦å‘Šæ¡†ç‚¹å‡»å›žæ¸¯\
battle.clickShipCantGoOnModalBackBtn = function()\
  tap(1449, 825, 100)\
end\
\
-- ç­‰å¾…æ–°èˆ¹\
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
-- ç‚¹å‡»æ–°èˆ¹\
battle.clickNewShip = function()\
  tap(972, 399, 100)\
end\
\
-- ç­‰å¾…æ–°èˆ¹é”å®šå¯¹è¯æ¡†\
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
-- èˆ¹é”å®šå¯¹è¯æ¡†ç‚¹å‡»ç¡®è®¤\
battle.clickNewShipPageLockModalOkBtn = function()\
  tap(741, 713, 100)\
end\
\
-- ç­‰å¾…å‰è¿›å¯¹è¯æ¡†\
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
    -- å‰è¿›\
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
    -- å›žæ¸¯\
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
-- ç­‰å¾…å‰è¿›ç‚¹å‡»å‰è¿›\
battle.clickLevelStepModalContinueBtn = function()\
  tap(727, 751, 100)\
end\
\
-- ç­‰å¾…å‰è¿›ç‚¹å‡»å›žæ¸¯\
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
  error('SleepPromise need EventQuery module to work. Please require \\'EventQuery\\' as global variableÃŸ .', 2)\
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
    -- 5åˆ†é’Ÿç•Œé¢ä¸å˜åŒ–åˆ™é‡å¯æ¸¸æˆ\
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
-- å¯åŠ¨æ¸¸æˆ\
login.startApp = function()\
  if (isFrontApp(\"com.huanmeng.zhanjian2\") ~= 1) then\
    runApp(\"com.huanmeng.zhanjian2\")\
  end\
end\
\
-- é‡å¯æ¸¸æˆ\
login.restartApp = function()\
  closeApp(\"com.huanmeng.zhanjian2\")\
  mSleep(1000)\
  return runApp(\"com.huanmeng.zhanjian2\")\
end\
\
-- æ¸¸æˆæ­£åœ¨è¿è¡Œ\
login.isAppRunning = function()\
  if (isFrontApp(\"com.huanmeng.zhanjian2\") == 1) then\
    return true\
  end\
  return false\
end\
\
-- æ¸¸æˆä¸åœ¨è¿è¡Œ\
login.isAppNotRun = function()\
  if (isFrontApp(\"com.huanmeng.zhanjian2\") == 1) then\
    return false\
  end\
  return true\
end\
\
-- æ˜¯å¦åœ¨ç™»å½•ç•Œé¢\
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
-- ç‚¹å‡»ç™»å½•\
login.clickLoginBtn = function()\
  tap(1343, 701, 100)\
  return true\
end\
\
-- æ˜¯å¦åœ¨é€‰æ‹©æœåŠ¡å™¨ç•Œé¢\
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
-- ç‚¹å‡»ç™»å½•æœåŠ¡å™¨\
login.clickLoginServerBtn = function()\
  tap(953, 965, 100)\
  return true\
end\
\
return login" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/network.lua"] = { path = "./meta-operation/network.lua", name = "./meta-operation/network.lua", source = "local network = {}\
\
-- ç­‰å¾…ç½‘ç»œè¿žæŽ¥ä¸é€šå¯¹è¯æ¡†\
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
-- ç‚¹å‡»ç½‘ç»œä¸é€š ç¡®è®¤\
network.clickNetworkFailureModalOk = function()\
  tap(741, 717, 100)\
  return true\
end\
\
-- ç‚¹å‡»ç½‘ç»œä¸é€š å–æ¶ˆ\
network.clickNetworkFailureModalCancel = function()\
  tap(1174, 718, 100)\
  return true\
end\
\
-- ç­‰å¾…æ£€æŸ¥æ‚¨çš„ç½‘ç»œå¯¹è¯æ¡†\
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
-- ç‚¹å‡»æ£€æŸ¥æ‚¨çš„ç½‘ç»œå¯¹è¯æ¡† ç¡®è®¤\
network.clickCheckNetworkModalOk = function()\
  tap(951, 716, 100)\
  return true\
end\
\
return network" }


package.sourceCode = package.sourceCode or {}
package.sourceCode["./meta-operation/home.lua"] = { path = "./meta-operation/home.lua", name = "./meta-operation/home.lua", source = "local home = {}\
\
-- æ£€æµ‹ä¸»é¡µ\
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
-- ç­‰å¾…å¼¹å‡ºå‹‹ç« å¯¹è¯æ¡†\
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
    -- ç¡®è®¤\
    { 650, 685, 0x42caef }, { 692, 711, 0xffffff }, { 725, 711, 0x42616b }, { 753, 713, 0x42c2ef },\
    { 807, 699, 0x42c6ef }, { 842, 681, 0x42ceef }, { 832, 739, 0x0092bd }, { 724, 743, 0x008ebd },\
    -- å–æ¶ˆ\
    { 1078, 692, 0xce493a }, { 1106, 714, 0xc54131 }, { 1106, 747, 0xa41400 }, { 1206, 732, 0x6b868c },\
    { 1173, 707, 0xce453a }, { 1265, 684, 0xce493a }, { 1264, 733, 0xa41000 }, { 1246, 709, 0xc54131 },\
    { 1209, 710, 0x7b9294 },\
  }\
  local result = multiColorS(list)\
  if (not __keepScreenState) then keepScreen(false) end\
  return result\
end\
\
-- ç‚¹å‡»å‹‹ç« å–æ¶ˆ\
home.clickMedalModalCancelBtn = function()\
  tap(1169, 720, 100)\
end\
-- -- å‡ºå¾æµç¨‹\
-- æ˜¯å¦åœ¨ä¸»é¡µ\
\
\
-- ç‚¹å‡»å‡ºå¾\
home.clickBattleBtn = function()\
  tap(1440, 347, 100)\
  return true\
end\
\
\
\
-- æ£€æµ‹æš‚åœ\
home.isPause = function()\
  return isPause\
end\
\
-- æ£€æµ‹æ¢å¤\
home.isNotPause = function()\
  return not isPause\
end\
\
-- æ£€æµ‹æ–°é—»çª—å£\
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
-- ç‚¹å‡»æ–°é—» å–æ¶ˆ\
home.clickMewsModalClose = function()\
  tap(1876, 50, 100)\
  return true\
end\
\
-- ç­¾åˆ°çª—å£\
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
-- ç‚¹å‡»é¢†å–ç­¾åˆ°å¥–åŠ±\
home.clickSignModalGetReward = function()\
  tap(953, 872, 100)\
  return true\
end\
\
-- ç­¾åˆ°ç¡®è®¤çª—å£\
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
-- ç‚¹å‡»ç­¾åˆ°ç¡®è®¤çª—å£å…³é—­\
home.clickSignConfirmModalGetReward = function()\
  tap(961, 716, 100)\
  return true\
end\
\
-- ç‚¹å‡»é¢†å–ç­¾åˆ°å…³é—­\
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
      -- æ²¡æœ‰åˆ°æ£€æŸ¥æˆ˜å½¹çš„æ—¶é—´\
      if store.campaign.nextStartTime > os.time() then\
        stepLabel.setStepLabelContent('7-1.è·³è¿‡æˆ˜å½¹ï¼Œä¸‹æ¬¡æ£€æŸ¥æ—¶é—´ï¼š' .. os.date(\"%Y-%m-%d %H:%M:%S\", store.campaign.nextStartTime))\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
          { '', o.home.isHome }\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('7-2.ç­‰å¾…home')\
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
      -- å‡ºå¾åŽå°±åº”è¯¥éœ€è¦ç»´ä¿®\
      store.repair.nextRepairStartTime = os.time()\
\
      stepLabel.setStepLabelContent('7-3.ç‚¹å‡»å‡ºå¾')\
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
      stepLabel.setStepLabelContent('7-4.ç‚¹å‡»æˆ˜å½¹')\
      o.campaign.clickCampaignBtn()\
      stepLabel.setStepLabelContent('7-5.ç­‰å¾…æˆ˜å½¹é¡µé¢')\
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
      stepLabel.setStepLabelContent('7-6.ç§»åŠ¨åˆ°æˆ˜å½¹' .. settings.campaignChapter)\
      o.campaign.moveToCampaignMission(settings.campaignChapter)\
      c.yield(sleepPromise(300))\
      stepLabel.setStepLabelContent('7-7.ç‚¹å‡»æˆ˜å½¹')\
      o.campaign.clickCampainReadyBtn(settings.campaignDifficulty)\
      stepLabel.setStepLabelContent('7-8.ç­‰å¾…æˆ˜å½¹å‡†å¤‡ç•Œé¢')\
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
        stepLabel.setStepLabelContent('7-9.æ£€æµ‹æ‰€æœ‰çŠ¶æ€')\
        c.yield(sleepPromise(1000))\
        local res = o.campaign.isReadyBattlePageShipStatusAllRight()\
        if (not res) then\
          stepLabel.setStepLabelContent('7-10.çŠ¶æ€ä¸æ­£å¸¸')\
          o.campaign.clickReadyBattlePageQuickSupplyBtn()\
          stepLabel.setStepLabelContent('7-11.ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage, 2000 },\
            { 'CAMPAIGN_QUICK_SUPPLY_MODAL', o.campaign.isQuickSupplyModal },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('7-12.çŠ¶æ€æ­£å¸¸')\
          store.campaign.quickSupplyCount = store.campaign.quickSupplyCount + 1\
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE' }\
        end\
      elseif (store.campaign.quickRepairCount <= 0) then\
        stepLabel.setStepLabelContent('7-13.æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')\
        c.yield(sleepPromise(1000))\
        local res = o.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))\
        if (res) then\
          store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1\
          stepLabel.setStepLabelContent('7-14.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')\
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }\
        else\
          if (settings.campaignQuickRepair > 0) then\
            stepLabel.setStepLabelContent('7-15.è¡€é‡ä¸å®‰å…¨ï¼Œç‚¹å‡»å¿«ä¿®')\
            o.campaign.clickQuickRepairBtn()\
            stepLabel.setStepLabelContent('7-16.ç­‰å¾…å¿«ä¿®ç•Œé¢')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage, 2000 },\
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          else\
            stepLabel.setStepLabelContent('7-17.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')\
            return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }\
          end\
        end\
      else\
        stepLabel.setStepLabelContent('7-18.å†æ¬¡æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')\
        c.yield(sleepPromise(1000))\
        -- ä¸å…è®¸å¤§ç ´å‡ºå¾\
        local res = o.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('7-19.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')\
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('7-20.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')\
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }\
        end\
      end\
\
    elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL') then\
\
      stepLabel.setStepLabelContent('7-22.å¿«é€Ÿè¡¥ç»™ç•Œé¢ç‚¹å‡»ç¡®å®š')\
      o.campaign.clickReadyBattlePageQuickSupplyModalOkBtn()\
      stepLabel.setStepLabelContent('7-23.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
      store.campaign.quickSupplyCount = store.campaign.quickSupplyCount + 1\
      if (store.campaign.quickSupplyCount < 3) then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
          { 'CAMPAIGN_QUICK_SUPPLY_MODAL', o.campaign.isQuickSupplyModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('7-24.èµ„æºæ•°é‡ä¸è¶³')\
        return { type = 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE' }\
      end\
\
    elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('7-25.ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­')\
      c.yield(sleepPromise(100))\
      o.campaign.clickQuickSupplyModalCloseBtn()\
      stepLabel.setStepLabelContent('7-26.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
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
        stepLabel.setStepLabelContent('7-27.ç‚¹å‡»å¿«é€Ÿä¿®ç†ç¡®å®š')\
        o.campaign.clickQuickRepairModalOkBtn()\
        store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1\
        stepLabel.setStepLabelContent('7-28.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
        if (store.campaign.quickRepairCount < 3) then\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
            { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('7-29.å¿«ä¿®æ•°é‡ä¸è¶³')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.campaignQuickRepair == 2) then\
        -- ä¸­ç ´æˆ–å¤§ç ´å¿«ä¿®\
        stepLabel.setStepLabelContent('7-30.å¯»æ‰¾ä¸­ç ´æˆ–å¤§ç ´çš„èˆ¹')\
        c.yield(sleepPromise(1000))\
        local res = o.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)\
        if (#res > 0) then\
          if ((store.campaign.quickRepairSingleLastShip ~= res[1]) or (store.campaign.quickRepairSingleCount < 3)) then\
            store.campaign.quickRepairSingleLastShip = res[1]\
            store.campaign.quickRepairSingleCount = store.campaign.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('7-31.ä¸­ç ´æˆ–å¤§ç ´:' .. table.concat(res, ','))\
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
            stepLabel.setStepLabelContent('7-32.å¿«ä¿®æ•°é‡ä¸è¶³')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('7-33.ä¿®ç†å®Œæˆ')\
          store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.campaignQuickRepair == 1) then\
        -- å¤§ç ´å¿«ä¿®\
        stepLabel.setStepLabelContent('7-34.å¯»æ‰¾å¤§ç ´çš„èˆ¹')\
\
        c.yield(sleepPromise(500))\
        local res = o.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)\
        if (#res > 0) then\
          if ((store.campaign.quickRepairSingleLastShip ~= res[1]) or (store.campaign.quickRepairSingleCount < 3)) then\
            store.campaign.quickRepairSingleLastShip = res[1]\
            store.campaign.quickRepairSingleCount = store.campaign.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('7-35.å¤§ç ´:' .. table.concat(res, ','))\
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
            stepLabel.setStepLabelContent('7-36.å¿«ä¿®æ•°é‡ä¸è¶³')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },\
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('7-37.ä¿®ç†å®Œæˆ')\
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
      stepLabel.setStepLabelContent('7-38.ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­')\
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
      stepLabel.setStepLabelContent('7-39.å‡ºå¾å‡†å¤‡ç•Œé¢å‡ºå¾å¼€å§‹')\
      c.yield(sleepPromise(100))\
      o.campaign.clickBattleStartBtn()\
      -- å¦‚æžœæ²¡æœ‰å¼€å§‹è¯´æ˜Žæ— æ³•æˆ˜å½¹\
\
      return makeAction('CAMPAIGN_GO_A_EXERCISE')\
\
    elseif (action.type == 'CAMPAIGN_GO_A_EXERCISE') then\
\
      stepLabel.setStepLabelContent('7-40.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢ï¼Œ...')\
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
      stepLabel.setStepLabelContent('7-41.å¼€å§‹é¢æ¿ï¼Œç‚¹å‡»å¼€å§‹')\
      c.yield(sleepPromise(100))\
      o.campaign.clickBattleStartModalStartBtn()\
      stepLabel.setStepLabelContent('7-42.ç­‰å¾…é˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')\
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
      stepLabel.setStepLabelContent('7-43.é˜µåž‹é¢æ¿')\
      c.yield(sleepPromise(100))\
      o.campaign.clickFormationPageStartBtn(settings.exerciseFormation)\
      stepLabel.setStepLabelContent('7-44.ç­‰å¾…è¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')\
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
      stepLabel.setStepLabelContent('7-45.è¿½å‡»é¢æ¿')\
      c.yield(sleepPromise(100))\
      if (settings.exercisePursue) then\
        stepLabel.setStepLabelContent('7-46.è¿½å‡»')\
        o.campaign.clickPursueModalOk()\
      else\
        stepLabel.setStepLabelContent('7-47.æ”¾å¼ƒè¿½å‡»')\
        o.campaign.clickPursuePageCancel()\
      end\
      stepLabel.setStepLabelContent('7-48.ç­‰å¾…èƒœåˆ©ç•Œé¢')\
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
      stepLabel.setStepLabelContent('7-49.ç‚¹å‡»èƒœåˆ©ç»§ç»­')\
      o.campaign.clickVictoryPageContinueBtn()\
      stepLabel.setStepLabelContent('7-50.ç­‰å¾…èƒœåˆ©ç»§ç»­ç•Œé¢')\
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
      stepLabel.setStepLabelContent('7-51.ç‚¹å‡»èƒœåˆ©ç»§ç»­')\
      o.campaign.clickVictoryPageContinueBtn2()\
      stepLabel.setStepLabelContent('7-52.ç­‰å¾…æ¼”ä¹ ç•Œé¢')\
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
      -- æç¤ºä¸èƒ½æˆ˜å½¹\
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
            datestr .. '  ' .. getDeviceModel() .. '  ' .. 'æˆ˜å½¹å¤±è´¥')\
        end\
      end\
\
      -- è®¾ç½®ä¸‹ä¸€æ¬¡æ£€æŸ¥æˆ˜å½¹çš„æ—¶é—´\
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
      stepLabel.setStepLabelContent(\"7-53.ç­‰å¾…å‡ºå¾ç•Œé¢\")\
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
      stepLabel.setStepLabelContent('7-54.ç‚¹å‡»å›žæ¸¯')\
      o.campaign.clickBackToHomeBtn()\
      stepLabel.setStepLabelContent('7-55.ç­‰å¾…home')\
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
      -- æ²¡æœ‰åˆ°æ£€æŸ¥æ¼”ä¹ çš„æ—¶é—´\
      if store.exercise.nextStartTime > os.time() then\
        stepLabel.setStepLabelContent('6-1.è·³è¿‡æ¼”ä¹ ï¼Œä¸‹æ¬¡æ£€æŸ¥æ—¶é—´ï¼š' .. os.date(\"%Y-%m-%d %H:%M:%S\", store.exercise.nextStartTime))\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { '', o.home.isHome, 1000 }\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('6-2.ç­‰å¾…home')\
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
      stepLabel.setStepLabelContent('6-3.ç‚¹å‡»å‡ºå¾')\
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
      stepLabel.setStepLabelContent('6-4.ç‚¹å‡»æ¼”ä¹ ')\
      o.exercise.clickExerciseBtn()\
      stepLabel.setStepLabelContent('6-5.ç­‰å¾…æ¼”ä¹ é¡µé¢')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_INIT', o.home.isHome },\
        { 'EXERCISE_BATTLE_PAGE', o.exercise.isBattlePage, 2000 },\
        { 'EXERCISE_EXERCISE_PAGE', o.exercise.isExercisePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_EXERCISE_PAGE') then\
\
      stepLabel.setStepLabelContent('6-6.å¯»æ‰¾æ¼”ä¹ å¯¹æ‰‹')\
      local res, exeList = o.exercise.isExercisePageHaveExercise()\
      local nBtn = exeList[1]\
      if (type(nBtn) ~= 'nil') then\
        stepLabel.setStepLabelContent('6-7.å‘çŽ°æ¼”ä¹ å¯¹æ‰‹' .. nBtn)\
        o.exercise.clickToNExerciseBtn(nBtn)\
        stepLabel.setStepLabelContent('6-8.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXERCISE_BATTLE_PAGE', o.exercise.isBattlePage, 2000 },\
          { 'EXERCISE_EXERCISE_PAGE', o.exercise.isExercisePage, 2000 },\
          { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('6-9.æ²¡æœ‰å¯ä»¥æŒ‘æˆ˜çš„äºº')\
\
        -- è®¾ç½®ä¸‹ä¸€æ¬¡æ¼”ä¹ æ£€æŸ¥æ—¶é—´\
        store.exercise.nextStartTime = os.time() + settings.exerciseInterval\
\
        return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }\
      end\
\
    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE') then\
\
      if ((store.exercise.quickSupplyCount <= 0) and (store.exercise.quickRepairCount <= 0)) then\
        stepLabel.setStepLabelContent('6-10.é€‰æ‹©èˆ°é˜Ÿ:' .. settings.exerciseFleet)\
        o.exercise.selectFleet(settings.exerciseFleet)\
        stepLabel.setStepLabelContent('6-11æ£€æµ‹æ‰€æœ‰çŠ¶æ€')\
        c.yield(sleepPromise(1000))\
        local res = o.exercise.isReadyBattlePageShipStatusAllRight()\
        if (res) then\
          stepLabel.setStepLabelContent('6-12.çŠ¶æ€æ­£å¸¸')\
          store.exercise.quickSupplyCount = 1\
          store.exercise.quickRepairCount = 1\
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('6-13.çŠ¶æ€ä¸æ­£å¸¸')\
          o.exercise.clickReadyBattlePageQuickSupplyBtn()\
          stepLabel.setStepLabelContent('6-14.ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage, 2000 },\
            { 'EXERCISE_QUICK_SUPPLY_MODAL', o.exercise.isQuickSupplyModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
      elseif (store.exercise.quickRepairCount <= 0) then\
        stepLabel.setStepLabelContent('6-15.æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')\
        c.yield(sleepPromise(1000))\
        local res = o.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('6-16.è¡€é‡å®‰å…¨')\
          store.exercise.quickRepairCount = 1\
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          if (settings.exerciseQuickRepair > 0) then\
            stepLabel.setStepLabelContent('6-17.è¡€é‡ä¸å®‰å…¨ï¼Œç‚¹å‡»å¿«ä¿®')\
            o.exercise.clickQuickRepairBtn()\
            stepLabel.setStepLabelContent('6-18.ç­‰å¾…å¿«ä¿®ç•Œé¢')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage, 2000 },\
              { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          else\
            stepLabel.setStepLabelContent('6-19.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')\
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }\
          end\
        end\
      else\
        stepLabel.setStepLabelContent('6-20.å†æ¬¡æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')\
        c.yield(sleepPromise(1000))\
        -- ä¸å…è®¸å¤§ç ´å‡ºå¾\
        local res = o.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('6-21.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')\
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('6-22.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')\
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }\
        end\
      end\
\
    elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL') then\
\
      stepLabel.setStepLabelContent('6-23å¿«é€Ÿè¡¥ç»™ç•Œé¢ç‚¹å‡»ç¡®å®š')\
      o.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()\
      stepLabel.setStepLabelContent('6-24.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
      store.exercise.quickSupplyCount = store.exercise.quickSupplyCount + 1\
      if (store.exercise.quickSupplyCount < 3) then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
          { 'EXERCISE_QUICK_SUPPLY_MODAL', o.exercise.isQuickSupplyModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('6-25.èµ„æºæ•°é‡ä¸è¶³')\
        return { type = 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE' }\
      end\
\
    elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('6-26.ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­')\
      c.yield(sleepPromise(100))\
      o.exercise.clickQuickSupplyModalCloseBtn()\
      stepLabel.setStepLabelContent('6-27.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
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
        -- ä¸æ»¡è¡€åˆ™å¿«ä¿®\
        stepLabel.setStepLabelContent('6-28.ç‚¹å‡»å¿«é€Ÿä¿®ç†ç¡®å®š')\
        c.yield(sleepPromise(500))\
        o.exercise.clickQuickRepairModalOkBtn()\
        store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1\
        stepLabel.setStepLabelContent('6-29.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
        if (store.exercise.quickRepairCount < 3) then\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
            { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('6-30.å¿«é€Ÿä¿®ç†æ•°é‡ä¸è¶³')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickSupplyModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.exerciseQuickRepair == 2) then\
        -- ä¸­ç ´æˆ–å¤§ç ´å¿«ä¿®\
        stepLabel.setStepLabelContent('6-31.å¯»æ‰¾ä¸­ç ´æˆ–å¤§ç ´çš„èˆ¹')\
        c.yield(sleepPromise(1000))\
        local res = o.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)\
        if (#res > 0) then\
\
          if ((store.exercise.quickRepairSingleLastShip ~= res[1]) or (store.exercise.quickRepairSingleCount < 3)) then\
            store.exercise.quickRepairSingleLastShip = res[1]\
            store.exercise.quickRepairSingleCount = store.exercise.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('6-32.ä¸­ç ´æˆ–å¤§ç ´:' .. table.concat(res, ','))\
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
            stepLabel.setStepLabelContent('6-33å¿«ä¿®æ•°é‡ä¸è¶³')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
              { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickSupplyModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('6-34.ä¿®ç†å®Œæˆ')\
          store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.exerciseQuickRepair == 1) then\
        -- å¤§ç ´å¿«ä¿®\
        stepLabel.setStepLabelContent('6-35.å¯»æ‰¾å¤§ç ´çš„èˆ¹')\
        c.yield(sleepPromise(1000))\
        local res = o.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)\
        if (#res > 0) then\
          if ((store.exercise.quickRepairSingleLastShip ~= res[1]) or (store.exercise.quickRepairSingleCount < 3)) then\
            store.exercise.quickRepairSingleLastShip = res[1]\
            store.exercise.quickRepairSingleCount = store.exercise.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('6-36.å¤§ç ´:' .. table.concat(res, ','))\
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
            stepLabel.setStepLabelContent('6-37.å¿«ä¿®æ•°é‡ä¸è¶³')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
              { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickSupplyModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('6-38ä¿®ç†å®Œæˆ')\
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
      stepLabel.setStepLabelContent('6-39ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­')\
      c.yield(sleepPromise(500))\
      o.exercise.clickQuickRepairModalCloseBtn()\
      c.yield(sleepPromise(300))\
      stepLabel.setStepLabelContent('6-40.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickRepairModal, 2000 },\
        { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO') then\
\
      stepLabel.setStepLabelContent('6-41.æ£€æµ‹èˆ°é˜Ÿæ˜¯å¦å¯ä»¥å‡ºå¾')\
      c.yield(sleepPromise(300))\
      local fleetCanBattle = o.exercise.isFleetsCanBattle()\
      if (not fleetCanBattle) then\
\
        stepLabel.setStepLabelContent('6-42.èˆ°é˜Ÿæ— æ³•æˆ˜æ–—')\
        return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }\
      else\
        return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }\
      end\
\
    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CAN_GO') then\
\
      stepLabel.setStepLabelContent('6-43.å‡ºå¾å‡†å¤‡ç•Œé¢å‡ºå¾å¼€å§‹')\
      c.yield(sleepPromise(100))\
      o.exercise.clickBattleStartBtn()\
      return { type = 'EXERCISE_GO_A_EXERCISE' }\
\
    elseif (action.type == 'EXERCISE_GO_A_EXERCISE') then\
\
      stepLabel.setStepLabelContent('6-44.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢ï¼Œ...')\
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
      stepLabel.setStepLabelContent('6-45.å¼€å§‹é¢æ¿ï¼Œç‚¹å‡»å¼€å§‹')\
      c.yield(sleepPromise(100))\
      o.exercise.clickBattleStartModalStartBtn()\
      stepLabel.setStepLabelContent('6-46ç­‰å¾…é˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')\
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
      stepLabel.setStepLabelContent('6-47.é˜µåž‹é¢æ¿')\
      c.yield(sleepPromise(100))\
      o.exercise.clickFormationPageStartBtn(settings.exerciseFormation)\
      stepLabel.setStepLabelContent('6-48.ç­‰å¾…è¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')\
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
      stepLabel.setStepLabelContent('6-49.è¿½å‡»é¢æ¿')\
      c.yield(sleepPromise(100))\
      if (settings.exercisePursue) then\
        stepLabel.setStepLabelContent('6-50.è¿½å‡»')\
        o.exercise.clickPursueModalOk()\
      else\
        stepLabel.setStepLabelContent('6-51.æ”¾å¼ƒè¿½å‡»')\
        o.exercise.clickPursuePageCancel()\
      end\
      stepLabel.setStepLabelContent('6-52.ç­‰å¾…èƒœåˆ©ç•Œé¢')\
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
      stepLabel.setStepLabelContent('6-53.ç‚¹å‡»èƒœåˆ©ç»§ç»­')\
      o.exercise.clickVictoryPageContinueBtn()\
      stepLabel.setStepLabelContent('6-54.ç­‰å¾…èƒœåˆ©ç»§ç»­ç•Œé¢')\
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
      stepLabel.setStepLabelContent('6-55ç‚¹å‡»èƒœåˆ©ç»§ç»­')\
      o.exercise.clickVictoryPageContinueBtn2()\
      stepLabel.setStepLabelContent('6-56.ç­‰å¾…æ¼”ä¹ ç•Œé¢')\
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
      stepLabel.setStepLabelContent(\"6-57ç­‰å¾…å‡ºå¾ç•Œé¢\")\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isReadyBattlePage, 2000 },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage },\
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME') then\
\
      stepLabel.setStepLabelContent('6-58.ç‚¹å‡»å›žæ¸¯')\
      o.exercise.clickBackToHomeBtn()\
      stepLabel.setStepLabelContent('6-59.ç­‰å¾…home')\
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
      -- ç»´ä¿®æ»‘åŠ¨ç•Œé¢æ¬¡æ•°\
      store.repair.moveCount = 4\
\
      if store.repair.nextRepairStartTime > os.time() then\
        stepLabel.setStepLabelContent('5-1.è·³è¿‡ç»´ä¿®ï¼Œè¿”å›žæ¸¯å£')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener()), {\
          { '', o.home.isHome }\
        })\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('5-1.ç­‰å¾…HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'REPAIR_INIT', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'REPAIR_INIT') then\
\
      store.repair.slot = nil\
\
      stepLabel.setStepLabelContent('5-2.ç‚¹å‡»å‡ºå¾')\
      c.yield(sleepPromise(100))\
      o.repair.clickDockBtn()\
      stepLabel.setStepLabelContent('5-3.ç­‰å¾…èˆ¹åžç•Œé¢')\
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
      stepLabel.setStepLabelContent('5-4.ç‚¹å‡»ä¿®ç†æŒ‰é’®')\
      c.yield(sleepPromise(100))\
      o.repair.clickRepairBtn()\
      stepLabel.setStepLabelContent('5-5.ç­‰å¾…ä¿®ç†ç•Œé¢')\
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
        stepLabel.setStepLabelContent('5-6.æ£€æµ‹ç©ºé—²æ§½ä½')\
        c.yield(sleepPromise(500))\
        local res, hasList = o.repair.hasEmptyRepairSlot()\
        if (res) then\
          store.repair.slot = hasList[1]\
          stepLabel.setStepLabelContent('5-7.æœ‰ç©ºé—²æ§½ä½')\
          stepLabel.setStepLabelContent('5-8.ç‚¹å‡»ç¬¬' .. store.repair.slot .. 'ä¸ªç©ºé—²æ§½ä½')\
          c.yield(sleepPromise(100))\
          o.repair.clickRepairSlotBtn(store.repair.slot)\
          c.yield(sleepPromise(100))\
          stepLabel.setStepLabelContent('5-9.æ£€æµ‹ä¿®ç†ç•Œé¢ï¼Œé€‰èˆ¹ç•Œé¢')\
\
          -- å¦‚æžœä¸€æ²¡è¿›å…¥ä¿®èˆ¹é€‰èˆ¹é¡µé¢è¯´æ˜Žæ²¡æœ‰éœ€è¦ç»´ä¿®çš„èˆ¹\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
            { 'REPAIR_SELECT_SHIP_PAGE', o.repair.isSelectShipPage },\
            { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage, 3000 },\
          }))\
\
          if (newstateTypes == 'REPAIR_REPAIR_FINISH') then\
            store.repair.nextRepairStartTime = os.time() + 1800\
            stepLabel.setStepLabelContent('5-10.æ²¡æœ‰èˆ¹éœ€è¦ç»´ä¿®')\
          end\
\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('5-11.æ²¡æœ‰ç©ºä½')\
          store.repair.nextRepairStartTime = os.time()\
\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
            { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage },\
          }))\
          return makeAction(newstateTypes)\
        end\
      else\
        stepLabel.setStepLabelContent('5-12.ç»´ä¿®å‡ºçŽ°æ„å¤–')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
    elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then\
\
      if (settings.repairAll) then\
        stepLabel.setStepLabelContent('5-13.é€‰æ‹©ç¬¬ä¸€ä¸ªèˆ¹')\
        c.yield(sleepPromise(200))\
        o.repair.clickFirstShip()\
\
        store.repair.repairNum = store.repair.repairNum + 1\
        stepLabel.setStepLabelContent('5-14.ç­‰å¾…è¿”å›žä¿®ç†ç•Œé¢')\
\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', o.repair.isRepairPage },\
          { 'REPAIR_SELECT_SHIP_PAGE', o.repair.isSelectShipPage, 2000 },\
        }))\
\
        return makeAction(newstateTypes)\
      else\
        if (store.repair.moveCount > 0) then\
          stepLabel.setStepLabelContent('5-15.å¯»æ‰¾ä¸€ä¸ªä¸åœ¨èˆ°é˜Ÿé‡Œçš„èˆ¹')\
          c.yield(sleepPromise(600))\
          local point = o.repair.findFirstShipNotInFleet()\
          if (point) then\
            stepLabel.setStepLabelContent('5-16.æ‰¾åˆ° [' .. point[1] .. ',' .. point[2] .. ']ï¼Œç‚¹å‡»')\
            o.repair.clickAShip(point)\
            store.repair.repairNum = store.repair.repairNum + 1\
          else\
            -- æ²¡æ‰¾åˆ°ç‚¹ï¼Œç§»åŠ¨ä¸€æ¬¡\
            stepLabel.setStepLabelContent('5-17.æ£€æµ‹æ˜¯å¦éœ€è¦å‘å·¦æ»‘åŠ¨')\
            local needMove = o.repair.isNeedMoveToNextPage();\
            if needMove then\
              stepLabel.setStepLabelContent('5-18.å‘å·¦æ»‘ä¸€æ¬¡')\
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
              stepLabel.setStepLabelContent('5-19.ä¸éœ€è¦å‘å·¦æ»‘')\
              store.repair.moveCount = 0\
            end\
          end\
        end\
\
        stepLabel.setStepLabelContent('5-20.ç­‰å¾…è¿”å›žä¿®ç†ç•Œé¢')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', o.repair.isRepairPage },\
          { 'REPAIR_SELECT_SHIP_PAGE_RETURN', o.repair.isSelectShipPage, 2000 },\
        }))\
\
        if (newstateTypes == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then\
          store.repair.nextRepairStartTime = os.time() + 1800\
          stepLabel.setStepLabelContent('5-21.æ²¡æœ‰éœ€è¦ä¿®ç†çš„èˆ¹')\
        end\
\
        return makeAction(newstateTypes)\
      end\
\
    elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then\
\
      stepLabel.setStepLabelContent('5-22.ç­‰å¾…ç¬¬' .. store.repair.slot .. 'ä¸ªæ§½ä½å˜æˆä¿®ç†çŠ¶æ€')\
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
      stepLabel.setStepLabelContent('5-23.æ²¡æœ‰å¯ä»¥ä¿®çš„èˆ¹ï¼Œè¿”å›žç»´ä¿®é¡µé¢')\
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
      stepLabel.setStepLabelContent('5-24.å®Œæˆç»´ä¿®')\
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
        stepLabel.setStepLabelContent('4-18.è·³è¿‡è¿œå¾æ´¾é£ï¼Œè¿”å›žæ¸¯å£')\
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
        stepLabel.setStepLabelContent('4-18.æ²¡æœ‰è¿œå¾ä»»åŠ¡ï¼è¿”å›žæ¸¯å£')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('4-16.ç­‰å¾…HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_INIT', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_INIT') then\
      stepLabel.setStepLabelContent('4-17.å‡†å¤‡è¿œå¾æ´¾é£èˆ°é˜Ÿ')\
      -- å‡†å¤‡å¼€å§‹è¿œå¾æ´¾é£èˆ°é˜Ÿä»»åŠ¡\
\
      -- å°†å‡ºå¾æ´¾é£åˆ—è¡¨å¤åˆ¶åˆ°ç¼“å­˜ä¸­\
      store.expedition.expeditionFleetToChapter = {}\
      for k = 1, #settings.expeditionFleetToChapter do\
        local v = settings.expeditionFleetToChapter[k]\
        if (v) then\
          table.insert(store.expedition.expeditionFleetToChapter, { k, v })\
        end\
      end\
\
\
      -- æ­¤ä»»åŠ¡ä½¿ç”¨çš„å˜é‡æ¢å¤é»˜è®¤å€¼\
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
      stepLabel.setStepLabelContent('4-19.ç‚¹å‡»å‡ºå¾')\
      o.expedition.clickBattle()\
      stepLabel.setStepLabelContent('4-20.ç­‰å¾…å‡ºå¾ç•Œé¢')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_INIT', o.home.isHome, 2000 },\
        { 'EXPEDITION_IS_BATTLE_PAGE', o.expedition.isBattlePage },\
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then\
      -- è¿›å…¥å‡ºå¾å¤§é¡µé¢\
      stepLabel.setStepLabelContent('4-21.ç‚¹å‡»è¿œå¾')\
      o.expedition.clickExpedition()\
      stepLabel.setStepLabelContent('4-22.ç­‰å¾…è¿œå¾ç•Œé¢')\
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
      -- è¿›å…¥è¿œå¾é¡µé¢\
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
          stepLabel.setStepLabelContent('4-21.ç§»åŠ¨åˆ°ç¬¬' .. chapter .. 'ç« ')\
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
        stepLabel.setStepLabelContent('4-27.æ²¡æœ‰è¿œå¾')\
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
        stepLabel.setStepLabelContent('4-23.æ£€æµ‹ç¬¬' .. section .. 'èŠ‚èƒ½å¦è¿œå¾')\
        local res = o.expedition.isChapterCanExpedition(section)\
        if (res) then\
          stepLabel.setStepLabelContent('4-24.ç‚¹å‡»æŒ‰é’®' .. section)\
          o.expedition.clickExpeditionBtn(section)\
          stepLabel.setStepLabelContent('4-25.ç­‰å¾…è¿œå¾å‡†å¤‡ç•Œé¢')\
\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_EXPEDITION_PAGE_CLICK_START_EXPEDITION_BTN', o.expedition.isBattleExpedition, 2000 },\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('4-26.æœ¬ç« ä¸èƒ½è¿œå¾')\
          -- æ‰§è¡Œä¸‹ä¸€ä¸ªç« èŠ‚\
          table.remove(store.expedition.expeditionFleetToChapter, 1)\
          return makeAction('EXPEDITION_IS_EXPEDITION_PAGE')\
        end\
      else\
        stepLabel.setStepLabelContent('4-27.æ²¡æœ‰è¿œå¾')\
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
        -- è¿˜æ²¡å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®\
        stepLabel.setStepLabelContent('4-28.é€‰æ‹©èˆ°é˜Ÿ' .. store.expedition.fleet)\
        o.expedition.clickSelectFleet(store.expedition.fleet)\
        stepLabel.setStepLabelContent('4-29.æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸')\
        c.yield(sleepPromise(500))\
        -- æ£€æµ‹èˆ°é˜Ÿæ˜¯å¦åœ¨æœ€ä½³çŠ¶æ€\
        local res = o.expedition.isReadyBattlePageShipStatusAllRight()\
        if (res) then\
          stepLabel.setStepLabelContent('4-30.çŠ¶æ€æ­£å¸¸')\
          store.expedition.quickSupplyCount = 1\
          store.expedition.quickRepairCount = 1\
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('4-31.çŠ¶æ€ä¸æ­£å¸¸')\
          o.expedition.clickReadyBattlePageQuickSupplyBtn()\
          stepLabel.setStepLabelContent('4-32.ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_QUICK_SUPPLY_MODAL', o.expedition.isQuickSupplyModal },\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        end\
      elseif (store.expedition.quickRepairCount <= 0) then\
        -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®\
        stepLabel.setStepLabelContent('4-33.æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')\
        c.yield(sleepPromise(1000))\
        local res = o.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('4-34.è¡€é‡å®‰å…¨')\
          store.expedition.quickRepairCount = 1\
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          if (settings.expeditionQuickRepair > 0) then\
            stepLabel.setStepLabelContent('4-35.è¡€é‡ä¸å®‰å…¨ï¼Œå¿«ä¿®')\
            o.expedition.clickQuickRepairBtn()\
            stepLabel.setStepLabelContent('4-36.ç­‰å¾…å¿«é€Ÿä¿®ç†ç•Œé¢')\
\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal },\
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage, 2000 },\
            }))\
\
            return makeAction(newstateTypes)\
          else\
            stepLabel.setStepLabelContent('4-37.è¡€é‡ä¸å®‰å…¨')\
            store.expedition.quickRepairCount = 1\
            return { type = 'EXPEDITION_READY_BATTLE_PAGE' }\
          end\
        end\
      else\
        -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œå·²ç»ç»´ä¿®\
        stepLabel.setStepLabelContent('4-38.å†æ¬¡æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')\
        c.yield(sleepPromise(500))\
        -- ä¸å…è®¸å¤§ç ´å‡ºå¾\
        local res = o.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('4-39.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')\
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('4-40.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')\
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO' }\
        end\
      end\
\
    elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL') then\
      -- å¿«é€Ÿè¡¥ç»™ç•Œé¢\
      stepLabel.setStepLabelContent('4-41.å¿«é€Ÿè¡¥ç»™ç•Œé¢ç‚¹å‡»ç¡®å®š')\
      o.expedition.clickReadyBattlePageQuickSupplyModalOkBtn()\
      stepLabel.setStepLabelContent('4-42.ç­‰å¾…è¿œå¾å‡†å¤‡ç•Œé¢')\
      store.expedition.quickSupplyCount = store.expedition.quickSupplyCount + 1\
      if (store.expedition.quickSupplyCount < 3) then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXPEDITION_QUICK_SUPPLY_MODAL', o.expedition.isQuickSupplyModal, 2000 },\
          { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('4-43.èµ„æºæ•°é‡ä¸è¶³')\
        return { type = 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE' }\
      end\
\
    elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('4-44.ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­')\
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
        -- ä¸æ»¡è¡€åˆ™å¿«ä¿®\
        stepLabel.setStepLabelContent('4-45.ç‚¹å‡»å¿«é€Ÿä¿®ç†ç¡®å®š')\
        c.yield(sleepPromise(500))\
        o.expedition.clickQuickRepairModalOkBtn()\
        store.expedition.quickRepairCount = store.expedition.quickRepairCount + 1\
        stepLabel.setStepLabelContent('4-46.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
        if (store.expedition.quickRepairCount < 3) then\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
            { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('4-47.å¿«ä¿®æ•°é‡ä¸è¶³')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.expeditionQuickRepair == 2) then\
        -- ä¸­ç ´æˆ–å¤§ç ´å¿«ä¿®\
        stepLabel.setStepLabelContent('4-48.å¯»æ‰¾ä¸­ç ´æˆ–å¤§ç ´çš„èˆ¹')\
        c.yield(sleepPromise(1000))\
        local res = o.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)\
        if (#res > 0) then\
          if ((store.expedition.quickRepairSingleLastShip ~= res[1]) or (store.expedition.quickRepairSingleCount < 3)) then\
            store.expedition.quickRepairSingleLastShip = res[1]\
            store.expedition.quickRepairSingleCount = store.expedition.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('4-49.ä¸­ç ´æˆ–å¤§ç ´:' .. table.concat(res, ','))\
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
            stepLabel.setStepLabelContent('4-50.å¿«ä¿®æ•°é‡ä¸è¶³')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('4-51.ä¿®ç†å®Œæˆ')\
          store.expedition.quickRepairCount = store.expedition.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
            { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.expeditionQuickRepair == 1) then\
        -- å¤§ç ´å¿«ä¿®\
        stepLabel.setStepLabelContent('4-52.å¯»æ‰¾å¤§ç ´çš„èˆ¹')\
        c.yield(sleepPromise(1000))\
        local res = o.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)\
        if (#res > 0) then\
          if ((store.expedition.quickRepairSingleLastShip ~= res[1]) or (store.expedition.quickRepairSingleCount < 3)) then\
            store.expedition.quickRepairSingleLastShip = res[1]\
            store.expedition.quickRepairSingleCount = store.expedition.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('4-53.å¤§ç ´:' .. table.concat(res, ','))\
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
            stepLabel.setStepLabelContent('4-54.å¿«ä¿®æ•°é‡ä¸è¶³')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('4-55.ä¿®ç†å®Œæˆ')\
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
      stepLabel.setStepLabelContent('4-56.ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­')\
      c.yield(sleepPromise(500))\
      o.expedition.clickQuickRepairModalCloseBtn()\
      c.yield(sleepPromise(300))\
      stepLabel.setStepLabelContent('4-57.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal, 2000 },\
        { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO') then\
\
      stepLabel.setStepLabelContent('4-58.æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾')\
      c.yield(sleepPromise(500))\
      local fleetCanBattle = o.expedition.isFleetsCanBattle()\
      if (fleetCanBattle) then\
        stepLabel.setStepLabelContent('4-59.å¯ä»¥å‡ºå¾')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO', o.expedition.isReadyBattlePage },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('4-60.è¿”å›ž')\
        return makeAction('EXPEDITION_READY_BATTLE_PAGE_CANT_GO')\
      end\
\
    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO') then\
\
      stepLabel.setStepLabelContent('4-61.å‡ºå¾å‡†å¤‡ç•Œé¢ï¼Œç‚¹å‡»å‡ºå¾å¼€å§‹')\
      c.yield(sleepPromise(100))\
      stepLabel.setStepLabelContent('4-62.ç‚¹å‡»è¿œå¾å¼€å§‹')\
      o.expedition.clickBattleStartBtn()\
      stepLabel.setStepLabelContent('4-63.ç­‰å¾…æˆ˜æ–—å¼€å§‹')\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO', o.expedition.isReadyBattlePage, 2000 },\
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then\
      -- èˆ°é˜Ÿä¸èƒ½è¿œå¾ï¼Œå‡†å¤‡è¿”å›žè¿œå¾é¡µ\
      store.expedition.hasShipCantExpedition = true\
\
      -- éœ‡åŠ¨æç¤ºä¸èƒ½è¿œå¾\
      if (settings.expeditionAlertWhenNoHp) then\
        if settings.alertUseVibrate then\
          vibratorPromise(3)\
        end\
        if settings.alertUsePushbullet then\
          local datestr = os.date('%Y-%m-%d %X')\
          sendToPushBullet(settings.pushbulletsToken,\
            datestr .. ' ' .. settings.pushbulletNickname,\
            datestr .. '  ' .. getDeviceModel() .. '  ' .. 'è¿œå¾å¤±è´¥')\
        end\
      end\
\
      stepLabel.setStepLabelContent('4-64.ç‚¹å‡»è¿”å›žè¿œå¾ç•Œé¢')\
      o.expedition.clickBackToExpedition()\
\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', o.expedition.isReadyBattlePage, 2000 },\
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition },\
      }))\
\
      -- å¦‚æžœç¦»å¼€è¿™ä¸€é¡µï¼Œåˆ™ä»Žè¿œå¾é˜Ÿåˆ—é‡Œé€€å‡ºä¸€ä¸ªé˜Ÿä¼\
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
      stepLabel.setStepLabelContent('4-66.è¿”å›žè¿œå¾é¡µ')\
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
      stepLabel.setStepLabelContent('4-67.è¿”å›žæ¸¯å£')\
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
      stepLabel.setStepLabelContent('4-1.ç­‰å¾…HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'EXPEDITION_REWARD_INIT', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'EXPEDITION_REWARD_INIT') then\
\
      -- è¿œå¾ç« èŠ‚\
      store.expeditionReward.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }\
\
      -- æ­¤ä»»åŠ¡ä½¿ç”¨çš„å˜é‡æ¢å¤é»˜è®¤å€¼\
      store.expedition.lastChapter = nil\
\
      return makeAction('EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED')\
\
    elseif (action.type == 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED') then\
\
      stepLabel.setStepLabelContent('4-3.æ£€æµ‹æ˜¯å¦æœ‰è¿œå¾å¥–åŠ±')\
      c.yield(sleepPromise(100))\
      local res = o.expedition.isExpeditionCompleted()\
      if (not res) then\
        stepLabel.setStepLabelContent('4-4.æ²¡æœ‰è¿œå¾å¥–åŠ±å’Œä»»åŠ¡')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { '', 'homeGroup', o.home.isHome },\
        }))\
        return makeAction(newstateTypes)\
      end\
      stepLabel.setStepLabelContent('4-5.ç‚¹å‡»å‡ºå¾')\
      o.expedition.clickBattle()\
      stepLabel.setStepLabelContent('4-6.ç­‰å¾…å‡ºå¾ç•Œé¢')\
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
      stepLabel.setStepLabelContent('4-7.ç‚¹å‡»è¿œå¾')\
      o.expedition.clickExpedition()\
      stepLabel.setStepLabelContent('4-8.ç­‰å¾…è¿œå¾ç•Œé¢')\
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
        stepLabel.setStepLabelContent('4-9.ç§»åŠ¨åˆ°ç¬¬' .. chapter .. 'ç« ')\
        c.yield(sleepPromise(500))\
        o.expedition.moveToChapter(chapter, store.expedition.lastChapter)\
        store.expedition.lastChapter = chapter\
        stepLabel.setStepLabelContent('4-10.æ£€æµ‹æœ¬é¡µæœ‰å¯æ”¶èŽ·å¥–åŠ±')\
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
        -- å½“å›žæ”¶ä¸€ä¸ªè¿œå¾å¥–åŠ±æ—¶ï¼Œå°±éœ€è¦è¿œå¾æ´¾é£\
        store.expedition.needExpedition = true\
\
        stepLabel.setStepLabelContent('4-11.ç‚¹å‡»ç¬¬' .. v .. 'èŠ‚')\
        o.expedition.clickExpeditionBtn(v)\
        stepLabel.setStepLabelContent('4-12.ç­‰å¾…è¿œå¾å®Œæˆé¡µé¢')\
\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', o.expedition.isBattleExpedition, 2000 },\
          { 'EXPEDITION_REWARD_COMPLETED_PAGE', o.expedition.isExpeditionCompletedPage },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
      stepLabel.setStepLabelContent('4-13.æœ¬é¡µæ²¡æœ‰å¯æ”¶èŽ·çš„å¥–åŠ±')\
      table.remove(store.expeditionReward.enableChapter, 1)\
      return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }\
\
    elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then\
\
      o.expedition.clickRewardPannelOk()\
      stepLabel.setStepLabelContent('4-14.ç­‰å¾…è¿œå¾ç•Œé¢')\
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
      stepLabel.setStepLabelContent('4-15.è¿”å›žHOME')\
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
        stepLabel.setStepLabelContent('8-1.è·³è¿‡è§£ä½“ï¼Œä¸‹æ¬¡æ£€æŸ¥æ—¶é—´ï¼š' .. os.date(\"%Y-%m-%d %H:%M:%S\", store.disintegrateShip.nextStartTime))\
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
      stepLabel.setStepLabelContent('8-2.ç­‰å¾…HOME')\
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
      stepLabel.setStepLabelContent('8-3.ç‚¹å‡»å»ºé€ æŒ‰é’®')\
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
      stepLabel.setStepLabelContent('8-4.ç‚¹å‡»è§£ä½“é¡µé¢æŒ‰é’®')\
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
      stepLabel.setStepLabelContent('8-5.ç‚¹å‡»æ·»åŠ æŒ‰é’®')\
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
      stepLabel.setStepLabelContent('8-6.æ£€æµ‹æ˜¯å¦æœ‰èˆ¹')\
      c.yield(sleepPromise(500))\
      local hasShipRes = o.disintegrateShip.hasShip()\
\
      if hasShipRes then\
        stepLabel.setStepLabelContent('8-7.æœ‰èˆ¹ï¼Œé€‰ä¸­æ‰€æœ‰èˆ¹')\
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
      stepLabel.setStepLabelContent('8-8.æ²¡èˆ¹ï¼Œè¿”å›ž')\
      return makeAction('DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK')\
\
    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK' then\
\
      stepLabel.setStepLabelContent('8-9.ç‚¹å‡»è¿”å›ž')\
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
      stepLabel.setStepLabelContent('8-10.ç‚¹å‡»æ‰€æœ‰èˆ¹')\
      o.disintegrateShip.clickAllShip()\
      stepLabel.setStepLabelContent('8-11.ç‚¹å‡»ç¡®å®š')\
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
      stepLabel.setStepLabelContent('8-12.æ£€æµ‹æ˜¯å¦é€‰ä¸­å¸ä¸‹æ‰€æœ‰è£…å¤‡é€‰é¡¹')\
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
      stepLabel.setStepLabelContent('8-13.é€‰ä¸­å¸ä¸‹æ‰€æœ‰è£…å¤‡é€‰é¡¹')\
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
      stepLabel.setStepLabelContent('8-14.ç¨€æœ‰è§£ä½“ç¡®è®¤é¢æ¿')\
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
      stepLabel.setStepLabelContent('8-15.ç‚¹å‡»è§£ä½“')\
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
      -- å¦‚æžœæ˜¯å¿«é€Ÿè§£ä½“æ¨¡å¼ï¼Œåˆ™ä¸å†è¿›è¡Œç¬¬äºŒæ¬¡æ£€æŸ¥ï¼Œç›´æŽ¥é€€å‡º\
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
      stepLabel.setStepLabelContent('8-16.ç‚¹å‡»è¿”å›ž')\
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
      stepLabel.setStepLabelContent('3-1.ç­‰å¾…HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'MISSION_IS_UNRECEIVED_MISSION', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then\
\
      stepLabel.setStepLabelContent('3-2.æ£€æµ‹æ˜¯å¦æœ‰ä»»åŠ¡å¥–åŠ±')\
      c.yield(sleepPromise(100))\
      local res = o.mission.isUnreceivedMission()\
      if (res) then\
        return { type = 'MISSION_INIT' }\
      end\
      stepLabel.setStepLabelContent('3-3.æ²¡æœ‰ä»»åŠ¡å¥–åŠ±')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'MISSION_INIT') then\
\
      stepLabel.setStepLabelContent('3-4ç‚¹å‡»ä»»åŠ¡æŒ‰é’®')\
      o.mission.clickMission()\
      stepLabel.setStepLabelContent('3-5.ç­‰å¾…ä»»åŠ¡ç•Œé¢')\
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
      stepLabel.setStepLabelContent('3-6.ç‚¹å‡»å…¨éƒ¨ä»»åŠ¡')\
      o.mission.clickAllMission()\
      stepLabel.setStepLabelContent('3-7.ç­‰å¾…ä»»åŠ¡å…¨éƒ¨ä»»åŠ¡ç•Œé¢')\
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
        stepLabel.setStepLabelContent('3-8.æ²¡æœ‰ä»»åŠ¡å¥–åŠ±')\
        return { type = 'MISSION_PAGE_NO_REWAR' }\
      else\
        stepLabel.setStepLabelContent('3-9.æœ‰ä»»åŠ¡å¥–åŠ±')\
        o.mission.clickGetFirstReward()\
        stepLabel.setStepLabelContent('3-10.ç­‰å¾…èŽ·å¾—é¢æ¿')\
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
      stepLabel.setStepLabelContent('3-11.ç‚¹å‡»ç¡®å®š')\
      o.mission.clickRewardPannelOk()\
      stepLabel.setStepLabelContent('3-12.ç­‰å¾…æ–°èˆ¹ï¼Œä»»åŠ¡å…¨éƒ¨ä»»åŠ¡')\
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
      stepLabel.setStepLabelContent('3-13.ç‚¹å‡»æ–°èˆ¹')\
      o.mission.clickNewShip()\
      stepLabel.setStepLabelContent('3-14.ç­‰å¾…æ–°èˆ¹é”å®šï¼Œä»»åŠ¡å…¨éƒ¨ä»»åŠ¡')\
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
      stepLabel.setStepLabelContent('3-15.ç‚¹å‡»æ–°èˆ¹')\
      o.mission.clickNewShipPageLockModalOkBtn()\
      stepLabel.setStepLabelContent('3-16.ç­‰å¾…ä»»åŠ¡å…¨éƒ¨ä»»åŠ¡')\
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
      stepLabel.setStepLabelContent('3-17.ç­‰å¾…è¿”å›žhome')\
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
      -- å‡ºå¾åŽå°±åº”è¯¥éœ€è¦ç»´ä¿®\
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
      stepLabel.setStepLabelContent('2-1.ç­‰å¾…HOME')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {\
        { 'BATTLE_HOME_CLICK_BATTLE', o.home.isHome },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_HOME_CLICK_BATTLE') then\
\
      stepLabel.setStepLabelContent('2-2.ç‚¹å‡»å‡ºå¾')\
      o.home.clickBattleBtn()\
      stepLabel.setStepLabelContent('2-3.ç­‰å¾…å‡ºå¾é¡µé¢')\
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
      stepLabel.setStepLabelContent('2-4.ç”±äºŽåœ¨ä¸»ç•Œé¢å¡ä½ï¼Œä¸€ç›´ç‚¹å‡»å‡ºå¾å¯¼è‡´ç›´æŽ¥è·³è¿›å‡†å¤‡æˆ˜æ–—é¡µé¢ï¼Œç‚¹å‡»è¿”å›ž')\
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
      stepLabel.setStepLabelContent('2-5.å‡ºå¾é¡µé¢ç‚¹å‡»å‡ºå¾çš„å‡ºå¾æŒ‰é’®')\
      c.yield(sleepPromise(500))\
      o.battle.clickBattleBtn()\
      stepLabel.setStepLabelContent('2-6.ç­‰å¾…å‡ºå¾çš„å‡ºå¾ç•Œé¢')\
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
      stepLabel.setStepLabelContent('2-7.å‡ºå¾çš„å‡ºå¾é¡µé¢')\
      stepLabel.setStepLabelContent('2-8.ç§»åŠ¨åˆ°ç« èŠ‚' .. settings.battleChapter)\
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
      stepLabel.setStepLabelContent('2-9.è¿›å…¥ç« èŠ‚')\
      c.yield(sleepPromise(100))\
      o.battle.clickReadyBattleBtn()\
      c.yield(sleepPromise(100))\
      stepLabel.setStepLabelContent('2-10.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
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
        -- è¿˜æ²¡å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®\
        stepLabel.setStepLabelContent('2-11.é€‰æ‹©èˆ°é˜Ÿ:' .. settings.battleFleet)\
        o.battle.selectFleet(settings.battleFleet)\
        stepLabel.setStepLabelContent('2-12.æ£€æµ‹æ‰€æœ‰çŠ¶æ€æ­£å¸¸')\
        c.yield(sleepPromise(1000))\
        local res = o.battle.isReadyBattlePageShipStatusAllRight()\
        if (res) then\
          stepLabel.setStepLabelContent('2-13.çŠ¶æ€æ­£å¸¸')\
          store.battle.quickSupplyCount = 1\
          store.battle.quickRepairCount = 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO', o.battle.isReadyBattlePage, 2000 },\
            { 'BATTLE_QUICK_SUPPLY_MODAL', o.battle.isQuickSupplyModal },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('2-14.çŠ¶æ€ä¸æ­£å¸¸')\
          o.battle.clickReadyBattlePageQuickSupplyBtn()\
          stepLabel.setStepLabelContent('2-15.ç­‰å¾…å¿«é€Ÿè¡¥ç»™ç•Œé¢')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage, 2000 },\
            { 'BATTLE_QUICK_SUPPLY_MODAL', o.battle.isQuickSupplyModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
      elseif (store.battle.quickRepairCount <= 0) then\
        -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œè¿˜æ²¡ç»´ä¿®\
        stepLabel.setStepLabelContent('2-16.æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')\
        c.yield(sleepPromise(1000))\
        local res = o.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('2-17.è¡€é‡å®‰å…¨')\
          store.battle.quickRepairCount = 1\
          return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          if (settings.battleQuickRepair > 0) then\
            stepLabel.setStepLabelContent('2-18.è¡€é‡ä¸å®‰å…¨ï¼Œå¿«ä¿®')\
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
            stepLabel.setStepLabelContent('2-19.è¡€é‡ä¸å®‰å…¨')\
            store.battle.quickRepairCount = 1\
            return { type = 'BATTLE_READY_BATTLE_PAGE' }\
          end\
        end\
      else\
        -- å·²ç»å¿«é€Ÿè¡¥ç»™ï¼Œå·²ç»ç»´ä¿®\
        stepLabel.setStepLabelContent('2-20.å†æ¬¡æ£€æµ‹è¡€é‡æ˜¯å¦å®‰å…¨')\
        c.yield(sleepPromise(500))\
        -- ä¸å…è®¸å¤§ç ´å‡ºå¾\
        local res = o.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))\
        if (res) then\
          stepLabel.setStepLabelContent('2-21.è¡€é‡å®‰å…¨ï¼Œç»§ç»­')\
          return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }\
        else\
          stepLabel.setStepLabelContent('2-22.è¡€é‡ä¸å®‰å…¨ï¼Œè¿”å›ž')\
          return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO')\
        end\
      end\
\
    elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL') then\
\
      stepLabel.setStepLabelContent('2-23.å¿«é€Ÿè¡¥ç»™ç•Œé¢ç‚¹å‡»ç¡®å®š')\
      o.battle.clickReadyBattlePageQuickSupplyModalOkBtn()\
      stepLabel.setStepLabelContent('2-24.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
      store.battle.quickSupplyCount = store.battle.quickSupplyCount + 1\
      if (store.battle.quickSupplyCount < 3) then\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage, 1000 },\
          { 'BATTLE_QUICK_SUPPLY_MODAL', o.battle.isQuickSupplyModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('2-25.èµ„æºæ•°é‡ä¸è¶³')\
        return { type = 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE' }\
      end\
\
    elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE') then\
\
      stepLabel.setStepLabelContent('2-26.ç‚¹å‡»å¿«é€Ÿè¡¥ç»™å…³é—­')\
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
        -- ä¸æ»¡è¡€åˆ™å¿«ä¿®\
        stepLabel.setStepLabelContent('2-27.ç‚¹å‡»å¿«é€Ÿä¿®ç†ç¡®å®š')\
        c.yield(sleepPromise(500))\
        o.battle.clickQuickRepairModalOkBtn()\
        store.battle.quickRepairCount = store.battle.quickRepairCount + 1\
        stepLabel.setStepLabelContent('2-28.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
        if (store.battle.quickRepairCount < 3) then\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage, 1000 },\
            { 'BATTLE_QUICK_REPAIR_MODAL', o.battle.isQuickRepairModal, 2000 },\
          }))\
          return makeAction(newstateTypes)\
        else\
          stepLabel.setStepLabelContent('2-29.å¿«ä¿®æ•°é‡ä¸è¶³')\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.battleQuickRepair == 2) then\
        -- ä¸­ç ´æˆ–å¤§ç ´å¿«ä¿®\
        stepLabel.setStepLabelContent('2-30.å¯»æ‰¾ä¸­ç ´æˆ–å¤§ç ´çš„èˆ¹')\
        c.yield(sleepPromise(1000))\
        local res = o.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)\
        if (#res > 0) then\
\
          if ((store.battle.quickRepairSingleLastShip ~= res[1]) or (store.battle.quickRepairSingleCount < 3)) then\
            store.battle.quickRepairSingleLastShip = res[1]\
            store.battle.quickRepairSingleCount = store.battle.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('2-31.ä¸­ç ´æˆ–å¤§ç ´:' .. table.concat(res, ','))\
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
            stepLabel.setStepLabelContent('2-32å¿«ä¿®æ•°é‡ä¸è¶³')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('2-33.ä¿®ç†å®Œæˆ')\
          store.battle.quickRepairCount = store.battle.quickRepairCount + 1\
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
            { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal },\
          }))\
          return makeAction(newstateTypes)\
        end\
\
      elseif (settings.battleQuickRepair == 1) then\
        -- å¤§ç ´å¿«ä¿®\
        stepLabel.setStepLabelContent('2-34.å¯»æ‰¾å¤§ç ´çš„èˆ¹')\
        c.yield(sleepPromise(1000))\
        local res = o.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)\
        if (#res > 0) then\
          if ((store.battle.quickRepairSingleLastShip ~= res[1]) or (store.battle.quickRepairSingleCount < 3)) then\
            store.battle.quickRepairSingleLastShip = res[1]\
            store.battle.quickRepairSingleCount = store.battle.quickRepairSingleCount + 1\
\
            stepLabel.setStepLabelContent('2-35.å¤§ç ´:' .. table.concat(res, ','))\
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
            stepLabel.setStepLabelContent('2-36.å¿«ä¿®æ•°é‡ä¸è¶³')\
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
              { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage },\
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal },\
            }))\
            return makeAction(newstateTypes)\
          end\
        else\
          stepLabel.setStepLabelContent('2-37.ä¿®ç†å®Œæˆ')\
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
      stepLabel.setStepLabelContent('2-38.ç‚¹å‡»å¿«é€Ÿä¿®ç†å…³é—­')\
      c.yield(sleepPromise(500))\
      o.battle.clickQuickRepairModalCloseBtn()\
      c.yield(sleepPromise(300))\
      stepLabel.setStepLabelContent('2-39.ç­‰å¾…å‡ºå¾å‡†å¤‡ç•Œé¢')\
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
        { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.battle.isQuickRepairModal, 2000 },\
        { 'BATTLE_READY_BATTLE_PAGE', o.battle.isReadyBattlePage, 1000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO') then\
\
      stepLabel.setStepLabelContent('2-40.æ£€æµ‹èˆ°é˜Ÿå¯ä»¥å‡ºå¾')\
      c.yield(sleepPromise(500))\
      local fleetCanBattle = o.battle.isFleetsCanBattle()\
      if (fleetCanBattle) then\
        stepLabel.setStepLabelContent('2-41.å¯ä»¥å‡ºå¾')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {\
          { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', o.battle.isReadyBattlePage },\
        }))\
        return makeAction(newstateTypes)\
      else\
        -- ä¸èƒ½å‡ºå¾ï¼Œéœ€è¦å¼€å¯è§£ä½“èˆ°èˆ¹åŠŸèƒ½\
        store.disintegrateShip.nextStartTime = os.time()\
        stepLabel.setStepLabelContent('2-42.è¿”å›žHOME')\
        return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO')\
      end\
\
    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CAN_GO') then\
\
      stepLabel.setStepLabelContent('2-43.å‡ºå¾å‡†å¤‡ç•Œé¢ï¼Œç‚¹å‡»å‡ºå¾å¼€å§‹')\
      c.yield(sleepPromise(100))\
      o.battle.clickBattleStartBtn()\
      return { type = 'BATTLE_GO_A_BATTLE' }\
\
    elseif (action.type == 'BATTLE_GO_A_BATTLE') then\
\
      store.battle.passBattleStartPage = false\
\
      if (store.battle.battleNum < settings.battleMaxBattleNum) then\
        stepLabel.setStepLabelContent('2-44.ç¬¬' .. store.battle.battleNum .. 'æˆ˜å¼€å§‹')\
      else\
        stepLabel.setStepLabelContent('2-45.ç¬¬' .. store.battle.battleNum .. 'æˆ˜Bossæˆ˜å¼€å§‹')\
      end\
      stepLabel.setStepLabelContent('2-46.ç­‰å¾…é¢å¤–èŽ·å¾—é¢æ¿ï¼Œå¼€å§‹é¢æ¿ï¼Œé˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhomeï¼Œèƒœåˆ©ç•Œé¢')\
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
      stepLabel.setStepLabelContent('2-47.é¢å¤–èŽ·å¾—é¢æ¿ï¼Œç‚¹å‡»ç¡®å®š')\
      o.battle.clickExtraReceiveModalOk()\
      stepLabel.setStepLabelContent('2-48.ç­‰å¾…é¢å¤–èŽ·å¾—é¢æ¿ï¼Œå¼€å§‹é¢æ¿ï¼Œé˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhomeï¼Œèƒœåˆ©ç•Œé¢')\
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
      -- 6-1ç¬¬ä¸€æˆ˜ï¼Œé‡åˆ°2èˆªæ¯ï¼Œè¿”å›žæ¸¯å£\
      store.battle.passBattleStartPage = true\
      if (settings.battleRebootAt6_1AMeetCV) then\
        stepLabel.setStepLabelContent('2-49.å¼€å§‹æ£€æµ‹èˆªæ¯')\
        if (settings.battleChapter == '6-1') then\
          if (store.battle.battleNum == 1) then\
            c.yield(sleepPromise(500))\
            if (o.battle.isEnemyShipIsCV()) then\
              stepLabel.setStepLabelContent('2-49.é‡åˆ°èˆªæ¯ï¼Œè¿”å›žæ¸¯å£')\
              return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' })\
            end\
          end\
        end\
      end\
      -- 6-1ç¬¬ä¸€æˆ˜ï¼Œé‡åˆ°2é›·å·¡ï¼Œè¿”å›žæ¸¯å£\
      if (settings.battleRebootAt6_1AMeetCit) then\
        stepLabel.setStepLabelContent('2-50.å¼€å§‹æ£€æµ‹é›·å·¡')\
        if (settings.battleChapter == '6-1') then\
          if (store.battle.battleNum == 1) then\
            c.yield(sleepPromise(500))\
            if (o.battle.isEnemyShipIsCit()) then\
              stepLabel.setStepLabelContent('2-51.é‡åˆ°é›·å·¡ï¼Œè¿”å›žæ¸¯å£')\
              return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' })\
            end\
          end\
        end\
      end\
      -- æ‰€æœ‰å…³å¡ï¼Œé‡åˆ°è¡¥ç»™èˆ¹å°±ç»§ç»­ï¼Œæ²¡é‡åˆ°å°±è¿”å›žæ¸¯å£\
      if (settings.battleRebootAtNotMeetAP) then\
        stepLabel.setStepLabelContent('2-52.å¼€å§‹æ£€æµ‹è¡¥ç»™')\
        c.yield(sleepPromise(500))\
        if (not o.battle.isEnemyShipIsAP()) then\
          stepLabel.setStepLabelContent('2-53.æ²¡é‡åˆ°è¡¥ç»™ï¼Œè¿”å›žæ¸¯å£')\
          return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' })\
        end\
      end\
      -- æ‰€æœ‰å…³å¡ï¼Œé‡åˆ°æ½œè‰‡å°±åˆ‡æ¢å•æ¨ªé˜µ\
      local battleOption = settings.battleOption[store.battle.battleNum] or settings.battleOption.main\
      if battleOption.autoChangeFormation then\
        stepLabel.setStepLabelContent('2-52.å¼€å§‹æ£€æµ‹æ½œè‰‡')\
        c.yield(sleepPromise(500))\
        if (not o.battle.isEnemyShipIsSS()) then\
          stepLabel.setStepLabelContent('2-53.é‡åˆ°æ½œè‰‡ï¼Œåˆ‡æ¢å•æ¨ªé˜µ')\
          store.battle.battleStartPageHasSS = true\
        end\
      end\
\
      stepLabel.setStepLabelContent('2-54.å¼€å§‹é¢æ¿ï¼Œç‚¹å‡»å¼€å§‹')\
      c.yield(sleepPromise(200))\
      if (settings.battleRoundabout and o.battle.isBattleStartPageCanRoundabout()) then\
        o.battle.clickBattleStartModalRoundaboutBtn()\
      else\
        o.battle.clickBattleStartModalStartBtn()\
      end\
      stepLabel.setStepLabelContent('2-55.ç­‰å¾…é˜µåž‹é¢æ¿ï¼Œè¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')\
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
      -- 6-1æœªå‘çŽ°æ•Œèˆ°\
      if (settings.battleRebootAt6_1AMeetCV) then\
        if (not store.battle.passBattleStartPage) then\
          if (settings.battleChapter == '6-1') then\
            if (store.battle.battleNum == 1) then\
              c.yield(sleepPromise(500))\
              stepLabel.setStepLabelContent('2-56.æœªå‘çŽ°æ•Œèˆ°ï¼ŒSLå¤§æ³•')\
              return makeAction({ type = 'LOGIN_START_APP' })\
            end\
          end\
        end\
      end\
\
      stepLabel.setStepLabelContent('2-57.é˜µåž‹é¢æ¿')\
      c.yield(sleepPromise(100))\
      local battleOption = settings.battleOption[store.battle.battleNum] or settings.battleOption.main\
      if battleOption.autoChangeFormation and store.battle.battleStartPageHasSS then\
        -- é‡åˆ°æ½œè‰‡è‡ªåŠ¨æ¢å•æ¨ªé˜µ\
        o.battle.clickFormationPageStartBtn(5)\
      else\
        o.battle.clickFormationPageStartBtn(battleOption.battleFormation)\
      end\
      stepLabel.setStepLabelContent('2-58.ç­‰å¾…è¿½å‡»é¢æ¿ï¼Œèƒœåˆ©ç•Œé¢')\
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
      stepLabel.setStepLabelContent('2-59.è¿½å‡»é¢æ¿')\
      local battleOption = settings.battleOption[store.battle.battleNum] or settings.battleOption.main\
      if battleOption.battlePursue and store.battle.battleNum <= settings.battleMaxBattleNum then\
        stepLabel.setStepLabelContent('2-60.è¿½å‡»')\
        o.battle.clickPursueModalOk()\
      else\
        stepLabel.setStepLabelContent('2-61.æ”¾å¼ƒè¿½å‡»')\
        o.battle.clickPursuePageCancel()\
      end\
      stepLabel.setStepLabelContent('2-62.ç­‰å¾…èƒœåˆ©ç•Œé¢')\
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
      stepLabel.setStepLabelContent('2-63.èƒœåˆ©ç•Œé¢æ£€æµ‹HPæ˜¯å¦å®‰å…¨')\
      c.yield(sleepPromise(300))\
      -- æœ‰å¤§ç ´å°±å›žæ¸¯\
      store.battle.HPIsSafe = o.battle.isVictoryPageShipHPSafe(1)\
      if (store.battle.HPIsSafe) then\
        stepLabel.setStepLabelContent('2-64.HPå®‰å…¨')\
      else\
        stepLabel.setStepLabelContent('2-65.HPä¸å®‰å…¨')\
      end\
      c.yield(sleepPromise(200))\
      stepLabel.setStepLabelContent('2-66.ç‚¹å‡»èƒœåˆ©ç»§ç»­')\
      o.battle.clickVictoryPageContinueBtn()\
      stepLabel.setStepLabelContent('2-67.ç­‰å¾…èƒœåˆ©ç»§ç»­ç•Œé¢')\
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
      stepLabel.setStepLabelContent('2-68.ç‚¹å‡»èƒœåˆ©ç»§ç»­')\
      o.battle.clickVictoryPageContinueBtn2()\
      stepLabel.setStepLabelContent('2-69.ç­‰å¾…å¤§ç ´è­¦å‘Šï¼Œæ–°èˆ¹ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')\
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
      stepLabel.setStepLabelContent('2-70.å¤§ç ´è­¦å‘Šæ¡†ç‚¹å‡»è¿”å›ž')\
      o.battle.clickShipSevereDamageModalBack()\
      stepLabel.setStepLabelContent('2-71.ç­‰å¾…æ–°èˆ¹ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')\
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
      stepLabel.setStepLabelContent('2-72.æ— æ³•å‰è¿›è­¦å‘Šæ¡†ç‚¹å‡»è¿”å›ž')\
      o.battle.clickShipCantGoOnModalBackBtn()\
      stepLabel.setStepLabelContent('2-73.ç­‰å¾…æ–°èˆ¹ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')\
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
      stepLabel.setStepLabelContent('2-74.èŽ·å–æ–°èˆ¹')\
      o.battle.clickNewShip()\
      stepLabel.setStepLabelContent('2-75.ç­‰å¾…æ–°èˆ¹é”å®šçª—å£ï¼Œä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')\
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
      stepLabel.setStepLabelContent('2-76.æ–°èˆ¹é”å®šçª—å£ç‚¹å‡»ç¡®è®¤')\
      o.battle.clickNewShipPageLockModalOkBtn()\
      stepLabel.setStepLabelContent('2-77.ç­‰å¾…ä¸‹å›žåˆçª—å£ï¼Œå‹‹ç« å¯¹è¯æ¡†ï¼Œhome')\
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
        stepLabel.setStepLabelContent('2-78.ç‚¹å‡»ç»§ç»­ä¸‹ä¸€å…³')\
        o.battle.clickLevelStepModalContinueBtn()\
        store.battle.battleNum = store.battle.battleNum + 1\
        return { type = 'BATTLE_GO_A_BATTLE' }\
      else\
        stepLabel.setStepLabelContent('2-79.ç‚¹å‡»å›žæ¸¯')\
        o.battle.clickLevelStepModalBackBtn()\
        stepLabel.setStepLabelContent('2-80.ç­‰å¾…ä¸»ç•Œé¢')\
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {\
          { 'BATTLE_NEXT_LEVEL_STEP_MODAL', o.battle.isNextLevelStepModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      end\
\
    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CANT_GO') then\
\
      -- æç¤ºä¸èƒ½æˆ˜æ–—\
      if (settings.battleAlertWhenNoHp) then\
        if settings.alertUseVibrate then\
          vibratorPromise(3)\
        end\
        if settings.alertUsePushbullet then\
          local datestr = os.date('%Y-%m-%d %X')\
          sendToPushBullet(settings.pushbulletsToken,\
            datestr .. ' ' .. settings.pushbulletNickname,\
            datestr .. '  ' .. getDeviceModel() .. '  ' .. 'ä¸èƒ½å‡ºå¾')\
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
      stepLabel.setStepLabelContent('2-81.ç­‰å¾…å‡ºå¾ç•Œé¢')\
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
      stepLabel.setStepLabelContent('2-82.ç­‰å¾…ä¸»ç•Œé¢')\
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
      stepLabel.setStepLabelContent('1-11.å¯åŠ¨æ¸¸æˆ')\
      o.login.restartApp()\
      local newstateTypes = c.yield(setScreenListeners({\
        { 'LOGIN_LOGIN', o.login.isLoginPage, 2000 },\
        { 'LOGIN_SELECT_SERVER', o.login.isSelectServerPage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'LOGIN_LOGIN') then\
\
      stepLabel.setStepLabelContent('1-12.è¾“å…¥ç”¨æˆ·åç•Œé¢')\
      local newstateTypes = c.yield(setScreenListeners({\
        { 'LOGIN_LOGIN', o.login.isLoginPage, 10000 },\
        { 'LOGIN_SELECT_SERVER', o.login.isSelectServerPage, 2000 },\
      }))\
      return makeAction(newstateTypes)\
\
    elseif (action.type == 'LOGIN_SELECT_SERVER') then\
\
      stepLabel.setStepLabelContent('1-13.ç™»å½•ç•Œé¢')\
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
      stepLabel.setStepLabelContent('æš‚åœ')\
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
      stepLabel.setStepLabelContent('1-10.ç½‘ç»œä¸é€šï¼Œç‚¹å‡»ç¡®è®¤')\
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
      stepLabel.setStepLabelContent('1-11.æ£€æŸ¥æ‚¨çš„ç½‘ç»œï¼Œç‚¹å‡»ç¡®è®¤')\
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
      stepLabel.setStepLabelContent('1-2å‹‹ç« å–æ¶ˆ')\
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
      stepLabel.setStepLabelContent('1-3.å…³é—­æ–°é—»')\
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
      stepLabel.setStepLabelContent('1-4.èŽ·å–ç­¾åˆ°å¥–åŠ±')\
      local res = o.home.isSignModalHasReward()\
      if (res) then\
        stepLabel.setStepLabelContent('1-5.æœ‰å¥–åŠ±ï¼Œç‚¹å‡»èŽ·å–')\
        o.home.clickSignModalGetReward()\
        stepLabel.setStepLabelContent('1-6.ç­‰å¾…èŽ·å–ç¡®è®¤')\
        local newstateTypes = c.yield(setScreenListeners({\
          { 'HOME_SIGN_CONFIRM_MODAL', o.home.isSignConfirmModal },\
          { 'HOME_SIGN_MODAL', o.home.isSignModal, 2000 },\
        }))\
        return makeAction(newstateTypes)\
      else\
        stepLabel.setStepLabelContent('1-7.æ²¡æœ‰å¥–åŠ±')\
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
      stepLabel.setStepLabelContent('1-8.ç‚¹å‡»èŽ·å–ç¡®è®¤')\
      o.home.clickSignConfirmModalGetReward()\
      stepLabel.setStepLabelContent('1-9.ç­‰å¾…èŽ·å–ç­¾åˆ°å¥–åŠ±é¢æ¿')\
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
-- ä»Žnameæå–è·¯å¾„\
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
-- æ ¹æ®è·¯å¾„åœ¨ table ä¸­æ·»åŠ ä¸€ä¸ªå€¼\
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
-- è®¾ç½®\
return function()\
  local settingTable = {\
    ['style'] = 'default',\
    ['width'] = height,\
    ['height'] = height,\
    ['config'] = 'save_warship-girls-r-script.dat',\
    ['timer'] = 5,\
    ['orient'] = 1,\
    ['pagetype'] = 'multi',\
    ['title'] = 'é€‰é¡¹',\
    ['cancelname'] = 'å–æ¶ˆ',\
    ['okname'] = 'å¼€å§‹',\
    ['rettype'] = 'table',\
    ['pages'] = {\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ç¬¬ä¸€æ¬¡è®¾ç½®å»ºè®®åœ¨ç«–å±ä¸‹è®¾ç½®ï¼Œè®¾ç½®å¥½åŽå†åˆ‡æ¢åˆ°æ¸¸æˆç•Œé¢',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'å‘å·¦æ»‘åŠ¨æŸ¥çœ‹å…¶ä»–é€‰é¡¹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä»»åŠ¡',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'missionEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å¼€å¯,å…³é—­',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿œå¾',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å¼€å¯,å…³é—­',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'å‡ºå¾',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å¼€å¯,å…³é—­',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä¿®ç†',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'repairEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å¼€å¯,å…³é—­',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è§£ä½“',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'disintegrateShipEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å¼€å¯,å…³é—­',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'æ¼”ä¹ ',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å¼€å¯,å…³é—­',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'æˆ˜å½¹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignEnable',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å¼€å¯,å…³é—­',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'æ¯ä¸€è½®çš„é—´éš”æ—¶é—´(ç§’)',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'missionsInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = 'æœ€çŸ­é—´éš”æ—¶é—´(ç§’)',\
          ['text'] = '15',\
          ['kbtype'] = 'number',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'å¤šé•¿æ—¶é—´ç”»é¢ä¸å˜åˆ™é‡å¯æ¸¸æˆ(ç§’)æœ€å°‘60ç§’',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'restartInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = 'å¤šé•¿æ—¶é—´ç”»é¢ä¸å˜åˆ™é‡å¯æ¸¸æˆ(ç§’)æœ€å°‘60ç§’',\
          ['text'] = '120',\
          ['kbtype'] = 'number',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä½¿ç”¨éœ‡åŠ¨æ–¹å¼æé†’',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'alertUseVibrate',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å¼€å¯,å…³é—­',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä½¿ç”¨pushbulletæŽ¨é€æé†’(å¼€å¯åŽå¿…é¡»å¡«å†™token)',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'alertUsePushbullet',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å¼€å¯,å…³é—­',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'pushbulletçš„token',\
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
          ['text'] = 'è®¾å¤‡åˆ«åï¼Œæ˜¾ç¤ºåœ¨pushbulletä¸­',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'pushbulletNickname',\
          ['type'] = 'Edit',\
          ['prompt'] = 'åˆ«å',\
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
          ['text'] = 'è¿œå¾è®¾ç½®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä½¿ç”¨å¿«ä¿®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionQuickRepair',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä¸èƒ½è¿œå¾åˆ™æŠ¥è­¦',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionAlertWhenNoHp',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è‡ªåŠ¨å‚åŠ çš„è¿œå¾ç« èŠ‚',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '5é˜Ÿ',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionFleet1',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'ä¸å‚åŠ ,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',\
          ['select'] = '2',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '6é˜Ÿ',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionFleet2',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'ä¸å‚åŠ ,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',\
          ['select'] = '3',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '7é˜Ÿ',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionFleet3',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'ä¸å‚åŠ ,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',\
          ['select'] = '5',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '8é˜Ÿ',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'expeditionFleet4',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'ä¸å‚åŠ ,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',\
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
          ['text'] = 'æ¼”ä¹ è®¾ç½®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'èˆ°é˜Ÿ',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseFleet',\
          ['type'] = 'RadioGroup',\
          ['list'] = '1é˜Ÿ,2é˜Ÿ,3é˜Ÿ,4é˜Ÿ',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿½å‡»',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exercisePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'å¿«ä¿®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseQuickRepair',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é—´éš”å¤šé•¿æ—¶é—´æ£€æŸ¥ä¸€æ¬¡',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'exerciseInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = 'é—´éš”å¤šé•¿æ—¶é—´æ£€æŸ¥ä¸€æ¬¡',\
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
          ['text'] = 'æˆ˜å½¹è®¾ç½®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'å…³å¡',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignChapter',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'é©±é€,å·¡æ´‹,æˆ˜åˆ—,èˆªæ¯,æ½œè‰‡',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'éš¾åº¦',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignDifficulty',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ™®é€š,å›°éš¾',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿½å‡»',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignPursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'å¿«ä¿®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignQuickRepair',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä¸èƒ½å‡ºå¾åˆ™æŠ¥è­¦',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignAlertWhenCantBattle',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é—´éš”å¤šé•¿æ—¶é—´æ£€æŸ¥ä¸€æ¬¡',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'campaignInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = 'é—´éš”å¤šé•¿æ—¶é—´æ£€æŸ¥ä¸€æ¬¡',\
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
          ['text'] = 'ä¿®ç†è®¾ç½®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä¿®ç†ç›®æ ‡',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'repairAll',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ‰€æœ‰,ä¸åœ¨èˆ°é˜Ÿé‡Œçš„',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é—´éš”å¤šé•¿æ—¶é—´æ£€æŸ¥ä¸€æ¬¡',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'repairInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = 'é—´éš”å¤šé•¿æ—¶é—´æ£€æŸ¥ä¸€æ¬¡',\
          ['text'] = '1800',\
          ['kbtype'] = 'number',\
        },\
      },\
\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è§£ä½“è®¾ç½®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'å¿«é€Ÿè§£ä½“æ¨¡å¼',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'disintegrateShipFastMode',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é—´éš”å¤šé•¿æ—¶é—´æ£€æŸ¥ä¸€æ¬¡',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'disintegrateShipInterval',\
          ['type'] = 'Edit',\
          ['prompt'] = 'é—´éš”å¤šé•¿æ—¶é—´æ£€æŸ¥ä¸€æ¬¡',\
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
          ['text'] = 'å‡ºå¾è®¾ç½®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ç« èŠ‚',\
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
          ['text'] = 'èˆ°é˜Ÿ',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleFleet',\
          ['type'] = 'RadioGroup',\
          ['list'] = '1é˜Ÿ,2é˜Ÿ,3é˜Ÿ,4é˜Ÿ',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä½¿ç”¨å¿«ä¿®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleQuickRepair',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿‚å›ž',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleRoundabout',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ä¸èƒ½å‡ºå¾åˆ™æŠ¥è­¦',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleAlertWhenNoHp',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'æœ€å¤šå‡ æˆ˜',\
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
          ['text'] = 'ç‰¹æ®ŠåŠŸèƒ½',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '6-1aç‚¹é‡åˆ°èˆªæ¯SL',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleRebootAt6_1AMeetCV',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = '6-1aç‚¹é‡åˆ°é›·å·¡SL',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleRebootAt6_1AMeetCit',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'æ²¡é‡åˆ°è¡¥ç»™å°±SLï¼ˆæžèƒ–æ¬¡ï¼‰',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleRebootAtNotMeetAP',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'æˆ˜æ–—é€‰é¡¹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'æˆ˜æ–—é€‰é¡¹ä½¿ç”¨ç»Ÿä¸€é…ç½®',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOptionUseMain',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'ç»Ÿä¸€é…ç½®(åœ¨æœ¬é¡µé…ç½®),å•ç‹¬é…ç½®(åœ¨åŽé¢çš„é¡µé¢é…ç½®)',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[main]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é‡åˆ°æ½œè‰‡è‡ªåŠ¨åˆ‡æ¢å•æ¨ªé˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[main]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿½å‡»',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[main]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ç¬¬1æˆ˜ -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[1]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é‡åˆ°æ½œè‰‡è‡ªåŠ¨åˆ‡æ¢å•æ¨ªé˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[1]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿½å‡»',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[1]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ç¬¬2æˆ˜ -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[2]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é‡åˆ°æ½œè‰‡è‡ªåŠ¨åˆ‡æ¢å•æ¨ªé˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[2]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿½å‡»',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[2]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ç¬¬3æˆ˜ -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[3]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é‡åˆ°æ½œè‰‡è‡ªåŠ¨åˆ‡æ¢å•æ¨ªé˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[3]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿½å‡»',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[3]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ç¬¬4æˆ˜ -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[4]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é‡åˆ°æ½œè‰‡è‡ªåŠ¨åˆ‡æ¢å•æ¨ªé˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[4]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿½å‡»',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[4]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ç¬¬5æˆ˜ -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[5]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é‡åˆ°æ½œè‰‡è‡ªåŠ¨åˆ‡æ¢å•æ¨ªé˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[5]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿½å‡»',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[5]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
      },\
      {\
        {\
          ['type'] = 'Label',\
          ['text'] = 'ç¬¬6æˆ˜ -------------------------',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[6]battleFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'å•çºµ,å¤çºµ,è½®åž‹,æ¢¯å½¢,å•æ¨ª',\
          ['select'] = '1',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'é‡åˆ°æ½œè‰‡è‡ªåŠ¨åˆ‡æ¢å•æ¨ªé˜µåž‹',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[6]autoChangeFormation',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '0',\
        },\
        {\
          ['type'] = 'Label',\
          ['text'] = 'è¿½å‡»',\
          ['size'] = 15,\
          ['align'] = 'left',\
          ['color'] = '0,0,0',\
        },\
        {\
          ['id'] = 'battleOption[6]battlePursue',\
          ['type'] = 'RadioGroup',\
          ['list'] = 'æ˜¯,å¦',\
          ['select'] = '1',\
        },\
      },\
    },\
  }\
\
  local settingTableStr = json.encode(settingTable);\
  local ret, settings = showUI(settingTableStr);\
  if (ret ~= 1) then\
    stepLabel.setStepLabelContent('å–æ¶ˆè¿è¡Œ')\
    mSleep(100000)\
    lua_exit()\
  end\
  stepLabel.setStepLabelContent('æ­£åœ¨è½½å…¥...')\
  -- --è½¬æ¢settingsç»“æžœ\
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
  -- å‡ºå¾\
  settings.battleEnable = (function(battleEnable)\
    local list = transStrToTable({ true, false, })\
    return list[battleEnable] or false\
  end)(settings.battleEnable)\
  -- ä¿®ç†\
  settings.repairEnable = (function(repairEnable)\
    local list = transStrToTable({ true, false, })\
    return list[repairEnable] or false\
  end)(settings.repairEnable)\
  -- è§£ä½“\
  settings.disintegrateShipEnable = (function(disintegrateShipEnable)\
    local list = transStrToTable({ true, false, })\
    return list[disintegrateShipEnable] or false\
  end)(settings.disintegrateShipEnable)\
  -- ä»»åŠ¡\
  settings.missionEnable = (function(missionEnable)\
    local list = transStrToTable({ true, false, })\
    return list[missionEnable] or false\
  end)(settings.missionEnable)\
  -- è¿œå¾\
  settings.expeditionEnable = (function(expeditionEnable)\
    local list = transStrToTable({ true, false, })\
    return list[expeditionEnable] or false\
  end)(settings.expeditionEnable)\
  -- æ¼”ä¹ \
  settings.exerciseEnable = (function(exerciseEnable)\
    local list = transStrToTable({ true, false, })\
    return list[exerciseEnable] or false\
  end)(settings.exerciseEnable)\
  -- æˆ˜å½¹\
  settings.campaignEnable = (function(campaignEnable)\
    local list = transStrToTable({ true, false, })\
    return list[campaignEnable] or false\
  end)(settings.campaignEnable)\
  -- æ€»å¾ªçŽ¯é—´éš”æ—¶é—´\
  settings.missionsInterval = tonumber(settings.missionsInterval) or 0\
  -- å¤šé•¿æ—¶é—´ç•Œé¢ä¸å˜åˆ™é‡å¯ï¼Œæœ€å°‘60ç§’\
  settings.restartInterval = tonumber(settings.restartInterval) or 120\
  settings.restartInterval = math.max(settings.restartInterval, 60)\
  -- ä½¿ç”¨éœ‡åŠ¨æé†’\
  settings.alertUseVibrate = (function(alertUseVibrate)\
    local list = transStrToTable({ true, false, })\
    return list[alertUseVibrate] or false\
  end)(settings.alertUseVibrate)\
  -- ä½¿ç”¨pushbulletæŽ¨é€æé†’\
  settings.alertUsePushbullet = (function(alertUsePushbullet)\
    local list = transStrToTable({ true, false, })\
    return list[alertUsePushbullet] or false\
  end)(settings.alertUsePushbullet)\
  -- pushbulletçš„token\
  settings.pushbulletsToken = settings.pushbulletsToken or ''\
  -- pushbulletçš„è®¾å¤‡åˆ«å\
  settings.pushbulletNickname = settings.pushbulletNickname or ''\
\
  -- é€‰æ‹©è¿œå¾è¦å‚åŠ çš„ç« èŠ‚\
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
  -- è¿œå¾æ˜¯å¦ä½¿ç”¨å¿«é€Ÿä¿®ç†\
  settings.expeditionQuickRepair = (function(expeditionQuickRepair)\
    -- 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨'\
    local list = transStrToTable({ 3, 2, 1, 0 })\
    return list[expeditionQuickRepair] or 2\
  end)(settings.expeditionQuickRepair)\
  -- å½“æ— æ³•è¿œå¾æ—¶æ˜¯å¦æŠ¥è­¦\
  settings.expeditionAlertWhenNoHp = (function(expeditionAlertWhenNoHp)\
    local list = transStrToTable({ true, false, })\
    return list[expeditionAlertWhenNoHp] or false\
  end)(settings.expeditionAlertWhenNoHp)\
  -- é€‰æ‹©å…³å¡\
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
  -- é€‰æ‹©èˆ°é˜Ÿ\
  settings.battleFleet = (function(battleFleet)\
    local list = transStrToTable({ 1, 2, 3, 4, })\
    return list[battleFleet] or 1\
  end)(settings.battleFleet)\
  -- æ˜¯å¦ä½¿ç”¨å¿«é€Ÿä¿®ç†\
  settings.battleQuickRepair = (function(battleQuickRepair)\
    -- 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨'\
    local list = transStrToTable({ 3, 2, 1, 0 })\
    return list[battleQuickRepair] or 2\
  end)(settings.battleQuickRepair)\
  -- è¿‚å›žæˆ˜æœ¯\
  settings.battleRoundabout = (function(battleRoundabout)\
    local list = transStrToTable({ true, false, })\
    return list[battleRoundabout] or false\
  end)(settings.battleRoundabout)\
  -- å½“æ— æ³•å‡ºå¾æ—¶æ˜¯å¦è·³è¿‡å‡ºå¾\
  settings.battleAlertWhenNoHp = (function(battleAlertWhenNoHp)\
    local list = transStrToTable({ true, false, })\
    return list[battleAlertWhenNoHp] or false\
  end)(settings.battleAlertWhenNoHp)\
  -- å‡ºå¾æœ€å¤§æˆ˜æ–—æ¬¡æ•°\
  settings.battleMaxBattleNum = (function(battleMaxBattleNum)\
    local list = transStrToTable({ 1, 2, 3, 4, 5, 6 })\
    return list[battleMaxBattleNum] or 1\
  end)(settings.battleMaxBattleNum)\
  -- é˜µåž‹\
  settings.battleFormation = (function(battleFormation)\
    local list = transStrToTable({ 1, 2, 3, 4, 5 })\
    return list[battleFormation] or 2\
  end)(settings.battleFormation)\
  -- 6-1aç‚¹é‡åˆ°èˆªæ¯SL\
  settings.battleRebootAt6_1AMeetCV = (function(battleRebootAt6_1AMeetCV)\
    local list = transStrToTable({ true, false })\
    return list[battleRebootAt6_1AMeetCV] or false\
  end)(settings.battleRebootAt6_1AMeetCV)\
  -- 6-1aç‚¹é‡åˆ°é›·å·¡SL\
  settings.battleRebootAt6_1AMeetCit = (function(battleRebootAt6_1AMeetCit)\
    local list = transStrToTable({ true, false })\
    return list[battleRebootAt6_1AMeetCit] or false\
  end)(settings.battleRebootAt6_1AMeetCit)\
  -- æ²¡é‡åˆ°è¡¥ç»™å°±SLï¼ˆæžèƒ–æ¬¡ï¼‰\
  settings.battleRebootAtNotMeetAP = (function(battleRebootAtNotMeetAP)\
    local list = transStrToTable({ true, false })\
    return list[battleRebootAtNotMeetAP] or false\
  end)(settings.battleRebootAtNotMeetAP)\
  -- ä½¿ç”¨ç»Ÿä¸€æˆ˜æ–—é…ç½®\
  settings.battleOptionUseMain = (function(battleOptionUseMain)\
    local list = transStrToTable({ true, false })\
    return list[battleOptionUseMain] or false\
  end)(settings.battleOptionUseMain)\
\
  -- æ¼”ä¹ \
  -- é€‰æ‹©èˆ°é˜Ÿ\
  settings.exerciseFleet = (function(exerciseFleet)\
    local list = transStrToTable({ 1, 2, 3, 4, })\
    return list[exerciseFleet] or 1\
  end)(settings.exerciseFleet)\
  -- æ˜¯å¦è¿½å‡»\
  settings.exercisePursue = (function(exercisePursue)\
    local list = transStrToTable({ true, false, })\
    return list[exercisePursue] or false\
  end)(settings.exercisePursue)\
  -- æ˜¯å¦ä½¿ç”¨å¿«é€Ÿä¿®ç†\
  settings.exerciseQuickRepair = (function(exerciseQuickRepair)\
    -- 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨'\
    local list = transStrToTable({ 3, 2, 1, 0 })\
    return list[exerciseQuickRepair] or 2\
  end)(settings.exerciseQuickRepair)\
  -- é˜µåž‹\
  settings.exerciseFormation = (function(exerciseFormation)\
    local list = transStrToTable({ 1, 2, 3, 4, 5 })\
    return list[exerciseFormation] or 2\
  end)(settings.exerciseFormation)\
  -- é—´éš”æ—¶é—´ï¼Œæœ€å°0ç§’\
  settings.exerciseInterval = tonumber(settings.exerciseInterval) or 0\
  settings.exerciseInterval = math.max(0, settings.exerciseInterval)\
\
  -- æˆ˜å½¹\
  -- é€‰æ‹©å…³å¡\
  settings.campaignChapter = (function(campaignChapter)\
    local list = transStrToTable({ 1, 2, 3, 4, 5 })\
    return list[campaignChapter] or 1\
  end)(settings.campaignChapter)\
  -- é€‰æ‹©éš¾åº¦\
  settings.campaignDifficulty = (function(campaignDifficulty)\
    local list = transStrToTable({ 'default', 'hard' })\
    return list[campaignDifficulty] or 'default'\
  end)(settings.campaignDifficulty)\
  -- æ˜¯å¦è¿½å‡»\
  settings.campaignPursue = (function(campaignPursue)\
    local list = transStrToTable({ true, false, })\
    return list[campaignPursue] or false\
  end)(settings.campaignPursue)\
  -- æ˜¯å¦ä½¿ç”¨å¿«é€Ÿä¿®ç†\
  settings.campaignQuickRepair = (function(campaignQuickRepair)\
    -- 'ä¸æ»¡è¡€,ä¸­ç ´,å¤§ç ´,ä¸ä½¿ç”¨'\
    local list = transStrToTable({ 3, 2, 1, 0 })\
    return list[campaignQuickRepair] or 2\
  end)(settings.campaignQuickRepair)\
  -- ä¸èƒ½å‡ºå¾åˆ™æŠ¥è­¦\
  settings.campaignAlertWhenCantBattle = (function(campaignAlertWhenCantBattle)\
    local list = transStrToTable({ true, false, })\
    return list[campaignAlertWhenCantBattle] or false\
  end)(settings.campaignAlertWhenCantBattle)\
  -- é˜µåž‹\
  settings.campaignFormation = (function(campaignFormation)\
    local list = transStrToTable({ 1, 2, 3, 4, 5 })\
    return list[campaignFormation] or 2\
  end)(settings.campaignFormation)\
  -- ä¿®ç†\
  -- æ˜¯å¦ä¿®ç†æ‰€æœ‰èˆ¹\
  settings.repairAll = (function(repairAll)\
    local list = transStrToTable({ true, false, })\
    return list[repairAll] or false\
  end)(settings.repairAll)\
  -- å¤šé•¿æ—¶é—´ä¿®ç†ä¸€æ¬¡\
  settings.repairInterval = tonumber(settings.repairInterval) or 0\
  -- è§£ä½“\
  -- å¿«é€Ÿè§£ä½“æ¨¡å¼\
  settings.disintegrateShipFastMode = (function(disintegrateShipFastMode)\
    local list = transStrToTable({ true, false, })\
    return list[disintegrateShipFastMode] or false\
  end)(settings.disintegrateShipFastMode)\
  -- å¤šé•¿æ—¶é—´è§£ä½“ä¸€æ¬¡\
  settings.disintegrateShipInterval = tonumber(settings.disintegrateShipInterval) or 0\
\
  -- æˆ˜æ–—é€‰é¡¹ç»„åˆæˆæ•°ç»„\
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
  -- --è½¬æ¢settingsç»“æžœ\
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
local tsver = getTSVer(); --èŽ·å–è§¦åŠ¨ç²¾çµå¼•æ“Žç‰ˆæœ¬\
local tsint = tonumber(string.sub(tsver, 1, 1) .. string.sub(tsver, 3, 3) .. string.sub(tsver, 5, 5));\
--è½¬åŒ–ä¸ºæ•°å­—ç‰ˆæœ¬å·\
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
-- å°†åˆ†æ•£åœ¨å„ä¸ªæ–‡ä»¶çš„ä»»åŠ¡é›†åˆåˆ°ä¸€èµ·\
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
          -- å¦‚æžœæ˜¯é˜Ÿåˆ—åŽŸæœ‰ä»»åŠ¡åˆ™å°†å…¶åŠ å…¥é˜Ÿåˆ—æœ«å°¾ï¼Œä»¥ä¿è¯èƒ½ä¸€ç›´å¾ªçŽ¯\
          -- å¦‚æžœæ˜¯ä»ŽåŽŸæœ‰ä»»åŠ¡è¡ç”Ÿçš„ä¸‹ä¸€æ­¥ä»»åŠ¡ï¼Œåˆ™ä¸åŠ å…¥é˜Ÿåˆ—æœ«å°¾ï¼Œä¼šè¢«æ–°çš„ä¸‹ä¸€æ­¥ä»»åŠ¡æ›¿æ¢æˆ–è€…åˆ é™¤\
          if (action.isBase) then\
            table.insert(missionsQuery, action)\
          end\
\
          -- æ‰§è¡Œä¸€ä¸ª action\
          if action.type then\
            local nextAction = c.yield(chainObj.next(action))\
            if type(nextAction) == 'table' and type(nextAction[1]) == 'table' and nextAction[1].type then\
              -- è¿”å›žçš„æ˜¯ action åˆ—è¡¨ï¼Œå°†åˆ—è¡¨æ’å…¥åˆ° missionsQuery çš„å¼€å¤´\
              table.remove(missionsQuery, 1)\
              for key = #nextAction, 1, -1 do\
                table.insert(missionsQuery, 1, nextAction[key])\
              end\
            elseif type(nextAction) == 'table' and nextAction.type then\
              -- è¿”å›žçš„æ˜¯å•ä¸ª action\
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
          -- å¦‚æžœæ˜¯ä»»åŠ¡é˜Ÿåˆ—ç»“å°¾æ ‡å¿—ï¼Œåˆ™count+1\
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
-- æ˜¯å¦éœ€è¦æ˜¾ç¤ºstack tracebacké‡Œçš„é”™è¯¯ä¿¡æ¯\
-- stack tracebacké”™è¯¯ä¿¡æ¯å¾ˆé•¿ï¼Œæ‰€ä»¥è¿™ä¸ªåŠŸèƒ½ä½œä¸ºå¯é€‰é¡¹\
local stackTraceback = false\
-- å°è£…äº†xpcallæ–¹æ³•\
function tryCatch(cb)\
  return xpcall(cb, function(e)\
    return stackTraceback and\
      (e .. '\\n' .. debug.traceback())\
      or (e)\
  end)\
end\
\
-- ç»‘å®šselfåˆ°æŸä¸ªæ–¹æ³•\
function bindSelf(fn, self)\
  return function(...)\
    return fn(self, ...)\
  end\
end\
\
-- éš”ç¦»å‡½æ•°ï¼Œä¸ºäº†é˜²æ­¢å›žè°ƒè¿‡å¤šå¯¼è‡´çˆ†æ ˆéœ€è¦éš”ç¦»å›žè°ƒæ“ä½œ\
function asap(callback)\
  local co = coroutine.wrap(callback)\
  co()\
end\
\
-- ç±»\
local Promise = {\
  setStackTraceback = function(value)\
    stackTraceback = value\
  end\
}\
\
-- ç±»æ–¹æ³• ï¼ˆé™æ€æ–¹æ³•ï¼‰\
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
  -- promiseçš„ä¸»è¦æ–¹æ³•ï¼Œè¿™ä¹ˆå†™æ˜¯ä¸ºäº†ç»‘å®šself\
  newPromise.andThen = bindSelf(andThen, newPromise)\
  newPromise.catch = bindSelf(catch, newPromise)\
\
  -- æ‰§è¡Œä¼ å…¥promiseçš„æ–¹æ³•\
  resolver(bindSelf(resolve, newPromise), bindSelf(reject, newPromise))\
\
  return newPromise\
end\
\
function Promise.isPromise(obj)\
  return (type(obj) == 'table') and type(obj.andThen) == 'function'\
end\
\
--- - Promise.resolveæ–¹æ³•ç›¸å½“äºŽå®žä¾‹åŒ–ä¸€ä¸ªPromiseå¯¹è±¡ï¼ŒçŠ¶æ€å˜ä¸ºRESOLVED\
function Promise.resolve(value)\
  if (Promise.isPromise(value)) then return value end\
  return Promise.new(function(resolve, reject)\
    resolve(value)\
  end)\
end\
\
--- - Promise.rejectæ–¹æ³•ç›¸å½“äºŽå®žä¾‹åŒ–ä¸€ä¸ªPromiseå¯¹è±¡ï¼ŒçŠ¶æ€å˜ä¸ºREJECTED\
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
-- å¯¹è±¡æ–¹æ³•\
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
    -- å½“å‰promiseçš„çŠ¶æ€è½¬æ¢äº‹ä»¶å¤„ç†å‡½æ•°\
    onResolved = type(onResolved) == 'function' and onResolved or nil,\
    -- å½“å‰promiseçš„çŠ¶æ€è½¬æ¢äº‹ä»¶å¤„ç†å‡½æ•°\
    onRejected = type(onRejected) == 'function' and onRejected or nil,\
    resolve = resolve,\
    reject = reject,\
  }\
end\
\
-- promiseçš„ä¸»è¦æ–¹æ³•ã€‚ç”±äºŽluaä¸­thenæ˜¯å…³é”®å­—ï¼Œæ‰€ä»¥ç”¨andThenå–ä»£\
function andThen(self, onResolved, onRejected)\
  -- thenæœ¬èº«ä¹Ÿä¼šè¿”å›žä¸€ä¸ªpromiseï¼Œå®žçŽ°promiseé“¾\
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
      -- æ‰§è¡Œå½“å‰promiseçš„çŠ¶æ€è½¬æ¢äº‹ä»¶å¤„ç†å‡½æ•°\
      ret = cb(self.PromiseValue)\
    end)\
    if (not xpcallRes) then\
      -- ä¿®æ”¹promiseé“¾è¡¨ä¸­ä¸‹ä¸€ä¸ªpromiseå¯¹è±¡çš„çŠ¶æ€ä¸ºrejected\
      deferred.reject(xpcallErr)\
      return\
    end\
    -- ä¿®æ”¹promiseé“¾è¡¨ä¸­ä¸‹ä¸€ä¸ªpromiseå¯¹è±¡çš„çŠ¶æ€ä¸ºresolved\
    deferred.resolve(ret)\
  end)\
end\
\
-- å¯¹çŠ¶æ€è½¬æ¢äº‹ä»¶å¤„ç†å‡½æ•°è¿›è¡Œå°è£…åŽï¼Œå†ä¼ ç»™æ‰§è¡Œå‡½æ•°\
function doResolve(self, andThenFn, onResolved, onRejected)\
  -- doneä½œä¸ºå¼€å…³ä»¥é˜²æ­¢fnå†…åŒæ—¶è°ƒç”¨resolveå’Œrejectæ–¹æ³•\
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
-- ç§»åŠ¨åˆ°é“¾è¡¨çš„ä¸‹ä¸€ä¸ªpromise\
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
-- promiseçš„ä¸»è¦æ–¹æ³•\
function catch(self, onRejected)\
  -- thenæœ¬èº«ä¹Ÿä¼šè¿”å›žä¸€ä¸ªpromiseï¼Œå®žçŽ°promiseé“¾\
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
package.sourceCode["./utils/clear-log.lua"] = { path = "./utils/clear-log.lua", name = "./utils/clear-log.lua", source = "-- åˆ é™¤å¤§äºŽ7å¤©å¹¶ä¸”å¤§äºŽ50æ¡çš„logï¼Œé¿å…æ—¥å¿—è¿‡å¤§\
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
-- 0=ç«–å±ï¼Œ1=å³æ—‹ï¼ˆhomeé”®åœ¨å³è¾¹ï¼‰ï¼Œ2=å·¦æ—‹ï¼ˆhomeé”®åœ¨å·¦è¾¹ï¼‰ï¼Œ3=å€’ç«‹\
__init(0)\
local w, h = getScreenSize()\
local m = math.max(w, h)\
local sideLength = math.min(w, h)\
local orient = 0;\
local nextUpdateTime = 0\
\
-- è®¡ç®—æ–¹å‘è¾…åŠ©ç•Œé¢ï¼Œä¸€åƒç´ å®½åº¦çš„ç™½è‰²è¾¹ç•Œï¼Œä¸€åƒç´ å®½çš„é»‘è‰²è¾¹ç•Œï¼Œç”¨äºŽæ£€æµ‹æ–¹å‘\
fwShowWnd(\"orientwid1\", 0, 0, 2, m, 0)\
fwShowTextView(\"orientwid1\", \"text1\", \"\", \"center\", \"000000\", \"FEFEFE\", 15, 0, 0, 0, 1, m, 1)\
fwShowTextView(\"orientwid1\", \"text2\", \"\", \"center\", \"000000\", \"010101\", 15, 0, 1, 0, 2, m, 1)\
mSleep(100)\
\
-- è®¡ç®—å½“å‰æ–¹å‘\
function calOrient(_orient)\
  local result = _orient\
  -- å¯»æ‰¾ç™½è‰²è¾¹ç•Œ\
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
  -- å¦‚æžœæ–¹å‘æ²¡å˜åˆ™ä¸æ—‹è½¬\
  if (multiColorS(checkPointList)) then\
    return _orient\
  end\
  -- å¦‚æžœæ–¹å‘å˜äº†åˆ™æ—‹è½¬\
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
-- èŽ·å–å½“å‰æ–¹å‘\
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
-- è®¾ç½®å½“å‰æ–¹å‘ï¼Œå½“ç„¶åªèƒ½è®¾ç½®initçš„æ–¹å‘\
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
package.sourceCode["./utils/keep-screen-hock.lua"] = { path = "./utils/keep-screen-hock.lua", name = "./utils/keep-screen-hock.lua", source = "-- å…¨å±€å‡½æ•°ç”Ÿæˆï¼Œç”±äºŽéƒ¨åˆ†è®¡ç®—è¿‡ç¨‹ä¸æƒ³æš´éœ²æ‰€ä»¥ç”¨äº†é—­åŒ…\
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
  -- å°† table çš„æ•°ç»„éƒ¨åˆ†å–å‡º\
  for k, v in ipairs(tab) do\
    tabLength = k\
    table.insert(newTabPairs, { k, runTable(v, space) })\
    if (type(v) == 'table') then\
      hasSubTab = true\
    end\
  end\
\
  -- å°† table çš„ map éƒ¨åˆ†å–å‡ºï¼Œå¹¶æŒ‰ç…§å­—å…¸é¡ºåºæŽ’åº\
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
    local n = string.len(str) --é•¿åº¦\
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
package.sourceCode["./lib/table-polyfill.lua"] = { path = "./lib/table-polyfill.lua", name = "./lib/table-polyfill.lua", source = "-- tableæ–¹æ³•æ·»åŠ \
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
-- åŽè¦†ç›–å‰çš„unique\
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
-- å¯¹keyæŽ’åºåŽæ”¾å…¥æ•°ç»„ä¸­å†è¿”å›žï¼Œç»“æžœç±»ä¼¼entries\
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


package.preload["TSLib"] = assert(load("\27TS1R\0\1\4\4\4\8\0\25“\13\
\26\
\14\9\20 6\30ø\11Fo<'Qé\30gIW.XŒqqCè»\2\24AcÉ2V\8\9\20 ìkV80\8t\25:\8t\25i\19á.hzN!bÂ g%ô®]=vSùŸÔWŽšK({¢Ó5,Öß\\Ò`h$\24\9v\25\30\9v\25r©6)àÕÑb\24ÕAtß\"]}R·\25C ›Ô\7\1!\8\6 |aÉ<ð\15¨6\23†\5+ÂÐ\5dBùÆ\29aÝ3\3NBw'*µÉ5\0\11\8\8 ý7\16@RÁ§FŽ¬Sn‚pV4\18ö&¢\0151ÿ\\!àÈ7S3·\24c*Ÿ1yncƒ{®Yì\24Vu\17Vg\0\0\0§‚‚‚Â‚‚‚ß\2\2‚\5‚B‚EÂB‚§Ã‚‚Š‚ƒ\3§\3‚‚Š‚\3\3§C‚‚Š‚ƒ\0§ƒƒ‚Š‚\3\0§Ãƒ‚Š‚ƒ\1§\3ƒ‚Š‚\3\1§Cƒ‚Š‚ƒ\6§ƒ€‚Š‚\3\6§Ã€‚Š‚ƒ\7§\3€‚Š‚\3\7§C€\0\8\0\1†%\1\3\0\8\0†%A\3\0\8\0\1‡%\3\0\8\0‡%Á\3\0\8\0\1ˆ%\1\4\0\8\0ˆ%A\4\0\8\0\1‰%\4\0\8\0‰%Á\4\0\8\0\1Š%\1\5\0\8\0Š%A\5\0\8\0\1‹%\5\0\8\0‹%Á\5\0\8\0\1Œ%\1\6\0\8\0Œ%A\6\0\8\0\1%\6\0\8\0%Á\6\0\8\0\1Ž%\1\7\0\8\0Ž%A\7\0\8\0\1%\7\0\8\0%Á\7\0\8\0\1%\1\8\0\8\0%A\8\0\8\0\1‘%\8\0\8\0‘%Á\8\0\8\0\1’\6\1I\0\8\0’%\1\9\0\8\0\1“%A\9\0\8\0“%\9\0F\1J\0J\1”eÁ\9\0\8@\1•e\1\
\0\8@•eA\
\0\8@\1–e\
\0\8@–eÁ\
\0\8@\1—e\1\11\0\8@—eA\11\0\8@\1˜e\11\0\8@˜eÁ\11\0\8@\1™\31\0€\0\5\7\21 uá\16\2É\30H\127!š½\2Ž¶Rv¨A¥|sQ×E®Q'~\6\3\16I\25ï² \2žaÏ4\1\0\0\0\1\0\6\7!\25±ƒ¦fàZ–R\1\13ìI\0Æ\29\14\
\16`\8£Mé\127ýý-N3\0\0\0\4\8\0\0\0\2%\21>35=V\4\
\0\0\0009&\"\9 7:#3V\4\11\0\0\0\2\5\0003$%?98%V\4\4\0\0\0\"7&V\4\
\0\0\0$7829;\0027&V\4\11\0\0\0$7829;%\0027&V\4\7\0\0\0;9 3\0029V\4\12\0\0\0;9 3\0029!7$2%V\4\12\0\0\0;9 3\01299;\25#\"V\4\11\0\0\0;9 3\01299;\0318V\4\17\0\0\0;9 3\21?$5:3\02138\"3$V\4\17\0\0\0;9 3\21?$5:3\00698?\"%V\4\9\0\0\0?8\"\0029\00414V\4\9\0\0\0$14\0029\0318\"V\4\8\0\0\0?%\0219:9$V\4\11\0\0\0;#:\"?\0219:9$V\4\12\0\0\0;#:\"?\0219:\0027&V\4\9\0\0\0%\"$\5&:?\"V\4\12\0\0\0?%\16?:3\19.?%\"V\4\15\0\0\0$372\16?:3\5\"$?81V\4\9\0\0\0$372\16?:3V\4\
\0\0\0!$?\"3\16?:3V\4\16\0\0\0!$?\"3\16?:3\5\"$?81V\4\8\0\0\00023:\16?:3V\4\15\0\0\0%3\"\0183 ?53\23:?7%V\4\8\0\0\0:#7\19.?\"V\4\9\0\0\00013\"\0243\"\31\6V\4\4\0\0\0:91V\4\11\0\0\00013\"\23&&\0247;3V\4\11\0\0\00013\"\3%3$\23&&V\4\9\0\0\0>\"\"&\0069%\"V\4\8\0\0\0>\"\"&\0173\"V\4\9\0\0\0?8&#\"\5\"$V\4\16\0\0\0005:37$\0067%\"3497$2V\4\13\0\0\0005:37$\02199=?3%V\4\11\0\0\0005:37$\31\18\16\23\0V\4\15\0\0\0005:37$\23::\6>9\"9%V\4\12\0\0\0\0183:\23::\6>9\"9V\4\18\0\0\0005:37$\23::\0293/\21>7?8%V\4\
\0\0\00013\"\5\"$\24#;V\4\3\0\0\0\9\17V\4\
\0\0\00013\"\00482\24#;V\4\6\0\0\0\3\31\0243!V\4\12\0\0\0%87&\02382\0057 3V\4\14\0\0\000233&\0219&/\00274:3V\4\
\0\0\00013\"\0043823$V\4\6\0\0\0?%\0187/V\4\11\0\0\0005>35=\00274:3V\4#\0\0\0000?82\27#:\"?\0219:9$\0318\00431?98\16#,,/\20/\00274:3V\4\7\0\0\000839%\3\31V\4\8\0\0\00095$\031809V0\0\0\0\11\9\20 ‹\22D_l\25Fm\3\9\20 4¶âfwò+=ÌÓ…L\16÷²\20€§½+9í»\"²oâE\8\13®;| !lMË\23'}\8t\0254\8t\25ëY{n&\25$\11óƒ\7ìímu\25\9v\25\18\9v\25¯ãÙZ©>D3¦\20æ\11UÂY\30¨5N fßç0\25SZbgc«[\
Õ&)À©\22O\0(\8\6 –b=m\0\0\8\8 \6¼Þ('Av\7SÌ\18|}®\
fó\20üScÃÅ\16ýUÈ\17,\2¸vHyV4\18¨\"Ùb\31\0\0\0CÈIH\14H\8HB\8HÈ\14\8\8HB\8ÈÈ\14È\8HB\8HÉ\14ˆ\8\0\
@€K€\0\0†\0A\0‡@A\1J€€‚†\0A\0‡€A\1J€\0ƒ\
@\0‚K@\0\0†ÀA\0‡\0B\1J€\0„\
@€ƒe\0\0\0¥@\0\0å€\0\0\11Á\0\0\
€„\
Á\0…\
A€…\31\1\0\1\31\0€\0\8\7\21 \127M•*“À2^Ñ$Ù!‹@\0252\127® S[&»h:$ó\12(íä\6\1;¡tæL+\5\2\16I\25h\26‰%©9§\0138†Þ\2\1\0\0\0\0\0\6\7!\25iã½\\ä'ò}\8Rí;ˆùíqëãÐ&/“cCÜÅ\0n\12\0\0\0\4\9\0\0\0\25\2\3\24\0\15\8\31m\4\5\0\0\0\25\20\29\8m\4\6\0\0\0\8\31\31\2\31m\4\7\0\0\0\30\8\1\8\14\25m\4\7\0\0\0\30\25\31\4\3\
m\4\7\0\0\0\11\2\31\0\12\25m\4\5\0\0\0\11\4\3\9m\4\6\0\0\0\9\8\15\24\
m\4\8\0\0\0\
\8\25\4\3\11\2m\4\8\0\0\0009\30.\5\8\14\6m\4\
\0\0\0\2\29\0252\27\12\1\24\8m\4\8\0\0\0\15\12\0092\12\31\
m\3\0\0\0\11\9\20 Êµ'JÙa¯kö\12\9\20 ½¢wÃ1…d×WŠFèý\12B \25ÚL(\8t\0258\8t\25eÐù<ÚÿÇc±24\\\1\20ãXH0]I\30Ù&O5\15é;ü]0\24\23\9v\25\18\9v\25¼½çTkpùl\16;š\21\24›ë\27]‰u^ÿ<­\24ÿ˜O<e ‡En(¤\14¡&B@\0 \8\6 ?#ýSlÜi\
ÿ§\16g·­è\\ÖFa\31Že³^zßmA­žëevcÀ \6\11\8\8 þQ#\16Û3º]tø\15r÷{V4\18½(m;Í]~;\18W†r:\0\0\0qö·÷7öwõjv÷ö«¶÷ôà÷÷w¶¶÷÷qv·÷p6·ô:¶öujv÷ö1¶¶÷ðu¶ô*v÷öï76ôàw\0€ÇA\3ÛA\0\0\23\0\0€Á\1\2\0\6BA\0GBB\3\29‚\0\1\24ÀA\4\23€\0€\7BB\3\27B\0\0\23À\1€\6BA\0@\2\0\0\29‚\0\1\24ÀA\4\23@\0€\28B\0\0\23\0\0€\1‚\2\0X\0B\2\23@\1€FÂA\0GÂÂ\4\2\3\0À\2\0\2]‚€\1\0\1€\4FBC\0†ÂA\0‡ÂB\5Á‚\3\0\0\3€\0@\3\0\1€\3€\3À\3\0\4\0\4€\1@\4\0\2‚\0\4ÍB‡^\2€\1_\2\0\0\31\0€\0\8\7\21 ^…r~Î\20nG$÷–@oÀ\12\20æ¯Yc€\12\31ný¹,åH©\31æ ”dÝ%^;\18\3\16I\25\12gõ_\28I[\15\1\0\0\0\1\0\11\7!\25\12\15\6GÔöClÉ’¶\9št¹%NÖ±-v1¢o\17ØyFéÎù;tƒÅ\127ì\0114$\16\0\0\0\4\9\0\0\0‚™˜ƒ›”“„ö\3\0\0\0\0\0\0\0\0\4\6\0\0\0’“”ƒ‘ö\4\8\0\0\0‘“‚Ÿ˜™ö\3\0\0\0\0\0\0\0@\4\5\0\0\0‚†“ö\4\9\0\0\0˜—›“ž—‚ö\4\7\0\0\0…‚„Ÿ˜‘ö\4\1\0\0\0ö\4\5\0\0\0˜—›“ö\4\2\0\0\0Éö\4\7\0\0\0™„›—‚ö\4\12\0\0\0ÚÖ\19Ha\19~FÖÓ…ö\4\6\0\0\0“„„™„ö\4D\0\0\0\16j\\\30uK\16~f\19|i\30If\30WzÚ\19yt\16cF\19Ly\19yAÌÕÓ’Ó…Ö\19qK\16cFÌÓ…ÖÑÓ…ÑÖÞ\31jv\30PwÖÓ…ÖÓ…ßö\3\0\0\0\0\0\0\8@\0\0\0\0\26pi\23#\8\29lÉSÑZ\26ðviðe›'ÛªWMÓv\20=Oë\13&©¿Å\20\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 yóBÁ\5¼^½\0 sè\5“]¿Æ´\1ñC¯\3üÎ—-U§þpÛBX1u\15\9\20 ¹0{\28\\§\25i_Œö+ŠFªli­Ðn½*„)\30\8t\0251\8t\25ç%\28G\2\9v\25\31\9v\25³¯ýh³AØQ,y4t\0d%,çFÆ\22­‘&ÔmØ\8\1.\8\6 Y&Ä[¸ýð<°Š¤~éŸ·\30y\3­\27m‹DrÑ¥J|\2\13\8\8 _ÏóuÍtâ)Žq`\14:\18L'ìó´/á~V4\18H›Î\24[\20D=}‰q0±HŸ\7\24?Èf†u†cV\0\0\0gá¡á!ááá|aáà¹¡¡àöáãadáaá aááà áá ààá` áá'à¡ááãáá<àáà|¡áágá¡á!áaá|aáà¹¡ àöáãadáaá aááà`\1\0AÁ\1\0A\1\0Æ\1@\0\0\2€\0Ý\1\0\1@\0\0†\0B\0Á@\2\0&\1\0\0€\0\0\25\0\0\1\23\0\2€Å\0€\0\1\2\0@\1\0\0\2\0À\1€\0\1Â\2\0Þ\0\0\3ß\0\0\0\23@\
€Æ\0B\0\0\1\0\0f\1\0\0Ý€\0\0\6AA\0\7\1C\2@\1€\0A\0\0\29€\1\27\1\0\0\23@\2€\6AC\0@\1€\1\29\0\1\27\1\0\0\23\0\1€\6AC\0@\1€\1\30\1\0\1\31\1\0\0\23\0\5€\6AA\0\7\1C\2@\1€\0†\1@\0À\1€\1\1\0\1\29\0\0\27A\0\0\23€\2€\5\1€\0A\2\0€\1\0\0Á\2\0\0\2€\0F\2@\0€\2€\1]\2\0\1\30\1\0\0\31\1\0\0\23\0\0€ß\0\0\1\31\0€\0\1\7\21 ¡\28È\0099%„LK°“ \11\3\16I\25:‰©x3÷Y7\2\0\0\0\1\0\1\1\5\7!\25\14÷\1)aN\4ÔMP\0Æôr>\14\0\0\0\4\5\0\0\0\1\12\5\16u\4\7\0\0\0\27\0\24\23\16\7u\4\8\0\0\0!\0066\29\16\22\30u\3\0\0\0\0\0\0ð?\4\12\0\0\0]\20\7\18*\22\26\0\27\1\\u\4\7\0\0\0\6\1\7\28\27\18u\3\0\0\0\0\0\0\0@\4\16\0\0\0]\16\13\5\16\22\1\16\17*\1\12\5\16\\u\4\7\0\0\0\6\16\25\16\22\1u\4\2\0\0\0Vu\4\1\0\0\0u\4\9\0\0\0\27\26U\3\20\25\0\16u\4\5\0\0\0\19\28\27\17u\4\9\0\0\0\1\26\27\0\24\23\16\7u\0\0\0\0\17pi\23½í\7\31@ø\31ZGw7u\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 j}P|oåî\26ˆ×\26+•(;iI\
\9\20 Å\24|\3t:â\25úËiXw\8t\0251\8t\25Ô\25&(\9v\25\18\9v\25\22±›\17/>ºB½4Æe\0*fZšØL\\{RfeúÜ\"bãVmI·Êa¨ÃÏR\1,\8\6 õ3\31I¦Ö¥Xþ\8yH«-9\13s²±6\3\1\8\8 y\13º\25 ²\25Q\2Ô\6éò¨4¨XÍDæ*\15p£³ø2Ét…\29«C‹s-~V4\18×ô\24ë{ôr g¾\31£ˆ*\26º®5Þ›„\5h\0\0\0ë-m--,--ð­-,umí,:-/­è-­-,¬--lì--¬,,-ìl--+/m-m/--0/-,ðm--ë-m--,­-ð­-,umì,:-/­è-­-,¬--l¬,-¬ì,-ìl,-+/m-m/­-\29\2\0\1Ý@\0\0Æ@A\0Ç\0Â\1\0\1€\0F\1@\0€\1\0\1]\1\0\1Ý€\0\0Û@\0\0\23@\3€Æ\0@\0\0\1\0\1Ý€\0\1X@Â\1\23\0\2€Å\0€\0\1\0\0A\2\0Á\2\0À\1€\0\6\2@\0@\2\0\1\29\2\0\1Ý@\0\0Æ\0C\0\1A\3\0f\1\0\0Ý€\0\0\25\0€\1\23@\0€Ÿ\0\0\1\23À\
€\6\1C\0@\1\0\0¦\1\0\0\29\0\0FAA\0G\1Â\2€\1€\0ÁA\0\0]€\1[\1\0\0\23@\2€FC\0€\1\0\2]\0\1[\1\0\0\23\0\1€FC\0€\1\0\2^\1\0\1_\1\0\0\23€\5€FAA\0G\1Â\2€\1€\0Æ\1@\0\0\2\0\2Ý\1\0\1]\0\0[A\0\0\23\0\3€E\1€\0Á\3\0À\1\0\0\1Â\3\0A\2\4\0€\2€\0V‚‚\4†\2@\0À\2\0\2\2\0\1^\1\0\0_\1\0\0\23\0\0€\31\1\0\1\31\0€\0\1\7\21 ´’û\17Yîêjž\25g\12\8\16I\25£¥µLFSé9üÐ²\26˜ÙÔ\21ì)\18úÙ+cC\7\14#_Ü@Ià^¯m\2\0\0\0\1\0\1\1\11\7!\25\127]ób1aƒt¦\7qq(¶À'\23Œ’dI»i$ñ*FEÂÏ\29Xa©Dq´k5;\17\0\0\0\4\5\0\0\0=09,I\4\7\0\0\0'<$+,;I\4\
\0\0\0&9=\22?(%<,I\3\0\0\0\0\0\0ð?\4\12\0\0\0a(;.\22*&<'=`I\4\7\0\0\0:=; '.I\3\0\0\0\0\0\0\0@\4\16\0\0\0a,19,*=,-\22=09,`I\4\5\0\0\0/ '-I\4\4\0\0\0' %I\3\0\0\0\0\0\0\8@\4\14\0\0\0a-,/(<%=\22?(%`I\4\7\0\0\0:,%,*=I\4\2\0\0\0jI\4\9\0\0\0=&'<$+,;I\4\1\0\0\0I\4\5\0\0\0&9=gI\0\0\0\0\27pi\23L%9dÔÒóZó/£\27gßç\25²nx`—â™ \27rã+\12]cK5r³\7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\16pi\23¯\2\25\24|ÅœA\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 79\8c1\15\9\20 \20?\0058,Îÿ\15õÛ7TìnãM*a.x¾~‰%e\8t\0256\8t\25\26ñBg½Š¶Y\22É\26Dòâ7\0003­§3_³ê\31K\9v\25\25\9v\25}\1&d\0+\8\6 \29ÚÎO©ÁÌ\26\0\15\8\8 Qž\0193û\9¸\18zâÄ*\30ùSÝ\13UV\22Sõ\17ÚOX-5{V4\18\17‰`\16‘\15+\26 ¶\5,\3\0\0\000455\0\31\0\0\1\31\0€\0\4\7\21 ¾Ý**\21’=\0\0177I\22è>Y\"Ó\16Ç%ì\4:'\2\0\16I\25‘›}\127\0\0\0\0\7\7!\25ô\18Ô\9ÄH%3b?\11å\3\21eAJK\0233z÷/\1\0\0\0\4\6\0\0\0\0\31\3\31\0011\0\0\0\0\27pi\23ë\11\0242¡ÅÿiS|÷gæ\21ÐD\27¨Ä\20quˆ;Ã#%\0271û¹&KÅàh\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 \5çÐx˜z¶Lþ\12\9\20 NŸãRxg¹_Xr9\0282ÈÇ<ê\3/fR\8t\0251\8t\25½àù'O\9v\25\26\9v\25òî€GÝ =l\1 \8\6 ;!Swu\15{\17ž\20}F9£ù#vzòx|Àö\9Ñ«ƒ\2,…l\27ÚÔ.\0\
\8\8 7d…S½ÒÜ`ÐpV4\18\15\20˜\3‡ïQð\"\6y§ŽNP\9WŸU²\23d3õ-2#¾X54\0\0\0ÖÐÐ×Ð–PÐÐPÐÍÐÐÕÐPÐ‘\16ÐÐQÐÑÐ6ÐÐÐÍPÐÐ•ÐPÐQÑÐ\17ÐÑÐ&\1\0\0]€\0\0…\0\0\1Á€\1\0\1\1\1\0F\1@\0GÁÁ\2\1\2\0ÁA\2\0]€\1¦\1\0\0€\0\0Æ\0@\0ÇÀÁ\1\1Á\0\0A\2\0Ý€€\1\6ÁB\0@\1€\1€\1\0\0À\1€\0\29A\0\2\6\1C\0AÁ\0\0\29A\0\1\6AC\0@\1€\1€\1\0\0À\1€\0\29A\0\2\6\1C\0@\1\0\1\29A\0\1\6C\0@\1€\1€\1\0\0À\1€\0\29A\0\2\31\0€\0\7\7\21 'öù_lÂ‡\27v”±\3åÖó\7uY½}\8\0\16I\25Âw1t\3\0\0\0\0\0\1\2\1\3\7\7!\25£¤…B7‡¬\5ßöˆ7ÜG\127f­\1Ÿ~[·\127A\15\0\0\0\4\5\0\0\0“ŸŠ–þ\4\11\0\0\0ŒŸš‘“››šþ\4\
\0\0\0™›Š¬š°‹“þ\3\0\0\0\0\0\0ð?\4\7\0\0\0‹“œ›Œþ\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\7\0\0\0ŒŸš‘“þ\3\0\0\0\0\0\0>@\3\0\0\0\0\0\0I@\3\0\0\0\0\0\0\"@\4\
\0\0\0Š‘‹–º‘‰þ\4\7\0\0\0“­’››Žþ\4\
\0\0\0Š‘‹–³‘ˆ›þ\4\8\0\0\0Š‘‹–«Žþ\0\0\0\0\22pi\23;.$kv‘Tp\6ÀR)r’©>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 ÎMB þþß}]„'z\30%\0055'\22p\127N³“xæ\19coú\0\9\20 ¨/@Zf%êj²Ú\17\27ýØ¬\21×8š\11!ÈµS\27\26ÙH…6ð*˜>\9\6^\8t\0254\8t\25f \31Y`zLB\13\16¬(s¾h.{\9v\25\27\9v\25óQá/T$nU\24ž`*\1/\8\6 jÄe\31_\16\18D\22_\0178\18¨?œ^ð\15¡š†\11\0\9\8\8 Ãt`\15\\\127V4\18\13KÂ\8æÀ¥:äzP>sp¬s˜›·UâSýSJ©F\1278\0\0\0Y\\\\\\\29\\\\\\Ý\28\\\\º\\\\\\AÜ\\\\\25\\\\\\ÝÜ\\\\\28\\\\z]\\\\\1Ü\\\\Ù\\Ü\\œ\\\\]\29\\\\\29]]\\¦\1\0\0€\0\0Æ@A\1Ç€Á\1\6ÁA\1\29\1€\0Ý@\0\0Æ@A\1Ç\0Â\1\19\1\0\1@\1\0\1Ý€€\1\13À\0\0Æ@A\1Ç\0Â\1\19\1\0\1@\1\0\1Ý€€\1MÀ€\0Æ@B\1\1\1\0\0@\1\0\0€\1€\0Ý@\0\2Æ€B\1\1\1\0\0@\1\0\0€\1€\0Ý@\0\2ÆÀB\1\6AA\1\7\1B\2A\1\3\0A\3\0\29\1€\1Ý@\0\0Æ€C\1\1\1\0\0@\1\0\0€\1€\0Ý@\0\2\31\0€\0\3\7\21 ýmÖ\28\7\3\16I\25R¢v/—ï\31\4\3\0\0\0\1\2\1\3\0\0\7\7!\25²\28Ãq¤ÿË,©>¿1L\16\0221—Q­\\ýb-\7\15\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0”—˜Ÿˆú\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\20@\4\5\0\0\0—›Ž’ú\4\11\0\0\0ˆ›”ž•—‰ŸŸžú\4\
\0\0\0ŸŽ¨”ž´—ú\4\7\0\0\0ˆ›”ž•—ú\4\
\0\0\0Ž•™’¾•”ú\4\
\0\0\0Ž•™’·•ŒŸú\4\7\0\0\0—©–ŸŸŠú\3\0\0\0\0\0\0D@\3\0\0\0\0\0\0N@\4\8\0\0\0Ž•™’¯Šú\0\0\0\0\24pi\23'Ó\9hg'“&\2\14‡mkéhyŸ9;fžlw}\12„ï\4õpèZbá×\12üÑ\9\9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 ¿´Ë\20Õ\15VaH<\31xýó\4t£{sO#Ê›eè¥y#Ø£(]\
\
\9\20 5Š’aké¾K¢ÝÑL¼\8t\0259\8t\25Ô2ëTØâ0\13Oò\127sñ·Iï¸\18!ˆ&úQÍÒGBwè‡,iR²hw\9v\25\30\9v\25ó\12Ó1»'y‡y›GÚ\6W\20\21\3·:\0080Ž\23\1-\8\6 Õ·‚OÝ?äxc*§UÒ«‡C\0\13\8\8 †ôB;ºQ\1gX_€%¬}G\18\21 \12`zV4\18·ýÝ,·øhpu\0\0\0•Ñ\17Ðv\16Õ\17\16QÐ¶‘Í\16\21\16QP‘ÑÑ‘‘6‘\13\16u‘\16‘Ñ‘\17Ñ‘\17\16‘ÌÑ‘‡\16Ñ\17‘\16‘\16‘C‘\16’’\16’\13\17\16‘\29\17‘P\1€\1\19\2€\2@\2€\2Ý€\1ÍÁ\0\6ÂA\1@\2\0\2€\2\0\3À\2€\3\29B\0\2\0\2€\1A\2\2\0‚\1\0\29‚€\1A\2\0\0€\2\0\4Á\2\0\0a\2\
€\26€@\4\23À\4€FCB\1€\3€\1Áƒ\2\0\1Ä\2\0\3€\1]C\0\0F\3C\1€\3\0\2À\3€\1\19\4€\2@\4€\2Ýƒ€\1ÍÃ\3\3\0\4€\1S\4€\2€\4€\2\29„€\1\13\4„\3]C\0\2\23€\4€FCB\1€\3€\1Áƒ\2\0\1\4\1\0\3€\1]C\0\0F\3C\1€\3\0\2À\3€\1\19\4€\2@\4€\2Ýƒ€\1ÍÃ\3\3\0\4€\1S\4€\2€\4€\2\29„€\1\13\4„\3]C\0\2`Bõ\127FBB\1€\2€\1ÁB\3\0\1Ã\2\0\2€\1]B\0\0\24\0B\4\23@\1€F‚C\1€\2\0\2À\2\0\3\0\3€\3]B\0\2\23\0\3€F‚C\1€\2\0\2À\2€\1\19\3€\2@\3€\2Ý‚€\1ÍÂ\2\3\0\3€\1S\3€\2€\3€\2\29ƒ€\1\13\3ƒ\3]B\0\2\31\0€\0\8\7\21 à{]ÅG[p^‹©|~™Ž~MnUB,^ñ>ö\22+·À\7+cg³ZéŽé\\\19\0\16I\25êàN\"\3\0\0\0\1\2\1\3\0\0\3\7!\25Y\127æ^ò\16Ý9\15\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0d\127ghox\
\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0004@\3\0\0\0\0\0\0\"@\3\0\0\0\0\0\0\20@\4\
\0\0\0~e\127ibNe}d\
\3\0\0\0\0\0\0\0\0\4\7\0\0\0gYfooz\
\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0Y@\4\
\0\0\0~e\127ibGe|o\
\3\0\0\0\0\0\0>@\4\8\0\0\0~e\127ib_z\
\1\0\0\0\13\9\20 ;š½*@ëƒ'í°¢.ãíï\12Û\14\9\20 ËƒÒ\11žFOZuöÚ&{¿Zé\"c]`ê´Kên†\1F\8t\0255\8t\25x\\¯\23?¢‰\0147H \25¿oi0Q†˜Kk\9v\25\17\9v\25çÕ\21QÞÏè\21Bõ–\0247î‘\25:s\7\22†š×k€P)\13ˆŠ:˜8¯\23\1-\8\6 ØH¼\4ÓÒlB5i>\4Åù^3\0\9\8\8 ð\02255~V4\18\0317f\15¡Å×cýÓî5\8ZÉl\2°Œ/çBu7\11\0\0\00035u52uu5sµu\0]\0€\0\29@\0\0\6\0@\0\7À@\0f\0\0\0\30\0\0\0\31\0\0\0\31\0€\0\11\7\21 z\12<G&åþE\17¾!A9|¥wxk—\17oûçd R»HV;€'²ð~}\2\2\16I\25®‡=8‹ViÙÀ\11\1\0\0\0\0\2\11\7!\25ÐÃ\5\1Î>Xhv\127Î|£–rC\4¨–l;y-0YWÏ\18…˜­!gH*mÛ›þm\4\0\0\0\4\5\0\0\0¶º¯³Û\4\11\0\0\0©ºµ¿´¶¨¾¾¿Û\4\
\0\0\0¼¾¯‰µ¿•®¶Û\4\7\0\0\0©ºµ¿´¶Û\0\0\0\0\23pi\23\9\14\2QØoí#¬)Ý\29\11¾Ž\0¿²b[\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\26pi\23…ÊÊGæ—a!˜]€\6¾Fp?^\3ù2\8Yhkß˜+\8´>yZ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 jIX:¹Ð3V6œ\2¬Sˆb\\»·\2hØ¬\11?¿únI]½bI\3\9\20 ¬s!d¾·dg¬<]Uh>\13\30Ü·ÂY†ÜP2$E¦\1¼…\31;Q«¾\31”;íb™\8t\0259\8t\0257|F._þ\
\"ÌÝü@µÜ-gÉ¤I`W\28r$\6ùÚ\20\18\2ÖwølÆ:•\9v\25\30\9v\25|K.2±=ú\16›âg%(Ÿ¶\20\13ù±\19\4»\0201\1 \8\6 WVovö¥#\14v?k\3ÊZ´]ˆu.³œ@k\8žx‘\21KO´ír\0\14\8\8 M›j\
\5;¬\18#‰1]JÇÆ\21<·ò@‚‡<\127Õ~V4\18L,†_mÁ5{÷Œû<^.\\We.ü5\\îÆ_j\0\0\0ÐÕÕÕ”ÕÕÕT•ÕÕ3ÕÕÕÈUÕÕÕÕÕTUÕÕ\20•ÕÕóÔÕÕˆUÕÕPÕÕÕ\20\21ÕÕÔ”ÕÕ³ÔÕÕHUÕÕ\16ÕÕÕÔÔÔÕ””ÕÕsÔÕÕ\8UÕÕÐÔUÕ””ÔÕT”ÕÕ\20TÔÕó×ÕÕÈTÕÕÔ€\0Á\1\0ÁA\0\0\1\2\2\0f\2\0\0]\0\0†AB\1‡B\3Î\0\0\0\1ÆAB\1ÇÂ\3\14Â€\0Ý\0\1\4\2\0\1\25€\3\23À\0€\16\2\1\3@\2\0\2\2‚\3\23€\0€\16\2\3P\2\2\3€\2\0\2\25\0\0\1\23€\0€Ó\2€\4ˆÀ‚…\23\0\0€ˆ@‚…\25@€\1\23€\0€Ó\2\0\5ˆÀ\2†\23\0\0€ˆ€\2†ÆBB\1ÇBÃ\5\6ƒC\1\29\3€\0ÝB\0\0ÆBB\1ÇÂÃ\5\1\3\0\0A\3\4\0Ý‚€\1\6CD\1@\3€\5€\3\0\0À\3€\0\29C\0\2\6ƒD\1AÃ\4\0\29C\0\1\1\3\0\0@\3\0\4\3\0\0!Ã\2€\6ÄB\1\13\0\4\0\6\4C\1M\0„\0\6\4E\1@\4€\5€\4\0\0À\4€\0\29D\0\2\6„D\1A„\1\0\29D\0\1 ƒü\127\6ƒD\1@\3€\2\29C\0\1\6CE\1@\3€\5€\3\0\1À\3€\1\29C\0\2\31\0€\0\5\7\21 \22löFøÐ.\5\3\25A\30#e¨Zü‹C6kwò!z»\23Q\20\2\16I\25ìí1\13~…¨+¦ï9\3\0\0\0\1\2\1\3\0\0\0\7!\25éF$\22\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0'<$+,;I\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0I@\4\5\0\0\0$(=!I\4\4\0\0\0(+:I\4\3\0\0\0001zI\4\3\0\0\0000zI\4\11\0\0\0;('-&$:,,-I\4\
\0\0\0.,=\27'-\7<$I\4\7\0\0\0;('-&$I\3\0\0\0\0\0\0\"@\4\
\0\0\0=&<*!\13&>'I\4\7\0\0\0$\26%,,9I\3\0\0\0\0\0\0Y@\4\
\0\0\0=&<*!\4&?,I\4\8\0\0\0=&<*!\0289I\0\0\0\0\26pi\23Î0¼@yÛŠ\30…@¥\19ÓkhSœd¼{Ï\7l)\15#[\20\31ìøz\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 ïqÄ4¡ÿÔ&â¡TnqŒ&}j\
\9\20 ›e\26tÿá£w&Ð\27_\8t\0257\8t\25Žck\28>·ÄO2kê$z|·\16o»®\27^/X\9Êæ\16W²\9v\25\26\9v\25Ï‰{\24”»ƒQ\1+\8\6 îÿ\7fšDv[\0\
\8\8 JÈ¶\7\28Í!\12\127V4\18¸,%Y`…”,p\19ÖW§žé\13\1…iSRµ*F\24+\16\11\\\0\0\0\9\12\12\12M\12\12\12L\12\12ê\12\12\12\17Œ\12\12I\12\12\12Œ\12\12ÍL\12\12*\13\12\12QŒ\12\12‰\12\12\12ÍÌ\12\12\13M\12\12j\13\12\12‘Œ\12\12É\12\12\12\13\13\13\12MM\12\12ª\13\12\12ÑŒ\12\12\9\13Œ\12MM\13\12M\12\12Á\1\0&\2\0\0\29\0\0“\0\0\1P\1\1†ÁA\1‡\1B\3ÆÁA\1ÇAÂ\3\0\2\0\1Ý\1\0\1\0\0\1\2ÆÁA\1ÇÂ\3\6ÂA\1\7BB\4@\2\0\1\29\2\0\1Ý\0\0ÏÁ\1\2\6ÂB\1A\2\3\0€\2\0\0À\2€\0\29B\0\2\6BC\1A‚\3\0\29B\0\1\1\2\0\0@\2€\2\2\0\0!B\2€\13€\1\0MÀ\0\6ÃC\1A\3\3\0€\3\0\0À\3€\0\29C\0\2\6CC\1Aƒ\1\0\29C\0\1 \2ý\127\6BC\1A\2\4\0\29B\0\1\6BD\1A\2\3\0†ÂA\1‡\2B\5ÆÂA\1ÇBÂ\5\0\3\0\1Ý\2\0\1‚\0\0‚‚\1‚\2\0ÆÂA\1Ç‚Â\5\6ÃA\1\7CB\6@\3\0\1\29\3\0\1Ý‚\0\0ÏÂ‚\1ÍÂ‚\0\29B\0\2\31\0€\0\11\7\21 ê\1c<³*\127¡|«`\16Ò~\27ç\31A5/à\22}O‰Ck\26‹+Z©\\Î\13\16\6\16I\25xºƒctCßd07ÇjGDÿ{\8ÿb6\13ïU\0095D\7b\3\0\0\0\1\2\1\3\0\0\8\7!\25(JÓ*\127\12¾i¾Ä¦3kˆM;Ò@ MvñË\12Ì\13âgBTö$\30µ\26\18\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0\4\31\7\8\15\24j\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0$@\4\5\0\0\0\7\11\30\2j\4\4\0\0\0\9\5\25j\4\4\0\0\0\24\11\14j\4\4\0\0\0\25\3\4j\4\
\0\0\0\30\5\31\9\2.\5\29\4j\3\0\0\0\0\0\0\0\0\4\7\0\0\0\0079\6\15\15\26j\3\0\0\0\0\0\0Y@\4\
\0\0\0\30\5\31\9\2'\5\28\15j\3\0\0\0\0\0\0I@\4\8\0\0\0\30\5\31\9\2?\26j\0\0\0\0\20pi\23”\9!k6»Å%p-S$\127\11„'êKð$\17ªþ\4\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 Ê7w\\<M?IŸi\14p}Z\24qø\14\9\20 !pØ4gdº>\22\29z\27ÛûÊo+©¶uPíK!\127EJ|Ð\8t\0256\8t\25)Ð\12\24°ŸØ^ÑÜ5\15Ksæ\14.½Zq±²Žq¦\9v\25\18\9v\25ÌUÖK\\ið+>·á\31Œ4#\1ŒïF!‰¡H\27¬6–FÀ‚\26Mptâ>“}’&\1+\8\6 ¬Á!\0083ç \22\0\9\8\8 C÷ìhU|V4\18ª[§'ç.Ò5\5M?Ö\4^\29p\0\0\0PUUU\20UUUÔ\21UU³UUUHÕUU\16UUUÔÕUU”\21UUsTUU\8ÕUUÐUUU”•UUT\20UU3TUUÈÕUUUUUTTTU\20\20UUóTUUˆÕUUPTÕU\20\20TUÔ\20UU”ÔTUsWUUHÔUU\19”\20T\18T—WŽ\0\0]\0\1PÀ\2†ÁA\1‡\1B\3ÎÁ€\0\0\1@\3Ä\1\0\2\25@\1\3\23À\0€Ð\1\2\0\2\0\2PÂ\1\3\23€\0€Ð\1\1\3\16Â\2@\2\0\2\6CB\1Aƒ\2\0\29C\0\1\25\0\0\1\23@\0€“\2\0\4\23\0\0€€\2\0\4\25@€\1\23@\0€Ó\2€\4\23\0\0€À\2€\4\6ÃB\1A\3\0\0€\3\0\0À\3€\0\29C\0\2\6ÃB\1Aƒ\0\0€\3\0\1À\3€\1\29C\0\2\6CB\1Aƒ\2\0\29C\0\1\1\3\0\0@\3€\3\3\0\0!\3\4€\13€\2\0MÀ‚\0Ž€\2\1ÎÀ‚\1\6\4C\1A\4\0\0€\4\0\0À\4€\0\29D\0\2\6\4C\1A„\0\0€\4\0\1À\4€\1\29D\0\2\6DB\1A„\1\0\29D\0\1 Cû\127\6CB\1AC\3\0\29C\0\1\6ƒC\1A\3\0\0ƒ\0\0ƒ@\7ÍÃ€\0ÐƒÀ\7\29C\0\2\6ƒC\1Aƒ\0\0ƒ\0\0ƒ@\7ÍÃ€\0ÐƒÀ\7\29C\0\2\31\0€\0\4\7\21 „Æ—;i«à\3`ì*o4fp\26;ˆ\22\19¬_\17~\20\2\16I\25ì:¥\4÷[{U/y¡W\3\0\0\0\1\2\1\3\0\0\8\7!\0255\19]u»­ÄXÕ“ÜQ¾´¥\16gäZ\31•\22÷\30.)ˆOúaíE ÑˆH\15\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0–•šŠø\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0$@\4\5\0\0\0•™Œø\4\4\0\0\0™š‹ø\4\7\0\0\0•«”ˆø\3\0\0\0\0\0\0Y@\4\
\0\0\0Œ—›¼—–ø\4\
\0\0\0Œ—›µ—Žø\3\0\0\0\0\0\0I@\4\8\0\0\0Œ—›­ˆø\0\0\0\0\27pi\23-IŽ\\)æ2c\29â–@þZævRkµ2È=>hå‰¸,Wì\2ržBœ\5\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 ñ²”\11UöK\30Íy<|\21œ\25g\30\8\9\20 O§\7\0258\9t\0255\8t\25ì\16ü\12‡,ée1qÖ\14ža\9e¹áËaù\9v\25\18\9v\25ÑÏA)í €?|\20eBñ™hj˜\25{LÆû$ ð 2P9ÂXæcØ`Ž,~\13\1#\8\6 Y¾\16'ì\5p\9ôðW¨Åu\19\16°ÓOŒãƒ>™x\
\31e¦\31nY]À:¯\20$\6\0\9\8\8 Ø¥¿5\5}V4\18Ä¶»B†è\20\5ÍY Ub\24Å'?Êàf…\0\0\0\0\5\5\5D\5\5\5„E\5\5ã\5\5\5\24…\5\5@\5\5\5„…\5\5ÄE\5\5#\4\5\5X…\5\5€\5\5\5ÄÅ\5\5\4D\5\5c\4\5\5˜…\5\5À\5\5\5\4\4\4\5DD\5\5£\4\5\5Ø…\5\5\0\4…\5DD\4\5„D\5\5Ä„\4\5#\7\5\5\24„\5\5CÄD\4B\4Ç\7‹„\5\5X„\5\4U„Å\7ƒÄD\4‚\4G\6ËÁ€\0\0\1@\3Ä\1\0\2\25@\1\3\23À\0€Ð\1\2\0\2\0\2PÂ\1\3\23€\0€Ð\1\1\3\16Â\2@\2\0\2\6CB\1Aƒ\2\0\29C\0\1\1\3\0\0\25\0\0\1\23@\0€“\2\0\4\23\0\0€€\2\0\4\25@€\1\23@\0€Ó\2€\4\23\0\0€À\2€\4FÃB\1\3\0\0Íƒ\0\0ÐƒÀ\7\15„\2\6Î\3„\7\13Ä€\0\16„@\8OÄ\2\6\14D\4\8]C\0\2FÃB\1ƒ\0\0Íƒ\0\0ÐƒÀ\7\15„\2\6Í\3„\7\13Ä€\0\16„@\8OÄ\2\6\13D\4\8]C\0\2Mƒ\0\0PƒÀ\6ƒ\0\0€@\7\0\0€\6MÃ€\0PƒÀ\6Ã€\0Ð€@\7@\0€\6FCB\1ƒ\2\0]C\0\1A\3\0\0€\3€\3Á\3\0\0aƒ\4€\14€\2\0NÀ‚\0€\2\1ÍÀ‚\1\26\0\4\6\23@\2€F\4C\1\4\0\0À\4\0\0\0\5€\0]D\0\2F\4C\1„\0\0À\4\0\1\0\5€\1]D\0\2FDB\1„\1\0]D\0\1`Ãú\127FCB\1C\3\0]C\0\1FƒC\1\3\0\0À\3\0\0\0\4€\0]C\0\2FƒC\1ƒ\0\0À\3\0\1\0\4€\1]C\0\2\31\0€\0\3\7\21 4è\6Q\21\9\16I\25£—,)vÙ 9—\3{!ï](N–ÉÁkç<=zÕÁ\0/$ö?y\3\0\0\0\1\2\1\3\0\0\3\7!\25.€\17VÁâEi\15\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0pks|{l\30\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0$@\4\5\0\0\0s\127jv\30\4\4\0\0\0\127|m\30\4\7\0\0\0sMr{{n\30\3\0\0\0\0\0\0Y@\4\
\0\0\0jqk}vZqip\30\4\
\0\0\0jqk}vSqh{\30\3\0\0\0\0\0\0I@\4\8\0\0\0jqk}vKn\30\0\0\0\0\27pi\23ÖE‡iÑ’\0259\20Å5\15o¾‘\008699'n\"öI\30Óµ\14`ŒÙ@FÈµ\127\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 3\15’hð+—\15Þ\0\9\20 Ûô¶O\4gˆ[\127·$\30Â;*sK\14þ-d\20ÝtB&°[â)»@Ñ\8+\11\29\9t\0253\8t\25½HÀCu)\0024\20ŒÉX\17\8v\25\26\9v\25@SPRÆD,\19\1*\8\6 ©Ê¶S­ŒÎEd;0Y\0\1\8\8 Œ\22ý`'µb\19PìP\26^¨k\19\2CøvCh^:’·ý{òn\6/gû\16Œ\127V4\0183Îƒl(ƒÿ[ŸpI~Ü\26Œ—ÜPÒÅ %a\6=[™\0\0\0‰ŒŒŒÍŒŒŒ\13ÌŒŒjŒŒŒ‘\12ŒŒÉŒŒŒ\13\12ŒŒMÌŒŒªŒŒÑ\12ŒŒ\9ŒŒŒMLŒŒÍŒŒêŒŒ\17\12ŒŒIŒŒŒŒÍÍŒŒ*ŒŒQ\12ŒŒ‰\12ŒÍÍŒ\13ÍŒŒM\13ŒªŽŒŒ‘\13ŒŒÉ\12Œ\13MŒMÍŒŒŽŽŒêŽŒŒÑ\13ŒŒ\9\12ŒMÍŽŒÎŒŒÍŽŒŒ*ŽŒŒ\17\13ŒŒJB\1ÇÁÂ\3\6‚B\1\7\2C\4F‚B\1GBÃ\4ŽÂ€\0]‚\0\1†‚B\1‡BC\5Î‚\0\0‚\0\1P‚‚\4\29\2\0\1Ý\0\0\6‚B\1\7‚C\4F‚B\1GÂÃ\4Ž‚\0\0Á‚\0\0]‚€\1†‚B\1‡ÂC\5ÎÂ€\0\1ƒ\0\0‚€\1M‚‚\4\29‚\0\1N\2\0\1ŽB€\1O‚‚\4„\2€\0\24\0D\3\23\0\0€S\2€\4\6CD\1Aƒ\4\0€\3\0\1À\3€\1\29C\0\2\6ÃD\1A\3\5\0\29C\0\1\1ƒ\4\0@\3\0\2\3\0\0!\3\14€\25@\2‰\23€\0€\14Äƒ\3ˆ\0„Š\23@\0€\13Äƒ\3ˆ\0„Š\25\0\0\1\23@\2€\6„B\1\7„E\8F„B\1GÄÅ\8†DE\1]\4\0\1\29„\0\0\15\4\4\4Ž\2\4\0\23\0\2€\6„B\1\7„E\8F„B\1GÄÅ\8†DE\1]\4\0\1\29„\0\0\15\4\4\4\2\4\0\25@€\1\23@\2€\6„B\1\7\4F\8F„B\1GÄÅ\8†DE\1]\4\0\1\29„\0\0\15\4\4\4Î\2„\0\23\0\2€\6„B\1\7\4F\8F„B\1GÄÅ\8†DE\1]\4\0\1\29„\0\0\15\4\4\4Í\2„\0\6DF\1A„\4\0€\4\0\5À\4€\5\29D\0\2\6ÄD\1@\4€\2\29D\0\1 Cñ\127\6ÃD\1Aƒ\6\0\29C\0\1\6ÃF\1Aƒ\4\0€\3\0\1À\3€\1\29C\0\2\31\0€\0\11\7\21 A\11“\18\30Oý\30ÓÉ\9\16U—\\k±W\11g\20\29Zb\28Üˆ~}\4[*½ç\0166\20\7\16I\25á?‹\3D\15º*V\127T%\9õí\22”û\
E´'À8\3\0\0\0\1\2\1\3\0\0\7\7!\25×ci\127Fß½4ý¦u\20\6Ëd\16ïª˜rË\
¼j\28\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0°«³¼»¬Þ\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0€v@\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0\28@\4\5\0\0\0³¿ª¶Þ\4\4\0\0\0º»¹Þ\4\5\0\0\0¿ª¿°Þ\4\4\0\0\0¿¼­Þ\4\5\0\0\0­¯¬ªÞ\4\4\0\0\0®±©Þ\3\0\0\0\0\0\0ð¿\4\
\0\0\0ª±«½¶š±©°Þ\3\0\0\0\0\0\0\0\0\4\7\0\0\0³²»»®Þ\3\0\0\0\0\0\0Y@\4\
\0\0\0¿°¹²»³±¨»Þ\4\4\0\0\0½±­Þ\4\4\0\0\0¬¿ºÞ\4\4\0\0\0­·°Þ\4\
\0\0\0ª±«½¶“±¨»Þ\3\0\0\0\0\0\0I@\4\8\0\0\0ª±«½¶‹®Þ\0\0\0\0\17pi\23\23.˜N\\ª,4¸uj\23\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 ¾#2I¨÷Õ<¥\
\9\20 .kÀ\13Ç½¢K©\8r\19m\9t\25:\8t\25Ù›wµX\22\6¦¬z*\28®¾*;\\Ù\9ªÑga‘X< 6ŠÇkˆŽè\18øJ?\\6\8v\25\28\9v\25kçxã0\8~ñ ®\9Ü…YD\1#\8\6 xÍìbL¢<Kl>÷uÄ¤é1Ísyig®\24çwñMŒ´¥B\17_„U‚’n@\0\9\8\8 @ÊDc¶~V4\18×¼Wf\"î¬\3\16àMZ~iÒ\16>œk.K<'dÈ\0\0\0³¶¶¶÷¶¶¶7ö¶¶P¶¶¶«6¶¶ó¶¶¶76¶¶wö¶¶·¶¶ë6¶¶3¶¶¶wv¶¶·÷¶¶Ð·¶¶+6¶¶s¶¶¶···¶÷÷¶¶\16·¶¶k6¶¶³·¶¶÷÷·¶7÷¶¶P·¶¶«7¶¶ó·¶¶77·¶w÷¶¶´¶¶ë7¶¶3·6¶ww·¶·ô¶¶÷´´¶\16´¶¶+7¶¶s·6¶·ô´¶÷ô¶¶74´¶P´¶¶k7¶¶³´6¶÷t´¶7ô¶¶w´¶¶µ¶¶«4¶¶ø´¶·ùô´7ŽB€\1‚\2Ï‚\0\1\15Ã€\1Í\2ƒ\5\15\3\0\0Î\2ƒ\5\15C€\0Î\2ƒ\5\14ƒ\0\2\15\3\3NÃ€\2OC\3\3\1\2ÏC\2Ã\3\7Ïƒ\0\1ŽÃ\3\7ÏÃ€\1ŽÃ\3\7Ïƒ\3\5\15Ä‚\6Î\3„\7\15\4\3\5OD‚\6\14D\4\8Ð\3„\7\15Ä\2\6O„ƒ\4\14D\4\8O\4\3\5D‚\6N„„\8\16D\4\8F\4C\1GDÃ\8†\4C\1‡„C\9Æ\4C\1ÇÄÃ\9\14E\0\8Ý„\0\1\6\5C\1\7ÅC\
N\5€\7\29…\0\1Ð\4…\9\4\0\1]„\0\0†\4C\1‡\4D\9Î\4€\7\14\5€\7Ï\4…\9\14E\0\8NE\0\8\15E\5\
Í\4…\9„\0\1ÎÄ\3\0\14\5„\0Ï\4…\9\4\5\0\0ÛA\0\0\23\0\0€Á\1\0\0\24@D\4\23\0\0€Ó\4€\9F…D\1Å\4\0À\5\0\0\0\6€\0]E\0\2F\5E\1E\5\0]E\0\1AÅ\4\0€\5\0\3Á\5\0\0a…\14€\25À„‰\23@\0€\14\5†\8\23\0\0€\13\5†\8\25À\3\0\23€\2€F\6C\1GÆÅ\12†\6C\1‡\6F\13À\6\0\
\6\0\1]†\0\0OF\6\9NF†\7ˆ@\6‹\23@\2€F\6C\1GÆÅ\12†\6C\1‡\6F\13À\6\0\
\6\0\1]†\0\0OF\6\9MF†\7ˆ@\6‹\25\0„\0\23€\2€F\6C\1G†Æ\12†\6C\1‡\6F\13À\6\0\
\6\0\1]†\0\0OF\6\9NF\6\8ˆ@†Œ\23@\2€F\6C\1G†Æ\12†\6C\1‡\6F\13À\6\0\
\6\0\1]†\0\0OF\6\9MF\6\8ˆ@†ŒFÆF\1Æ\4\0Æ†E\1\6GF\1]F\0\2F\6E\1†\2\0]F\0\1`Åð\127F\5E\1\5\7\0]E\0\1FEG\1Å\4\0À\5\0\0\0\6€\0]E\0\2\31\0€\0\5\7\21 Ðô§NÆîO°É\"\5È?ç*ÜhY|\27±À}«pï(\29\5\16I\25ø6\26BL¬.fF×ôhDÙV\13\3\0\0\0\1\2\1\3\0\0\5\7!\25\
|Þ\26\18jÊ\6\"RÔtñóÏh\30\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0ËÐÈÇÀ×¥\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0\28@\3\0\0\0\0\0€v@\3\0\0\0\0\0\0 @\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0\"@\4\5\0\0\0ÈÄÑÍ¥\4\4\0\0\0ÁÀÂ¥\4\5\0\0\0ÄÑÄË¥\4\4\0\0\0ÄÇÖ¥\4\5\0\0\0ÖÔ×Ñ¥\3\0\0\0\0\0\0ð¿\4\
\0\0\0ÑÊÐÆÍáÊÒË¥\3\0\0\0\0\0\0\0\0\4\7\0\0\0ÈöÉÀÀÕ¥\3\0\0\0\0\0\0Y@\4\2\0\0\0Ý¥\4\4\0\0\0ÆÊÖ¥\4\4\0\0\0×ÄÁ¥\4\2\0\0\0Ü¥\4\4\0\0\0ÖÌË¥\4\
\0\0\0ÑÊÐÆÍèÊÓÀ¥\3\0\0\0\0\0\0I@\4\8\0\0\0ÑÊÐÆÍðÕ¥\0\0\0\0\27pi\0233±XJs†>)P5\
s{-¼ÖO5«$m^K8õ\19ßÄü8¼\4»8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 \1ð8sÎ\8\9\20 âC“YT\9t\0254\8t\0250•\13a¡G\2F\11¢(\15¾ðC;G\8v\25\28\9v\25‹-ê.‹”J_dJ¹s›õ`'\1.\8\6 –@6@Èw\
\6ÕÓLoë“a2Jò°næ:˜#\15œk8\0\13\8\8 \15>¶\22Ù\13E\22\18<q$Ë:\24PKŽú\14ß}V4\18‰ÓKŽ+\0172­\12dAD'=$po¤\11\22\0\0\0Úßßßžßßß^Ÿßß9ßßßÂ_ßß™_À\0GÀÀ\0€\0€\0Ð\0A\0€\0\1À\0€\0\17\1A\0\16AA\2Ý€\0\1\0\1€\0QAA\0\29\0\1@\1\0\1€\1€\1À\1\0\2_\1\0\2\31\0€\0\8\7\21 t¼J\5\18·¦Qf\22Îf2­Ž@£y\1~ñC¸\21½AÙ\31\7ÄºqŒ9\25=ãðÇ%\8\3\16I\25T±#C¹Ä\20\21\2\0\0\0\1\2\0\0\0\7!\25Ÿ£Ô1\6\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0 »£¬«¼Î\4\5\0\0\0£¯º¦Î\4\6\0\0\0¨¢¡¡¼Î\3\0\0\0\0\0\0ð@\3\0\0\0\0\0\0p@\0\0\0\0\26pi\23˜4¾\28³ã†>¯=cOqB\0033Æ\31øbzx{\31½ÐýAS[Ð!\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 M’ÊNÐ\"\19\29ß¼”(Õ‰#C‚\8ÒIC\3\9\20 !yß<\16i¶1lÐ6-ÕR\27\18ü]SF\"ýSuÖ¼îN~&f\31ø\27\28ÔÐ‘\2Z\9t\0259\8t\25†92=\
¸îv°ÞçF`rocÝUÍ\24„ƒ±sS|Ó{¹–\9\13¤ÿ\20}}\8v\25\26\9v\25yîúk\1žÈ9\1/\8\6 Ç€Å:ÑÀÛVW¿=eœ\
é}SÉ­ éèr7\0\14\8\8 uB]ùQ)iE¢<1J•¨oö¯|/hŸ&H}V4\18÷—¬Bô\")A¤mƒg}ÑÞ\127ÿÚ\0238\21\0\0\0MHHH\9HHHÉ\8HH®HHHUÈHH\13\0\0\0€\0\0Á@\0\0&\1\0\0]€\0\0…\0\0\0ÁÀ\0\0\1A\0\0f\1\0\0€\0\0Ï\0A\0\15AÁ\0Í\0\1Í€€\1ß\0\0\1\31\0€\0\11\7\21 ÞCNcÜ0åPØÏ\28\"1À!_•Çî]}Ï1\31ÜÓÑ\22\15¶éI~múX\6\9\16I\25Ö6¯\4P.Ö/ª•¸8rA˜\2£÷ƒP”~+pL\19ž\6\24:\17.\1\0\0\0\1\2\9\7!\25‘µÚ7cÏ¹\29ƒ€Ñ\8ùTk^ƒ!Q\\øV´Wñì\23!xDz\29\6\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0-6.!&1C\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0ð@\3\0\0\0\0\0\0p@\0\0\0\0\19pi\23n¾ö \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 \31<A À\3\9\20 Å¨MsÝe\\ˆçæ2\27Ká?9Ž\0176”éBW#rg? ü\"Xo\9Þ\19‘x\18\9H\9t\0253\8t\25\21+/S\9\11–6’´Mis\8v\25\30\9v\25¢ò\18åá˜\13\26y-Ò4÷D4œE~Œ\30f[\1+\8\6 í”€!ÜŒTF\0\12\8\8 Ú=…uõø\15\4õd„júyÆ\21Ã}V4\18¿\
ocú¹RO\7÷›gÚUP#3Hd\5A\0\0\0ÆÃÃÃ‚ÃÃÃBƒÃÃ%ÃÃÃÞCÃÃ†ÃÃÃBCÃÃ\2ƒÃÃåÂÃÃžCÃÃFÃÃÃ\2\3ÃÃÂ‚ÃÃ¥ÂÃÃ^CÃÃ\6ÃCÃÂ\1\1\0AA\0\0A\1\0æ\1\0\0Ý€\0\0\6A\1\7ÁA\2FA\1G\1Â\2€\1\0\2ÎÁ€„ÏÁ\1…ÏÁÂ\3\0\1À\0\0\3€\1\0\2Ð\1C\1\0\1À\1\0\2\17\2C\1\16BC\4Ý\0\1\0\2\0\2QBC\1\29‚\0\1F‚C\1€\2\0\0À\2€\0]\2\1\0\3€\2NC\2\3\29ƒ\0\1\26À\0\6\23À\2€\0\3€\2Nƒ‚\3\29ƒ\0\1\26À\0\6\23€\1€\0\3€\2NÃ\2\4\29ƒ\0\1\26À\0\6\23@\0€\3\3€\0\31\3\0\1\3\3\0\0\31\3\0\1\31\0€\0\6\7\21 ýÇ·bSD‡]\
ê¼RŽ@Êk\14\4\16I\25\31\21ì%—K`\"êZc=ÔM±\26%îR5\3\0\0\0\1\2\1\3\0\0\5\7!\25ïÆAH÷\"Jz\3ÙAI{å§#\15\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0®µ­¢¥²À\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0€V@\4\5\0\0\0­¡´¨À\4\6\0\0\0¦¬¯¯²À\4\4\0\0\0¡¢³À\3\0\0\0\0\0\0Y@\3\0\0\0\0\0ào@\3{\20®Gáz„?\3\0\0\0\0\0\0ð@\3\0\0\0\0\0\0p@\4\12\0\0\0§¥´ƒ¯¬¯²’‡‚À\0\0\0\0\19pi\23ðmÂj\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 Vb\23n¼\0\26PHD\0046êY·A|½14BeIcó„¸$:º¶-¢¹hvþ\3\9\20 \18¬µC‹|QcD\
\0123\28p¿\17uA$W\7uŒ\25£_/1…äœVç\15ÂJÄp\7\27º\9t\0254\8t\25èv<>¯²ŒxÊÀ“\13v3Ä`a\8v\25\25\9v\25úšg\4\1+\8\6 \15Ô\27Rñ\127c\0\15\8\8 ÌÔ›kš5„\25LlE^H’Í\31ÝšÍ|?ñý\2‚L„M}rV4\18\"3ªi’\0ì6†kK0f=¶\28®p«Hû¬o\7m²B6QÐÚy€‘\12^TÂ\4\1P\0\0\0x}}}<}}}ü=}}›}}}`ý}}8}ý}üý}}¼½}}|||}\27|}} ý}}û=<|úý<|³=ýþ²½}ù²=¿|àý}|=}}|ûý?|¾}ý}@\0\1\0\0\0Õ\0\0\0\1\1\0\0¡À\11€†ÁB\1ÇA\1\0Ç\1À\3\7B\1\0\7‚@\4\1\1FBA\1G‚Á\4‡B\1\0‡\2C\5BC\5]‚\0\1†BA\1‡‚A\5ÇB\1\0Ç\2Ã\5ÑBÃ\5Ð‚Ã\5‚\0\1ÆBA\1Ç‚Á\5\7C\1\0\7\3C\6\17ƒC\6Ý‚\0\1\6CA\1\7ÃC\6NC\2\3\29ƒ\0\1Y\0ƒ\0\23À\2€\6CA\1\7ÃC\6Nƒ‚\3\29ƒ\0\1Y\0ƒ\0\23@\1€\6CA\1\7ÃC\6NÃ\2\4\29ƒ\0\1\25\0ƒ\0\23\0\1€\6ƒB\1C\3\0\0\29C\0\1\3\3\0\0\31\3\0\1 €ó\127†€B\1Ã\0\0\0@\0\1ƒ\0€\0Ÿ\0\0\1\31\0€\0\11\7\21 gðÐ+=9A?Åón\0131±d9³l\5 ­,4\"+LÌ=¾\28|N¼\0¶=\14\7\16I\25 /\
kˆÕQ)\24sÐ:l›OIÐg\31Iõ\13ž7\3\0\0\0\1\2\1\3\0\0\0\7!\25S´£\22\16\0\0\0\3\0\0\0\0\0\0ð?\4\6\0\0\0ŠŸœ’›þ\3\0\0\0\0\0\0\0@\4\7\0\0\0‹“œ›Œþ\3\0\0\0\0\0€V@\4\5\0\0\0“ŸŠ–þ\4\6\0\0\0˜’‘‘Œþ\3\0\0\0\0\0\0Y@\3\0\0\0\0\0ào@\3{\20®Gáz„?\4\11\0\0\0•››Ž­Œ››þ\4\12\0\0\0™›Š½‘’‘Œ¬¹¼þ\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0ð@\3\0\0\0\0\0\0p@\4\4\0\0\0Ÿœþ\0\0\0\0\27pi\23§{G\25uçM\0\6cÀa-ç’IÛ$\4\29´Ók*(”\2QI×FS\6¤F$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 ü\18ú\1:±}v\15\9\20 *\5Ó?úóP9Šš\21\4K\15h\22:Îdúšö\8™\9t\0257\8t\25*7é\25\22aë\24ÃU\
PÒçUO“«y?J€£z|›T“\8v\25\16\9v\25T\3×,éÌÂ5ËW»3·à\"eßÚt\31i†\31 ú¦\1\31¿µ8\1(\8\6 u¿äI\0\
\8\8 Yþ‹6qÒÞKn~V4\18véHWA\31öZñnþ*\1„^[Þj\5C\8©Ì\15˜\0\0\0knnn/nnnï.nnˆnnnsînn+nînïînn¯®nnooon\8onn3înnè./oéî/o .îí¡®nê¡.¬oóîno.nnoèî,o­nînó.noûnnnwî.oy.nîínnnñnnoïnnn»nnn n®ooonnÏ®eîè¯,o©/on©o®mi,oniì.jóoïo(,/oG‚Á\4‡B\1\0‡\2C\5BC\5]‚\0\1†BA\1‡‚A\5ÇB\1\0Ç\2Ã\5ÑBÃ\5Ð‚Ã\5‚\0\1ÆBA\1Ç‚Á\5\7C\1\0\7\3C\6\17ƒC\6Ý‚\0\1\6CA\1\7ÃC\6NC\2\3\29ƒ\0\1Y\0ƒ\0\23À\2€\6CA\1\7ÃC\6Nƒ‚\3\29ƒ\0\1Y\0ƒ\0\23@\1€\6CA\1\7ÃC\6NÃ\2\4\29ƒ\0\1\25\0ƒ\0\23\0\1€\6ƒB\1C\3\0\0\29C\0\1\3\3\0\0\31\3\0\1 €ó\127†@A\1‡\0D\1Æ@D\1Ý\0€\0@\0\0†@A\1‡€D\1ÁÀ\4\0\1\1\5\0€€\1Æ@A\1Ç€Ä\1\1A\5\0A\5\0Ý€€\1\6AA\1\7D\2A\1\0\0Á\5\0\29€\1F\1F\1€\1\0\2Õ\1\0\0ÇÁ\1\0Ç\1À\3Í€\3\21\2\0\0\7\2\2\0\7‚@\4\13‚\0\4]A\0\2FAF\1\1\0\0]A\0\1FF\1€\1\0\2Õ\1\0\0ÇÁ\1\0Ç\1À\3Í€\3\21\2\0\0\7\2\2\0\7‚@\4\13‚\0\4]A\0\2FAF\1†AA\1‡D\3ÁÁ\6\0\1\2\7\0\1€\1]A\0\0FAG\1€\1\0\2Õ\1\0\0ÇÁ\1\0Ç\1À\3Í€\3\21\2\0\0\7\2\2\0\7‚@\4\13‚\0\4]A\0\2FB\1ƒ\1\0\0]A\0\1FAF\1€\1€\1]A\0\1C\1€\0_\1\0\1\31\0€\0\0\7\21 »’_32àµ)\14\0\16I\25~èi\3\3\0\0\0\1\2\1\3\0\0\9\7!\25¥+º<Èh\13~W§MFr3&\28lä*j$j\3\17ÊîYÔL\7\16\30\0\0\0\3\0\0\0\0\0\0ð?\4\6\0\0\0\2\23\20\26\19v\3\0\0\0\0\0\0\0@\4\7\0\0\0\24\3\27\20\19\4v\3\0\0\0\0\0€V@\4\5\0\0\0\27\23\2\30v\4\6\0\0\0\16\26\25\25\4v\3\0\0\0\0\0\0Y@\3\0\0\0\0\0ào@\3{\20®Gáz„?\4\11\0\0\0\29\19\19\6%\21\4\19\19\24v\4\12\0\0\0\17\19\0025\25\26\25\4$14v\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0ð@\3\0\0\0\0\0\0p@\4\4\0\0\0\23\20\5v\4\11\0\0\0\4\23\24\18\25\27\5\19\19\18v\4\
\0\0\0\17\19\2$\24\0188\3\27v\4\7\0\0\0\4\23\24\18\25\27v\3\0\0\0\0\0\0\20À\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0y@\3\0\0\0\0\0À‚@\3\0\0\0\0\0\0\"@\4\
\0\0\0\2\25\3\21\0302\25\1\24v\4\7\0\0\0\27%\26\19\19\6v\4\
\0\0\0\2\25\3\21\30;\25\0\19v\3\0\0\0\0\0\0D@\3\0\0\0\0\0\0N@\4\8\0\0\0\2\25\3\21\30#\6v\0\0\0\0\19pi\02313uy\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 °\3Ä)\19K1\5·ã \11âÉvrSG@9\15\9\20 s³ëemð?h)¸h4}£DU½Û“o÷ê4\17÷\9t\0257\8t\25P&\3\2sq(\22×x¥u{‰¼f7\17\24œþž`ÓŒ«J³\8v\25\31\9v\25¹@\7\127\27Óú1§&­C\26e<H£¿[kù)›F§iêq\1*\8\6 8tdWm®\27‘sõ(\0\11\8\8 :7%\14å\2=iþòÝ^\24}V4\18kã\29G5n…nÖYm$)¿±6,Yº\127X\0\0\0\29\24\24\24Y\24\24\24™X\24\24þ\24\24\24\5˜\24\24]\24˜\24™˜\24\24ÙX\24\24\25Ù\24\24~\25\24\24E˜\24\24\24˜\24Ù\24\25\24\25Y\25\24Y\25\24\24¾\25\24\24…˜\24\24ÄX\24\25\15\24\24˜Ù\24\24\24\4Y˜\24\15\24\24˜\1Á\0\0A\1\0\0‹\1\0\0Á\1\0\1\2\0\0U\2\0\2\2\0\0!B\7€\6C@\1\7ÃA\6A\3\2\0†C@\1‡CB\7À\3\0\2\0\4€\5@\4€\5\3\0\2\29ƒ\0\0\27\3\0\0\23@\2€@\3€\3ƒ\2\0ÆC@\1ÇCÂ\7\0\4\0\2@\4€\5€\4€\5Ýƒ\0\2ÖÁƒ\6\23À\1€@\3€\3†C@\1‡CB\7À\3\0\2\0\4€\5@\4€\5ƒ\0\2Öƒ\6 \2ø\127\6B@\1\7ÂA\4@\2\0\0€\2€\3À\2€\1\29Â\0\2\27B\0\0\23€\1€†B@\1‡BB\5À\2\0\0\0\3€\1‚€\1Š‚\2\23@\2€†B@\1‡BB\5À\2\0\0\0\3€\1N\3@\4‚\0\2Š‚\2Í\0À\4M\1À\2\23€ù\127Ÿ\1\0\1\31\0€\0\7\7\21 yå´8 Êâ\21³ç¤'õnq\31/\2ô-\19\11\16I\25Èû\28jwhA+\9'K\7ãÎ\23\28\31în#Œ‡O†Žs\7\24¹‰5ÊõqA\5·7+\3\0\0\0\1\2\1\3\0\0\7\7!\25\"c ]–*-T\9\14“\9\\šEk{-j=\7\1qh\11\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0JMKPW^9\3\0\0\0\0\0\0\0@\4\2\0\0\0y9\3\0\0\0\0\0\0\8@\4\7\0\0\0WLT[\\K9\4\1\0\0\0009\4\5\0\0\0_PW]9\4\12\0\0\0\17\16\23\28\18\20\19\6bg\0299\4\4\0\0\0JL[9\4\2\0\0\0\0289\0\0\0\0\22pi\23Ôã’\12räŽ/œ¾ç\19ª=\0001\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 NçLvÿ-¹Qîd¥BD¢JW\18ëo\1O\11\17\
½˜G!,\12\9\20 \26\19¹\15ª?¥\3Û\0134\4 Ï\14D\16\0ˆ-ý\9t\0258\8t\25«yã\
<\29€\24slÊGœ=™÷ÖxSŽR\29\0037ß\14ä’t+Ñ\8v\25\30\9v\25¨¹\127\127|‹ &6ÿj\17…µŸ~7aÏv\30b>e\1 \8\6 …H\28m\30÷6Væ„EÉêfD0{g8¦ñ•O‡ƒ®e\127Æˆ)*_à{\0\
\8\8 )\6.-\5m\20\0×~V4\18\25ãœwmßYDu#6]¦\23\16d7'ö\1\14\27\13V\19\0\0\0Ò×××–×××V—××1×××ÊW×\0F€À\0GÀÀ\0€\0\0\0Á\0\1\0]€€\1X@Á\0\23€\0€Œ€Á\0€\0\1\23@\0€ƒ@\0\0ƒ\0€\0Ÿ\0\0\1\31\0€\0\7\7\21 :^Õ\16ó­\1\3\2p\12â\23U\16o9\"(\4\3\16I\25gÍô\14¦šñ\30\2\0\0\0\1\2\0\0\11\7!\25ÏNÔ\17+ã\13\12uó\16:&5YWõÍtP¦nxrÌ&ï&|Q#6%5\1\28ö…Ï\"\7\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0_X^EBK,\4\3\0\0\0EC,\4\5\0\0\0C\\IB,\4\2\0\0\0^,\0\4\6\0\0\0O@C_I,\0\0\0\0\26pi\23N;/Iüòã\"ßM\1e‡Aå#\21Ö€\26L-[)üd\27\1»í~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 `üÕ\21^(õ}qvkm_œ\14\29Yßrf\26eÆ\26s\14\9\20 Õ\
h\23\29yö?a\7PO³’»+À-ÏTÅŸ\8txq>1è\9t\0252\8t\25J~}Ekuó\30Ö\8v\25\25\9v\25bJv&\1-\8\6 ÈN\9\0004É“m{~»iaÄs\0\0\11\8\8 Ä´e\0058?­S\\â\25 |~V4\18¼Þï5•‘Ã\11;Æ\1k\28{þRîp6rU+È\5\22\0\0\0y|||=|||ý<||š|||aü||:üÀ\0GÀÀ\0€\0\0\0Á\0\1\0]€€\1[\0\0\0\23€\1€Œ@Á\0\1\1\0€€\1ÌÀÁ\0Ý@\0\1Ÿ\0\0\1\23@\0€ƒ\0\0\0Ÿ\0\0\1\31\0€\0\8\7\21 1xÐ-*60\29¬\14˜U’\127 }ÝÈëHl<g*W\31)qU:*zËü“H¡¦6\5\9\16I\25\0œ?[\4è\28]è?(\7ÈêH[8±°Jc¾ãp)¯¼[f0\18@\2\0\0\0\1\2\0\0\7\7!\25aîi/Â\18,`_Ü\23\4*>\0-\127ñ\27\22ômÛ\15\8\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0\0\7\1\26\29\20s\4\3\0\0\0\26\28s\4\5\0\0\0\28\3\22\29s\4\2\0\0\0\1s\4\5\0\0\0\1\22\18\23s\4\5\0\0\0Y\18\31\31s\4\6\0\0\0\16\31\28\0\22s\0\0\0\0\16pi\23›l\26iãÞ\17\2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 \16ì\4My\14Œ5/ds<’¶Âanª“'±¥Ù\"\1\
\9\20 N\26AC¤¤W!\0o˜0Ø\9t\0259\8t\25ù\22«\0É\\)&²\22›^ßD8a+\20›\29¬—Wg#sÍ*æ\2KfbÚÚ\16Á\8v\25\29\9v\25~Ý6\27ÞÃ\31?ohIP(Ån´o©!\1(\8\6 —\4ª{\0\12\8\8 ëë+a¨ð®H-´ø\1\27PŸ\29}~V4\18Ìõx@­8*nù{ÿ\22\26\16º\3RÝ\15ùê—G\28\0\0\0x}}}<}}}ü=}}›}}}`ý}};ý½}:½½}€\0\0\0Á\0\1\0]€€\1‹\0\0\0Á\0\0\0[\0\0\0\23@\2€\12AÁ\0\29\1\1\1\23@\0€ŠÀ\1Í\0À\1\"A\0\0£Áþ\127\12Á\0\29A\0\1\23@\0€\3\1\0\0\31\1\0\1Ÿ\0\0\1\31\0€\0\7\7\21 Kô,\16ÂGÁms\27,\25*9eqí[\\\11\
\3\16I\25M¬2\28Ó^§q\2\0\0\0\1\2\0\0\3\7!\25\9`\31xQ<Þ\12\7\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0rushof\1\4\3\0\0\0hn\1\4\5\0\0\0nqdo\1\4\2\0\0\0s\1\4\6\0\0\0mhodr\1\4\6\0\0\0bmnrd\1\0\0\0\0\26pi\23xÈhHy½£{\19Á'r‘õgc\17ÂMwÇf”>|á“D¹²ü?\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 ÎŠ?\7¾\12ÿ;P>D›vwwªÞz\14±\14\9\20 w©ØHL\19[w¡@ìf‡0Ý!Gj˜YÑÎ?\0Ê\24\19'1\
t\0255\8t\25Õ\29£$²\25¢\6CŒbA…0v[\16\27q>ñ\8v\25\25\9v\25#üÄ<\1*\8\6 ÊG}g\\÷Çu‰ž†\2\0\12\8\8 UmøH\20Ú¶S_Ÿ)¤Nq3˜~V4\18ôŒ\1x}ÛmRÇŠûs'\15£R×¾Ë#>4Ô<$\0\0\0˜˜˜Ù˜˜˜\25Ø˜˜~˜˜˜…\24˜˜Ý˜˜˜\25\24˜˜YX˜˜¾™˜˜]€\0\0…\0€\0Á\0\1\0\1A\0\0AA\1\0¦\1\0\0€\0\0Æ€A\1ÇÀÁ\1\0\1\0\0@\1\0\1Ý€€\1Û\0\0\0\23@\2€%\1\0\0@\1\0\2€\1€\0]A\0\1L\1Â\1]A\0\1C\1€\0_\1\0\1W\0€\23@\0€\3\1\0\0\31\1\0\1\31\0€\0\1\7\21 yÿ·\
Æd±^»Œ–#\7\2\16I\25}Ä\5%Óå\21\31ìš/\3\0\0\0\1\2\1\3\0\0\9\7!\25i_HW¤\28\17\11S²×J-ž}:Ç\24ÖGïªúg÷åú!$\16ž=\9\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0ÂÅÃØßÖ±\3\0\0\0\0\0\0\0@\4\6\0\0\0ÅÐÓÝÔ±\3\0\0\0\0\0\0\8@\4\2\0\0\0Æ±\4\3\0\0\0ØÞ±\4\5\0\0\0ÞÁÔß±\4\6\0\0\0ÒÝÞÂÔ±\1\0\0\0\8\9\20 Ñ]hØ\1\9\20 \20d\24*\16£\127\15éÛš\9\16\23¦<eë\0sóîÏ&…–*S\17Ø÷pÊ\9t\0251\8t\25)\11Cn÷\8v\25\30\9v\25%­+@\17øÇ\5®L&¿}ªvÌ¤jsß·Ñ,\0+\8\6 -)h/bÔš\12\1\13\8\8 ìa(WÇÃ\23\12:âß\0045Bg7–=\24>\22pV4\18gÍu&\6‘½\25]\18\16q{1ŽP\0224=)Fîªz‹H4\13|\31>\28\26\0\0\0W\22\22\22ƒ\22\22\22×\22\22\22wÖ\18–PWV\22‘\23\23\22K—\0\1\24€À\2\23À\0€E\1€\0‡\1\1\0]A\0\1\23€\2€E\1\0\1LÁÀ\2Ç\1\1\0]A€\1U\1\0\0X@\1\2\23À\0€E\1\0\1LÁÀ\2Á\1\1\0]A€\1`€ú\127\31\0€\0\6\7\21 \17ß^`÷5\13ûhæl:ê¡N\8\4\16I\25!\22\18-KâiT%H'Eà“¼#\24‡ÔG\3\0\0\0\0\2\1\4\1\3\6\7!\25\23ˆg\25E°<wfÔ“~\28†ii1\18eN-˜«\
VhIn\5\0\0\0\3\0\0\0\0\0\0ð?\4\5\0\0\0¬¡¨½Ø\4\6\0\0\0¬¹º´½Ø\4\6\0\0\0¯ª±¬½Ø\4\3\0\0\0ÕÒØ\0\0\0\0\19pi\23ÃÕÃH\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\17pi\23L?ge*£9o×„¹e\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 'tu\30\7$,o\13\1\9\20 âÂ\1\3IYç\14t½ôJSÞñ\31´>\\&g4È\16áK\\r\\>€\17\"\
t\0256\8t\25F\6D`\12\14\0261_ŒSWýê]/Mu¤&Í‘ .\26\11v\25\28\9v\25šè€-«Ú\0302s’Â\1\5‚ª_\1*\8\6 êD\
ÄŸ®_ùÔ/7\0\2\8\8 ìÙDLBžâOÂ¦Öfóýp;€Î\13D~6,\\ÖÀr>É'õRòó ')Ÿd^¯qV4\18\
ëÀPÚ¤Ñ\
\1Rç@Pñ\0041æ²ë;aÞ:\24NÜb`3(b.p[F-\0\0\0ª¯¯¯î¯¯¯.ï¯¯I¯¯¯²/¯¯ê¯¯¯./¯¯nï¯¯‰®¯¯ò/¯¯*¯/¯nÀ\0\0\1A\0\0A\1\1\0¦\1\0\0€\0\0Å\0€\0\1A\1\0A\1\0Á\1\0æ\1\0\0Ý€\0\0\6\1B\1\7AB\2@\1\0\0€\1\0\1\29€\1\27\1\0\0\23\0\3€LB\2À\1€\0]A€\1\24\0À\1\23€\0€LB\2ÁÁ\2\0]A€\1L\1C\2]A\0\1C\1€\0_\1\0\1\23@\0€C\1\0\0_\1\0\1\31\0€\0\4\7\21 Î\16\17\16ÙJzx”ë‘{Ó’»o—ÓE`~0\"\6\8\2\16I\25‘¨u\23\25cƒN„\12¯\27\3\0\0\0\1\2\1\3\0\0\9\7!\25Ü\9Z5x\
 WS\21f+Z@†\17NË’\21\29=[~L4§8wj÷s\13\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0~y\127dcj\13\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\2\0\0\0z\13\3\0\0\0\0\0\0\16@\4\7\0\0\0cx`oh\127\13\3\0\0\0\0\0\0\0\0\4\3\0\0\0db\13\4\5\0\0\0b}hc\13\4\6\0\0\0z\127dyh\13\4\3\0\0\0\0\7\13\4\6\0\0\0nab~h\13\0\0\0\0\24pi\23¦\\pU¸DuH~\2¨®w1ÑF½u[ûi>\9²I\31# VŽ#ú 7ý\13\16\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 gk\19\2.rNBët\25PbÍ\27»\3\9\20 MPg\7—‡Ê0.Á\27aY\23\
LÐ‚g8I™=\127GT\14\13bÊ\"?„Ë©OÕÜj\30&\
t\0259\8t\25Î@v\25Þ/êd¤†]\2\15º~-€ÄÓ}álÒ\0 [~.W\25|\6¦Àf5\11\11v\25\25\9v\25nÉ\7\1.\8\6 /T\5:e<~h©^„/^Æ’\8§'ó\1ùÀQK—'¦\22\0\13\8\8 G\17¹R/¯pG!á \\ (Ã\30ÿ1Ø\127\31qV4\18aüú>îEˆ+½Y<J®)o\11¼†þD›‰&/R°Ì\13Ì@}r\27Nú,\
\0\0\0\26\31\31\31^\31\31\31ž_\0\0æ\0\0\0\29€\0\0F€À\0GÀÀ\0€\0\0\0]@\0\1\31\0€\0\7\7\21 lœû rgv3ÚÝ\5D~~N4ôÕ?;\4\8\16I\25®ÒSnY\18¾#Å/û \12™æv\0:±%¾ðLl£ÀŒ\13óY6!\5\2\6?\2\0\0\0\1\2\0\0\8\7!\25\20;×}¦*É]Ò¡ÕT~µµYŽ§š\0093žÐ\19lû=\5K\1×SáÇ?\31\4\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0ÈÏÉÒÕÜ»\4\3\0\0\0ÔÈ»\4\7\0\0\0ÉÞÖÔÍÞ»\0\0\0\0\23pi\23æŠý\0024x\12-ôÂ¹<\1Ù÷/h•«;\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 »»’f!\23\18\30LÆ÷!«²Û^e\13\9\20 =\30E^Ü®\30ê‹Q$\11o0\23\
t\25:\8t\25þ–r&¯–Þ2èÙ‘f\0›\"S‹—'uÍ\4¥\0‰^5?(\28ãÇ\12\4©þ{N\15\11v\25\17\9v\25\18è§(>Õ\0237\5.¤*Ll\28+kN/2Ç)Ô\0309Kã4·uö\12à\20­\30\0(\8\6 ÙŒ\8+\1\15\8\8  ¹Qz[ÜccüaZ5Ý×î?¹¸\18\2æí«Yjã]p”yV4\18\25z<#%\0\0\0Ò”Ô”É\20\20”\16”””RÔÔ”I\20\20”Œ\20T”ƒ”–\20’UÔ”“•Õ–Ô\1€\1A\1\0V\2\1\0\29€\1€\0\0\2\23À\1€\6Á@\0\7\1A\2@\1€\1Á\1\0V\2\1\0\29€\1€\0\0\2›\0\0\0\23À\1€\12\1B\1€\1\0\0\29A€\1\12AB\1\29A\0\1\3\1€\0\31\1\0\1\23@\0€\3\1\0\0\31\1\0\1\31\0€\0\
\7\21 ä!º\"m\5ÔJ0ÒS^Š\"C\1¢Düf\19š`b3!¿O¸ãrO\7\3\16I\25qöÖ\6½\17\23z\1\0\0\0\0\0\2\7!\25ÜD\0069„;ë\24«9\8k\
\0\0\0\4\
\0\0\0\2\0\17*61\28\21\0e\4\9\0\0\0\16\22\0\0235\4\17\13e\4\8\0\0\0\4\11\1\23\
\12\1e\4\3\0\0\0\12\
e\4\5\0\0\0\
\21\0\11e\4\17\0\0\0J\9\16\4J\17\22:\0\0:\4\9\12\4\22e\4\2\0\0\0\18e\4\18\0\0\0J\6\
\11\3\12\2J\4\9\12\4\22K\6\3\2e\4\6\0\0\0\18\23\12\17\0e\4\6\0\0\0\6\9\
\22\0e\0\0\0\0\19pi\23dP˜7\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 \18\6b[Y•\18vû,\23E¸\22\20æm\
\21Ó¶z€\8\9\20 ¥\16|\\\27\
t\25:\8t\25.±‘R3B+\5PK\0254\19*‚K\22)¦gÚãY\25\0A°\25k\22^\30¹\11\17L6þœz1\11v\25\29\9v\25š¬8{4À5bË\17\25\0030ñ\0150ç\19fZ\0+\8\6 ®\3ÙJ\27-ÂS\0\13\8\8 SÍ#\12-3$/O\127Y\16ÊÈP#rë:C$~V4\18k¹æPô°^\4„¬ƒz£W\25\"bðV·î®\127\4\0\0\0\"$d$A@\0\0\29@\0\1\31\0€\0\0\7\21 5Œr\"Î\23Ug\2\6\16I\0256Í\"<9.³\5‡¼Û2lË¿6š~øE!i\20. ‹õ\24\1\0\0\0\0\0\7\7!\25RZ$^‡Ÿ[sZþI|\0^ý(¢Ì\29G($\14z\2\0\0\0\4\6\0\0\0åòòïò€\4\11\0\0\0Õóåò Åøéô®€\0\0\0\0\26pi\23ÏÿAvw£g\
\29ôqXAë|9S\9/%ýyv­¤c\
Gº)\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 Ë\25\\ÎÉ+'åÖOK9n*c\0208í '\13\9\20 Â\30ÜU.­Y7í×zw>G\1(v\
t\0251\8t\25+Å7[4\11v\25\30\9v\25–\3\\0.O×D'\20Ì|\2ú­\20TFÈ)ao7_\1#\8\6 a/ö1äÓV5zW¥FÆò›\14;{Ç:V…û\26«`q/r56G¬$\3\19qp×e\0\0\8\8 {î.:VG'1v½ï\6&\28[‰\14DA•äò\3QEø0·»x(~V4\18øÝ·X­¥V‡\5Ç@Žá\19\9ÛÐ|\27®\25“=C\0\0\0.(h(ih((5¨()n(h(©¨((u¨()b(é©¯hé(é¨)(µè()0èé)?h+¨.)j(/ij*h)()©©*(5é¨\1\27\1\0\0\23€\1€†\1B\0‡ÁB\3À\1\0\1\0\2\0\2@\2€\2ž\1\0\2Ÿ\1\0\0\7AÁ\0A\1\3\0\29Á\0\1\24ÀÁ\2\23@\3€†\1B\0‡AB\3À\1\0\2\1‚\2\0Á€\1›\1\0\0\23€\1€\6\2B\0\7ÂB\4@\2\0\2€\2\0\3À\2€\3\30\2\0\2\31\2\0\0‡AÁ\0ÁA\3\0Á\0\1\24ÀÁ\3\23@\3€\6\2B\0\7BB\4@\2\0\3‚\2\0\29Â€\1\27\2\0\0\23€\1€†\2B\0‡ÂB\5À\2\0\3\0\3\0\4@\3€\4ž\2\0\2Ÿ\2\0\0\3\2\0\0\31\2\0\1\31\0€\0\0\7\21 0\23EE\15‰Ê\28\14\0\16I\25‘F;w\1\0\0\0\0\0\6\7!\25\24\31\8?X9×\5/Øè\12o¤\3Z\3šH5¡\13\31T\27É\6m\14\0\0\0\4\8\0\0\0UBVRNUB'\4\3\0\0\0T]'\4\13\0\0\0T]HDLBS\9OSSW'\4\8\0\0\0snjbhrs'\3\0\0\0\0\0\0\8@\4\8\0\0\0UBVRBTS'\4 \0\0\0OSSW\29\8\8NW\9DONIF]\9DHJ\8@BSNW\9FTW_'\3\0\0\0\0\0\0i@\4\7\0\0\0TSUNI@'\4\5\0\0\0ANIC'\4\19\0\0\0\2C\12\2\9\2C\12\2\9\2C\12\2\9\2C\12'\4\4\0\0\0TRE'\4\18\0\0\0OSSW\29\8\8PPP\9NW\9DI\8'\0041\0\0\0OSSW\29\8\8PPP\9IBS\9DI\8TSFSND\8DRTSHJBUDFUB\8^HRUNW\9FTW'\0\0\0\0\19pi\23Þ\\äw\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\3\9\20 ­Œ¤\14ú’\23S˜^æ\2ï\0239\127\6nJ\27£c”\3L\17½H‰-MjÍL\7\25õ{×Pg\3\9\20 R$âA\6ƒgp“‘­\19»&Š!\22âZ\16,®aM(ë-/‡¯\127':L\6i<»vZa\
t\0251\8t\25\18·à0_\11v\25\30\9v\25\20ó\21\16|É`gc´£V7Ã\18Eãžth\0065_\0\1#\8\6 Þ1Œ;Ÿ“E\3ÔgðRäŸÖVB÷Ù\6 y­\27nÍ#A\15Dá\31\22õ„l87$t\0\1\8\8 h\25g.>º‹d<èW$@ñOTœæth–ã$L+\31\127ÜKf\28¢âé\13^yV4\18´™Ê>\"\0\0\0[^^^\31^^^ß\30^^¸^^^CÞ^^\27^Þ^ßÞ^^Ÿ\30^^_Ÿ\0\0f\1\0\0]€\0\0†\0A\1À\0€\0\1A\1\0@€\1†€A\1€€\0\24ÀA\1\23€\1€†\0B\1À\0€\0\1A\2\0@\1\0\0\22A\1\2@€\1\23À\0€†\0B\1À\0€\0\0\1\0\0@€\1†€B\1À\0€\0@\0\1\31\0€\0\0\7\21 aªük0c+&\6\6\16I\25˜m\0151\20\2 \14¿Ãs\5}½Æ\4ò3,J^W¹\8R%·W\3\0\0\0\1\2\1\3\0\0\0\7!\25 N“\15\11\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0\20\19\21\14\9\0g\3\0\0\0\0\0\0\0@\4\13\0\0\0ãýûËðÂ‚Øðg\4\8\0\0\0\14\9\14\19+\8\0g\3\0\0\0\0\0\0\0\0\4\
\0\0\0\0\2\19(43\30\23\2g\4\4\0\0\0\14\8\20g\4\5\0\0\0\16+\8\0g\4\8\0\0\0<#&3\":]g\4\9\0\0\0\4\11\8\20\2+\8\0g\0\0\0\0\17pi\23D¡&b¯’t/ˆ“é_\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\3\9\20 \17x‚{÷&hAŽ•F6hÑ\11L\5ØžM×>`Uëµ;^m75Nø¬¶\11»]‚:û\13\9\20 º{Õ;q\6´\11 \13\21~„–\12X¯\
t\0257\8t\25q·ª7 Ám3hÒ±H@r-rT?\0\\ÇUÃ)0r›KJ\11v\25\18\9v\25\00175tþøÇjä_›^”©7\20Oì\
}¥ @n¥!º\15F\19s>3¶†$\14óÅ[\1#\8\6 \
õæyù¨\1:¸\"GZ\2¢\5´\6„t.ÐÞ\26\
\6f>n‚Y0 Ö’&*\19{<\0\15\8\8 Îý2UœÊ%t“ÚÓ;6Ðä\29Ü<Sfç\25Ô\23þ%¨GÜyV4\18ÿ\\Ý;Å\0\0\0ÙÜÜÜÜÜÜ]œÜÜ:ÜÜÜÁ\\ÜÜ¹ÜÜÜZ\\\28Ü\29\28ÜÜA\\ÜÝ\27ÜÝÚ\29ÜœÝÜÜÁ]ÜÝœÝ\\Ü\\ÝÜÞ\29]ÝÜJ\29Ýß]ÜÝ‡ÝÜÜË\\Ö\\›\29\29Ý\\ÝÜÞ\29]ÝÜJ\29Ýß]ÜÝ[Ý\30ÞGÝÜÜË\\Ü\\[Ý\30ÞCÝÜÝËÜõ\\\\Ý\\Ü\28ÝÜÞÝžÞÜ\
Ý^ßA]ÜÝGÝÜÜËœû\\[\29\29Ý\28ÝÜÞÝžÞÜ\
Ý^ßA]ÜÝ\27Ýžß\7ÝÜÜË\\Ü\\\27Ýžß\3ÝÜÝË\\ø\\\27B\3Û\1\0\0\23€\0€ÇB\3ß\1\0\1\23\0#€ÇÁB\3Û\1\0\0\23€\0€ÇÁB\3ß\1\0\1\23€!€\31\0\0\1\23\0!€@\1€\0€\1\0\2Á\1\3\0–Á\1\3]\0\1[\1\0\0\23€\
€GÁÁ\1€\1\0\2Á\1\3\0–Á\1\3]\0\1‡\1Â\2›\1\0\0\23€\0€‡\1Â\2Ÿ\1\0\1\23€\28€€\1€\0À\1\0\2\1B\2\0Ö\1‚\3\0\1›\1\0\0\23À\26€‡ÁÁ\1À\1\0\2\1B\2\0Ö\1‚\3\0\1Ç\1B\3Û\1\0\0\23€\0€Ç\1B\3ß\1\0\1\23\0\24€ÇB\3Û\1\0\0\23€\0€ÇB\3ß\1\0\1\23€\22€ÇÁB\3Û\1\0\0\23€\0€ÇÁB\3ß\1\0\1\23\0\21€\31\0\0\1\23€\20€@\1€\0€\1\0\2ÁA\3\0–Á\1\3]\0\1[\1\0\0\23€\
€GÁÁ\1€\1\0\2ÁA\3\0–Á\1\3]\0\1‡\1Â\2›\1\0\0\23€\0€‡\1Â\2Ÿ\1\0\1\23\0\16€€\1€\0À\1\0\2\1B\2\0Ö\1‚\3\0\1›\1\0\0\23@\14€‡ÁÁ\1À\1\0\2\1B\2\0Ö\1‚\3\0\1Ç\1B\3Û\1\0\0\23€\0€Ç\1B\3ß\1\0\1\23€\11€ÇB\3Û\1\0\0\23€\0€ÇB\3ß\1\0\1\23\0\
€ÇÁB\3Û\1\0\0\23€\0€ÇÁB\3ß\1\0\1\23€\8€\31\0\0\1\23\0\8€@\1€\0€\1\0\2ÁA\2\0–Á\1\3]\0\1[\1\0\0\23\0\6€GÁÁ\1€\1\0\2ÁA\2\0–Á\1\3]\0\1‡\1Â\2›\1\0\0\23€\0€‡\1Â\2Ÿ\1\0\1\23€\3€‡Â\2›\1\0\0\23€\0€‡Â\2Ÿ\1\0\1\23\0\2€‡ÁÂ\2›\1\0\0\23€\0€‡ÁÂ\2Ÿ\1\0\1\23€\0€\31\0\0\1\23\0\0€\31\0\0\1\31\0€\0\8\7\21 \12ùa)“\6\21PZ”Á\25²\25¢\0239(Ï_¡§4XåÏ(<G\27•;ì’FdðÄ\0156\9\2\16I\25¥µ>òf­;ôÊ\26j\2\0\0\0\1\2\0\0\3\7!\25ül\19zbMt\26\14\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0ˆ‰’•œû\4\8\0\0\0‰žŠŽ’‰žû\4\3\0\0\0ˆû\4\6\0\0\0‹—’ˆû\4\14\0\0\0š‹‹¹Ž•Ÿ—ž«š“û\4\31\0\0\0Ô“¤¸µÕ—‹‰”‘Ô²•”«—’ˆÕˆ‰’•œˆû\4\5\0\0\0‰žšŸû\4\20\0\0\0¸½¹Ž•Ÿ—ž¿’ˆ‹—š‚µš–žû\4\12\0\0\0Ô²•”Õ‹—’ˆû\4\13\0\0\0¸½¹Ž•Ÿ—žµš–žû\4\19\0\0\0¸½¹Ž•Ÿ—ž¾ƒž˜Žš™—žû\4!\0\0\0Ô“Ö³š•ˆÕ—‹‰”‘Ô²•”«—’ˆÕˆ‰’•œˆû\4!\0\0\0Ô“Ö³š•Õ—‹‰”‘Ô²•”«—’ˆÕˆ‰’•œˆû\1\0\0\0\14\9\20 \2p''\\¨\25OWg±Vxìöq¹žð%—\25Ól¸Q8iN\12\9\20 Ì§+b)éÆ<SÔ‡S`\9¯JËŠ?rg\
t\0257\8t\25a.¿(¼^\5|X{ÆO\14Çp~bã»\21#s29Æ\14WL\11v\25\17\9v\25ËI”:\3¤×\5]¶¹aÐÿÑ\127_Ì¬/\2\127k\9¦6h\127uUž\26\5ï’0\0*\8\6 Í¼Oq}Û‰\"¼}rt\1\11\8\8 5-Â\0117\5š\24¨2(\0303yV4\18û\6°q\14\0\0\0u3s3tsó3³333ò³\0\0]€€\1XÀÀ\0\23€\0€Œ\0Á\0€\0\1\23@\0€ƒ@\0\0ƒ\0€\0Ÿ\0\0\1\31\0€\0\1\7\21 +y G™Â¨JÄ\12\\a\4\5\16I\25ò=o\26ÒÓÌ_I»aY\21ÎâL\1\0\0\0\0\1\5\7!\25<9'\16à\23w\7\14>³<™ïàq\5\0\0\0\4\3\0\0\0'!N\4\5\0\0\0!>+ N\4\2\0\0\0<N\0\4\6\0\0\0-\"!=+N\0\0\0\0\23pi\23n\
`l›nL{WN±\6ã_þ\6 ]ß+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\20pi\23°\28Nx\0299iN\21«¥I\20ópVSf+ZL°?b\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 ö\11¤e?­¨jK\11\9\20 ²tjk=¨&Qö\
t\0254\8t\25„7ls%æ\23E 6ÕWzÊ;S¸\11v\25\29\9v\25Zƒr\22è\21a?d,uN<ée*qÙ‡U\0-\8\6 j½­K\19ž#W\"T\1áÉÁ;\0\12\8\8 øy“PZbúh,\25ä\
mÏá0(zV4\18Ù^Q\24\
kfXW\0\0\0\13(((n(h(®hh(¯¨h)îèh(õ¨¨()))(µ(¨)u¨((¬(((2h¨ª?h(¨©¨)(?()¨2h¨«?h(¨©(*(?((¨©h*(è(((()()õ¨(\1\11\1\0\0FB\0€\1€\1]\1\1\1\23À\13€†ÂB\0‡\2C\5ÁB\3\0\0\3\0\1Aƒ\3\0€\3€\4Ö‚ƒ\5‚\0\1ÌÂC\5Ý\2\1\1\23€\
€ÆC@\0Ç\3Ä\7\0\4\0\7AD\4\0Ýƒ€\1\24€Ä\7\23À\8€ÆÃB\0ÇÃÄ\7\0\4\0\1A„\3\0€\4€\4Á„\3\0\0\5\0\7A\5\5\0\22D\5\8AD\5\0Ýƒ€\1Û\3\0\0\23€\5€\12„Å\7\29D\0\1\6ÄE\0A\4\6\0\29„\0\1GDF\8‡„Æ\8À\4\0\1\1…\3\0@\5€\4…\3\0À\5\0\7\1\6\5\0Ö\4†\9„\0\1ÇÄF\9Û\4\0\0\23\0\1€Æ\4G\0ÇDÇ\9\0\5\0\2GÅF\9ÝD€\1âB\0\0cƒô\127b\0\0ãAñ\127\31\1\0\1\31\0€\0\5\7\21 \24\12ú\2à‹ˆ\
©P\15\
Ê€dn\0294¯[ B\7TN¸Ða\25\11\16I\25ÀxÜ+È‚\0125­Ý+Q\26üNB±˜mt\17\
¡\31Vå´l\"rõIy¢5fÀ¢b8\1\0\0\0\0\0\9\7!\25ÐÄ‰g¢l$tF¨Ö\30É>\0298üÎ\30]rÁº)6\14ÿh”¾™\2\30\0\0\0\4\9\0\0\0?$%>&).9K\4\7\0\0\0008?9\"%,K\4\6\0\0\0&*?(#K\4\9\0\0\0,.?\4\24\29.9K\4\8\0\0\0n/`en/`K\3š™™™™™\"@\4+\0\0\0d;9\"=*?.d=*9d($%?*\"%.98d\9>%/'.d\
;;'\"(*?\"$%K\3\0\0\0\0\0\0 @\0042\0\0\0d;9\"=*?.d=*9d&$)\"'.d\8$%?*\"%.98d\9>%/'.d\
;;'\"(*?\"$%K\4!\0\0\0d;9\"=*?.d=*9d&$)\"'.d\
;;'\"(*?\"$%8K\4\7\0\0\0\";*\"98K\4\3\0\0\0\"$K\4\6\0\0\0;$;.%K\4\4\0\0\0'8kK\4\2\0\0\0dK\4\6\0\0\0'\"%.8K\4\4\0\0\0008>)K\3\0\0\0\0\0\0\16À\4\5\0\0\0e*;;K\4\5\0\0\0$;.%K\4\12\0\0\0d\2%-$e;'\"8?K\4\3\0\0\0009`K\4\6\0\0\0('$8.K\4\8\0\0\0009.:>\"9.K\4\3\0\0\00081K\4\6\0\0\0;'\"8?K\4\5\0\0\0009.*/K\4\19\0\0\0\8\13\9>%/'.\2/.%?\"-\".9K\4\6\0\0\0?*)'.K\4\7\0\0\0\"%8.9?K\1\0\0\0\3\9\20 5\29 ,F)ôX\7ì\13]¥bJ$çŠ:]u<+Z0`\23}™\\ÖW¢Ä?w°K$\"W\14\9\20 HKšZ\25ôôVý…\1!\20Ô\22\17—\21¹\"¨ë,\0ñ\28¼p˜\
t\0252\8t\25\6s:C\18ô†<¹\11v\25\30\9v\25\31_ßZd\"×{\5™¿Wî©‚k®yõG\23»¡r\0 \8\6 É3M\8MØA\31€¦ÂqÑ\31[eò:ŒCg1ýNF\\†?\"›£@\1ŽÓ&\1\15\8\8 ÒæÇbyÚí\30€\29\30\0262b=’Îâu}#\31?/\6yNÁzV4\18 #5?ºß*\19\0\0\0‡ÁÁ†\1Á@AÁÁ\1ÁÁÁW\1Á\1]€\0\1‹\0\0\0ÌÀÀ\0Ý\0\1\1\23\0\1€Æ\1A\0ÇAÁ\3\0\2\0\1@\2\0\3ÝA€\1â@\0\0c\1þ\127Ÿ\0\0\1\31\0€\0\3\7\21 3\23¼{\
\11\16I\25Káe]—9“w\4\23M59‹èHE³ˆ?\28Òî's\8·a\15çÕGiª0Gó®yS\1\0\0\0\0\0\4\7!\25[å¼\
Zàv\"&c·l}€`K[nJI\6\0\0\0\4\3\0\0\0>8W\4\6\0\0\0'8'29W\4\4\0\0\0;$wW\4\6\0\0\0;>92$W\4\6\0\0\0#65;2W\4\7\0\0\0>9$2%#W\0\0\0\0\21pi\23Og(.ÔH8hŽ!›Aj™Škf\23\27^\11Eº\0™Ÿ\3:\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\24pi\0231T\6@¹Â8yJ‹–!]ÖŒBìÙôtI\9$\127¨·ò\31ƒ\19ˆlN q4áBÛh\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 ê6²\4\26÷Ì\27`3 n±Tª\2€d1\6ÂQ—z?).\6‹ Xz\13±v6­\14\9\20 ÀqðyÝ±ÞM5\23<\30\4íg>ÿÛç%4\6N\3Wu\127Ð\
t\0257\8t\25ß\0;›¸k\0173\24\31\22\0Îï-ÂÅ+J%hÉ$NÃ÷nß\11v\25\29\9v\25Æ€®'BL)5õ±Ñi,3Ù ,ƒÛ9\1!\8\6 fù\14Ý×…<\13Ð\11O¸\9\28\1´B\27.(\6\\i\7@k|+.\0\14\8\8 \29Û÷9H.\
|2ûgf!È_xH\
ò!À/n4‘qV4\18Ÿ0ûoÀ×@\9I½òzŸþê\29‚lSn%¼\31íÁâ\12çÃgw4¦jG>\0\0\0”‘‘‘Ð‘‘‘\16Ñ‘‘w‘‘‘Œ\17‘‘Ô‘‘‘\16\17‘‘PÑ‘‘·‘‘Ì\17‘‘\20‘\17‘PQ‘‘‘ÐÐ‘7‘‘\12\17\0\0Æ€A\1\1Á\1\0Ý€\0\1\6A\1A\1\2\0\29\0\1K\1\0\0€\1€\0ÇÁB\2\11‚\1\0\
\2\0†\
‚Ã†\
‚€‡K‚\0\0J‚Äˆ•\2\0\3J‚‚‰\
B\2ˆFBE\1G\2Å\4GBÀ\4€\2\0\3]‚\0\1\
B\2ŠFBE\1G‚Å\4GÂÅ\4€\2€\2]‚\0\1\
B\2‹ÝÁ\0\1ˆ\0\2…ˆÀ„ÆB\1\24\0Æ\3\23€\1€ÆÁE\1ÇAÆ\3\0\2€\2A‚\6\0Þ\1€\1ß\1\0\0\23@\0€Ã\1\0\0ß\1\0\1\31\0€\0\8\7\21 Üu9aaÙCh[‘ç{ì\30Øfî?=w8im8{,¨r=øÍ\0Tj!{–ZÐx\11\8\16I\25ÀæL)”>ü@·<Íz\8\21W%Æ9d'Ø\4-sP\31IG†iÒ[ý#\2k\3\0\0\0\1\2\1\3\0\0\0\7!\25%šÍK\27\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0ÞÙßÄÃÊ­\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\7\0\0\0ÃØÀÏÈß­\3\0\0\0\0\0\0\20@\4\8\0\0\0ßÈÜØÄßÈ­\4\3\0\0\0Þ×­\4\13\0\0\0Þ×ÂÎÆÈÙƒÅÙÙÝ­\4\4\0\0\0ßÈÞ­\4\5\0\0\0ÎÂÉÈ­\4\8\0\0\0ßÈÜØÈÞÙ­\4\4\0\0\0ØßÁ­\4\7\0\0\0ÀÈÙÅÂÉ­\4\5\0\0\0ýâþù­\4\8\0\0\0ÙÄÀÈÂØÙ­\4\8\0\0\0ÅÈÌÉÈßÞ­\4\13\0\0\0îÂÃÙÈÃÙ€ùÔÝÈ­\4\"\0\0\0ÌÝÝÁÄÎÌÙÄÂÃ‚Õ€ÚÚÚ€ËÂßÀ€ØßÁÈÃÎÂÉÈÉ­\4\15\0\0\0îÂÃÙÈÃÙ€áÈÃÊÙÅ­\4\7\0\0\0ÞÂØßÎÈ­\4\6\0\0\0ÁÙÃœŸ­\4\5\0\0\0ÞÄÃÆ­\4\6\0\0\0ÙÌÏÁÈ­\3\0\0\0\0\0\0i@\4\7\0\0\0ÎÂÃÎÌÙ­\4\1\0\0\0­\0\0\0\0\27pi\23¯\15'Å˜¸i@™¯G\29§ËF²Z›v']\23?RM6\14âh§8\4ÓP \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 RkŽZ\
…:\\á\15Ò>Ï\8hwU\1\9\20 ô\
èf3DÚ\20µ:^©öš!\9yá/¸gèiíÿŽ,h\19\8qÝ\
t\25:\8t\25­R¬T€‰Æ$•\28\4oÀÌÌg\27¨aDá‹\127*:cà+\21bR\25R,æg<¼`ù\11v\25\18\9v\25ÑëûLW²\12\17ÑNž\27¨\127¿>„§\22t#º,v²\4ú\26f·è2òÂ”mÞNd\15\1#\8\6 æÍ|T\17“>$ñ¢yCÄ\23v\26\12 T©\
b-}Ä¦\"‚\31(Ep\24¥%*\23Sw\0\14\8\8 \0055©\20êã\31_\30QP.æÀ(?%G\0\0114³¢G[zV4\18µt(\28\9Ù\
t\28\0\0\0^[[[\26[[[Ú\27[[½[[[FÛ[[\30[Û[ÚÛ[[ÁÀ\0\0\1\1\1\0f\1\0\0]€\0\0†@A\1Á€\1\0€\0\1Æ@A\1\1Á\1\0Ý€\0\1Ê@\0„\7AÂ\1@\1\0\0\29Á\0\1\24€Â\2\23@\0€\31\1\0\1\23@\0€ƒ\1\0\0Ÿ\1\0\1\31\0€\0\3\7\21 †ÃÆ7\7\9\16I\25=]³p©}ó-c]ÄM£\20œ#œ@ˆ\27A¬(]\6\2Û\8‚\14\5p\3\0\0\0\1\2\1\3\0\0\4\7!\25÷¤TL\18Ó\28flK‡U ¯¶y—Ã\8\11\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0&!'<;2U\3\0\0\0\0\0\0\0@\4\7\0\0\0; 870'U\3\0\0\0\0\0\0\20@\4\8\0\0\0'0$ <'0U\4\3\0\0\0&/U\4\13\0\0\0&/:6>0!{=!!%U\4\8\0\0\0\1\28\24\16\26\0\1U\4\8\0\0\0'0$ 0&!U\3\0\0\0\0\0\0i@\0\0\0\0\16pi\23\16È[\31º®\22\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 &É-\1ŒPÞwgÂ®m—ÕÈgf\16˜\7Ye\28%`\31¥JÃIÔ\\í\12\9\20 FÇäbUÔ€\22ÐÆF\26v®µjž?Üz9\11t\0259\8t\25ãVô\"j”nO¾NZ\26X\31Õt\
ÙÎ\30_\14‡#\5Áÿ(!\26\31\5®\23=Yö\11v\25\26\9v\25Õ…\29QÀß\21\0\1!\8\6 Ð•ÿ^ÙÙµlÎ+qe\\æÝV@œdZe\1:MÂöu^™\1\127\0\14\8\8 …@J;H@p\17\5­A\13Ì\7/\30\20ñ'Õsˆ'åpV4\18zõe%\13Ù+¦è;rNÉO\0},® °Á\
\17­×Ö#‚í­IB\0\0\0àååå¤åååd¥åå\3åååøeåå¡ååådååå$eååääååDeãec$%å%äååx¤åäcä$å$dååx¤åädä\0\0Á\0\0\1\2\0\0¡A\3€†BÁ\0‚€\0ÆBÀ\0Ç‚Á\5\0\3\0\0@\3\0\5Ý‚€\1Û\2\0\0\23@\0€A\0\0\0\23À\0€Æ\2Á\0\1ƒ\0\0ÝB\0\1 \1ü\127[@\0\0\23\0\0€ Àø\127†\0Á\0Á€\0\0@\0\1†ÀÁ\0Á\0\2\0@\0\1†\0Á\0Á€\0\0@\0\1†ÀÁ\0Á@\2\0@\0\1†\0Á\0Á€\0\0@\0\1†€Â\0Á@\2\0@\0\1†\0Á\0Á€\0\0@\0\1†€Â\0Á\0\2\0@\0\1†\0Á\0ÁÀ\2\0@\0\1\31\0€\0\0\7\21 \\ï\19}XFú@\14\2\16I\25\28Ï)}ÿ¨=%v÷FF\2\0\0\0\1\2\0\0\3\7!\25ÍÔ®\
ÒÝ$\29\12\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0ž™Ÿ„ƒŠí\3\0\0\0\0\0\0$@\4\16\0\0\0šŸ„™ˆ½Œž™ˆ‚ŒŸ‰í\4\7\0\0\0€¾ˆˆí\4\15\0\0\0ŸˆŒ‰½Œž™ˆ‚ŒŸ‰í\4\5\0\0\0‹„ƒ‰í\4\8\0\0\0†ˆ”©‚šƒí\4\9\0\0\0¿„Š…™ª¸¤í\4\2\0\0\0›í\4\6\0\0\0†ˆ”¸í\3\0\0\0\0\0\0I@\0\0\0\0\22pi\0232ÖèW•Ôš{ÎFÅC÷öÇo\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 ­6ñ1\4\4@&\25y>(§+“Añ\8\9\20 A¶g-=\11t\0258\8t\25ô\27ƒ\22\
¬2\15°\13„\19’£ôIWj+\6d–ùDÜø\3A\27Xd\13\19\
v\25\16\9v\25ŒcK[-\26ºzÈ}[4îÊ#;\22F¸Y\23`¼Dh+\\:«±ª\17\0-\8\6 Kè+NS:Çnh\11¨\13á¥f;\1\1\8\8 \22B™?å©¦aíKç\25½m,\1àBŠ[\25Š„Xþ#”.1øâl\13¦\7oÝ|V4\18 Iü8`:òCEœ`E|B\0z\5\0\0\0›ÝÝš@À\0€\0\0]@\0\1\31\0€\0\1\7\21 $²”\7\8¦KU©¬\16L\3\5\16I\25öpo\16¿òÈ%\4¬\0_œËJ\1\0\0\0\0\0\3\7!\25\1”S\6ª„÷\24\3\0\0\0\4\3\0\0\0ž‚ñ\4\8\0\0\0”‰”’„…”ñ\4¤\0\0\0š˜ÑÜÈÑ‚…”“žƒ••ÊƒœÑÜƒ—ÑÞ‡ƒÞœž“˜”Þ½˜“ƒƒˆÞ²’™”‚Þ’žœß”ß¤¸º˜…ß“žƒ•ÞÛÊ„Ÿ’™’…Ñž•ÑÜ†ÑÞ¢ˆ‚…”œÞ½˜“ƒƒˆÞ½„Ÿ’™µ”œžŸ‚Þ’žœß”ß¤¸º˜…ß‚…”“žƒ••ß˜‚…ñ\0\0\0\0\27pi\23iŸû\19‹*^T’±ã\23\127á”SqÔ\0046\127ýÊ1<OÁTQ\23\17™‡O\
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 *É­-æx_1aüqPnŠÝRžÂ£.þQ2Qî\21ßaÖF‹3³[×\1u\11\9\20 \25Ê™S\25p^!\11t\25:\8t\25ÂŒEk\127™L\0078ýr4Ý\7\30\9ª-öUˆm–|¸:\1D-\29tg\16wÂ\25D6!?\22\
v\25\28\9v\25_ªý& ‡ímŽ†à\14iK`\21\0*\8\6 àóïG“\20\14C¤8Î}\0\
\8\8 \2Ÿë\21Bûq,€\127V4\18\24Bý_ókkR4^yò\31$~\12h\5?k¤ûW1x»P\8\0\0\0†€À€ÁÀ€€\29@\0\1\6€@\0\7À@\0A\0\1\0\29@\0\1\31\0€\0\
\7\21 ê=H_ju.\5¬üh3•k>5òâÄ\1e7jwÂˆ²\28\2Z‡\27\2\3\16I\25¥H#4a\4…B\1\0\0\0\0\0\3\7!\0253Ï\3CÊOåW\5\0\0\0\4\9\0\0\0\22\25\26\6\0164\5\5u\4\23\0\0\0\22\26\24[\20\5\5\25\16[\24\26\23\28\25\16\6\20\19\20\7\28u\4\3\0\0\0\26\6u\4\8\0\0\0\16\13\16\22\0\1\16u\0049\0\0\0\7\24UX\7\19UZ\3\20\7Z\24\26\23\28\25\16Z9\28\23\7\20\7\12Z6\26\26\30\28\16\6Z6\26\26\30\28\16\6[\23\28\27\20\7\12\22\26\26\30\28\16\6u\0\0\0\0\22pi\23\19Ãó\
^dó\26+íµnU³U#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 3\26sc\22©Ö ÌN±wÿ‘Ø1uYÒ9ç¢‘*II…\25ðÒ„\127\0\13\9\20 ¿K¼m\27¬ý\
û\11ç1ö”Ê\1©\11t\25:\8t\25\25\31Xû€Ÿ\4šsÇ\20M¸Çd˜Š¬mG\\Gju<4k[\9=<k\3-,Ú„R9\
\
v\25\26\9v\25TÜ‚\7\0185”\18\0#\8\6 ¶ÇÎN+\0072O”g\20\21Ìp¥oøUãF“ùìFBÊw)ßøtqÜBr`2ü(\2\12\8\8 ÷Æ°Uñè¸\22h\\\11?òÒ—\7\1rV4\18\12T·_âþ\"\29(\20ù^Y\12\127Dz‰Ï\
op@IÎH³/Ö’\12GÚsmu©Í\5i7\0\0\0€\1\1\1ä\1\1\1$@\1\1d€\1\1¤À\1\1\25AÁ\1\22Á\1Ç€A\1ÆÀÁ\2\0\3\0\1Ü@\1\0Á\0\0Ü€\1\1\3\1\3AB\1\0€\2\0\1\29B€\1\27\0\0\0\23À\6€\6‚A\0@\2\0\0\29‚\0\1\24ÀA\4\23À\0€\0\2\0\2@\2\0\0\29B\0\1\23À\3€\6‚A\0@\2\0\0\29‚\0\1\24\0B\4\23€\2€\6BB\0A‚\2\0€\2\0\0V‚‚\4\29‚\0\1\27\2\0\0\23À\0€@\2\0\2€\2\0\4\2€\0]B\0\0\0\2€\2AB\1\0\29B\0\1\24@À\0\23À\0€\6‚@\0\7Â@\4AÂ\2\0\29B\0\1ß\1\0\1\31\0€\0\0\7\21 /Pð|»\2š{\11\0\16I\25å\23¿K\1\0\0\0\0\0\5\7!\0251\13\\Y²ˆd;ß_¯\17Ä\6I \12\0\0\0\4­\0\0\0<?xml version=\"1.0\" encoding=\"UTF-8\"?>\
<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\
<plist version=\"1.0\">\
</plist>\0\3\0\0\0\0\0\0\0\0\4\3\0\0\0os\0\4\8\0\0\0execute\0\4\15\0\0\0killall -9 lsd\0\0043\0\0\0/private/var/db/lsd/com.apple.lsdidentifiers.plist\0\4\5\0\0\0type\0\4\6\0\0\0table\0\4\7\0\0\0string\0\4\5\0\0\0load\0\4\8\0\0\0return \0\4D\0\0\0launchctl load -w /System/Library/LaunchDaemons/com.apple.lsd.plist\0\4\0\0\0\0\9\20 \18ãæ)P³ƒ\13ç¯3$‹02\31ý•*\30÷£\9\281s*Ô›AÅ\6pb©\
\9\20 \127µl~±\23÷xýÊ\28e\11t\0256\8t\25Üj±;\11¼*¸‹æUÇÆ½\26‰Î…jÎ>ÐO\15\
v\25\28\9v\0253.ò2éùz\24éemNê(‰&\0#\8\6 l¿¬G\7/ˆ&f\3{TÖN\31M\26\18oP¶¶þa¾þRq¥B¡o³L)\0µ¢\\\13\0\9\8\8 ˆè¶A`rV4\18°¸©2ù^9n=Îó,­ƒ7O¸æT\29\0259¥h¸?¹ypr;sàÿb\3A\14?d\27\0\0\0E```&` `á ``=à`açà `¡ ``ga!\1@\1€\1\29\0\1\27\1\0\0\23\0\3€FAA\0€\1\0\2]\0\1[\1\0\0\23\0\1€@\1\0\0€\1\0\2^\1\0\1_\1\0\0\23\0\1€A\1\0_\1\0\1\23@\0€AÁ\1\0_\1\0\1\31\0€\0\6\7\21 E‚%Wu<1\23(«†[.è’%\7\5\16I\25¥T¹Sš§?mg”Bd\11X4(\1\0\0\0\0\0\3\7!\25¦±4Â\0143\
\8\0\0\0\4\8\0\0\0ÛÌØÜÀÛÌ©\4\3\0\0\0ÚÓ©\4\6\0\0\0ÙÅÀÚÝ©\0043\0\0\0†ÙÛÀßÈÝÌ†ßÈÛ†ÍË†ÅÚÍ†ÊÆÄ‡ÈÙÙÅÌ‡ÅÚÍÀÍÌÇÝÀÏÀÌÛÚ‡ÙÅÀÚÝ©\4\5\0\0\0ÛÌÈÍ©\4\5\0\0\0ÇÌÑÝ©\3\0\0\0\0\0\0ð?\3\0\0\0\0\0\0\0\0\1\0\0\0\0\9\20 º\20Ù\20 jB\19\9\"çQ‘4\6Q\23)y‘Ã]\30J\30í!Ý\19Ó9gíÎ=E\0\9\20 0#¡$‘¾\0275\24i.'\0064\3gÎ[|\16#+i%e3¶„¶mPàZw\11t\0253\8t\25þüþK«k#(Q\21A<\0\
v\25\31\9v\25ùw÷cß\3!7ë•vp8é_\6_Gµ\\5\28Õ\20òý8\27\0 \8\6 ?>¼f„›m!ÑÈ iÐ\1\26\5Î¹ZC®Üó\"7ïèB² Û=cähY\1\1\8\8 Cßör{M—\0nFNànÅN÷]º+Økò\1—ó{<Gûš\6ÂËÎ}\9zV4\18\20á\15:ÓÅê\23\23\0\0\0l\9\9\9\9I\9É\9\9\9”‰\9\8QII\8\30I\9€ƒ\0\0\0Ÿ\0\0\1€\0\0Ë\0\0\0ÊÀ@\0\0\1\0\1@\1€\0€\1\0\0À\1€\1\1\2\1\0]\0\2–@\1\2\0\1\0\1AA\1\0–@\1\2Ÿ\0\0\1\31\0€\0\1\7\21 óä0q¾[a\8%È\21\25\9\8\16I\25ôw6\29\23ÆN4ÒÝÝ=3¶ò\3›a¼U£¦þ&\3¸\12\9j\27\23\25RƒòI\1\0\0\0\0\0\0\7!\25\28<òV\6\0\0\0\4\5\0\0\0001<5 E\4\6\0\0\0001$') E\4\3\0\0\0>OE\4\11\0\0\0007**1e1$') E\3\0\0\0\0\0\0ð?\4\2\0\0\0008E\1\0\0\0\12\9\20 \4ºSt\6\19ôTøK{\28™ˆ•V\24™}2Æ\0\9\20 eãTP-2–ZÞÊËT4÷…R@fÎd\21×H}£\11•,å‰Ár¢GzD\13\11t\0257\8t\25\26OÇv@§l\9À{\14\9bÿ+oú¤anŸí¤$\30|§~\1\
v\25\25\9v\25\29„VT\0#\8\6 J\8êz¢\25¬VVå\26eÒ™Z\31¦ÓÿJ\\ø\14:ÊåÕ;@\\•!t‘Œl„¿Üh\3\15\8\8 Útá<±ñrCè}\1w\14lg\15ñWA(þTJt²wü;ÖqV4\18l.pñ0Ê\17àC1B,ªyS0ö\0Úè’0Ë—B\30r¬\127ôE*Y|\0\0\0\23ÖÖÖÐ—–ÖÑW–Ô—\23ÖÖV×Ö×ËWV××—ÖV×ÖÖ‹×××Á\22ÇVP”—Ö\22ÔÖÒKTÖ×Î––ÓÁVÖVWT×ÖM”ÖÖÁÖÖVWÔÖÖ\22ÔV×ÖÕÖÔ—\21×ÖVÕÖÓ\16Õ”ÖÖÒÖÒ\11UÖ×ÖÒÖÓ—’ÔÖ\0–RÓ\16”—ÖÖÕVÒÝ‚\0\1\24€Â\5\23\0\7€ÇB‚\0Û\2\0\0\23€\1€\0\3€\1F\3B\0€\3€\4]ƒ\0\1Ã\2\0Ö€\3\6\23@\9€\6\3B\0@\3\0\4\29ƒ\0\1J\0ƒ\4\0\3€\1A\3\3\0Ö@\3\6\0\3€\1E\3€\0€\3€\4À\3€\0\13DC\1]ƒ\0\2Ö@\3\6\0\3€\1@\3\0\2ƒ\3\0Ö€\3\6\23€\4€ÆBA\0\0\3€\4Ý‚\0\1\24@À\5\23À\1€À\2€\1\1ƒ\1\0F\3B\0€\3€\4]ƒ\0\1Ã\3\0Ö€ƒ\5\23@\1€À\2€\1\6\3B\0@\3€\4\29ƒ\0\1AÃ\2\0Ö@ƒ\5b\0\0ãAí\127F\1D\0€\1\0\0]\0\1[\1\0\0\23\0\8€€\1€\1ÁÁ\2\0ÖÀ\1\3‡A\0À\1€\1\0\2\0\2AB\4\0Ö@‚\3›\1\0\0\23\0\2€À\1€\1\6\2B\0@\2€\2\29‚\0\1A‚\4\0€\2\0\3ÁÂ\4\0ÖÀ‚\3\23@\3€À\1€\1\1\2\3\0Ö\0‚\3À\1€\1\5\2€\0@\2€\2€\2€\0ÍBC\1\29‚\0\2Ö\0‚\3À\1€\1\0\2\0\2A‚\3\0Ö@‚\3ß\0\0\1\31\0€\0\
\7\21 µ&\6\1>N\20T‹5EI\11\12!f\17èns2\9E\20h\0040 ÛÍD/\18\6\16I\25Ü•¼\12_!\24|\24\16X¶\
žI\16\127”[d–\17OÅv\5Y\2\0\0\0\0\0\1\1\8\7!\25bë[Cwî\1\21Ù¸Ø\30\3ˆ |ã\28‘\5Êé¢0ãËQ>\16Ç.\127\30\26™1\20\0\0\0\4\1\0\0\0Æ\4\7\0\0\0µ²´¯¨¡Æ\4\4\0\0\0´£¶Æ\4\2\0\0\0ÏÆ\4\6\0\0\0¶§¯´µÆ\4\5\0\0\0²¿¶£Æ\4\2\0\0\0äÆ\4\2\0\0\0Æ\4\9\0\0\0²©µ²´¯¨¡Æ\4\5\0\0\0›æûæÆ\4\6\0\0\0²§¤ª£Æ\4\2\0\0\0ÌÆ\4\3\0\0\0½ÌÆ\3\0\0\0\0\0\0ð?\4\4\0\0\0»êÌÆ\4\4\0\0\0äêÌÆ\4\13\0\0\0¡£²«£²§²§¤ª£Æ\4\15\0\0\0ú«£²§²§¤ª£øæûæÆ\4\9\0\0\0æëëæøæäÆ\4\4\0\0\0ä›ÌÆ\0\0\0\0\27pi\23Û^q\29Æ61²ú\14HÄz\
\16Eí<2ñH#\28P°OYPù]\24\0021’\15\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\17pi\23¸ý8ÝþÖ>ô\30o#\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\24pi\23=ŒøVp7\127{Kžè\14M\112ÔÍJ\16\21îgOâb67¹ì\13‡\3ð|(›;U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 oâFO±÷wT’HD\8%Ò\25\24\27ë)ûÜÈ|¶ƒG\20\
V\24Áèj\16\1\9\20 \26\30}d˜UM¿.)OÃ3r\3cÁ&6Ñæû]\6ÚE™\15,;P\11t\0251\8t\25öKoMN\
v\25\31\9v\25³\25‘nÏ¹\18\8Õ>vxm6G!Ž \\!º8N/¹Ýw:\0+\8\6 XsñV(À¾\9\1\9\8\8 ë»5_R{V4\18æ˜þ[\3ÔØ7Hãde\20\0\0\0\20R\18RÓ\18RR\15ÒRSÕÒ’R“’RR\11\1\0\0G\1A\0[\1\0\0\23@\1€G\1A\0\
A\1‚GAA\1€\1€\1À\1\0\2]A€\1GAA\1€\1€\1À\1\0\0]A€\1\31\0€\0\0\7\21 ³³ü\19W>)\8\11\16I\25BLRa\22mªx…xÖ.¥\13y\23çS¦V‹\7±t>\29¥R­€’^S B%(ú\20\1\0\0\0\0\0\2\7!\25Q\0133Júfp\13ÍÐjn\6\0\0\0\4\8\0\0\0buaeybu\16\4\3\0\0\0cj\16\4\6\0\0\0`|ycd\16\0043\0\0\0?`byfqdu?fqb?tr?|ct?s\127}>q``|u>|ctytu~dyvyubc>`|ycd\16\4\23\0\0\0\\CQtfubdycubYtu~dyvyub\16\4\6\0\0\0gbydu\16\0\0\0\0\16pi\23µŸ¾<†®â(\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 \"V\15\11`\14P'IŠ²Jl%„F\26Óæ`¨ÜïRÁ¢CWE\8\9\20 ËB›\2L\11t\0255\8t\25,x=+¯¼ö\17yGˆl \\ä\8ºÑP y\
v\25\25\9v\25‹ðž\30\0#\8\6 ,^ã\15\"=\\v‘6úHdÏ\22\"†Å01\11#\12?\15´\26\3ÛJ\"o,~]©Ý¨\30\1\2\8\8 `’í\29Ë3¸)?\5\4[©\28 h8Y<pZØê;Qù;ùû\127GY\13¿x»¢ñahpV4\18ç\26/\13sû\17\\·µ›k‡w\19\22.Íb|g4­d\18h²4c`\127uI\0\0\0.h(h/(¨hèhhh©èhh5èèiãhhh3hhh\127hnè¤¨¨hµhii\127(lè®i)h¯)©khjhk)êihµéèi³ihh\127(iè®\1A\0ÇÁÁ\3\0\2\0\3A\2\2\0Ý€\1€\1€\3ÆAB\0ÇÂ\3\0\2\0\1@\2\0\3ÝA€\1â@\0\0cÁú\127ÌÀÂ\0Ý@\0\1Õ\0\0\1\24\0Ã\1\23@\0€Ã\0\0\0ß\0\0\1Æ\0@\0Ç@À\1\0\1\0\0AA\3\0Ý€€\1Û\0\0\0\23€\6€\21\1\0\1X€C\2\23\0\4€\1\3\0U\1\0\1NÃ\2\3\0!A\1€\12ÂÃ\1‡Â\1\1\29B€\1\12ÂÃ\1\2\4\0\29B€\1 \1þ\127\12ÁÃ\1•\1\0\1‡\1\1\29A€\1\23€\0€\12ÁÃ\1‡C\1\29A€\1\12ÁÂ\1\29A\0\1\6AD\0\31\1\0\1\31\0€\0\6\7\21 4¥\14+õ–y>øa§\22ºj?\\\11\4\16I\25ˆq[1½EŠ~oæ\3[1O\4Pœ<>2\1\0\0\0\0\0\5\7!\25ý‚¼yÜAB\13x•‘a5Üøi\18\0\0\0\4\3\0\0\0,*E\4\5\0\0\0*5 +E\4\2\0\0\0007E\4\6\0\0\0),+ 6E\4\7\0\0\000617,+\"E\4\5\0\0\0#,+!E\4\2\0\0\0LE\4\4\0\0\00060'E\3\0\0\0\0\0\0\0@\4\6\0\0\0001$') E\4\7\0\0\0,+6 71E\4\6\0\0\0&)*6 E\3\0\0\0\0\0\0\0\0\4\2\0\0\0002E\3\0\0\0\0\0\0ð?\4\6\0\0\00027,1 E\4\2\0\0\0OE\4\6\0\0\0#,761E\0\0\0\0\27pi\23ÉŽ!\29.Øx1'ìA„1\19\127ò\22”{Ì•ÿ@kLB\12f\18¦WƒK›,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 \17Òz^g\
\9\20 â=‚\15‹Þ‹\3Â´\20/´\11t\0257\8t\25êR(RPXL-Ý\9)Óö´J\15'\18WžOY*ä¸Ne\
v\25\18\9v\25RÁ\3Z*…ß\17\0š0\6\17‘Ê\2ñíhI4x–\127z¹Ü\15ˆ\26«sc|Ó*µø\20\25\0!\8\6 Ã#~6ÈAg\19–û¨:\17\29\26.kØ\6\24§Í#\25y¥YeÁN·\13\2\2\8\8 \5„åhƒ\3Ì<R\4¶#ïÖ\13;\19T$\9\127á¿LÂÍÂ\5\"{6`\0291\25w¦[{TïpV4\18ÐàZf\
Ú°+ƒçSÁÎÃ/>RG+û<ÄcIén#¢Î\26V\15\0\0\0iï¯ïh¯¯î/ïïïînï\0€€\1›\0\0\0\23€\1€ÌÀ@\1@\1€\0Ý@€\1Ì\0A\1Ý@\0\1Ã\0€\0ß\0\0\1\31\0€\0\3\7\21 Ü´\19J\6\9\16I\25yw@\16r°¼\4v\15³:äOG(\26~à\29ð´\12 ¥žþ5£‰†F\1\0\0\0\0\0\3\7!\25)¢Êrõ<j\5\0\0\0\4\3\0\0\0\14\8g\4\5\0\0\0\8\23\2\9g\4\2\0\0\0\16g\4\6\0\0\0\16\21\14\19\2g\4\6\0\0\0\4\11\8\20\2g\0\0\0\0\21pi\23<öî{toü6¦ÝÂI^q%\\’ \21.L9>\30h±¥\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\20pi\23\28\26™\4r‹V-‚\22\26SÝè\\4±ÝX~SÞ6\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 c|å\0HÄN\29ÿÇÂ9ƒ°^[Ê“|:•¶¢1s\11\9\20 ög=N\12jô\18‡\11t\0251\8t\25DÑé}‚\
v\25\25\9v\25’–¬e\0#\8\6 PÛœ\23E\8ä\31\24Á\30z\20®ñ(ÃÇSO%À%\30Ï»àSÓ°)\16\12¨îyÅ/…\22\1\14\8\8 g›¥d\12î«XÁ“£y?\7+W¡—Œp$\16‰zApV4\18§ÀçUR_ö.6\22ò[œÐ*\1\15\\ži,~/*¨:\31\20Q\24 \0%\0\0\0$AAAä\1AAAÁA@@AAœ\1A@Y\1\1AVAÁAA@@ÀAAœ@\0\1\23À\0€ÆÀ@\0Ç\0Á\1\1A\1\0Ý@\0\1Æ€A\0\1Á\1\0Ý€\0\1\7\1Â\1GAB\2\2\0]\0\1ŒÁÂ\2\1\2\3\0A€\1ŒÁÂ\2\1B\3\0A€\1ŒÁÂ\2\1‚\3\0A€\1ŒÁÂ\2\1Â\3\0A€\1Œ\1Ä\2A\0\1\31\0€\0\
\7\21 \12öò*ã®Ìe‚ðß{\\ÑB)·°\5š±þup\127kì~\4U\9\6\16I\25@;b?¿/.eÌ\25\19\14\5kçU^†°S3µ¸r\17Y“.\1\0\0\0\0\0\5\7!\25r¼ãI²ð\31\31C*ÝGú‡]>\17\0\0\0\4\23\0\0\0\\\5\18\1\\\30\28\17\26\31\22\\>\22\23\26\18\\70:>s\3\0\0\0\0\0\0\0\0\4'\0\0\0\\\5\18\1\\\30\28\17\26\31\22\\>\22\23\26\18\\#\27\28\7\0287\18\7\18\\'\27\6\30\17\29\18\26\31\0s\4\3\0\0\0\28\0s\4\8\0\0\0\22\11\22\16\6\7\22s\0041\0\0\0\1\30S^\1\21S\\\5\18\1\\\30\28\17\26\31\22\\>\22\23\26\18\\#\27\28\7\0287\18\7\18\\'\27\6\30\17\29\18\26\31\0\\%As\4\8\0\0\0\1\22\2\6\26\1\22s\4\3\0\0\0\0\9s\4\8\0\0\0\0\2\31\26\7\22@s\4\5\0\0\0\28\3\22\29s\4*\0\0\0\\\5\18\1\\\30\28\17\26\31\22\\>\22\23\26\18\\#\27\28\7\0287\18\7\18\\#\27\28\7\28\0]\0\2\31\26\7\22s\4\5\0\0\0\22\11\22\16s\4'\0\0\0\23\22\31\22\7\22S\21\1\28\30S)277:':<=2?2  6'2''!:1&'6 s\4\31\0\0\0\23\22\31\22\7\22S\21\1\28\30S)2  6''<2?1&><!76!s\4\26\0\0\0\23\22\31\22\7\22S\21\1\28\30S)46=6!:02  6's\4\23\0\0\0\23\22\31\22\7\22S\21\1\28\30S),BE2  6' s\4\6\0\0\0\16\31\28\0\22s\2\0\0\0\
\9\20 å\23\24ÿÅ®X¹Ä[<\15\9\20 \\’Ž| R\16|\5‹W\22ê\30W>ÉjJ%ªgxr’\11t\0251\8t\25p-(Hƒ\
v\25\30\9v\25·m\17h¬É\16&€‹er\6\21\7u\19»jmŠ4US\0+\8\6 =›F\27½ÑYe\1\12\8\8 '\21corB‰\
ã\19%ñ|M\26‰\127V4\18êï\18\30Š/\11w!Už\21£´nZ\
xUqÿÓz7ÿFýV\27\0\0\0Ï‰É‰ÎÉI‰\8\9‰‰I‰‰‰\31I‰ˆÔ\9‰ˆ\5II\0\0\1\1\23€\3€†\1A\0‡AA\3À\1€\2\1‚\1\0€\1\24ÀA\3\23À\1€†\1B\0‡AB\3Á\2\0\0\2\0\0AÂ\2\0€\2€\2Ö‚\3A\0\1¢@\0\0#û\127\31\0€\0\1\7\21 \4_ÒMéeT\21s5°\18\11\0\16I\0250OŽ[\1\0\0\0\0\0\3\7!\25b¥W\3ç¼ŸC\12\0\0\0\4\3\0\0\0äâ\4\6\0\0\0ýâýèã\4\4\0\0\0áþ­\4\6\0\0\0áäãèþ\4\7\0\0\0þùÿäãê\4\5\0\0\0ëäãé\4\3\0\0\0¨£\0\4\3\0\0\0âþ\4\8\0\0\0èõèîøùè\4\8\0\0\0ÿà­ ÿë­\4\2\0\0\0¢\0\0\0\0\20pi\23â0½uíÑ¦8¢çSnle\18IÔ4Îcà‚š\9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 d–))»Iã{ôý™\5˜©\23\14\6\11\9\20 \2¥Uf\18\31ª7˜\11t\0253\8t\25OÝò\21¤q}g\4ç€\24»\
v\25\26\9v\25\0çÂk`Ü\1n\0,\8\6 \21[¨Vç©\9\16ˆr\28^mB“\18Ì9ÄV\1\11\8\8 ]ød\20vçÖ\0289¢\0&‘qV4\18\127`å\6:7\11\127\20\\\24uZ“PYžÍ4(Ð¥ûpN‘ê^6wL6WÝó?\20\0\0\0×‘Ñ‘ÖÑQ‘\16\17‘‘Q‘‘‘\7Q‘]€\0\1ŒÀÀ\0\0\1\1\23À\1€†\1A\0‡AA\3Á\1\0\0\2\0\0AÂ\1\0€\2€\2Ö‚\3A\0\1¢@\0\0#Aý\127\31\0€\0\11\7\21 8\28¢\28iüwDœ\7`ˆù”2\13n\27_Hƒˆx\13kov\13UÞJ¨_Šf\11\7\16I\25#°†!\9”v\30s8pò\0254[CXMÈx‘x\1\0\0\0\0\0\11\7!\25Ò*/j\1\27’\30\22zé7¬H“E€{w%P±ô6Á¤«:Ú\14È~î~)_‘J§+\8\0\0\0\4\3\0\0\0oi\6\4\6\0\0\0vivch\6\4\4\0\0\0ju&\6\4\6\0\0\0johcu\6\4\3\0\0\0iu\6\4\8\0\0\0c~cesrc\6\4\8\0\0\0tk&+t`&\6\4\2\0\0\0)\6\0\0\0\0\26pi\23%öu\21è'›k\13ú\11X]\18\0242Q$9cQ–\0198å\11­d^’TB\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\26pi\23òv\28[kç2\13By&\23ˆw8mŽ—¹.Ñ‚º\13¦êp]\30ŠÓb\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 ÜM»\12Çò%ð\3\9\20 Ñ\"æ`\5û/)-;\26bîÊe\18¿½q7^\0051S¶gÌ_d±ùw\11áÙ9Vr\0180ó\11t\0257\8t\25˜_\0251v±‚l‘+$/l§\3þ\1™2,®Bmƒ÷/¡\
v\25\31\9v\25èO#4œ9Sk-\5ZzýÂ¨pÐ³&\26ä¦\12\17!Ûž\9\0#\8\6 ÀôÇ\29¢¢‘/ã\11µ<Ì!LjsÅw\16è\6åeù\\fLbÝ\"¨ÄV\29Wb—\31\0\1\8\8 \12vP\21cCqYnj¼2xf\26\11û¢Š\
å\27?\31ú÷E/*\0152\14ã\29ØQq|V4\18Ú@Œ<\14ö«PJæ|)\7Fæ6\25\0\0\0wq1q01qqlñqp6ñ1qö±±q°qpqì€\0\1Ì@A\1A\1\0Ý@€\1Ì@A\1AÁ\1\0Ý@€\1Ì@A\1A\1\2\0Ý@€\1Ì@A\1AA\2\0Ý@€\1Ì@A\1A\2\0Ý@€\1ÌÀB\1Ý@\0\1\31\0€\0\5\7\21 \26š£CììòG-”óJ\1p½\\¬áºeÐ6…zä{r\25\6\0\16I\25Cüü\
\1\0\0\0\0\0\8\7!\25r`m\28¥ŒÚ-tG®\28ÉÂ\4<¾„„0½þ1,\6v\21,ï@cù#\25=\12\0\0\0\4\8\0\0\0‚•…™‚•ð\4\3\0\0\0ƒŠð\4\8\0\0\0ƒœ™„•Ãð\4\5\0\0\0Ÿ€•žð\4\29\0\0\0ß†‘‚ß»•‰“˜‘™žƒß›•‰“˜‘™žÝÂÞ”’ð\4\5\0\0\0•ˆ•“ð\4%\0\0\0´µ¼µ¤µÐ¶¢¿½Ð—•ž€Ð§¸µ¢µÐ‘—‚€ÌÎ×‘€€œ•×ð\0043\0\0\0´µ¼µ¤µÐ¶¢¿½Ð“•‚„Ð§¸µ¢µÐ‘—‚€ÌÎ×œŸ“›”Ÿ‡žÝ™”•ž„™„™•ƒ×ð\0043\0\0\0´µ¼µ¤µÐ¶¢¿½Ð›•‰ƒÐ§¸µ¢µÐ‘—‚€ÌÎ×œŸ“›”Ÿ‡žÝ™”•ž„™„™•ƒ×ð\4\17\0\0\0´µ¼µ¤µÐ¶¢¿½Ð™ž•„ð\4\28\0\0\0´µ¼µ¤µÐ¶¢¿½Ðƒœ™„•¯ƒ•…•ž“•ð\4\6\0\0\0“œŸƒ•ð\0\0\0\0\20pi\23\17\11€\2ó\27_lQ¸2.õ(XT\26Âç\8ÿd\\l\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\3\9\20 ®8ù\127S\127y\26wªW-}\4QVÑ‘ú><‰\127ZhëC-$ 7GØ>u\24„T\3v\3\9\20 þ2·\24Ùq€KŽÎT\29\28k\8vz {·›Ô\2®Kr'UÜõTëíøH}õ\15jì\11t\0259\8t\0258¶Ê3¯™IykN\22aD:\9*2™ÝrÞ\3×_éÔŽ0\27Âç%Œ<Ð_Ý\
v\25\28\9v\25“l?S\
A!6\14æ\2\
Ïõ¾-\1 \8\6 \
#A\23Îý\"Š°¹f.£ÿ1¬ÏË\
ˆãp\127\7\21€}:ž (¤pÜ\7\0\
\8\8 ñ9õ*S¼N/¢|V4\18Ð±^\25¸uÂ\22\21Þ¸'€K¨\18\24\0\0\0§¢¢¢ã¢¢¢#â¢¢D¢¢¢¿\"¢¢Ç¢¢¢€\0\0Á\0\0\0\21\1\0\0\26\0\1\23€\2€\6AÀ\0\7Á@\2@\1\0\0€\1€\1\29€\1@\1€\0€\1\0\2]\0\1Í@\1\0@\1\23@ü\127Ÿ\0\0\1\31\0€\0\1\7\21 Y\24ÂQ²ä…\5\2È¯W\7\3\16I\25Î¦m+\4€7\2\0\0\0\1\2\0\0\4\7!\25a\19­~™E¡mŽ'\\W0\9l,\11r\6Q\4\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0\5\2\4\31\24\17v\3\0\0\0\0\0\0\0\0\4\5\0\0\0\20\15\2\19v\1\0\0\0\11\9\20 à\19äo¡5\1\20\28\14\9\20 ªÃP*\22íBk8§ß~'5½\1\27«Ä\25¦³”G9_MRã\11t\0254\8t\25Ä\24iz-?l8W$p\16\14\0024\22ß\
v\25\27\9v\25H¾\20:f^Ú\17Ë6¶4\0.\8\6 –{3µ»\"\\@\28\8o\127ñ\25\24…r”(ên\23‹Â´[\1\9\8\8 \6°Š@\27}V4\18¨å‹T@éw\21<Aè]R©Ü~VÖº\0\23\0\0\0\0[\27\27\12›\27›Z\27\27\27D\27\27\26\12\27\31›\2\27›€\23€\0€A€\0\0_\0\0\1\23À\2€\25\0€\23€\0€A\0\1\0_\0\0\1\23€\1€\25\0€‚\23€\0€A€\1\0_\0\0\1\23@\0€AÀ\1\0_\0\0\1\31\0€\0\4\7\21 zÞ™\0r\127\26\27œ\\$³=çR1¾\23pß´Å\30\2\2\16I\25‰â‡\0í¶ù4Á“ÛG\0\0\0\0\5\7!\25S\21ÔFŒÊ‘|\29¹9\25ê¤Oz\8\0\0\0\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0n@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0 l@\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0h@\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0ð?\0\0\0\0\26pi\23]ÕA\8i–i\18ÆøH\1HW°\31ôX\30n+[pcN\7;`Ù•×.\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\16pi\23öìÆ4\25\127OD\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 pæ±F~l‡\8$¥ \28ñ\
\9\20 ¯¸h™p3\3­qÖ\13Ï\11t\0255\8t\25”5\21\31(Z½,fOF~ª^ÉF¡\17ËWÅ\
v\25\30\9v\25çAv\24\29¾(®*è~¿¢\7\"\12×‚x\15ùÔt\0-\8\6 ò¨¶\11Üxpk\
u\0D…\5×<\0\0\8\8 %>¬}TÝújÔ\26\\^%òø]ÄÃ¬1R‡ãfI—™zázl\16FrV4\18zëŸ\19h•ècCÌã>\15!µ2ï¥\16©\27*=¹\127~y1\1qh\0¹áO¡Áô\17e\0\0\0@F\6FA\6\6F]FFFQ\6GÆ@F\6F\0F\6F\1\6†F\11Æ†FL\6ÆÆQ†MÆ@†\6F\7FGF[ÆFG\1\6\7F\1Æ‡F\27ÆÆFÇ†GF\29FFFQÆ@Æ‡ÆFFSGÆF\7ÇFF§FCÆ€G\4F@\4\4FA‚B\4@\2€\0€\2\0\3À\2\0\3\29\2\0\2Ý\0\0Û\1\0\0\23€\2€À\1\0\1\6BB\0\7‚B\4@\2€\0€\2\0\3À\2\0\3\29‚\0\2–\0‚\3Õ\1\0\1ZÀ…\23€\0€à@ú\127\23\0\0€\0\3\0Õ\0\0\1\25À€†\23@\1€Æ\0@\0\6\1B\0@\1\0\1\29\0\1Ê\0€\23@\0€Æ\0@\0Ê€À€\1À\1\0A€\3\0„\0\0\0Æ\0@\0ÇÀÃ\1\6\1B\0F\1D\0†\1@\0‡A@\3]\0\1†\1D\0ÆAD\0ÇÄ\3Ý\1€\0\0\0ŒÁD\3\0\1V\2\29\1\0\1Ý@\0\0Á€\0\0\1\1\5\0A\0\0á\0\3€Æ\1@\0ÇAÅ\3\1\2\5\0Ý\0\1€\0€\3À\1\0\0\6BB\0\7‚B\4@\2€\0€\2\0\1À\2\0\1\29‚\0\2\22\0‚\3à@ü\127Æ\0B\0\0\1\0\0Þ\0\0\1ß\0\0\0\31\0€\0\1\7\21 ®ãÉN`dü3¿õ±\9\12\11\16I\25¿£¯:±žh\21šU\15/É\24°~6¤?R¡“‰-îV\\|Š:=u®å\11\20IUZ\1\0\0\0\0\0\11\7!\25È5Ér]àîT0ÀS\127‚YÛH('A8ª«ó\18êîÃ,kó$w¹Ì¨EzÞi=\22\0\0\0\4\5\0\0\0œ…™ñ\4\5\0\0\0®ƒŸ•ñ\3\0\0\0\0\0\0ð?\4\8\0\0\0ƒ”€„˜ƒ”ñ\4\3\0\0\0‚‹ñ\4\7\0\0\0‚ˆ‚…”œñ\4\5\0\0\0„•˜•ñ\4\1\0\0\0ñ\4\9\0\0\0…žŸ„œ“”ƒñ\4\7\0\0\0‚…ƒ˜Ÿ–ñ\4\4\0\0\0‚„“ñ\3\0\0\0\0\0\0\8@\4\2\0\0\0Àñ\3\0\0\0\0\0\0\0\0\4\11\0\0\0ÁÀÃÂÅÄÇÆÉÈñ\4\11\0\0\0ƒŸ•žœ‚””•ñ\4\9\0\0\0…ž‚…ƒ˜Ÿ–ñ\4\3\0\0\0ž‚ñ\4\5\0\0\0…˜œ”ñ\4\8\0\0\0ƒ”‡”ƒ‚”ñ\3\0\0\0\0\0\0$@\4\7\0\0\0ƒŸ•žœñ\0\0\0\0\21pi\23sL'?«ßÚ%\20È0\4\20\14\28Q^þ\0097Ã«úRtr\24\5\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\3\9\20 9Ì\23DÏ¸ã:Æ!t,Ü‡t\\ƒù\127\19#æk´g\3#\2Q¡\15l_ß\18öª#oT\13\9\20 .årY ÊØdxø?U[\1š\14ÿ\14t\0251\8t\25\14óy\1\26\13v\25\26\9v\25ýS0'%Î¬M\1#\8\6 ³·~\6p¬ÐC\3‰X\8\9\\ö,«ÝIq‰\18õZãK\14H0îÄTÀ\16§\1\28\24&\12\1\2\8\8 ‡2\27.ùŸ¶\0[*¢\15šU\1\26­\7º#]{C\31\6µà,¤²Ý\18ªëu\4±:èt'}V4\18*3(J.™êz\12Që\0188&¢K\11½?Z:\1\0\0l'''/g'§a'g'¬'''m§§§a'g'¬'''m§'¦a'g'¬'''m§§¦l'''¡'g'Â'''­ç'¥¡'g'Âg''­ç§¥¡'g'Â§''­ç'¤¡çf'ç'''º§'&?'e&0g+§¬g&'ì'''!¦e':&§'Ãg''àçå&­ç§£ì'''!¦e':&§'Ãg''àgä&­ç'¡­çd ­gc¯ì'''­ç'®g''&¡çc'ç'''º'&&0''§m§¦%…§''\4&ØX 'â'¼'''0§%§¦ç%'à'â'&æ%'†'&§¡&e' fb$à¦ã',%''ºf§&‡gÙX0§&§mçe­mçb¬¡'e' gb&à§ã',&''ºg§&mga«m'eªmçâª0§\17§¡çf'ç'''º§\0\1\24\0G\1\23@\28€…\0€\0ÁÀ\2\0\1A\7\0A\7\0¦\1\0\0€\0\0Å\0€\0\1A\3\0AA\7\0Á\3\0æ\1\0\0Ý€\0\0\5\1€\0AÁ\7\0A\7\0ÁA\4\0&\2\0\0\29\0\0E\1€\0\1\8\0ÁA\7\0\1B\8\0f\2\0\0]\0\0…\1€\0Á\8\0\1\2\7\0AÂ\8\0¦\2\0\0\0\0Å\1€\0\1\2\9\0A\2\7\0B\9\0æ\2\0\0Ý\0\0YÀH\3\23@\0€\25€†\23À\0€\6‚I\0AÂ\9\0B\3\0\29B€\1\4\2€\0\24ÀH\3\23\0\1€†‚B\0Â€\0@\2€\5\0\2\0\5\23À\0€†‚B\0Â€\0\0\2€\5@\2\0\5…\2€\0Á\2\
\0\1\3\7\0@\3\0\4¦\3\0\0‚\0\0Å\2€\0\1C\
\0A\3\7\0€\3€\4æ\3\0\0Ý‚\0\0\5\3€\0Aƒ\
\0C\7\0ÁÃ\
\0&\4\0\0\29ƒ\0\0E\3€\0\3\11\0ÁC\7\0\1Ä\
\0f\4\0\0]ƒ\0\0‹ƒ\3\0ŠÃÅŠ\3BŠCFŒŠƒ€–ŠC\1—Šƒ—Šƒ‚„ŠÃ\2†ŠÃ\1˜Š\3\1ˆŠ\3ƒ˜ŠC\3™ŠÃ\0‡Ë\3\0\0ŠÃ\3‰@\0\0\7\25ÀB\0\23À\0€†ƒI\0ÁÃ\12\0\1D\3\0C€\1Ã\2\0À\3\0\0\1Ä\2\0¡\3\1€†\4B\0‡DE\9Ç„Ä\0\11\5\0\0D€\1 Cþ\127\23À\24€„\0\0\0\27\0\0\0\23@\0€€\0\0\0\23\0\0€€\7\0Å\0€\0\1Á\2\0AA\7\0Á\3\0æ\1\0\0Ý€\0\0\5\1€\0AA\3\0A\7\0ÁA\4\0&\2\0\0\29\0\0E\1€\0Á\7\0ÁA\7\0\1B\8\0f\2\0\0]\0\0…\1€\0Á\1\8\0\1\2\7\0AÂ\8\0¦\2\0\0\0\0Å\1€\0\1‚\8\0A\2\7\0B\9\0æ\2\0\0Ý\0\0YÀH\3\23@\0€\25€†\23À\0€\6‚I\0AÂ\9\0B\3\0\29B€\1\4\2€\0\24ÀH\3\23\0\1€†‚B\0Â€\0@\2€\5\0\2\0\5\23À\0€†‚B\0Â€\0\0\2€\5@\2\0\5…\2€\0Á\2\9\0\1\3\7\0@\3\0\4¦\3\0\0‚\0\0Å\2€\0\1\3\
\0A\3\7\0€\3€\4æ\3\0\0Ý‚\0\0\5\3€\0AC\
\0C\7\0ÁÃ\
\0&\4\0\0\29ƒ\0\0E\3€\0ƒ\
\0ÁC\7\0\1Ä\
\0f\4\0\0]ƒ\0\0‹Ã\3\0ŠÃÅŠ\3BŠCFŒŠÃE‹Šƒ€–ŠC\1—Šƒ—Šƒ‚„ŠÃ\2†ŠÃ\1˜Š\3\1ˆŠ\3ƒ˜ŠC\3™ŠÃ\0‡Ë\3€\0\11\4\0\0äC€\0ŠÃ\3‰@\0\0\7¥À\0\0\8€\0š¥\0\1\0\8€€š¥@\1\0\8€\0›¥€\1\0\8€€›¥À\1\0\8€\0œ¥\0\2\0\8€€œ¥@\2\0\8€\0¥€\2\0\8€€¥À\2\0\8€\0ž\31\0€\0\8\7\21 ^ôN\25Ò&ç\20½\\š@Î \31]Õ¯?\29Æ¸mz~iN^Â4x©\4Ÿ5ªl.#\21\9\16I\25Æ\28ÅA©\19×2¦\5÷'¿¼{B\4>yB@[øAlÄ5fb¹¼a\3\0\0\0\0\0\1\3\1\2\8\7!\25\16w\19y\12¥2føJÁcã\14deV[O\"~é-\17¨N`c¬lbZ¤‹y=\0\0\0\4\
\0\0\00031 \1\29\7<;#T\4\13\0\0\0'=:381\0061'!8 T\4\12\0\0\0009! =8\0061'!8 T\4\13\0\0\0&185 1\0061'!8 T\4\7\0\0\0;$ =;:T\4\8\0\0\0;$ =;:'T\4\
\0\0\0;$ =;:\0068 T\4\5\0\0\0 -$1T\4\6\0\0\0 5681T\4\6\0\0\0#=0 <T\4\14\0\0\00031 \0077&11:\7=.1T\3\0\0\0\0\0\0ð?\4\7\0\0\0<1=3< T\3\0\0\0\0\0\0\0@\4\7\0\0\0;?:591T\4\7\0\0\0±èÔ±óßT\4\11\0\0\00075:718:591T\4\7\0\0\0±ÛÂ²âÜT\4\6\0\0\0$531'T\4\6\0\0\0$5=&'T\4\4\0\0\0:!9T\4\7\0\0\0=:'1& T\4\12\0\0\0$531:!9 -$1T\4\8\0\0\0000125!8 T\4\9\0\0\0$531 -$1T\4\6\0\0\0009!8 =T\4\8\0\0\0&1  -$1T\4\6\0\0\0' -81T\4\7\0\0\0:!961&T\4\7\0\0\0' &=:3T\4\13\0\0\0¼ÐÎ²Èø½ÑÙ³éúT\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\4\13\0\0\0!=7;:2=3z05 T\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0^@\4\6\0\0\0001&&;&T\4J\0\0\0\1\29\0261#|}±Óé²Áä³øøc°ìþ±ÛÖ²Áä³ÎÐ\1\29²Ìê³ðî²Âí±ÄÅ±åÊ²Ôó±îÀ¼ûñ¼úê³éú°ìîd·ÔÕe²ÜÂfT\3\0\0\0\0\0\0\28@\3\0\0\0\0\0\0 @\3\0\0\0\0\0\0\"@\4\1\0\0\0T\3\0\0\0\0\0\0$@\4\7\0\0\0 = 81'T\4\7\0\0\0007;:2=3T\4\7\0\0\0;&=1: T\4\6\0\0\0 =91&T\4\8\0\0\000637;8;&T\4\11\0\0\0006 :6?7;8;&T\4&\0\0\0±ðÎ½õá²Ìê³ðî½õá²Áä¼úê³éú±îÀ¼ûñ±ðó°îÚdT\4\8\0\0\0\1\29\0245618T\4\8\0\0\0\1\29\00650=;T\4\7\0\0\0\1\29\0170= T\4\8\0\0\0\1\29\23<17?T\4\8\0\0\0\1\29\23;96;T\4\11\0\0\0\1\29\23;96;\0068 T\4\12\0\0\0\1\29\23;96;\0068 'T\4\8\0\0\0\1\29\0299531T\4\7\0\0\0\1\29\7<;#T\12\0\0\0\13\9\20 §¢B*—S8\13#ó¦,\12v8*\7\1\9\20 ¦Ä\16XÔ<cqRãŒfÄàìj\19,óX@«áY\\©V\\Ž‹Ó3$\12t\0253\8t\25}×R-*ß!{‚ÿ$,\16\13v\25\17\9v\25Ì%DËGW/kŒKåOîW.ÿ¢\3*\4Ó_\5¨ü\127‚;¨kÜŽ¨7\0*\8\6 \11¬d~\9™X\0·ë‰r\0\14\8\8 ,Œÿ,ÄaÂ\0282¯\25W¦ðL;j&Ót\7ì|HÇzV4\18\26\24p!9\127»{!\0\0\0ÁÇ‡Ç‡‡Ç€G\7ÇÚÇÆÆÐÇÁG\6‡ÇGÆÇÅ\6ÆÆÇš€\1\0\1€\2U\1\0\2\25@‚\23\0\4€AA\1\0•\1\0\2ŽA\3Á\1\0a\2€FÂA\0†\2B\0‡Â\0\5]‚\0\1\24\0‚\4\23\0\1€F\2B\0‚A\4‡‚\2\2J‚‚\1\23\0\0€`Áü\127\"€\0\0£\0ù\127\31\0€\0\
\7\21 ¨£CUÉ\127'`\8ˆiiÒ‚ePK\127L\12&Â\14\28_O‹\20\22Ç£;\11\8\16I\25EŸylEÆF?¼RoGJGvlÇ\1ï*˜á\23\127Z½4Ó­S)¢zp\127\1\0\0\0\0\0\2\7!\25v­ð4Î\6p,ÖÝ\9D\9\0\0\0\4\6\0\0\0wfnut\7\4\
\0\0\0`bsRNTohp\7\4\13\0\0\0tni`kbUbtrks\7\4\9\0\0\0tsuTwkns\7\4\2\0\0\0+\7\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0ð?\4\9\0\0\0shirjebu\7\4\3\0\0\0X@\7\0\0\0\0\17pi\23t÷¼g@\4Ý8¯H‡T\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 Ã¦\28x\15¶ÉP0¤õTØ#Æ~\22\8\9\20 ÞÒ%C\19\12t\0258\8t\25\9êE~Þœ\31{L¹ö-•By\20V7*^šÉ}\15\28”åc¢HäJ\13\13v\25\18\9v\25kÝ½2-¬\31,™=tm£ô\6M¬ÆC'bY^P’ùÄ\21A\
5G‚bÏgÓUÛp\0 \8\6 t\28F\9‹–\9Q½ÃL[7Ãb\1šLÓ!ígB0\15ç(\0ôJQbêÂVo\0\0\8\8 ±ô]ó¬œmËVn>ý­”\11‰ï\21\2!Ž˜\28˜w\18\27¥ƒûe~~V4\18\16a¹\24ñ‚œ\19ëà•\24³UÀeIà:M:ôhC\0\0\0x~>~8>>~9þ¾~c~\127\127iþpþ8¿>~þ\127~|¿\127\127~#ÿþ\127~\127þ|8??~ø¿>~¾\127þ\127\127|\127~ãÿþ\127ùÿ?}9ÿÿ\2Á\1\0À\1€\2\1Â\1\0V\1\2\3\1\2\0Õ\1\0\2ÎÁ\3\1‚\1\0¡Á\4€†BB\0‡‚B\5À\2€\2\1Ã\1\0@\3€\4Ã\1\0\22ƒ\3\6‚€\1XÀB\5\23@\2€†BA\0ÆÂ@\0\0\3€\1A\3\1\0Ý‚€\1\13ƒÁ\4Ç\2ƒ\5\13ƒÁ\4\7\3\3\2Š\2ƒ\5 ú\127†AA\0ÆÁ@\0\0\2€\1A\2\1\0Ý€\1ÇÁ\3‡Á\1\3ÇA\2XÀ\1\3\23€\1€†AA\0ÆÁ@\0\0\2€\1A\2\1\0Ý€\1ÇÁ\3ŠÁÂ\3\"€\0\0£€ð\127\31\0€\0\3\7\21 ÞS\21\2\15\5\16I\25\25¥`l‚îŸ\19C¹\9Z¤;j=\1\0\0\0\0\0\8\7!\25z|l[?ˆ=_-\26/\31‰c•[3ÓŽA\23Ý…\14v\29ä\30äÇ,\31\11Š\"|\12\0\0\0\4\6\0\0\0fw\127de\22\4\
\0\0\0qsbC_E~ya\22\4\12\0\0\0{cb\127zDseczb\22\4\9\0\0\0ebdEfz\127b\22\4\2\0\0\0:\22\4\3\0\0\0IQ\22\3\0\0\0\0\0\0ð?\4\2\0\0\0V\22\3\0\0\0\0\0\0\0\0\4\7\0\0\0ebd\127xq\22\4\5\0\0\0p\127xr\22\0\0\0\0\0\16pi\23âuÁ*”y8~\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 v8»~k\13\9\20 \9qÌD\31çJv©¡½\15>ŒÑO\7\12t\0251\8t\25úªb\24<\13v\25\27\9v\25\20°¾~Å¼ç8\12O\9\23\0 \8\6 ”9‘?eBR\26L2\20Â¯ô5ráVt˜4ù4£\12Ò2OòV0Üü6(\0\15\8\8 ðg\2Y«º¹\
2\6Š\2?\3<eð =\27B\22¤AEP–\30Ñ~V4\18¹w\11oÊÄ^t\21ót:[5\27®V–.€6K\6W\0\0\0×Ñ‘Ñ—‘‘Ñ–Q\17ÑÌÑÐÐÆQÂQ—\16‘ÑQÐÑÓ\16ÐÐÑŒPQÐ–\16ÓW\16‘Ñ\17ÐQÓÐSÐÑLPQÐ‘ÐÑÒW\16‘Ñ\17ÐÑÓÐÓÐÑLPQÐV\16Ò\23\16‘ÑÑÓÑ\3A\2\2\0Ý€\1€\1€\3ÁA\2\0\21\2€\2\14BA\4AB\1\0á\1\13€Æ‚B\0\6ÃB\0FÃ@\0€\3€\1Áƒ\1\0]ƒ€\1GCÁ\6\7C\3\6Ý‚\0\1\24€‚\5\23@\
€ÆÂB\0\6Ã@\0@\3€\1ƒ\1\0\29ƒ€\1\7CA\6MCA\5GCƒ\2ÊB\3\6ÍBA\5‡Á\2\3ÆÂ@\0\0\3\0\3Aƒ\1\0Ý‚€\1€\1€\5ÁB\2\0\21\3\0\3\14CA\6AC\1\0áÂ\4€ÆƒB\0\6ÄB\0FÄ@\0€\4€\1Á„\1\0]„€\1GÄÁ\8\7D\4\8Ýƒ\0\1\24€ƒ\7\23\0\2€ÆÃB\0\6Ä@\0@\4€\1„\1\0\29„€\1\7ÄA\8MDA\7GD\4\3ÊC\4\8à‚ú\127àAò\127\"€\0\0£€ë\127\31\0€\0\5\7\21 ®æÅ\127”æ\9\5ùÂ\127lº5Ï\22\20G=qü\16,G›\17i\20\7\16I\25P¬\5b¹|h]ÇÇh:ó¸×\20\8o¿\13£ÄŸb\1\0\0\0\0\0\5\7!\25øÖÁfN\127Ym\3Ðzy7ÚýK\12\0\0\0\4\6\0\0\0\27\
\2\25\24k\4\
\0\0\0\12\14\31>\"8\3\4\28k\4\13\0\0\0\25\14\7\
\31\0149\14\24\30\7\31k\4\9\0\0\0\24\31\0258\27\7\2\31k\4\3\0\0\0++k\3\0\0\0\0\0\0ð?\4\2\0\0\0Gk\3\0\0\0\0\0\0\0@\4\2\0\0\0Hk\3\0\0\0\0\0\0\0\0\4\9\0\0\0\31\4\5\30\6\9\14\25k\4\3\0\0\0004,k\0\0\0\0\19pi\23Fæ\30;\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 NZà{t»dr\1„—6\14rW\26¤¡g\2\26„\22.\11\11\9\20 <Ù±IS;\127?Ð\12t\0255\8t\25Ç62E„Î[\
($bo¶z\30ÿÝ«(¿\13v\25\26\9v\25l-ÕE\6V;b\1-\8\6 Ô\6±\0045\28Õ:ÕÕß2û„¶)\1\1\8\8 µ\17XRŠFq\30L›9+µÁ\"\\ÆG#b-T\\y\15¢\30Ð¬\21c±ë\18<yV4\18}5\2AŸ\0\0\0z<|<¼<<<a¼<=$|ü<+|;¼w<<<vü|½º<}<ü<<<¡<==+<<¼v¼½>ž¼<<\31=ÃCv|}¼»¼ü<ú¼ý<é<¼=%¼¼=+¼=¼ºü}<ý<><:½ý<)=<>ê<½==}><¡|¼=º||<»¼~=ú¼ý<;½ü<û<½=<=¼<¡|¼=+¼\"¼z<|<¼<<<a¼<=$üþ<+<,€E\0\0\1À\0\0Á\0\3\0&\1\0\0]€\0\0…\0€\1Á@\2\0\1Á\2\0AA\3\0¦\1\0\0€\0\0Å\0€\1\1\3\0A\1\3\0Á\3\0æ\1\0\0Ý€\0\0\5\1€\1A\1\4\0\1\3\0ÁA\4\0&\2\0\0\29\0\0E\1€\1\4\0ÁÁ\2\0\1Â\4\0f\2\0\0]\0\0…\1€\1Á\1\5\0\1Â\2\0AB\5\0¦\2\0\0\0\0ËÁ\1\0ÊAA€ÊA\0‹Ê€‹ÊÁ\0ŒÊ\1ŒÊ\1ÊA\24ÀÄ\2\23@\0€Ê\1GÊ\1Ç\6‚Á\0\21\2\0\4\25\0\0\4\23€\1€\6ÂA\0A\2\2\0†‚Á\0•\2\0\5V‚‚\4B\2\0\29B€\1\6B@\0\7‚B\4F‚Á\0G\2€\4€\2€\3\29B€\1\23\0\13€F\0@\0€\0\0\0]€\0\1\24\0Ã\0\23À\11€E\0€\1À\0\0ÁÀ\2\0\1A\3\0f\1\0\0]€\0\0…\0€\1Á@\2\0\1\1\3\0AÁ\3\0¦\1\0\0€\0\0Å\0€\1\1\3\0A\1\3\0A\4\0æ\1\0\0Ý€\0\0\5\1€\1A\1\4\0Á\2\0ÁÁ\4\0&\2\0\0\29\0\0E\1€\1\4\0ÁÁ\2\0\1B\5\0f\2\0\0]\0\0‹Á\1\0ŠAA€Š\1\0‹ŠA€‹Š\0ŒŠÁ€ŒŠA\1Š\1\24ÀD\2\23@\0€Š\1GŠ\1ÇÆA@\0ÇÂ\3\6‚Á\0\7Â@\4@\2\0\3ÝA€\1\31\0€\0\0\7\21 uDý&¹\14´\
\11\11\16I\25˜_@\22€EA=Ž,øU¢‡dxïû»[\
¤~\22\0133Z[)‘!”`ß`o\7zL\4\0\0\0\0\0\1\1\0\2\0\1\11\7!\25É|´\27DÝY\127*µøOK#ü{â’kW|??Ajo—5\13H-zØ\5‡dÌœë\17\29\0\0\0\4\5\0\0\0\127r{n\11\4\6\0\0\0\127jign\11\4\4\0\0\0e~f\11\3\0\0\0\0\0\0ð?\4\6\0\0\0{jbyx\11\4\6\0\0\0Gjing\11\4\6\0\0\0{jlnx\11\4\6\0\0\0nyydy\11\0044\0\0\0ã¤¼î—£í—‚ížƒâª¾íž»îŽí„™îŽ®'î¶˜î‚†^Bí—‹î¯¬âª¾íž»í“¤\11\3\0\0\0\0\0\0\0@\4\7\0\0\0bexny\127\11\4\7\0\0\0e~finy\11\4\7\0\0\0x\127ybel\11\3\0\0\0\0\0\0.@\3\0\0\0\0\0\0\8@\4\5\0\0\0gnm\127\11\3\0\0\0\0\0\0\16@\4\8\0\0\0;';'9>>\11\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0ð¿\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0\0\0\4\5\0\0\0\127ns\127\11\4\5\0\0\0xbqn\11\4\6\0\0\0jgble\11\4\6\0\0\0hdgdy\11\4\7\0\0\0ed|yj{\11\4\6\0\0\0|bo\127c\11\0\0\0\0\0\17pi\23¨‡3z/N×$\14ÙÈQ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 –¡þ;5\"´<wp\4\26­f#\31$ýŽn˜\12\9\20 Öv™\8*msW\"ê8\8~™~v$û7\26\13t\0251\8t\25ó8!Tù\13v\25\30\9v\25r9ä;\"”sNkûY\20Ï“Ði¼†û\0088;nE\1!\8\6 í—¢*bÚÍa¹\1‘Z$ñ\18FÊú\0252Îð@\25ÀJ7l·‚$8\1\14\8\8 Vì5(í¤Øtvo\
\24\3SYG\17¢gcyû³xrV4\18£h'Pð\31“He²\127bÇø\"\8PË\0124Xë 6\7\0©TÂ\4ño{\127\20\5rû\2iÃ\0\0\0ÛÝ\29À\29œ…Ý]Š\29•\29Ö×]Ý\28\27Ü]\0œœŠ\29×\29\28Ÿ?\29¾œbâ×ÝÜ\29\26\29][\29\\H\29œ„\29\29œŠ\29œ\29\27]Ü\\Ÿ›\28\\ˆœŸK\28œœÜŸ\0Ý\29œ\27ÝÝ\26\29ßœ[\29\\š\28]Z\28œœ\29\0Ý\29œ\27]ß\26ÞœZÝ^š\28^\23\28œŠÝ»\29ÛÝ\29À\29œ…]^Š]Ž\29Øœ\28]\\™»œ\0]€\0\0…\0\0\1Á@\2\0\1\1\4\0f\1\0\0€\0\0Å\0€\1\1A\4\0A\1\4\0\4\0æ\1\0\0Ý€\0\0\5\1€\1AÁ\4\0Á\3\0Á\1\5\0&\2\0\0\29\0\0E\1€\1A\5\0ÁÁ\3\0\1‚\5\0f\2\0\0]\0\0…\1€\1ÁÁ\5\0\1\2\4\0A\2\6\0¦\2\0\0\0\0Å\1€\1\1B\6\0AÂ\3\0Â\0\0æ\2\0\0Ý\0\0\11\2\2\0\
B€†\
BA€\
‚\0‡\
Â\0\
‚\
Â\1Ž\
\2Ž\
B\1\24\0E\2\23@\0€\
ÂG\
ÂÇŽ\24\0F\3\23@\0€\
ÂÇ\
ÂGŽF‚Á\0U\2€\4\25\0€\4\23€\1€FÂA\0\2\2\0Æ‚Á\0Õ\2€\5–Â\2\5ÁB\2\0]B€\1FB@\0G‚Â\4†‚Á\0‡\2\0\5À\2\0\4]B€\1FÂB\0G\2Ã\4‡BC\4Ç‚C\4JÂ\2\5\23\0\17€F\0@\0€\0\0\0]€\0\1\24\0Ä\0\23À\15€@\0\0\0…\0\0\1ÁÀ\0\0\1\1\4\0f\1\0\0€\0\0Å\0€\1\1A\2\0A\1\4\0\4\0æ\1\0\0Ý€\0\0\5\1€\1AA\4\0Á\3\0Á\1\5\0&\2\0\0\29\0\0E\1€\1Á\4\0ÁÁ\3\0\1‚\5\0f\2\0\0]\0\0…\1€\1ÁA\5\0\1\2\4\0A\2\6\0¦\2\0\0\0\0Å\1€\1\1Â\5\0AÂ\3\0Â\0\0æ\2\0\0Ý\0\0\11\2\2\0\
B€†\
BA€\
‚\0‡\
Â\0\
‚\
Â\1Ž\
\2Ž\
B\1\24\0E\2\23@\0€\
ÂG\
ÂÇŽ\24\0F\3\23@\0€\
ÂÇ\
ÂGŽFB@\0G‚Â\4†‚Á\0‡Â@\5À\2\0\4]B€\1FÂB\0G\2Ã\4‡BC\4Ç‚C\4JÂ\2\5\31\0€\0\8\7\21 7\6\16\14«6q.3\29âj%ž²8\13\17?\16ì\30sEIÅ~×\11YBº\15´^\9Úüj\12\9\16I\25¹\14º\\_Æ2\19|3Vo0~Ätb\25ŒZÕ½R©yxm0Oæ\26\4\0\0\0\0\0\1\1\0\2\0\1\6\7!\25LâŸ= oycÚ >!\19ÛÂEp:†\0232ŒßW\26Ûk\26 \0\0\0\4\5\0\0\0ìáèý˜\4\6\0\0\0ìùúôý˜\4\4\0\0\0öíõ˜\3\0\0\0\0\0\0ð?\4\6\0\0\0èùñêë˜\4\11\0\0\0Êùüñ÷ßê÷íè˜\4\6\0\0\0èùÿýë˜\4\6\0\0\0ýêê÷ê˜\0044\0\0\0p7/}\0040~\4\17~\13\16q9-~\13(}\30\29~\23\
}\29=´}%\11}\17\21ÍÑ~\4\24}<?q9-~\13(~\0007˜\3\0\0\0\0\0\0\0@\4\7\0\0\0ñöëýêì˜\4\
\0\0\0ÿýìÍÑËð÷ï˜\4\13\0\0\0ëñöÿôýÊýëíôì˜\4\3\0\0\0ñü˜\4\5\0\0\0ôñëì˜\4\7\0\0\0öíõúýê˜\4\7\0\0\0ëìêñöÿ˜\3\0\0\0\0\0\0\8@\4\2\0\0\0¨˜\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0ð¿\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\24@\4\1\0\0\0˜\3\0\0\0\0\0\0\28@\4\7\0\0\0ëýôýûì˜\4\7\0\0\0ñõùÿýë˜\4\6\0\0\0ëûùôý˜\4\6\0\0\0ïñüìð˜\4\7\0\0\0ö÷ïêùè˜\0\0\0\0\0\20pi\23­\11ô\\Ön\3Ä×8aå\17\4k8\13à1÷ô\26L\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20  Ñ™}\20s'Wn\14\9\20 \22“ô;µK\27\16DWƒ\4+Xª2_4\":“\0<\28¦w¥pA\13t\0255\8t\25i){Ù(¯\
^Š¬M\3;áQC0Vi3\12v\25\29\9v\25Aõg,S\30›\26DˆB\"\5~X4U\24Ž;\1,\8\6 ú\21æ7Š ¥\127IÛU\29=’´/ˆ(è\6\1\
\8\8 öI\24k(ú\4³|V4\18ê(Ž507˜\14f¯­\27.€\17:Æ\0\0\0õ³ó³3³³³î3³²«ós³¤ó´3ø³³³ùsó25³ò³s³³³.³²²¤³³3ù32±\0173³³²LÌùóò343s³u3r³f³3²ª33²¤3²35sò³r³±³µ2r³¦²³±e³2²²ò±³.ó3²5óó³43ñ²u3r³´2s³t³2²³²3³.ó3²¤ó›3õ³ó³3³³³î3³²«sq³¤s§3ö³³²2s³³r³°³•²³³î3³³6³³²ró±³²²°³Õ²³³.3\0\0Å\0\0\1\1A\3\0A\1\3\0¦\1\0\0Ý€\0\0\5\1€\1A\3\0Á\2\0ÁÁ\3\0&\2\0\0\29\0\0E\1€\1\1\4\0Á\1\3\0\1B\4\0f\2\0\0]\0\0…\1€\1Á\4\0\1\2\3\0AÂ\4\0¦\2\0\0\0\0Å\1€\1\1\2\5\0A\2\3\0B\5\0æ\2\0\0Ý\0\0\5\2€\1A‚\5\0Â\2\0ÁÂ\5\0&\3\0\0\29‚\0\0E\2€\1\2\6\0ÁÂ\2\0\1C\6\0f\3\0\0]‚\0\0‹‚\2\0ŠB\0ŠBA€Š‚€ŠÂ\0ŽŠÂŽŠ\2\1ŠBŠ‚\1ŠB‚Š\2\2‘\24ÀE\4\23@\0€ŠÂÈŠÂH‘Æ‚Á\0Õ\2€\5\25\0€\5\23€\1€ÆÂA\0\1\3\2\0FƒÁ\0U\3€\6\22C\3\6AC\2\0ÝB€\1ÆB@\0Ç‚Â\5\6ƒÁ\0\7\3\0\6@\3\0\5ÝB€\1\23\0\18€F\0@\0€\0\0\0]€\0\1\24\0Ã\0\23À\16€@\0\0\0…\0\0\1ÁÀ\0\0\1\1\3\0f\1\0\0€\0\0Å\0\0\1\1A\2\0A\1\3\0¦\1\0\0Ý€\0\0\5\1€\1AA\3\0Á\2\0ÁÁ\3\0&\2\0\0\29\0\0E\1€\1\3\0Á\1\3\0\1B\4\0f\2\0\0]\0\0…\1€\1Á\1\4\0\1\2\3\0AÂ\4\0¦\2\0\0\0\0Å\1€\1\1‚\4\0A\2\3\0B\5\0æ\2\0\0Ý\0\0\5\2€\1A\2\5\0Â\2\0ÁÂ\5\0&\3\0\0\29‚\0\0E\2€\1‚\5\0ÁÂ\2\0\1C\6\0f\3\0\0]‚\0\0‹‚\2\0ŠB\0ŠBA€Š‚€ŠÂ\0ŽŠÂŽŠ\2\1ŠBŠ‚\1ŠB‚Š\2\2‘\24ÀE\4\23@\0€ŠÂÈŠÂH‘ÆB@\0Ç‚Â\5\6ƒÁ\0\7Ã@\6@\3\0\5ÝB€\1\31\0€\0\4\7\21 ÅãÏUÂ€MV\1\7è1ç“™LRêvQÚ/—<\14\7\16I\25U%X#\30`í%3aím–\26ÀOq~ˆ@wé/\16\4\0\0\0\0\0\1\1\0\2\0\1\6\7!\25Æ–\22|âM \20–®þ;Q·»{+)v1Ó@³kÙß£\2$\0\0\0\4\5\0\0\0\26\23\30\11n\4\6\0\0\0\26\15\12\2\11n\4\4\0\0\0\0\27\3n\3\0\0\0\0\0\0ð?\4\6\0\0\0\30\15\7\28\29n\4\5\0\0\0+\
\7\26n\4\6\0\0\0\30\15\9\11\29n\4\6\0\0\0\11\28\28\1\28n\0044\0\0\0†ÁÙ‹òÆˆòçˆûæ‡ÏÛˆûÞ‹èëˆáü‹ëËB‹Óý‹çã;'ˆòî‹ÊÉ‡ÏÛˆûÞˆöÁn\3\0\0\0\0\0\0\0@\4\7\0\0\0\7\0\29\11\28\26n\4\7\0\0\0\0\27\3\12\11\28n\4\7\0\0\0\29\26\28\7\0\9n\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0.@\3\0\0\0\0\0\0\20@\4\5\0\0\0\2\11\8\26n\3\0\0\0\0\0\0\24@\4\8\0\0\0^B^B\\[[n\3\0\0\0\0\0\0\28@\4\8\0\0\0\
\11\8\15\27\2\26n\3\0\0\0\0\0\0 @\3\0\0\0\0\0\0ð¿\3\0\0\0\0\0\0\"@\3\0\0\0\0\0\0\0\0\4\3\0\0\0\7\
n\4\7\0\0\0\30\28\1\3\30\26n\4\5\0\0\0\26\11\22\26n\4\7\0\0\0\5\12\26\23\30\11n\4\5\0\0\0\29\7\20\11n\4\6\0\0\0\15\2\7\9\0n\4\6\0\0\0\13\1\2\1\28n\4\7\0\0\0\0\1\25\28\15\30n\4\6\0\0\0\25\7\
\26\6n\0\0\0\0\0\23pi\23ÊŠËV\1Ú%\7Iþ•\127{î]bì\2´<\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 q¡5'\0110\28·\12\9\20 Ó‰—a¸6Ü\27KH×r‚“±\5\19Ø!õ\13t\0259\8t\25Y”ÐoÞ\5„'‹sÿ\0263ÉmElSÅ\21¼Žnw…õfeÔÖ¦\20ÂfŠaj\12v\25\27\9v\25ì\11é\2$Ö\2$èŸ(\23\1!\8\6 ÷Ìè'žAÌXb\16\8xñüÉ\28Næ$:íè\30U\31d¢j¿‡µo\1\
\8\8 FÙ~)ÚJ\14OŸ}V4\18%“åAk\17˜X\173g°ÔïUÄ¥hH\3\1\0\0ÙŸßŸ\31ŸŸŸÂ\31Ÿž‡ß_ŸˆŸ‘\31ÔŸŸŸÕ_ß\30\25ŸÞŸ_ŸŸŸ\2ŸžžˆŸŸ\31Õ\31\30=\31ŸŸ¼ž`àÕßÞ\31\25\31ÞŸX_^ŸžžŸ\2\31\31ž\
ŸŸžY\31ÞŸ˜Þ]ŸÞžŸB\31\31žJŸ\31žÇ_Ÿžˆ_Ÿ\31\25\31ÝŸ^_ŸžžœŸ\2ß\31ž\25ßÜŸ\24\31ÜžX_^Ÿ˜Þ]Ÿ\21Ÿ\30ž\25\31ÞŸX_^ŸžžŸ\2\31\31ž\24_ßžÕ\31\31\28\24\31_ŸY_\\ŸJŸ\31ž†\31\31žˆ\31ž\31\25\31ÝŸ^Ÿ›Ÿ™^\\ŸŠžŸIŸ\30žžžœŸ\2ß\31ž\25ßßŸ\24ßÛžY_\\Ÿ˜\30_ŸXŸ\30žŸž\31Ÿ\2ß\31žˆ_¯\31ÙŸßŸ\31ŸŸŸÂ\31Ÿ\1\24€Ä\0\23\0\25€E\0\0\1À\0\0ÁÀ\4\0&\1\0\0]€\0\0…\0\0\1Á\0\3\0\1Á\4\0f\1\0\0€\0\0Å\0€\1\1\1\5\0AÁ\4\0A\5\0æ\1\0\0Ý€\0\0\5\1€\1A\5\0\4\0ÁÁ\5\0&\2\0\0\29\0\0E\1€\1\1\6\0Á\4\0\1B\6\0f\2\0\0]\0\0…\1€\1Á\6\0\1Â\4\0AÂ\6\0¦\2\0\0\0\0Å\1€\1\1\2\7\0A‚\4\0Â\0\0æ\2\0\0Ý\0\0\6‚A\0@\2€\0\2\2\0\29‚€\1\21\2\0\4F‚A\0€\2\0\1Á\2\2\0]‚€\1U\2€\4X@\2\4\23À\0€\6‚B\0AÂ\2\0\2\3\0\29B€\1\11\2\2\0F‚A\0€\2€\0Á\2\2\0]‚€\1GÂÀ\4\
B‚ƒ\
BA€\
‚€„\
Â€Ž\
‚\1\
Â\
\2\1\
B\24ÀE\2\23@\0€\
‚È\
‚HFÂH\0\24ÀÆ\4\23@\0€\
‚H\
‚ÈFÂÃ\0U\2€\4\25\0€\4\23€\1€F‚B\0\2\4\0ÆÂÃ\0Õ\2€\5–Â\2\5Á\2\3\0]B€\1FB@\0GBÄ\4†ÂÃ\0‡\2\0\5À\2\0\4]B€\1FBC\0G‚Ã\4‡BB\4J‚‚\0\23@\22€F\0@\0€\0\0\0]€\0\1\24ÀÄ\0\23\0\21€@\0\0\0…\0\0\1ÁÀ\0\0\1Á\4\0f\1\0\0€\0\0Å\0€\1\1\1\3\0AÁ\4\0A\5\0æ\1\0\0Ý€\0\0\5\1€\1A\1\5\0\4\0ÁÁ\5\0&\2\0\0\29\0\0E\1€\1\5\0Á\4\0\1B\6\0f\2\0\0]\0\0…\1€\1Á\1\6\0\1Â\4\0AÂ\6\0¦\2\0\0\0\0Å\1€\1\1‚\6\0A‚\4\0Â\0\0æ\2\0\0Ý\0\0\6‚A\0@\2€\0\2\2\0\29‚€\1\21\2\0\4F‚A\0€\2\0\1Á\2\2\0]‚€\1U\2€\4X@\2\4\23À\0€\6‚B\0AÂ\2\0\2\3\0\29B€\1\11\2\2\0F‚A\0€\2€\0Á\2\2\0]‚€\1GÂÀ\4\
B‚ƒ\
BA€\
‚€„\
Â€Ž\
‚\1\
Â\
\2\1\
B\24ÀE\2\23@\0€\
‚È\
‚HFÂH\0\24ÀÆ\4\23@\0€\
‚H\
‚ÈFB@\0GBÄ\4†ÂÃ\0‡Â@\5À\2\0\4]B€\1FBC\0G‚Ã\4‡BB\4J‚‚\0\31\0€\0\6\7\21 ;Hïp÷nÖ\13\\ö|$÷Ö]h\12\3\16I\0250Í#9¹=èI\4\0\0\0\0\0\1\1\0\2\0\1\7\7!\25\28Ù\12<Ý\19ëmYâ67Xyæ~ÕàÓ\21ø#\3\16$\0\0\0\4\5\0\0\0ÃÎÇÒ·\4\6\0\0\0ÃÖÕÛÒ·\4\4\0\0\0ÙÂÚ·\3\0\0\0\0\0\0ð?\4\6\0\0\0ÇÖÞÅÄ·\4\14\0\0\0ôßÒÔÜõØÏðÅØÂÇ·\4\9\0\0\0ÄÃÅäÇÛÞÃ·\4\3\0\0\0ÞÓ·\4\2\0\0\0›·\4\5\0\0\0ÛÞÄÃ·\4\6\0\0\0ÒÅÅØÅ·\4<\0\0\0”R8/^08^#._\24\24½_\24\0P\22\25_\25\19R\19-^7>Q\0221P-3R8/^08S\0159^7>^\22\14^08P,\15R';·\3\0\0\0\0\0\0\0@\4\
\0\0\0ÐÒÃâþäßØÀ·\4\12\0\0\0ÚÂÃÞÛåÒÄÂÛÃ·\4\6\0\0\0ÇÖÐÒÄ·\0044\0\0\0_\24\0R+\31Q+>Q\"?^\22\2Q\"\7R12Q8%R2\18›R\
$R>:âþQ+7R\19\16^\22\2Q\"\7Q/\24·\4\7\0\0\0ÞÙÄÒÅÃ·\4\7\0\0\0ÙÂÚÕÒÅ·\4\7\0\0\0ÄÃÅÞÙÐ·\3\0\0\0\0\0\0\8@\4\2\0\0\0‡·\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0ð¿\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0\24@\4\1\0\0\0·\3\0\0\0\0\0\0\28@\4\7\0\0\0ÄÒÛÒÔÃ·\4\7\0\0\0ÞÚÖÐÒÄ·\4\6\0\0\0ÄÔÖÛÒ·\4\6\0\0\0ÀÞÓÃß·\4\7\0\0\0ÙØÀÅÖÇ·\0\4\6\0\0\0ÛÞÄÃ…·\0\0\0\0\23pi\23ÆÝ2F\
(J¨r\13LåA@\29\5’Ý9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20 š›F>é£\22!\0097«<\01891y\5eú%\20Ù\3\26\31\4h\8¯;Nc]\127E;Ô\15\9\20 †ž7)„ç†\
©G«\11CwÕL\26§œ$E€ÿ%Ï\13t\0256\8t\25Ü\20”4#å\0117Ï—.Ý¯ð?r££|‡ˆÊ6Þ\12v\25\30\9v\25&\31Æ_çJ\27\15t$\0H×\9þRì\31´Ub\3¶O\1,\8\6 ÕÃÊvk:a\12„Þu\
Ú(Å\28\127\19e&\1\13\8\8 ‰d\19\0Ü’ªa,e.\12ƒ+v\5b1â\
È}V4\18¥¨·WËóQ;ró 7í];\22§\8æoŸ\0\0\0ŽÈˆÈHÈÈÈ•HÈÉÐˆ\8ÈßHÀHƒÈÈÈ‚\8ˆINÈ‰È\8ÈÈÈUÈÉÉßÈÈH‚HIÊjHÈÈëÉ7·‚ˆ‰HOH\8È\14H\9È\29ÈHÉÑHHÉßHÉHN\8‰È\9ÈÊÈÎI\9ÈÝÉÈÊ\30ÈIÉÉ‰ÊÈUˆHÉNˆˆÈOHŠÉ\14H\9ÈÏI\8È\15ÈIÉÈÉHÈUˆHÉN\8ŠÈOÈ‹É\15ˆ\11ÈÏI\11ÈBÈIÉßˆÕ€F\0@\0€\0\0\0]€\0\1\24ÀÃ\0\23@\15€E\0\0\1À\0\0Á\0\4\0&\1\0\0]€\0\0…\0\0\1Á@\2\0\1\1\4\0f\1\0\0€\0\0Å\0€\1\1A\4\0A\1\4\0\4\0æ\1\0\0Ý€\0\0\5\1€\1AÁ\4\0Á\3\0Á\1\5\0&\2\0\0\29\0\0E\1€\1A\5\0ÁÁ\3\0\1‚\5\0f\2\0\0]\0\0‹\1\0ŠA€†ŠAA€Š\0‡ŠÁ€‹ŠA\1ŒŠ\1Œ\24\0E\2\23@\0€ŠFŒŠÆŒÆÁ\0Õ\1€\3\25\0€\3\23€\1€ÆÁA\0\1\2\2\0F‚Á\0U\2€\4\22B\2\4AB\2\0ÝA€\1ÆA@\0ÇÂ\3\6‚Á\0\7\2\0\4@\2\0\3ÝA€\1ÆÁB\0Ç\1Ã\3\7BC\3G‚C\3ÊA\2\4\23€\12€F\0@\0€\0\0\0]€\0\1\24\0Ä\0\23@\11€@\0\0\0…\0\0\1ÁÀ\0\0\1\1\4\0f\1\0\0€\0\0Å\0€\1\1A\2\0A\1\4\0\4\0æ\1\0\0Ý€\0\0\5\1€\1AA\4\0Á\3\0Á\1\5\0&\2\0\0\29\0\0E\1€\1Á\4\0ÁÁ\3\0\1‚\5\0f\2\0\0]\0\0‹\1\0ŠA€†ŠAA€Š\0‡ŠÁ€‹ŠA\1ŒŠ\1Œ\24\0E\2\23@\0€ŠFŒŠÆŒÆA@\0ÇÂ\3\6‚Á\0\7Â@\4@\2\0\3ÝA€\1ÆÁB\0Ç\1Ã\3\7BC\3G‚C\3ÊA\2\4\31\0€\0\6\7\21 $-ÓD„¸Ö/\7'ª?¬µ{\
\11\16I\25-Fp\31“\0¹\
\25W]q\5Pnr\127 m`|Z\19Awõ²\3Tä7Wç”tMûÓ(\14\4\0\0\0\0\0\1\1\0\2\0\1\5\7!\25g¨ÙsŸ¶\6!¸q\16tC;„U\27\0\0\0\4\5\0\0\0 ­¤±Ô\4\6\0\0\0 µ¶¸±Ô\4\4\0\0\0º¡¹Ô\3\0\0\0\0\0\0ð?\4\6\0\0\0¤µ½¦§Ô\4\9\0\0\0—»¹¶»–»¬Ô\4\6\0\0\0¤µ³±§Ô\4\6\0\0\0±¦¦»¦Ô\0044\0\0\0<{c1H|2H]2A\\=ua2Ad1RQ2[F1Qqø1iG1]Y2HT1ps=ua2Ad2L{Ô\3\0\0\0\0\0\0\0@\4\7\0\0\0½º§±¦ Ô\4\
\0\0\0³± ‡¼»£Ô\4\13\0\0\0§½º³¸±†±§¡¸ Ô\4\3\0\0\0½°Ô\4\5\0\0\0¸½§ Ô\4\7\0\0\0º¡¹¶±¦Ô\4\7\0\0\0§ ¦½º³Ô\3\0\0\0\0\0\0\8@\4\2\0\0\0äÔ\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0ð¿\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\4\7\0\0\0§±¸±· Ô\4\7\0\0\0º»£¦µ¤Ô\4\6\0\0\0£½° ¼Ô\0\0\0\0\0\22pi\23;†y¦lf`|hêCh\16¨\
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 ÐkŸI\29[¿I [C\4†\15\9\20 (±4rzP‚\18t\15ÿ?¤¿•\16MœiS¡ïùCx\14t\0252\8t\25£Š\25Q}scb\24\15v\25\26\9v\25ÏÞd`Ç¥zF\1*\8\6 %2.uûçë\14´à\11\30\1\13\8\8 ®/$~š¡A?de\3{!¢Úy©j\\\\:~V4\18uCm\23’wS\127_ø}\31“ž,a²Ò–\3v¸Ä\8ä\0\0\0|:z:º:::gº:;\"zú:-ú0ºq:::púz»¼:{:ú:::§:;;-::ºpº»8˜º::\25;ÅEpz{º¼º{:½ú{;ü:x:={ø:{»8:½ûø:,»;8°:»;¼zy:ý:ù:;»9:§ºº;½úz;pº:¼½ºú:üúù:ï:º;#ºº;-º;º¼:~:ûz>:<ûù:/;:8ì:»;;»>:§zº;¼zz:½ú~;üúù:=»ú:ý:»;:;º:§zº;-z\22º|:z:º:::gº:;\":ÿ:-ú,º\127::;»ú::ûz?:&\1\0\0]€\0\0…\0\0\1Á€\4\0\1A\5\0f\1\0\0€\0\0Å\0\0\1\1\5\0AA\5\0¦\1\0\0Ý€\0\0\5\1\0\1AÁ\5\0A\5\0æ\1\0\0\29\0\0E\1€\1\1\6\0ÁA\5\0\1B\6\0f\2\0\0]\0\0…\1€\1Á\6\0\1\2\5\0AÂ\6\0¦\2\0\0\0\0Å\1€\1\1\2\7\0A\2\5\0B\7\0æ\2\0\0Ý\0\0\6BC\0@\2€\0‚\3\0\29‚€\1\21\2\0\4X€D\4\23À\0€\6\2D\0A‚\7\0‚\4\0\29B€\1\11\2\2\0FBC\0€\2€\0Á‚\3\0]‚€\1GÂÀ\4\
B\2†\
BA€\
‚€„\
\2\
Â\1\
B\
Â€…\
‚\1‘\24ÀF\3\23@\0€\
ÂH\
ÂH‘FÂÃ\0U\2€\4\25\0€\4\23€\1€F\2D\0B\4\0ÆÂÃ\0Õ\2€\5–Â\2\5Á‚\4\0]B€\1FB@\0GÂÄ\4†ÂÃ\0‡\2\0\5À\2\0\4]B€\1F‚A\0GÂÁ\4‡BB\4Á‚\2\0\7ÃB\4–\2\3\5J‚‚\0\23\0\20€F\0@\0€\0\0\0]€\0\1\24@Å\0\23À\18€@\0\0\0…\0\0\1ÁÀ\0\0\1A\5\0f\1\0\0€\0\0Å\0\0\1\1\4\0AA\5\0¦\1\0\0Ý€\0\0\5\1\0\1A\5\0A\5\0æ\1\0\0\29\0\0E\1€\1Á\5\0ÁA\5\0\1B\6\0f\2\0\0]\0\0…\1€\1Á\1\6\0\1\2\5\0AÂ\6\0¦\2\0\0\0\0Å\1€\1\1‚\6\0A\2\5\0B\7\0æ\2\0\0Ý\0\0\6BC\0@\2€\0‚\3\0\29‚€\1\21\2\0\4X€D\4\23À\0€\6\2D\0A‚\7\0‚\4\0\29B€\1\11\2\2\0FBC\0€\2€\0Á‚\3\0]‚€\1GÂÀ\4\
B\2†\
BA€\
‚€„\
\2\
Â\1\
B\
Â€…\
‚\1‘\24ÀF\3\23@\0€\
ÂH\
ÂH‘FB@\0GÂÄ\4†ÂÃ\0‡Â@\5À\2\0\4]B€\1F‚A\0GÂÁ\4‡BB\4Á‚\2\0\7ÃB\4–\2\3\5J‚‚\0\31\0€\0\11\7\21 ÚƒËuð\8G\27¸—Z\14~Ca\6=¥°nY‡TR×„v\4à/Ê?Öú·4\13\0\16I\25¯\14/ \4\0\0\0\0\0\1\1\0\2\0\1\6\7!\25 Ô­PÔ@]\21™ˆ\30\
Ô´¹n¹TK`G¸B\8nVû-$\0\0\0\4\5\0\0\0òÿöã†\4\6\0\0\0òçäêã†\4\4\0\0\0èóë†\3\0\0\0\0\0\0ð?\4\6\0\0\0öçïôõ†\4\9\0\0\0ÅéëäéÄéþ†\4\
\0\0\0áãòÓÏÕîéñ†\4\13\0\0\0ôãêçòãÔãõóêò†\4\5\0\0\0èçëã†\4\5\0\0\0êïõò†\4\3\0\0\0ÆÆ†\4\5\0\0\0âçòç†\4\3\0\0\0ïâ†\4\9\0\0\0õòôÕöêïò†\4\2\0\0\0ª†\4\6\0\0\0öçáãõ†\4\6\0\0\0ãôôéô†\0044\0\0\0n)1c\26.`\26\15`\19\14o'3`\0196c\0\3`\9\20c\3#ªc;\21c\15\11ÓÏ`\26\6c\"!o'3`\0196`\30)†\3\0\0\0\0\0\0\0@\4\7\0\0\0ïèõãôò†\4\7\0\0\0èóëäãô†\4\7\0\0\0õòôïèá†\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\4\2\0\0\0¶†\3\0\0\0\0\0\0\24@\3\0\0\0\0\0\0ð¿\3\0\0\0\0\0\0\28@\3\0\0\0\0\0\0\0\0\4X\0\0\0¥c\9\30o\1\9o\18\31n))Œn)1a'(n(\"n\7\18c\12.`'\0`\26\15b>\"b>,c\9\30o\1\9ªc\9 c\"\16b>\6b>,c\9\30o\1\9b><c\0035n\7\18`'\0a\28\2c\9\30o\1\9†\4\7\0\0\0õéóôåã†\4\7\0\0\0èéñôçö†\4\7\0\0\0õãêãåò†\4\6\0\0\0ñïâòî†\0\0\0\0\0\24pi\23iZ\29\2\23ÁW\
û‡º}øæûW\4Å!ÿ\13}Xßyw £ñ\2?Ò¤\0Î—>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 \28uÐmå:xwÖÕévþÉýy0\12\9\20 wwÚ5ùPÒ\25.àÏ|”t\27\17gÓÁ\16O\14t\0251\8t\25†oødQ\15v\25\26\9v\25ÿ´T0—\0305b\1#\8\6 Æ¸kh§©\19\2pÁBRÀ\\P\0ý„G7«¿T\
OXÙn+VÇL0Ü\31vØ€ù;\1\
\8\8 XÙ¥u\23€¨&»pV4\18üº \30…¤\14\16s\24t]a'$y7\30ñ\20êN\19Zxö\18fþÀ\17\0\0\0ý»û»;»»»æ;»º£û{»¬û¼;ð»»»ñ{û:=»ú»{»»»&»ºº¬»»;ñ;:¹\25;»»˜ºDÄñûú;<;{»};z»n»;º¢;;º¬;º;={ú»z»¹»½:z»®º»¹m»:ººú¹»&û;º=ûû»<;ùº};z»¼:{»|»:º»º;»&û;º¬{¡;ý»û»€\0\0\0]€\0\1\24ÀÂ\0\23\0\14€E\0\0\1À\0\0Á\0\3\0&\1\0\0]€\0\0…\0\0\1Á@\2\0\1\1\3\0f\1\0\0€\0\0Å\0€\1\1A\3\0A\1\3\0\3\0æ\1\0\0Ý€\0\0\5\1€\1AÁ\3\0Á\2\0Á\1\4\0&\2\0\0\29\0\0E\1€\1A\4\0ÁÁ\2\0\1‚\4\0f\2\0\0]\0\0‹\1\0ŠA€‰ŠAA€Š\0ŠŠÁ€ŠŠA\1‹Š\1‹\24\0D\2\23@\0€Š\1F‹Š\1Æ‹ÆÁ\0Õ\1€\3\25\0€\3\23€\1€ÆÁA\0\1\2\2\0F‚Á\0U\2€\4\22B\2\4AB\2\0ÝA€\1ÆA@\0ÇÂ\3\6‚Á\0\7\2\0\4@\2\0\3ÝA€\1\23@\11€F\0@\0€\0\0\0]€\0\1\24\0Ã\0\23\0\
€@\0\0\0…\0\0\1ÁÀ\0\0\1\1\3\0f\1\0\0€\0\0Å\0€\1\1A\2\0A\1\3\0\3\0æ\1\0\0Ý€\0\0\5\1€\1AA\3\0Á\2\0Á\1\4\0&\2\0\0\29\0\0E\1€\1Á\3\0ÁÁ\2\0\1‚\4\0f\2\0\0]\0\0‹\1\0ŠA€‰ŠAA€Š\0ŠŠÁ€ŠŠA\1‹Š\1‹\24\0D\2\23@\0€Š\1F‹Š\1Æ‹ÆA@\0ÇÂ\3\6‚Á\0\7Â@\4@\2\0\3ÝA€\1\31\0€\0\1\7\21 ÁK¸#R‰ü\6\4tb\9\
\0\16I\25Q>Q7\4\0\0\0\0\0\1\1\0\2\0\1\11\7!\25)f„\4\23÷¼\31B<«mš'ÇV×S\13 @Áò$Eç\27a&¬æ\14k\23ºquÃ;W\25\0\0\0\4\5\0\0\0DI@U0\4\6\0\0\0DQR\\U0\4\4\0\0\0^E]0\3\0\0\0\0\0\0ð?\4\6\0\0\0@QYBC0\4\9\0\0\0s_]R_r_H0\4\6\0\0\0@QWUC0\4\6\0\0\0UBB_B0\0044\0\0\0ØŸ‡Õ¬˜Ö¬¹Ö¥¸Ù‘…Ö¥€Õ¶µÖ¿¢Õµ•\28Õ£Õ¹½eyÖ¬°Õ”—Ù‘…Ö¥€Ö¨Ÿ0\3\0\0\0\0\0\0\0@\4\7\0\0\0Y^CUBD0\4\7\0\0\0^E]RUB0\4\7\0\0\0CDBY^W0\3\0\0\0\0\0\0\8@\4\2\0\0\0\0000\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0ð¿\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\4\3\0\0\0YT0\4\11\0\0\0TQDQc_EBSU0\4\7\0\0\0CU\\USD0\4\7\0\0\0^_GBQ@0\4\6\0\0\0GYTDX0\0\0\0\0\0\26pi\23„=ÊHÍœáL\22­ˆq3\12ïaBëW0\18h©\15¸°ýqµ\3Ì\13\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 | ;9NïCwÍš5Ê(!7-üÅ0û|\24Á\27›FØ3\8C«\13\9\20 \4C¥\
¿Z˜TÖ˜9XÄ\11\20c†\14t\0259\8t\0250\17\28<G(e\0188=Îk³*Â;.R¦1\23\18\6\24Ö\
\27G7…0qÈ\21ÚE˜\15v\25\29\9v\25ŒÊqjˆî«aÎÝÿ\29¿Ñ\24„lªD\1,\8\6 ;ò¼QÒ[î;\127}ç\2\5\27Þ\8\0X´l\1\1\8\8 Æ6yOØ‹¼/½|?+J~y*ÝÎa:|××\127 \23³\2¡Úu\29\15Ÿ•\"†yV4\18GÜc\14’\0\0\0À†Æ†\6†††Û\6†‡žÆF†‘Æ\6Í†††ÌFÆ\7\0†Ç†F†††\27†‡‡‘††\6Ì\6\7„$\6††¥‡yùÌÆÇ\6\1\6F†@\6G†S†\6‡Ÿ\6\6‡‘\6‡\6\0FÇ†G†„†€\7G†“‡†„P†\7‡‡Ç„†\27Æ\6‡\0ÆÆ†\1\6Ä‡@\6G†\7F†A†\7‡†‡\6†\27Æ\6‡‘Æ\6À†Æ†\6†\0\0]€\0\1\24ÀÂ\0\23@\14€E\0\0\1À\0\0Á\0\3\0&\1\0\0]€\0\0…\0€\1Á@\2\0\1\1\3\0AA\3\0¦\1\0\0€\0\0Å\0€\1\1\3\0AÁ\2\0Á\0\0æ\1\0\0Ý€\0\0\5\1€\1AÁ\3\0Á\2\0Á\1\4\0&\2\0\0\29\0\0E\1€\1A\4\0ÁÁ\2\0\1‚\4\0f\2\0\0]\0\0‹\1\0ŠAA€ŠA€‰Š\0ŠŠÁ€ŠŠA\1‹Š\1‹\24\0D\2\23@\0€Š\1F‹Š\1Æ‹ÆÁ\0Õ\1€\3\25\0€\3\23€\1€ÆÁA\0\1\2\2\0F‚Á\0U\2€\4\22B\2\4AB\2\0ÝA€\1ÆA@\0ÇÂ\3\6‚Á\0\7\2\0\4@\2\0\3ÝA€\1\23€\11€F\0@\0€\0\0\0]€\0\1\24\0Ã\0\23@\
€@\0\0\0…\0€\1ÁÀ\0\0\1\1\3\0AA\3\0¦\1\0\0€\0\0Å\0€\1\1A\2\0AÁ\2\0Á\0\0æ\1\0\0Ý€\0\0\5\1€\1A\3\0Á\2\0Á\1\4\0&\2\0\0\29\0\0E\1€\1Á\3\0ÁÁ\2\0\1‚\4\0f\2\0\0]\0\0‹\1\0ŠAA€ŠA€‰Š\0ŠŠÁ€ŠŠA\1‹Š\1‹\24\0D\2\23@\0€Š\1F‹Š\1Æ‹ÆA@\0ÇÂ\3\6‚Á\0\7Â@\4@\2\0\3ÝA€\1\31\0€\0\6\7\21 \22Ua_îi&Ú]¬ANÚ±R\
\11\16I\25bƒ\22!Ú¤#=°òïM1a\22?™v¥U4_š\18ã@c\12Ôhb'\6»ˆNb¾J\15\4\0\0\0\0\0\1\1\0\2\0\1\7\7!\25\6\19=;Ü½®*Ÿº¹\127ßžùjš:îUé83*\25\0\0\0\4\5\0\0\0ßÒÛÎ«\4\6\0\0\0ßÊÉÇÎ«\4\4\0\0\0ÅÞÆ«\3\0\0\0\0\0\0ð?\4\6\0\0\0ÛÊÂÙØ«\4\6\0\0\0âÆÊÌÎ«\4\6\0\0\0ÛÊÌÎØ«\4\6\0\0\0ÎÙÙÄÙ«\0044\0\0\0C\4\28N7\3M7\"M>#B\
\30M>\27N-.M$9N.\14‡N\0228N\"&þâM7+N\15\12B\
\30M>\27M3\4«\3\0\0\0\0\0\0\0@\4\7\0\0\0ÂÅØÎÙß«\4\7\0\0\0ÅÞÆÉÎÙ«\4\7\0\0\0ØßÙÂÅÌ«\4\7\0\0\0ÈÎÅßÎÙ«\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0ð¿\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\0\0\4\4\0\0\0ØÙÈ«\4\6\0\0\0ÊÇÂÌÅ«\4\6\0\0\0ØÈÊÇÎ«\4\7\0\0\0ÅÄÜÙÊÛ«\4\6\0\0\0ÜÂÏßÃ«\0\0\0\0\0\19pi\23\22\18ÆU\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 ‹+\22\15@×4\8\12&\13§Ô‡\21ê\14\9\20 \17`ÿ_,\16a&põbbE“1EÊÙ5ðË“=‘Úž8þ\14t\0251\8t\25à”…v¯\15v\25\31\9v\25%ï\11\19¶N\15eHL'‹÷9!ŒUS\11Ô\24\11T¡çýv\0#\8\6 \
ÌE\17\27×½{k›€0‚¯¦bG!â ZÁ‹cw‘\4|ÒLø/š˜Àk„·“\9\1\11\8\8 \18‚Íg\"‘ð\28‹\127%…yV4\18íÆ\18W/\0\0\0Ã…Å…\4Å……Ø\5…„\2\5E…BEÅ„€„\5…X\5…„„……Ã„Ä…\3\4Ä…E„\5„\24D…\1JÁ‚\0\1\0\3\24ÀA\2\23€\5€F\1B\0†\1A\0‡AA\3]\1\1\1\23@\0€†BB\0ŠB\2\4b\0\0ãÁþ\127F\1A\0GÂ\2]A€\0F\1A\0GÁÂ\2]A€\0F\1A\0G\1Ã\2]A€\0\24@C\0\23@\2€AÁ\1\0_\1\0\1\23€\1€\24@C\0\23€\0€AA\3\0_\1\0\1\23@\0€FC\0]A€\0\31\0€\0\8\7\21 8Íy=~¡±\15þc™8\25bÿ3\6ÁjU#S¥KÏ°\14\25–\9·|®Jßl[\6b$\11\4\16I\25P2Ýc©VsVtî\7bk\9›_\20òó\6\2\0\0\0\0\0\1\1\0\7!\25²*}\0\15\0\0\0\4\8\0\0\0˜›Ÿƒ˜ê\4\3\0\0\0™ê\4\5\0\0\0€™…„ê\4\7\0\0\0„‰…Žê\4\
\0\0\0ž¿£¹‚…ê\4\7\0\0\0œ‹†Ÿ™ê\4\7\0\0\0™‚…¿£ê\3\0\0\0\0\0\0ð?\4\6\0\0\0š‹ƒ˜™ê\4\3\0\0\0µ­ê\4\7\0\0\0…šžƒ…„ê\4\8\0\0\0…šžƒ…„™ê\4\
\0\0\0…šžƒ…„¸†žê\3\0\0\0\0\0\0\0\0\4\9\0\0\0†Ÿ‹µ’ƒžê\0\0\0\0\22pi\23m/³@…wu0\9L@VñæFJ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\24pi\23\28Î\13>\19x7gŠ\26u\27Ì|ë\6\\y\29gwá‡rÁõ¢\5”F—$ö‚9\2¿Y<>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 y,¨{1šêb¶m)\6’ì¸r\24\16Õ^zFÖ'3Aß\17r3ý\
™\3\9\20 \7ÉÊ\0271¾{*á4»N„\30O\12\24–æ\\á=Ò\21×ÕG\31ê6Ksq\8(M¡’½%î\14t\0252\8t\25Ùª3VL—AÉ\15v\25\16\9v\25óÙ!4ºÖ\"…™\11K•ýÛS¯\25e7°\3±R¤w£s(F\0133\0/\8\6 ZåÌyº2Æ%ú­p\20Ô+£!ís¥7lám\31\4\14\8\8 \4\28ê\27sª8;¼ïÒuåP¥jøÈ‡GÔ…¹RÌrV4\18¾¼\4F7—ŸMp1\12å¦q4\17BÓ#ò}$N™\12f8®5­E&8ûp\30¦q\3.\0\0\0ÊÍŒÌÑ\13LÌJŒÌKMŒÏQMLÌ\12ÍÌÏÍ\14ÌÌ\26ÍNÏÊÎÌÑNLÌŽÍÌLÎ€\3\22‚\2\4e\2\0\0X€A\0\23@\1€X€Á\0\23À\0€X€A\1\23@\0€\24€Á\1\23€\1€Â\1\0ÁÂ\1\0\14\3B\2Î\0Â\2€\0\0\6@\0€\5\0\0\0\5†BB\0À\2€\3\0\3\0\0@\3€\0€\3\0\1À\3€\1B\0\3†‚B\0À\2€\3B\0\1†ÂB\0Á\2\3\0B\0\1€\2€\4À\2\0\4B\0\1\31\0€\0\4\7\21 ÕQ`(Ï©\"Vçª,\13ý—m[°G¾\11Bù\6\16\9\16I\25ªõ. \22¼œ(¤>Ù8\22×œ?¡íós¨ZÃTŠÕz]ÝÆi\1\0\0\0\0\0\0\7!\25‚J]B\13\0\0\0\4\14\0\0\0þüíÊúëüü÷Êðãü™\4\3\0\0\0öê™\4\5\0\0\0íðôü™\4\5\0\0\0·é÷þ™\4\9\0\0\0ìêüëÉøíñ™\4\6\0\0\0¶ëüê¶™\0\3\0\0\0\0\0\0\0\0\3\0\0\0\0\0\0ð?\4\9\0\0\0ê÷øéêñöí™\4\17\0\0\0êøïüÐôøþüÍöØõûìô™\4\7\0\0\0ôÊõüüé™\3\0\0\0\0\0\0I@\1\0\0\0\3\9\20 [rºJÈƒ\15\5´ t{ûÓÔrªE_es‡º\11äÐˆ%g¼&4†\3{\14Ï›I\1]\0\9\20 \"Ê\7NÒ¡h\"\4´\8S<ÔÿiŠgåb£[²\8ÿŠ\24+\31û¾?”3À>è\14t\0259\8t\25\8çO*L?MP¡Ö™\17(\22ø\127…£ÔQšO>e¥ã?Wº ñ\25­²¿dÎ\15v\25\30\9v\25‚$\1\31aS4`ü)Ï\20,j`\4ÕÚîkáúW:\0+\8\6 [Þiz°–¡;\1\
\8\8 îý\11rÒ`©\9UqV4\18\0155©s\9_Ÿ\7•\13ÇM\14ÀÁ\30(Z^G)A‡\12ä\15b80A®qu€Ô\\\5\0\0\0\19U\21U\18@À\0…\0€\0]@\0\1\31\0€\0\
\7\21 YW¦qú#©.\0316:/þ:æHµÄšHÌèù\19ÿàj7é›g\3\8\16I\25üº¯\127dSük\3\23\29`Ýµ\7:÷yƒ$^õ†ZL©u¥ÏÔ&Ló’L\2\0\0\0\0\0\1\8\9\7!\25$ÇŽK>¥§\17nâûr.&.SÓ²n_|¢½\17V€Œ\26üóõk\2\0\0\0\4\3\0\0\0002.]\4\7\0\0\0/802+8]\0\0\0\0\23pi\23‡Á:\12rtÊHæ˜\27\20à\24á}l˜sw\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\24pi\23ÞSÇF!]\14@Ò·OWÞä§1YFª'\0ô}KÚŸW1½™¦\19\3\11›+·U_k\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 çÈGv\21Úx\3U\1\9\20 œ¬xT*ëË\30ñT\1*–™úVÁÆ\22\1\6Kô_ ˆ?õìá{À\14t\0259\8t\25‰Eš\
\15•ù\4Ÿ;Ù)lYX\30;\28sñÀ‡1Ëœ\27\23ÙßW\4+LË\15Ç\15v\25\17\9v\25\29P‡zd\6e:·ö#*‰cžza¯r5?²G#Ž\6\24Qa\28\28\8ú=\1,\8\6 ]‡Ô\3û^Š\18Ô\20s^‡r \"í³‹<\0\11\8\8 H9·#óþ\127\28øÎõt\28~V4\18\20\127M»’$^Z=\28í±éWkö®\23O\27ÅM\12\0\0\0\25\28\28\28]\28\28\28\\\28\28æ\0\0\0\29€\0\0K\0\0\0¥\0\0\0À\0\0\1\0\1\0\0Þ\0\0\1ß\0\0\0\31\0€\0\11\7\21 DÖ\6\28{g]Š²l^a&Ž\22ßmõ\23A©\8ê‰,\17@û¤\
wèBP\5\0\16I\25YL\6'\2\0\0\0\1\2\0\0\3\7!\25F€¨!¶ÓÚ*\2\0\0\0\3\0\0\0\0\0\0ð?\4\6\0\0\0!4790U\1\0\0\0\13\9\20 \14ÈS]za7/o\127o\11Ø¡_L{\12\9\20 n\6î \11•kVHøˆIõ²\2!Ð \127^Þ\14t\25:\8t\25üøB{Ì˜\16Ç\17ÿ,.TˆP\2´\0;5%ÛißF€O| Y\11\"¿‘zfúÝHú\15v\25\26\9v\25¸X\6-*©jj\0,\8\6 _ýŠA~'\0121Ž–þ@±¥\31(ÕÝZ\7\1\12\8\8 +\7WWD]Ê\18u\0²jÄ7ÿaæyV4\18ÏÌj8#\0\0\0 æ¦æfæææ»fæç¾¦&æñ¦æfùææçñæçf æfæ½ææ\0\23@\0€F\0€\0_\0\0\1K\0\0\0H@\0\0†€@\0À\0\0\0\0\1\1\23€\1€Å\1\0\1\0\2€\2Ý\0\1\5\2\0\1@\2\0\3\29‚\0\1J\0‚\3¢€\0\0#ý\127†À@\0À\0€\0\6\1A\0@\1\0\0\29\1\0\1ž\0\0\0Ÿ\0\0\0\31\0€\0\5\7\21 Ù¹¢,Ÿmê\22\6˜ \
Ö²å'k\6z'Í©Ÿ7\4\7nx\
\6\16I\25\2Ïz!äMîGêÚÓm%Ž\12\28JHÌ\16a¼„bÝæ\18I\3\0\0\0\0\1\1\1\1\2\4\7!\25}\28¨v<ä\
ò\24C,\12³¦7î‰½2\5\0\0\0\4\5\0\0\0\15\2\11\30{\4\6\0\0\0\15\26\25\23\30{\4\6\0\0\0\11\26\18\9\8{\4\13\0\0\0\8\30\15\22\30\15\26\15\26\25\23\30{\4\13\0\0\0\28\30\15\22\30\15\26\15\26\25\23\30{\0\0\0\0\22pi\23©\17ùU\25‘\20\
\12ThF\30\18«@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\22pi\23ªê©6\2\25KL­•~$‘ytp\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 eÊÈXìJ‡!ÂMð\27;\12\9\20 ôÆH9ä3.\22U*V\6;ôE`¿cÃ$Ç\14t\0255\8t\25ò\21¹\3hóè\127Ÿó#1eQÍrD0\22ké\15v\25\16\9v\25ÖÓ\31\24IPM\28½pþrŽK//ÀëF|\0035c2°_\0063›f\14T\0!\8\6 øBå\127C\26T\1¼EDp,Å+vå\"¡e!\16\13I\24\16³\23¨p‘\1\0\13\8\8 nÜ Jœ7Ú:uŒŽ\15Ã\6wP×+ \27ª{V4\18ÊAÙ\30œã:4Å“c<\13\0\0\0«ªªªìêêª÷j*ªe€€\0\24€À\1\23@\0€\1À\0\0\23€\0€\24\0Á\1\23\0\0€\1@\1\0\31\0\0\1\31\0€\0\
\7\21 à\19Q\31„ˆÊd\5gÆ)*dž;BùÈW“²õXêOå7E.,\
\4\5\16I\25…¶ó\0110(q};Uá\11ÈÐG\13\1\0\0\0\0\0\0\7!\25g\26\13\2\6\0\0\0\3\0\0\0\0\0\0\0@\4\14\0\0\0\\^OhXI^^UhRA^;\3\0\0\0\0 ìDA\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0(A\3\0\0\0\0\0\0ð?\0\0\0\0\27pi\23\13~Â6€*À\25VdztžÖ\"0î\6ácò›T/\19c±?²\13X4ÊÇtJ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 \15_Lrvþ9 \11\9\20 3¨BX\127[Ç>3\15t\0254\8t\25¼•*\6ØpnqÈ¼Æ#=Ÿ‰0à\15v\25\25\9v\25¸\28Ú7\1+\8\6 Âáˆ\30Aª\1p\0\2\8\8 ª¸\14|ð\27Ÿ$Ý#‰\"£P†\3+Æ‡\6Êz€ctØW3Â©n:×({Åý\9B¡rV4\18\4vÿMÀ¨Ï\17 &–wzt\7¶×¾\29ä\4AB®\28Ä_53†\\¥‹×Hj²îe%\0\0\0¤¡¡¡à¡¡¡ á¡¡G¡¡¡¼!¡¡ç!a¡æaa¡!¡¡¡ü!¡ '€À\0‡\0A\1Á@\1\0€\0\1Æ€À\0ÇÀÀ\1\11\1\0GA\1\
A\1ƒGÁA\1\
AƒG\1B\1\
A\1„\
Â„\
Â…\
B†Ý€\0\1\26@€\1\23@\1€\13AÃ\1\25\0\0\23€\0€\3\1€\0\31\1\0\1\23@\0€\3\1\0\0\31\1\0\1\31\0€\0\7\7\21 mHžl§Qx\22RûqS&ex$ð\31]9\6\4\16I\25g\15z\20\12äâ%¾•\9nW+\0259é\7lH\2\0\0\0\1\2\0\0\5\7!\25‚ñ ?³‚ì+Ö¾ Iµ³J.\14\0\0\0\3\0\0\0\0\0\0ð?\4\6\0\0\0TABLE \4\3\0\0\0OS \4\5\0\0\0TIME \4\5\0\0\0DATE \4\3\0\0\0\
T \4\4\0\0\0DAY \4\6\0\0\0MONTH \4\5\0\0\0YEAR \4\5\0\0\0HOUR \3\0\0\0\0\0\0\0\0\4\7\0\0\0MINUTE \4\7\0\0\0SECOND \3\0\0\0\0\0\24õ@\0\0\0\0\16pi\23›¼*\11®ìW\16\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 jâ%$“ÆêHX\11\9\20 >Hà\"¸ïðF\28\15t\0258\8t\25Ðº%zoÇÏ\20\\eækH¢cL*xü\\â\1³J\25àtyL\28í\6\28\14v\25\29\9v\25ým‰\15ÿC¢I½‡ë{$¿YBÈ\21Ñ%\1+\8\6 ÐÜB\9®\21‚5\0\12\8\8 Œ\6)\21v’ˆ\21-—9>\31®Å:qqV4\18‰ë^ \29Š6M\1275rfØ‰jÞejY\6o&9]™D3® Su6öMœ\0\0\0tqqq0qqqð1qq—qqqlñqq7ñ±qð±qq,ñqpöq°qºqqqTpqq\0200qqö00qêpqqf±sññpqs¶00qpópqìðñpêpqqfqqñfqpñ÷0±qö°0r±pñppssqì0ñpö03qêpqqf±sññpqs¶03qpósqìðñpêpqqfqqñfqpñ÷0±qö°0rÀ\1€\1\1Â\2\0A€\1‡\1C\0›\1\0\0\23À\2€€\1\0\2Ç\1C\0\1‚\2\0€\1›\1\0\0\23\0\0€\23\0\1€†AÀ\0‡ÁA\3À\1€\1\1B\3\0A€\1‡C\0›\1\0\0\23À\2€€\1\0\2ÇC\0\1‚\2\0€\1›\1\0\0\23\0\0€\23\0\1€†AÀ\0‡ÁA\3À\1€\1\1Â\3\0A€\1‡\1D\0›\1\0\0\23À\2€€\1\0\2Ç\1D\0\1‚\1\0€\1›\1\0\0\23\0\0€\23\0\1€†AÀ\0‡ÁA\3À\1€\1\1B\4\0A€\1‡D\0›\1\0\0\23À\2€€\1\0\2ÇD\0\1‚\1\0€\1›\1\0\0\23\0\0€\23\0\1€†AÀ\0‡ÁA\3À\1€\1\1Â\4\0A€\1‡\1E\0›\1\0\0\23À\2€€\1\0\2Ç\1E\0\1‚\1\0€\1›\1\0\0\23\0\0€\23\0\1€†AÀ\0‡ÁA\3À\1€\1\1B\5\0A€\1\1\0\0ÇE\0Õ\1€\3\1\2\0\0¡A\3€\2\0\0Ç‚E\0ÇB‚\5Õ\2€\5\1\3\0\0¡‚\1€€\3€\2ÇƒE\0ÇC‚\7ÇCƒ\7\0\4€\4@\4€\6C\0\2 Âý\127 \1ü\127‡\1À\1›\1\0\0\23€\2€†AÀ\0‡\1F\3À\1€\1\1B\6\0€\1H€‹†Æ\0ÆÁÅ\0\1Â\6\0A€\1\23À\0€‡\1G\1À\1\0\0ž\1\0\1Ÿ\1\0\0\31\0€\0\
\7\21 öÂó\31 ®ò*œ\0Þi\15£h\25ìÊß1¨‘×$\12\17ò(ì\14‚{\18\5\16I\0250ÐKk´$S!4\20ÞZ\1­Žt\2\0\0\0\1\2\0\0\0\7!\25C’Õ\28\29\0\0\0\3\0\0\0\0\0\0ð?\4\6\0\0\0,9:4=X\4\8\0\0\0*=)-1*=X\4\3\0\0\0+\"X\4\5\0\0\0002+76X\4\6\0\0\0+,!4=X\4\7\0\0\0+,*16?X\4\7\0\0\00016+=*,X\4\19\0\0\0½Ýð½éØ½éÆ¾Øÿb+,!4=X\4\6\0\0\0/1<,0X\4\7\0\0\0006-5:=*X\4\19\0\0\0½Ýð½éØ½éÆ¾Øÿb/1<,0X\4\7\0\0\0000=1?0,X\4\20\0\0\0½Ýð½éØ½éÆ¾Øÿb0=1?0,X\4\7\0\0\0007*1=6,X\4\20\0\0\0½Ýð½éØ½éÆ¾Øÿb7*1=6,X\4\6\0\0\0,1,4=X\4\19\0\0\0½Ýð½éØ½éÆ¾Øÿb,1,4=X\4\11\0\0\0;96;=4695=X\4\24\0\0\0½Ýð½éØ½éÆ¾Øÿb;96;=4695=X\4\7\0\0\00073695=X\4\20\0\0\0½Ýð½éØ½éÆ¾Øÿb73695=X\4\6\0\0\0(9?=+X\4\13\0\0\0=**7*5=++9?=X\4\7\0\0\0;76;9,X\4\2\0\0\0tX\4\6\0\0\0=**7*X\3\0\0\0\0\0\0\0\0\4\7\0\0\0=6;7<=X\2\0\0\0\11\9\20 ð†$x\5SÐ\
~\11\9\20 ¥-È\7+#\22<;\15t\0258\8t\25Ú)Õ4v¤)¹C**Kl1\23‘¯W]—PÕt5æ¸\4ÓkZ<\17\14v\25\18\9v\25%$Ø(Mìï\5òü\16GÕ5š\27\31†\21V·…\31o\23Ñ€\\)þ\0002Êõ”\14çYV\1\0,\8\6 \19×é\22éÍ5%ºÅ¼h¶\26,IÙTZ\29\2\
\8\8 \13çL\4§ƒ{\28|}V4\18PHÍO?p*0®®òi\9Œ÷y‹Ü[G\11\0\0\0ú|<|¼|||áü|\1\24@\0\1\23€\0€ƒ\0€\0Ÿ\0\0\1\23@\0€ƒ\0\0\0Ÿ\0\0\1\31\0€\0\
\7\21  ÜÌnÀÂ\20L\18Ê¤\3‰\3\26\14åæìt_¶”\9{\0+U»\28‡\16\4\6\16I\0253†JDÒí\7m¨:«\17ý{ßRºG^nÎí90\16SÉi\1\0\0\0\0\1\3\7!\25ˆ³ö\24Æmõ2\1\0\0\0\4\5\0\0\0\
\7\14\27~\0\0\0\0\21pi\23GÌƒ\12ÓTB7#îiM¬\18Ù\7\11_¥wt67\29ì‚\0038\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 B@é!\0¥\21\11^þ;D.\11\9\20 “6dkTÅÖy,\15t\0252\8t\25#‹ò<Z¡XT\20\14v\25\17\9v\25ãWg\29Û\1«NpKE%\18Ki/³O²vÅîYTWïß\24VzIfCš=\0/\8\6 Rpë\21¶õ4\18ÒÜs$È\4™\15vaQcl˜¥1\3\1\8\8 Æs\27$ÙÞì\25T»›;\8´\4FÙƒ\2%²¹×\127˜á#\23š'\6,Eð;kžzV4\18i{.(FHSe™\0\0\0YžÞž†Þ^Ÿ‰^\30Y\30ÞžEžžž‰žš\30[žžž™\31Þžß_žžC\30\30ŸEžžž‰žž\30‰Þœ\30Xž_žYÞ_Ÿ›ŸžŸß\31Ÿž\30Ÿ\30ž__ŸžžœžŸßœœžÈß\28œCÞ\30ŸYÞÜžEžžž‰žš\30[žžž™ßÜžß\31œžC\30\30ŸEžžž‰žž\30‰Þœ\30Xž_žYÞ_Ÿ›ŸžŸß\31Ÿž\30Ÿ\30ž_Á\1\0\0\2\0\1AÂ\2\0VA‚\2Ý@€\1Ç\0C\0Û\0\0\0\23\0\4€Å\0\0\0\7\1C\0AÁ\0\0Ý€€\1Û\0\0\0\23\0\0€\23@\2€Æ\0Á\0Ç@Á\1\5\1\0\1A\1\0€\1€\0ÁÁ\1\0\0\2\0\1A\2\2\0VA‚\2Ý@€\1Ç@C\0Û\0\0\0\23\0\4€Å\0\0\0\7AC\0AÁ\0\0Ý€€\1Û\0\0\0\23\0\0€\23@\2€Æ\0Á\0Ç@Á\1\5\1\0\1A\1\0€\1€\0ÁÁ\1\0\0\2\0\1A‚\3\0VA‚\2Ý@€\1Ç\0@\0\24ÀÃ\1\23À\4€Ç\0D\0Û\0\0\0\23\0\4€Å\0\0\0\7\1D\0AÁ\0\0Ý€€\1Û\0\0\0\23\0\0€\23@\2€Æ\0Á\0Ç@Á\1\5\1\0\1A\1\0€\1€\0ÁÁ\1\0\0\2\0\1AB\4\0VA‚\2Ý@€\1Ç\0@\0\24€Ä\1\23À\4€Ç\0D\0Û\0\0\0\23\0\4€Å\0\0\0\7\1D\0AÁ\0\0Ý€€\1Û\0\0\0\23\0\0€\23@\2€Æ\0Á\0Ç@Á\1\5\1\0\1A\1\0€\1€\0ÁÁ\1\0\0\2\0\1AB\4\0VA‚\2Ý@€\1Ç\0@\0\24ÀÄ\1\23À\4€Ç\0D\0Û\0\0\0\23\0\4€Å\0\0\0\7\1D\0AÁ\0\0Ý€€\1Û\0\0\0\23\0\0€\23@\2€Æ\0Á\0Ç@Á\1\5\1\0\1A\1\0€\1€\0ÁÁ\1\0\0\2\0\1AB\4\0VA‚\2Ý@€\1\31\0€\0\0\7\21 LÓ•E!Jþ3\
\11\16I\25^\30ÿtÔ™°*“í!\18¶\13ß\13+\20ú\16 1¼O\27\15\
w}„å&×&ñaíë}\27\3\0\0\0\1\4\0\1\1\3\3\7!\25MˆBEY„#M\20\0\0\0\4\5\0\0\0ZW^K.\4\6\0\0\0bOLKB.\4\5\0\0\0ZKVZ.\4\7\0\0\0]Z\\G@I.\4\6\0\0\0ZOLBK.\4\7\0\0\0G@]K\\Z.\4\4\0\0\0É‚‚.\4\7\0\0\0Ç›É‚‚.\4\26\0\0\0Ê–„È ‰Ê•˜ZKVZËŸ°È®‰Çº·Æ.\4\5\0\0\0]GTK.\4\7\0\0\0@[CLK\\.\4\26\0\0\0Ê–„È ‰Ê•˜]GTKËŸ°È®‰Çº·Æ.\4\6\0\0\0OBGI@.\4\6\0\0\0MABA\\.\4\27\0\0\0Ê–„È ‰Ê•˜MABA\\ËŸ°È®‰Çº·Æ.\4\11\0\0\0|OJGAi\\A[^.\4\7\0\0\0]KBKMZ.\4\28\0\0\0Ê–„È ‰Ê•˜]KBKMZËŸ°È®‰Çº·Æ.\4\14\0\0\0mFKMElAVi\\A[^.\4\9\0\0\0mACLAlAV.\0\0\0\0\24pi\23\19ü]i3c\16g\25^+\27°b/\12ç\18\12Ë\23h+³‘†F§\14\0258\17\8¤\22Ÿ8W\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\27pi\23zƒÒ>å€Ô<öµÉuÆVh\4\6ËÒpÃ´‘3$ugyÛdƒ\27V¢³E\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 Èßb\127û›[I a±QûUöe2úF,äè\8DˆÜF\24\1\9\20 \2ï\17~¨0-g;$Î\5s\1àjÅ cDÄò\"ñ\19Ñ+”Ä\2\3\
\15t\0257\8t\25Vÿª{\1l=:uJÍ^–\27\4J°?x\11w\19\"]ú´\0305\14v\25\31\9v\25ºQÚTw]J\28Dù^\9\"\21\5\8¹¨#\12Ùò]\4¾pN\1.\8\6 \7/éC6¸·zŒ\3c9\11‡\
ð›ëA5\127E\\’ú˜\8\0\15\8\8 q£\19b\5üxs(’¹\12µg\6\5ö\15J\31¼V¼\15\21^ŠIk~V4\18Š¨W(ã*ùdm\2rU\1¼y\5s%®\3‡0ç@I\0\0\0nkkk*kkkê+kkkkkvëkk.kkkêëkkª«kkMjkk6ëkkîkkkªkjkjªkk\13jkköëkk®kkkj*jk*ªkkÍ\1\0\0Ý€\0\0\5\1\0\0A\1\0Á\0\0æ\1\0\0\29\0\0E\1\0\0Á\1\0ÁÁ\0\0&\2\0\0]\0\0‡\1@\0‡\1A\3Ë\1\0\0\1‚\0\0U\2\0\0\2\0\0!Â\4€\6CÀ\0\7\3B\6@\3€\3†CÂ\0‡ƒB\7ÁÃ\2\0\7Ä\2\0\7\4@\8G\4@\0G\4À\8\14D\4\8GÄ\2\0G„À\8‡\4@\0‡„@\9N„„\8‡Ä\2\0‡\4A\9\3€\2\29C\0\0 ‚ú\127\6\2Ã\0@\2\0\3†BÀ\0‡BC\5À\2€\3\1ƒ\3\0‚€\1À\2€\0\0\3\0\1@\3€\1€\3\0\2À\3€\2\30\2\0\4\31\2\0\0\31\0€\0\3\7\21 ë‚ø\31\19\11\16I\25Å/i_ó;¡C×\2j}ÉíÙ-›Vû8ß1SAÿ¥‘((Z^ro=ÚKïA}j\2\0\0\0\1\2\0\0\3\7!\25\0018sT‡\14–\19\15\0\0\0\3\0\0\0\0\0\0ð?\4\6\0\0\0lyzt}\24\3\0\0\0\0\0\0\0@\4\7\0\0\0vmuz}j\24\3\0\0\0\0\0\0\8@\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\20@\3\0\0\0\0\0\0\24@\4\7\0\0\0qvk}jl\24\4\7\0\0\0kljqv\127\24\4\7\0\0\0~wjuyl\24\4\13\0\0\0=kd=kd(`=(.`\24\4\28\0\0\0~qv|Umtlq[wtwjQvJ}\127qwv^mbba\24\4\7\0\0\0{wv{yl\24\4\2\0\0\0004\24\0\0\0\0\21pi\23\0074ìG¯ O ƒä½5ýC6gl÷\0110˜BH\127JS+\2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 kN4f\21\1\9\20 ¦(\0171¨—Ú+„e²\"§Ž_OØN‚\7&Uë\31ëkq3\15J.\19™\15t\0253\8t\25æJŽ=ž³•\2u)3<#\14v\25\27\9v\25\22k\8'\31à\8v¶dG\1*\8\6 ^\3þTå\0170h“ƒ×r\0\2\8\8 {}sM˜^\23\0XµM4lP\"\6»i•–°.&¥¢Fr\9¶OTÜ}qå\\€{\18}V4\18iÂ2\30¿À&PÔÂÚ$\23\30>«,˜\3B\1\0\0\23\18\18\18S\18\18\18“R\18\18ô\18\18\18\15’\18\18W\18\18\18“’\18\18ÓR\18\0184\19\18\18O’\18\18™\18\18\18ÕÒR\18Ç\18’\19\19\19\18\18T\19Ó\18“S\19\18O“\18\19•“Ó\16Ù\19\18\0187\16\18\18S\16\18\18’\16’\19Ó\16\18\18sÐ2’S\17\18\18•ÑR\18•\17\17\21‡\17\18\21Ó\17\18\18s\17\13’UÖR\18U\22‘\26U\22–\26UÖÓ\26\
\18Ð\26\5\18\21’UÖR\18U\22‘\26U\22–\26UVÐ\26I\22\18\18\5’\17’UÖR\18U\22‘\26U\22–\26U–Ð\26IV\18\18\5\18\16’TVÒ\18UÖÐ\26’\22\18\19ÕÖR\18Õ\22‘\27Õ\22–\27ÕVÐ\27OV’\19\5Ò\19’TVÒ\18UÖÐ\26’\22\18\19ÕÖR\18Õ\22‘\27Õ\22–\27Õ–Ð\27OV’\19UÖR\18U\22‘\26U\22–\26UÖÓ\26\
\18Ñ\26\5\18\21’UÖR\18U\22‘\26U\22–\26UVÐ\26I\22\18\18\5’\17’UÖR\18U\22‘\26U\22–\26U–Â\8[D\0\0\23\0\2€FDÀ\0GÄÂ\8€\4\0\1ÇÄ@\0Ç\4ƒ\9Ç\4„\9ÇDÂ\9]D€\1\23À\1€FDÀ\0GÄÂ\8€\4\0\1ÇÄ@\0Ç\4ƒ\9Ç\4„\9Ç„Â\9]D€\1GÄ@\0G\4ƒ\8G\4„\8GÄÁ\8\24@Ã\8\23\0\1€FDÀ\0GÄÂ\8€\4\0\1Á„\3\0]D€\1GÄ@\0G\4ƒ\8G\4„\8GÄÁ\8\24ÀÃ\8\23@\9€GÄ@\0G\4ƒ\8G\4„\8G„Â\8[\4\0\0\23À\7€GÄ@\0G\4ƒ\8G\4„\8G\4Ä\8[\4\0\0\23\0\4€FDÀ\0GÄÂ\8€\4\0\1ÇÄ@\0Ç\4ƒ\9Ç\4„\9Ç„Â\9]D€\1FDÀ\0GÄÂ\8€\4\0\1ÇÄ@\0Ç\4ƒ\9Ç\4„\9Ç\4Ä\9]D€\1\23\0\2€FDÀ\0GÄÂ\8€\4\0\1ÇÄ@\0Ç\4ƒ\9Ç\4„\9Ç„Â\9]D€\1\23Àÿ\127`Cà\127`‚Þ\127[@\0\0\23€\2€K\2\0\0@\0€\4A\2\0\0•\2\0\1Á\2\0\0aÂ\0€AC\4\0€\3\0\6Vƒƒ\6J@\3\6`‚þ\127U\2€\0•\2\0\1\25€‚\4\23€\5€F‚Ä\0Â\4\0Á\2\5\0]B€\1U\2\0\1•\2€\0N‚‚\4†BÅ\0À\2€\4\1\3\5\0B€\1\2\0\0À\2€\4\1\3\0\0¡‚\1€†CÀ\0‡ÃB\7À\3€\0\1D\4\0@\4€\6\22D\4\8C€\1 Âý\127K\2\0\0†ÂÅ\0Ç\2F\3\0\3\0\0Ý\2\0\1\2\0\0dB\0\0H@\2‹F‚Å\0G\2À\4\24\0À\4\23À\26€A‚\0\0†‚Å\0•\2\0\5Á\2\0\0a\2\25€\1\1\0\0FCÆ\0GƒÆ\6†ƒÅ\0‡\3\3\7ÁÃ\6\0]ƒ€\1[\3\0\0\23À\6€@\3\0\4†ƒÅ\0‡\3\3\7ÁÃ\6\0]ƒ€\1€\3\0\4Î\3@\6ÇÃ\3\1\1\4\7\0ƒ€\1Ë\3\0\0\1\4\0\0U\4€\6\4\0\0!D\1€\6EÇ\0GÅ„\6\29…\0\1\13\5@\
\7\5\5\7Ê\3…\9 \4þ\127\6„Ç\0N\4@\6GD„\0\
Äƒ\8\1\1\5\0\23À\15€N\3@\6GC\3\1\24€Ã\6\23€\1€FƒÇ\0Ž\3@\6‡ƒƒ\0ÆƒÅ\0Ç\3ƒ\7JÃ\3\7\1\1\5\0FCÆ\0GƒÆ\6Ž\3@\6‡ƒ\3\1ÁÃ\7\0]ƒ€\1[\3\0\0\23€\6€@\3\0\4Ž\3@\6‡ƒ\3\1ÁÃ\7\0]ƒ€\1†CÇ\0ÆƒÅ\0\14\4@\6Ç\3„\7ƒ\0\1\3@\7‡ƒƒ\6À\3\0\4\0\4\0\7A\4\7\0Ýƒ€\1\6DÇ\0F„Å\0G\4ƒ\8\29„\0\1\13\4@\8\7\4„\7F„Ç\0Ž\4@\6‡„„\0J\4\4\9\1\1\5\0\24\0@\2\23À\3€@\3\0\4Ž\3@\6‡ƒ\3\1Á\3\7\0]ƒ€\1†CÇ\0ÆƒÅ\0Ç\3ƒ\7ƒ\0\1\3@\7‡ƒƒ\6ÆƒÇ\0\14\4@\6\7\4„\0Êƒ\3\8\1\1\5\0`Bæ\127\23@\0€A\2\5\0_\2\0\1A\2\0\0_\2\0\1\31\0€\0\8\7\21 ú\19¡\8‘w&AÀž:o=ÔDAJ/S—+§aŽ\29bM·\0”\0269Ì¦-ì `\"\22\2\16I\25ÌO~ «³X\6\237P\2\0\0\0\1\2\0\0\0\7!\25\4i¦: \0\0\0\3\0\0\0\0\0\0ð?\4\6\0\0\0atwyp\21\3\0\0\0\0\0\0\0@\4\6\0\0\0etrpf\21\4\8\0\0\0gpd`|gp\21\4\3\0\0\0fo\21\4\5\0\0\0\127fz{\21\4\5\0\0\0alep\21\4\11\0\0\0Gtq|zRgz`e\21\4\7\0\0\0|xtrpf\21\4\5\0\0\0y|fa\21\4\7\0\0\0|{fpga\21\4\14\0\0\0V}pv~WzmRgz`e\21\4\5\0\0\0Pq|a\21\4\6\0\0\0Jpq|a\21\4\9\0\0\0VzxwzWzm\21\4\5\0\0\0qtat\21\4\4\0\0\0ctg\21\4\6\0\0\0pggzg\21\0045\0\0\0ñ¨µò‘Pmey|faýªŒñ­¿ðš—ó€¥ñ©µò‘ñ­˜ðº¬ú©™ð¥„ð’µñ­¿ö•—\21\3\0\0\0\0\0\0\0\0\4\7\0\0\0q|tyzr\21\4\
\0\0\0xlJgpa`g{\21\4\7\0\0\0f}zb@\\\21\4\7\0\0\0p{vzqp\21\4\7\0\0\0fag|{r\21\4\5\0\0\0s|{q\21\4\2\0\0\0U\21\4\2\0\0\0009\21\4\9\0\0\0az{`xwpg\21\4\3\0\0\0JR\21\4\2\0\0\0006\21\1\0\0\0\3\9\20 £\19Ýyø½¹^â<\28\30°$:l÷\7Û#` Z[IA›}Èã‹T†î\13oê\11³fN\12\9\20 —~×\18†|†(;Ôú\17úR.n¦\30¡\5d\15t\0256\8t\25UoS\11ç(;\\…R¢Y\9ÿar‘¶\9a\"Ï}\\\14v\25\25\9v\25\127X\9|\0!\8\6 3ä5s\14sA&ÿ~š6 [E~²†\30 ÷<T\21ƒ˜a\28b«X\12\3\9\8\8 ã8¼w•|V4\18i'Êf•ø¦pcÒXh©9½O+\0\0\0IÕ•”‚••\21T•••‰Ô\21•‚••\21”Ô••Ô”••\30”••S\20Õ•RTU–•—•\0@\2\0\2€\2€\1Ý\0\2ÛA\0\0\23€\2€\6‚@\0\7\2A\4@\2\0\0€\2€\1Æ‚@\0ÇBÁ\5\0\3\0\0Ý\2\0\1\29‚\0\0Š\1‚\2\23@\3€\6‚@\0\7\2A\4@\2\0\0€\2€\1Î\2À\3\29‚\0\2Š\1‚\2\6‚@\0\7BA\4@\2\0\2\29‚\0\1Í\0‚\3M\1À\2\23€÷\127Ÿ\1\0\1\31\0€\0\6\7\21 éNß\16ä\13¸a'Ê¬qm€\22\13\0\16I\25|9\0}\1\0\0\0\0\1\4\7!\25ÍÉ¶\5†8bo\0074r|/ì…\3d]° \6\0\0\0\3\0\0\0\0\0\0ð?\4\2\0\0\0\14N\4\7\0\0\0=:<' )N\4\5\0\0\0(' *N\4\4\0\0\0=;,N\4\4\0\0\0\"+ N\0\0\0\0\17pi\23^_/(˜Aæ\19”ÿ¼\30\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\21pi\0238+\18F†Û>U\27\30t»5.¨14KD`M-žnI&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 £§\26A\0225&\16a–>k\0\9\20 ßãù\0PîŽl†¬”\5Fƒõx_,þ!Üé¶DKö®@U¶³\15\25Ü½@¶\2t\0259\8t\25Ós¦wó¤”\
\24…%5Xð1—Îþpn¦\8/\0•ÔirÒ@\5\19x\24W³\14v\25\30\9v\25òÐ)YlòÊSDÍþnÿ\20-B,¡–\27(\127\8|\1/\8\6 BÖ¼+Åàž:MS9<>\31\12w¤Ä˜;AÈ(\0\1\8\8 êGŽ4ümÆJ¡µWA6>=uQ$zZº‘\21\2>‹öM%˜ R­6ª\12…yV4\18D\5©}S\0\0\0 ………ã……‡„……àÄ………E…’\5‡\5\4Ä……`\4……\13E„\4`D……\13E\4\4`„„…\13E„\7`Ä„…\13E\4\7RÄ•\5’…•\5\5D…’\5†\5 \4„…`D„\0\1Â\1\0@\2\0\3]‚€\0¥\2\2\0ˆ€\2¥B\2\0ˆ€‚¥‚\2\0ˆ€\2‚¥Â\2\0ˆ€‚‚×\1\12€\23À\11€\24\0Â\0\23€\6€¥\1\3\0åA\3\0\1B\2\0A‚\2\0€\2€\3À\2€\4\0\3€\3@\3€\3€\3\0\1]ƒ\0\1€\3€\3À\3€\1ƒ\0\1Vƒƒ\6\29ƒ\0\1Ö\2ƒ\5‚\0\1å‚\3\0ˆÀ\2åÂ\3\0ˆÀ‚å\2\4\0ˆÀ\2‚åB\4\0ˆÀ‚‚×Á\4€\23€\4€\24ÀÂ\0\23\0\4€¥\4\0åÁ\4\0%\2\5\0A\2\3\0B\3\0À\2€\3\0\3€\1Ý‚\0\1%C\5\0ˆ\0\3%ƒ\5\0ˆ\0ƒ%Ã\5\0ˆ\0\3‚%\3\6\0ˆ\0ƒ‚×Áÿ\127\31\0€\0\7\7\21 ´…åm¶×é\2Ø.=\9ï\13˜\9¨¨\19\\\16\2\16I\0253Û–x¨½@\30pÂžx\4\0\0\0\1\2\1\3\0\0\1\4\3\7!\25Kzˆ!²˜[$\14\0\0\0\4\
\0\0\0\26\26\8\3\
\4\25\14\5k\4\6\0\0\0^ZZX[k\4\11\0\0\0\4\8\25)\
\7\
\5\8\14k\4\
\0\0\0\4\8\0258\8\25\14\14\5k\4\9\0\0\0\4\8\25\"\6\
\12\14k\4\15\0\0\0\4\8\0259\14\27\4\25\31.\25\25\4\25k\4\7\0\0\0\3\
\4\2YXk\4\22\0\0\0ZZZ^\23/SSX-^(.S(X*/^SSk\4\6\0\0\0\15\
\6\
Yk\3\0\0\0\0\0\26«@\4!\0\0\0RZ\9\\\13\14[\14\8\14RXSZ\\\\]\8\13Y[^Z\8\
XS\
\13\8\9[k\4\8\0\0\0\25\30\4\0\30\
\2k\4\6\0\0\0SSY[\\k\4!\0\0\0\14^\13^R_\13\
\
ZSR__R\9S^]\15^\9\13Y\13[\15Z\\_\15\14k\25\0\0\0\11\9\20 \15F¨aôV<\29Ô\8\9\20 ¿\2Ätô\15t\0254\8t\25D\15h=êÕ\0282¸K\"{òk–b´\14v\25\26\9v\25Á\"J\7§‹*\20\1#\8\6 {\24ûLG„C!x\0vB?,aB¾{*ø\12\5\14Ä\22ª\0154\28\25+›\1278èÝ©w\0\2\8\8 ¼ i\\ÀÎjlš\5šHÎ0w\27Á+×_ýqþ\23Ýv\31}µ‚\19}mëÅ;eã\21\13CqV4\18ªò}J_[ô#Rs¤nœ^\20-\20x\22\31\20–îuCê>AC¬*o®éB7\0\0\0FCCC\2CCCÂ\3CC¥CCC^ÃCC\6CCCÂÃCC‚\3CCeBCC\30ÃCCÆCÃC‚ƒCCBBBC\2\2B\0¦\1\0\0€\0\0Æ€A\1\1Á\1\0Ý€\0\1\6A\1A\1\2\0\29\0\1K\1\0\0€\1€\0ÇAB\2\11‚\1\0\
\2\0…\
\2Ã…\
‚€†K‚\0\0J\2Ä‡•\2\0\3J‚‚ˆ\
B\2‡FÂD\1G‚Ä\4GBÀ\4€\2\0\3]‚\0\1\
B\2‰FÂD\1G\2Å\4GBÅ\4€\2€\2]‚\0\1\
B\2ŠÝÁ\0\1\24€E\4\23€\0€G\2À\2_\2\0\1\23@\0€C\2\0\0_\2\0\1\31\0€\0\5\7\21 ¼¬ 1ÎÚJ\5Hê\17\13´¹¥?’ñô\20|\6+8P96x\11\7\16I\25÷1Úw\12ZŸT;ž\9y‘7t@ÚŠ\22püÉàX\3\0\0\0\0\0\0\1\0\2\8\7!\25·\0016m²LôUû”8\20\28åKz&ÒËG–¼º\7Æ×ÉD…-Àkè/_v\23\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0§ ¦½º³Ô\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\7\0\0\0º¡¹¶±¦Ô\3\0\0\0\0\0\0N@\4\8\0\0\0¦±¥¡½¦±Ô\4\3\0\0\0§®Ô\4\13\0\0\0§®»·¿± ú¼  ¤Ô\4\8\0\0\0¦±¥¡±§ Ô\4\4\0\0\0¡¦¸Ô\4\7\0\0\0¹± ¼»°Ô\4\5\0\0\0„›‡€Ô\4\8\0\0\0 ½¹±»¡ Ô\4\8\0\0\0¼±µ°±¦§Ô\4\13\0\0\0—»º ±º ù€­¤±Ô\4\"\0\0\0µ¤¤¸½·µ ½»ºû¬ù£££ù²»¦¹ù¡¦¸±º·»°±°Ô\4\15\0\0\0—»º ±º ù˜±º³ ¼Ô\4\7\0\0\0§»¡¦·±Ô\4\6\0\0\0¸ ºåæÔ\4\5\0\0\0§½º¿Ô\4\6\0\0\0 µ¶¸±Ô\3\0\0\0\0\0\0i@\0\0\0\0\17pi\23š¥Ö\
üÅMl¥ \0293\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 'mÁ\19Ì]I,m\12\9\20 Uº}:²L\8;\31 ·\5û3±CŸ<ÈFì\15t\25:\8t\25Íè\11Lþ™nBÔ~\2XÇg\8¡ò\127hÏJè\3)Æ\22/À*o©Py;B2²Nß\14v\25\16\9v\25>&²`ƒ¬ì\4„£õ\4hÇù,ûÖ0\24‰\"\25[HcF[$D|4\0.\8\6 øÓ©+K±=H¿,ƒsf\28\30nùÜ\17]\20ç\0.\24i&)\1\
\8\8 \15\27²q·¥îo\\~V4\18µ'ˆ^\7ONP5Ë%FV\26\8GÖ™6T^‘<u'\0\0\0009\\\\\\Ú\\\28\\\28\\\\ÁÜ\\]šÜ\28\\›œœ]\\]\\\\\29]]\\œÜ]\29\29]\0\24€A\2\23À\5€†ÁA\0€\0\24\0B\3\23@\2€Æ\1@\0\1B\0\0Ý\0\1\12BÂ\1‚\2\0\29‚€\1\12ÂB\4\29‚\0\1@\1\0\4\23@\1€À\1€\0\12BÂ\1‚\2\0\29\2€\1Ý\0\0@\1€\3Ì\1Ã\1ÝA\0\1_\1\0\1\23@\0€A\1\0Ÿ\1\0\1\31\0€\0\1\7\21 \127ê¯\15¡ÃîC—I\20\22\11\7\16I\25$pÛH\27í\9\27%Ø[\29\31G\12a¥\15#vm;¢x\1\0\0\0\0\2\4\7!\25—Þ\\=e\15L$<Æ]V\11à0Ë+j\18\13\0\0\0\4\8\0\0\0\31\8\28\24\4\31\8m\4\3\0\0\0\30\23m\4\3\0\0\0\4\2m\4\5\0\0\0\2\29\8\3m\4\3\0\0\0\31\15m\4\1\0\0\0m\0\4\
\0\0\0\
\8\25\">9\20\29\8m\4\4\0\0\0\4\2\30m\4\5\0\0\0\31\8\12\9m\4\3\0\0\0G\12m\4\6\0\0\0\25\2\5\8\21m\4\6\0\0\0\14\1\2\30\8m\1\0\0\0\15\9\20  \29›T÷\5ñ}\31 Ï\
)6€\127{êäX\23\22~?\14\14\9\20 ÔLºs¡‹ä\0127‡A\11†Ui4ÉéE‚‡œ\14YEÆDû\15t\0253\8t\25M-’[†ø±;çÂŽDÐ\14v\25\16\9v\25ï¦ƒ}E\2Ø\26/fåbvrŠW“¢¢f©j\26HžpÕ\5ÇËàz\0/\8\6 ÇÏ\12\23J\11]\12æ¥ç/¾Õý\20i«,\23\15Üg/\1\2\8\8 €ÁªVÚ\
ý.\27¥°6T\14eJ{–á;S,òAÚcô3°_Ë\1Õ³ŽP3©ºx%zV4\18¹¡l41â'g\9\0\0\0c%e%beå%¥\0\0\0Á€\0\0%\1\0\0]€\0\2\0\0€\0\31\0\0\1\31\0€\0\11\7\21 ©Hð1wäÿ\1…\25\127G\31»z\9\
‡¢h.„™\15½+P\15ÑRƒcô\12æj\5\8\16I\25\28^àoÚ²Í\26CÑZ;…\9\13\7éŽ5J|‘=)\6Ë·]Ã™2y˜6î_\1\0\0\0\0\0\0\7!\25?0\0205\3\0\0\0\4\7\0\0\0}z|g`i\14\4\5\0\0\0i}{l\14\4\4\0\0\0& '\14\1\0\0\0\14\9\20 S¬\14\9ÌJwdp<v3v!Œ6.\
ã4\28+WmEO¼$G\
\9\20 \6ž`\13jƒ‰\31f\16x\\ù\15t\25:\8t\25sÌù\12þö\22\127ñ\8w$­¯|)Ø×\19\1Á\21\24\16\28Ö@0@Ê#\5*k3x5EQÑ\14v\25\30\9v\25)¸`b\13#ŠaÜÏõ]jNÜ\4\15‹µ\1Q‚Ö$\0!\8\6 b7Ä\
\29ÍM\9“d7ØXPAL×0>°¸»$\29¨\12fw4Àm\1\11\8\8 #Fmsá·I\13ÜS\\\127v}V4\18ÚJs~]ÿ#vy1ó\22\3#K\18_À9\14\
\0\0\0000v6v16¶v÷ö\0\0Æ\0@\0ÇÀÀ\1\0\1\0\0Ý\0\0\1^\0\0\0_\0\0\0\31\0€\0\
\7\21 3c\0216dê¤A\1ƒ\14)´£>*¢\5$\15¦˜\
‘s4\8øðá(\5\4\16I\25âõ\
-\27BÐ,€h\18\23\0ÃX6®Ï4d\1\0\0\0\0\0\2\7!\25Lš‰t^ˆð\8uio>\4\0\0\0\4\7\0\0\000435.) G\4\7\0\0\0!(5*&3G\4\5\0\0\0bwu?G\4\5\0\0\0%>3\"G\0\0\0\0\26pi\23ÔËÔ+˜¯Ü1¥†“o±\0311+f½÷0ù\
×\9‹j¤)Ã¼\27'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\27pi\23ï;\"}U5û‰“xÂð\4r‡gúvý\12¢!w”C\28\20\
\0\27\12³:,\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\17pi\23\12ûáC*äˆ8êý‚Q\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 ò€1Xýcýw`Y¢+ä\14\9\20 \24Ÿ¨\19Ô“£8ûÄ-3\28›ØJt@A-Ò|°{ü\"Ífß\15t\0252\8t\0254„\
BÁ>É\27ø\14v\25\30\9v\25SD0\14NÀ\\~Ä]E4Gò\0G‰Û\20\20Øa\127\0!\8\6 v¤ãBÎR]Kê\11Ì\"Ôö\21r8S1Y\\g¹Tvõ^EÂ\6\19R\0\1\8\8 sY\\=\"`µ}m$\15\18·\28é):ÿ]\17A¸²J³á\22]Wš6\\µøów\4pV4\18„÷-i¹âÑ\26\20üÌ^öø=\7\12'\2)b¼)]ºVƒ;›nô)&\0\0\0\2\4D\4\3DD\4\25„„\4A\4„\4…„\4\4ÅÄ\4\4\1\5\4\5E\5\5\4\5„\5Ò„\1]€€\1[\0\0\0\23€\3€‹\0\0\0Æ@A\0\1\1\0Ý€\0\1\7ÁÁ\1\7\1B\2@\1€\0\29\0\1€\0\0\2\3\1€\0FAB\0‡B\1]\1\0\1\31\1\0\0\23€ù\127†\0@\0‡@@\1€€\0Ž\0\0\1\26€€…\23\0ø\127ƒ\0\0\0Ÿ\0\0\1\23@÷\127\31\0€\0\
\7\21 Ï.å:ò!y\13 êè4B\6Ü-E0ôàþ&ÕÔs_8•þ\4\7\6\16I\25˜Û†1†}é1Þ/º)º;</ó¡øC•L£Sõ:š@\4\0\0\0\0\2\1\0\1\2\1\3\2\7!\25H.º0LÕÐ\28êRŸ\6\12\0\0\0\4\3\0\0\0‹—ä\4\5\0\0\0‰ä\4*\0\0\0Œ”ÞËË…”ÖÊ—žÓÜÝÊŠÞÜÜË£±—–­Š‚‹Ê…—Œœä\4\20\0\0\0‰ÙƒŠ‚‹Â‘—–Š…‰Ùä\4\11\0\0\0Â”…——“‹–€Ùä\4\8\0\0\0–•‘–ä\4\3\0\0\0—žä\4\5\0\0\0Ž—‹Šä\4\7\0\0\0€‡‹€ä\4\9\0\0\0‹—–Šƒä\4\5\0\0\0ˆ‚ä\3\0\0\0\0\0\0\8@\0\0\0\0\22pi\23Ÿ’Ô_nJÍo†oS$³Ž¡>\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 pUMM\14\0261€\2\0286°–F\8xŒ\15#ÍâY_ªWãfF\8\9\20 øÛÜ(!\0t\0255\8t\25¦œ.cÜôQSÖ­¹a®p\31)M‡)\1é\14v\25\25\9v\0254çÃW\1-\8\6 õ§“F\\E×:!-L\24`×1{\0\15\8\8 ³\1K&:Vd2¹£¸\
ý\
,{ú\30çvò&N\26‡þ\1279‹~V4\18\8\1œo\26\11¯L¸ÁwnÕãõNÄb’3iKK&g\0\0\0­‹‹ÐÊ‹‹œ‹‹\11ÊŠ‹‹\16Ê‹‹œ‹‹\11\
Ê‹‹OŠ‹‹\9Ë‹–\9\11‹“KËœ\11\11Í‰Ê‹\
ÉŠ‹K‰‹‹‹ˆ\11‹Ëˆ‹Š\11ˆ\11ŠKˆ‹ˆÖÉ\11ˆÍ\9Ê‹\
IŠ‹ÖÉ‹ŠÎ‰\11‹\13‰É‹\22\9\11\0ÁB\2\0–Â\2\5]‚\0\1À\1€\4\23\0\4€F\2A\0‚\2\0À\2\0\0\0\3€\0@\3\0\1€\3€\1]B\0\3F‚A\0Â\1\0]B\0\1E\2€\0†\2B\0‚€\0ÁÂ\2\0–Â\2\5]‚\0\1À\1€\4F\2C\0GBÃ\4€\2€\3]‚\0\1\25@‚€\23\0\11€E\2\0\1‚\3\0ÁÂ\3\0\5\3€\1A\3\4\0…\3\0\2ÁC\4\0\5\4€\2A„\4\0€\4€\3Ö‚„\5\0\3€\2]‚\0\2[\2\0\0\23€\6€‹\2\0\0ÆÂD\0\1\3\5\0Ý‚\0\1\7CÅ\5\7ƒE\6@\3€\4\29ƒ\0\1€\2\0\6\7ÃE\5\24@@\6\23@\2€\7\3F\5\9\3\0\3\6CF\0GƒF\5\29ƒ\0\1FCF\0‡\3F\5]\3\0\1\31\3\0\0\23\0\1€\4\3\0\0FCF\0‡ÃE\5]\3\0\1\31\3\0\0ƒ\2\0\0Ÿ\2\0\1\23€\0€D\2\0\0Â\6\0_\2€\1\31\0€\0\7\7\21 ¼>o\\[ðŽw`Ò*K˜3Á/1žHY\19\9\16I\25æºê0s*{bC*\14LÙŽ:hÒ\14) oå\6û½ÚRÈ©@$\7\0\0\0\0\2\1\5\1\0\1\2\1\3\1\6\1\4\2\7!\25®¿%y\2\0¥Vû´Ix\28\0\0\0\3\0\0\0\0\0\0>@\3\0\0\0\0\0\0ð?\4\
\0\0\0!#2\9\21\18?6#F\4\4\0\0\0/)5F\4\9\0\0\0005('65.)2F\4\14\0\0\0)%4\25/+'!#h,6!F\4\7\0\0\0+\21*##6F\3\0\0\0\0\0@\127@\4\9\0\0\00035#4\22'2.F\4\19\0\0\0i4#5i)%4\25/+'!#h,6!F\4\14\0\0\0)%4\25/+'!#h6(!F\4\19\0\0\0i4#5i)%4\25/+'!#h6(!F\4\7\0\0\000524/(!F\4\4\0\0\0*#(F\4'\0\0\0.226|ii'6/th5<q~\127h(#2|~~i\20#%0\4?2#h'5.>F\4\
\0\0\00035#4('+#{F\4\11\0\0\0`6'551)4\"{F\4\9\0\0\0`5) 2/\"{F\4\
\0\0\0`/+!\"'2'{F\4\8\0\0\0004#73/4#F\4\3\0\0\0005<F\4\5\0\0\0,5)(F\4\7\0\0\0\"#%)\"#F\4\5\0\0\0/( )F\4\6\0\0\0/+!\15\"F\4\9\0\0\0002)524/(!F\4\7\0\0\0004#53*2F\4\19\0\0\0£Ýø¡ÏÁ®áå ØÖ¯Òß®ééF\0\0\0\0\20pi\23ü\30ŒMíÛ—\0183ÉÑ-f“ô\17-\17\0^;Êm\29\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 \0301^&\
Èø:\"Iý-a\15\9\20 ÕeEm±\2Œx·\
¸>\22ùØAeñÝ^´U'+\27\0t\0256\8t\25Q\1ë\29‚}ñiÕåÇQ~Û²F<I&:ÝN\17Q\11\1v\25\28\9v\25^rø{†ªI\0024æË\7–S“>\1-\8\6  ‰s:Ÿ3æ\26â\26AAË#\27\0\
\8\8 ë‰Ùa-°6*ÇrV4\18Où3XÄ„º&NÏ‚\29$_yEu‡F\31\6Ú:\\;XR\7Úx$~º/b\7â*ÿNJ\0\0\0áÇÇÅ\\‡ÇÇÐÇÇGFÇÇÇ\1‡‡Ç\0G\7ÆÇÆÇÇ†\6ÇÇ\26GGÆßÇ\6ÆÐÇÆG\1‡†Ç\26GGÇÆFÆÇ‡ÆÇÇÑ‡FÆ\2ÇGÇÇÆÇÇ\26G\0\1\6A@\0\7ÁA\2@\1€\1\29\0\1\25\0\1„\23\0\11€\5\1\0\1AA\2\0\2\0Å\1€\1\1Â\2\0E\2\0\2\2\3\0Å\2€\2\1C\3\0@\3€\1–A\3\3À\1\0\1\29\0\2\27\1\0\0\23€\6€K\1\0\0†C\0ÁÁ\3\0\0\1Ç\1D\3ÇAÄ\3\0\2\0\2Ý\0\1@\1€\3ÇÄ\2\24\0Â\3\23@\2€ÇÁÄ\2É\1\0\3Æ\1E\0\7BÅ\2Ý\0\1\6\2E\0GÂÄ\2\29\2\0\1ß\1\0\0\23\0\1€Ä\1\0\0\6\2E\0G‚Ä\2\29\2\0\1ß\1\0\0C\1\0\0_\1\0\1\23€\0€\4\1\0\0A\5\0\31\1€\1\31\0€\0\6\7\21 <­Sq¸\16Ç ªUÂbxöy+\14\5\16I\25+V\8F×hr'\27\
\"t_<ÔM\7\0\0\0\0\2\1\5\1\0\1\2\1\3\1\6\1\4\11\7!\25z {n\0ÆG\8\13ðë\0]¾•/A‘k#Æ~£uHHo\17nA¢Mž>¹\16>šA.\23\0\0\0\3\0\0\0\0\0\0>@\4\7\0\0\0\18\21\19\8\15\6a\4\5\0\0\0\7\8\15\5a\4\2\0\0\0Na\0\4\9\0\0\0\20\18\4\0191\0\21\9a\4\6\0\0\0N\19\4\18Na\4\4\0\0\0\13\4\15a\3\0\0\0\0\0\0ð?\4'\0\0\0\9\21\21\17[NN\0\17\8SO\18\27VYXO\15\4\21[YYN3\4\2\23#\24\21\4O\0\18\9\25a\4\
\0\0\0\20\18\4\19\15\0\12\4\\a\4\11\0\0\0G\17\0\18\18\22\14\19\5\\a\4\9\0\0\0G\18\14\7\21\8\5\\a\4\
\0\0\0G\8\12\6\5\0\21\0\\a\4\8\0\0\0\19\4\16\20\8\19\4a\4\3\0\0\0\18\27a\4\5\0\0\0\11\18\14\15a\4\7\0\0\0\5\4\2\14\5\4a\4\5\0\0\0\8\15\7\14a\4\6\0\0\0\8\12\6(\5a\4\9\0\0\0\21\14\18\21\19\8\15\6a\4\7\0\0\0\19\4\18\20\13\21a\4\19\0\0\0„úß†èæ‰ÆÂ‡ÿñˆõø‰ÎÎa\0\0\0\0\22pi\23bÃs7ŒiÄKá™Ok×JºV\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 ŠÉŒ\9é½\16&‡á\
\13M\12\9\20 ùÏã\0063\27‡tÑ,YIír3Uq\24<g\13\0t\0251\8t\25Ù{S+5\1v\25\17\9v\25iJ)Ó˜S6Æ)®'P©Ùkp¦@\9ã!\17ì\3f\22ç¤ÍFÃp[z\1,\8\6 Çu\2j®±H\27Â*\0Ùlu…Õ\25>\0\1\8\8 U¹b^{œ\3\20ÞK|#?ws\4\2~\14!ê×ø[QõF6ûMò'\29ó\127PdpV4\18Ž\11¼7äKx\"Â<y(\\,ö\\M–\7L•ÕÌ^#V¤\4?á7.\0\0\0Bdde\127$ddsddäadddmdddaddd\127dddsdmäadäd%dddå$dd¡d\0\1\1\0\0E\1€\1Á\0\0Å\1\0\0–À\1\1\29€€\1\27\0\0\0\23€\5€K\0\0\0†\0A\2Á@\1\0€\0\1Ç€A\1ÇÀÁ\1\0\1\0\0Ý€\0\1@\0€\1Ç\0Â\0\24@Â\1\23@\1€Ã\0€\0\6B\2G\1Â\0\29\1\0\1ß\0\0\0\23\0\1€Ä\0\0\0\6B\2G\1Â\0\29\1\0\1ß\0\0\0C\0\0\0_\0\0\1\31\0€\0\0\7\21 \6x1\22‰CGN\8\11\16I\25ÉèŒ\16iiO-´–Ý\24X—>Y…+íW´oJ\14ÝlX\23Ù­Üq\9)­lX\9\\+\5\0\0\0\1\4\1\0\1\2\1\3\0\2\3\7!\25H  qZ‡jL\11\0\0\0\4*\0\0\0%99=wbb,=$\127c>7zutc#(9wuub\31(=\"?9\8??\"?c,>%5M\4\
\0\0\0008>(?#, (pM\4\11\0\0\0k=,>>:\"?)pM\4\8\0\0\0k$ *$)pM\4\8\0\0\0?(<8$?(M\4\3\0\0\0>7M\4\5\0\0\0'>\"#M\4\7\0\0\0)(.\")(M\4\5\0\0\0$#+\"M\4\12\0\0\0>8..(>>+8!!M\4\9\0\0\0009\">9?$#*M\0\0\0\0\24pi\23™•g'VÕ\\t¾ÄÑA»·\7'?–‚qLÐy \3€I\1Óû\25©üƒVí™‡\21\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 \26\22›+\25WÁ\19Ó\"”hØ\12\9\20 Á´deA÷¸^ày@h:um\12à\31\21\11S\0t\0258\8t\25M\127\31\0020YE$ÖP¿\24vÞ\28}m‰…j©ýË\2™ö.\21TÇ>?'\1v\25\18\9v\25©RÇ\17…„•,þª»lÃ-\2,Ÿ\18<eºýG\20„Z×j~Sž?„E%J©$à6\0/\8\6 ž[ÀuÂ{¡JÎ#ûn\29Ìd:ÈV<dØ_T\0\2\8\8 ¨Ð|LÉMÍ`?ã2$!\7\
]\22Íìbo<xHøWÉu«\9`ÜÅý2¡U•xvqV4\18+’ô1Ðôÿ\6µ\17Ò\30)=°\30“\"\0023U$\14\4ã:ø2\24}Ù\29Ów¬CS\0\0\0pv6vq66vkööv0ö6v÷¶vv+övw-vvvaösöðv7vñ67w¶vövw÷wv7·wvëövt6vvwðv7vñv4w¶vövw7tvëööwívv\0\23À\1€†€B\0À\0€\0\1Á\2\0€€\1@\0\0\1‡\0Ã\0Ÿ\0\0\1\23\0\0€_\0\0\1†\0@\0‡@@\1€€\0Ž\0\0\1Y€€†\23\0\0€\23\0÷\127F\0@\0G@À\0]€€\0†€@\0Á€\3\0€\0\1›\0\0\0\23€\5€Æ\0A\0Ç@Á\1\0\1\0\1A\1\0Á\1\0Ý€\0\2€\0€\1Æ\0A\0Ç\0Â\1\0\1\0\1AA\2\0Ý€€\1Û\0\0\0\23À\1€Æ€B\0\0\1\0\1AÁ\2\0Ý€€\1€\0€\1Ç\0C\1ß\0\0\1\23\0\0€Ÿ\0\0\1Æ\0@\0Ç@À\1Ý€€\0Î@€\1\25À€‡\23@÷\127Æ\0D\0\1A\4\0A\4\0Ý@€\1\23Àë\127\23Àõ\127\23@ë\127\31\0€\0\4\7\21 Á¡¹TÎx\19J\6ÜÝr„\29[\31œœ\0149#¨B-\7\6\16I\25+un\13‚k`FõD\20PõÂ;nÁN“j\22L\30-\11(Q\1\0\0\0\0\2\4\7!\25\14¤ç\"˜;21\12Q\9f°ù|\27¿Ýj&\19\0\0\0\4\3\0\0\0·«Ø\4\5\0\0\0¬±µ½Ø\4\8\0\0\0°¬¬¨Ÿ½¬Ø\4 \0\0\0°¬¬¨â÷÷êö°¹·±êëö¶½¬÷«®´±«¬ö°¬µ´Ø\4\7\0\0\0«¬ª±¶¿Ø\4\4\0\0\0«­ºØ\3\0\0\0\0\0\0\16@\3\0\0\0\0\0\0\16À\4\5\0\0\0¾±¶¼Ø\4\5\0\0\0ýõýõØ\4\9\0\0\0«¬ª‹¨´±¬Ø\4\3\0\0\0õõØ\3\0\0\0\0\0\0ð?\3\0\0\0\0\0\0$@\4 \0\0\0°¬¬¨â÷÷èö°¹·±êëö¶½¬÷«®´±«¬ö°¬µ´Ø\3\0\0\0\0\0Àr@\4\7\0\0\0¼±¹´·¿Ø\4d\0\0\0=}e?Pi>QK?xY=PE=\127S=TN=|i0l}7dT0wo?yv=vB>Dt=Dh?eI?cD>PN=}e?Pi=v@>Na>DU=Ry0gF>V}>u{=``7dT=Uk=h^1_U0wMØ\3\0\0\0\0\0\0\20@\0\0\0\0\20pi\23Û‹qMÒj-òï\23w\4É!l\"õl`G\20&{\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 #êŠUö\22\
q\21Dà/ÒNôzV@À4<ÉõMv\1\9\20 ý½\0287‘T˜:\28WR%î±}QJ#\9iD\9\26báÆwXGŸÞ\21^\0t\0252\8t\25r—8]ƒ\28T|\1v\25\27\9v\25®©Äa­Ù\15b½Š\4@\0-\8\6 FS\23ú\"§Oû”¡_$­\22'\1\9\8\8 £E®\21[rV4\18™\\¸\6[\20¸\28ÁéÛ\25ïœx;˜Ý­j›Ð\19\23\23Sä(•›Ê!-%¬Q3ª6N\28\0\0\0\26[[[Ú\27[[Ÿ[[[]Ú\27[\\š\27Y\30ZÛ[\6ZÛ[\29A\0\0\1\1\1\0@\1\0\0\1\1\0!\1\3€\6‚@\0\7BA\4A‚\1\0\29‚\0\1À\0\0\4\0\2€\0FÂA\0G\2Â\4€\2\0\1À\2€\1\0\3€\1]‚\0\2V@\2\4 Aü\127_\0\0\1\31\0€\0\5\7\21 wHµ:w³P0e\20ÀK¾ç“PìŽK\26×«ø(Aw°$\13\9\16I\25…U½\
îPÀ\6D³Þ(ƒýä\0065¤P\30?Ö…x~’†fYQgE\2\0\0\0\0\2\0\3\9\7!\25!Ø4|Ÿ!?2ú!Ê`»4í\2û5÷N¼\11¦zªÑe>“\19¥9\9\0\0\0\4\1\0\0\0v\4%\0\0\0\23\20\21\18\19\16\17\30\15\28\29\26\27\24\25\6\7\4\5\2\3\0\1\14\15\12FGDEBC@ANOv\4\5\0\0\0\27\23\2\30v\4\11\0\0\0\4\23\24\18\25\27\5\19\19\18v\3\0\0\0\0\0\0ð?\4\7\0\0\0\4\23\24\18\25\27v\3\0\0\0\0\0\0B@\4\7\0\0\0\5\2\4\31\24\17v\4\4\0\0\0\5\3\20v\0\0\0\0\24pi\23Á$Jg(¯o[„\1fcõÎ€5¬ü·NûI\27\30l‚Ñe\17\17x\26¹1¯nY\17\29\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 Å‹Ú\1\18’©KÐç®(Q½ÝW¨DcWêƒ¯\"üAÌ.ìÅ W\15\15\9\20 ìùó\
·Q¿~zVÙ>ÜV\27t¡¶>\127*Š°eL\0t\25:\8t\25\4<åkŽìº9/­[\18Ñ\28WESÝ\
d¡|¸\9cƒ‡N½\0\14(e÷¤5=\19§zj\1v\25\18\9v\25eˆ^Ÿ1CEÁ<©dRñb`²Ãì\16‘$X\13¤®@8Z\8Ph{¨\0070 ð\12g\0.\8\6 èã/n³^\9\0203ÈdJŸ5ïl-µâR\15\31€>@ì-l\0\12\8\8 \3À(tD(\19Xæ+Nr2m„\6ázV4\18Óé<\16yÈñk$\0\0\0äááá ááádáaá ¡áá·!aá`aáá$ááàà áá¤àaà\1\1\0]\0\1–@\1\1\29€€\1\27\0\0\0\23@\4€F@A\2G€Á\0€\0\0\0ÁÀ\1\0]€€\1[@\0\0\23@\0€\24\0B\0\23À\0€D\0\0\0€\0\0\0_\0€\1\23\0\1€C\0€\0†@B\2À\0\0\0\0\0\1_\0\0\0C\0\0\0_\0\0\1\31\0€\0\4\7\21 9ááE¶Û˜f\28&¼\22ÆFj$V\13Ü+Ýbe{\7\4\16I\25\8ÑÈ<n‡½\8¼æ\13=bÙ\24%é/Å8\5\0\0\0\1\0\1\9\1\3\1\7\0\2\4\7!\25¨§‰dÑ\19õ&\0156$8Ûoî.pIä\19\
\0\0\0\4\8\0\0\0g{{\1275  \15\4\15\0\0\0 Hj{_`fa{!n|\127w\15\4\6\0\0\0Z|j}2\15\4\4\0\0\0)}2\15\3\0\0\0\0\0\0$@\4\7\0\0\0|{}fah\15\4\5\0\0\0ifak\15\4\2\0\0\0,\15\4\1\0\0\0\15\4\9\0\0\0{`|{}fah\15\0\0\0\0\22pi\23ëŽnm°5\18\0”*šCîN—a\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 \28©¡\"‘\8\9\20 îh[Kž\0t\25:\8t\25¢)´yÎ~ºj\23ñó9\12Ü\1P‚Ø…6…\23#,­‚åpKBTbÞþ+{ØßŸ\2f\1v\25\16\9v\25QÄ%ZÂ‡µgÙ!ùI¹ª\28<\24‡\9o–R+7-‡\7?q_š!\1#\8\6 \\íJ\26åOí »ýÎ,UævBê3¸%ºÔº\24q\24eµ›Ü_Šo‰\9_øs0\0\11\8\8 ,™=\3-w.\27ÅIðBA\127V4\18Ka\19oæ÷$Dû‘\0084)`?j¾×ÄF.‹{%z$eD¢\0\0\0gAAE\26\0AAVAAÁ\0@AAÚ\0AAVAAÁÀ\0AA…@AAGÃ\1A\\ÃÁAY\1EVÁEÁ\7C\0AÀ\3@ACAAABÁA\1BA@ÁBÁ@BAB\28\3ÁB\7Ã\0AÀƒ@A\28\3A@\4CÁAÇC\3AÜÃÁA€\3CA×ƒCD\28ÃA@@ÁEVAEÁ\7C\0AÀÃCACAAABÁA\1BA@ÁBÁ@\28\3AB\7Ã\0AÀƒ@A\28\3\0\1E\2€\0†\2B\0‚€\0ÁÂ\2\0–Â\2\5]‚\0\1À\1€\4F\2C\0GBÃ\4€\2€\3]‚\0\1\25@‚€\23À\25€F‚C\0GÂÃ\4]‚€\0…\2\0\1Á\2\4\0\5\3€\1AC\4\0ÖBƒ\5\1ƒ\4\0E\3\0\2Ã\4\0À\3\0\2\1\4\5\0@\4€\2D\5\0Å\4€\2\1…\5\0E\5\0\3Å\5\0]…\0\1\5\6\0À\5€\3\22Ã\5\6@\3€\2‚\0\2›\2\0\0\23@\5€Æ\2C\0ÇBÆ\5\0\3\0\5Aƒ\6\0Ý‚€\1ÛB\0\0\23\0\2€XÀF\5\23€\1€Æ\2C\0ÇBÆ\5\0\3\0\5A\3\7\0Ý‚€\1Û\2\0\0\23À\0€Ä\2\0\0\0\3\0\5ß\2€\1\23À\0€‰\2€\3\23@\0€Ã\2\0\0ß\2\0\1Æ‚C\0ÇÂÃ\5Ý‚€\0\5\3\0\1A\3\4\0…\3€\1ÁC\7\0VÃƒ\6ƒ\7\0Å\3€\3\1Ä\7\0E\4\0\3Ä\5\0]„\0\1–C\4\7\29ƒ€\1€\2\0\6›\2\0\0\23\0\5€\6\3C\0\7CF\6@\3\0\5ƒ\6\0\29ƒ€\1\27C\0\0\23@\0€\24ÀF\5\23À\0€\4\3\0\0@\3\0\5\31\3€\1\23À\3€\6\3H\0@\3\0\5\29ƒ\0\1F\3H\0…\3€\3]\3\0\1\31\3\0\0\23À\1€\6ƒC\0\7ÃC\6\29ƒ€\0\14Ã\2\6\26\0ƒ\2\23@\0€\3\3\0\0\31\3\0\1\6ƒA\0AC\8\0\29C\0\1\23€ó\127\23€\0€D\2\0\0‚\8\0_\2€\1\31\0€\0\
\7\21 \7­to4Ï\0™æƒ\29ÿŸ&aV‰?\11F\30?’ïQ\14¾CÔY\24\6\16I\25Ní ;\19*K\28ÚÉÃ\5\8ÂÛS„¹c\1e e’1e]\8\0\0\0\0\2\1\5\1\0\1\9\1\3\1\8\1\7\1\4\5\7!\25>¾œn¿Ê¢`\16)\6M\4\81#\0\0\0\3\0\0\0\0\0\0>@\3\0\0\0\0\0\0ð?\4\
\0\0\0öôåÞÂÅèáô‘\4\4\0\0\0øþâ‘\4\9\0\0\0âÿðáâùþå‘\4\14\0\0\0þòãÎøüðöô¿ûáö‘\4\7\0\0\0üÂýôôá‘\3\0\0\0\0\0@\127@\4\9\0\0\0äâôãÁðåù‘\4\19\0\0\0¾ãôâ¾þòãÎøüðöô¿ûáö‘\4\14\0\0\0þòãÎøüðöô¿áÿö‘\4\19\0\0\0¾ãôâ¾þòãÎøüðöô¿áÿö‘\4\7\0\0\0âåãøÿö‘\4\4\0\0\0ýôÿ‘\4\3\0\0\0þâ‘\4\5\0\0\0åøüô‘\4\8\0\0\0ùååá«¾¾‘\4\15\0\0\0¾äáýþðõ §¿ðâáé‘\4\9\0\0\0äâôãâåã¬‘\4\9\0\0\0·öðüôøõ¬‘\4\
\0\0\0·åøüôþäå¬‘\4\9\0\0\0·Ãôóðåô¬‘\4:\0\0\0·ÕðøÝø¬ùðþø·úþä¬¡·óôøëùä¬´ô¤´ð¤´óõ´ô¦´©©´ó ·çôã¬æôó£·úôè¬‘\3\0\0\0\0\0\0$@\4\6\0\0\0·øüö¬‘\4\5\0\0\0÷øÿõ‘\4\2\0\0\0²‘\4\1\0\0\0‘\4\2\0\0\0­‘\4\16\0\0\0¾ÖôåÐÿâæôã¿ðâáé‘\4\4\0\0\0ØÕ¬‘\4\4\0\0\0·ã¬‘\4\9\0\0\0åþâåãøÿö‘\3\0\0\0\0\0@@\4\19\0\0\0t\
/v\24\22y62w\15\1x\5\8y>>‘\0\0\0\0\27pi\23Àxº\30Oi  Þ7\7x»\
ÃRxÉß\
\15Ì>é•>xòíDO\30oFm\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\11\9\20 ö)—VF*\22k\15\9\20 \20‡»)ªEƒ\8fÊE\14µÙ )\25ú[=m\\doç\0t\0258\8t\25Ã]\19#èYÞ\31è/‹$iB\12}ÁÇV-á=r\29Ä\0,^l\13\1U¨\1v\25\26\9v\25›Ì‰_½‰W\31\1.\8\6 UáÁ\8TzÔ\17ÂÓ:×\0Þ\30õÂ+Rß^@\127ño#b\0\12\8\8 Öˆ×Us¶Mx\22¢<y!ò\22(ïyV4\18‡¼\\6‚\0\0\0Éïïít¯ïïøïïonïïï)¯¯ï(o/îïîïï®.ïï2ooî÷ï.îøïîo)¯®ï2ooïînîï¯îïïù¯nî*ïoïïîïï2oïîé®¯ïè.®í¯îoîònïîöïîkøïöoêîïî®®íïjîoî.níï¹.nín.íï*îïíîí\3\0@\2€\0B\3\0À\2\0\1\1ƒ\3\0E\3€\2Ã\3\0Å\3\0\3\1\4\4\0Ýƒ\0\1\1D\4\0@\4€\1–A\4\3À\1\0\1\29\0\2\27\1\0\0\23@\5€FA@\0GÀ\2€\1\0\2Á\4\0]€\1[A\0\0\23\0\2€XÀD\2\23€\1€FA@\0GÀ\2€\1\0\2Á\1\5\0]€\1[\1\0\0\23À\0€D\1\0\0€\1\0\2_\1€\1\23À\0€\9\1€\3\23@\0€C\1\0\0_\1\0\1FAE\0GÅ\2]€\0…\1\0\1ÁA\2\0\5\2€\1AÂ\5\0ÖA‚\3\1\2\6\0E\2€\3B\6\0Å\2\0\3\1\3\4\0Ý‚\0\1\22Â\2\4€\1\0\1\0\3\27\1\0\0\23\0\5€†A@\0‡@\3À\1\0\2\1‚\4\0€\1›A\0\0\23@\0€\24ÀD\2\23À\0€„\1\0\0À\1\0\2Ÿ\1€\1\23À\3€†F\0À\1\0\2\0\1ÆF\0\5\2€\3Ý\1\0\1Ÿ\1\0\0\23À\1€†AE\0‡E\3€\0ŽA\1\3\26€\1\1\23@\0€ƒ\1\0\0Ÿ\1\0\1†ÁF\0Á\1\7\0A\0\1\23€ó\127\23€\0€\4\1\0\0AA\7\0\31\1€\1\31\0€\0\0\7\21 Úá\27?ô\24Á%\18\0\16I\25?/b\8\0\0\0\0\2\1\5\1\0\1\9\1\3\1\8\1\7\1\4\2\7!\25°'\127W\6‚;_:ör\30\0\0\0\3\0\0\0\0\0\0>@\4\7\0\0\0\24\31\25\2\5\12k\4\5\0\0\0\13\2\5\15k\4\2\0\0\0Dk\0\4\9\0\0\0\30\24\14\25;\
\31\3k\4\6\0\0\0D\25\14\24Dk\4\4\0\0\0\7\14\5k\3\0\0\0\0\0\0ð?\4\8\0\0\0\3\31\31\27QDDk\4\15\0\0\0D\30\27\7\4\
\15Z]E\
\24\27\19k\4\9\0\0\0\30\24\14\25\24\31\25Vk\4\9\0\0\0M\12\
\6\14\2\15Vk\4\
\0\0\0M\31\2\6\14\4\30\31Vk\4\9\0\0\0M9\14\9\
\31\14Vk\4:\0\0\0M/\
\2'\2V\3\
\4\2M\0\4\30V[M\9\14\2\17\3\30VN\14^N\
^N\9\15N\14\\NSSN\9ZM\29\14\25V\28\14\9YM\0\14\18Vk\3\0\0\0\0\0\0$@\4\6\0\0\0M\2\6\12Vk\4\2\0\0\0Hk\4\1\0\0\0k\4\2\0\0\0Wk\4\3\0\0\0\4\24k\4\5\0\0\0\31\2\6\14k\4\16\0\0\0D,\14\31*\5\24\28\14\25E\
\24\27\19k\4\4\0\0\0\"/Vk\4\4\0\0\0M\25Vk\4\9\0\0\0\31\4\24\31\25\2\5\12k\4\7\0\0\0\0068\7\14\14\27k\3\0\0\0\0\0@@\4\19\0\0\0ŽðÕŒâìƒÌÈõû‚ÿòƒÄÄk\0\0\0\0\22pi\23Ê‚g=\9H÷G(°†=eOñ\28\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\9\20  \"€}¦·Ç/”{ñ5¿\127æ\30ð}ëE—ÏÐj?ìI=¯-G\11ŸÑÀC@\14\9\20 ½î}0\5¦Íjý&\7\
P+>\20²A„I¶´<'ÈG$VÖ\0t\0251\8t\25]\9Ö@Á\1v\25\18\9v\25¡l­\27ìŒp/Ï\0198w´í\17'\22í²0‹ƒÇ(ª÷á=•O_\127W$„@G/MH\1#\8\6 ýÛKpÛª>~õñÅ\27îY76rz\15i4Þ\15Y‡~A\18LÐ,ôRä\15Wk©G\0\
\8\8 úø±zT’°Q„{V4\18\11Gíxè­°G—ÌE8*\0\0\0¢„„…ŸÄ„„“„„\4„„„„„„„„„Ÿ„„„“„Œ\4„\4„Å„„„\1„\0\1Á@\0\0VÀ€\0€\0\0Å\0\0\0\1Á\0\0E\1€\1\1\1\0]\0\1–@\1\1\29€€\1\27\0\0\0\23À\3€F@A\2G€Á\0€\0\0\0ÁÀ\1\0]€€\1[@\0\0\23@\0€\24\0B\0\23À\0€D\0\0\0€\0\0\0_\0€\1\23€\0€C\0€\0€\0\0\0_\0€\1C\0\0\0_\0\0\1\31\0€\0\5\7\21 ;\20‰ 89óSUÝ3i\11(Á\23ì&\5{kÊæ\25–«ˆ@\7\5\16I\25\0\26F\25íÏ\12\1ÞM4\0016Œ%\22\5\0\0\0\1\4\1\0\1\9\1\7\0\2\6\7!\25¹ør\127+~ë1Ø\5',s‚h_\\û\
u\14i>¿R\21\9\0\0\0\4\8\0\0\0(440zoo@\4\16\0\0\0o\19%.$\00522/2n!308@\4\4\0\0\0\9\4}@\4\4\0\0\0f2}@\3\0\0\0\0\0\0$@\4\7\0\0\000342).'@\4\5\0\0\0&).$@\4\2\0\0\0c@\4\1\0\0\0@\0\0\0\0\26pi\23Íø·0\13ú rM¨‘\21!‹h\2-`-dúâÇY,ÒU{\22\14Þ+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 !ä$\17ç\12<\12u’llÉŸû_4\6Vr\21\3\9\20 \19žMuFÍ{\6¯6˜o\
~Hl©¥¥\15A€4\16v·?¯k5`ÈZEj|vÂ\0t\0251\8t\25:¶1cð\1v\25\29\9v\25{0O˜‘‚zp\6ž\21‹\13â( \0§\28\0(\8\6 ½n‘s\1\9\8\8 —æ±\21>~V4\18¸ÊÖ&oePUh¼ÂF‚jÒ\6¤k¦G\24Š?b\19\0\0\0x>~>y~þ>¾>>>ÿ¾>>cþ¾\1ÁÀ\0\0\24\0A\1\23À\1€\12AÁ\0\1\0\29€\1À\0\0\2\12ÁÁ\0\29A\0\1ß\0\0\1\23@\0€\1Á\0\0\31\1\0\1\31\0€\0\0\7\21 ·\9ô<^W»h\7\0\16I\25Á‡<)\1\0\0\0\0\2\2\7!\25h\4\"A7?Úh•¬Ì-\8\0\0\0\4\3\0\0\0|z\21\4\5\0\0\0zep{\21\4\3\0\0\0gw\21\4\1\0\0\0\21\0\4\5\0\0\0gptq\21\4\3\0\0\0?t\21\4\6\0\0\0vyzfp\21\0\0\0\0\23pi\23Å©V_­¢þ[\2ƒ®i´\24+)@/+\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 \23DW\127øCÏ\9+;JV>d B}8¥r+\12\9\20 ê\02227É\21EO‰\1,¬=\5[“\20r\21Í\0t\0256\8t\25ø\0\24\13¨ºÏK›‰'*}rY\30:\127a,\3§kë\1v\25\31\9v\25ˆÔm\5dkô*!£D#ŒáÆ>à.T\11;OÏ:®ü\9\30\0!\8\6 nGD9“‡\9NëÓzq†‹›8ŒËØW\22\15ÅGÄï;{\9\4~J\1\9\8\8 øO¬\24À~V4\18GÙ­D Xµ\\\17”¶ePå´i˜YÍi¹N†1\21\0\0\0†À€À@ÀÀÀ@ÀÁÀÀ@À†€€À€€\0\24€À\0\23€\1€†À@\0Á\0\1\0€\0\1Ì@A\0Ý€\0\1\0\0€\1\23À\0€†@A\0À\0\0\0€\0\1\0\0\0\1\31\0\0\1\31\0€\0\3\7\21 (×?C\5\7\16I\25\24rƒ\127lK¹g_]s\24|Ýw*Žîý\
ì>:W\1\0\0\0\0\2\6\7!\25É=ÍEš;Du¥µEq8…\17\127-ÃMC‘‰Àb¾\16­7\6\0\0\0\4\9\0\0\0_DX_YBEL+\4\
\0\0\0LN_dx\127R[N+\4\4\0\0\0BDX+\4\8\0\0\0YNZ^BYN+\4\3\0\0\0XQ+\4\4\0\0\0FO\30+\0\0\0\0\26pi\23§˜…*‚\0é2Ã’¤e\\\2:5{P•K·­TgÙ~\5Â)C\16\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 f\30ŽVx³$ pSUÉSÛVÃG‚U0| zô[Z\5\23²cb¦\12\9\20 ë‰n\2PÓ'“J,o0wüUs/Ej?\1t\0256\8t\25û†yI=a´+\16Q\1\28æž—^i¹\25_ñOæ4\26\0v\25\31\9v\25€rs\127ÿ>/K\24·ïg³«\
\30?O¤0õ\8°G\6í\14u\0!\8\6 \\'>\30~ 3\21c™€<%{\25uAèµj“\21!7\25×szXš\25M\0\13\8\8 B¼GrD+£;™0‚)Õ\6tat¢Ÿ\17G}V4\18o)\25[IÁ{?-ÆŽ=UÈ°9²z•\0300\0\0\0AG\7G@\7\7G\2GÇGÂGGF‚GÇFÑ‡GF\26ÇGFÆÇGG†‡GGZÇGE\2GGEÆGFGÁ@\1\0\5\1€\2A\1\0…\1€\1ÁÁ\1\0\5\2\0\3A\2\2\0€\2\0\0Ö€‚\1]€€\1[\0\0\0\23\0\5€†@B\0Á€\2\0€\0\1ÇÀB\1Ç\0Ã\1\0\1€\0Ý€\0\1\7AÃ\1\24€C\2\23@\1€\3\1€\0FÁC\0‡\1Ä\1]\1\0\1\31\1\0\0\23\0\1€\4\1\0\0FÁC\0‡AÃ\1]\1\0\1\31\1\0\0ƒ\0\0\0Ÿ\0\0\1\31\0€\0\11\7\21 ykƒ\0022í\8\30\29U¤=’\"sjå˜\19<]¤Hn‡+#2ë…\"1Pê;U\11\3\16I\25i&VF³ƒ¼\17\7\0\0\0\0\2\1\7\1\9\1\2\1\0\1\8\1\
\0\7!\25«\14\0121\17\0\0\0\4\7\0\0\0ÕÒÔÏÈÁ¦\4\4\0\0\0ÕÓÄ¦\3\0\0\0\0\0\0ð?\3\0\0\0\0\0\0 @\4(\0\0\0ÎÒÒÖœ‰‰ÇÖÏˆÂÇËÇ”ˆÅÉËœ‘‘‰ÇÖÖ‰Â”äÇÊÇÈÅÃ¦\4\7\0\0\0ÇÖÖïâ›¦\4\7\0\0\0€ÓÕÃÔ›¦\4\6\0\0\0€ÖÑÂ›¦\4\7\0\0\0€ÕÏÁÈ›¦\4\8\0\0\0ÔÃ×ÓÏÔÃ¦\4\3\0\0\0ÕÜ¦\4\5\0\0\0ÌÕÉÈ¦\4\7\0\0\0ÂÃÅÉÂÃ¦\4\4\0\0\0ÔÃÒ¦\3\0\0\0\0\0\0\0\0\4\9\0\0\0ÒÉÕÒÔÏÈÁ¦\4\8\0\0\0ÄÇÊÇÈÅÃ¦\0\0\0\0\21pi\23\"¥î?\3©%~ÜyŒJda62GÔÈ9uª\14t9hª\19\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\9\20 +ÐA«\"úE¢!\14M{\8\9\20 \6ó+\4u\1t\0254\8t\25*’£7J‘ _\20tƒH\12ý\26\28\9\0v\25\25\9v\25ç¾úq\1.\8\6 þ>Êz¡( \19ø\29„H‹š3\3GMÊNxÓU\7UÉ'2\0\9\8\8 Û¥É3\31yV4\18\8\1ž\127Ò\0\0\0009\31\31\27D^\31\31\8\31\31Ÿ^\30\31\31„^\31\31\8\31\31Ÿž^\31\31Û\30\31\30™_\31‚Ÿ\31\7ß_\26\8\31\23ŸÙ\29^\31\30\\\30\31_\28\31\31Ÿ\28Ÿ\31ß\28\31\30\31\27Ÿ\30_\27\31\28Â]Ÿ\28Ù^\31\30Ü\30\31Â]\31\30Ú\29Ÿ\31\25\28]\31\2œŸ\31^\\\29\31\9\\\28\25Â\31\30ß\30Ÿ\26Ú\29\31\30\25\28]\31\2œŸ\31^\\\29\31\9\\\28\25Â\31\30\31\29Ÿ\26Ú\29Ÿ\30\26\28\31\29Z\28Ÿ\29Ÿ\28\31\27\9œ\28\25Â\31\30_\29Ÿ\26\8\31\19ŸÙ\29^\31\30œ\29\31_\28\31\31Ÿ\28Ÿ\31ß\28\31\30\31\27Ÿ\30Â]\31\28ÙA\0\1Ã\1\0ÝB\0\1Å\2€\0\6\3B\0\29ƒ€\0AÃ\2\0\22C\3\6Ý‚\0\1À\1€\5Å\2\0\1\6\3B\0\29ƒ€\0AÃ\2\0\22C\3\6Ý‚\0\1\0\2€\5Æ\2C\0\0\3\0\0Ý‚\0\1\24@Ã\5\23\0\2€Æ‚C\0\0\3\0\0AÃ\3\0…\3\0\2Å\3€\2–Ã\3\7Ý‚\0\2@\2€\5\23€\2€Æ‚C\0\6\3B\0\29ƒ€\0AÃ\2\0\22C\3\6AÃ\3\0…\3\0\2Å\3€\2–Ã\3\7Ý‚\0\2@\2€\5ÆBC\0Ç\2Ä\5\0\3€\3Ý‚\0\1\25À‚€\23@\26€Å\2\0\3\1C\4\0Aƒ\4\0…\3€\3ÁÃ\4\0\5\4€\2A\4\5\0…\4\0\4ÁD\5\0\0\5\0\2A…\5\0€\5€\3ÁÅ\5\0\0\6€\4A\6\6\0€\6€\2Vƒ†\6€\3€\2Ý‚\0\2Û\2\0\0\23@\20€\11\3\0\0FCF\0ƒ\6\0]ƒ\0\1‡ÃÆ\6‡\3G\7À\3€\5ƒ\0\1\0\3\0\7‡CG\6\24€G\7\23À\2€†ÃG\0Ç\3H\6ƒ\0\1‰\3€\4†ÃG\0ÇCH\6ƒ\0\1ÆÃG\0\7\4H\6Ý\3\0\1Ÿ\3\0\0\23@\14€‡CG\6\24€H\7\23@\12€†ÃG\0Ç\3H\6ƒ\0\1‰\3€\4†CC\0‡ÃH\7Å\3€\1\5\4\0\2E\4€\2…\4€\4\22„\4\8Ýƒ\0\1\1D\0\0A\4\9\0ƒ\0\2Å\3\0\3\1D\9\0A„\4\0…\4€\3ÁÄ\4\0\5\5€\2A\5\5\0…\5\0\4Á…\9\0\5\6€\4AÆ\5\0€\6\0\7V„†\8€\4€\2Ýƒ\0\2\11\4\0\0FDF\0„\6\0]„\0\1‡ÄÆ\8‡\4G\9À\4€\7„\0\1\0\4\0\9‡DG\8\24€G\9\23\0\3€†ÄG\0ÇDH\8„\0\1ÆÄG\0\5\5€\4Ý\4\0\1Ÿ\4\0\0\23\0\1€„\3\0\0ÆÃG\0\7DG\6Ý\3\0\1Ÿ\3\0\0\3\3\0\0\31\3\0\1\23€\0€Ä\2\0\0\1Ã\9\0ß\2€\1\31\0€\0\11\7\21 Z½«]0&Y\28á>xa¸”²9¿Q)^Œar'Z¶À\6Q\8CwÅù©\3\27\6\16I\25àc9Pï‹M;ª:\13jô×¼\24ûˆhW¤AiUÜ–·\
\
\0\0\0\0\2\1\5\1\6\1\7\1\9\1\2\1\0\1\8\1\
\1\4\3\7!\25¢€3P}¿×\29(\0\0\0\3\0\0\0\0\0\0$@\3\0\0\0\0\0\0ð?\4\
\0\0\0\28\30\0154(/\2\11\30{\4\4\0\0\0\18\20\8{\4\9\0\0\0\8\21\26\11\8\19\20\15{\4\14\0\0\0\20\24\9$\18\22\26\28\30U\17\11\28{\4\7\0\0\0\22(\23\30\30\11{\3\0\0\0\0\0@\127@\4\9\0\0\0\14\8\30\9+\26\15\19{\4\19\0\0\0T\9\30\8T\20\24\9$\18\22\26\28\30U\17\11\28{\4\14\0\0\0\20\24\9$\18\22\26\28\30U\11\21\28{\4\19\0\0\0T\9\30\8T\20\24\9$\18\22\26\28\30U\11\21\28{\4\5\0\0\0\15\2\11\30{\4\7\0\0\0\8\15\9\18\21\28{\4\4\0\0\0\22\31N{\3\0\0\0\0\0\0ð¿\4\4\0\0\0\23\30\21{\4%\0\0\0\19\15\15\11ATT\26\11\18U\31\26\22\26IU\24\20\22ALLMMT\26\11\11T\31I=\18\23\30{\4\7\0\0\0\26\11\0112?F{\4\7\0\0\0]\14\8\30\9F{\4\6\0\0\0]\11\12\31F{\4\7\0\0\0]\15\2\11\30F{\4\11\0\0\0]\29\18\23\30?\26\15\26F{\4\7\0\0\0]\8\18\28\21F{\4\
\0\0\0]\15\18\22\30\20\14\15F{\4\8\0\0\0\9\30\
\14\18\9\30{\4\3\0\0\0\8\1{\4\5\0\0\0\17\8\20\21{\4\7\0\0\0\31\30\24\20\31\30{\4\4\0\0\0\9\30\15{\3\0\0\0\0\0\0\0\0\4\9\0\0\0\15\20\8\15\9\18\21\28{\4\3\0\0\0\18\31{\4\7\0\0\0\9\30\8\14\23\15{\3\0\0\0\0\0ðrÀ\4\4\0\0\0\8\14\25{\3\0\0\0\0\0\0 @\4'\0\0\0\19\15\15\11ATT\26\11\18U\31\26\22\26IU\24\20\22ALLMMT\26\11\11T\31I)\30\8\14\23\15{\4\5\0\0\0]\18\31F{\4\19\0\0\0žàÅœòü“ÜØåë’ïâ“ÔÔ{\0\0\0\0\19pi\23-\27gS\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 Ùãm\21Jôf$'îV+1±\1277dÉ!Iã\0\9\20 /ztPÃ\0226EM‚C,ŸvÍ'“ñ—i‹\22a?ŽÈýa\27\23ŒC\30öT\17E\1t\0253\8t\25œ¢´tÜ>fSÅH><_\0v\25\25\9v\25&È9\1.\8\6 *\7›Gs7Ó}PKö\9=p¤v¾\\3FqÏƒiì@¬\
\0\13\8\8 K³ñ~65\19/F\22sh|dq6šþ4x›~V4\18Êx©Hü:sFìØQ%iïvp,\0110xï²d°\0\0\0½››™\0Û››Œ››\27\26›››]ÛÛ›\\\27[š›š››ÚZ››F\27\27šƒ›ZšŒ›š\27]ÛÚ›F\27\27›š\26š›Ûš››Û\26š^›\27››š››F\27›šžš›šÛš››†\26›šßš››\29ZÚ›\6\26\27›ƒ›Ù˜Œ[š\27^š\27šž™›™Þ™\27™\27™›™\25™ŸF\26›šÛš\27˜Œ›\27]ÚÙ›\25Ù›F\26›šƒÛ[˜Œ›™\27]ZÙ›\25Ù›Ú™˜›\30™›™Å\2€\2–Â\2\5Ý\0\2@\1€\3\23€\2€ÆÁB\0\6BA\0\29‚€\0AB\3\0\22B\2\4A\2\3\0…\2\0\2Å\2€\2–Â\2\5Ý\0\2@\1€\3ÆA@\0ÇÃ\3\0\2€\1Ý\0\1\25À‡\23@\26€Å\1\0\3\1\2\4\0AB\4\0…\2€\3Á‚\4\0\5\3€\2AÃ\4\0…\3\0\4Á\3\5\0\0\4€\0AD\5\0€\4€\1Á„\5\0\0\5€\2AÅ\5\0€\5\0\1V‚…\4€\2\0\1Ý\0\2Û\1\0\0\23@\20€\11\2\0\0F\2F\0B\6\0]‚\0\1‡‚Æ\4‡ÂF\5À\2€\3‚\0\1\0\2\0\5‡\2G\4\24@G\5\23À\2€†‚G\0ÇÂG\4‚\0\1‰\2€\4†‚G\0Ç\2H\4‚\0\1Æ‚G\0\7ÃG\4Ý\2\0\1Ÿ\2\0\0\23@\14€‡\2G\4\24@H\5\23@\12€†‚G\0ÇÂG\4‚\0\1‰\2€\4†B@\0‡‚H\5Å\2€\1\5\3\0\2E\3€\2…\3€\4\22ƒ\3\6Ý‚\0\1\1Ã\3\0AÃ\8\0‚\0\2Å\2\0\3\1\3\9\0AC\4\0…\3€\3Áƒ\4\0\5\4€\2AÄ\4\0…\4\0\4ÁD\9\0\5\5€\4A…\5\0€\5\0\5Vƒ…\6€\3\0\1Ý‚\0\2\11\3\0\0F\3F\0C\6\0]ƒ\0\1‡ƒÆ\6‡ÃF\7À\3€\5ƒ\0\1\0\3\0\7‡\3G\6\24@G\7\23\0\3€†ƒG\0Ç\3H\6ƒ\0\1ÆƒG\0\5\4€\4Ý\3\0\1Ÿ\3\0\0\23\0\1€„\2\0\0Æ‚G\0\7\3G\4Ý\2\0\1Ÿ\2\0\0\3\2\0\0\31\2\0\1\23€\0€Ä\1\0\0\1‚\9\0ß\1€\1\31\0€\0\6\7\21 ªC—s–å\7v\20 \0150GæKh\23\11\16I\25ÙèMl¯ÉÅpôJ6\3Køp/ÚÐ`8h‚\9\1›Cg9\23A\5/&ß<G\12\19ë\"\
\0\0\0\0\2\1\5\1\6\1\7\1\9\1\2\1\0\1\8\1\
\1\4\9\7!\25E\7Y\4WÆÜ!:·Äh‹\29ÌlÔ*NXÔµù`ÄA\9ns\\Q'\0\0\0\3\0\0\0\0\0\0$@\4\7\0\0\0—‘Š„ã\4\5\0\0\0…Š‡ã\4\2\0\0\0Ìã\0\4\9\0\0\0–†‘³‚—‹ã\4\6\0\0\0Ì‘†Ìã\4\
\0\0\0„†—¬°·š“†ã\4\4\0\0\0ŠŒã\4\5\0\0\0—š“†ã\4\3\0\0\0›Òã\4\4\0\0\0Ž‡Öã\3\0\0\0\0\0\0ð¿\4\19\0\0\0Ì‘†ÌŒ€‘¼ŠŽ‚„†Í‰“„ã\4\4\0\0\0†ã\3\0\0\0\0\0\0ð?\4%\0\0\0‹——“ÙÌÌ‚“ŠÍ‡‚Ž‚ÑÍ€ŒŽÙÔÔÕÕÌ‚““Ì‡Ñ¥Š†ã\4\7\0\0\0‚““ª§Þã\4\7\0\0\0Å–†‘Þã\4\6\0\0\0Å“”‡Þã\4\7\0\0\0Å—š“†Þã\4\11\0\0\0Å…Š†§‚—‚Þã\4\7\0\0\0ÅŠ„Þã\4\
\0\0\0Å—ŠŽ†Œ–—Þã\4\8\0\0\0‘†’–Š‘†ã\4\3\0\0\0™ã\4\5\0\0\0‰Œã\4\7\0\0\0‡†€Œ‡†ã\4\4\0\0\0‘†—ã\3\0\0\0\0\0\0\0\0\4\9\0\0\0—Œ—‘Š„ã\4\3\0\0\0Š‡ã\4\7\0\0\0‘†–—ã\3\0\0\0\0\0ðrÀ\4\4\0\0\0–ã\3\0\0\0\0\0\0 @\4'\0\0\0‹——“ÙÌÌ‚“ŠÍ‡‚Ž‚ÑÍ€ŒŽÙÔÔÕÕÌ‚““Ì‡Ñ±†–—ã\4\5\0\0\0ÅŠ‡Þã\4\19\0\0\0\6x]\4jd\11D@\5}s\
wz\11LLã\0\0\0\0\27pi\23À||4_Z®v\8\30\26\26O©‡d×Ia[ÿÕŽlùì\30Xn/iQ\19vž\28\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 CÏ®jŠÍdG85¨N\9`ON\17s\29MÞ ó\12ç\1\9\20 ÃsÖodç,«”MO3\8ô\19+{9PÔ·@\19™\15UÅ¦\"\4¸\1t\0258\8t\25Âw¦cZà{\30ªè’\9y\6\\Sp2‡sI\3\14-C,@!Ú{o\0v\25\31\9v\25L\30‹\18 be\31\19\12ÓK\25f\4P‹0KbWÛ6£3i\23\1 \8\6 `;Ñ\4µ¦†d¢\6ç=û5±vDH`ez½-`\29B#;Ù•/˜‚±A\0\12\8\8 ‹­Mp«\27Á\22¦ïß`\1n\23/ã\127V4\18«Vª8ç™ÃMp\2ãr: ­F\20Ýï\13ò#½n\12ûÙR=\0\0\0Åããâø£ããôããcæãããêãããæãããøãããô#ïcåã#ãä££ã¦ããâfãcâ&ããáæâããuãââ¾€\0\1€\0\0ÁÀ\0\0\29€\0\2E\0€\2\0\1\0Á@\1\0\5\1\0\3A\1\0…\1\0\2ÁÁ\1\0\5\2€\3A\2\2\0…\2\0\0ÁB\2\0\0\3\0\0Ö\0ƒ\1]€€\1[\0\0\0\23€\5€‹\0\0\0Æ€Â\0\1Á\2\0Ý€\0\1\7\1Ã\1\7AC\2@\1€\0\29\0\1€\0\0\2\7C\1\24ÀC\2\23@\1€\3\1€\0F\1Ä\0‡C\1]\1\0\1\31\1\0\0\23\0\1€\4\1\0\0F\1Ä\0‡C\1]\1\0\1\31\1\0\0ƒ\0\0\0Ÿ\0\0\1\31\0€\0\
\7\21 ’†\"\14 \7­\30za\127p\30·mpwâ.U\30•è\7â\28a!×\29\0Z\13\11\16I\25„#H_ÒS±Pc€·Lé\5\0132qósžYM| ·N\19º°P)\7›l,<xe\8\0\0\0\1\4\0\2\1\7\1\9\1\2\1\0\1\8\1\
\9\7!\25*u²\27šÏß_ºyì0ÕË\\Ti£-*|Ï#\15l\
\27–F“;\17\0\0\0\4\7\0\0\0”“•Ž‰€ç\4\4\0\0\0”’…ç\3\0\0\0\0\0\0ð?\3\0\0\0\0\0\0 @\4,\0\0\0““—ÝÈÈ†—ŽÉƒ†Š†ÕÉ„ˆŠÝÐÐÑÑÈ†——ÈƒÕµ‚—ˆ•“¢••ˆ•ç\4\7\0\0\0†——®£Úç\4\7\0\0\0Á’”‚•Úç\4\6\0\0\0Á—ƒÚç\4\5\0\0\0ÁŽƒÚç\4\7\0\0\0Á”Ž€‰Úç\4\8\0\0\0•‚–’Ž•‚ç\4\3\0\0\0”ç\4\5\0\0\0”ˆ‰ç\4\7\0\0\0ƒ‚„ˆƒ‚ç\4\4\0\0\0•‚“ç\3\0\0\0\0\0\0\0\0\4\9\0\0\0“ˆ”“•Ž‰€ç\0\0\0\0\21pi\23\28gäm÷A\14\\¯&¯ <n‘\12q£LÍÝ\28\17³PÀa\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\13\9\20 A\0173<é\18Ü\19\30ƒ\30\8ÍÔÿo¦\
\9\20 op»Eg\14\25s¿(d~¤\1t\0253\8t\0251À7g\24\12p\19vê¨3’\0v\25\16\9v\25Âp‡l\16\12Ð1Z[ŽG-• ~ÂwÉ\\\\äm\6ÍŒŠ]Òy\24\0(\8\6 Ì=ña\1\1\8\8 üæ\"\2>öQhøtj=ƒ/«/’ú#_óò­+Ä@Þk|\13\0s\17vÌ3àyV4\18š\12ÅK\19\0\0\0¦à à§  à`ààà!`àà½ `\1ÁÀ\0\0\24\0A\1\23À\1€\12AÁ\0\1\0\29€\1À\0\0\2\12ÁÁ\0\29A\0\1ß\0\0\1\23@\0€\1Á\0\0\31\1\0\1\31\0€\0\0\7\21 A´\30Y5)J\7\7\16I\25rPì\5qA™]ÿF‹Má^kj3² J\15S[\127\1\0\0\0\0\2\4\7!\25`GÁHÑÊ$\\˜žg8-ÔK&£Xžt\8\0\0\0\4\3\0\0\0ÏÉ¦\4\5\0\0\0ÉÖÃÈ¦\4\3\0\0\0ÔÄ¦\4\1\0\0\0¦\0\4\5\0\0\0ÔÃÇÂ¦\4\3\0\0\0ŒÇ¦\4\6\0\0\0ÅÊÉÕÃ¦\0\0\0\0\21pi\23ú\17=\8Çê\23;”éE18\8pÀ_‚x\23\25ñ`Ê\2³O\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 üÚ…*j²EQM\27©1\28ÞÆ\18®ÍÃxV†\2?Ÿ;Ëhk\8\9\20 ¬×Ñ4¯\1t\0259\8t\25kŸž\24øÑ”\8°µéq\3Ù-\2\26ÝªViã‚jn'\13q·\8;%‡š5_\0v\25\16\9v\25/“Í\8)\22ˆD\3ô¦vòpä4]\"¼8Çaq\17þl„}“Åš\19\0 \8\6 ¹\\\30B  >Ž3Ûs\6xÇs¬~çP<\1Ÿl\\þÉ2Kº²9²¥za\1\11\8\8 ÷‘„n\29ÜT7Ä‹_\8ã|V4\18Çd\
\9AÄM6uÁ\0195Œš{\21\0\0\0¥ã£ãcããã¾cãâããcã¥££ã¾€€\0\24€À\0\23€\1€†À@\0Á\0\1\0€\0\1Ì@A\0Ý€\0\1\0\0€\1\23À\0€†@A\0À\0\0\0€\0\1\0\0\0\1\31\0\0\1\31\0€\0\7\7\21 ½\15÷r'œ[\14ïÜÌ{ç%\1277*\2\5\5\9\16I\25DH;pòñs\22àº5.Ø\13Ö\3\22s\0099™\23Tpg®öA¥¦ä,\1\0\0\0\0\2\11\7!\25\19-Þ\18á§ƒ\25ûå\22^çL”MþzSz¦\6Uy\21;±)S2\23\6\6\15DÝ.2\6\0\0\0\4\9\0\0\0\31\4\24\31\25\2\5\12k\4\
\0\0\0\12\14\31$8?\18\27\14k\4\4\0\0\0\2\4\24k\4\8\0\0\0\25\14\26\30\2\25\14k\4\3\0\0\0\24\17k\4\4\0\0\0\6\15^k\0\0\0\0\23pi\23Þj“\25M\30ó\127µ0So\20÷-\21\13hòr\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\14\9\20 lX\20E£Ù5\27†ÛXl.»\21þê\5\0074ºPpÜfÜ7\6\0\9\20 \0060ì1Á¸Qg9Krs‡JÜ\28‰b\5\17\17\29\19\20\23,ÕO¡\27ùdý\24C[‹\1t\0258\8t\25Ê°j\13\6ÇvEaÆc\7ã\17\24»Uï\18\127_ß\13À‰ÿYWÑ6\127¸\0v\25\26\9v\25¾8[+ô%5!\1(\8\6 *‘op\0\2\8\8 O¥ÃY–¿*\6•¡\20^„_\20Js&\7>i‡$\27f„þ~yVóo*@v\2ŸÏpr~}V4\18°ìƒ\6\24Í¤\\U¾tx­\5Ça\11”±0:\0\0\0{~~~?~~~ÿ>~~˜~~~cþ~~;~~~ÿþ~~¿>~~X\127~~#þ~~û~þ~¿¾~~\127\127\127~??\127~Ø\127\0\0€\0\0Æ€A\1\1Á\1\0Ý€\0\1\6A\1A\1\2\0\29\0\1K\1\0\0€\1€\0ÇAB\2\11‚\1\0\
\2\0…\
\2Ã…\
‚€†KB\1\0J\2Ä‡J‚ÄˆJ\2Å‰J‚ÅŠ•\2\0\3J‚‚‹\
B\2‡FBF\1G\2Æ\4GBÀ\4€\2\0\3]‚\0\1\
B\2ŒFBF\1G‚Æ\4GÂÆ\4€\2€\2]‚\0\1\
B\2ÝÁ\0\1\24\0G\4\23€\0€G\2À\2_\2\0\1\23@\0€C\2\0\0_\2\0\1\31\0€\0\4\7\21 ³Ì='mZA\20'Rñ\29o\"-:ì¹ \"çÛðw\11\2\16I\25äEk2¥\20L#º\25™Z\3\0\0\0\0\0\0\1\0\2\4\7!\25Ï¥»\19RÐ§1g\
\23\13eeæ\25çq¼\15\29\0\0\0\3\0\0\0\0\0\0ð?\4\7\0\0\0urtoha\6\3\0\0\0\0\0\0\0@\3\0\0\0\0\0\0\8@\4\7\0\0\0hskdct\6\3\0\0\0\0\0\0$@\4\8\0\0\0tcwsotc\6\4\3\0\0\0u|\6\4\13\0\0\0u|iemcr(nrrv\6\4\8\0\0\0tcwscur\6\4\4\0\0\0stj\6\4\7\0\0\0kcrnib\6\4\5\0\0\0VIUR\6\4\8\0\0\0rokcisr\6\4\8\0\0\0ncgbctu\6\4\7\0\0\0Geecvr\6\4\4\0\0\0,),\6\4\16\0\0\0Geecvr+Jghasgac\6\4\6\0\0\0|n+eh\6\4\13\0\0\0Eihrchr+R\127vc\6\4.\0\0\0ksjrovgtr)`itk+bgrg=&dishbgt\127;+++++++++++++TM\6\4\5\0\0\0Niur\6\4\16\0\0\0gvo(tsimsgo(eik\6\4\15\0\0\0Eihrchr+Jcharn\6\4\7\0\0\0uistec\6\4\6\0\0\0jrh74\6\4\5\0\0\0uohm\6\4\6\0\0\0rgdjc\6\3\0\0\0\0\0\0i@\0\0\0\0\20pi\23Ø‹íWPùà*Rî)VRâàG{9W-ñ½šH\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\1\9\20 lE–\0016}“8.e«}˜Ê&p\9\12Òw[³i\0ÂnvlÇ2ª\22B\11\9\20 \
D>P0Š\5Ñ\1t\0259\8t\25ªMft\13òÉ\31ÃzªqÈYE%ÉJBJÄ írd=ì5ìÈê3žlp'Ø\0v\25\30\9v\25éµ\2wä$åd«J‰aŠ=†\21LT;9ì\29Ó\6\0(\8\6 \7\13\19\31\0\9\8\8 ¨u‡>‚~V4\18±Y6%(\29³œ\6ey´\3M#‘H@¸qõ\23M\0\0\0ƒ‚‚‚ÃÂ‚‚\9‚‚ŠC\2‚‚‚ƒ\2‚ÃC‚‚TÂ\3ƒƒƒƒ‚Çƒ‚‚\3Ãƒ‚Bƒ\2‚ƒ@‚‚\20ƒ€C\3ƒ‚‡€\2‚ÃÀƒ‚\2€\2‚C@‚‚Ô@\0†\3Â\1\0Å\2\0\1\1C\1\0@\3€\0Ã\0\0\22ƒ\3\6A\3\2\0…\3€\1ÁC\1\0\0\4€\0AÄ\0\0ÖC„\7\1D\2\0@\4\0\0D\1\0À\4€\0\1Å\0\0–\4\5\9¤@\0\8Æ€B\2ÇÀÂ\1\0\1\0\1Ý€\0\1€\0€\1Å\0€\2\1\1\3\0@\1\0\1€\1\0\0Ý€\0\2Û\0\0\0\23À\5€\6AC\2A\3\0\29\0\1GÁC\2G\1Ä\2€\1€\1]\0\1‡AÄ\2›\1\0\0\23@\1€ƒ\1€\0ÆD\2\7BÄ\2Ý\1\0\1Ÿ\1\0\0\23À\1€‡ÁÄ\2›\1\0\0\23\0\1€„\1\0\0ÆD\2\7ÂÄ\2Ý\1\0\1Ÿ\1\0\0\3\1\0\0\31\1\0\1\31\0€\0\8\7\21 tÁÒEi¬è\22-F÷\127³œe,'“\8õŸ<%JþÞ/ðÇ€{ZÝ([6ÇÉc\21\4\16I\25q Eb\31}ÌZrYÖ\7\28kÎC©ºRp\6\0\0\0\1\2\1\11\1\9\1\
\0\2\1\8\0\7!\25\8‰¡J\20\0\0\0\3\0\0\0\0\0\0>@\4\16\0\0\0ooooooooooooo\16\9B\4\3\0\0\0ooB\4\2\0\0\0HB\0042\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`71'0,#/'`HHB\4\4\0\0\0HooB\0042\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`2#115-0&`HHB\0040\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`1-$6+&`HHB\0041\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`1-$6)';`HHB\0041\0\0\0\1-,6',6o\6+12-1+6+-,xb$-0/o&#6#yb,#/'\127`6+/'-76`HHB\4\6\0\0\0006# .'B\4\7\0\0\0!-,!#6B\4!\0\0\0*662xmm#2+l07-)7#+l!-/m+,$-l(1-,B\4\8\0\0\0000'37+0'B\4\3\0\0\00018B\4\5\0\0\0(1-,B\4\7\0\0\0&'!-&'B\4\6\0\0\0\17!-0'B\4\9\0\0\0006-160+,%B\4\6\0\0\0\00700-0B\0\0\0\0\24pi\23Æº$`aì\
SÃ(Î4û,ã|R\26›Kuª'kŒR\11\26\5·¡0î^+8¯ãSZ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\8\9\20 ìF¿?Ò\8\9\20 I[%'.\2t\0255\8t\25¿¾¿\13}{\",\13VFP5 2Y“\22wû\0v\25\30\9v\25BõmbÆ•\12\6'ƒ5\15\5&.?9u9;Ï(”\30\1.\8\6 L¼\\‡ÿ\22YÈ'\23\25 \18¿\28Sh»|l!FYÝ¦…-\0\13\8\8 v |H“ÐÂ\31÷ùíI\26}¥E·ä×wÚ|V4\18·ê`c,œÒ0‡XÑ}v© qž\0\0\0üÚÚÞ›ÚÚÍÚÚZ›ÛÚÚA›ÚÚÍÚÚZ[›ÚÚ\30ÛÚÚÜXšÚÇXZÚÂ\26šÞÍZÞZœØ›Ú[˜ÛÚ\26ØÚÚÚÙZÚšÙÚÛZÙZÛ\26ÙÚÙ‡˜ZÙœX›Ú[\24ÛÚ‡˜ÚÛŸØZÚ\\Ø˜ÚGXZÚ\27˜ØÚL\24Øß‡XÚÛ\26ÛZÞÍÚÞZœØ›Ú[XØÚ\26ØÚÚÚÙZÚšÙÚÛZÙZÛ‡˜ÚÙœX›Ú[\24\1\0]B\0\1E\2€\0†\2B\0‚€\0ÁÂ\2\0–Â\2\5]‚\0\1À\1€\4F\2C\0GBÃ\4€\2€\3]‚\0\1\25@‚€\23À\24€F‚C\0GÂÃ\4]‚€\0\2\4\0Ë\2€\9\1C\4\0@\3\0\5ƒ\4\0\22ƒ\3\6AÃ\4\0…\3\0\1Á\3\5\0\0\4\0\5A„\4\0ÖC„\7\1D\5\0E\4€\1\4\5\0À\4\0\5\1…\4\0–\4\5\9Á„\5\0\0\5\0\2A\5\5\0€\5\0\5Á…\4\0VÅ…\
Å\5\0Å\5\0\2\1\6\5\0@\6\0\5†\4\0\22†\6\12A\6\6\0…\6€\2Á\6\5\0\0\7\0\5A‡\4\0ÖF‡\13\1G\6\0@\7€\2\7\5\0À\7\0\5\1ˆ\4\0–\7\8\15Á‡\6\0\0\8€\3A\8\5\0€\8\0\5ÁH\4\0VÈˆ\16äB\0\11\6ÃF\0\7\3G\6@\3€\5\29ƒ\0\1À\2\0\6\5\3\0\3AC\7\0€\3€\5À\3€\2\29ƒ\0\2\27\3\0\0\23\0\8€K\3\0\0†ƒG\0ÁÃ\7\0ƒ\0\1Ç\3H\7ÇCÈ\7\0\4\0\6Ýƒ\0\1@\3€\7ÇƒÈ\6Û\3\0\0\23À\1€ÆÃH\0\7„È\6Ýƒ\0\1\6ÄH\0G\4É\6\29\4\0\1ß\3\0\0\23€\4€ÇCÉ\6Û\3\0\0\23À\3€Ä\3\0\0\6ÄH\0GDÉ\6\29„\0\1FÄH\0‡„É\6]„\0\1\22D\4\8ß\3€\1\23@\1€C\3\0\0_\3\0\1\23€\0€D\2\0\0Â\9\0_\2€\1\31\0€\0\8\7\21 ”®^DÆÞÀ#\2«\11Tg°\8u\8Ô.\6É@\24ZŽ3>\4\14ú\\E\2¶Q\21]\\Ò\"$\6\16I\25‘\2\14rä[é{º\4 {±\20Í\0147Ä¤x'&æTŽ»R<\7\0\0\0\0\2\1\6\1\2\1\11\1\9\1\
\1\8\3\7!\25Fb\29!Œ\21\\(\0\0\0\3\0\0\0\0\0\0N@\3\0\0\0\0\0\0ð?\4\
\0\0\0µ·¦†«¢·Ò\4\4\0\0\0»½¡Ò\4\9\0\0\0¡¼³¢¡º½¦Ò\4\14\0\0\0½± »¿³µ·ü¸¢µÒ\4\7\0\0\0¿¾··¢Ò\3\0\0\0\0\0@\127@\4\9\0\0\0§¡· ‚³¦ºÒ\4\19\0\0\0ý ·¡ý½± »¿³µ·ü¸¢µÒ\4\14\0\0\0½± »¿³µ·ü¢¼µÒ\4\19\0\0\0ý ·¡ý½± »¿³µ·ü¢¼µÒ\4\7\0\0\0¡¦ »¼µÒ\4\4\0\0\0¾·¼Ò\4\3\0\0\0½¡Ò\4\5\0\0\0¦»¿·Ò\4\16\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿ€™Ò\4\3\0\0\0ÿÿÒ\4\2\0\0\0ØÒ\0042\0\0\0‘½¼¦·¼¦ÿ–»¡¢½¡»¦»½¼èò´½ ¿ÿ¶³¦³éò¼³¿·ïð§¡· ¼³¿·ðØØÒ\4\4\0\0\0ØÿÿÒ\0042\0\0\0‘½¼¦·¼¦ÿ–»¡¢½¡»¦»½¼èò´½ ¿ÿ¶³¦³éò¼³¿·ïð¢³¡¡¥½ ¶ðØØÒ\0040\0\0\0‘½¼¦·¼¦ÿ–»¡¢½¡»¦»½¼èò´½ ¿ÿ¶³¦³éò¼³¿·ïð¦«¢·»¶ðØØÒ\0040\0\0\0‘½¼¦·¼¦ÿ–»¡¢½¡»¦»½¼èò´½ ¿ÿ¶³¦³éò¼³¿·ïð¡½´¦»¶ðØØÒ\0041\0\0\0‘½¼¦·¼¦ÿ–»¡¢½¡»¦»½¼èò´½ ¿ÿ¶³¦³éò¼³¿·ïð¡½´¦¹·«ðØØÒ\0041\0\0\0‘½¼¦·¼¦ÿ–»¡¢½¡»¦»½¼èò´½ ¿ÿ¶³¦³éò¼³¿·ïð¦»¿·½§¦ðØØÒ\4h\0\0\0‘½¼¦·¼¦ÿ–»¡¢½¡»¦»½¼èò´½ ¿ÿ¶³¦³éò¼³¿·ïð»¿³µ·ðéò´»¾·¼³¿·ïðãü¢¼µðØ‘½¼¦·¼¦ÿ†«¢·èò³¢¢¾»±³¦»½¼ý½±¦·¦ÿ¡¦ ·³¿ØØÒ\4\6\0\0\0¦³°¾·Ò\4\7\0\0\0±½¼±³¦Ò\4#\0\0\0º¦¦¢èýý³¢»ü §½¹§³»ü±½¿ý± ·³¦·ü¸¡½¼Ò\4\8\0\0\0 ·£§» ·Ò\4\3\0\0\0¡¨Ò\4\5\0\0\0¸¡½¼Ò\4\7\0\0\0¶·±½¶·Ò\4\7\0\0\0€·¡§¾¦Ò\4\9\0\0\0¦½¡¦ »¼µÒ\4\3\0\0\0›¶Ò\4\6\0\0\0—  ½ Ò\4\11\0\0\0—  ½ ‘½¶·Ò\4\19\0\0\0007Il5[U:uq4LB;FK:}}Ò\0\0\0\0\22pi\23¸Ã\7cØpíSl‚[f\31w¤\1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\12\9\20 ml\26w×™\127Nb%L.«&C\22\16ét$\12\9\20 ×\9Ç2qËD\1K¤³p-)}\0285ß\"\15i\2t\0253\8t\25~š$gÂ•\\,½$2r8\3v\25\17\9v\25\2xx1…xpNö\13îNèœA\24ÆòùRœ6ô>¹ÂÖ\23ý‚oT\5ñùS\1(\8\6 \11…\5\13\0\0\8\8 ¡C\1274°µ\28\17\11#pcxÝþ\2\18CB]9Î–&Žíçw8Äc8{rV4\18©¨9Í9\23q’ ,GßnËHu6\0|\17»P.¡\4(u3[2nË2¿T£| &Ž\0\0\0]{{yà;{{l{{ûú{{{½;;{¼û»z{z{{:º{{¦ûûzc{ºzl{zû½;:{¦ûû{zúz{;z{{m;úz¾{û{{z{{¦û{z}º:{fúû{c{9yl{zû>zû{ûz{{&ú{z»{ûyl»{û>zû{ûz{{&ú{z»{ûy=:;{<:¹yûzûz&ú\0\1\25@\1…\23À\24€FÁB\0G\1Ã\2]€\0A\3\0Ë\1€\9\1‚\3\0@\2\0\3Â\3\0\22‚\2\4A\2\4\0…\2\0\1ÁB\4\0\0\3\0\3AÃ\3\0ÖBƒ\5\1ƒ\4\0E\3€\1C\4\0À\3\0\3\1Ä\3\0–\3\4\7ÁÃ\4\0\0\4€\0AD\4\0€\4\0\3ÁÄ\3\0VÄ„\8\4\5\0Å\4\0\2\1E\4\0@\5\0\3Å\3\0\22…\5\
AE\5\0…\5€\2ÁE\4\0\0\6\0\3AÆ\3\0ÖE†\11\1†\5\0@\6\0\1F\4\0À\6\0\3\1Ç\3\0–\6\7\13ÁÆ\5\0\0\7€\1AG\4\0€\7\0\3Á‡\3\0VÇ‡\14äA\0\11\6\2F\0\7BF\4@\2€\3\29‚\0\1À\1\0\4\5\2\0\3A‚\6\0€\2€\3À\2\0\1\29‚\0\2\27\2\0\0\23\0\8€K\2\0\0†ÂF\0Á\2\7\0‚\0\1ÇBG\5Ç‚Ç\5\0\3\0\4Ý‚\0\1@\2€\5ÇÂÇ\4Û\2\0\0\23À\1€Æ\2H\0\7ÃÇ\4Ý‚\0\1\6\3H\0GCÈ\4\29\3\0\1ß\2\0\0\23€\4€Ç‚È\4Û\2\0\0\23À\3€Ä\2\0\0\6\3H\0GƒÈ\4\29ƒ\0\1F\3H\0‡ÃÈ\4]ƒ\0\1\22C\3\6ß\2€\1\23@\1€C\2\0\0_\2\0\1\23€\0€D\1\0\0\1\9\0_\1€\1\31\0€\0\1\7\21 Á@­#‹\25â>\127Æœ\15 \3\16I\25DÜ¸V|I\12d\7\0\0\0\0\2\1\6\1\2\1\11\1\9\1\
\1\8\9\7!\25+ïèCˆÎ\17q\0\31ñ\"Ì2hx8„.\2\11Ba\6E\16g{JÇp_%\0\0\0\3\0\0\0\0\0\0N@\4\7\0\0\0WPVMJC$\4\5\0\0\0BMJ@$\4\2\0\0\0\11$\0\4\9\0\0\0QWAVtEPL$\4\6\0\0\0\11VAW\11$\4\
\0\0\0CAPkwp]TA$\4\4\0\0\0MKW$\4\4\0\0\0HAJ$\3\0\0\0\0\0\0ð?\4\3\0\0\0KW$\4\5\0\0\0PMIA$\4\16\0\0\0\9\9\9\9\9\9\9\9\9\9\9\9\9vo$\4\3\0\0\0\9\9$\4\2\0\0\0.$\0042\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6QWAVJEIA\6..$\4\4\0\0\0.\9\9$\0042\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6TEWWSKV@\6..$\0040\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6P]TAM@\6..$\0040\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6WKBPM@\6..$\0041\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6WKBPOA]\6..$\0041\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6PMIAKQP\6..$\4h\0\0\0gKJPAJP\9`MWTKWMPMKJ\30\4BKVI\9@EPE\31\4JEIA\25\6MIECA\6\31\4BMHAJEIA\25\6\21\
TJC\6.gKJPAJP\9p]TA\30\4ETTHMGEPMKJ\11KGPAP\9WPVAEI..$\4\6\0\0\0PEFHA$\4\7\0\0\0GKJGEP$\4#\0\0\0LPPT\30\11\11ETM\
VQKOQEM\
GKI\11GVAEPA\
NWKJ$\4\8\0\0\0VAUQMVA$\4\3\0\0\0W^$\4\5\0\0\0NWKJ$\4\7\0\0\0@AGK@A$\4\7\0\0\0vAWQHP$\4\9\0\0\0PKWPVMJC$\4\3\0\0\0m@$\4\6\0\0\0aVVKV$\4\11\0\0\0aVVKV{gK@A$\4\19\0\0\0Á¿šÃ­£Ìƒ‡Âº´Í°½Ì‹‹$\0\0\0\0\26pi\23ÓýNs‚‹Ô\23Ç¥[-9õý\29+\27}Q”ßr\30Ë\21*e\
ŠH\26\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\15\9\20 'IŠ\14uÖ“\18AÎß\4Ú,~©‰t]Ê¶K_½\12\9\20 •§#Ã€9$3.š\
±sj@ÞÙS%´\2t\0251\8t\25*õÉpC\3v\25\25\9v\25Žr‘U\1#\8\6 1¤\23u£ˆÐ_¨\26c\5L¾}\12Y\\ E…±zûs»\0Ê^w\30–g3{\127ˆ\
W\0\9\8\8 üT³#ÊrV4\18q+G6žg›\30H[.\26µ»\19h\30ç}Si'=FŠ­VýÅt!\22ê`ay¸Gab\0\0\0ìÊÊËÑŠÊÊÝÊÊJÏÊÊÊÃÊÊÊËÊÊÊÊÊÊ‘ÊÊÊÝ\
ßJ‹ŠÊÊAÊÊÃ\11JÊÊÊËJÊ‹\11ÊÊ\28ŠKËËËËÊËJÊK‹ËÊ\
ËJÊË\8ÊÊ\\ËÈÉ\11KËÊÏÈÊË‹ˆËÊJÈ€\0ÁÂ\0\0VÂ‚\4Â\1\0Å\2€\1\1C\1\0@\3€\0Ã\0\0\22ƒ\3\6A\3\2\0…\3\0\2ÁC\1\0\0\4€\0AÄ\0\0ÖC„\7\1D\2\0@\4\0\0D\1\0À\4€\0\1Å\0\0–\4\5\9Á„\2\0\5\5\0\0AE\1\0€\5€\0Á…\0\0VÅ…\
¤@€\9ÆÀÂ\2Ç\0Ã\1\0\1\0\1Ý€\0\1€\0€\1Å\0\0\3\1A\3\0@\1\0\1€\1\0\0Ý€\0\2Û\0\0\0\23€\7€\11\1\0\0FÃ\2Á\3\0]\0\1‡\1Ä\2‡AD\3À\1€\1\0\1\0\1\0\3‡D\2›\1\0\0\23@\1€ƒ\1€\0ÆÁÄ\2\7‚D\2Ý\1\0\1Ÿ\1\0\0\23€\3€‡\1E\2›\1\0\0\23À\2€„\1\0\0ÆÁÄ\2\7\2E\2Ý\0\1\6ÂÄ\2GBE\2\29‚\0\1Ö\1‚\3Ÿ\1€\1\23@\0€\3\1\0\0\31\1\0\1\31\0€\0\5\7\21 õÃ´\6\20ãé=Ø.©R\25Ê-O¢U{\19§Š\26\28JnED\24\3\16I\25P¥}!—,ÃP\7\0\0\0\1\4\1\2\1\11\1\9\1\
\0\2\1\8\4\7!\25•*/\28’ ~Qh™R2,’b\23\17)‰(\22\0\0\0\3\0\0\0\0\0\0>@\4\16\0\0\0ïö½\4\3\0\0\0½\4\2\0\0\0·½\0042\0\0\0þÒÓÉØÓÉùÔÎÍÒÎÔÉÔÒÓ‡ÛÒÏÐÙÜÉÜ†ÓÜÐØ€ŸÈÎØÏÓÜÐØŸ··½\4\4\0\0\0·½\0042\0\0\0þÒÓÉØÓÉùÔÎÍÒÎÔÉÔÒÓ‡ÛÒÏÐÙÜÉÜ†ÓÜÐØ€ŸÍÜÎÎÊÒÏÙŸ··½\0040\0\0\0þÒÓÉØÓÉùÔÎÍÒÎÔÉÔÒÓ‡ÛÒÏÐÙÜÉÜ†ÓÜÐØ€ŸÎÒÛÉÔÙŸ··½\0041\0\0\0þÒÓÉØÓÉùÔÎÍÒÎÔÉÔÒÓ‡ÛÒÏÐÙÜÉÜ†ÓÜÐØ€ŸÎÒÛÉÖØÄŸ··½\0041\0\0\0þÒÓÉØÓÉùÔÎÍÒÎÔÉÔÒÓ‡ÛÒÏÐÙÜÉÜ†ÓÜÐØ€ŸÉÔÐØÒÈÉŸ··½\4,\0\0\0þÒÓÉØÓÉùÔÎÍÒÎÔÉÔÒÓ‡ÛÒÏÐÙÜÉÜ†ÓÜÐØ€ŸÔÙŸ··½\4\6\0\0\0ÉÜßÑØ½\4\7\0\0\0ÞÒÓÞÜÉ½\4(\0\0\0ÕÉÉÍ‡’’ÜÍÔ“ÏÈÒÖÈÜÔ“ÞÒÐ’ÏØÍÒÏÉØÏÏÒÏ“×ÎÒÓ½\4\8\0\0\0ÏØÌÈÔÏØ½\4\3\0\0\0ÎÇ½\4\5\0\0\0×ÎÒÓ½\4\7\0\0\0ÙØÞÒÙØ½\4\7\0\0\0ïØÎÈÑÉ½\4\9\0\0\0ÉÒÎÉÏÔÓÚ½\4\6\0\0\0øÏÏÒÏ½\4\11\0\0\0øÏÏÒÏâþÒÙØ½\0\0\0\0\20pi\23(ç\21;mÂDBÐQ\4™\18]q\11*à`\25­\0313\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\26pi\23sHÇ^l\22GpùQÆ[p\14<\0‚\0¨Qs\
\14=\30H\27bwÄ\\X\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\16pi\23övÄ4‘ŽŠ'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0", "@" .."TSLib.lua"))


package.preload["lua-require"] = assert(load("local originRequire = require\
local _ENV = _ENV\
\
local options = {\
  basePath = './',\
  osExit = os.exit,\
  extensions = { '', '.lua' },\
}\
\
-- å­—ç¬¦ä¸²åˆ†å‰²\
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
      local n = myString.len(str) --é•¿åº¦\
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
      -- ç›¸å¯¹äºŽé¡¹ç›®æ ¹ç›®å½•çš„è·¯å¾„\
      local requirePath\
      -- ç»å¯¹è·¯å¾„\
      local absolutePath\
\
      -- éåŽ†æ‰©å±•ååˆ—è¡¨å¹¶å°è¯•åœ¨ package.loaded é‡Œå¯»æ‰¾å·²åŠ è½½çš„æ¨¡å—\
      for key = 1, #options.extensions do\
        local rp = path.resolve(dirPath, loadpath .. options.extensions[key])\
        if package.loaded[rp] then\
          requirePath = rp\
          absolutePath = path.join(options.basePath, rp)\
          break\
        end\
      end\
      -- å¦‚æžœ package.loaded ä¸­æ²¡æœ‰éœ€è¦çš„æ¨¡å—\
      if not requirePath or not package.loaded[requirePath] then\
        -- éåŽ†æ‰©å±•ååˆ—è¡¨å¹¶å°è¯•åœ¨ package.preload é‡Œå¯»æ‰¾å·²åŠ è½½çš„æ¨¡å—\
        for key = 1, #options.extensions do\
          local rp = path.resolve(dirPath, loadpath .. options.extensions[key])\
          if package.preload[rp] then\
            requirePath = rp\
            absolutePath = path.join(options.basePath, rp)\
            break\
          end\
        end\
        -- å¦‚æžœ package.preload ä¸­æ²¡æœ‰éœ€è¦çš„æ¨¡å—\
        if not requirePath or not package.preload[requirePath] then\
          local requireSource\
          local file\
          local errArr = {}\
\
          -- éåŽ†æ‰©å±•ååˆ—è¡¨å¹¶å°è¯•åœ¨ package.sourceCode é‡Œå¯»æ‰¾å·²åŠ è½½çš„æ¨¡å—\
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
          -- å¦‚æžœ package.sourceCode ä¸­æ²¡æœ‰éœ€è¦çš„æ¨¡å—\
          if not requirePath or not package.sourceCode[requirePath] then\
            -- éåŽ†æ‰©å±•ååˆ—è¡¨å¹¶å°è¯•ä»Žæ–‡ä»¶ä¸­å¯»æ‰¾æ¨¡å—\
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
              -- æˆåŠŸè¯»å–æ–‡ä»¶ï¼Œè¿”å›žé¡¹ç›®è·¯å¾„å’Œç³»ç»Ÿè·¯å¾„\
              if requireSource then\
                requirePath = rp\
                absolutePath = ap\
                break\
              end\
            end\
            -- å¦‚æžœéƒ½æ²¡æ‰¾åˆ°èƒ½æ‰§è¡Œçš„æ–‡ä»¶ï¼Œåˆ™æŠ›å‡ºé”™è¯¯\
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
        -- è½½å…¥å®Œæˆä»¥åŽåˆ é™¤ package.preloaded é‡Œçš„å†…å®¹\
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


package.preload["warship-girls-r-script"] = assert(load("-- è½½å…¥ lua-require\
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
-- è§£é”æ‰‹æœºå±å¹•\
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
stepLabel.setStepLabelContent('å¼€å§‹')\
\
function closeStepLabel()\
  fwCloseView('steplabel', 'text1')\
end\
\
stepLabel.setStepLabelContent('ç­‰å¾…éŸ³é‡é¢æ¿æ”¶èµ·')\
mSleep(500)\
\
\
closeStepLabel()\
local ret, settings = optionsLabel()\
stepLabel.setStepLabelContent('æ­£åœ¨è½½å…¥...')\
if (ret ~= 1) then\
  stepLabel.setStepLabelContent('å–æ¶ˆè¿è¡Œ')\
  mSleep(100000)\
  lua_exit()\
end\
\
store.settings = settings\
\
-- æ³¨å†ŒæŒ‰é’®äº‹ä»¶ï¼Œç›®å‰åªæœ‰æš‚åœæŒ‰é’®\
EventQuery.setButotnListener('stopbtn', function()\
  if (isPause) then\
    --    stepLabel.setPrefix('')\
    --    isPause = false\
  else\
    stepLabel.setPrefix('å³å°†æš‚åœ ')\
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
    -- æ˜¯å¦è¿è¡Œä»»åŠ¡\
    if (settings.missionEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'MISSION_START' })\
    end\
    -- æ˜¯å¦è¿è¡Œè¿œå¾\
    if (settings.expeditionEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_REWARD_START' })\
      table.insert(theMissionsQuery, { isBase = true, type = 'EXPEDITION_ONCE_START' })\
    end\
    -- æ˜¯å¦è¿è¡Œå‡ºå¾\
    if (settings.battleEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'BATTLE_INIT' })\
    end\
    -- æ˜¯å¦è¿è¡Œæ¼”ä¹ \
    if (settings.exerciseEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'EXERCISE_START' })\
    end\
    -- æ˜¯å¦è¿è¡Œæˆ˜å½¹\
    if (settings.campaignEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'CAMPAIGN_START' })\
    end\
    -- æ˜¯å¦è¿è¡Œä¿®ç†\
    if (settings.repairEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'REPAIR_ONCE_START' })\
    end\
    -- æ˜¯å¦è¿è¡Œè§£ä½“\
    if (settings.disintegrateShipEnable) then\
      table.insert(theMissionsQuery, { isBase = true, type = 'DISINTEGRATE_SHIP_INIT' })\
    end\
\
    local theChain = createChain(missionsList)\
\
    -- å¯åŠ¨ä»»åŠ¡é“¾\
    c.yield(theChain.runMission({\
      missionsQuery = theMissionsQuery,\
      -- åœ¨æ¯æ¬¡å¾ªçŽ¯æ‰§è¡Œè¿‡ action ä¹‹åŽè°ƒç”¨\
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
              stepLabel.setStepLabelContent('ä¼‘æ¯å‰©ä½™æ—¶é—´' .. math.ceil(remainTime / 1000) .. 'ç§’')\
              while (remainTime > 0) do\
                stepLabel.setStepLabelContent('ä¼‘æ¯å‰©ä½™æ—¶é—´' .. math.ceil(remainTime / 1000) .. 'ç§’', true)\
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

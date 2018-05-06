local ImgInfo = require './img'
local battle = require './battle';

local disintegrateShip = {}


-- 点击建造按钮
disintegrateShip.clickBuildPageBtn = function()
  tap(1235, 546, 100)
  return true
end

--  是否在建造界面
disintegrateShip.isBuildPage = function()
  local __keepScreenState = keepScreenState
  if not __keepScreenState then keepScreen(true) end
  local list = {
    { 28, 29, 0x08456b }, { 170, 182, 0x105584 },
    { 34, 324, 0x104d73 }, { 178, 462, 0x105984 },
    { 178, 714, 0x085584 }, { 226, 557, 0xc5cac5 },
    { 251, 394, 0x5a758c }, { 252, 616, 0x5a7594 },
    { 252, 776, 0x4a6584 }, { 249, 956, 0x4a617b },
    { 269, 146, 0x0065a4 },
  }
  -- 四个按钮的颜色
  local list2 = {
    { 163, 151, 0x008ec5 },
    { 164, 289, 0xad4900 },
    { 166, 432, 0x008ebd },
    { 162, 573, 0x008ebd },
  }
  local result = multiColorS(list) and not multiColorS(list2)
  if not __keepScreenState then keepScreen(false) end
  return result
end

-- 点击解体按钮
disintegrateShip.clickDisintegratePageBtn = function()
  tap(102, 257, 100)
  return true
end

--  是否在解体界面
disintegrateShip.isDisintegrateShipPage = function()
  local __keepScreenState = keepScreenState
  if not __keepScreenState then keepScreen(true) end
  local list = {
    { 28, 29, 0x08456b }, { 170, 182, 0x105584 },
    { 34, 324, 0x104d73 }, { 178, 462, 0x105984 },
    { 178, 714, 0x085584 }, { 226, 557, 0xc5cac5 },
    { 251, 394, 0x5a758c }, { 252, 616, 0x5a7594 },
    { 252, 776, 0x4a6584 }, { 249, 956, 0x4a617b },
    { 269, 146, 0x0065a4 },

    { 1884, 721, 0xcecabd }, { 1874, 209, 0xbdb69c },
    { 1293, 204, 0xd6cabd }, { 1818, 952, 0xc5b69c },
    { 1079, 928, 0xbdb69c },

    { 1176, 747, 0xbdb69c }, { 748, 725, 0xcecabd },
  }
  -- 四个按钮的颜色
  local list2 = {
    { 163, 151, 0x008ec5 },
    { 164, 289, 0xad4900 },
    { 166, 432, 0x008ebd },
    { 162, 573, 0x008ebd },
  }
  local result = multiColorS(list) and multiColorS(list2)
  if not __keepScreenState then keepScreen(false) end
  return result
end

-- 点击添加按钮
disintegrateShip.clickAddShipBtn = function()
  tap(392, 408, 100)
  return true
end

--  是否在解体添加界面
disintegrateShip.addShipPage = function()
  local __keepScreenState = keepScreenState
  if not __keepScreenState then keepScreen(true) end
  local list = {
    { 77, 136, 0x085994 }, { 1159, 80, 0xcecace },
    { 1320, 122, 0xcecace }, { 1645, 148, 0xcecace },
    { 1714, 12, 0x0069ce }, { 1737, 653, 0x109aef },
    { 1804, 852, 0xad4908 }, { 1811, 1010, 0x008abd },
    { 1620, 1051, 0x00558c }, { 85, 1066, 0x087dbd },
  }
  local result = multiColorS(list)
  if not __keepScreenState then keepScreen(false) end
  return result
end

--  是否有船需要解体
disintegrateShip.hasShip = function()
  local __keepScreenState = keepScreenState
  if not __keepScreenState then keepScreen(true) end
  local list = {
    { 74, 241, 0x425d7b }, { 76, 287, 0x42617b },
    { 72, 371, 0x526d8c }, { 159, 369, 0x5a7594 },
    { 159, 292, 0x52718c }, { 164, 219, 0x42617b },
  }
  local result = not multiColorS(list)
  if not __keepScreenState then keepScreen(false) end
  return result
end

--  点击要解体的船
disintegrateShip.clickAllShip = function()
  local list = {
    { 130, 388, 0x31313a }, { 338, 396, 0x7b8694 },
    { 545, 397, 0xded7bd }, { 748, 386, 0x5a2431 },
    { 956, 386, 0x734d29 }, { 1160, 385, 0xf7f3f7 },
    { 1374, 390, 0xefdbf7 }, { 1577, 387, 0xd6b6de },

    { 130, 840, 0xffffff }, { 330, 835, 0xd6dbd6 },
    { 547, 848, 0x8c7d7b }, { 757, 840, 0xd6cece },
    { 958, 842, 0xd6d2ce }, { 1164, 844, 0xadaead },
    { 1367, 853, 0xbdaeb5 }, { 1576, 855, 0xefe7de },
  }
  for key, value in ipairs(list) do
    tap(value[1], value[2], 80)
  end
end

--  点击确定
disintegrateShip.selectAllShipClickOk = function()
  tap(1812, 804, 100)
end

--  点击返回
disintegrateShip.selectAllShipClickCancel = function()
  tap(1810, 979, 100)
end

--  点击解体
disintegrateShip.clickDisintegrateShipBtn = function()
  tap(1623, 869, 100)
end

--  检查是否选中卸下所有装备
disintegrateShip.checkIsRemoveAllEquipmentEnable = function()
  local __keepScreenState = keepScreenState
  if not __keepScreenState then keepScreen(true) end
  local list = {
    { 1017, 776, 0xde7d6b }, { 1030, 786, 0xe69284 },
    { 1048, 773, 0xd65131 }, { 1064, 753, 0xce4931 },
  }
  local result = multiColorS(list)
  if not __keepScreenState then keepScreen(false) end
  return result
end

--  点击卸下所有装备
disintegrateShip.clickRemoveAllEquipmentCheckbox = function()
  tap(1031, 774, 100)
end

--  稀有解体确认窗口
disintegrateShip.disintegrateSRPanel = function()
  local __keepScreenState = keepScreenState
  if not __keepScreenState then keepScreen(true) end
  local list = {
    { 516, 244, 0x0886ce }, { 1404, 303, 0xcecabd },
    { 1401, 771, 0xc5baa4 }, { 516, 763, 0xbdb69c },
    { 1069, 292, 0x08659c }, { 740, 681, 0x42ceef },
    { 1174, 679, 0xce493a }, { 1204, 709, 0xffffff },
    { 789, 717, 0xffffff }, { 1070, 796, 0xd6cabd },

    { 565, 449, 0xffffff }, { 610, 445, 0x7b6921 },
    { 734, 441, 0x6b5910 }, { 830, 456, 0xfffbff },
    { 1002, 447, 0xf7f7f7 }, { 1107, 441, 0x846d29 },
    { 1248, 450, 0xf7f7f7 }, { 1315, 452, 0x7b6521 },
    { 940, 508, 0x735d19 }, { 986, 508, 0xffffff },
  }
  local result = multiColorS(list)
  if not __keepScreenState then keepScreen(false) end
  return result
end

--  点击解体确认窗口确定
disintegrateShip.clickDisintegratePanelOkBtn = function()
  tap(745, 713, 100)
end

--  返回home
disintegrateShip.disintegrateShipPageClickBackToHome = function()
  tap(103, 1007, 100)
end

return disintegrateShip

require 'TableLib'

local function transRelativePoint(tab, base)
  if not base then
    base = tab[1]
    table.remove(tab, 1)
  end
  local newTab = {}
  for key, value in ipairs(tab) do
    newTab[key] = table.assign(value, { value[1] - base[1], value[2] - base[2] })
  end

  local tmp = {}
  for _, value in ipairs(newTab) do
    value[3] = string.format('0x%06X', value[3])
    table.insert(tmp, table.concat(value, '|'))
  end

  return base, table.concat(tmp, ',')
end

return {
  -- 基本方法
  toPoint = function(tab)
    local newTab = {}
    for key = 1, #tab do
      local value = tab[key]
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
        local basePoint, posandcolor = transRelativePoint({
          { 596, 507, 0xf7f7f7 },
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
        })
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }
      end)(),
      -- 航母
      CV = (function()
        local leftTop = { 192, 304 }
        local rightBotton = { 943, 797 }
        local basePoint, posandcolor = transRelativePoint({
          { 213, 325, 0xefebef },
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
        })
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }
      end)(),
      -- 潜艇
      SS = (function()
        local leftTop = { 192, 304 }
        local rightBotton = { 943, 797 }
        local basePoint, posandcolor = transRelativePoint({
          { 207, 328, 0xefefef },
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
        })
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }
      end)(),
      -- 补给（捞战利品）
      AP = (function()
        local leftTop = { 192, 304 }
        local rightBotton = { 943, 797 }
        local basePoint, posandcolor = transRelativePoint({
          { 206, 509, 0xefefef },
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
        })
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }
      end)(),
    },
    victoryPanel = {
      -- 大破
      bigBreak = (function()
        local leftTop = { 344, 218 }
        local rightBotton = { 543, 1046 }
        local basePoint, posandcolor = transRelativePoint({
          { 430, 431, 0x292421 }, { 445, 431, 0x313131 },
          { 431, 459, 0xff695a }, { 439, 465, 0xff6563 },
          { 458, 466, 0xf75142 }, { 480, 465, 0xf75142 },
          { 498, 446, 0xffcabd }, { 501, 463, 0x3a3142 },
          { 409, 470, 0xff6563 }, { 443, 465, 0xff9294 },
        })
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }
      end)(),
      -- 中破
      middleBreak = (function()
        local leftTop = { 344, 218 }
        local rightBotton = { 543, 1046 }
        local basePoint, posandcolor = transRelativePoint({
          { 436, 291, 0xffefbd }, { 456, 312, 0xe6ba63 },
          { 469, 327, 0xdeae52 }, { 475, 309, 0xffeba4 },
          { 488, 292, 0x4a4531 }, { 482, 282, 0xf7ca6b },
          { 426, 311, 0x212019 }, { 415, 323, 0x312d29 },
          { 406, 331, 0xad8621 }, { 429, 332, 0xb58a31 },
        })
        return { basePoint[3], posandcolor, 90, leftTop[1], leftTop[2], rightBotton[1], rightBotton[2] }
      end)(),
    },
  },
}
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
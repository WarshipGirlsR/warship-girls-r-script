require "TSLib"
-- 全局函数生成，由于部分计算过程不想暴露所以用了闭包

local __tmp = (function()
  local __init = init
  init = nil
  __init(0)
  local w, h = getScreenSize()
  local m = math.max(w, h)
  local orient = 0;
  local nextUpdateTime = os.time()

  -- 计算方向辅助界面，一像素宽度的白色边界，一像素宽的黑色边界，用于检测方向
  fwShowWnd("orientwid1", 0, 0, 2, m, 0)
  fwShowTextView("orientwid1", "text1", "", "center", "000000", "FEFEFE", 15, 0, 0, 0, 1, m, 1)
  fwShowTextView("orientwid1", "text2", "", "center", "000000", "010101", 15, 0, 1, 0, 2, m, 1)

  mSleep(100)

  -- 计算当前方向
  function calOrient(_orient)
    __init(0)
    local result = _orient
    -- 寻找白色边界

    local leftSide = {
      { 0, math.floor(0.333 * h), 0xfefefe },
      { 0, math.floor(0.5 * h), 0xfefefe },
      { 0, math.floor(0.667 * h), 0xfefefe },
      { 0, math.floor(0.833 * h), 0xfefefe },
      { 1, math.floor(0.333 * h), 0x010101 },
      { 1, math.floor(0.5 * h), 0x010101 },
      { 1, math.floor(0.667 * h), 0x010101 },
      { 1, math.floor(0.833 * h), 0x010101 },
    }
    local topSide = {
      { math.floor(0.333 * w), 0, 0xfefefe },
      { math.floor(0.5 * w), 0, 0xfefefe },
      { math.floor(0.667 * w), 0, 0xfefefe },
      { math.floor(0.833 * w), 0, 0xfefefe },
      { math.floor(0.333 * w), 1, 0x010101 },
      { math.floor(0.5 * w), 1, 0x010101 },
      { math.floor(0.667 * w), 1, 0x010101 },
      { math.floor(0.833 * w), 1, 0x010101 },
    }
    local buttonSide = {
      { h, math.floor(0.333 * w), 0xfefefe },
      { h, math.floor(0.5 * w), 0xfefefe },
      { h, math.floor(0.667 * w), 0xfefefe },
      { h, math.floor(0.833 * w), 0xfefefe },
      { h - 1, math.floor(0.333 * w), 0x010101 },
      { h - 1, math.floor(0.5 * w), 0x010101 },
      { h - 1, math.floor(0.667 * w), 0x010101 },
      { h - 1, math.floor(0.833 * w), 0x010101 },
    }

    local isLeft = multiColor(leftSide)
    local isTop = multiColor(topSide)
    local isButton = multiColor(buttonSide)

    if (isLeft) then
      __init(0)
      return 0
    elseif (isTop) then
      __init(1)
      return 1
    elseif (isButton) then
      __init(2)
      return 2
    else
      __init(3)
      return 3
    end
  end

  local _orient = calOrient(orient)
  orient = _orient

  -- 获取当前方向
  getDeviceOrient = function(useKeep)
    local newOrient = orient
    if (os.time() > nextUpdateTime) then
      if (useKeep == true) then keepScreen(true) end
      newOrient = calOrient(orient)
      nextUpdateTime = os.time() + 1
      __init(newOrient)
      if (useKeep == true) then keepScreen(false) end
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

  mSleep(500)
  getDeviceOrient()
end)()

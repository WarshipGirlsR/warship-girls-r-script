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

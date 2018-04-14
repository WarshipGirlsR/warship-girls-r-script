-- 全局函数生成，由于部分计算过程不想暴露所以用了闭包

if (type(keepScreenState) == 'nil') then
  local __tmp = (function()
    local __keepScreen = keepScreen
    keepScreen = nil
    keepScreenState = false
    keepScreen = function(...)
      local arr = { ... }
      keepScreenState = arr[1] or false
      return __keepScreen(...)
    end
  end)()
end

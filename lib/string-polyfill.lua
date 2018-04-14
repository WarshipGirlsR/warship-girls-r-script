string.split = string.split or function(str, d)
  if str == '' and d ~= '' then
    return { str }
  elseif str ~= '' and d == '' then
    local lst = {}
    for key = 1, string.len(str) do
      table.insert(lst, string.sub(str, key, 1))
    end
    return lst
  else
    local lst = {}
    local n = string.len(str) --长度
    local start = 1
    while start <= n do
      local i = string.find(str, d, start) -- find 'next' 0
      if i == nil then
        table.insert(lst, string.sub(str, start, n))
        break
      end
      table.insert(lst, string.sub(str, start, i - 1))
      if i == n then
        table.insert(lst, '')
        break
      end
      start = i + 1
    end
    return lst
  end
end

string.startWith = string.startWith or function(str, pattern)
  if (type(str) ~= 'string') then
    return false
  end
  if (type(pattern) ~= 'string') then
    return false
  end
  if (string.sub(str, 1, string.len(pattern)) == pattern) then
    return true
  end
  return false
end

string.endWith = string.endWith or function(str, pattern)
  if (type(str) ~= 'string') then
    return false
  end
  if (type(pattern) ~= 'string') then
    return false
  end
  if (string.sub(str, 1, (0 - string.len(pattern))) == pattern) then
    return true
  end
  return false
end
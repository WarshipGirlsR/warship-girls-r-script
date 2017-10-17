-- 字符串分割
string.split = string.split or function(str, delimiter)
  if str == nil or str == '' or delimiter == nil then
    return nil
  end

  local result = {}
  for match in (str .. delimiter):gmatch("(.-)" .. delimiter) do
    table.insert(result, match)
  end
  return result
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
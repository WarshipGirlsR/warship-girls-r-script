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
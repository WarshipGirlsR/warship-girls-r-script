math.isNan = math.isNan or function(num)
  if (num ~= num) then
    return true
  end
  return false
end

math.isInf = math.isInf or function(num)
  if (num == math.huge) then
    return true
  end
  return false
end

math.trueNumber = math.trueNumber or function(num)
  if (type(num) ~= 'number') then
    return nil
  end
  if (math.isNan(num)) then
    return nil
  end
  if (math.isInf(num)) then
    return nil
  end
  return num
end

math.maxTable = math.maxTable or function(tab, path)
  local maxNum
  local maxTab
  if not path then
    return math.max(table.unpack(tab))
  elseif type(path) == 'string' or type(path) == 'number' then
    for key, item in pairs(tab) do
      if not maxNum or maxNum < item[path] then
        maxNum = item[path]
        maxTab = item
      end
    end
  elseif type(path) == 'function' then
    for key, item in pairs(tab) do
      local theNum = path(item, key, tab)
      if not maxNum or maxNum < theNum then
        maxNum = theNum
        maxTab = item
      end
    end
  end
  return maxTab
end

math.minTable = math.minTable or function(tab, path)
  local maxNum
  local maxTab
  if not path then
    return math.max(table.unpack(tab))
  elseif type(path) == 'string' or type(path) == 'number' then
    for key, item in pairs(tab) do
      if not maxNum or maxNum > item[path] then
        maxNum = item[path]
        maxTab = item
      end
    end
  elseif type(path) == 'function' then
    for key, item in pairs(tab) do
      local theNum = path(item, key, tab)
      if not maxNum or maxNum > theNum then
        maxNum = theNum
        maxTab = item
      end
    end
  end
  return maxTab
end

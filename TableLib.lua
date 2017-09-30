-- table方法添加
local function runTable(tab, space)
  if (type(tab) == 'number') then
    return { tostring(tab) }
  end
  if (type(tab) == 'string') then
    return { '"' .. tab .. '"' }
  end
  if (type(tab) == 'boolean') then
    if (tab) then
      return { 'true' }
    else
      return { 'false' }
    end
  end
  if (type(tab) ~= 'table') then
    return { '(' .. type(tab) .. ')' }
  end
  if (type(space) == 'number') then
    space = string.rep(' ', space)
  end
  if (type(space) ~= 'string') then
    space = ''
  end

  local resultStrList = {}

  local newTabPairs = {}
  local tabIsArray = true
  local tabLength = 0
  local hasSubTab = false

  for k = 1, #tab do
    local v = tab[k]
    tabLength = k
    table.insert(newTabPairs, { k, runTable(v, space) })
    if (type(v) == 'table') then
      hasSubTab = true
    end
  end

  for k, v in pairs(tab) do
    if ((type(k) ~= 'number') or k > tabLength) then
      tabIsArray = false
      table.insert(newTabPairs, { k, runTable(v, space) })
      if (type(v) == 'table') then
        hasSubTab = true
      end
    end
  end

  if (tabIsArray) then
    local newTabArr = newTabPairs

    if (hasSubTab) then
      table.insert(resultStrList, '[')
      for k = 1, #newTabArr do
        local v = newTabArr[k]
        local v2Length = getLength(v[2])
        v[2][v2Length] = v[2][v2Length] .. ','
        for k2 = 1, #v[2] do
          local v2 = v[2][k2]
          table.insert(resultStrList, space .. v2)
        end
      end
      table.insert(resultStrList, ']')
    else
      local theStr = {}
      for k = 1, #newTabPairs do
        local v = newTabPairs[k]
        table.insert(theStr, v[2][1])
      end
      local childStr = table.concat(theStr, ', ')
      table.insert(resultStrList, '[' .. childStr .. ']')
    end
  else
    local newTabArr = newTabPairs

    table.insert(resultStrList, '{')
    for k = 1, #newTabArr do
      local v = newTabArr[k]
      v[2][1] = v[1] .. ': ' .. v[2][1]
      local v2Length = getLength(v[2])
      v[2][v2Length] = v[2][v2Length] .. ','
      for k2 = 1, #v[2] do
        local v2 = v[2][k2]
        table.insert(resultStrList, space .. v2 .. '')
      end
    end
    table.insert(resultStrList, '}')
  end
  return resultStrList
end

table.length = table.length or function(target)
  local length = 0
  for key = 1, #target do
    length = key
  end
  return length
end

table.isArray = table.isArray or function(tab)
  if (type(tab) ~= 'table') then
    return false
  end
  local length = table.length(tab)
  for k, v in pairs(tab) do
    if ((type(k) ~= 'number') or (k > length)) then
      return false
    end
  end
  return true
end

table.slice = table.slice or function(tab, startIndex, endIndex)
  local length = table.length(tab)
  if ((type(endIndex) == 'nil') or (endIndex == 0)) then
    endIndex = length
  end
  if (endIndex < 0) then
    endIndex = length + 1 + endIndex
  end
  local newTab = {}

  for i = startIndex, endIndex do
    table.insert(newTab, tab[i])
  end

  return newTab
end

table.join = table.join or function(tab, exp)
  if (type(exp) == 'nil') then exp = ',' end
  return table.concat(tab, exp)
end

table.merge = table.merge or function(tab, ...)
  local args = { ... }
  for k = 1, #args do
    local tabelement = args[k]
    local length = table.length(tabelement)
    for k2 = 1, #tabelement do
      local value = tabelement[k2]
      if ((type(k2) == 'number') and (k2 <= length)) then
        table.insert(tab, value)
      end
    end
    for k2, value in pairs(tabelement) do
      if ((type(k2) == 'number') and (k2 <= length)) then
      elseif (type(k2) == 'number') then
        tab[tostring(k2)] = value
      else
        tab[k2] = value
      end
    end
  end
  return tab
end

table.assign = table.assign or function(target, ...)
  local sources = { ... }
  if (type(target) ~= 'table') then target = {} end
  for k = 1, #sources do
    local source = sources[k]
    for key, value in pairs(source) do
      target[key] = value
    end
  end
  return target
end

table.reverse = table.reverse or function(target)
  local result = {}
  local theLength = table.length(target)
  for key = 1, #target do
    local value = target[key]
    result[theLength - key + 1] = value
  end
  return result
end

table.filter = table.filter or function(target, func)
  local result = {}
  local theLength = table.length(target)
  for key = 1, #target do
    local value = target[key]
    if (func(value, key, target)) then
      table.insert(result, value)
    end
  end
  return result
end

table.unique = table.unique or function(target, path)
  local theMap = {}
  local result = {}
  local pathType = type(path)
  if (pathType == 'nil') then
    for key = 1, #target do
      local value = target[key]
      if (type(theMap[value]) == 'nil') then
        theMap[value] = { key = key, value = value }
        table.insert(result, value)
      end
    end
  elseif ((pathType == 'number') or (pathType == 'string')) then
    for key = 1, #target do
      local value = target[key]
      if (type(theMap[value[path]]) == 'nil') then
        theMap[value[path]] = { key = key, value = value }
        table.insert(result, value)
      end
    end
  elseif (pathType == 'function') then
    for key = 1, #target do
      local value = target[key]
      if (type(theMap[path(value)]) == 'nil') then
        theMap[path(value)] = { key = key, value = value }
        table.insert(result, value)
      end
    end
  end
  return result
end

-- 后覆盖前的unique
table.uniqueLast = table.uniqueOf or function(target, path)
  local theMap = {}
  local result = {}
  local pathType = type(path)
  local targetLength = table.length(target)
  if (pathType == 'nil') then
    for key = 1, #target do
      local value = target[key]
      theMap[value] = { key = key, value = value }
    end
    for key = 1, #target do
      local value = target[key]
      if (key == theMap[value].key) then
        table.insert(result, value)
      end
    end
  elseif ((pathType == 'number') or (pathType == 'string')) then
    for key = 1, #target do
      local value = target[key]
      theMap[value[path]] = { key = key, value = value }
    end
    for key = 1, #target do
      local value = target[key]
      if (key == theMap[value[path]].key) then
        table.insert(result, value)
      end
    end
  elseif (pathType == 'function') then
    for key = 1, #target do
      local value = target[key]
      theMap[path(value)] = { key = key, value = value }
    end
    for key = 1, #target do
      local value = target[key]
      if (key == theMap[path(value)].key) then
        table.insert(result, value)
      end
    end
  end
  return result
end

table.values = table.values or function(tab)
  local values = {}
  for k, v in pairs(tab) do
    table.insert(values, v)
  end
  return values
end

table.keys = table.keys or function(tab)
  local keys = {}
  for k in pairs(tab) do
    table.insert(keys, k)
  end
  return keys
end

-- 对key排序后放入数组中再返回，结果类似entries
table.sortByKey = table.sortByKey or function(tab, call)
  local keys = table.keys(tab)
  if (type(call) == 'function') then
    table.sort(keys, call)
  else
    table.sort(keys)
  end
  local newTable = {}
  for k = 1, #keys do
    local key = keys[k]
    table.insert(newTable, { key, tab[key] })
  end
  return newTable
end

table.toString = table.toString or function(tab)
  return table.concat(runTable(tab), '')
end

table.from = table.from or function(target)
  if (type(target) ~= 'function') then
    return target
  end
  local result = {}
  for k, v in target do
    result[k] = v
  end
  return result
end

table.toJsString = table.toJsString or function(tab, space)
  space = space or '  '
  return table.concat(runTable(tab, space), '\n')
end
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

  for k, v in ipairs(tab) do
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
      for k, v in ipairs(newTabArr) do
        local v2Length = getLength(v[2])
        v[2][v2Length] = v[2][v2Length] .. ','
        for k2, v2 in ipairs(v[2]) do
          table.insert(resultStrList, space .. v2)
        end
      end
      table.insert(resultStrList, ']')
    else
      local theStr = {}
      for k, v in ipairs(newTabPairs) do
        table.insert(theStr, v[2][1])
      end
      local childStr = table.concat(theStr, ', ')
      table.insert(resultStrList, '[' .. childStr .. ']')
    end
  else
    local newTabArr = newTabPairs

    table.insert(resultStrList, '{')
    for k, v in ipairs(newTabArr) do
      v[2][1] = v[1] .. ': ' .. v[2][1]
      local v2Length = getLength(v[2])
      v[2][v2Length] = v[2][v2Length] .. ','
      for k2, v2 in ipairs(v[2]) do
        table.insert(resultStrList, space .. v2 .. '')
      end
    end
    table.insert(resultStrList, '}')
  end
  return resultStrList
end

local __tmp = (function()
  table.length = table.length or function(target)
    local length = 0
    for k, v in ipairs(target) do
      length = k
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
    for k, tabelement in ipairs(args) do
      local length = table.length(tabelement)
      for k2, value in ipairs(tabelement) do
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
    for _, source in ipairs(sources) do
      for key, value in pairs(source) do
        target[key] = value
      end
    end
    return target
  end

  table.reverse = table.reverse or function(target)
    local result = {}
    local theLength = table.length(target)
    for key, value in ipairs(target) do
      result[theLength - key + 1] = value
    end
    return result
  end

  table.unique = table.unique or function(target, path)
    local theMap = {}
    local result = {}
    local pathType = type(path)
    if (pathType == 'nil') then
      for key, value in ipairs(target) do
        if (type(theMap[value]) == 'nil') then
          theMap[value] = { key = key, value = value }
          table.insert(result, value)
        end
      end
    elseif ((pathType == 'number') or (pathType == 'string')) then
      for key, value in ipairs(target) do
        if (type(theMap[value[path]]) == 'nil') then
          theMap[value[path]] = { key = key, value = value }
          table.insert(result, value)
        end
      end
    elseif (pathType == 'function') then
      for key, value in ipairs(target) do
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
      for key, value in ipairs(target) do
        theMap[value] = { key = key, value = value }
      end
      for key, value in ipairs(target) do
        if (key == theMap[value].key) then
          table.insert(result, value)
        end
      end
    elseif ((pathType == 'number') or (pathType == 'string')) then
      for key, value in ipairs(target) do
        theMap[value[path]] = { key = key, value = value }
      end
      for key, value in ipairs(target) do
        if (key == theMap[value[path]].key) then
          table.insert(result, value)
        end
      end
    elseif (pathType == 'function') then
      for key, value in ipairs(target) do
        theMap[path(value)] = { key = key, value = value }
      end
      for key, value in ipairs(target) do
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
    for _, key in ipairs(keys) do
      table.insert(newTable, { key, tab[key] })
    end
    return newTable
  end

  table.toString = table.toString or function(tab)
    return table.concat(runTable(tab), '')
  end

  table.toJsString = table.toJsString or function(tab, space)
    space = space or '  '
    return table.concat(runTable(tab, space), '\n')
  end
end)()
local nLog = nLog or function() end

local getLength = table.length or function(target)
  local length = 0
  for k, v in ipairs(target) do
    length = k
  end
  return length
end

local isArray = table.isArray or function(tab)
  if (type(tab) ~= "table") then
    return false
  end
  local length = getLength(tab)
  for k, v in pairs(tab) do
    if ((type(k) ~= "number") or (k > length)) then
      return false
    end
  end
  return true
end

local __console = console or {}

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


__console.log = __console.log or function(obj)
  local js = table.concat(runTable(obj, 2), "\n")
  print(js)
  if useNlog then
    nLog(js)
  end
  return js
end

__console.getJsStr = function(obj)
  return table.concat(runTable(obj, 2), ",\n")
end

__console.color = function(value)
  local resultStr = ''
  local color = getColor(value[1], value[2])
  local oldColor = value[3]
  local colorStr = string.format('0x%06x', color)
  local oldColorStr = string.format('0x%06x', oldColor)
  value[3] = oldColorStr
  if (color == oldColor) then
    resultStr = resultStr .. '\n' .. table.concat(runTable(value), "")
  else
    value[3] = colorStr
    resultStr = resultStr .. '\n' .. table.concat(runTable(value), "") .. '  old Color: ' .. oldColorStr
  end
  __console.log(resultStr)
end

console = __console
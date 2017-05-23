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

local function runTable(tab, thisKey, space)
  local prefix = thisKey
  local suffix = ","
  if (type(thisKey) ~= "nil") then
    prefix = thisKey .. ": "
    suffix = ","
  else
    prefix = ""
  end
  if (type(tab) == "number") then
    return { prefix .. "" .. tab .. suffix }
  end
  if (type(tab) == "string") then
    return { prefix .. '"' .. tab .. '"' .. suffix }
  end
  if (type(tab) == "boolean") then
    if (tab) then
      return { prefix .. "true" .. suffix }
    else
      return { prefix .. "false" .. suffix }
    end
  end
  if (type(tab) ~= "table") then
    return prefix .. "(" .. type(tab) .. ")" .. suffix
  end
  if (type(space) ~= "string") then
    space = "  "
  end

  local resultStrList = {}

  local newTabPairs = {}
  local tabIsArray = true
  local tabLength = 0
  local hasSubTab = false

  for k, v in ipairs(tab) do
    tabLength = k
    table.insert(newTabPairs, { k, runTable(v, k, space) })
    if (type(v) == 'table') then
      hasSubTab = true
    end
  end

  for k, v in pairs(tab) do
    if ((type(k) ~= 'number') or k > tabLength) then
      tabIsArray = false
      table.insert(newTabPairs, { k, runTable(v, k, space) })
      if (type(v) == 'table') then
        hasSubTab = true
      end
    end
  end

  if (tabIsArray) then
    local newTabArr = {}
    for k, v in ipairs(newTabPairs) do
      table.insert(newTabArr, v[2])
    end

    if (hasSubTab) then
      table.insert(resultStrList, prefix .. "[")
      for k, v in ipairs(newTabArr) do
        for k2, v2 in ipairs(v) do
          table.insert(resultStrList, space .. v2)
        end
      end
      table.insert(resultStrList, "]" .. suffix)
    else
      local theStr = {}
      for k, v in ipairs(newTabPairs) do
        table.insert(theStr, v[1])
      end
      local childStr = table.concat(theStr, ", ")
      table.insert(resultStrList, prefix .. "[" .. childStr .. "]" .. suffix)
    end
  else
    local newTabArr = newTabPairs

    table.insert(resultStrList, prefix .. "{")
    for k, v in ipairs(newTabArr) do
      for k2, v2 in ipairs(v[2]) do
        table.insert(resultStrList, space .. v2 .. "")
      end
    end
    table.insert(resultStrList, "}" .. suffix)
  end
  return resultStrList
end

__console.log = __console.log or function(obj)
  local js = table.concat(runTable(obj), "\n")
  print(js)
  nLog(js)
  return js
end

__console.getJsStr = function(obj)
  return table.concat(runTable(obj), ",\n")
end

__console.color = function(value)
  local resultStr = ''
  local color = getColor(value[1], value[2])
  local oldColor = value[3]
  local colorStr = string.format('0x%06x', color)
  local oldColorStr = string.format('0x%06x', oldColor)
  value[3] = oldColorStr
  if (color == oldColor) then
    resultStr = resultStr .. '\n' .. runTable(value)
  else
    value[3] = colorStr
    resultStr = resultStr .. '\n' .. runTable(value) .. '  old Color: ' .. oldColorStr
  end
  __console.log(resultStr)
end

console = __console
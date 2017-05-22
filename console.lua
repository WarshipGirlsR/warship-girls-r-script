local nLog = nLog or function() end
local isArray = table.isArray or function(tab)
  if (type(tab) ~= "table") then
    return false
  end
  local length = #tab
  for k, v in pairs(tab) do
    if ((type(k) ~= "number") or (k > length)) then
      return false
    end
  end
  return true
end

local __console = console or {}

local function runTable(tab, space)
  if (type(tab) == "number") then
    return "" .. tab
  end
  if (type(tab) == "string") then
    return '"' .. tab .. '"'
  end
  if (type(tab) == "boolean") then
    return tab and "true" or "false"
  end
  if (type(tab) == "nil") then
    return "no message"
  end
  if (type(tab) ~= "table") then
    return "(" .. type(tab) .. ")"
  end
  if (type(space) ~= "string") then
    space = ""
  end
  local newTab = {}
  local childSpace = space .. "  "
  if (isArray(tab)) then
    for k, v in ipairs(tab) do
      table.insert(newTab, runTable(v, childSpace))
    end
    local childStr = table.concat(newTab, ", ")

    if (string.len(childStr) > 50) then
      newTab = {}
      for k, v in ipairs(tab) do
        table.insert(newTab, childSpace .. runTable(v, childSpace))
      end
      childStr = table.concat(newTab, ", \n")
      return "[\n" .. childStr .. " \n" .. childSpace .. "]"
    end

    return space .. "[" .. childStr .. "]"
  else
    for k, v in pairs(tab) do
      table.insert(newTab, childSpace .. k .. ": " .. runTable(v, childSpace))
    end
    return "{\n" .. table.concat(newTab, ", \n") .. " \n" .. space .. "}"
  end
end

__console.log = __console.log or function(obj)
  local js = runTable(obj)
  print(js)
  nLog(js)
  return js
end

__console.getJsStr = function(obj)
  return runTable(obj)
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
-- table方法添加
local __tmp = (function()
  table.length = table.length or function(target)
    local length = 0
    for k, v in ipairs(target) do
      length = k
    end
    return length
  end

  table.isArray = table.isArray or function(tab)
    if (type(tab) ~= "table") then
      return false
    end
    local length = table.length(tab)
    for k, v in pairs(tab) do
      if ((type(k) ~= "number") or (k > length)) then
        return false
      end
    end
    return true
  end

  table.slice = table.slice or function(tab, startIndex, endIndex)
    local length = #tab
    if ((type(endIndex) == "nil") or (endIndex == 0)) then
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
    if (type(exp) == "nil") then exp = "," end
    return table.concat(tab, exp)
  end

  table.merge = table.merge or function(tab, ...)
    local args = { ... }
    for k, tabelement in ipairs(args) do
      local length = #tabelement
      for k2, value in ipairs(tabelement) do
        if ((type(k2) == "number") and (k2 <= length)) then
          table.insert(tab, value)
        end
      end
      for k2, value in pairs(tabelement) do
        if ((type(k2) == "number") and (k2 <= length)) then
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

  table.uniqueOf = table.uniqueOf or function(target, path)
    local theMap = {}
    local result = {}
    if (type(path) == 'nil') then
      for key, value in ipairs(target) do
        if (type(theMap[value]) == 'nil') then
          theMap[value] = value
          table.insert(result, value)
        end
      end
    elseif ((type(path) == 'number') or type(path) == 'string') then
      for key, value in ipairs(target) do
        console.log(value)
        if (type(theMap[value[path]]) == 'nil') then
          theMap[value[path]] = value
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
    if (type(call) == "function") then
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

  table.toString = table.toString or function(tab, space)
    if ((type(tab) == "function")) then
      return "[function]"
    end
    if ((type(tab) == "number") or (type(tab) == "string")) then
      return "" .. tab
    end
    if (type(tab) == "boolean") then
      return tab and "true" or "false"
    end
    if (type(tab) == "nil") then
      return "no message"
    end
    if (type(tab) ~= "table") then
      return "[" .. type(tab) .. "]"
    end
    if (type(space) ~= "string") then
      space = ""
    end
    local newTab = {}
    local childSpace = space .. "  "
    for k, v in pairs(tab) do
      table.insert(newTab, childSpace .. k .. ": " .. table.toString(v, childSpace))
    end
    return "{\n" .. table.concat(newTab, ", \n") .. " \n" .. space .. "}"
  end

  table.toJsString = table.toJsString or function(tab, other, space)
    if ((type(tab) == "function")) then
      return "[function]"
    end
    if ((type(tab) == "number") or (type(tab) == "string")) then
      return "" .. tab
    end
    if (type(tab) == "boolean") then
      return tab and "true" or "false"
    end
    if (type(tab) == "nil") then
      return "no message"
    end
    if (type(tab) ~= "table") then
      return "[" .. type(tab) .. "]"
    end
    if (type(space) ~= "string") then
      space = ""
    end
    local isArray = table.isArray(tab)
    local newTab = {}
    local childSpace = space .. "  "
    if (isArray) then
      for k, v in ipairs(tab) do
        table.insert(newTab, table.toJsString(v, other, childSpace))
      end
      local childStr = table.concat(newTab, ", ")

      if (string.len(childStr) > 50) then
        newTab = {}
        for k, v in ipairs(tab) do
          table.insert(newTab, childSpace .. table.toJsString(v, other, childSpace))
        end
        childStr = table.concat(newTab, ", \n")
        return "[\n" .. childStr .. " \n" .. childSpace .. "]"
      end

      return space .. "[" .. childStr .. "]"
    else
      for k, v in pairs(tab) do
        if ((other == true) or (type(v) ~= "function")) then
          table.insert(newTab, childSpace .. k .. ": " .. table.toJsString(v, childSpace))
        end
      end
      return "{\n" .. table.concat(newTab, ", \n") .. " \n" .. space .. "}"
    end
  end
end)()
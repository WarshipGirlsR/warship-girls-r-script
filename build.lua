
package.preload["commander"] = assert(load("-- 处理输入参数\
require 'string-split'\
\
local commander = {\
  keys = {},\
  params = {},\
}\
\
local optionKey = {}\
\
commander.option = function(key, defaultValue)\
  key = key or ''\
  if type(key) == 'table' then\
  end\
  local optionObj = {\
    keys = {},\
    key = defaultValue,\
    defaultValue = defaultValue,\
  }\
  local keyArr = key:split(',')\
  for k, v in ipairs(keyArr) do\
    local theK = v:gsub('^%s*(.-)%s*$', '%1'):gsub('^-+', '')\
    optionObj.key = theKey\
    table.insert(optionObj.keys, theK)\
  end\
  for k, v in ipairs(optionObj.keys) do\
    optionKey[v] = optionObj\
  end\
  for k, v in ipairs(optionObj.keys) do\
    table.insert(commander.keys, v)\
  end\
  for k, v in ipairs(optionObj.keys) do\
    if defaultValue ~= nil then\
      commander.params[v] = defaultValue\
    end\
  end\
  return commander\
end\
\
commander.parse = function(params)\
  params = params or {}\
  local i = 1\
  local paramsLength = #params\
  while i <= paramsLength do\
    if type(params[i]) == 'string' then\
      local theKey = params[i]:gsub('^%s*(.-)%s*$', '%1'):gsub('^-+', '')\
      if params[i]:gmatch('^-') and optionKey[theKey] then\
        local optionObj = optionKey[theKey]\
        local theParam = params[i + 1] ~= nil and params[i + 1] or true\
        for k, v in ipairs(optionObj.keys) do\
          commander.params[v] = theParam\
        end\
        i = i + 1\
      end\
    end\
    i = i + 1\
  end\
  return commander\
end\
\
return commander\
", "@" .."commander.lua"))


package.preload["console"] = assert(load("local console = console or {}\
local __console = {}\
for key, value in pairs(console) do\
  __console[key] = value\
end\
\
\
local getLength = table.length or function(target)\
  local length = 0\
  for k, v in ipairs(target) do\
    length = k\
  end\
  return length\
end\
\
local isArray = table.isArray or function(tab)\
  if (type(tab) ~= \"table\") then\
    return false\
  end\
  local length = getLength(tab)\
  for k, v in pairs(tab) do\
    if ((type(k) ~= \"number\") or (k > length)) then\
      return false\
    end\
  end\
  return true\
end\
\
\
local function runTable(tab, space)\
  if type(tab) == 'number' then\
    return { tostring(tab) }\
  end\
  if type(tab) == 'string' then\
    if string.len(tab) > 1000 then\
      return { '\"' .. string.sub(tab, 1, 1000) .. '...\"' }\
    end\
    return { '\"' .. tab .. '\"' }\
  end\
  if type(tab) == 'boolean' then\
    if (tab) then\
      return { 'true' }\
    else\
      return { 'false' }\
    end\
  end\
  if type(tab) ~= 'table' then\
    return { '(' .. type(tab) .. ')' }\
  end\
  if type(space) == 'number' then\
    space = string.rep(' ', space)\
  end\
  if type(space) ~= 'string' then\
    space = ''\
  end\
\
  local resultStrList = {}\
  local newTabPairs = {}\
  local newTabPairsKeys = {}\
  local tabIsArray = true\
  local tabLength = 0\
  local hasSubTab = false\
\
  -- 将 table 的数组部分取出\
  for k, v in ipairs(tab) do\
    tabLength = k\
    table.insert(newTabPairs, { k, runTable(v, space) })\
    if (type(v) == 'table') then\
      hasSubTab = true\
    end\
  end\
\
  -- 将 table 的 map 部分取出，并按照字典顺序排序\
  for k, v in pairs(tab) do\
    if type(k) ~= 'number' or k > tabLength or k < 1 then\
      tabIsArray = false\
      table.insert(newTabPairsKeys, k)\
      if (type(v) == 'table') then\
        hasSubTab = true\
      end\
    end\
  end\
\
  table.sort(newTabPairsKeys)\
  for _, k in ipairs(newTabPairsKeys) do\
    table.insert(newTabPairs, { k, runTable(tab[k], space) })\
  end\
\
  if (tabIsArray) then\
    local newTabArr = newTabPairs\
\
    if (hasSubTab) then\
      table.insert(resultStrList, '[')\
      for k, v in ipairs(newTabArr) do\
        local v2Length = getLength(v[2])\
        v[2][v2Length] = v[2][v2Length] .. ','\
        for k2, v2 in ipairs(v[2]) do\
          table.insert(resultStrList, space .. v2)\
        end\
      end\
      table.insert(resultStrList, ']')\
    else\
      local theStr = {}\
      for k, v in ipairs(newTabPairs) do\
        table.insert(theStr, v[2][1])\
      end\
      local childStr = table.concat(theStr, ', ')\
      table.insert(resultStrList, '[' .. childStr .. ']')\
    end\
  else\
    local newTabArr = newTabPairs\
\
    table.insert(resultStrList, '{')\
    for k, v in ipairs(newTabArr) do\
      v[2][1] = v[1] .. ': ' .. v[2][1]\
      local v2Length = getLength(v[2])\
      v[2][v2Length] = v[2][v2Length] .. ','\
      for k2, v2 in ipairs(v[2]) do\
        table.insert(resultStrList, space .. v2 .. '')\
      end\
    end\
    table.insert(resultStrList, '}')\
  end\
  return resultStrList\
end\
\
\
__console.log = __console.log or function(obj)\
  local info = debug.getinfo(2, 'Sl')\
  local lineInfo = ''\
  if info.currentline then\
    lineInfo = info.source .. ': ' .. info.currentline .. ': '\
  end\
  local js = table.concat(runTable(obj, 2), \"\\n\")\
  print(lineInfo .. '\\n' .. js)\
  return js\
end\
\
__console.getJsStr = function(obj)\
  return table.concat(runTable(obj, 2), \",\\n\")\
end\
\
__console.color = function(value)\
  local resultStr = ''\
  local color = getColor(value[1], value[2])\
  local oldColor = value[3]\
  local colorStr = string.format('0x%06x', color)\
  local oldColorStr = string.format('0x%06x', oldColor)\
  value[3] = oldColorStr\
  if (color == oldColor) then\
    resultStr = resultStr .. '\\n' .. table.concat(runTable(value), \"\")\
  else\
    value[3] = colorStr\
    resultStr = resultStr .. '\\n' .. table.concat(runTable(value), \"\") .. '  old Color: ' .. oldColorStr\
  end\
  __console.log(resultStr)\
end\
\
for key, value in pairs(__console) do\
  console[key] = value\
end\
return console\
", "@" .."console.lua"))


package.preload["path"] = assert(load("local path = {}\
path.basename = function(thePath)\
  thePath = string.gsub(thePath, '\\\\', '/')\
  thePath = string.gsub(thePath, '//+', '/')\
  local thePathArray = string.split(thePath, '/')\
  local res = table.remove(thePathArray)\
  return res\
end\
path.dirname = function(thePath)\
  thePath = string.gsub(thePath, '\\\\', '/')\
  thePath = string.gsub(thePath, '//+', '/')\
  local thePathArray = string.split(thePath, '/')\
  table.remove(thePathArray)\
  return table.concat(thePathArray, '/')\
end\
path.extname = function()\
end\
path.join = function(...)\
  local pathArray = { ... }\
  local resultPathArray = {}\
  for key = 1, #pathArray do\
    if pathArray[key] ~= '' then\
      if type(pathArray[key]) ~= 'string' then\
        error('bad argument #' .. key .. ' to \\'path.join\\' (string expected, got ' .. type(pathArray[key]) .. ')', 2)\
      end\
      local thePath = string.gsub(pathArray[key], '\\\\', '/')\
      thePath = string.gsub(thePath, '//+', '/')\
      local thePathArray = string.split(thePath, '/')\
      for key2 = 1, #thePathArray do\
        local theName = thePathArray[key2]\
        if theName == '' and #resultPathArray > 0 then\
        elseif theName == '.' and #resultPathArray > 0 then\
        elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '' then\
          table.remove(resultPathArray)\
        elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '.' then\
          resultPathArray = { '..' }\
        elseif theName == '..' and #resultPathArray > 0 then\
          table.remove(resultPathArray)\
        else\
          table.insert(resultPathArray, theName)\
        end\
      end\
    end\
  end\
  return table.concat(resultPathArray, '/')\
end\
path.relative = function()\
end\
path.resolve = function(...)\
  local pathArray = { ... }\
  local resultPathArray = {}\
  for key = 1, #pathArray do\
    if pathArray[key] ~= '' then\
      local thePath = string.gsub(string.gsub(pathArray[key], '\\\\', '/'), '/$', '')\
      thePath = string.gsub(thePath, '//+', '/')\
      local thePathArray = string.split(thePath, '/')\
      for key2 = 1, #thePathArray do\
        local theName = thePathArray[key2]\
        if theName == '' and key2 == 1 then\
          resultPathArray = { '' }\
        elseif theName == '.' and #resultPathArray > 0 then\
        elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '' then\
          table.remove(resultPathArray)\
        elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '.' then\
          resultPathArray = { '..' }\
        elseif theName == '..' and #resultPathArray > 0 then\
          table.remove(resultPathArray)\
        else\
          table.insert(resultPathArray, theName)\
        end\
      end\
    end\
  end\
  return table.concat(resultPathArray, '/')\
end\
return path\
", "@" .."path.lua"))


package.preload["string-split"] = assert(load("-- 字符串分割\
-- 防止有人覆盖 string 方法\
local myString = {}\
local tmpString = {}\
for key, value in pairs(string) do\
  tmpString[key] = value\
end\
tmpString.split = myString.split or function(str, d)\
  if str == '' and d ~= '' then\
    return { str }\
  elseif str ~= '' and d == '' then\
    local lst = {}\
    for key = 1, tmpString.len(str) do\
      table.insert(lst, tmpString.sub(str, key, 1))\
    end\
    return lst\
  else\
    local lst = {}\
    local n = tmpString.len(str) --长度\
    local start = 1\
    while start <= n do\
      local i = tmpString.find(str, d, start) -- find 'next' 0\
      if i == nil then\
        table.insert(lst, tmpString.sub(str, start, n))\
        break\
      end\
      table.insert(lst, tmpString.sub(str, start, i - 1))\
      if i == n then\
        table.insert(lst, '')\
        break\
      end\
      start = i + 1\
    end\
    return lst\
  end\
end\
for key, value in pairs(tmpString) do\
  string[key] = string[key] or value\
end\
return myString\
", "@" .."string-split.lua"))


package.preload["index"] = assert(load("require 'string-split'\
local path = require 'path'\
console = require 'console'\
local program = require 'commander'\
\
-- 获取参数\
program.option('-e, --entry', 'main.lua')\
program.option('-o, --output', 'main-min.lua')\
program.option('-d, --debug', false)\
program.parse(arg)\
local loadedList = {}\
local preloadList = {}\
\
-- 检查 output 文件是否可写\
do\
  local outputFile, err = io.open(program.params.output, 'w')\
  if err then\
    console.log(err)\
    if outputFile then\
      outputFile:close()\
    end\
    os.exit()\
  end\
  outputFile:close()\
end\
\
-- The approach for embedding precompiled Lua files is different from\
-- the normal way of pasting the source code, so this function detects\
-- whether a file is a binary file (Lua bytecode starts with the `ESC`\
-- character):\
local function is_bytecode(path)\
  local f, res = io.open(path, \"rb\"), false\
  if f then\
    res = f:read(1) == \"\\027\"\
    f:close()\
  end\
  return res\
end\
\
\
-- Read the whole contents of a file into memory without any\
-- processing.\
local function readfile(path, is_bin)\
  local f = assert(io.open(path, is_bin and \"rb\" or \"r\"))\
  local s = assert(f:read(\"*a\"))\
  f:close()\
  return s\
end\
\
\
-- Lua files to be embedded into the resulting amalgamation are read\
-- into memory in a single go, because under some circumstances (e.g.\
-- binary chunks, shebang lines, `-d` command line flag) some\
-- preprocessing/escaping is necessary. This function reads a whole\
-- Lua file and returns the contents as a Lua string.\
local function readluafile(path)\
  local is_bin = is_bytecode(path)\
  local s = readfile(path, is_bin)\
  local shebang\
  if not is_bin then\
    -- Shebang lines are only supported by Lua at the very beginning\
    -- of a source file, so they have to be removed before the source\
    -- code can be embedded in the output.\
    shebang = s:match(\"^(#![^\\n]*)\")\
    s = s:gsub(\"^#[^\\n]*\", \"\")\
  end\
  return s, is_bin, shebang\
end\
\
-- Lua 5.1's `string.format(\"%q\")` doesn't convert all control\
-- characters to decimal escape sequences like the newer Lua versions\
-- do. This might cause problems on some platforms (i.e. Windows) when\
-- loading a Lua script (opened in text mode) that contains binary\
-- code.\
local function qformat(code)\
  local s = (\"%q\"):format(code)\
  return (s:gsub(\"(%c)(%d?)\", function(c, d)\
    if c ~= \"\\n\" then\
      return (d ~= \"\" and \"\\\\%03d\" or \"\\\\%d\"):format(c:byte()) .. d\
    end\
  end))\
end\
\
\
local function readFileToTable(file)\
  local result = {}\
  for i = 0, math.huge do\
    local line = file:read('*line')\
    table.insert(result, line)\
    if line == nil then\
      break\
    end\
  end\
  return result\
end\
\
local entryFile, err = io.open(program.params.entry, 'r')\
if err then\
  console.log(err)\
  if file then\
    entryFile:close()\
  end\
  os.exit()\
end\
local entryData = entryFile:read('*all')\
entryFile:close()\
\
local preloadEntry = {\
  path = program.params.entry,\
  name = program.params.entry:gsub('%.lua', ''):gsub('^[^%w-_]*', ''),\
}\
table.insert(preloadList, preloadEntry)\
preloadList[preloadEntry.name] = preloadEntry\
\
while #preloadList > 0 do\
  local preloadObj = preloadList[1]\
  table.remove(preloadList, 1)\
  local entryFile, err = io.open(preloadObj.path, 'r')\
  if not err then\
    console.log('build file: ' .. preloadObj.path)\
    local codeSource, is_bin = readluafile(preloadObj.path)\
    local requireSource = ''\
    if preloadObj.path:match('^%./') or preloadObj.path:match('^%.%./') or preloadObj.path:match('^/') then\
      requireSource = '\\npackage.sourceCode = package.sourceCode or {}\\npackage.sourceCode[' .. qformat(preloadObj.name) .. '] = { path = ' .. qformat(preloadObj.path) .. ', name = ' .. qformat(preloadObj.name) .. ', source = ' .. qformat(codeSource) .. ' }' .. '\\n'\
    else\
      requireSource = '\\npackage.preload[\"' .. preloadObj.name .. '\"] = assert(load(' .. qformat(codeSource) .. ', \"@\" ..' .. qformat(preloadObj.path) .. '))' .. '\\n'\
    end\
    preloadObj.sourceCode = requireSource\
    table.insert(loadedList, preloadObj.sourceCode)\
\
    local dirName = path.dirname(preloadObj.path)\
    if not is_bin then\
      -- 寻找文件require的内容\
      for value in codeSource:gmatch('require%s*%(?[\"\\']([%w-_%./\\\\]+)[\"\\']%)?') do\
        local subRequirePath = value\
        if not value:match('%.lua$') then\
          subRequirePath = value .. '.lua'\
        end\
        if subRequirePath:match('^%./') or subRequirePath:match('^%.%./') or subRequirePath:match('^/') then\
          local subRequireAbsolutePath = path.resolve(dirName, subRequirePath)\
          local obj = {\
            path = subRequireAbsolutePath,\
            name = subRequireAbsolutePath,\
          }\
          if not preloadList[obj.name] then\
            table.insert(preloadList, obj)\
            preloadList[obj.name] = obj\
          end\
        else\
          local obj = {\
            path = subRequirePath,\
            name = subRequirePath:gsub('%.lua', ''),\
          }\
          if not preloadList[obj.name] then\
            table.insert(preloadList, obj)\
            preloadList[obj.name] = obj\
          end\
        end\
      end\
    end\
  else\
    console.log(err)\
  end\
  if entryFile then\
    entryFile:close()\
  end\
end\
\
local outputFile, err = io.open(program.params.output, 'w')\
if err then\
  console.log(err)\
  if outputFile then\
    outputFile:close()\
  end\
  os.exit()\
end\
\
for k = #loadedList, 1, -1 do\
  local v = loadedList[k]\
  outputFile:write(v)\
  outputFile:write('\\n')\
end\
outputFile:write('\\nrequire(\"' .. preloadEntry.name .. '\")\\n')\
outputFile:close()\
", "@" .."index.lua"))


require("index")

-- 重新载入这个脚本，以解决触动精灵使用 string 模式载入脚本导致无法获取脚本路径的问题
-- 触动精灵启动脚本以 string 方式载入，使得 debug 库无法获取载入脚本的路径。而使用 require 载入
-- 别的脚本后可以在别的脚本获得它的脚本路径。所以这里重新 require 一次自己以便获得脚本路径。
local projectBasePath
local extensions = {
  '.lua'
}

do
  local result = debug.getinfo(1, 'S')
  if string.match(result.short_src, '%[string') then
    local newMain = string.gsub(result.source, '%.lua$', '')
    package.loaded[newMain] = nil
    require(newMain)
    lua_exit()
    os.exit()
    return
  else
    projectBasePath = string.gsub(result.source, '^@', '')
  end
end


useNlog = true
local socket = require 'socket'
local sz = require 'sz'
local json = sz.json
originRequire = require
_require = require



-- 拦截 lua-require 的加载
do
  package.preload['lua-require'] = function(...)
    return setmetatable({}, { __call = function(self) return false end })
  end
end

-- 字符串分割
local myString = {}
do
  for key, value in pairs(string) do
    myString[key] = value
  end

  myString.split = myString.split or function(str, d)
    if str == '' and d ~= '' then
      return { str }
    elseif str ~= '' and d == '' then
      local lst = {}
      for key = 1, myString.len(str) do
        table.insert(lst, myString.sub(str, key, 1))
      end
      return lst
    else
      local lst = {}
      local n = myString.len(str) --长度
      local start = 1
      while start <= n do
        local i = myString.find(str, d, start) -- find 'next' 0
        if i == nil then
          table.insert(lst, myString.sub(str, start, n))
          break
        end
        table.insert(lst, myString.sub(str, start, i - 1))
        if i == n then
          table.insert(lst, '')
          break
        end
        start = i + 1
      end
      return lst
    end
  end
  for key, value in pairs(myString) do
    string[key] = string[key] or value
  end
end

local path = (function()
  local path = {}
  path.separator = myString.find(package.path, '/') and '/' or '\\'
  path.basename = function(thePath)
    thePath = myString.gsub(thePath, '\\', '/')
    local thePathArray = myString.split(thePath, '/')
    local res = table.remove(thePathArray)
    return res
  end
  path.dirname = function(thePath)
    thePath = myString.gsub(thePath, '\\', '/')
    local thePathArray = myString.split(thePath, '/')
    table.remove(thePathArray)
    return table.concat(thePathArray, path.separator)
  end
  path.extname = function()
  end
  path.join = function(...)
    local pathArray = { ... }
    local resultPathArray = {}
    for key = 1, #pathArray do
      if pathArray[key] ~= '' then
        local thePath = myString.gsub(pathArray[key], '\\', '/')
        local thePathArray = myString.split(thePath, '/')
        for key2 = 1, #thePathArray do
          local theName = thePathArray[key2]
          if theName == '' and #resultPathArray > 0 then
          elseif theName == '.' and #resultPathArray > 0 then
          elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '' then
            table.remove(resultPathArray)
          elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '.' then
            resultPathArray = { '..' }
          elseif theName == '..' and #resultPathArray > 0 then
            table.remove(resultPathArray)
          else
            table.insert(resultPathArray, theName)
          end
        end
      end
    end
    return table.concat(resultPathArray, path.separator)
  end
  path.relative = function()
  end
  path.resolve = function(...)
    local pathArray = { ... }
    local resultPathArray = {}
    for key = 1, #pathArray do
      if pathArray[key] ~= '' then
        local thePath = myString.gsub(myString.gsub(pathArray[key], '\\', '/'), '/$', '')
        local thePathArray = myString.split(thePath, '/')
        for key2 = 1, #thePathArray do
          local theName = thePathArray[key2]
          if theName == '' and key2 == 1 then
            resultPathArray = { '' }
          elseif theName == '.' and #resultPathArray > 0 then
          elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '' then
            table.remove(resultPathArray)
          elseif theName == '..' and #resultPathArray == 1 and resultPathArray[1] == '.' then
            resultPathArray = { '..' }
          elseif theName == '..' and #resultPathArray > 0 then
            table.remove(resultPathArray)
          else
            table.insert(resultPathArray, theName)
          end
        end
      end
    end
    return table.concat(resultPathArray, path.separator)
  end
  return path
end)()


-- 弹出面板
local luaNetLoadingPanel = function()
  local settingTable = {
    ['style'] = 'default',
    ['width'] = height,
    ['height'] = height,
    ['config'] = 'lua-net-loading.dat',
    ['timer'] = 5,
    ['orient'] = 1,
    ['pagetype'] = 'multi',
    ['title'] = '选项',
    ['cancelname'] = '取消',
    ['okname'] = '开始',
    ['rettype'] = 'table',
    ['pages'] = {
      {
        {
          ['type'] = 'Label',
          ['text'] = '第一次设置建议在竖屏下设置，设置好后再切换到游戏界面',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '向左滑动查看其他选项',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '服务器地址前缀',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'serverUrl',
          ['type'] = 'Edit',
          ['prompt'] = '服务器地址前缀',
          ['text'] = 'http://192.168.8.82:8080',
          ['kbtype'] = 'default',
        },
      },
    }
  }

  local settingTableStr = json.encode(settingTable)
  local ret, settings = showUI(settingTableStr)

  if (ret ~= 1) then
    -- --转换settings结果
    function transStrToTable(str)
      local list = {}
      local strArr = {}
      if (type(str) == 'string') then
        strArr = strSplit(str, ',')
      elseif (type(str) == 'table') then
        strArr = str
      end
      for i, v in ipairs(strArr) do
        list['' .. (i - 1)] = v
      end
      return list
    end

    -- 服务器地址前缀
  end
  if not ret then
    return ret, settings
  end
  settings.serverUrl = (function(serverUrl)
    return myString.gsub(serverUrl, '/$', '')
  end)(settings.serverUrl)
  return ret, settings
end

local ret, settings = luaNetLoadingPanel()
if not ret then
  lua_exit()
end

local download = function(hostBasePath, projectDirName, filePath)
  filePath = path.resolve('/', filePath)
  local function fileExists(path)
    local file = io.open(path, 'rb')
    if file then file:close() end
    return file ~= nil
  end

  local response_body, code = socket.http.request(hostBasePath .. filePath)
  if code ~= 200 then
    return nil, code
  end
  if not fileExists(path.dirname(path.join(projectDirName, filePath))) then
    os.execute('mkdir -p ' .. path.dirname(path.join(projectDirName, filePath)))
  end
  if not fileExists(path.join(projectDirName, filePath)) then
    os.execute('echo "" > ' .. path.join(projectDirName, filePath))
  end
  local file, err = io.open(path.join(projectDirName, filePath), 'w')
  if not file then
    return nil, err
  end

  local context = ''

  if type(response_body) == 'table' then
    context = table.concat(response_body, '')
  elseif type(response_body) == 'string' then
    context = response_body
  elseif type(response_body) == 'number' then
    context = tostring(response_body)
  elseif type(response_body) == 'boolean' and response_body then
    context = 'true'
  elseif type(response_body) == 'boolean' and not response_body then
    context = 'false'
  end
  file:write(context)
  file:close()
  return context;
end

local requireFactory
requireFactory = function(dirPath)
  local projectDirName = path.dirname(projectBasePath)
  return function(loadpath)
    if type(loadpath) ~= 'string' then
      error('bad argument #1 to \'require\' (string expected, got ' .. type(loadpath) .. ')', 2)
    end

    if myString.match(loadpath, '^%.%/') or myString.match(loadpath, '^%.%.%/') or myString.match(loadpath, '^%/') then
      local requirePath
      local absolutePath

      -- 遍历扩展名列表并尝试在 package.loaded 里寻找已加载的模块
      for key = 1, #extensions do
        local rp = path.resolve(dirPath, loadpath .. extensions[key])
        if package.loaded[rp] then
          requirePath = rp
          absolutePath = path.join(projectDirName, rp)
          break
        end
      end
      -- 如果 package.loaded 中没有需要的模块
      if not requirePath or not package.loaded[requirePath] then
        -- 遍历扩展名列表并尝试在 package.preload 里寻找已加载的模块
        for key = 1, #extensions do
          local rp = path.resolve(dirPath, loadpath .. extensions[key])
          if package.preload[rp] then
            requirePath = rp
            absolutePath = path.join(projectDirName, rp)
            break
          end
        end
        -- 如果 package.preload 中没有需要的模块
        if not requirePath or not package.preload[requirePath] then
          local requireSource
          local file
          local errArr = {}
          -- 遍历扩展名列表并尝试从网络中寻找模块
          for key = 1, #extensions do
            local rp = path.resolve(dirPath, loadpath .. extensions[key])
            local requireSource, err = download(settings.serverUrl, projectDirName, rp)
            if not requireSource then
              table.insert(errArr, err)
            end
            -- 成功读取文件，返回项目路径和系统路径
            if requireSource then
              requirePath = rp
              absolutePath = ap
              break
            end
          end

          if not requireSource then
            -- 遍历扩展名列表并尝试从文件中寻找模块
            for key = 1, #extensions do
              local rp = path.resolve(dirPath, loadpath .. extensions[key])
              local ap = path.join(projectDirName, rp)
              local res, err = pcall(function()
                local theFile = assert(io.open(ap, 'r'))
                file = theFile
                requireSource = file:read('*a')
              end)
              if not res then
                table.insert(errArr, err)
              end
              -- 成功读取文件，返回项目路径和系统路径
              if requireSource then
                requirePath = rp
                absolutePath = ap
                break
              end
            end
          end
          -- 如果都没找到能执行的文件，则抛出错误
          if not requireSource then
            error(table.concat(errArr, '\r\n'), 2)
          end
          if file then
            file.close()
          end
          requireSource = 'local require, modePath = ...; ' .. requireSource
          package.preload[requirePath] = assert(load(requireSource, '@' .. absolutePath, 'bt', _ENV))
        end
        package.loaded[requirePath] = package.preload[requirePath](requireFactory(path.dirname(requirePath)), requirePath) or true
        -- 载入完成以后删除 package.preloaded 里的内容
        package.preload[requirePath] = nil
      end
      return package.loaded[requirePath]
    else
      local requireRes
      local res, err = pcall(function()
        requireRes = originRequire(loadpath)
      end)
      if not res then
        error(err, 2)
      end
      return requireRes
    end
  end
end

requireFactory('/')('./azur_lane')

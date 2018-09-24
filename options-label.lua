local json = require './lib/json'
local stepLabel = require './utils/step-label'

local width, height = getScreenSize()

-- 从name提取路径
local nameToTablePath = function(name)
  local tablePath = {}
  local tmp = name
  while tmp and tmp ~= '' do
    if tmp:match('^%[') then
      local res = tmp:match('^%[([^%]]*)%]')
      local num = tonumber(res)
      table.insert(tablePath, num and num or res)
      tmp = tmp:gsub('^%[[^%]]*%]', '')
    elseif tmp:match('^%.') then
      table.insert(tablePath, '')
      tmp = tmp:gsub('^%.', '')
    else
      table.insert(tablePath, tmp:match('^[^%[^%]^%.]*'))
      tmp = tmp:gsub('^[^%[^%]^%.]*', ''):gsub('^[%.]', '')
    end
  end
  return tablePath
end

-- 根据路径在 table 中添加一个值
local setValue = function(tab, thePath, value)
  thePath = thePath or {}
  if type(thePath) == 'string' then
    thePath = nameToTablePath(thePath)
  end
  local headPoint = tab
  for k, v in ipairs(thePath) do
    if k < #thePath then
      headPoint[v] = headPoint[v] or {}
      headPoint = headPoint[v]
    else
      headPoint[v] = value
    end
  end
  return tab
end

-- 设置
return function()
  local settingTable = {
    ['style'] = 'default',
    ['width'] = height,
    ['height'] = height,
    ['config'] = 'save_warship-girls-r-script.dat',
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
          ['text'] = '四周年e6k，使用前请先切换到6个地图界面，并且准备好队伍。请先手动打几次确保稳定,
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
      },
    },
  }

  local settingTableStr = json.encode(settingTable);
  local ret, settings = showUI(settingTableStr);
  if (ret ~= 1) then
    stepLabel.setStepLabelContent('取消运行')
    mSleep(100000)
    lua_exit()
  end
  stepLabel.setStepLabelContent('正在载入...')
  -- --转换settings结果
  function transStrToTable(str)
    local list = {}
    local strArr = {}
    if (type(str) == 'string') then
      strArr = strSplit(str, ',')
    elseif (type(str) == 'table') then
      strArr = str
    end
    for i = 1, #strArr do
      local v = strArr[i]
      list['' .. (i - 1)] = v
    end
    return list
  end

  return ret, settings
  -- --转换settings结果
end
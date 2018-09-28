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
          ['text'] = '四周年，使用前请先切换到6个地图界面，并且准备好队伍。请先手动打几次确保稳定。\n分辨率：1920*1080',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '关卡',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleActivityChapter',
          ['type'] = 'RadioGroup',
          ['list'] = 'e3o(e9o),e6k(e12k)',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '入口',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleActivityIntry',
          ['type'] = 'RadioGroup',
          ['list'] = '不选择,α点,β点',
          ['select'] = '1',
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

  -- 章节
  settings.battleActivityChapter = (function(battleActivityChapter)
    local list = transStrToTable({
      { name = 'e3o', chapter = 3 }, { name = 'e6k', chapter = 6 },
    })
    return list[battleActivityChapter] or {}
  end)(settings.battleActivityChapter)
  -- 入口
  settings.battleActivityIntry = (function(battleActivityIntry)
    local list = transStrToTable({ 'manule', 'a', 'b' })
    return list[battleActivityIntry] or {}
  end)(settings.battleActivityIntry)

  return ret, settings
  -- --转换settings结果
end
-- 删除大于7天并且大于50条的log，避免日志过大
local lfs = require './lfs'
local logPath = userPath() .. '/log'
local dirs = lfs.dir(logPath)
local sevenDayBeforeTime = os.time() - (7 * 24 * 60 * 60)
local theTime = os.time()

local dirsLen = #dirs

dirs = table.filter(dirs, function(e, index)
  if (string.startWith(e, 'warship-girls-r-script_')) then
    local res = string.match(e, 'warship-girls-r-script_(%d+)')
    res = tonumber(res) or theTime
    if ((index < (dirsLen - 50)) and (res < sevenDayBeforeTime)) then
      return true
    end
  end
  return false
end)

for k, v in ipairs(dirs) do
  lfs.rm(logPath .. '/' .. v)
end

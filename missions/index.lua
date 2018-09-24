local home = require './home'local battle = require './battle'
local mission = require './mission'

-- 将分散在各个文件的任务集合到一起
local missions = {
  home,
  battle,
}

return missions
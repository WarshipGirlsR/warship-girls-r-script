local network = require 'BaseOperate__network'
local home = require 'BaseOperate__home'
local login = require 'BaseOperate__login'
local battle = require 'BaseOperate__battle'
local mission = require 'BaseOperate__mission'
local expedition = require 'BaseOperate__expedition'
local repair = require 'BaseOperate__repair'
local exercise = require 'BaseOperate__exercise'


-- 原子操作列表

local map = {
  network = network, -- 网络检查
  home = home, -- 主页
  login = login, -- 登录
  battle = battle, -- 出征
  mission = mission, -- 任务
  expedition = expedition, -- 远征
  repair = repair, -- 修理
  exercise = exercise, -- 演习
  campaign = campaign, -- 战役
}


return function()
  return map
end
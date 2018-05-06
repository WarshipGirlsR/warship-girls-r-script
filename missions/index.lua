local home = require './home'
local network = require './network'
local pause = require './pause'
local login = require './login'
local battle = require './battle'
local mission = require './mission'
local disintegrateShip = require './disintegrate-ship'
local expeditionReward = require './expedition-reward'
local expedition = require './expedition'
local repair = require './repair'
local exercise = require './exercise'
local campaign = require './campaign'

-- 将分散在各个文件的任务集合到一起
local missions = {
  home,
  network,
  pause,
  login,
  battle,
  mission,
  disintegrateShip,
  expeditionReward,
  expedition,
  repair,
  exercise,
  campaign,
}

return missions
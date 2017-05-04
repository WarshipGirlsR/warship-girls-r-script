-- 设置默认方向为竖屏，之后自己计算旋转方向
local debug = false
runCount = 1
local isPause = false
initLog("warship-girls-r-script", 0)

init(0)
require "KeepScreenHock"
require "TSLib"
require "DeviceOrientHock"
require "TableLib"
local sz = require "sz"
local socket = require "szocket.core"
local mapMaker = require "BaseOperate"
local gomissionMaker = require "GoMission"
local stepLabel = require "StepLabel"
local json = sz.json

local width, height = getScreenSize()


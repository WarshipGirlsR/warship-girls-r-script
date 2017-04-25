-- 设置默认方向为竖屏，之后自己计算旋转方向
local debug = false
runCount = 1
local isPause = false
initLog("shipr1-1", 0)

init(0)
require "src/KeepScreenHock"
require "src/TSLib"
require "src/DeviceOrientHock"
require "lib/TableLib"
local sz = require "sz"
local socket = require "szocket.core"
local mapMaker = require "src/BaseOperate"
local gomissionMaker = require "src/GoMission"
local stepLabel = require "src/StepLabel"
local json = sz.json

local width, height = getScreenSize()

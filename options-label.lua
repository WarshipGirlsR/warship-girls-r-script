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
          ['text'] = '任务',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'missionEnable',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '远征',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'expeditionEnable',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '出征',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleEnable',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '修理',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'repairEnable',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '解体',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'disintegrateShipEnable',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '演习',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'exerciseEnable',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '战役',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'campaignEnable',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '每一轮的间隔时间(秒)',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'missionsInterval',
          ['type'] = 'Edit',
          ['prompt'] = '最短间隔时间(秒)',
          ['text'] = '15',
          ['kbtype'] = 'number',
        },
        {
          ['type'] = 'Label',
          ['text'] = '多长时间画面不变则重启游戏(秒)最少60秒',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'restartInterval',
          ['type'] = 'Edit',
          ['prompt'] = '多长时间画面不变则重启游戏(秒)最少60秒',
          ['text'] = '120',
          ['kbtype'] = 'number',
        },
        {
          ['type'] = 'Label',
          ['text'] = '使用震动方式提醒',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'alertUseVibrate',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '使用pushbullet推送提醒(开启后必须填写token)',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'alertUsePushbullet',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = 'pushbullet的token',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'pushbulletsToken',
          ['type'] = 'Edit',
          ['prompt'] = 'token',
        },
        {
          ['type'] = 'Label',
          ['text'] = '设备别名，显示在pushbullet中',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'pushbulletNickname',
          ['type'] = 'Edit',
          ['prompt'] = '别名',
        },
        {
          ['type'] = 'Label',
          ['text'] = '使用文字识别增加精确度',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'useOcr',
          ['type'] = 'RadioGroup',
          ['list'] = '开启,关闭',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
          ['size'] = 50,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
      },
      {
        {
          ['type'] = 'Label',
          ['text'] = '远征设置',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '使用快修',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'expeditionQuickRepair',
          ['type'] = 'RadioGroup',
          ['list'] = '不满血,中破,大破,不使用',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '不能远征则报警',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'expeditionAlertWhenNoHp',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '自动参加的远征章节',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '5队',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'expeditionFleet1',
          ['type'] = 'RadioGroup',
          ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
          ['select'] = '2',
        },
        {
          ['type'] = 'Label',
          ['text'] = '6队',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'expeditionFleet2',
          ['type'] = 'RadioGroup',
          ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
          ['select'] = '5',
        },
        {
          ['type'] = 'Label',
          ['text'] = '7队',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'expeditionFleet3',
          ['type'] = 'RadioGroup',
          ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
          ['select'] = '6',
        },
        {
          ['type'] = 'Label',
          ['text'] = '8队',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'expeditionFleet4',
          ['type'] = 'RadioGroup',
          ['list'] = '不参加,1-1,1-2,1-3,1-4,2-1,2-2,2-3,2-4,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4',
          ['select'] = '13',
        },
        {
          ['type'] = 'Label',
          ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
          ['size'] = 50,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
      },
      {
        {
          ['type'] = 'Label',
          ['text'] = '演习设置',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '舰队',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'exerciseFleet',
          ['type'] = 'RadioGroup',
          ['list'] = '1队,2队,3队,4队',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '追击',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'exercisePursue',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '快修',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'exerciseQuickRepair',
          ['type'] = 'RadioGroup',
          ['list'] = '不满血,中破,大破,不使用',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'exerciseFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '单纵,复纵,轮型,梯形,单横',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '间隔多长时间检查一次',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'exerciseInterval',
          ['type'] = 'Edit',
          ['prompt'] = '间隔多长时间检查一次',
          ['text'] = '900',
          ['kbtype'] = 'number',
        },
        {
          ['type'] = 'Label',
          ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
          ['size'] = 50,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
      },

      {
        {
          ['type'] = 'Label',
          ['text'] = '战役设置',
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
          ['id'] = 'campaignChapter',
          ['type'] = 'RadioGroup',
          ['list'] = '驱逐,巡洋,战列,航母,潜艇',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '难度',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'campaignDifficulty',
          ['type'] = 'RadioGroup',
          ['list'] = '普通,困难',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '追击',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'campaignPursue',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '快修',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'campaignQuickRepair',
          ['type'] = 'RadioGroup',
          ['list'] = '不满血,中破,大破,不使用',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '不能出征则报警',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'campaignAlertWhenCantBattle',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'campaignFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '单纵,复纵,轮型,梯形,单横',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '间隔多长时间检查一次',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'campaignInterval',
          ['type'] = 'Edit',
          ['prompt'] = '间隔多长时间检查一次',
          ['text'] = '900',
          ['kbtype'] = 'number',
        },
        {
          ['type'] = 'Label',
          ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
          ['size'] = 50,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
      },

      {
        {
          ['type'] = 'Label',
          ['text'] = '修理设置',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '修理目标',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'repairAll',
          ['type'] = 'RadioGroup',
          ['list'] = '所有,不在舰队里的',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '间隔多长时间检查一次',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'repairInterval',
          ['type'] = 'Edit',
          ['prompt'] = '间隔多长时间检查一次',
          ['text'] = '1800',
          ['kbtype'] = 'number',
        },
      },

      {
        {
          ['type'] = 'Label',
          ['text'] = '解体设置',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '快速解体模式',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'disintegrateShipFastMode',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '间隔多长时间检查一次',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'disintegrateShipInterval',
          ['type'] = 'Edit',
          ['prompt'] = '间隔多长时间检查一次',
          ['text'] = '1800',
          ['kbtype'] = 'number',
        },
        {
          ['type'] = 'Label',
          ['text'] = ' \n \n \n \n \n \n \n \n \n \n',
          ['size'] = 50,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
      },
      {
        {
          ['type'] = 'Label',
          ['text'] = '出征设置',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '章节',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleChapter',
          ['type'] = 'RadioGroup',
          ['list'] = '手动,1-1,1-2,1-3,1-4,1-5,2-1,2-2,2-3,2-4,2-5,2-6,3-1,3-2,3-3,3-4,4-1,4-2,4-3,4-4,5-1,5-2,5-3,5-4,5-5,6-1,6-2,6-3,6-4,7-1,7-2,7-3,7-4,7-5',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '舰队',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleFleet',
          ['type'] = 'RadioGroup',
          ['list'] = '1队,2队,3队,4队',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '使用快修',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleQuickRepair',
          ['type'] = 'RadioGroup',
          ['list'] = '不满血,中破,大破,不使用',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '迂回',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleRoundabout',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '不能出征则报警',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleAlertWhenNoHp',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '最多几战',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleMaxBattleNum',
          ['type'] = 'RadioGroup',
          ['list'] = '1,2,3,4,5,6',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '特殊功能',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '6-1a点遇到航母SL',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleRebootAt6_1AMeetCV',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '6-1a点遇到雷巡SL',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleRebootAt6_1AMeetCit',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '没遇到补给就SL（捞胖次）',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleRebootAtNotMeetAP',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '战斗选项',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '战斗选项使用统一配置',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOptionUseMain',
          ['type'] = 'RadioGroup',
          ['list'] = '统一配置(在本页配置),单独配置(在后面的页面配置)',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[main]battleFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '单纵,复纵,轮型,梯形,单横',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '遇到潜艇自动切换单横阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[main]autoChangeFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '追击',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[main]battlePursue',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
      },
      {
        {
          ['type'] = 'Label',
          ['text'] = '第1战 -------------------------',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[1]battleFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '单纵,复纵,轮型,梯形,单横',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '遇到潜艇自动切换单横阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[1]autoChangeFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '追击',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[1]battlePursue',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
      },
      {
        {
          ['type'] = 'Label',
          ['text'] = '第2战 -------------------------',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[2]battleFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '单纵,复纵,轮型,梯形,单横',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '遇到潜艇自动切换单横阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[2]autoChangeFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '追击',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[2]battlePursue',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
      },
      {
        {
          ['type'] = 'Label',
          ['text'] = '第3战 -------------------------',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[3]battleFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '单纵,复纵,轮型,梯形,单横',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '遇到潜艇自动切换单横阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[3]autoChangeFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '追击',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[3]battlePursue',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
      },
      {
        {
          ['type'] = 'Label',
          ['text'] = '第4战 -------------------------',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[4]battleFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '单纵,复纵,轮型,梯形,单横',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '遇到潜艇自动切换单横阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[4]autoChangeFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '追击',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[4]battlePursue',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
      },
      {
        {
          ['type'] = 'Label',
          ['text'] = '第5战 -------------------------',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[5]battleFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '单纵,复纵,轮型,梯形,单横',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '遇到潜艇自动切换单横阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[5]autoChangeFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '追击',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[5]battlePursue',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '1',
        },
      },
      {
        {
          ['type'] = 'Label',
          ['text'] = '第6战 -------------------------',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[6]battleFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '单纵,复纵,轮型,梯形,单横',
          ['select'] = '1',
        },
        {
          ['type'] = 'Label',
          ['text'] = '遇到潜艇自动切换单横阵型',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[6]autoChangeFormation',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
          ['select'] = '0',
        },
        {
          ['type'] = 'Label',
          ['text'] = '追击',
          ['size'] = 15,
          ['align'] = 'left',
          ['color'] = '0,0,0',
        },
        {
          ['id'] = 'battleOption[6]battlePursue',
          ['type'] = 'RadioGroup',
          ['list'] = '是,否',
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

  -- 出征
  settings.battleEnable = (function(battleEnable)
    local list = transStrToTable({ true, false, })
    return list[battleEnable] or false
  end)(settings.battleEnable)
  -- 修理
  settings.repairEnable = (function(repairEnable)
    local list = transStrToTable({ true, false, })
    return list[repairEnable] or false
  end)(settings.repairEnable)
  -- 解体
  settings.disintegrateShipEnable = (function(disintegrateShipEnable)
    local list = transStrToTable({ true, false, })
    return list[disintegrateShipEnable] or false
  end)(settings.disintegrateShipEnable)
  -- 任务
  settings.missionEnable = (function(missionEnable)
    local list = transStrToTable({ true, false, })
    return list[missionEnable] or false
  end)(settings.missionEnable)
  -- 远征
  settings.expeditionEnable = (function(expeditionEnable)
    local list = transStrToTable({ true, false, })
    return list[expeditionEnable] or false
  end)(settings.expeditionEnable)
  -- 演习
  settings.exerciseEnable = (function(exerciseEnable)
    local list = transStrToTable({ true, false, })
    return list[exerciseEnable] or false
  end)(settings.exerciseEnable)
  -- 战役
  settings.campaignEnable = (function(campaignEnable)
    local list = transStrToTable({ true, false, })
    return list[campaignEnable] or false
  end)(settings.campaignEnable)
  -- 总循环间隔时间
  settings.missionsInterval = tonumber(settings.missionsInterval) or 0
  -- 多长时间界面不变则重启，最少60秒
  settings.restartInterval = tonumber(settings.restartInterval) or 120
  settings.restartInterval = math.max(settings.restartInterval, 60)
  -- 使用震动提醒
  settings.alertUseVibrate = (function(alertUseVibrate)
    local list = transStrToTable({ true, false, })
    return list[alertUseVibrate] or false
  end)(settings.alertUseVibrate)
  -- 使用pushbullet推送提醒
  settings.alertUsePushbullet = (function(alertUsePushbullet)
    local list = transStrToTable({ true, false, })
    return list[alertUsePushbullet] or false
  end)(settings.alertUsePushbullet)
  -- pushbullet的token
  settings.pushbulletsToken = settings.pushbulletsToken or ''
  -- pushbullet的设备别名
  settings.pushbulletNickname = settings.pushbulletNickname or ''
  -- 使用文字识别增加精确度
  settings.useOcr = (function(useOcr)
    local list = transStrToTable({ true, false })
    return list[useOcr] or false
  end)(settings.useOcr)
  -- 选择远征要参加的章节
  settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 = (function(fleet1, fleet2, fleet3, fleet4)
    local list = transStrToTable({
      false, '1-1', '1-2', '1-3', '1-4',
      '2-1', '2-2', '2-3', '2-4',
      '3-1', '3-2', '3-3', '3-4',
      '4-1', '4-2', '4-3', '4-4',
      '5-1', '5-2', '5-3', '5-4',
      '6-1', '6-2', '6-3', '6-4',
      '7-1', '7-2', '7-3', '7-4',
    })
    return (list[fleet1] or false), (list[fleet2] or false), (list[fleet3] or false), (list[fleet4] or false)
  end)(settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4)
  settings.expeditionFleetToChapter = { settings.expeditionFleet1, settings.expeditionFleet2, settings.expeditionFleet3, settings.expeditionFleet4 }
  -- 远征是否使用快速修理
  settings.expeditionQuickRepair = (function(expeditionQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[expeditionQuickRepair] or 2
  end)(settings.expeditionQuickRepair)
  -- 当无法远征时是否报警
  settings.expeditionAlertWhenNoHp = (function(expeditionAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[expeditionAlertWhenNoHp] or false
  end)(settings.expeditionAlertWhenNoHp)
  -- 选择关卡
  settings.battleChapter = (function(battleChapter)
    local list = transStrToTable({
      '0',
      '1-1', '1-2', '1-3', '1-4', '1-5',
      '2-1', '2-2', '2-3', '2-4', '2-5', '2-6',
      '3-1', '3-2', '3-3', '3-4',
      '4-1', '4-2', '4-3', '4-4',
      '5-1', '5-2', '5-3', '5-4', '5-5',
      '6-1', '6-2', '6-3', '6-4',
      '7-1', '7-2', '7-3', '7-4', '7-5'
    })
    return list[battleChapter] or '0'
  end)(settings.battleChapter)
  -- 选择舰队
  settings.battleFleet = (function(battleFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[battleFleet] or 1
  end)(settings.battleFleet)
  -- 是否使用快速修理
  settings.battleQuickRepair = (function(battleQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[battleQuickRepair] or 2
  end)(settings.battleQuickRepair)
  -- 迂回战术
  settings.battleRoundabout = (function(battleRoundabout)
    local list = transStrToTable({ true, false, })
    return list[battleRoundabout] or false
  end)(settings.battleRoundabout)
  -- 当无法出征时是否跳过出征
  settings.battleAlertWhenNoHp = (function(battleAlertWhenNoHp)
    local list = transStrToTable({ true, false, })
    return list[battleAlertWhenNoHp] or false
  end)(settings.battleAlertWhenNoHp)
  -- 出征最大战斗次数
  settings.battleMaxBattleNum = (function(battleMaxBattleNum)
    local list = transStrToTable({ 1, 2, 3, 4, 5, 6 })
    return list[battleMaxBattleNum] or 1
  end)(settings.battleMaxBattleNum)
  -- 阵型
  settings.battleFormation = (function(battleFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[battleFormation] or 2
  end)(settings.battleFormation)
  -- 6-1a点遇到航母SL
  settings.battleRebootAt6_1AMeetCV = (function(battleRebootAt6_1AMeetCV)
    local list = transStrToTable({ true, false })
    return list[battleRebootAt6_1AMeetCV] or false
  end)(settings.battleRebootAt6_1AMeetCV)
  -- 6-1a点遇到雷巡SL
  settings.battleRebootAt6_1AMeetCit = (function(battleRebootAt6_1AMeetCit)
    local list = transStrToTable({ true, false })
    return list[battleRebootAt6_1AMeetCit] or false
  end)(settings.battleRebootAt6_1AMeetCit)
  -- 没遇到补给就SL（捞胖次）
  settings.battleRebootAtNotMeetAP = (function(battleRebootAtNotMeetAP)
    local list = transStrToTable({ true, false })
    return list[battleRebootAtNotMeetAP] or false
  end)(settings.battleRebootAtNotMeetAP)
  -- 使用统一战斗配置
  settings.battleOptionUseMain = (function(battleOptionUseMain)
    local list = transStrToTable({ true, false })
    return list[battleOptionUseMain] or false
  end)(settings.battleOptionUseMain)

  -- 演习
  -- 选择舰队
  settings.exerciseFleet = (function(exerciseFleet)
    local list = transStrToTable({ 1, 2, 3, 4, })
    return list[exerciseFleet] or 1
  end)(settings.exerciseFleet)
  -- 是否追击
  settings.exercisePursue = (function(exercisePursue)
    local list = transStrToTable({ true, false, })
    return list[exercisePursue] or false
  end)(settings.exercisePursue)
  -- 是否使用快速修理
  settings.exerciseQuickRepair = (function(exerciseQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[exerciseQuickRepair] or 2
  end)(settings.exerciseQuickRepair)
  -- 阵型
  settings.exerciseFormation = (function(exerciseFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[exerciseFormation] or 2
  end)(settings.exerciseFormation)
  -- 间隔时间，最小0秒
  settings.exerciseInterval = tonumber(settings.exerciseInterval) or 0
  settings.exerciseInterval = math.max(0, settings.exerciseInterval)

  -- 战役
  -- 选择关卡
  settings.campaignChapter = (function(campaignChapter)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignChapter] or 1
  end)(settings.campaignChapter)
  -- 选择难度
  settings.campaignDifficulty = (function(campaignDifficulty)
    local list = transStrToTable({ 'default', 'hard' })
    return list[campaignDifficulty] or 'default'
  end)(settings.campaignDifficulty)
  -- 是否追击
  settings.campaignPursue = (function(campaignPursue)
    local list = transStrToTable({ true, false, })
    return list[campaignPursue] or false
  end)(settings.campaignPursue)
  -- 是否使用快速修理
  settings.campaignQuickRepair = (function(campaignQuickRepair)
    -- '不满血,中破,大破,不使用'
    local list = transStrToTable({ 3, 2, 1, 0 })
    return list[campaignQuickRepair] or 2
  end)(settings.campaignQuickRepair)
  -- 不能出征则报警
  settings.campaignAlertWhenCantBattle = (function(campaignAlertWhenCantBattle)
    local list = transStrToTable({ true, false, })
    return list[campaignAlertWhenCantBattle] or false
  end)(settings.campaignAlertWhenCantBattle)
  -- 阵型
  settings.campaignFormation = (function(campaignFormation)
    local list = transStrToTable({ 1, 2, 3, 4, 5 })
    return list[campaignFormation] or 2
  end)(settings.campaignFormation)
  -- 修理
  -- 是否修理所有船
  settings.repairAll = (function(repairAll)
    local list = transStrToTable({ true, false, })
    return list[repairAll] or false
  end)(settings.repairAll)
  -- 多长时间修理一次
  settings.repairInterval = tonumber(settings.repairInterval) or 0
  -- 解体
  -- 快速解体模式
  settings.disintegrateShipFastMode = (function(disintegrateShipFastMode)
    local list = transStrToTable({ true, false, })
    return list[disintegrateShipFastMode] or false
  end)(settings.disintegrateShipFastMode)
  -- 多长时间解体一次
  settings.disintegrateShipInterval = tonumber(settings.disintegrateShipInterval) or 0

  -- 战斗选项组合成数组
  settings.battleOption = (function(settings)
    local battleOption = {}
    for key, value in pairs(settings) do
      local thePath = nameToTablePath(key)
      if thePath[1] == 'battleOption' then
        local tmpPath = table.assign({}, thePath)
        table.remove(tmpPath, 1)
        if thePath[2] == 'main' or not settings.battleOptionUseMain then
          if thePath[3] == 'battleFormation' then
            local res = transStrToTable({ 1, 2, 3, 4, 5 })[value] or 2
            setValue(battleOption, tmpPath, res)
          elseif thePath[3] == 'battlePursue' then
            local res = transStrToTable({ true, false })[value] or false
            setValue(battleOption, tmpPath, res)
          else
            setValue(battleOption, tmpPath, value)
          end
        end
      end
    end
    return battleOption
  end)(settings)

  return ret, settings
  -- --转换settings结果
end
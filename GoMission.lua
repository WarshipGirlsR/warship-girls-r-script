local eq = require 'EventQuery'
local co = require 'Co'
local Promise = require 'Promise'
local c = coroutine

local isArray = table.isArray or function(tab)
  if (type(tab) ~= 'table') then return false end
  local length = #tab
  for key, value in pairs(tab) do
    if ((type(key) ~= 'number') or (key > length)) then
      return false
    end
  end
  return true
end


local combineListener = function(target, ...)
  local sources = { ... }
  if (type(target) ~= 'table') then target = {} end
  for _, source in ipairs(sources) do
    for key, value in ipairs(source) do
      table.insert(target, value)
    end
  end
  local targetReverse = table.reverse(target)
  local resultIndex = {}
  local result = {}
  for key, value in ipairs(targetReverse) do
    if (not resultIndex[value[3]]) then
      resultIndex[value[3]] = value
      table.insert(result, value)
    end
  end

  local resultReverse = table.reverse(result)
  return resultReverse
end

local sleepPromise = function(ms)
  return Promise.new(function(resolve)
    eq.setTimeout(resolve, ms)
  end)
end

local setScreenListenerPromise = function(actionType, tags, checker)
  return Promise.new(function(resolve)
    eq.setScreenListener(tags, checker, function() resolve(actionType) end)
  end)
end

local setScreenListeners = function(theArr, ...)

  if ((type(theArr) ~= 'table') or (#theArr == 0)) then
    return Promise.resolve(nil)
  end

  theArr = table.merge(theArr, ...)

  local theArrUnique = table.uniqueLast(theArr, 3)
  for key, value in ipairs(theArrUnique) do
    value.isOnce = true
  end
  return co(c.create(function()
    local newArr = {}
    local tags = {}
    local done = false
    for key, listenerEvent in ipairs(theArrUnique) do
      if (type(listenerEvent[2]) == 'table') then
        tags = table.merge(tags, listenerEvent[2])
      else
        table.insert(tags, listenerEvent[2])
      end

      if ((type(listenerEvent[4]) == 'number') and (listenerEvent[4] > 0)) then
        table.insert(newArr, co(c.create(function()
          c.yield(sleepPromise(listenerEvent[4]))
          if (not done) then
            return c.yield(setScreenListenerPromise(listenerEvent[1], listenerEvent[2], listenerEvent[3]))
          end
          return
        end)))
      else
        table.insert(newArr, co(c.create(function()
          local res = c.yield(setScreenListenerPromise(listenerEvent[1], listenerEvent[2], listenerEvent[3]))
          done = true
          return res
        end)))
      end
    end
    local res = c.yield(Promise.race(newArr))
    eq.clearScreenListenerByTags(tags)
    return res
  end))
end

local missions = {--  home = function() end,
  --  battleOnce = function() end,
  --  mission = function() end,
  --  expeditionReward = function() end,
  --  expeditionOnce = function() end,
  --  repairOnce = function() end,
  --  exerciseOnce = function() end,
}

local stateTree = {
  pause = {},
  home = {},
  network = {},
  login = {},
  battle = {},
  expeditionReward = {
    enableChapter = {},
  },
  expedition = {
    expeditionFleetToChapter = {},
  },
  repair = {},
  exercise = {},
  campaign = {},
  activity = {},
}



return {
  init = function(map, stepLabel, settings)
    -- 定义需要全局监听状态
    local getComListener = function()
      return {
        { { type = 'NETWORK_NETWORK_FAILURE_MODAL', addToStart = true }, 'homeGroup', map.home.isNetworkFailureModal, 2000 },
        { 'LOGIN_START_APP', 'homeGroup', map.login.isAppNotRun, 20000 },
        -- 5分钟界面不变化则重启游戏
        { 'LOGIN_START_APP', 'homeGroup', function() return true end, settings.restartInterval * 1000 },
        { { type = 'PAUSE_PAUSE', addToStart = true }, 'homeGroup', map.home.isPause },
      }
    end
    local getHomeListener = function()
      return {
        { 'HOME_HOME', 'homeGroup', map.home.isHome, 2000 },
        { { type = 'HOME_MEDAL_MODAL', addToStart = true }, 'homeGroup', map.home.isMedalModal, 2000 },
        { { type = 'HOME_NEWS_MODAL', addToStart = true }, 'homeGroup', map.home.isNewsModal, 2000 },
        { { type = 'HOME_SIGN_MODAL', addToStart = true }, 'homeGroup', map.home.isSignModal, 2000 },
      }
    end
    local getLoginListener = function()
      return {
        { { type = 'LOGIN_SELECT_SERVER', addToStart = true }, 'loginGroup', map.login.isSelectServerPage, 2000 },
      }
    end
    local makeAction = function(action)
      if (type(action) == 'table') then return action end
      return { type = action }
    end

    -- 定义状态树
    missions.home = function(action, state)
      return co(c.create(function()
        if (action.type == 'HOME_HOME') then

          return nil, state

        elseif (action.type == 'HOME_MEDAL_MODAL') then

          stepLabel.setStepLabelContent('1-2勋章取消')
          map.home.clickMedalModalCancelBtn()
          c.yield(sleepPromise(2000))
          local res = map.home.isMedalModal()
          if (res) then
            return makeAction('HOME_MEDAL_MODAL'), state
          end
          return nil, state

        elseif (action.type == 'HOME_NEWS_MODAL') then

          stepLabel.setStepLabelContent('1-3.关闭新闻')
          map.home.clickMewsModalClose()
          c.yield(sleepPromise(2000))
          local res = map.home.isNewsModal()
          if (res) then
            return makeAction('HOME_NEWS_MODAL'), state
          end
          return nil, state

        elseif (action.type == 'HOME_SIGN_MODAL') then

          stepLabel.setStepLabelContent('1-4.获取签到奖励')
          local res = map.home.isSignModalHasReward()
          if (res) then
            stepLabel.setStepLabelContent('1-5.有奖励，点击获取')
            map.home.clickSignModalGetReward()
            stepLabel.setStepLabelContent('1-6.等待获取确认')
            local newstateTypes = c.yield(setScreenListeners({
              { 'HOME_SIGN_CONFIRM_MODAL', 'missionsGroup', map.home.isSignConfirmModal },
              { 'HOME_SIGN_MODAL', 'missionsGroup', map.home.isSignModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('1-7.没有奖励')
            map.home.clickSignModalClose()
            c.yield(sleepPromise(2000))
            local res = map.home.isSignModal()
            if (res) then
              return makeAction('HOME_SIGN_MODAL'), state
            end
            return nil, state
          end

        elseif (action.type == 'HOME_SIGN_CONFIRM_MODAL') then

          stepLabel.setStepLabelContent('1-8.点击获取确认')
          map.home.clickSignConfirmModalGetReward()
          stepLabel.setStepLabelContent('1-9.等待获取签到奖励面板')
          c.yield(sleepPromise(2000))
          local newstateTypes = c.yield(setScreenListeners({
            { 'HOME_SIGN_CONFIRM_MODAL', 'missionsGroup', map.home.isSignConfirmModal, 2000 },
            { 'HOME_SIGN_MODAL', 'missionsGroup', map.home.isSignModal },
          }))
          return makeAction(newstateTypes), state
        end

        return nil
      end))
    end

    missions.network = function(action, state)
      return co(c.create(function()
        if (action.type == 'NETWORK_NETWORK_FAILURE_MODAL') then

          stepLabel.setStepLabelContent('1-10.网络不通，点击确认')
          map.home.clickNetworkFailureModalOk()
          c.yield(sleepPromise(2000))
          local res = map.home.isNetworkFailureModal()
          if (res) then
            return makeAction('NETWORK_NETWORK_FAILURE_MODAL'), state
          end
          return nil, state
        end

        return nil, state
      end))
    end

    missions.pause = function(action, state)
      return co(c.create(function()
        if (action.type == 'PAUSE_PAUSE') then
          state.pause.lasttext = stepLabel.getText()
          stepLabel.setPrefix('')
          stepLabel.setStepLabelContent('暂停')
          c.yield(sleepPromise(500))
          if (map.home.isPause()) then
            return makeAction('PAUSE_PAUSE_CONTINUE'), state
          else
            return nil, state
          end
        elseif (action.type == 'PAUSE_PAUSE_CONTINUE') then
          c.yield(sleepPromise(500))
          if (map.home.isPause()) then
            return makeAction('PAUSE_PAUSE_CONTINUE'), state
          else
            stepLabel.setStepLabelContent(state.pause.lasttext)
            return nil, state
          end
        end

        return nil, state
      end))
    end

    missions.login = function(action, state)
      return co(c.create(function()
        if (action.type == 'LOGIN_START_APP') then

          stepLabel.setStepLabelContent('1-11.启动游戏')
          map.login.restartApp()
          local newstateTypes = c.yield(setScreenListeners({
            { 'LOGIN_SELECT_SERVER', 'missionsGroup', map.login.isSelectServerPage, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'LOGIN_SELECT_SERVER') then

          stepLabel.setStepLabelContent('1-12.登录界面')
          map.login.clickLoginBtn()
          c.yield(sleepPromise(2000))
          local res = map.login.isSelectServerPage()
          if (res) then
            return makeAction('LOGIN_SELECT_SERVER'), state
          end
          return nil, state
        end

        return nil, state
      end))
    end

    missions.battleOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'BATTLE_START') then
          state.battle.quickSupplyCount = 0
          state.battle.quickRepairCount = 0
          state.battle.quickRepairSingleLastShip = 0
          state.battle.quickRepairSingleCount = 0
          state.battle.HPIsSafe = true
          state.battle.battleNum = 1
          state.battle.cantBattle = true

          stepLabel.setStepLabelContent('2-1.等待HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_HOME_CLICK_BATTLE') then

          stepLabel.setStepLabelContent('2-2.点击出征')
          map.home.clickBattleBtn()
          stepLabel.setStepLabelContent('2-3.等待出征页面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('2-5.出征页面点击出征的出征按钮')
          c.yield(sleepPromise(500))
          map.battle.clickBattleBtn()
          stepLabel.setStepLabelContent('2-6.等待出征的出征界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE') then

          local battleChapter
          if (#settings.battleChapter > 1) then
            battleChapter = table.remove(settings.battleChapter, 1)
            table.insert(settings.battleChapter, battleChapter)
          else
            battleChapter = settings.battleChapter[1]
          end
          stepLabel.setStepLabelContent('2-7.出征的出征页面')
          stepLabel.setStepLabelContent('2-8.移动到章节' .. battleChapter)
          c.yield(sleepPromise(300))
          map.battle.moveToChapter(battleChapter)
          stepLabel.setStepLabelContent('2-9.进入章节')
          c.yield(sleepPromise(300))
          map.battle.clickReadyBattleBtn()
          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('2-10.等待出征准备界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage, 2000 },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE') then

          if ((state.battle.quickSupplyCount <= 0) and (state.battle.quickRepairCount <= 0)) then
            -- 还没快速补给，还没维修
            stepLabel.setStepLabelContent('2-11.选择舰队:' .. settings.battleFleet)
            map.battle.selectFleet(settings.battleFleet)
            stepLabel.setStepLabelContent('2-12.检测所有状态正常')
            c.yield(sleepPromise(1000))
            local res = map.battle.isReadyBattlePageShipStatusAllRight()
            if (res) then
              stepLabel.setStepLabelContent('2-13.状态正常')
              state.battle.quickSupplyCount = 1
              state.battle.quickRepairCount = 1
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('2-14.状态不正常')
              map.battle.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('6-12.等待快速补给界面')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
                { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.isQuickSupplyModal },
              }))
              return makeAction(newstateTypes), state
            end
          elseif (state.battle.quickRepairCount <= 0) then
            -- 已经快速补给，还没维修
            stepLabel.setStepLabelContent('2-15.检测血量是否安全')
            c.yield(sleepPromise(1000))
            local res = map.battle.isReadyBattlePageShipHPSafe(settings.battleQuickRepair)
            if (res) then
              stepLabel.setStepLabelContent('2-16.血量安全')
              state.battle.quickRepairCount = 1
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.battleQuickRepair > 0) then
                stepLabel.setStepLabelContent('2-17.血量不安全，快修')
                map.battle.clickQuickRepairBtn()

                state.battle.quickRepairSingleLastShip = 0
                state.battle.quickRepairSingleCount = 0

                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
                  { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('2-18.血量不安全')
                state.battle.quickRepairCount = 1
                return { type = 'BATTLE_READY_BATTLE_PAGE' }, state
              end
            end
          else
            -- 已经快速补给，已经维修
            stepLabel.setStepLabelContent('2-19.再次检测血量是否安全')
            c.yield(sleepPromise(500))
            -- 不允许大破出征
            local res = map.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('2-20.血量安全，继续')
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('2-21.血量不安全，返回')
              return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO'), state
            end
          end

        elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('2-22.快速补给界面点击确定')
          map.battle.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('2-23.等待出征准备界面')
          state.battle.quickSupplyCount = state.battle.quickSupplyCount + 1
          if (state.battle.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.isQuickSupplyModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('2-24.资源数量不足')
            return { type = 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('2-25.点击快速补给关闭')
          c.yield(sleepPromise(100))
          map.battle.clickQuickSupplyModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickSupplyModal, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL') then

          if (settings.battleQuickRepair == 3) then
            -- 不满血则快修
            stepLabel.setStepLabelContent('2-26.点击快速修理确定')
            c.yield(sleepPromise(500))
            map.battle.clickQuickRepairModalOkBtn()
            state.battle.quickRepairCount = state.battle.quickRepairCount + 1
            stepLabel.setStepLabelContent('2-27.等待出征准备界面')
            if (state.battle.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('2-28.快修数量不足')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.battleQuickRepair == 2) then
            -- 中破或大破快修
            stepLabel.setStepLabelContent('2-29.寻找中破或大破的船')
            c.yield(sleepPromise(1000))
            local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
            if (#res > 0) then

              if ((state.battle.quickRepairSingleLastShip ~= res[1]) or (state.battle.quickRepairSingleCount < 3)) then
                state.battle.quickRepairSingleLastShip = res[1]
                state.battle.quickRepairSingleCount = state.battle.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('2-30.中破或大破:' .. table.concat(res, ','))
                map.battle.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.battle.quickRepairSingleLastShip = 0
                state.battle.quickRepairSingleCount = 0
                state.battle.quickRepairCount = state.battle.quickRepairCount + 1
                stepLabel.setStepLabelContent('2-31.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('2-32.修理完成')
              state.battle.quickRepairCount = state.battle.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.battleQuickRepair == 1) then
            -- 大破快修
            stepLabel.setStepLabelContent('2-33.寻找大破的船')
            c.yield(sleepPromise(1000))
            local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
            if (#res > 0) then
              if ((state.battle.quickRepairSingleLastShip ~= res[1]) or (state.battle.quickRepairSingleCount < 3)) then
                state.battle.quickRepairSingleLastShip = res[1]
                state.battle.quickRepairSingleCount = state.battle.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('2-34.大破:' .. table.concat(res, ','))
                map.battle.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.battle.quickRepairSingleLastShip = 0
                state.battle.quickRepairSingleCount = 0
                state.battle.quickRepairCount = state.battle.quickRepairCount + 1
                stepLabel.setStepLabelContent('2-35.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('2-36.修理完成')
              state.battle.quickRepairCount = state.battle.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('2-37.点击快速修理关闭')
          c.yield(sleepPromise(500))
          map.battle.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('2-38.等待出征准备界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('2-39.检测舰队可以出征')
          c.yield(sleepPromise(500))
          local fleetCanBattle = map.battle.isFleetsCanBattle()
          if (fleetCanBattle) then
            stepLabel.setStepLabelContent('2-40.可以出征')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.battle.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('2-41.返回HOME')
            return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO'), state
          end

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('2-42.出征准备界面，点击出征开始')
          c.yield(sleepPromise(100))
          map.battle.clickBattleStartBtn()
          return { type = 'BATTLE_GO_A_BATTLE' }, state

        elseif (action.type == 'BATTLE_GO_A_BATTLE') then

          if (state.battle.battleNum < settings.battleMaxBattleNum) then
            stepLabel.setStepLabelContent('2-43.第' .. state.battle.battleNum .. '战开始')
          else
            stepLabel.setStepLabelContent('2-44.第' .. state.battle.battleNum .. '战Boss战开始')
          end
          stepLabel.setStepLabelContent('2-45.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
            { 'BATTLE_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.battle.isExtraReceiveModal },
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            -- { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.isNewShipPageLockModal },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_EXTRA_RECEIVE_MODAL') then

          stepLabel.setStepLabelContent('2-46.额外获得面板，点击确定')
          map.battle.clickExtraReceiveModalOk()
          state.battle.battleNum = state.battle.battleNum + 1
          stepLabel.setStepLabelContent('2-47.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.battle.isExtraReceiveModal, 2000 },
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_START_PAGE') then

          stepLabel.setStepLabelContent('2-48.开始面板，点击开始')
          c.yield(sleepPromise(200))
          if (settings.battleRoundabout and map.battle.isBattleStartPageCanRoundabout()) then
            map.battle.clickBattleStartModalRoundaboutBtn()
          else
            map.battle.clickBattleStartModalStartBtn()
          end
          stepLabel.setStepLabelContent('2-49.等待阵型面板，追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage, 2000 },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('2-50.阵型面板')
          c.yield(sleepPromise(100))
          map.battle.clickFormationPageStartBtn(settings.battleFormation)
          stepLabel.setStepLabelContent('2-51.等待追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage, 2000 },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage, 2000 },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_PURSUE_PAGE') then

          stepLabel.setStepLabelContent('2-52.追击面板')
          if ((settings.battlePursue and (state.battle.battleNum < settings.battleMaxBattleNum))
              or (settings.battlePursueBoss and (state.battle.battleNum == settings.battleMaxBattleNum))) then
            stepLabel.setStepLabelContent('2-53.追击')
            map.battle.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('2-54.放弃追击')
            map.battle.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('2-55.等待胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage, 2000 },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal, 2000 },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_VICTORY_PAGE') then

          c.yield(sleepPromise(1000))
          stepLabel.setStepLabelContent('2-56.胜利界面检测HP是否安全')
          c.yield(sleepPromise(300))
          -- 有大破就回港
          state.battle.HPIsSafe = map.battle.isVictoryPageShipHPSafe(1)
          if (state.battle.HPIsSafe) then
            stepLabel.setStepLabelContent('2-57.HP安全')
          else
            stepLabel.setStepLabelContent('2-58.HP不安全')
          end
          c.yield(sleepPromise(200))
          stepLabel.setStepLabelContent('2-59.点击胜利继续')
          map.battle.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('2-60.等待胜利继续界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal, 2000 },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage, 2000 },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('2-61.点击胜利继续')
          map.battle.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('2-62.等待大破警告，新船，下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage, 2000 },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2, 2000 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_SHIP_SERVER_DAMAGE_MODAL') then

          stepLabel.setStepLabelContent('2-63.大破警告框点击返回')
          map.battle.clickShipSevereDamageModalBack()
          stepLabel.setStepLabelContent('2-64.等待新船，下回合窗口，勋章对话框，home')
          state.battle.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2, 2000 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_SHIP_CANT_GO_ON_MODAL') then

          stepLabel.setStepLabelContent('2-65.无法前进警告框点击返回')
          map.battle.clickShipCantGoOnModalBackBtn()
          stepLabel.setStepLabelContent('2-66.等待新船，下回合窗口，勋章对话框，home')
          state.battle.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_NEW_SHIP_PAGE') then

          stepLabel.setStepLabelContent('2-67.获取新船')
          c.yield(sleepPromise(500))
          map.battle.clickNewShip()
          stepLabel.setStepLabelContent('2-68.等待新船锁定窗口，下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.isNewShipPageLockModal },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('2-69.新船锁定窗口点击确认')
          map.battle.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('2-70.等待下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.isNewShipPageLockModal, 2000 },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_NEXT_LEVEL_STEP_MODAL') then

          if ((state.battle.battleNum < settings.battleMaxBattleNum) and state.battle.HPIsSafe) then
            stepLabel.setStepLabelContent('2-71.点击继续下一关')
            map.battle.clickLevelStepModalContinueBtn()
            state.battle.battleNum = state.battle.battleNum + 1
            return { type = 'BATTLE_GO_A_BATTLE' }, state
          else
            stepLabel.setStepLabelContent('2-72.点击回港')
            map.battle.clickLevelStepModalBackBtn()
            stepLabel.setStepLabelContent('2-73.等待主界面')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CANT_GO') then

          -- 震动提示不能战斗
          if (settings.battleAlertWhenNoHp) then
            vibrator(500)
            mSleep(500)
            vibrator(500)
          end

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.battle.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent('2-74.等待出征界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME') then

          map.battle.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('2-75.等待主界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil, state
      end))
    end


    -- 领取任务奖励
    missions.mission = function(action, state)
      return co(c.create(function()
        if (action.type == 'MISSION_START') then

          stepLabel.setStepLabelContent('3-1.等待HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'MISSION_IS_UNRECEIVED_MISSION', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then

          stepLabel.setStepLabelContent('3-2.检测是否有任务奖励')
          c.yield(sleepPromise(100))
          local res = map.mission.isUnreceivedMission()
          if (res) then
            return { type = 'MISSION_INIT' }, state
          end
          stepLabel.setStepLabelContent('3-3.没有任务奖励')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_INIT') then

          stepLabel.setStepLabelContent('3-4点击任务按钮')
          map.mission.clickMission()
          stepLabel.setStepLabelContent('3-5.等待任务界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'MISSION_INIT', 'homeGroup', map.home.isHome, 2000 },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_PAGE') then

          stepLabel.setStepLabelContent('3-6.点击全部任务')
          map.missionClickAllMission()
          stepLabel.setStepLabelContent('3-7.等待任务全部任务界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_MISSION_ALL_MISSION') then

          c.yield(sleepPromise(100))
          local res = map.mission.isMissionUnreceivedReward()
          if (not res) then
            stepLabel.setStepLabelContent('3-8.没有任务奖励')
            return { type = 'MISSION_PAGE_NO_REWAR' }, state
          else
            stepLabel.setStepLabelContent('3-9.有任务奖励')
            map.mission.clickGetFirstReward()
            stepLabel.setStepLabelContent('3-10.等待获得面板')

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
              { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel },
            }))

            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'MISSION_REWAR_PANNEL') then

          stepLabel.setStepLabelContent('3-11.点击确定')
          map.mission.clickRewardPannelOk()
          stepLabel.setStepLabelContent('3-12.等待新船，任务全部任务')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 1000 },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_NEW_SHIP') then

          stepLabel.setStepLabelContent('3-13.点击新船')
          map.mission.clickNewShip()
          stepLabel.setStepLabelContent('3-14.等待新船锁定，任务全部任务')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('3-15.点击新船')
          map.mission.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('3-16.等待任务全部任务')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_PAGE_NO_REWAR') then

          stepLabel.setStepLabelContent('3-17.等待返回home')
          map.mission.clickBackToHome()

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'MISSION_PAGE_NO_REWAR', 'missionsGroup', map.mission.isMission, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil
      end))
    end

    -- 远征回收
    missions.expeditionReward = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXPEDITION_REWARD_START') then

          stepLabel.setStepLabelContent('4-1.等待HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'EXPEDITION_REWARD_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_INIT') then
          if (type(settings.enableChapter) ~= 'table') then
            settings.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }
          elseif (#settings.enableChapter < 1) then
            stepLabel.setStepLabelContent('4-2.没有远征任务！')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
            return makeAction(newstateTypes), state
          end

          -- 复制一份数组
          (function()
            local newC = {}
            for i, v in ipairs(settings.enableChapter) do
              table.insert(newC, v)
            end
            state.expeditionReward.enableChapter = newC
          end)()

          return { type = 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED' }, state

        elseif (action.type == 'EXPEDITION_REWARD_IS_EXPEDITION_COMPLETED') then

          stepLabel.setStepLabelContent('4-3.检测是否有远征奖励')
          c.yield(sleepPromise(100))
          local res = map.expedition.isExpeditionCompleted()
          if (not res) then
            stepLabel.setStepLabelContent('4-4.没有远征奖励和任务')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
            return makeAction(newstateTypes), state
          end
          stepLabel.setStepLabelContent('4-5.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('4-6.等待出征界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

          stepLabel.setStepLabelContent('4-7.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('4-8.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

          if (#state.expeditionReward.enableChapter > 0) then
            local chapter = state.expeditionReward.enableChapter[1]
            stepLabel.setStepLabelContent('4-9.移动到第' .. chapter .. '章')
            c.yield(sleepPromise(300))
            map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
            state.expedition.lastChapter = chapter
            stepLabel.setStepLabelContent('4-10.检测本页有可收获奖励')
            return { type = 'EXPEDITION_REWARD_CHECK_HAS_REWARD' }, state
          else
            return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }, state
          end

        elseif (action.type == 'EXPEDITION_REWARD_CHECK_HAS_REWARD') then

          local res, list = map.expedition.isThisExpeditionPageHasReward()
          if (res) then
            local v = list[1]
            stepLabel.setStepLabelContent('4-11.点击第' .. v .. '节')
            map.expedition.clickExpeditionBtn(v)
            stepLabel.setStepLabelContent('4-12.等待远征完成页面')

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
              { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage },
            }))
            return makeAction(newstateTypes), state
          end

          stepLabel.setStepLabelContent('4-13.本页没有可收获的奖励')
          table.remove(state.expeditionReward.enableChapter, 1)
          return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }, state

        elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then

          map.expedition.clickRewardPannelOk()
          stepLabel.setStepLabelContent('4-14.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage, 2000 },
            { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_RETURN_TO_HOME') then

          map.expedition.clickBackToHome()
          stepLabel.setStepLabelContent('4-15.返回HOME')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'EXPEDITION_REWARD_RETURN_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil
      end))
    end

    -- 远征回收


    -- 远征派遣舰队
    missions.expeditionOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXPEDITION_ONCE_START') then

          stepLabel.setStepLabelContent('4-16.等待HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_INIT') then
          stepLabel.setStepLabelContent('4-17.准备远征派遣舰队')
          -- 准备开始远征派遣舰队任务
          if (type(settings.expeditionFleetToChapter) ~= 'table') then
            state.expedition.expeditionFleetToChapter = { false, false, false, false }
          end

          if ((not settings.expeditionFleetToChapter[1])
              and (not settings.expeditionFleetToChapter[2])
              and (not settings.expeditionFleetToChapter[3])
              and (not settings.expeditionFleetToChapter[4])) then
            stepLabel.setStepLabelContent('4-18.没有远征任务！')
            return nil
          end
          -- 转换数组
          (function()
            local newC = {}
            for i, v in ipairs(settings.expeditionFleetToChapter) do
              if (v) then
                table.insert(newC, { i, v })
              end
            end
            state.expedition.expeditionFleetToChapter = newC
          end)()


          -- 此任务使用的变量恢复默认值
          state.expedition.quickSupplyCount = 0
          state.expedition.quickRepairCount = 0
          state.expedition.quickRepairSingleLastShip = 0
          state.expedition.quickRepairSingleCount = 0
          state.expedition.lastChapter = nil
          state.expedition.fleet = nil
          state.expedition.chapters = nil


          stepLabel.setStepLabelContent('4-19.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('4-20.等待出征界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattlePage },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then
          -- 进入出征大页面
          stepLabel.setStepLabelContent('4-21.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('4-22.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_IS_EXPEDITION_PAGE') then
          -- 进入远征页面
          if (#state.expedition.expeditionFleetToChapter > 0) then
            state.expedition.quickSupplyCount = 0
            state.expedition.quickRepairCount = 0

            state.expedition.fleet, state.expedition.chapters = table.unpack(state.expedition.expeditionFleetToChapter[1])

            local chapter, section = table.unpack(strSplit(state.expedition.chapters, '-'))
            if (state.expedition.lastChapter ~= chapter) then
              stepLabel.setStepLabelContent('4-21.移动到第' .. chapter .. '章')
              map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
              state.expedition.lastChapter = chapter
              c.yield(sleepPromise(300))
            end
            stepLabel.setStepLabelContent('4-23.检测第' .. section .. '节能否远征')
            c.yield(sleepPromise(200))
            local res = map.expedition.isChapterCanExpedition(section)
            if (res) then
              stepLabel.setStepLabelContent('4-24.点击按钮' .. section)
              map.expedition.clickExpeditionBtn(section)
              stepLabel.setStepLabelContent('4-25.等待远征准备界面')

              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('4-26.本章不能远征')
              -- 执行下一个章节
              table.remove(state.expedition.expeditionFleetToChapter, 1)
              return { type = 'EXPEDITION_IS_EXPEDITION_PAGE' }, state
            end
          else
            stepLabel.setStepLabelContent('4-27.没有远征')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
              { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE') then

          if ((state.expedition.quickSupplyCount <= 0) and (state.expedition.quickRepairCount <= 0)) then
            -- 还没快速补给，还没维修
            stepLabel.setStepLabelContent('4-28.选择舰队' .. state.expedition.fleet)
            map.expedition.clickSelectFleet(state.expedition.fleet)
            stepLabel.setStepLabelContent('4-29.检测所有状态正常')
            c.yield(sleepPromise(300))
            -- 检测舰队是否在最佳状态
            local res = map.expedition.isReadyBattlePageShipStatusAllRight()
            if (res) then
              stepLabel.setStepLabelContent('4-30.状态正常')
              state.expedition.quickSupplyCount = 1
              state.expedition.quickRepairCount = 1
              return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('4-31.状态不正常')
              map.expedition.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('4-32.等待快速补给界面')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_QUICK_SUPPLY_MODAL', 'missionsGroup', map.expedition.isQuickSupplyModal },
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
              }))
              return makeAction(newstateTypes), state
            end
          elseif (state.expedition.quickRepairCount <= 0) then
            -- 已经快速补给，还没维修
            stepLabel.setStepLabelContent('4-33.检测血量是否安全')
            c.yield(sleepPromise(1000))
            local res = map.expedition.isReadyBattlePageShipHPSafe(settings.expeditionQuickRepair)
            if (res) then
              stepLabel.setStepLabelContent('4-34.血量安全')
              state.expedition.quickRepairCount = 1
              return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.expeditionQuickRepair > 0) then
                stepLabel.setStepLabelContent('4-35.血量不安全，快修')
                map.expedition.clickQuickRepairBtn()
                stepLabel.setStepLabelContent('4-36.等待快速修理界面')

                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal },
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
                }))

                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('4-37.血量不安全')
                state.expedition.quickRepairCount = 1
                return { type = 'EXPEDITION_READY_BATTLE_PAGE' }, state
              end
            end
          else
            -- 已经快速补给，已经维修
            stepLabel.setStepLabelContent('4-38.再次检测血量是否安全')
            c.yield(sleepPromise(500))
            -- 不允许大破出征
            local res = map.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('4-39.血量安全，继续')
              return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('4-40.血量不安全，返回')
              return { type = 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO' }, state
            end
          end

        elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL') then
          -- 快速补给界面
          stepLabel.setStepLabelContent('4-41.快速补给界面点击确定')
          map.expedition.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('4-42.等待远征准备界面')
          state.expedition.quickSupplyCount = state.expedition.quickSupplyCount + 1
          if (state.expedition.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_QUICK_SUPPLY_MODAL', 'missionsGroup', map.expedition.isQuickSupplyModal, 2000 },
              { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('4-43.资源数量不足')
            return { type = 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('4-44.点击快速补给关闭')
          c.yield(sleepPromise(100))
          map.expedition.clickQuickSupplyModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickSupplyModal, 2000 },
            { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', 'missionsGroup', map.expedition.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL') then


          if (settings.expeditionQuickRepair == 3) then
            -- 不满血则快修
            stepLabel.setStepLabelContent('4-45.点击快速修理确定')
            c.yield(sleepPromise(500))
            map.expedition.clickQuickRepairModalOkBtn()
            state.expedition.quickRepairCount = state.expedition.quickRepairCount + 1
            stepLabel.setStepLabelContent('4-46.等待出征准备界面')
            if (state.expedition.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('4-47.快修数量不足')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.expeditionQuickRepair == 2) then
            -- 中破或大破快修
            stepLabel.setStepLabelContent('4-48.寻找中破或大破的船')
            c.yield(sleepPromise(1000))
            local res = map.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)
            if (#res > 0) then
              if ((state.expedition.quickRepairSingleLastShip ~= res[1]) or (state.expedition.quickRepairSingleCount < 3)) then
                state.expedition.quickRepairSingleLastShip = res[1]
                state.expedition.quickRepairSingleCount = state.expedition.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('4-49.中破或大破:' .. table.concat(res, ','))
                map.expedition.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                  { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.expedition.quickRepairSingleLastShip = 0
                state.expedition.quickRepairSingleCount = 0
                state.expedition.quickRepairCount = state.battle.quickRepairCount + 1
                stepLabel.setStepLabelContent('4-50.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('4-51.修理完成')
              state.expedition.quickRepairCount = state.expedition.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.expeditionQuickRepair == 1) then
            -- 大破快修
            stepLabel.setStepLabelContent('4-52.寻找大破的船')
            c.yield(sleepPromise(1000))
            local res = map.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)
            if (#res > 0) then
              if ((state.expedition.quickRepairSingleLastShip ~= res[1]) or (state.expedition.quickRepairSingleCount < 3)) then
                state.expedition.quickRepairSingleLastShip = res[1]
                state.expedition.quickRepairSingleCount = state.expedition.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('4-53.大破:' .. table.concat(res, ','))
                map.expedition.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                  { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.expedition.quickRepairSingleLastShip = 0
                state.expedition.quickRepairSingleCount = 0
                state.expedition.quickRepairCount = state.battle.quickRepairCount + 1
                stepLabel.setStepLabelContent('4-54.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                  { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('4-55.修理完成')
              state.expedition.quickRepairCount = state.expedition.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
                { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('4-56.点击快速修理关闭')
          c.yield(sleepPromise(500))
          map.expedition.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('4-57.等待出征准备界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.expedition.isQuickRepairModal, 2000 },
            { 'EXPEDITION_READY_BATTLE_PAGE', 'missionsGroup', map.expedition.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('4-58.检测舰队可以出征')
          c.yield(sleepPromise(500))
          local fleetCanBattle = map.expedition.isFleetsCanBattle()
          if (fleetCanBattle) then
            stepLabel.setStepLabelContent('4-59.可以出征')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.expedition.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('4-60.返回')
            return makeAction('EXPEDITION_READY_BATTLE_PAGE_CANT_GO'), state
          end

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('4-61.出征准备界面，点击出征开始')
          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('4-62.点击远征开始')
          map.expedition.clickBattleStartBtn()
          stepLabel.setStepLabelContent('4-63.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then
          -- 舰队不能远征，准备返回远征页

          -- 震动提示不能远征
          if (settings.expeditionAlertWhenNoHp) then
            vibrator(500)
            mSleep(500)
            vibrator(500)
          end

          stepLabel.setStepLabelContent('4-64.点击返回远征界面')
          map.expedition.clickBackToExpedition()

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          }))

          -- 如果离开这一页，则从远征队列里退出一个队伍
          if (newstateTypes ~= 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then
            table.remove(state.expedition.expeditionFleetToChapter, 1)
          end

          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME') then

          stepLabel.setStepLabelContent('4-66.返回远征页')
          map.expedition.clickBackToExpedition()
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
            { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME') then

          stepLabel.setStepLabelContent('4-67.返回港口')
          map.expedition.clickBackToHome()
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
            { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return makeAction(newstateTypes), state
        end
      end))
    end
    -- 远征派遣

    -- 修理
    missions.repairOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'REPAIR_ONCE_START') then

          stepLabel.setStepLabelContent('5-1.等待HOME')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'REPAIR_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_INIT') then
          state.repair.slot = nil

          stepLabel.setStepLabelContent('5-2.点击出征')
          c.yield(sleepPromise(100))
          map.repair.clickDockBtn()
          stepLabel.setStepLabelContent('5-3.等待船坞界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_DOCK_PAGE') then

          stepLabel.setStepLabelContent('5-4.点击修理按钮')
          c.yield(sleepPromise(100))
          map.repair.clickRepairBtn()
          stepLabel.setStepLabelContent('5-5.等待修理界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_REPAIR_PAGE') then

          stepLabel.setStepLabelContent('5-6.检测空闲槽位')
          c.yield(sleepPromise(500))
          local res, hasList = map.repair.hasEmptyRepairSlot()
          if (res) then
            state.repair.slot = hasList[1]
            stepLabel.setStepLabelContent('5-7.有空闲槽位')
            stepLabel.setStepLabelContent('5-8.点击第' .. state.repair.slot .. '个空闲槽位')
            c.yield(sleepPromise(100))
            map.repair.clickRepairSlotBtn(state.repair.slot)
            c.yield(sleepPromise(100))
            stepLabel.setStepLabelContent('5-9.检测修理界面，选船界面')

            -- 如果一没进入修船选船页面说明没有需要维修的船
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage },
              { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
            }))

            if (newstateTypes == 'REPAIR_REPAIR_FINISH') then
              stepLabel.setStepLabelContent('5-9.没有船需要维修')
            end

            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('5-10.没有空位')

            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then

          stepLabel.setStepLabelContent('5-11.选择第一个船')
          c.yield(sleepPromise(200))
          map.repair.clickFirstShip()
          stepLabel.setStepLabelContent('5-12.等待返回修理界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then

          stepLabel.setStepLabelContent('5-13.等待第' .. state.repair.slot .. '个槽位变成修理状态')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isSlotNotEmpty(state.repair.slot) },
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
          }))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_REPAIR_FINISH') then

          stepLabel.setStepLabelContent('5-14.完成维修')
          map.repair.clickBackToHomeBtn()

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil, state
      end))
    end
    -- 修理

    -- 演习
    missions.exerciseOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXERCISE_START') then
          stepLabel.setStepLabelContent('6-1.等待home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_INIT') then

          state.exercise.quickSupplyCount = 0
          state.exercise.quickRepairCount = 0
          state.exercise.quickRepairSingleLastShip = 0
          state.exercise.quickRepairSingleCount = 0
          state.exercise.battleNum = 1
          state.exercise.HPIsSafe = true

          stepLabel.setStepLabelContent('6-2.点击出征')
          map.home.clickBattleBtn()
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('6-3.点击演习')
          map.exercise.clickExerciseBtn()
          stepLabel.setStepLabelContent('6-4.等待演习页面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome },
            { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage, 2000 },
            { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_EXERCISE_PAGE') then

          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('6-5.寻找演习对手')
          local res, exeList = map.exercise.isExercisePageHaveExercise()
          local nBtn = exeList[1]
          if (type(nBtn) ~= 'nil') then
            stepLabel.setStepLabelContent('6-6.发现演习对手' .. nBtn)
            map.exercise.clickToNExerciseBtn(nBtn)
            stepLabel.setStepLabelContent('6-7.等待出征准备界面')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage, 2000 },
              { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage, 2000 },
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('6-8.没有可以挑战的人')
            return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
          end

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE') then

          if ((state.exercise.quickSupplyCount <= 0) and (state.exercise.quickRepairCount <= 0)) then
            stepLabel.setStepLabelContent('6-9.选择舰队:' .. settings.exerciseFleet)
            map.exercise.selectFleet(settings.exerciseFleet)
            stepLabel.setStepLabelContent('6-10.检测所有状态')
            c.yield(sleepPromise(1000))
            local res = map.exercise.isReadyBattlePageShipStatusAllRight()
            if (res) then
              stepLabel.setStepLabelContent('2-13.状态正常')
              state.exercise.quickSupplyCount = 1
              state.exercise.quickRepairCount = 1
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('6-11.状态不正常')
              map.exercise.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('6-12.等待快速补给界面')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
                { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal },
              }))
              return makeAction(newstateTypes), state
            end
          elseif (state.exercise.quickRepairCount <= 0) then
            stepLabel.setStepLabelContent('6-13.检测血量是否安全')
            c.yield(sleepPromise(1000))
            local res = map.exercise.isReadyBattlePageShipHPSafe(settings.exerciseQuickRepair)
            if (res) then
              stepLabel.setStepLabelContent('6-14.血量安全')
              state.exercise.quickRepairCount = 1
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.exerciseQuickRepair > 0) then
                stepLabel.setStepLabelContent('6-15.血量不安全，点击快修')
                map.exercise.clickQuickRepairBtn()
                stepLabel.setStepLabelContent('6-16.等待快修界面')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
                  { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('6-17.血量不安全，返回')
                return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }, state
              end
            end
          else
            stepLabel.setStepLabelContent('6-18.再次检测血量是否安全')
            c.yield(sleepPromise(1000))
            -- 不允许大破出征
            local res = map.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('6-19.血量安全，继续')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('6-20.血量不安全，返回')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }, state
            end
          end

        elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('6-22.快速补给界面点击确定')
          map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('6-23.等待出征准备界面')
          state.exercise.quickSupplyCount = state.exercise.quickSupplyCount + 1
          if (state.exercise.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('6-24.资源数量不足')
            return { type = 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('6-25.点击快速补给关闭')
          c.yield(sleepPromise(100))
          map.exercise.clickQuickSupplyModalCloseBtn()
          stepLabel.setStepLabelContent('6-26.等待出征准备界面')
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL') then

          if (settings.exerciseQuickRepair == 3) then
            -- 不满血则快修
            stepLabel.setStepLabelContent('6-27.点击快速修理确定')
            c.yield(sleepPromise(500))
            map.exercise.clickQuickRepairModalOkBtn()
            state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
            stepLabel.setStepLabelContent('6-28.等待出征准备界面')
            if (state.exercise.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('6-29.快速修理数量不足')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.exerciseQuickRepair == 2) then
            -- 中破或大破快修
            stepLabel.setStepLabelContent('6-30.寻找中破或大破的船')
            c.yield(sleepPromise(1000))
            local res = map.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
            if (#res > 0) then

              if ((state.exercise.quickRepairSingleLastShip ~= res[1]) or (state.exercise.quickRepairSingleCount < 3)) then
                state.exercise.quickRepairSingleLastShip = res[1]
                state.exercise.quickRepairSingleCount = state.exercise.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('6-31.中破或大破:' .. table.concat(res, ','))
                map.exercise.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                  { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.exercise.quickRepairSingleLastShip = 0
                state.exercise.quickRepairSingleCount = 0
                state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
                stepLabel.setStepLabelContent('6-32.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                  { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('6-33.修理完成')
              state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.exerciseQuickRepair == 1) then
            -- 大破快修
            stepLabel.setStepLabelContent('6-34.寻找大破的船')
            c.yield(sleepPromise(1000))
            local res = map.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
            if (#res > 0) then
              if ((state.exercise.quickRepairSingleLastShip ~= res[1]) or (state.exercise.quickRepairSingleCount < 3)) then
                state.exercise.quickRepairSingleLastShip = res[1]
                state.exercise.quickRepairSingleCount = state.exercise.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('6-35.大破:' .. table.concat(res, ','))
                map.exercise.clickQuickRepairModalSingleShip(res[1])
                c.yield(sleepPromise(500))
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                  { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                state.exercise.quickRepairSingleLastShip = 0
                state.exercise.quickRepairSingleCount = 0
                state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
                stepLabel.setStepLabelContent('6-36.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                  { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('6-37.修理完成')
              state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('6-38.点击快速修理关闭')
          c.yield(sleepPromise(500))
          map.exercise.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('6-39.等待出征准备界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('6-40.检测舰队是否可以出征')
          c.yield(sleepPromise(300))
          local fleetCanBattle = map.exercise.isFleetsCanBattle()
          if (not fleetCanBattle) then

            stepLabel.setStepLabelContent('6-41.舰队无法战斗')
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }, state
          else
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
          end

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('6-42.出征准备界面出征开始')
          c.yield(sleepPromise(100))
          map.exercise.clickBattleStartBtn()
          return { type = 'EXERCISE_GO_A_EXERCISE' }, state

        elseif (action.type == 'EXERCISE_GO_A_EXERCISE') then

          stepLabel.setStepLabelContent('6-43.等待出征准备界面，...')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_GO_A_EXERCISE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_START_PAGE') then

          stepLabel.setStepLabelContent('6-44.开始面板，点击开始')
          c.yield(sleepPromise(100))
          map.exercise.clickBattleStartModalStartBtn()
          stepLabel.setStepLabelContent('6-45.等待阵型面板，追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_GO_A_EXERCISE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage, 2000 },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('6-46.阵型面板')
          c.yield(sleepPromise(100))
          map.exercise.clickFormationPageStartBtn(settings.exerciseFormation)
          stepLabel.setStepLabelContent('6-47.等待追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage, 2000 },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_PURSUE_MODAL') then

          stepLabel.setStepLabelContent('6-48.追击面板')
          c.yield(sleepPromise(100))
          if (settings.exercisePursue) then
            stepLabel.setStepLabelContent('6-49.追击')
            map.exercise.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('6-50.放弃追击')
            map.exercise.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('6-51.等待胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal, 2000 },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_VICTORY_PAGE') then

          stepLabel.setStepLabelContent('6-52.点击胜利继续')
          map.exercise.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('6-53.等待胜利继续界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage, 2000 },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('6-54.点击胜利继续')
          map.exercise.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('6-55.等待演习界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2, 2000 },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CANT_GO') then

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.exercise.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent("6-56.等待出征界面")
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME') then

          stepLabel.setStepLabelContent('6-57.点击回港')
          map.exercise.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('6-68.等待home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isBattlePage, 2000 },
            { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isExercisePage, 2000 },
          }))
          return makeAction(newstateTypes), state
        end
        return nil, state
      end))
    end
    -- 演习

    -- 战役
    missions.campaignOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'CAMPAIGN_START') then
          stepLabel.setStepLabelContent('7-1.等待home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_INIT') then

          state.campaign.quickSupplyCount = 0
          state.campaign.quickRepairCount = 0
          state.campaign.quickRepairSingleLastShip = 0
          state.campaign.quickRepairSingleCount = 0
          state.campaign.battleNum = 1
          state.campaign.HPIsSafe = true

          stepLabel.setStepLabelContent('7-2.点击出征')
          map.home.clickBattleBtn()
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome, 2000 },
            { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('7-3.点击战役')
          map.campaign.clickCampaignBtn()
          stepLabel.setStepLabelContent('7-4.等待战役页面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome },
            { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage, 2000 },
            { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_CAMPAIGN_PAGE') then

          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('7-5.移动到战役' .. settings.campaignChapter)
          map.campaign.moveToCampaignMission(settings.campaignChapter)
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('7-6.点击战役')
          map.campaign.clickCampainReadyBtn(settings.campaignDifficulty)
          stepLabel.setStepLabelContent('7-7.等待战役准备界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage, 2000 },
            { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage, 2000 },
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE') then

          if ((state.campaign.quickSupplyCount <= 0) and (state.campaign.quickRepairCount <= 0)) then
            stepLabel.setStepLabelContent('7-10.检测所有状态')
            c.yield(sleepPromise(1000))
            local res = map.campaign.isReadyBattlePageShipStatusAllRight()
            if (not res) then
              stepLabel.setStepLabelContent('7-11.状态不正常')
              map.campaign.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('7-12.等待快速补给界面')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
                { 'CAMPAIGN_QUICK_SUPPLY_MODAL', 'missionsGroup', map.campaign.isQuickSupplyModal },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('7-11.状态正常')
              state.campaign.quickSupplyCount = 1
              return { type = 'CAMPAIGN_READY_BATTLE_PAGE' }, state
            end
          elseif (state.campaign.quickRepairCount <= 0) then
            stepLabel.setStepLabelContent('7-13.检测血量是否安全')
            c.yield(sleepPromise(1000))
            local res = map.campaign.isReadyBattlePageShipHPSafe(settings.campaignQuickRepair)
            if (res) then
              stepLabel.setStepLabelContent('7-14.血量安全，继续')
              return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              if (settings.campaignQuickRepair > 0) then
                stepLabel.setStepLabelContent('7-15.血量不安全，点击快修')
                map.campaign.clickQuickRepairBtn()
                stepLabel.setStepLabelContent('7-16.等待快修界面')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('7-17.血量不安全，返回')
                return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }, state
              end
            end
          else
            stepLabel.setStepLabelContent('7-18.再次检测血量是否安全')
            c.yield(sleepPromise(1000))
            -- 不允许大破出征
            local res = map.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('7-19.血量安全，继续')
              return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('7-20.血量不安全，返回')
              return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }, state
            end
          end

        elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('7-22.快速补给界面点击确定')
          map.campaign.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('7-23.等待出征准备界面')
          state.campaign.quickSupplyCount = state.campaign.quickSupplyCount + 1
          if (state.campaign.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_SUPPLY_MODAL', 'missionsGroup', map.campaign.isQuickSupplyModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('7-24.资源数量不足')
            return { type = 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('7-25.点击快速补给关闭')
          c.yield(sleepPromise(100))
          map.campaign.clickQuickSupplyModalCloseBtn()
          stepLabel.setStepLabelContent('7-26.等待出征准备界面')
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickSupplyModal, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL') then

          if (settings.campaignQuickRepair == 3) then
            stepLabel.setStepLabelContent('7-27.点击快速修理确定')
            map.campaign.clickQuickRepairModalOkBtn()
            state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
            stepLabel.setStepLabelContent('7-28.等待出征准备界面')
            if (state.campaign.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('7-29.快修数量不足')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.campaignQuickRepair == 2) then
            -- 中破或大破快修
            stepLabel.setStepLabelContent('7-30.寻找中破或大破的船')
            c.yield(sleepPromise(1000))
            local res = map.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
            if (#res > 0) then
              if ((state.campaign.quickRepairSingleLastShip ~= res[1]) or (state.campaign.quickRepairSingleCount < 3)) then
                state.campaign.quickRepairSingleLastShip = res[1]
                state.campaign.quickRepairSingleCount = state.campaign.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('7-31.中破或大破:' .. table.concat(res, ','))
                map.campaign.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.campaign.quickRepairSingleLastShip = 0
                state.campaign.quickRepairSingleCount = 0
                state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
                stepLabel.setStepLabelContent('7-32.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('7-33.修理完成')
              state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.campaignQuickRepair == 1) then
            -- 大破快修
            stepLabel.setStepLabelContent('7-34.寻找大破的船')

            c.yield(sleepPromise(500))
            local res = map.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
            if (#res > 0) then
              if ((state.campaign.quickRepairSingleLastShip ~= res[1]) or (state.campaign.quickRepairSingleCount < 3)) then
                state.campaign.quickRepairSingleLastShip = res[1]
                state.campaign.quickRepairSingleCount = state.campaign.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('7-35.大破:' .. table.concat(res, ','))
                map.campaign.clickQuickRepairModalSingleShip(res[1])
                c.yield(sleepPromise(500))
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                state.campaign.quickRepairSingleLastShip = 0
                state.campaign.quickRepairSingleCount = 0
                state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
                stepLabel.setStepLabelContent('7-36.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('7-37.修理完成')
              state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('7-38.点击快速修理关闭')
          c.yield(sleepPromise(500))
          map.campaign.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal, 2000 },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('7-39.出征准备界面出征开始')
          c.yield(sleepPromise(100))
          map.campaign.clickBattleStartBtn()
          -- 如果没有开始说明无法远征
          return { type = 'CAMPAIGN_GO_A_EXERCISE' }, state

        elseif (action.type == 'CAMPAIGN_GO_A_EXERCISE') then

          stepLabel.setStepLabelContent('7-40.等待出征准备界面，...')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO', 'missionsGroup', map.campaign.isReadyBattlePage, 3000 },
            { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage },
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_START_PAGE') then

          stepLabel.setStepLabelContent('7-41.开始面板，点击开始')
          c.yield(sleepPromise(100))
          map.campaign.clickBattleStartModalStartBtn()
          stepLabel.setStepLabelContent('7-42.等待阵型面板，追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_GO_A_EXERCISE', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage, 2000 },
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('7-43.阵型面板')
          c.yield(sleepPromise(100))
          map.campaign.clickFormationPageStartBtn(settings.exerciseFormation)
          stepLabel.setStepLabelContent('7-44.等待追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage },
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage, 2000 },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_PURSUE_MODAL') then

          stepLabel.setStepLabelContent('7-45.追击面板')
          c.yield(sleepPromise(100))
          if (settings.exercisePursue) then
            stepLabel.setStepLabelContent('7-46.追击')
            map.campaign.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('7-47.放弃追击')
            map.campaign.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('7-48.等待胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal, 2000 },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_VICTORY_PAGE') then

          stepLabel.setStepLabelContent('7-49.点击胜利继续')
          map.campaign.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('7-50.等待胜利继续界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage, 2000 },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('7-51.点击胜利继续')
          map.campaign.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('7-52.等待演习界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2, 2000 },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO') then

          -- 震动提示不能战斗
          if (settings.campaignAlertWhenNoHp) then
            vibrator(500)
            mSleep(500)
            vibrator(500)
          end

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.campaign.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent("7-53.等待出征界面")
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_BATTLE_PAGE2') then

          stepLabel.setStepLabelContent('7-54.点击回港')
          map.campaign.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('7-55.等待home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          }))
          return makeAction(newstateTypes), state
        end
        return nil, state
      end))
    end
    -- 战役

    missions.activityOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'ACTIVITY_START') then

          stepLabel.setStepLabelContent('20-1.等待home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
            { 'ACTIVITY_INIT', 'missionsGroup', map.home.isHome },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_INIT') then

          state.activity.quickSupplyCount = 0
          state.activity.quickRepairCount = 0
          state.activity.quickRepairSingleLastShip = 0
          state.activity.quickRepairSingleCount = 0
          state.activity.HPIsSafe = true
          state.activity.battleNum = 1
          state.activity.HPIsSafe = true

          stepLabel.setStepLabelContent('20-2.是否有活动按钮')
          local res = map.activity.haveHomeActivityBtn()
          if (res) then
            stepLabel.setStepLabelContent('20-3.点击出征')
            map.activity.clickHomeActivityBtn()
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'ACTIVITY_INIT', 'missionsGroup', map.home.isHome, 2000 },
              { 'ACTIVITY_ACTIVITY_PAGE', 'missionsGroup', map.activity.isActivityPage },
              { 'ACTIVITY_ACTIVITY_INFO_PAGE', 'missionsGroup', map.activity.isActivityInfoPage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('20-4.没有活动按钮')
            return nil, state
          end

        elseif (action.type == 'ACTIVITY_ACTIVITY_PAGE') then

          stepLabel.setStepLabelContent('20-5.点击章节 ' .. settings.activityChapter)
          map.activity.clickChapter(settings.activityChapter)
          stepLabel.setStepLabelContent('20-6.等待战役页面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_INIT', 'missionsGroup', map.home.isHome },
            { 'ACTIVITY_ACTIVITY_PAGE', 'missionsGroup', map.activity.isActivityPage, 2000 },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_ACTIVITY_INFO_PAGE') then

          map.activity.clickActivityReadyBattleBtn()
          stepLabel.setStepLabelContent('20-6.等待战役页面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_INIT', 'missionsGroup', map.home.isHome },
            { 'ACTIVITY_ACTIVITY_PAGE', 'missionsGroup', map.activity.isActivityPage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE', 'missionsGroup', map.activity.isActivityInfoPage, 2000 },
            { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE') then

          if ((state.activity.quickSupplyCount <= 0) and (state.activity.quickRepairCount <= 0)) then
            -- 还没快速补给，还没维修
            stepLabel.setStepLabelContent('20-11.选择舰队:' .. settings.battleFleet)
            map.activity.selectFleet(settings.activityFleet)
            stepLabel.setStepLabelContent('20-12.检测所有状态正常')
            c.yield(sleepPromise(1000))
            local res = map.activity.isReadyBattlePageShipStatusAllRight()
            if (res) then
              stepLabel.setStepLabelContent('20-13.状态正常')
              state.activity.quickSupplyCount = 1
              state.activity.quickRepairCount = 1
              return { type = 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('20-14.状态不正常')
              map.activity.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('20-12.等待快速补给界面')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage, 2000 },
                { 'ACTIVITY_QUICK_SUPPLY_MODAL', 'missionsGroup', map.activity.isQuickSupplyModal },
              }))
              return makeAction(newstateTypes), state
            end
          elseif (state.activity.quickRepairCount <= 0) then
            -- 已经快速补给，还没维修
            stepLabel.setStepLabelContent('20-15.检测血量是否安全')
            c.yield(sleepPromise(1000))
            local res = map.activity.isReadyBattlePageShipHPSafe(settings.activityQuickRepair)
            if (res) then
              stepLabel.setStepLabelContent('20-16.血量安全')
              state.activity.quickRepairCount = 1
              return { type = 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.activityQuickRepair > 0) then
                stepLabel.setStepLabelContent('20-17.血量不安全，快修')
                map.activity.clickQuickRepairBtn()
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage, 2000 },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL', 'missionsGroup', map.activity.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('20-18.血量不安全')
                state.activity.quickRepairCount = 1
                return { type = 'ACTIVITY_READY_BATTLE_PAGE' }, state
              end
            end
          else
            -- 已经快速补给，已经维修
            stepLabel.setStepLabelContent('20-19.再次检测血量是否安全')
            c.yield(sleepPromise(500))
            -- 不允许大破出征
            local res = map.activity.isReadyBattlePageShipHPSafe(math.max(1, settings.activityQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('20-20.血量安全，继续')
              return { type = 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('20-21.血量不安全，返回')
              return { type = 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
            end
          end

        elseif (action.type == 'ACTIVITY_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('20-22.快速补给界面点击确定')
          map.activity.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('20-23.等待出征准备界面')
          state.activity.quickSupplyCount = state.activity.quickSupplyCount + 1
          if (state.activity.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
              { 'ACTIVITY_QUICK_SUPPLY_MODAL', 'missionsGroup', map.activity.isQuickSupplyModal, 2000 },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('20-24.资源数量不足')
            return { type = 'ACTIVITY_QUICK_SUPPLY_MODAL_CLOSE' }, state
          end

        elseif (action.type == 'ACTIVITY_QUICK_SUPPLY_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('20-25.点击快速补给关闭')
          c.yield(sleepPromise(100))
          map.activity.clickQuickSupplyModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickSupplyModal, 2000 },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_QUICK_REPAIR_MODAL') then

          if (settings.activityQuickRepair == 3) then
            -- 不满血则快修
            stepLabel.setStepLabelContent('20-26.点击快速修理确定')
            c.yield(sleepPromise(500))
            map.activity.clickQuickRepairModalOkBtn()
            state.activity.quickRepairCount = state.activity.quickRepairCount + 1
            stepLabel.setStepLabelContent('20-27.等待出征准备界面')
            if (state.activity.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                { 'ACTIVITY_QUICK_REPAIR_MODAL', 'missionsGroup', map.activity.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('20-28.快修数量不足')
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal, 2000 },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.activityQuickRepair == 2) then
            -- 中破或大破快修
            stepLabel.setStepLabelContent('20-29.寻找中破或大破的船')
            c.yield(sleepPromise(1000))
            local res = map.activity.isQuickRepairModalShipNeedRepair(settings.activityQuickRepair)
            if (#res > 0) then
              if ((state.activity.quickRepairSingleLastShip ~= res[1]) or (state.activity.quickRepairSingleCount < 3)) then
                state.activity.quickRepairSingleLastShip = res[1]
                state.activity.quickRepairSingleCount = state.activity.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('20-30.中破或大破:' .. table.concat(res, ','))
                map.activity.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL', 'missionsGroup', map.activity.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.activity.quickRepairSingleLastShip = 0
                state.activity.quickRepairSingleCount = 0
                state.activity.quickRepairCount = state.activity.quickRepairCount + 1
                stepLabel.setStepLabelContent('20-31.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('20-32.修理完成')
              state.activity.quickRepairCount = state.activity.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end

          elseif (settings.activityQuickRepair == 1) then
            -- 大破快修
            stepLabel.setStepLabelContent('20-33.寻找大破的船')
            c.yield(sleepPromise(1000))
            local res = map.activity.isQuickRepairModalShipNeedRepair(settings.activityQuickRepair)
            if (#res > 0) then
              if ((state.activity.quickRepairSingleLastShip ~= res[1]) or (state.activity.quickRepairSingleCount < 3)) then
                state.activity.quickRepairSingleLastShip = res[1]
                state.activity.quickRepairSingleCount = state.activity.quickRepairSingleCount + 1

                stepLabel.setStepLabelContent('20-34.大破:' .. table.concat(res, ','))
                map.activity.clickQuickRepairModalSingleShip(res[1])
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL', 'missionsGroup', map.activity.isQuickRepairModal, 500 },
                }))
                return makeAction(newstateTypes), state
              else
                state.activity.quickRepairSingleLastShip = 0
                state.activity.quickRepairSingleCount = 0
                state.activity.quickRepairCount = state.activity.quickRepairCount + 1
                stepLabel.setStepLabelContent('20-35.快修数量不足')
                local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                  { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                  { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal },
                }))
                return makeAction(newstateTypes), state
              end
            else
              stepLabel.setStepLabelContent('20-36.修理完成')
              state.activity.quickRepairCount = state.activity.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
                { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal },
              }))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('20-37.点击快速修理关闭')
          c.yield(sleepPromise(500))
          map.activity.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('20-38.等待出征准备界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.activity.isQuickRepairModal, 2000 },
            { 'ACTIVITY_READY_BATTLE_PAGE', 'missionsGroup', map.activity.isReadyBattlePage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('20-39.检测舰队可以出征')
          c.yield(sleepPromise(500))
          local fleetCanBattle = map.activity.isFleetsCanBattle()
          if (fleetCanBattle) then
            stepLabel.setStepLabelContent('20-40.可以出征')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'ACTIVITY_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.activity.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('20-41.返回HOME')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('20-42.出征准备界面，点击出征开始')
          c.yield(sleepPromise(100))
          map.activity.clickBattleStartBtn()
          return { type = 'ACTIVITY_GO_A_BATTLE' }, state

        elseif (action.type == 'ACTIVITY_GO_A_BATTLE') then

          if (state.activity.battleNum < settings.activityMaxBattleNum) then
            stepLabel.setStepLabelContent('20-43.第' .. state.activity.battleNum .. '战开始')
          else
            stepLabel.setStepLabelContent('20-44.第' .. state.activity.battleNum .. '战Boss战开始')
          end
          stepLabel.setStepLabelContent('20-45.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.activity.isReadyBattlePage, 2000 },
            { 'ACTIVITY_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.activity.isExtraReceiveModal },
            { 'ACTIVITY_BATTLE_START_PAGE', 'missionsGroup', map.activity.isBattleStartPage },
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            -- { 'ACTIVITY_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.activity.isNewShipPageLockModal },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_EXTRA_RECEIVE_MODAL') then

          stepLabel.setStepLabelContent('20-46.额外获得面板，点击确定')
          map.activity.clickExtraReceiveModalOk()
          state.activity.battleNum = state.activity.battleNum + 1
          stepLabel.setStepLabelContent('20-47.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.activity.isExtraReceiveModal, 2000 },
            { 'ACTIVITY_BATTLE_START_PAGE', 'missionsGroup', map.activity.isBattleStartPage },
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_BATTLE_START_PAGE') then

          stepLabel.setStepLabelContent('20-48.开始面板，点击开始')
          c.yield(sleepPromise(200))
          if (settings.activityRoundabout and map.activity.isBattleStartPageCanRoundabout()) then
            map.activity.clickBattleStartModalRoundaboutBtn()
          else
            map.activity.clickBattleStartModalStartBtn()
          end
          stepLabel.setStepLabelContent('20-49.等待阵型面板，追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_BATTLE_START_PAGE', 'missionsGroup', map.activity.isBattleStartPage, 2000 },
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('20-50.阵型面板')
          c.yield(sleepPromise(100))
          map.activity.clickFormationPageStartBtn(settings.activityFormation)
          stepLabel.setStepLabelContent('20-51.等待追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'ACTIVITY_BATTLE_START_PAGE', 'missionsGroup', map.activity.isBattleStartPage, 2000 },
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage, 2000 },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_PURSUE_PAGE') then

          stepLabel.setStepLabelContent('20-52.追击面板')
          if ((settings.activityPursue and (state.activity.battleNum < settings.activityMaxBattleNum))
              or (settings.activityPursueBoss and (state.activity.battleNum == settings.activityMaxBattleNum))) then
            stepLabel.setStepLabelContent('20-53.追击')
            map.activity.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('20-54.放弃追击')
            map.activity.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('20-55.等待胜利界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_FORMATION_PAGE', 'missionsGroup', map.activity.isFormationPage, 2000 },
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal, 2000 },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_VICTORY_PAGE') then

          c.yield(sleepPromise(1000))
          stepLabel.setStepLabelContent('20-56.胜利界面检测HP是否安全')
          c.yield(sleepPromise(300))
          -- 有大破就回港
          state.activity.HPIsSafe = map.activity.isVictoryPageShipHPSafe(1)
          if (state.activity.HPIsSafe) then
            stepLabel.setStepLabelContent('20-57.HP安全')
          else
            stepLabel.setStepLabelContent('20-58.HP不安全')
          end
          c.yield(sleepPromise(200))
          stepLabel.setStepLabelContent('20-59.点击胜利继续')
          map.activity.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('20-60.等待胜利继续界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_PURSUE_PAGE', 'missionsGroup', map.activity.isPursueModal, 2000 },
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage, 2000 },
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('20-61.点击胜利继续')
          map.activity.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('20-62.等待大破警告，新船，下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_VICTORY_PAGE', 'missionsGroup', map.activity.isVictoryPage, 2000 },
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2, 2000 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL') then

          stepLabel.setStepLabelContent('20-63.大破警告框点击返回')
          map.activity.clickShipSevereDamageModalBack()
          stepLabel.setStepLabelContent('20-64.等待新船，下回合窗口，勋章对话框，home')
          state.activity.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_VICTORY_NEXT_PAGE', 'missionsGroup', map.activity.isVictoryPage2, 2000 },
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal, 2000 },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_SHIP_CANT_GO_ON_MODAL') then

          stepLabel.setStepLabelContent('20-65.无法前进警告框点击返回')
          map.activity.clickShipCantGoOnModalBackBtn()
          stepLabel.setStepLabelContent('20-66.等待新船，下回合窗口，勋章对话框，home')
          state.activity.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal, 2000 },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_NEW_SHIP_PAGE') then

          stepLabel.setStepLabelContent('20-67.获取新船')
          c.yield(sleepPromise(500))
          map.activity.clickNewShip()
          stepLabel.setStepLabelContent('20-68.等待新船锁定窗口，下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal, 2000 },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.activity.isNewShipPageLockModal },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('20-69.新船锁定窗口点击确认')
          map.activity.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('20-70.等待下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.activity.isShipSevereDamageModal, 2000 },
            { 'ACTIVITY_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.activity.isShipCantGoOnModal, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE', 'missionsGroup', map.activity.isNewShipPage, 2000 },
            { 'ACTIVITY_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.activity.isNewShipPageLockModal, 2000 },
            { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal },
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_NEXT_LEVEL_STEP_MODAL') then

          if ((state.activity.battleNum < settings.activityMaxBattleNum) and state.activity.HPIsSafe) then
            stepLabel.setStepLabelContent('20-71.点击继续下一关')
            map.activity.clickLevelStepModalContinueBtn()
            state.activity.battleNum = state.activity.battleNum + 1
            return { type = 'ACTIVITY_GO_A_BATTLE' }, state
          else
            stepLabel.setStepLabelContent('20-72.点击回港')
            map.activity.clickLevelStepModalBackBtn()
            stepLabel.setStepLabelContent('20-73.等待主界面')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
              { 'ACTIVITY_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.activity.isNextLevelStepModal, 2000 },
              { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
              { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
              { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
            }))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE_CHECK_CANT_GO') then

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.activity.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent('20-74.等待出征界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isReadyBattlePage, 2000 },
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME') then

          map.activity.clickActivityInfoPageBackBtn()
          stepLabel.setStepLabelContent('20-75.等待主界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage, 2000 },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage, 2000 },
          }))
          return makeAction(newstateTypes), state

        elseif (action.type == 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME') then

          map.activity.clickActivityPageBackBtn()
          stepLabel.setStepLabelContent('20-76.等待主界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'ACTIVITY_ACTIVITY_INFO_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityInfoPage, 2000 },
            { 'ACTIVITY_ACTIVITY_PAGE_BACK_TO_HOME', 'missionsGroup', map.activity.isActivityPage, 2000 },
          }))
          return makeAction(newstateTypes), state
        end

        return nil, state
      end))
    end

    return missions
  end,
  next = function(action, state)
    state = table.assign(stateTree, state)
    return co(c.create(function()
      for key, item in pairs(missions) do
        local newAction, newState = c.yield(item(action, state))
        if (newAction) then
          return newAction, newState
        end
      end
    end))
  end
}
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

local assign = function(target, ...)
  local sources = { ... }
  if (type(target) ~= 'table') then target = {} end
  for _, source in ipairs(sources) do
    for key, value in pairs(source) do
      target[key] = value
    end
  end
  return target
end

local mergeArr = function(target, ...)
  local sources = { ... }
  if (type(target) ~= 'table') then target = {} end
  for _, source in ipairs(sources) do
    for key, value in ipairs(source) do
      table.insert(target, value)
    end
  end
  return target
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

local setScreenListeners = function(theArr)

  if ((type(theArr) ~= 'table') or (#theArr == 0)) then
    return Promise.resolve({})
  end

  return co(c.create(function()
    local newArr = {}
    local tags = {}
    local done = false
    for key, listenerEvent in ipairs(theArr) do
      if (type(listenerEvent[2]) == 'table') then
        tags = mergeArr(tags, listenerEvent[2])
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
  home = {},
  network = {},
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
}



return {
  init = function(map, stepLabel, settings)
    -- 定义需要全局监听状态
    local getComListener = function()
      return {
        { { type = 'NETWORK_NETWORK_FAILURE_MODAL', addToStart = true }, 'homeGroup', map.home.isNetworkFailureModal, 2000 },
      }
    end
    local getHomeListener = function()
      return {
        -- { 'HOME_MEDAL_MODAL', 'homeGroup', map.home.isMedalModal, 2000 },
        { 'HOME_HOME', 'homeGroup', map.home.isHome },
        { { type = 'HOME_NEWS_MODAL', addToStart = true }, 'homeGroup', map.home.isNewsModal, 2000 },
        { { type = 'HOME_SIGN_MODAL', addToStart = true }, 'homeGroup', map.home.isSignModal, 2000 },
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

          stepLabel.setStepLabelContent('1-3.网络不通，点击确认')
          map.home.clickNetworkFailureModalOk()
          c.yield(sleepPromise(2000))
          local res = map.home.isNetworkFailureModal()
          if (res) then
            return makeAction('NETWORK_NETWORK_FAILURE_MODAL'), state
          end
          return nil, state
        end

        return nil
      end))
    end

    missions.battleOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'BATTLE_START') then
          state.battle.quickSupplyCount = 0
          state.battle.quickRepairCount = 0
          state.battle.HPIsSafe = true
          state.battle.battleNum = 1
          state.battle.cantBattle = true

          stepLabel.setStepLabelContent('2-1.等待HOME')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_HOME_CLICK_BATTLE') then

          stepLabel.setStepLabelContent('2-2.点击出征')
          map.home.clickBattleBtn()
          stepLabel.setStepLabelContent('2-3.等待出征页面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('2-5.出征页面点击出征的出征按钮')
          c.yield(sleepPromise(500))
          map.battle.clickBattleBtn()
          stepLabel.setStepLabelContent('2-6.等待出征的出征界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage },
          })))
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

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattleBattlePage, 2000 },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE') then

          if ((state.battle.quickSupplyCount <= 0) and (state.battle.quickRepairCount <= 0)) then
            -- 还没快速补给，还没维修
            stepLabel.setStepLabelContent('2-11.选择舰队:' .. settings.battleFleet)
            map.battle.selectFleet(settings.battleFleet)
            stepLabel.setStepLabelContent('2-12.检测所有状态正常')
            c.yield(sleepPromise(500))
            local res = map.battle.isReadyBattlePageShipStatusAllRignt()
            if (res) then
              stepLabel.setStepLabelContent('2-13.状态正常')
              state.battle.quickSupplyCount = 1
              state.battle.quickRepairCount = 1
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('2-14.状态不正常')
              map.battle.clickReadyBattlePageQuickSupplyBtn()
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
                { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.isQuickSupplyModal },
              })))
              return makeAction(newstateTypes), state
            end
          elseif (state.battle.quickRepairCount <= 0) then
            -- 已经快速补给，还没维修
            stepLabel.setStepLabelContent('2-15.检测血量是否安全')
            c.yield(sleepPromise(500))
            local res = map.battle.isReadyBattlePageShipHPSafe(settings.battleQuickRepair)
            if (res) then
              stepLabel.setStepLabelContent('2-16.血量安全')
              state.battle.quickRepairCount = 1
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.battleQuickRepair > 0) then
                stepLabel.setStepLabelContent('2-17.血量不安全，快修')
                map.battle.clickQuickRepairBtn()
                return { type = 'BATTLE_QUICK_REPAIR_MODAL' }, state
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
              return { type = 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
            end
          end

        elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('2-22.快速补给界面点击确定')
          map.battle.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('2-23.等待出征准备界面')
          state.battle.quickSupplyCount = state.battle.quickSupplyCount + 1
          if (state.battle.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.isQuickSupplyModal, 2000 },
            })))
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
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickSupplyModal, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL') then

          if (settings.battleQuickRepair == 3) then
            -- 不满血则快修
            stepLabel.setStepLabelContent('2-26.点击快速修理确定')
            map.battle.clickQuickRepairModalOkBtn()
            state.battle.quickRepairCount = state.battle.quickRepairCount + 1
            stepLabel.setStepLabelContent('2-27.等待出征准备界面')
            if (state.battle.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 2000 },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('2-28.快修数量不足')
              return { type = 'BATTLE_QUICK_REPAIR_MODAL_CLOSE' }, state
            end

          elseif (settings.battleQuickRepair == 2) then
            -- 中破或大破快修
            stepLabel.setStepLabelContent('2-29.寻找中破或大破的船')
            c.yield(sleepPromise(500))
            local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
            if (#res > 0) then
              stepLabel.setStepLabelContent('2-30.中破或大破:' .. table.concat(res, ','))
              map.battle.clickQuickRepairModalSingleShip(res[1])
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 500 },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('2-31.修理完成')
              state.battle.quickRepairCount = state.battle.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
              })))
              return makeAction(newstateTypes), state
            end

          elseif (settings.battleQuickRepair == 1) then
            -- 大破快修
            stepLabel.setStepLabelContent('2-32.寻找大破的船')
            c.yield(sleepPromise(500))
            local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
            if (#res > 0) then
              stepLabel.setStepLabelContent('2-33.大破:' .. table.concat(res, ','))
              map.battle.clickQuickRepairModalSingleShip(res[1])
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL', 'missionsGroup', map.battle.isQuickRepairModal, 500 },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('2-34.修理完成')
              state.battle.quickRepairCount = state.battle.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
                { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal },
              })))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('2-35.点击快速修理关闭')
          c.yield(sleepPromise(100))
          map.battle.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('2-36.等待出征准备界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.battle.isQuickRepairModal, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.isReadyBattlePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('2-37.检测舰队可以出征')
          c.yield(sleepPromise(500))
          local fleetCanBattle = map.battle.isFleetsCanBattle()
          if (fleetCanBattle) then
            stepLabel.setStepLabelContent('2-38.可以出征')
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.battle.isReadyBattlePage },
            })))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('2-39.返回HOME')
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage },
            })))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('2-40.出征准备界面，点击出征开始')
          c.yield(sleepPromise(100))
          map.battle.clickBattleStartBtn()
          return { type = 'BATTLE_GO_A_BATTLE' }, state

        elseif (action.type == 'BATTLE_GO_A_BATTLE') then

          if (state.battle.battleNum < settings.battleMaxBattleNum) then
            stepLabel.setStepLabelContent('2-41.第' .. state.battle.battleNum .. '战开始')
          else
            stepLabel.setStepLabelContent('2-42.第' .. state.battle.battleNum .. '战Boss战开始')
          end
          stepLabel.setStepLabelContent('2-43.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
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
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_EXTRA_RECEIVE_MODAL') then

          stepLabel.setStepLabelContent('2-44.额外获得面板，点击确定')
          map.battle.clickExtraReceiveModalOk()
          state.battle.battleNum = state.battle.battleNum + 1
          stepLabel.setStepLabelContent('2-45.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
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
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_START_PAGE') then

          stepLabel.setStepLabelContent('2-46.开始面板，点击开始')
          c.yield(sleepPromise(100))
          map.battle.clickBattleStartModalStartBtn()
          stepLabel.setStepLabelContent('2-47.等待阵型面板，追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage, 2000 },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('2-48.阵型面板')
          c.yield(sleepPromise(100))
          map.battle.clickFormationPageStartBtn(settings.battleFormation)
          stepLabel.setStepLabelContent('2-49.等待追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.isBattleStartPage, 2000 },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage, 2000 },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_PURSUE_PAGE') then

          stepLabel.setStepLabelContent('2-50.追击面板')
          if ((settings.battlePursue and (state.battle.battleNum < settings.battleMaxBattleNum))
            or (settings.battlePursueBoss and (state.battle.battleNum == settings.battleMaxBattleNum))) then
            stepLabel.setStepLabelContent('2-51.追击')
            map.battle.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('2-52.放弃追击')
            map.battle.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('2-53.等待胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.isFormationPage, 2000 },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal, 2000 },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_VICTORY_PAGE') then

          c.yield(sleepPromise(1000))
          stepLabel.setStepLabelContent('2-54.胜利界面检测HP是否安全')
          c.yield(sleepPromise(300))
          -- 有大破就回港
          state.battle.HPIsSafe = map.battle.isVictoryPageShipHPSafe(1)
          if (state.battle.HPIsSafe) then
            stepLabel.setStepLabelContent('2-55.HP安全')
          else
            stepLabel.setStepLabelContent('2-56.HP不安全')
          end
          c.yield(sleepPromise(200))
          stepLabel.setStepLabelContent('2-57.点击胜利继续')
          c.yield(sleepPromise(200))
          map.battle.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('2-58.等待胜利继续界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.isPursueModal, 2000 },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage, 2000 },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('2-59.点击胜利继续')
          map.battle.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('2-60.等待大破警告，新船，下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.isVictoryPage, 2000 },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2, 2000 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_SHIP_SERVER_DAMAGE_MODAL') then

          stepLabel.setStepLabelContent('2-61.大破警告框点击返回')
          map.battle.clickShipSevereDamageModalBack()
          stepLabel.setStepLabelContent('2-62.等待新船，下回合窗口，勋章对话框，home')
          state.battle.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.isVictoryPage2, 2000 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_SHIP_CANT_GO_ON_MODAL') then

          stepLabel.setStepLabelContent('2-63.无法前进警告框点击返回')
          map.battle.clickShipCantGoOnModalBackBtn()
          stepLabel.setStepLabelContent('2-64.等待新船，下回合窗口，勋章对话框，home')
          state.battle.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_NEW_SHIP_PAGE') then

          stepLabel.setStepLabelContent('2-65.获取新船')
          c.yield(sleepPromise(500))
          map.battle.clickNewShip()
          stepLabel.setStepLabelContent('2-66.等待新船锁定窗口，下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.isNewShipPageLockModal },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('2-67.新船锁定窗口点击确认')
          map.battle.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('2-68.等待下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.isNewShipPage, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.isNewShipPageLockModal, 2000 },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_NEXT_LEVEL_STEP_MODAL') then

          if ((state.battle.battleNum < settings.battleMaxBattleNum) and state.battle.HPIsSafe) then
            stepLabel.setStepLabelContent('2-69.点击继续下一关')
            map.battle.clickLevelStepModalContinueBtn()
            state.battle.battleNum = state.battle.battleNum + 1
            return { type = 'BATTLE_GO_A_BATTLE' }, state
          else
            stepLabel.setStepLabelContent('2-70.点击回港')
            map.battle.clickLevelStepModalBackBtn()
            stepLabel.setStepLabelContent('2-71.等待主界面')
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
              { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.isNextLevelStepModal, 2000 },
            })))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CANT_GO') then

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.battle.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent('2-72.等待出征界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isReadyBattlePage, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME') then

          map.battle.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('2-73.等待主界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattleBattlePage, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.isBattlePage, 2000 },
          })))
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
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'MISSION_IS_UNRECEIVED_MISSION', 'missionsGroup', map.home.isHome },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then

          stepLabel.setStepLabelContent('3-2.检测是否有任务奖励')
          c.yield(sleepPromise(100))
          local res = map.mission.isUnreceivedMission()
          if (res) then
            return { type = 'MISSION_INIT' }, state
          end
          stepLabel.setStepLabelContent('3-3.没有任务奖励')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener())))
          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_INIT') then

          stepLabel.setStepLabelContent('3-4点击任务按钮')
          map.mission.clickMission()
          stepLabel.setStepLabelContent('3-5.等待任务界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'MISSION_INIT', 'homeGroup', map.home.isHome, 2000 },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_PAGE') then

          stepLabel.setStepLabelContent('3-6.点击全部任务')
          map.missionClickAllMission()
          stepLabel.setStepLabelContent('3-7.等待任务全部任务界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission, 2000 },
          })))

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

            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
              { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
              { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel },
            })))

            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'MISSION_REWAR_PANNEL') then

          stepLabel.setStepLabelContent('3-11.点击确定')
          map.mission.clickRewardPannelOk()
          stepLabel.setStepLabelContent('3-12.等待新船，任务全部任务')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 1000 },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
          })))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_NEW_SHIP') then

          stepLabel.setStepLabelContent('3-13.点击新船')
          map.mission.clickNewShip()
          stepLabel.setStepLabelContent('3-14.等待新船锁定，任务全部任务')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
          })))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('3-15.点击新船')
          map.mission.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('3-16.等待任务全部任务')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
          })))

          return makeAction(newstateTypes), state

        elseif (action.type == 'MISSION_PAGE_NO_REWAR') then

          stepLabel.setStepLabelContent('3-17.等待返回home')
          map.mission.clickBackToHome()

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'MISSION_PAGE_NO_REWAR', 'missionsGroup', map.mission.isMission, 2000 },
          })))
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
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_REWARD_INIT', 'missionsGroup', map.home.isHome },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_INIT') then
          if (type(settings.enableChapter) ~= 'table') then
            settings.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }
          elseif (#settings.enableChapter < 1) then
            stepLabel.setStepLabelContent('4-2.没有远征任务！')
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener())))
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
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener())))
            return makeAction(newstateTypes), state
          end
          stepLabel.setStepLabelContent('4-5.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('4-6.等待出征界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

          stepLabel.setStepLabelContent('4-7.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('4-8.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattle, 2000 },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

          if (#state.expeditionReward.enableChapter > 0) then
            local chapter = state.expeditionReward.enableChapter[1]
            stepLabel.setStepLabelContent('4-9.移动到第' .. chapter .. '章')
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

            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
              { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
              { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage },
            })))
            return makeAction(newstateTypes), state
          end

          stepLabel.setStepLabelContent('4-13.本页没有可收获的奖励')
          table.remove(state.expeditionReward.enableChapter, 1)
          return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }, state

        elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then

          map.expedition.clickRewardPannelOk()
          stepLabel.setStepLabelContent('4-14.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage, 2000 },
            { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_REWARD_RETURN_TO_HOME') then

          map.expedition.clickBackToHome()
          stepLabel.setStepLabelContent('4-15.返回HOME')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'EXPEDITION_REWARD_RETURN_TO_HOME', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          })))
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
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_INIT', 'missionsGroup', map.home.isHome },
          })))
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
          state.expedition.lastChapter = nil
          state.expedition.fleet = nil
          state.expedition.chapters = nil
          state.expedition.quickSupplyChecked = nil
          state.expedition.quickRepairChecked = nil


          stepLabel.setStepLabelContent('4-19.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('4-20.等待出征界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattlePage },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then
          -- 进入出征大页面
          stepLabel.setStepLabelContent('4-21.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('4-22.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattlePage, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_IS_EXPEDITION_PAGE') then
          -- 进入远征页面
          if (#state.expedition.expeditionFleetToChapter > 0) then
            state.expedition.quickSupplyChecked = nil
            state.expedition.quickRepairChecked = nil

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

              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
                { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('4-26.本章不能远征')
              -- 执行下一个章节
              table.remove(state.expedition.expeditionFleetToChapter, 1)
              return { type = 'EXPEDITION_IS_EXPEDITION_PAGE' }, state
            end
          else
            stepLabel.setStepLabelContent('4-27.没有远征')
            return { type = 'EXPEDITION_RETURN_TO_HOME' }, state
          end

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE') then
          -- 远征准备界面，进行状态是否最佳的检测，然后进行补给和维修
          stepLabel.setStepLabelContent('4-27.选择舰队' .. state.expedition.fleet)
          map.expedition.clickSelectFleet(state.expedition.fleet)
          stepLabel.setStepLabelContent('4-28.检测所有状态正常')
          c.yield(sleepPromise(300))
          -- 检测舰队是否在最佳状态
          local res = map.expedition.isReadyExpeditionShipStatus()
          if (not res) then
            -- 舰队不是最佳状态
            stepLabel.setStepLabelContent('4-29.状态不正常')

            if (not state.expedition.quickSupplyChecked) then
              -- 快速补给
              map.expedition.clickQuickSupply()
              stepLabel.setStepLabelContent('4-30.等待快速补给界面')

              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'EXPEDITION_QUICK_SUPPLY_MODAL', 'missionsGroup', map.expedition.isQuickSupply },
                { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare, 2000 },
              })))

              return makeAction(newstateTypes), state

            elseif (not state.expedition.quickRepairChecked) then
              -- 快速修理
              if (settings.expeditionQuickRepair > 0) then
                map.expedition.clickQuickRepair()
                stepLabel.setStepLabelContent('4-31.等待快速修理界面')

                local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                  { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepair },
                  { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare, 2000 },
                })))

                return makeAction(newstateTypes), state
              end
            end

            -- 快速补给和修理都完成了，还不是最佳状态，则跳转到能否出征检测
            return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO' }, state
          end

          -- 舰队是最佳状态，跳转到能否出征检测
          return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO' }, state

        elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL') then
          -- 快速补给界面
          map.expedition.clickQuickSupplyDo()
          stepLabel.setStepLabelContent('4-32.等待远征准备界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_QUICK_SUPPLY_MODAL', 'missionsGroup', map.expedition.isQuickSupply, 2000 },
            { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare },
          })))

          -- 页面没有停留在本页说明快速补给完成
          if (newstateTypes ~= 'EXPEDITION_QUICK_SUPPLY_MODAL') then
            state.expedition.quickSupplyChecked = true
          end

          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL') then
          -- 快速修理界面

          map.expedition.clickQuickRepairDo()
          stepLabel.setStepLabelContent('4-33.等待远征准备界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_QUICK_REPAIR_MODAL', 'missionsGroup', map.expedition.isQuickRepair, 2000 },
            { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare },
          })))

          -- 页面没有停留在本页说明快速修理完成
          if (newstateTypes ~= 'EXPEDITION_QUICK_REPAIR_MODAL') then
            state.expedition.quickRepairChecked = true
          end

          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO') then
          -- 检测舰队是否可以远征
          stepLabel.setStepLabelContent('4-34.检测舰队可以远征')
          c.yield(sleepPromise(500))
          local fleetCanExpedition = map.expedition.isCanExpedition()
          if (not fleetCanExpedition) then
            return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO' }, state
          else
            stepLabel.setStepLabelContent('4-35.点击远征开始')
            map.expedition.clickBattleStart()
          end
          stepLabel.setStepLabelContent('4-36.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO', 'missionsGroup', map.expedition.isExpeditionPrepare, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO') then
          -- 舰队不能远征，准备返回远征页
          stepLabel.setStepLabelContent('4-37.点击返回远征界面')
          map.expedition.clickBackToExpedition()

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO', 'missionsGroup', map.expedition.isExpeditionPrepare, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          })))

          -- 如果离开这一页，则从远征队列里退出一个队伍
          if (newstateTypes ~= 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO') then
            table.remove(state.expedition.expeditionFleetToChapter, 1)
          end

          return makeAction(newstateTypes), state

        elseif (action.type == 'EXPEDITION_RETURN_TO_HOME') then

          stepLabel.setStepLabelContent('4-38.返回港口')
          map.expedition.clickBackToHome()
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener())))
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
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'REPAIR_INIT', 'missionsGroup', map.home.isHome },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_INIT') then
          state.repair.slot = nil

          stepLabel.setStepLabelContent('5-2.点击出征')
          c.yield(sleepPromise(100))
          map.repair.clickDockBtn()
          stepLabel.setStepLabelContent('5-3.等待船坞界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage },
          })))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_DOCK_PAGE') then

          stepLabel.setStepLabelContent('5-4.点击修理按钮')
          c.yield(sleepPromise(100))
          map.repair.clickRepairBtn()
          stepLabel.setStepLabelContent('5-5.等待修理界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage, 2000 },
          })))

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
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
              { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage },
              { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
            })))

            if (newstateTypes == 'REPAIR_REPAIR_FINISH') then
              stepLabel.setStepLabelContent('5-9.没有船需要维修')
            end

            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('5-10.没有空位')

            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
              { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
            })))
            return makeAction(newstateTypes), state
          end

        elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then

          stepLabel.setStepLabelContent('5-11.选择第一个船')
          c.yield(sleepPromise(200))
          map.repair.clickFirstShip()
          stepLabel.setStepLabelContent('5-12.等待返回修理界面')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
          })))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then

          stepLabel.setStepLabelContent('5-13.等待第' .. state.repair.slot .. '个槽位变成修理状态')

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isSlotNotEmpty(state.repair.slot) },
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
          })))

          return makeAction(newstateTypes), state

        elseif (action.type == 'REPAIR_REPAIR_FINISH') then

          stepLabel.setStepLabelContent('5-14.完成维修')
          map.repair.clickBackToHomeBtn()

          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener())))
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
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_INIT') then

          state.exercise.quickSupplyCount = 0
          state.exercise.quickRepairCount = 0
          state.exercise.battleNum = 1
          state.exercise.HPIsSafe = true

          stepLabel.setStepLabelContent('6-2.点击出征')
          map.home.clickBattleBtn()
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('6-3.点击演习')
          map.exercise.clickExerciseBtn()
          stepLabel.setStepLabelContent('6-4.等待演习页面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome },
            { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage, 2000 },
            { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
          })))
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
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
              { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage, 2000 },
              { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage, 2000 },
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            })))
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
            c.yield(sleepPromise(500))
            local res = map.exercise.isReadyBattlePageShipStatusAllRignt()
            if (not res) then
              stepLabel.setStepLabelContent('6-11.状态不正常')
              map.exercise.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('6-12.等待快速补给界面')
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
                { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal },
              })))
              return makeAction(newstateTypes), state
            else
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
            end
          elseif (state.exercise.quickRepairCount <= 0) then
            stepLabel.setStepLabelContent('6-13.检测血量是否安全')
            c.yield(sleepPromise(500))
            local res = map.exercise.isReadyBattlePageShipHPSafe(settings.exerciseQuickRepair)
            if (res) then
              stepLabel.setStepLabelContent('6-14.血量安全，继续')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.exerciseQuickRepair > 0) then
                stepLabel.setStepLabelContent('6-15.血量不安全，点击快修')
                map.exercise.clickQuickRepairBtn()
                stepLabel.setStepLabelContent('6-16.等待快修界面')
                local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
                  { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal },
                })))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('6-17.血量不安全，返回')
                return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
              end
            end
          else
            stepLabel.setStepLabelContent('6-18.再次检测血量是否安全')
            c.yield(sleepPromise(500))
            -- 不允许大破出征
            local res = map.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))
            if (res) then
              stepLabel.setStepLabelContent('6-19.血量安全，继续')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('6-20.血量不安全，返回')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
            end
          end

        elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('6-22.快速补给界面点击确定')
          map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('6-23.等待出征准备界面')
          state.exercise.quickSupplyCount = state.exercise.quickSupplyCount + 1
          if (state.exercise.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
            })))
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
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL') then

          if (settings.exerciseQuickRepair == 3) then
            stepLabel.setStepLabelContent('6-27.点击快速修理确定')
            map.exercise.clickQuickRepairModalOkBtn()
            state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
            stepLabel.setStepLabelContent('6-28.等待出征准备界面')
            if (state.exercise.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('6-29.快速修理数量不足')
              return { type = 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE' }, state
            end

          elseif (settings.exerciseQuickRepair == 2) then
            -- 中破或大破快修
            stepLabel.setStepLabelContent('6-30.寻找中破或大破的船')
            c.yield(sleepPromise(500))
            local res = map.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
            if (#res > 0) then
              stepLabel.setStepLabelContent('6-31.中破或大破:' .. table.concat(res, ','))
              map.exercise.clickQuickRepairModalSingleShip(res[1])
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal, 500 },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('6-32.修理完成')
              state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal },
              })))
              return makeAction(newstateTypes), state
            end

          elseif (settings.exerciseQuickRepair == 1) then
            -- 大破快修
            stepLabel.setStepLabelContent('6-33.寻找大破的船')
            c.yield(sleepPromise(500))
            local res = map.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
            if (#res > 0) then
              stepLabel.setStepLabelContent('6-34.大破:' .. table.concat(res, ','))
              map.exercise.clickQuickRepairModalSingleShip(res[1])
              c.yield(sleepPromise(500))
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('6-35.修理完成')
              state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
                { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal },
              })))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('6-36.点击快速修理关闭')
          c.yield(sleepPromise(100))
          map.exercise.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          stepLabel.setStepLabelContent('6-37.等待出征准备界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
            { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('6-38.检测舰队是否可以出征')
          c.yield(sleepPromise(300))
          local fleetCanBattle = map.exercise.isFleetsCanBattle()
          if (not fleetCanBattle) then
            stepLabel.setStepLabelContent('6-39.舰队无法战斗')
            return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
          else
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
          end

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('6-40.出征准备界面出征开始')
          c.yield(sleepPromise(100))
          map.exercise.clickBattleStartBtn()
          return { type = 'EXERCISE_GO_A_EXERCISE' }, state

        elseif (action.type == 'EXERCISE_GO_A_EXERCISE') then

          stepLabel.setStepLabelContent('6-41.等待出征准备界面，...')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_GO_A_EXERCISE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_START_PAGE') then

          stepLabel.setStepLabelContent('6-42.开始面板，点击开始')
          c.yield(sleepPromise(100))
          map.exercise.clickBattleStartModalStartBtn()
          stepLabel.setStepLabelContent('6-36.等待阵型面板，追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_GO_A_EXERCISE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage, 2000 },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('6-43.阵型面板')
          c.yield(sleepPromise(100))
          map.exercise.clickFormationPageStartBtn(settings.exerciseFormation)
          stepLabel.setStepLabelContent('6-44.等待追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage, 2000 },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_PURSUE_MODAL') then

          stepLabel.setStepLabelContent('6-45.追击面板')
          c.yield(sleepPromise(100))
          if (settings.exercisePursue) then
            stepLabel.setStepLabelContent('6-46.追击')
            map.exercise.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('6-47.放弃追击')
            map.exercise.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('6-48.等待胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal, 2000 },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_VICTORY_PAGE') then

          stepLabel.setStepLabelContent('6-49.点击胜利继续')
          map.exercise.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('6-50.等待胜利继续界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage, 2000 },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
            { 'EXERCISE_BATTLE_PAGE2', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE2', 'missionsGroup', map.exercise.isExercisePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('6-51.点击胜利继续')
          map.exercise.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('6-52.等待演习界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2, 2000 },
            { 'EXERCISE_BATTLE_PAGE2', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE2', 'missionsGroup', map.exercise.isExercisePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.exercise.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent("6-53.等待出征界面")
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_BATTLE_PAGE2', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_BATTLE_PAGE2', 'missionsGroup', map.exercise.isExercisePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'EXERCISE_BATTLE_PAGE2') then

          stepLabel.setStepLabelContent('6-54.点击回港')
          map.exercise.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('6-55.等待home')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener(), {
            { 'EXERCISE_BATTLE_PAGE2', 'missionsGroup', map.exercise.isBattlePage, 2000 },
            { 'EXERCISE_BATTLE_PAGE2', 'missionsGroup', map.exercise.isExercisePage, 2000 },
          })))
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
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_INIT') then

          state.campaign.quickSupplyCount = 0
          state.campaign.quickRepairCount = 0
          state.campaign.battleNum = 1
          state.campaign.HPIsSafe = true

          stepLabel.setStepLabelContent('7-2.点击出征')
          map.home.clickBattleBtn()
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome, 2000 },
            { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('7-3.点击战役')
          map.campaign.clickCampaignBtn()
          stepLabel.setStepLabelContent('7-4.等待战役页面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_INIT', 'missionsGroup', map.home.isHome },
            { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage, 2000 },
            { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_CAMPAIGN_PAGE') then

          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('7-5.移动到战役' .. settings.campaignChapter)
          map.campaign.moveToCampaignMission(settings.campaignChapter)
          stepLabel.setStepLabelContent('7-6.点击战役')
          map.campaign.clickCampainReadyBtn(settings.campaignDifficulty)
          stepLabel.setStepLabelContent('7-7.等待战役准备界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_BATTLE_PAGE', 'missionsGroup', map.campaign.isBattlePage, 2000 },
            { 'CAMPAIGN_CAMPAIGN_PAGE', 'missionsGroup', map.campaign.isCampaignPage, 2000 },
            { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE') then

          if ((state.campaign.quickSupplyCount <= 0) and (state.campaign.quickRepairCount <= 0)) then
            stepLabel.setStepLabelContent('7-10.检测所有状态')
            c.yield(sleepPromise(1000))
            local res = map.campaign.isReadyBattlePageShipStatusAllRignt()
            if (not res) then
              stepLabel.setStepLabelContent('7-11.状态不正常')
              map.campaign.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('7-12.等待快速补给界面')
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
                { 'CAMPAIGN_QUICK_SUPPLY_MODAL', 'missionsGroup', map.campaign.isQuickSupplyModal },
              })))
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
                local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                  { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
                  { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal },
                })))
                return makeAction(newstateTypes), state
              else
                stepLabel.setStepLabelContent('7-17.血量不安全，返回')
                return { type = 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
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
              return { type = 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
            end
          end

        elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('7-22.快速补给界面点击确定')
          map.campaign.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('7-23.等待出征准备界面')
          state.campaign.quickSupplyCount = state.campaign.quickSupplyCount + 1
          if (state.campaign.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_SUPPLY_MODAL', 'missionsGroup', map.campaign.isQuickSupplyModal, 2000 },
            })))
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
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickSupplyModal, 2000 },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL') then

          if (settings.campaignQuickRepair == 3) then
            stepLabel.setStepLabelContent('7-27.点击快速修理确定')
            map.campaign.clickQuickRepairModalOkBtn()
            state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
            stepLabel.setStepLabelContent('7-28.等待出征准备界面')
            if (state.campaign.quickRepairCount < 3) then
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal, 2000 },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('7-29.快速修理数量不足')
              return { type = 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE' }, state
            end

          elseif (settings.campaignQuickRepair == 2) then
            -- 中破或大破快修
            stepLabel.setStepLabelContent('7-30.寻找中破或大破的船')
            c.yield(sleepPromise(500))
            local res = map.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
            if (#res > 0) then
              stepLabel.setStepLabelContent('7-31.中破或大破:' .. table.concat(res, ','))
              map.campaign.clickQuickRepairModalSingleShip(res[1])
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal, 500 },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('7-32.修理完成')
              state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
              })))
              return makeAction(newstateTypes), state
            end

          elseif (settings.campaignQuickRepair == 1) then
            -- 大破快修
            stepLabel.setStepLabelContent('7-33.寻找大破的船')
            c.yield(sleepPromise(500))
            local res = map.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
            if (#res > 0) then
              stepLabel.setStepLabelContent('7-34.大破:' .. table.concat(res, ','))
              map.campaign.clickQuickRepairModalSingleShip(res[1])
              c.yield(sleepPromise(500))
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isQuickRepairModal },
              })))
              return makeAction(newstateTypes), state
            else
              stepLabel.setStepLabelContent('7-35.修理完成')
              state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
              local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
                { 'CAMPAIGN_READY_BATTLE_PAGE', 'missionsGroup', map.campaign.isReadyBattlePage },
                { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal },
              })))
              return makeAction(newstateTypes), state
            end
          end

        elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE') then

          stepLabel.setStepLabelContent('7-36.点击快速修理关闭')
          c.yield(sleepPromise(100))
          map.campaign.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', 'missionsGroup', map.campaign.isQuickRepairModal, 2000 },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL', 'missionsGroup', map.campaign.isReadyBattlePage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('7-37.出征准备界面出征开始')
          c.yield(sleepPromise(100))
          map.campaign.clickBattleStartBtn()
          -- 如果没有开始说明无法远征
          return { type = 'CAMPAIGN_GO_A_EXERCISE' }, state

        elseif (action.type == 'CAMPAIGN_GO_A_EXERCISE') then

          stepLabel.setStepLabelContent('7-38.等待出征准备界面，...')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.campaign.isReadyBattlePage, 3000 },
            { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage },
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_START_PAGE') then

          stepLabel.setStepLabelContent('7-39.开始面板，点击开始')
          c.yield(sleepPromise(100))
          map.campaign.clickBattleStartModalStartBtn()
          stepLabel.setStepLabelContent('7-40.等待阵型面板，追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_GO_A_EXERCISE', 'missionsGroup', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage, 2000 },
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('7-41.阵型面板')
          c.yield(sleepPromise(100))
          map.campaign.clickFormationPageStartBtn(settings.exerciseFormation)
          stepLabel.setStepLabelContent('7-38.等待追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_START_PAGE', 'missionsGroup', map.campaign.isBattleStartPage },
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage, 2000 },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_PURSUE_MODAL') then

          stepLabel.setStepLabelContent('7-42.追击面板')
          c.yield(sleepPromise(100))
          if (settings.exercisePursue) then
            stepLabel.setStepLabelContent('7-43.追击')
            map.campaign.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('7-44.放弃追击')
            map.campaign.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('7-45.等待胜利界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal, 2000 },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_VICTORY_PAGE') then

          stepLabel.setStepLabelContent('7-46.点击胜利继续')
          map.campaign.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('7-47.等待胜利继续界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_FORMATION_PAGE', 'missionsGroup', map.campaign.isFormationPage },
            { 'CAMPAIGN_PURSUE_MODAL', 'missionsGroup', map.campaign.isPursueModal },
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage, 2000 },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2 },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('7-48.点击胜利继续')
          map.campaign.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('7-46.等待演习界面')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_VICTORY_PAGE', 'missionsGroup', map.campaign.isVictoryPage },
            { 'CAMPAIGN_VICTORY_NEXT_PAGE', 'missionsGroup', map.campaign.isVictoryPage2, 2000 },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.campaign.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent("7-49.等待出征界面")
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.campaign.isReadyBattlePage, 2000 },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isBattlePage },
            { 'CAMPAIGN_BATTLE_PAGE2', 'missionsGroup', map.campaign.isCampaignPage },
          })))
          return makeAction(newstateTypes), state

        elseif (action.type == 'CAMPAIGN_BATTLE_PAGE2') then

          stepLabel.setStepLabelContent('7-50.点击回港')
          map.campaign.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('7-51.等待home')
          local newstateTypes = c.yield(setScreenListeners(mergeArr(getComListener(), getHomeListener())))
          return makeAction(newstateTypes), state
        end
        return nil, state
      end))
    end
    -- 战役

    return missions
  end,
  next = function(action, state)
    state = assign(stateTree, state)
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
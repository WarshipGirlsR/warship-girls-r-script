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

local setScreenListeners = function(theArr, needClearListener)
  needClearListener = needClearListener or true
  if (type(theArr) ~= 'table') then
    return Promise.resolve({})
  end

  return co(c.create(function()
    local newArr = {}
    local tags = {}
    local done = false
    for key, value in ipairs(theArr) do
      if (type(value[2]) == 'table') then
        for _, tag in ipairs(value[2]) do
          table.insert(tags, tag)
        end
      else
        table.insert(tags, value[2])
      end

      if ((type(value[4]) == 'number') and (value[4] > 0)) then
        table.insert(newArr, co(c.create(function()
          c.yield(sleepPromise(value[4]))
          if (not done) then
            return c.yield(setScreenListenerPromise(value[1], value[2], value[3]))
          end
          return
        end)))
      else
        table.insert(newArr, co(c.create(function()
          local res = c.yield(setScreenListenerPromise(value[1], value[2], value[3]))
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
  battle = {},
  expeditionReward = {
    enableChapter = {},
  },
  expedition = {
    expeditionFleetToChapter = {},
  },
  repair = {
    slot = nil,
  },
  exercise = {},
}

return {
  init = function(map, stepLabel, settings)
    missions.home = function(action, state)
      return co(c.create(function()
        if (action.type == 'HOME_HOME') then
          return nil, state
        elseif (action.type == 'HOME_MEDAL_MODAL') then
          stepLabel.setStepLabelContent('4-15.勋章取消')
          map.home.clickMedalModalCancelBtn()

          local newstateTypes = c.yield(setScreenListeners({
            { 'HOME_MEDAL_MODAL', 'homeGroup', map.home.isMedalModal, 2000 },
            { 'HOME_HOME', 'homeGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'HOME_RETURN_TO_HOME') then

          local newstateTypes = c.yield(setScreenListeners({
            { 'HOME_MEDAL_MODAL', 'homeGroup', map.home.isMedalModal, 2000 },
            { 'HOME_HOME', 'homeGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state
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

          stepLabel.setStepLabelContent('2-0.等待HOME')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_HOME_CLICK_BATTLE') then

          stepLabel.setStepLabelContent('1-2.点击出征')
          map.home.clickBattleBtn()
          stepLabel.setStepLabelContent('1-3.等待出征页面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.battle.isBattlePage },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('1-4.出征页面')
          stepLabel.setStepLabelContent('1-5.点击出征的出征按钮')
          c.yield(sleepPromise(500))
          map.battle.battle.clickBattleBtn()
          stepLabel.setStepLabelContent('1-6.等待出征的出征界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.battle.isBattlePage },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE') then

          local battleChapter
          if (#settings.battleChapter > 1) then
            battleChapter = table.remove(settings.battleChapter, 1)
            table.insert(settings.battleChapter, battleChapter)
          else
            battleChapter = settings.battleChapter[1]
          end
          stepLabel.setStepLabelContent('1-7.出征的出征页面')
          stepLabel.setStepLabelContent('1-8.移动到章节' .. battleChapter)
          c.yield(sleepPromise(300))
          map.battle.battle.moveToChapter(battleChapter)
          stepLabel.setStepLabelContent('1-9.进入章节')
          c.yield(sleepPromise(300))
          map.battle.battle.clickReadyBattleBtn()
          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('1-10.等待出征准备界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_HOME_CLICK_BATTLE', 'missionsGroup', map.home.isHome, 2000 },
            { 'BATTLE_BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.battle.isBattlePage, 2000 },
            { 'BATTLE_BATTLE_PAGE', 'missionsGroup', map.battle.isBattlePage, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.battle.isReadyBattlePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE') then

          if ((state.battle.quickSupplyCount <= 0) and (state.battle.quickRepairCount <= 0)) then
            -- 还没快速补给，还没维修
            stepLabel.setStepLabelContent('1-11.选择舰队:' .. settings.battleFleet)
            map.battle.battle.selectFleet(settings.battleFleet)
            stepLabel.setStepLabelContent('1-12.检测所有状态正常')
            c.yield(sleepPromise(500))
            local res = map.battle.battle.isReadyBattlePageShipStatusAllRignt()
            if (res) then
              state.battle.quickSupplyCount = 1
              state.battle.quickRepairCount = 1
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              map.battle.battle.clickReadyBattlePageQuickSupplyBtn()
              local newstateTypes = c.yield(setScreenListeners({
                { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.battle.isReadyBattlePage, 2000 },
                { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.battle.isQuickSupplyModal },
              }))
              return { type = newstateTypes }, state
            end
          elseif (state.battle.quickRepairCount <= 0) then
            -- 已经快速补给，还没维修
            stepLabel.setStepLabelContent('1-19.检测血量是否安全')
            c.yield(sleepPromise(500))
            local res = map.battle.battle.isReadyBattlePageShipHPSafe()
            if (res) then
              state.battle.quickRepairCount = 1
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.battleQuickRepair) then
                map.battle.battle.clickQuickRepairBtn()
                return { type = 'BATTLE_QUICK_REPAIR_MODAL' }, state
              else
                state.battle.quickRepairCount = 1
                return { type = 'BATTLE_READY_BATTLE_PAGE' }, state
              end
            end
          else
            -- 已经快速补给，已经维修
            stepLabel.setStepLabelContent('1-27.再次检测血量是否安全')
            c.yield(sleepPromise(500))
            local res = map.battle.battle.isReadyBattlePageShipHPSafe()
            if (res) then
              stepLabel.setStepLabelContent('1-29.血量安全，继续')
              return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('1-28.血量不安全，返回')
              return { type = 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
            end
          end


        elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('1-14.快速补给界面')
          stepLabel.setStepLabelContent('1-15.快速补给界面点击确定')
          map.battle.battle.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('1-16.等待出征准备界面')
          state.battle.quickSupplyCount = state.battle.quickSupplyCount + 1
          if (state.battle.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners({
              { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.battle.isQuickSupplyModal, 2000 },
            }))
            return { type = newstateTypes }, state
          else
            stepLabel.setStepLabelContent('1-17.资源数量不足')
            return { type = 'BATTLE_QUICK_SUPPLY_MODAL_FAIL' }, state
          end

        elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL_FAIL') then

          stepLabel.setStepLabelContent('1-18.点击快速补给关闭')
          c.yield(sleepPromise(100))
          map.battle.battle.clickQuickSupplyModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_QUICK_SUPPLY_MODAL_FAIL', 'missionsGroup', map.battle.battle.isQuickSupplyModal, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.battle.isReadyBattlePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL') then

          stepLabel.setStepLabelContent('1-23.点击快速修理确定')
          map.battle.battle.clickQuickRepairModalOkBtn()
          state.battle.quickRepairCount = state.battle.quickRepairCount + 1
          stepLabel.setStepLabelContent('1-24.等待出征准备界面')
          if (state.battle.quickRepairCount < 3) then
            local newstateTypes = c.yield(setScreenListeners({
              { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.battle.battle.isQuickRepairModal, 2000 },
            }))
            return { type = newstateTypes }, state
          else
            stepLabel.setStepLabelContent('1-25.快修数量不足')
            return { type = 'BATTLE_QUICK_REPAIR_MODAL_FAIL' }, state
          end

        elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL') then

          stepLabel.setStepLabelContent('1-26.点击快速修理关闭')
          c.yield(sleepPromise(100))
          map.battle.battle.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_QUICK_REPAIR_MODAL_FAIL', 'missionsGroup', map.battle.battle.isQuickRepairModal, 2000 },
            { 'BATTLE_READY_BATTLE_PAGE', 'missionsGroup', map.battle.battle.isReadyBattlePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('1-30.检测舰队可以出征')
          c.yield(sleepPromise(500))
          local fleetCanBattle = map.battle.battle.isFleetsCanBattle()
          if (fleetCanBattle) then
            local newstateTypes = c.yield(setScreenListeners({
              { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', 'missionsGroup', map.battle.battle.isReadyBattlePage },
            }))
            return { type = newstateTypes }, state
          else
            local newstateTypes = c.yield(setScreenListeners({
              { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.battle.isReadyBattlePage },
            }))
            return { type = newstateTypes }, state
          end

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('1-31.出征准备界面')
          stepLabel.setStepLabelContent('1-32.点击出征开始')
          c.yield(sleepPromise(100))
          map.battle.battle.clickBattleStartBtn()
          return { type = 'BATTLE_GO_A_BATTLE' }, state

        elseif (action.type == 'BATTLE_GO_A_BATTLE') then

          if (state.battle.battleNum < settings.battleMaxBattleNum) then
            stepLabel.setStepLabelContent('1-33.第' .. state.battle.battleNum .. '战开始')
          else
            stepLabel.setStepLabelContent('1-34.第' .. state.battle.battleNum .. '战Boss战开始')
          end
          stepLabel.setStepLabelContent('1-35.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.battle.battle.isExtraReceiveModal },
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.battle.isBattleStartPage },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.battle.isBattleStartPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            -- { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.battle.isNewShipPageLockModal },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_EXTRA_RECEIVE_MODAL') then

          stepLabel.setStepLabelContent('1-36.额外获得面板，点击确定')
          map.battle.battle.clickExtraReceiveModalOk()
          state.battle.battleNum = state.battle.battleNum + 1
          stepLabel.setStepLabelContent('1-37.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_EXTRA_RECEIVE_MODAL', 'missionsGroup', map.battle.battle.isExtraReceiveModal, 2000 },
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.battle.isBattleStartPage },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.battle.isFormationPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_BATTLE_START_PAGE') then

          stepLabel.setStepLabelContent('1-38.开始面板，点击开始')
          c.yield(sleepPromise(100))
          map.battle.battle.clickBattleStartModalStartBtn()
          stepLabel.setStepLabelContent('1-39.等待阵型面板，追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.battle.isBattleStartPage, 2000 },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.battle.isBattleStartPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('1-40.阵型面板')
          c.yield(sleepPromise(100))
          map.battle.battle.clickFormationPageStartBtn()
          stepLabel.setStepLabelContent('1-41.等待追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_BATTLE_START_PAGE', 'missionsGroup', map.battle.battle.isBattleStartPage },
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.battle.isBattleStartPage, 2000 },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_PURSUE_PAGE') then

          stepLabel.setStepLabelContent('1-58.追击面板')
          if ((settings.battlePursue and (state.battle.battleNum < settings.battleMaxBattleNum))
            or (settings.battlePursueBoss and (state.battle.battleNum == settings.battleMaxBattleNum))) then
            stepLabel.setStepLabelContent('1-59.追击')
            map.battle.battle.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('1-60.放弃追击')
            map.battle.battle.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('1-61.等待胜利界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_FORMATION_PAGE', 'missionsGroup', map.battle.battle.isBattleStartPage },
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.battle.isPursueModal, 2000 },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_VICTORY_PAGE') then

          c.yield(sleepPromise(1000))
          stepLabel.setStepLabelContent('1-42.胜利界面检测HP是否安全')
          c.yield(sleepPromise(300))
          state.battle.HPIsSafe = map.battle.battle.isVictoryPageShipHPSafe()
          if (state.battle.HPIsSafe) then
            stepLabel.setStepLabelContent('1-43.HP安全')
          else
            stepLabel.setStepLabelContent('1-44.HP不安全')
          end
          c.yield(sleepPromise(200))
          stepLabel.setStepLabelContent('1-45.点击胜利继续')
          c.yield(sleepPromise(200))
          map.battle.battle.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('1-46.等待胜利继续界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_PURSUE_PAGE', 'missionsGroup', map.battle.battle.isPursueModal },
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage, 2000 },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('1-62.点击胜利继续')
          map.battle.battle.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('1-63.等待大破警告，新船，下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_VICTORY_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage },
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage2, 2000 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_SHIP_SERVER_DAMAGE_MODAL') then

          stepLabel.setStepLabelContent('1-47.大破警告框点击返回')
          map.battle.battle.clickShipSevereDamageModalBack()
          stepLabel.setStepLabelContent('1-48.等待新船，下回合窗口，勋章对话框，home')
          state.battle.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_VICTORY_NEXT_PAGE', 'missionsGroup', map.battle.battle.isVictoryPage2 },
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal, 2000 },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_SHIP_CANT_GO_ON_MODAL') then

          stepLabel.setStepLabelContent('1-49.无法前进警告框点击返回')
          map.battle.battle.clickShipCantGoOnModalBackBtn()
          stepLabel.setStepLabelContent('1-50.等待新船，下回合窗口，勋章对话框，home')
          state.battle.HPIsSafe = false
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_NEW_SHIP_PAGE') then

          stepLabel.setStepLabelContent('1-51.获取新船')
          c.yield(sleepPromise(500))
          map.battle.battle.clickNewShip()
          stepLabel.setStepLabelContent('1-52.等待新船锁定窗口，下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage, 2000 },
            { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.battle.isNewShipPageLockModal },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('1-53.新船锁定窗口点击确认')
          map.battle.battle.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('1-54.等待下回合窗口，勋章对话框，home')
          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', 'missionsGroup', map.battle.battle.isShipSevereDamageModal },
            { 'BATTLE_SHIP_CANT_GO_ON_MODAL', 'missionsGroup', map.battle.battle.isShipCantGoOnModal },
            { 'BATTLE_NEW_SHIP_PAGE', 'missionsGroup', map.battle.battle.isNewShipPage },
            { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.battle.battle.isNewShipPageLockModal, 2000 },
            { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_NEXT_LEVEL_STEP_MODAL') then

          if ((state.battle.battleNum < settings.battleMaxBattleNum) and state.battle.HPIsSafe) then
            stepLabel.setStepLabelContent('1-55.点击继续下一关')
            map.battle.battle.clickLevelStepModalContinueBtn()
            state.battle.battleNum = state.battle.battleNum + 1
            return { type = 'BATTLE_GO_A_BATTLE' }, state
          else
            stepLabel.setStepLabelContent('1-56.点击回港')
            map.battle.battle.clickLevelStepModalBackBtn()
            stepLabel.setStepLabelContent('1-57.等待主界面')
            local newstateTypes = c.yield(setScreenListeners({
              { 'HOME_HOME', 'missionsGroup', map.home.isHome },
              { 'BATTLE_NEXT_LEVEL_STEP_MODAL', 'missionsGroup', map.battle.battle.isNextLevelStepModal, 2000 },
            }))
            return { type = newstateTypes }, state
          end

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CANT_GO') then

          local newstateTypes = c.yield(setScreenListeners({
            { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.battle.battle.isReadyBattlePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.battle.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('1-66.等待勋章对话框，主界面')
          return nil, state
        end

        return nil, state
      end))
    end


    -- 领取任务奖励
    missions.mission = function(action, state)
      return co(c.create(function()
        if (action.type == 'MISSION_START') then

          stepLabel.setStepLabelContent('2-0.等待HOME')
          local newstateTypes = c.yield(setScreenListeners({
            { 'MISSION_IS_UNRECEIVED_MISSION', 'missionsGroup', map.home.isHome },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then

          stepLabel.setStepLabelContent('2-1.检测是否有任务奖励')
          c.yield(sleepPromise(100))
          local res = map.mission.isUnreceivedMission()
          if (res) then
            return { type = 'MISSION_INIT' }, state
          end
          stepLabel.setStepLabelContent('2-2.没有任务奖励')
          return { type = 'HOME_HOME' }, state

        elseif (action.type == 'MISSION_INIT') then

          stepLabel.setStepLabelContent('2-3.点击任务按钮')
          map.mission.clickMission()
          stepLabel.setStepLabelContent('2-4.等待任务界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'HOME_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_PAGE') then

          stepLabel.setStepLabelContent('2-5.点击全部任务')
          map.missionClickAllMission()
          stepLabel.setStepLabelContent('2-6.等待任务全部任务界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'HOME_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_PAGE', 'missionsGroup', map.mission.isMission, 2000 },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_IS_MISSION_ALL_MISSION') then

          c.yield(sleepPromise(100))
          local res = map.mission.isMissionUnreceivedReward()
          if (not res) then
            stepLabel.setStepLabelContent('2-7.没有任务奖励')
            return { type = 'MISSION_PAGE_NO_REWAR' }, state
          else
            stepLabel.setStepLabelContent('2-8.有任务奖励')
            map.mission.clickGetFirstReward()
            stepLabel.setStepLabelContent('2-9.等待获得面板')

            local newstateTypes = c.yield(setScreenListeners({
              { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
              { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel },
            }))

            return { type = newstateTypes }, state
          end

        elseif (action.type == 'MISSION_REWAR_PANNEL') then

          stepLabel.setStepLabelContent('2-10.点击确定')
          map.mission.clickRewardPannelOk()
          stepLabel.setStepLabelContent('2-11.等待新船，任务全部任务')

          local newstateTypes = c.yield(setScreenListeners({
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
            { 'HOME_HOME', 'missionsGroup', map.home.isHome, 2000 },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_IS_NEW_SHIP') then

          stepLabel.setStepLabelContent('2-12.点击新船')
          map.mission.clickNewShip()
          stepLabel.setStepLabelContent('2-13.等待新船锁定，任务全部任务')

          local newstateTypes = c.yield(setScreenListeners({
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission, 2000 },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
            { 'HOME_HOME', 'missionsGroup', map.home.isHome, 2000 },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL') then

          stepLabel.setStepLabelContent('2-14.点击新船')
          map.mission.clickNewShipPageLockModalOkBtn()
          stepLabel.setStepLabelContent('2-15.等待任务全部任务')

          local newstateTypes = c.yield(setScreenListeners({
            { 'MISSION_IS_NEW_SHIP', 'missionsGroup', map.mission.isNewShipPage },
            { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', 'missionsGroup', map.mission.isNewShipPageLockModal },
            { 'MISSION_IS_MISSION_ALL_MISSION', 'missionsGroup', map.mission.isMissionAllMission },
            { 'MISSION_REWAR_PANNEL', 'missionsGroup', map.mission.isRewardPannel, 2000 },
            { 'HOME_HOME', 'missionsGroup', map.home.isHome, 2000 },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'MISSION_PAGE_NO_REWAR') then

          stepLabel.setStepLabelContent('2-16.等待返回home')
          map.mission.clickBackToHome()

          local newstateTypes = c.yield(setScreenListeners({
            { 'MISSION_PAGE_NO_REWAR', 'missionsGroup', map.mission.isMission, 2000 },
            { 'HOME_HOME', 'missionsGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state
        end

        return nil
      end))
    end

    -- 远征回收
    missions.expeditionReward = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXPEDITION_REWARD_START') then

          stepLabel.setStepLabelContent('3-0.等待HOME')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_REWARD_INIT', 'missionsGroup', map.home.isHome },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_REWARD_INIT') then
          if (type(settings.enableChapter) ~= 'table') then
            settings.enableChapter = { 1, 2, 3, 4, 5, 6, 7 }
          elseif (#settings.enableChapter < 1) then
            stepLabel.setStepLabelContent('3-1.没有远征任务！')
            return { type = 'HOME_HOME' }, state
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

          stepLabel.setStepLabelContent('3-3.检测是否有远征奖励')
          c.yield(sleepPromise(100))
          local res = map.expedition.isExpeditionCompleted()
          if (not res) then
            stepLabel.setStepLabelContent('3-4.没有远征奖励和任务')
            return { type = 'HOME_HOME' }, state
          end
          stepLabel.setStepLabelContent('3-5.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('3-6.等待出征界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattle, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_REWARD_IS_BATTLE') then

          stepLabel.setStepLabelContent('3-7.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('3-8.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER', 'missionsGroup', map.expedition.isBattleExpedition },
            { 'EXPEDITION_REWARD_HOME', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattle, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER') then

          if (#state.expeditionReward.enableChapter > 0) then
            local chapter = state.expeditionReward.enableChapter[1]
            stepLabel.setStepLabelContent('3-9.移动到第' .. chapter .. '章')
            map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
            state.expedition.lastChapter = chapter
            stepLabel.setStepLabelContent('3-10.检测本页有可收获奖励')
            return { type = 'EXPEDITION_REWARD_CHECK_HAS_REWARD' }, state
          else
            return { type = 'EXPEDITION_REWARD_RETURN_TO_HOME' }, state
          end

        elseif (action.type == 'EXPEDITION_REWARD_CHECK_HAS_REWARD') then

          local res, list = map.expedition.isThisExpeditionPageHasReward()
          if (res) then
            local v = list[1]
            stepLabel.setStepLabelContent('3-11.点击第' .. v .. '节')
            map.expedition.clickExpeditionBtn(v)
            stepLabel.setStepLabelContent('3-12.等待远征完成页面')

            local newstateTypes = c.yield(setScreenListeners({
              { 'EXPEDITION_REWARD_IS_BATTLE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
              { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage },
            }))
            return { type = newstateTypes }, state
          end

          stepLabel.setStepLabelContent('3-13.本页没有可收获的奖励')
          table.remove(state.expeditionReward.enableChapter, 1)
          return { type = 'EXPEDITION_REWARD_EXPEDITION_SELECT_CHAPTER' }, state

        elseif (action.type == 'EXPEDITION_REWARD_COMPLETED_PAGE') then

          map.expedition.clickRewardPannelOk()
          stepLabel.setStepLabelContent('3-14.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_REWARD_COMPLETED_PAGE', 'missionsGroup', map.expedition.isExpeditionCompletedPage, 2000 },
            { 'EXPEDITION_REWARD_CHECK_HAS_REWARD', 'missionsGroup', map.expedition.isBattleExpedition },
          }))
          return { type = newstateTypes }, state
        end

        return nil
      end))
    end

    -- 远征回收


    -- 远征派遣舰队
    missions.expeditionOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXPEDITION_ONCE_START') then

          stepLabel.setStepLabelContent('3-0.等待HOME')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_INIT', 'missionsGroup', map.home.isHome },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_INIT') then
          stepLabel.setStepLabelContent('3-15.准备远征派遣舰队')
          -- 准备开始远征派遣舰队任务
          if (type(settings.expeditionFleetToChapter) ~= 'table') then
            state.expedition.expeditionFleetToChapter = { false, false, false, false }
          end

          if ((not settings.expeditionFleetToChapter[1])
            and (not settings.expeditionFleetToChapter[2])
            and (not settings.expeditionFleetToChapter[3])
            and (not settings.expeditionFleetToChapter[4])) then
            stepLabel.setStepLabelContent('3-16.没有远征任务！')
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


          stepLabel.setStepLabelContent('3-17.点击出征')
          map.expedition.clickBattle()
          stepLabel.setStepLabelContent('3-18.等待出征界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattle },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then
          -- 进入出征大页面
          stepLabel.setStepLabelContent('3-19.点击远征')
          map.expedition.clickExpedition()
          stepLabel.setStepLabelContent('3-20.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_ONCE_START', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXPEDITION_IS_BATTLE_PAGE', 'missionsGroup', map.expedition.isBattle, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_IS_EXPEDITION_PAGE') then
          -- 进入远征页面
          if (#state.expedition.expeditionFleetToChapter > 0) then
            state.expedition.quickSupplyChecked = nil
            state.expedition.quickRepairChecked = nil

            state.expedition.fleet, state.expedition.chapters = table.unpack(state.expedition.expeditionFleetToChapter[1])

            local chapter, section = table.unpack(strSplit(state.expedition.chapters, '-'))
            if (state.expedition.lastChapter ~= chapter) then
              stepLabel.setStepLabelContent('3-21.移动到第' .. chapter .. '章')
              map.expedition.moveToChapter(chapter, state.expedition.lastChapter)
              state.expedition.lastChapter = chapter
              c.yield(sleepPromise(300))
            end
            stepLabel.setStepLabelContent('3-22.检测第' .. section .. '节能否远征')
            c.yield(sleepPromise(200))
            local res = map.expedition.isChapterCanExpedition(section)
            if (res) then
              stepLabel.setStepLabelContent('3-23.点击按钮' .. section)
              map.expedition.clickExpeditionBtn(section)
              stepLabel.setStepLabelContent('3-24.等待远征准备界面')

              local newstateTypes = c.yield(setScreenListeners({
                { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition, 2000 },
                { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare },
              }))
              return { type = newstateTypes }, state
            else
              stepLabel.setStepLabelContent('3-25.本章不能远征')
              -- 执行下一个章节
              table.remove(state.expedition.expeditionFleetToChapter, 1)
              return { type = 'EXPEDITION_IS_EXPEDITION_PAGE' }, state
            end
          else
            stepLabel.setStepLabelContent('3-26.没有远征')
            return { type = 'EXPEDITION_RETURN_TO_HOME' }, state
          end

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE') then
          -- 远征准备界面，进行状态是否最佳的检测，然后进行补给和维修
          stepLabel.setStepLabelContent('3-27.选择舰队' .. state.expedition.fleet)
          map.expedition.clickSelectFleet(state.expedition.fleet)
          stepLabel.setStepLabelContent('3-28.检测所有状态正常')
          c.yield(sleepPromise(300))
          -- 检测舰队是否在最佳状态
          local res = map.expedition.isReadyExpeditionShipStatus()
          if (not res) then
            -- 舰队不是最佳状态
            stepLabel.setStepLabelContent('3-29.状态不正常')

            if (not state.expedition.quickSupplyChecked) then
              -- 快速补给
              map.expedition.clickQuickSupply()
              stepLabel.setStepLabelContent('3-30.等待快速补给界面')

              local newstateTypes = c.yield(setScreenListeners({
                { 'EXPEDITION_QUICK_SUPPLY_PAGE', 'missionsGroup', map.expedition.isQuickSupply },
                { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare, 2000 },
              }))

              return { type = newstateTypes }, state

            elseif (not state.expedition.quickRepairChecked) then
              -- 快速修理
              if (settings.expeditionQuickRepair) then
                map.expedition.clickQuickRepair()
                stepLabel.setStepLabelContent('3-31.等待快速修理界面')

                local newstateTypes = c.yield(setScreenListeners({
                  { 'EXPEDITION_QUICK_REPAIR_PAGE', 'missionsGroup', map.expedition.isQuickRepair },
                  { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare, 2000 },
                }))

                return { type = newstateTypes }, state
              end
            end

            -- 快速补给和修理都完成了，还不是最佳状态，则跳转到能否出征检测
            return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO' }, state
          end

          -- 舰队是最佳状态，跳转到能否出征检测
          return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO' }, state

        elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_PAGE') then
          -- 快速补给界面
          map.expedition.clickQuickSupplyDo()
          stepLabel.setStepLabelContent('3-32.等待远征准备界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_QUICK_SUPPLY_PAGE', 'missionsGroup', map.expedition.isQuickSupply, 2000 },
            { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare },
          }))

          -- 页面没有停留在本页说明快速补给完成
          if (newstateTypes ~= 'EXPEDITION_QUICK_SUPPLY_PAGE') then
            state.expedition.quickSupplyChecked = true
          end

          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_QUICK_REPAIR_PAGE') then
          -- 快速修理界面
          map.expedition.clickQuickRepairDo()
          stepLabel.setStepLabelContent('3-33.等待远征准备界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_QUICK_REPAIR_PAGE', 'missionsGroup', map.expedition.isQuickRepair, 2000 },
            { 'EXPEDITION_BATTLE_PREPARE_PAGE', 'missionsGroup', map.expedition.isExpeditionPrepare },
          }))

          -- 页面没有停留在本页说明快速修理完成
          if (newstateTypes ~= 'EXPEDITION_QUICK_REPAIR_PAGE') then
            state.expedition.quickRepairChecked = true
          end

          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO') then
          -- 检测舰队是否可以远征
          stepLabel.setStepLabelContent('3-34.检测舰队可以远征')
          c.yield(sleepPromise(500))
          local fleetCanExpedition = map.expedition.isCanExpedition()
          if (not fleetCanExpedition) then
            return { type = 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO' }, state
          else
            stepLabel.setStepLabelContent('3-35.点击远征开始')
            map.expedition.clickBattleStart()
          end
          stepLabel.setStepLabelContent('3-36.等待远征界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_BATTLE_PREPARE_PAGE_CAN_GO', 'missionsGroup', map.expedition.isExpeditionPrepare, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO') then
          -- 舰队不能远征，准备返回远征页
          stepLabel.setStepLabelContent('3-37.点击返回远征界面')
          map.expedition.clickBackToExpedition()

          local newstateTypes = c.yield(setScreenListeners({
            { 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO', 'missionsGroup', map.expedition.isExpeditionPrepare, 2000 },
            { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
          }))

          -- 如果离开这一页，则从远征队列里退出一个队伍
          if (newstateTypes ~= 'EXPEDITION_BATTLE_PREPARE_PAGE_CANT_GO') then
            table.remove(state.expedition.expeditionFleetToChapter, 1)
          end

          return { type = newstateTypes }, state

        elseif (action.type == 'EXPEDITION_RETURN_TO_HOME') then

          stepLabel.setStepLabelContent('3-38.返回港口')
          map.expedition.clickBackToHome()

          return { type = 'HOME_HOME' }, state
        end
      end))
    end
    -- 远征派遣

    -- 修理
    missions.repairOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'REPAIR_ONCE_START') then

          stepLabel.setStepLabelContent('4-1.等待HOME')
          local newstateTypes = c.yield(setScreenListeners({
            { 'REPAIR_INIT', 'missionsGroup', map.home.isHome },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'REPAIR_INIT') then
          state.repair.slot = nil

          stepLabel.setStepLabelContent('4-2.点击出征')
          c.yield(sleepPromise(100))
          map.repair.clickDockBtn()
          stepLabel.setStepLabelContent('4-3.等待船坞界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage },
            { 'HOME_MEDAL_MODAL', 'missionsGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'missionsGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'REPAIR_DOCK_PAGE') then

          stepLabel.setStepLabelContent('4-4.点击修理按钮')
          c.yield(sleepPromise(100))
          map.repair.clickRepairBtn()
          stepLabel.setStepLabelContent('4-5.等待修理界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage },
            { 'HOME_MEDAL_MODAL', 'missionsGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'missionsGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'REPAIR_REPAIR_PAGE') then

          stepLabel.setStepLabelContent('4-6.检测空闲槽位')
          c.yield(sleepPromise(500))
          local res, hasList = map.repair.hasEmptyRepairSlot()
          if (res) then
            state.repair.slot = hasList[1]
            stepLabel.setStepLabelContent('4-7.有空闲槽位')
            stepLabel.setStepLabelContent('4-8.点击第' .. state.repair.slot .. '个空闲槽位')
            c.yield(sleepPromise(100))
            map.repair.clickRepairSlotBtn(state.repair.slot)
            c.yield(sleepPromise(100))
            stepLabel.setStepLabelContent('4-9.检测修理界面，选船界面')

            -- 如果一没进入修船选船页面说明没有需要维修的船
            local newstateTypes = c.yield(setScreenListeners({
              { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage },
              { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
              { 'HOME_MEDAL_MODAL', 'missionsGroup', map.home.isMedalModal },
              { 'HOME_HOME', 'missionsGroup', map.home.isHome },
            }))

            if (newstateTypes == 'REPAIR_REPAIR_FINISH') then
              stepLabel.setStepLabelContent('4-9.没有船需要维修')
            end

            return { type = newstateTypes }, state
          else
            stepLabel.setStepLabelContent('4-10.没有空位')

            local newstateTypes = c.yield(setScreenListeners({
              { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
              { 'HOME_MEDAL_MODAL', 'missionsGroup', map.home.isMedalModal },
              { 'HOME_HOME', 'missionsGroup', map.home.isHome },
            }))
            return { type = newstateTypes }, state
          end

        elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then

          stepLabel.setStepLabelContent('4-11.选择第一个船')
          c.yield(sleepPromise(200))
          map.repair.clickFirstShip()
          stepLabel.setStepLabelContent('4-12.等待返回修理界面')

          local newstateTypes = c.yield(setScreenListeners({
            { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
            { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
            { 'HOME_MEDAL_MODAL', 'missionsGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'missionsGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then

          stepLabel.setStepLabelContent('4-13.等待第' .. state.repair.slot .. '个槽位变成修理状态')

          local newstateTypes = c.yield(setScreenListeners({
            { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isSlotNotEmpty(state.repair.slot) },
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
            { 'HOME_MEDAL_MODAL', 'missionsGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'missionsGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state

        elseif (action.type == 'REPAIR_REPAIR_FINISH') then

          stepLabel.setStepLabelContent('4-14.完成维修')
          map.repair.clickBackToHomeBtn()

          local newstateTypes = c.yield(setScreenListeners({
            { 'HOME_MEDAL_MODAL', 'missionsGroup', map.home.isMedalModal },
            { 'HOME_HOME', 'missionsGroup', map.home.isHome },
          }))

          return { type = newstateTypes }, state
        end

        return nil, state
      end))
    end
    -- 修理
    missions.exerciseOnce = function(action, state)
      return co(c.create(function()
        if (action.type == 'EXERCISE_START') then
          stepLabel.setStepLabelContent('5-1.等待home')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_INIT') then

          state.exercise.quickSupplyCount = 0
          state.exercise.quickRepairCount = 0
          state.exercise.battleNum = 1
          state.exercise.HPIsSafe = true

          stepLabel.setStepLabelContent('5-2.点击出征')
          map.home.clickBattleBtn()
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome, 2000 },
            { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage },
            { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_BATTLE_PAGE') then

          stepLabel.setStepLabelContent('5-3.点击演习')
          map.exercise.clickExerciseBtn()
          stepLabel.setStepLabelContent('5-4.等待演习页面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_INIT', 'missionsGroup', map.home.isHome },
            { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage, 2000 },
            { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_EXERCISE_PAGE') then

          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('5-5.寻找演习对手')
          local res, exeList = map.exercise.isExercisePageHaveExercise()
          local nBtn = exeList[1]
          if (type(nBtn) ~= 'nil') then
            stepLabel.setStepLabelContent('5-6.发现演习对手' .. nBtn)
            map.exercise.clickToNExerciseBtn(nBtn)
            stepLabel.setStepLabelContent('5-7.等待出征准备界面')
            local newstateTypes = c.yield(setScreenListeners({
              { 'EXERCISE_BATTLE_PAGE', 'missionsGroup', map.exercise.isBattlePage },
              { 'EXERCISE_EXERCISE_PAGE', 'missionsGroup', map.exercise.isExercisePage, 2000 },
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
            }))
            return { type = newstateTypes }, state
          else
            stepLabel.setStepLabelContent('5-8.没有可以挑战的人')
            return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
          end

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE') then

          if ((state.exercise.quickSupplyCount <= 0) and (state.exercise.quickRepairCount <= 0)) then
            stepLabel.setStepLabelContent('5-9.选择舰队:' .. settings.exerciseFleet)
            map.exercise.selectFleet(settings.exerciseFleet)
            stepLabel.setStepLabelContent('5-10.检测所有状态')
            c.yield(sleepPromise(500))
            local res = map.exercise.isReadyBattlePageShipStatusAllRignt()
            if (not res) then
              stepLabel.setStepLabelContent('5-11.状态不正常')
              map.exercise.clickReadyBattlePageQuickSupplyBtn()
              stepLabel.setStepLabelContent('5-12.等待快速补给界面')
              local newstateTypes = c.yield(setScreenListeners({
                { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
                { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal },
              }))
              return { type = newstateTypes }, state
            else
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
            end
          elseif (state.exercise.quickRepairCount <= 0) then
            stepLabel.setStepLabelContent('5-13.检测血量是否安全')
            c.yield(sleepPromise(500))
            local res = map.exercise.isReadyBattlePageShipHPSafe()
            if (res) then
              stepLabel.setStepLabelContent('5-14.血量安全，继续')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
            else
              if (settings.exerciseQuickRepair) then
                stepLabel.setStepLabelContent('5-15.血量不安全，点击快修')
                map.exercise.clickQuickRepairBtn()
                stepLabel.setStepLabelContent('5-16.等待快修界面')
                local newstateTypes = c.yield(setScreenListeners({
                  { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
                  { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal },
                }))
                return { type = newstateTypes }, state
              else
                stepLabel.setStepLabelContent('5-17.血量不安全，返回')
                return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
              end
            end
          else
            stepLabel.setStepLabelContent('5-18.再次检测血量是否安全')
            c.yield(sleepPromise(500))
            local res = map.exercise.isReadyBattlePageShipHPSafe()
            if (res) then
              stepLabel.setStepLabelContent('5-19.血量安全，继续')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
            else
              stepLabel.setStepLabelContent('5-20.血量不安全，返回')
              return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
            end
          end

        elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL') then

          stepLabel.setStepLabelContent('5-22.快速补给界面点击确定')
          map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()
          stepLabel.setStepLabelContent('5-23.等待出征准备界面')
          state.exercise.quickSupplyCount = state.exercise.quickSupplyCount + 1
          if (state.exercise.quickSupplyCount < 3) then
            local newstateTypes = c.yield(setScreenListeners({
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_SUPPLY_MODAL', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
            }))
            return { type = newstateTypes }, state
          else
            stepLabel.setStepLabelContent('5-24.资源数量不足')
            return { type = 'EXERCISE_QUICK_SUPPLY_MODAL_FAIL' }, state
          end

        elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL_FAIL') then

          stepLabel.setStepLabelContent('5-25.点击快速补给关闭')
          c.yield(sleepPromise(100))
          map.exercise.clickQuickSupplyModalCloseBtn()
          stepLabel.setStepLabelContent('5-26.等待出征准备界面')
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_SUPPLY_MODAL_FAIL', 'missionsGroup', map.exercise.isQuickSupplyModal, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL') then

          stepLabel.setStepLabelContent('5-27.点击快速修理确定')
          map.exercise.clickQuickRepairModalOkBtn()
          state.exercise.quickRepairCount = state.exercise.quickRepairCount + 1
          stepLabel.setStepLabelContent('5-28.等待出征准备界面')
          if (state.exercise.quickRepairCount < 3) then
            local newstateTypes = c.yield(setScreenListeners({
              { 'EXERCISE_READY_BATTLE_PAGE', 'missionsGroup', map.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_REPAIR_MODAL', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
            }))
            return { type = newstateTypes }, state
          else
            stepLabel.setStepLabelContent('5-29.快速修理数量不足')
            return { type = 'EXERCISE_QUICK_REPAIR_MODAL_FAIL' }, state
          end

        elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL_FAIL') then

          stepLabel.setStepLabelContent('5-30.点击快速修理关闭')
          c.yield(sleepPromise(100))
          map.exercise.clickQuickRepairModalCloseBtn()
          c.yield(sleepPromise(300))
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_REPAIR_MODAL_FAIL', 'missionsGroup', map.exercise.isQuickRepairModal, 2000 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

          stepLabel.setStepLabelContent('5-31.检测舰队是否可以出征')
          c.yield(sleepPromise(300))
          local fleetCanBattle = map.exercise.isFleetsCanBattle()
          if (not fleetCanBattle) then
            stepLabel.setStepLabelContent('5-32.舰队无法战斗')
            return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }, state
          else
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }, state
          end

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CAN_GO') then

          stepLabel.setStepLabelContent('5-33.出征准备界面出征开始')
          c.yield(sleepPromise(100))
          map.exercise.clickBattleStartBtn()
          return { type = 'EXERCISE_GO_A_EXERCISE' }, state

        elseif (action.type == 'EXERCISE_GO_A_EXERCISE') then

          stepLabel.setStepLabelContent('5-34.等待出征准备界面，...')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_GO_A_EXERCISE', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_START_PAGE') then

          stepLabel.setStepLabelContent('5-35.开始面板，点击开始')
          c.yield(sleepPromise(100))
          map.exercise.clickBattleStartModalStartBtn()
          stepLabel.setStepLabelContent('5-36.等待阵型面板，追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_GO_A_EXERCISE', 'missionsGroup', map.exercise.isReadyBattlePage },
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage, 2000 },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_FORMATION_PAGE') then

          stepLabel.setStepLabelContent('5-37.阵型面板')
          c.yield(sleepPromise(100))
          map.exercise.clickFormationPageStartBtn()
          stepLabel.setStepLabelContent('5-38.等待追击面板，胜利界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_START_PAGE', 'missionsGroup', map.exercise.isBattleStartPage },
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage, 2000 },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_PURSUE_MODAL') then

          stepLabel.setStepLabelContent('5-39.追击面板')
          c.yield(sleepPromise(100))
          if (settings.exercisePursue) then
            stepLabel.setStepLabelContent('5-40.追击')
            map.exercise.clickPursueModalOk()
          else
            stepLabel.setStepLabelContent('5-41.放弃追击')
            map.exercise.clickPursuePageCancel()
          end
          stepLabel.setStepLabelContent('5-42.等待胜利界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal, 2000 },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_VICTORY_PAGE') then

          stepLabel.setStepLabelContent('5-43.点击胜利继续')
          map.exercise.clickVictoryPageContinueBtn()
          stepLabel.setStepLabelContent('5-44.等待胜利继续界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_FORMATION_PAGE', 'missionsGroup', map.exercise.isFormationPage },
            { 'EXERCISE_PURSUE_MODAL', 'missionsGroup', map.exercise.isPursueModal },
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage, 2000 },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2 },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_VICTORY_NEXT_PAGE') then

          stepLabel.setStepLabelContent('5-45.点击胜利继续')
          map.exercise.clickVictoryPageContinueBtn2()
          stepLabel.setStepLabelContent('5-46.等待演习界面')
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_VICTORY_PAGE', 'missionsGroup', map.exercise.isVictoryPage },
            { 'EXERCISE_VICTORY_NEXT_PAGE', 'missionsGroup', map.exercise.isVictoryPage2, 2000 },
            { 'EXERCISE_EXERCISE_PAGE2', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME') then

          map.exercise.clickReadyBattlePageBackBtn()
          stepLabel.setStepLabelContent("5-47.等待出征界面")
          local newstateTypes = c.yield(setScreenListeners({
            { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', 'missionsGroup', map.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_EXERCISE_PAGE2', 'missionsGroup', map.exercise.isExercisePage },
          }))
          return { type = newstateTypes }, state

        elseif (action.type == 'EXERCISE_EXERCISE_PAGE2') then

          stepLabel.setStepLabelContent('5-48.点击回港')
          map.exercise.clickBackToHomeBtn()
          stepLabel.setStepLabelContent('5-49.等待home')
          local newstateTypes = c.yield(setScreenListeners({
            { 'HOME_HOME', 'missionsGroup', map.home.isHome },
          }))
          return { type = newstateTypes }, state
        end
        return nil, state
      end))
    end

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
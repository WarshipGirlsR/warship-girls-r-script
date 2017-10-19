local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local allOptions = require 'GoMission__options'
local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener

local sendToPushBullet = require 'ajax__sentToPushBullet'


local battleOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'BATTLE_INIT') then

      state.battle.quickSupplyCount = 0
      state.battle.quickRepairCount = 0
      state.battle.quickRepairSingleLastShip = 0
      state.battle.quickRepairSingleCount = 0
      state.battle.HPIsSafe = true
      state.battle.battleNum = 1
      state.battle.cantBattle = true
      state.battle.battleRebootAt6_1AMeetCVFlag = false
      state.battle.passBattleStartPage = false
      -- 出征后就应该需要维修
      state.repair.nextRepairStartTime = os.time()


      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'BATTLE_START', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_START') then

      stepLabel.setStepLabelContent('2-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'BATTLE_HOME_CLICK_BATTLE', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_HOME_CLICK_BATTLE') then

      stepLabel.setStepLabelContent('2-2.点击出征')
      map.home.clickBattleBtn()
      stepLabel.setStepLabelContent('2-3.等待出征页面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_HOME_CLICK_BATTLE', map.home.isHome, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE', map.battle.isBattleBattlePage },
        { 'BATTLE_BATTLE_PAGE', map.battle.isBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_BATTLE_PAGE') then

      stepLabel.setStepLabelContent('2-5.出征页面点击出征的出征按钮')
      c.yield(sleepPromise(500))
      map.battle.clickBattleBtn()
      stepLabel.setStepLabelContent('2-6.等待出征的出征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_HOME_CLICK_BATTLE', map.home.isHome, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE', map.battle.isBattleBattlePage, 2000 },
        { 'BATTLE_BATTLE_PAGE', map.battle.isBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE') then

      stepLabel.setStepLabelContent('2-7.出征的出征页面')
      stepLabel.setStepLabelContent('2-8.移动到章节' .. settings.battleChapter)
      c.yield(sleepPromise(300))
      map.battle.moveToChapter(settings.battleChapter)

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_HOME_CLICK_BATTLE', map.home.isHome, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE_CLICK_CHAPTER', map.battle.isBattleBattlePage, 1000 },
        { 'BATTLE_BATTLE_PAGE', map.battle.isBattlePage, 3000 },
        { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE_CLICK_CHAPTER') then

      stepLabel.setStepLabelContent('2-9.进入章节')
      c.yield(sleepPromise(100))
      map.battle.clickReadyBattleBtn()
      c.yield(sleepPromise(100))
      stepLabel.setStepLabelContent('2-10.等待出征准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_HOME_CLICK_BATTLE', map.home.isHome, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE_CLICK_CHAPTER', map.battle.isBattleBattlePage, 1000 },
        { 'BATTLE_BATTLE_PAGE', map.battle.isBattlePage, 3000 },
        { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
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
          stepLabel.setStepLabelContent('2-15.等待快速补给界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage, 2000 },
            { 'BATTLE_QUICK_SUPPLY_MODAL', map.battle.isQuickSupplyModal },
          }))
          return makeAction(newstateTypes), state
        end
      elseif (state.battle.quickRepairCount <= 0) then
        -- 已经快速补给，还没维修
        stepLabel.setStepLabelContent('2-16.检测血量是否安全')
        c.yield(sleepPromise(1000))
        local res = map.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('2-17.血量安全')
          state.battle.quickRepairCount = 1
          return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
        else
          if (settings.battleQuickRepair > 0) then
            stepLabel.setStepLabelContent('2-18.血量不安全，快修')
            map.battle.clickQuickRepairBtn()

            state.battle.quickRepairSingleLastShip = 0
            state.battle.quickRepairSingleCount = 0

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage, 2000 },
              { 'BATTLE_QUICK_REPAIR_MODAL', map.battle.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          else
            stepLabel.setStepLabelContent('2-19.血量不安全')
            state.battle.quickRepairCount = 1
            return { type = 'BATTLE_READY_BATTLE_PAGE' }, state
          end
        end
      else
        -- 已经快速补给，已经维修
        stepLabel.setStepLabelContent('2-20.再次检测血量是否安全')
        c.yield(sleepPromise(500))
        -- 不允许大破出征
        local res = map.battle.isReadyBattlePageShipHPSafe(math.max(1, settings.battleQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('2-21.血量安全，继续')
          return { type = 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO' }, state
        else
          stepLabel.setStepLabelContent('2-22.血量不安全，返回')
          return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO'), state
        end
      end

    elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL') then

      stepLabel.setStepLabelContent('2-23.快速补给界面点击确定')
      map.battle.clickReadyBattlePageQuickSupplyModalOkBtn()
      stepLabel.setStepLabelContent('2-24.等待出征准备界面')
      state.battle.quickSupplyCount = state.battle.quickSupplyCount + 1
      if (state.battle.quickSupplyCount < 3) then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage, 1000 },
          { 'BATTLE_QUICK_SUPPLY_MODAL', map.battle.isQuickSupplyModal, 2000 },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('2-25.资源数量不足')
        return { type = 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE' }, state
      end

    elseif (action.type == 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('2-26.点击快速补给关闭')
      c.yield(sleepPromise(100))
      map.battle.clickQuickSupplyModalCloseBtn()
      c.yield(sleepPromise(300))
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_QUICK_SUPPLY_MODAL_CLOSE', map.battle.isQuickSupplyModal, 2000 },
        { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL') then

      if (settings.battleQuickRepair == 3) then
        -- 不满血则快修
        stepLabel.setStepLabelContent('2-27.点击快速修理确定')
        c.yield(sleepPromise(500))
        map.battle.clickQuickRepairModalOkBtn()
        state.battle.quickRepairCount = state.battle.quickRepairCount + 1
        stepLabel.setStepLabelContent('2-28.等待出征准备界面')
        if (state.battle.quickRepairCount < 3) then
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage, 1000 },
            { 'BATTLE_QUICK_REPAIR_MODAL', map.battle.isQuickRepairModal, 2000 },
          }))
          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('2-29.快修数量不足')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', map.battle.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.battleQuickRepair == 2) then
        -- 中破或大破快修
        stepLabel.setStepLabelContent('2-30.寻找中破或大破的船')
        c.yield(sleepPromise(1000))
        local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
        if (#res > 0) then

          if ((state.battle.quickRepairSingleLastShip ~= res[1]) or (state.battle.quickRepairSingleCount < 3)) then
            state.battle.quickRepairSingleLastShip = res[1]
            state.battle.quickRepairSingleCount = state.battle.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('2-31.中破或大破:' .. table.concat(res, ','))
            map.battle.clickQuickRepairModalSingleShip(res[1])
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL', map.battle.isQuickRepairModal, 500 },
            }))
            return makeAction(newstateTypes), state
          else
            state.battle.quickRepairSingleLastShip = 0
            state.battle.quickRepairSingleCount = 0
            state.battle.quickRepairCount = state.battle.quickRepairCount + 1
            stepLabel.setStepLabelContent('2-32快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', map.battle.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('2-33.修理完成')
          state.battle.quickRepairCount = state.battle.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', map.battle.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end

      elseif (settings.battleQuickRepair == 1) then
        -- 大破快修
        stepLabel.setStepLabelContent('2-34.寻找大破的船')
        c.yield(sleepPromise(1000))
        local res = map.battle.isQuickRepairModalShipNeedRepair(settings.battleQuickRepair)
        if (#res > 0) then
          if ((state.battle.quickRepairSingleLastShip ~= res[1]) or (state.battle.quickRepairSingleCount < 3)) then
            state.battle.quickRepairSingleLastShip = res[1]
            state.battle.quickRepairSingleCount = state.battle.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('2-35.大破:' .. table.concat(res, ','))
            map.battle.clickQuickRepairModalSingleShip(res[1])
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL', map.battle.isQuickRepairModal, 500 },
            }))
            return makeAction(newstateTypes), state
          else
            state.battle.quickRepairSingleLastShip = 0
            state.battle.quickRepairSingleCount = 0
            state.battle.quickRepairCount = state.battle.quickRepairCount + 1
            stepLabel.setStepLabelContent('2-36.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', map.battle.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('2-37.修理完成')
          state.battle.quickRepairCount = state.battle.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage },
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', map.battle.isQuickRepairModal },
          }))
          return makeAction(newstateTypes), state
        end
      end

    elseif (action.type == 'BATTLE_QUICK_REPAIR_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('2-38.点击快速修理关闭')
      c.yield(sleepPromise(500))
      map.battle.clickQuickRepairModalCloseBtn()
      c.yield(sleepPromise(300))
      stepLabel.setStepLabelContent('2-39.等待出征准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', map.battle.isQuickRepairModal, 2000 },
        { 'BATTLE_READY_BATTLE_PAGE', map.battle.isReadyBattlePage, 1000 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

      stepLabel.setStepLabelContent('2-40.检测舰队可以出征')
      c.yield(sleepPromise(500))
      local fleetCanBattle = map.battle.isFleetsCanBattle()
      if (fleetCanBattle) then
        stepLabel.setStepLabelContent('2-41.可以出征')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', map.battle.isReadyBattlePage },
        }))
        return makeAction(newstateTypes), state
      else
        stepLabel.setStepLabelContent('2-42.返回HOME')
        return makeAction('BATTLE_READY_BATTLE_PAGE_CANT_GO'), state
      end

    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CAN_GO') then

      stepLabel.setStepLabelContent('2-43.出征准备界面，点击出征开始')
      c.yield(sleepPromise(100))
      map.battle.clickBattleStartBtn()
      return { type = 'BATTLE_GO_A_BATTLE' }, state

    elseif (action.type == 'BATTLE_GO_A_BATTLE') then

      state.battle.passBattleStartPage = false

      if (state.battle.battleNum < settings.battleMaxBattleNum) then
        stepLabel.setStepLabelContent('2-44.第' .. state.battle.battleNum .. '战开始')
      else
        stepLabel.setStepLabelContent('2-45.第' .. state.battle.battleNum .. '战Boss战开始')
      end
      stepLabel.setStepLabelContent('2-46.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_READY_BATTLE_PAGE_CAN_GO', map.battle.isReadyBattlePage, 2000 },
        { 'BATTLE_EXTRA_RECEIVE_MODAL', map.battle.isExtraReceiveModal },
        { 'BATTLE_BATTLE_START_PAGE', map.battle.isBattleStartPage },
        { 'BATTLE_FORMATION_PAGE', map.battle.isFormationPage },
        { 'BATTLE_PURSUE_PAGE', map.battle.isPursueModal },
        { 'BATTLE_VICTORY_PAGE', map.battle.isVictoryPage },
        { 'BATTLE_VICTORY_NEXT_PAGE', map.battle.isVictoryPage2 },
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage },
        -- { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL',  map.battle.isNewShipPageLockModal },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_EXTRA_RECEIVE_MODAL') then

      stepLabel.setStepLabelContent('2-47.额外获得面板，点击确定')
      map.battle.clickExtraReceiveModalOk()
      stepLabel.setStepLabelContent('2-48.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_EXTRA_RECEIVE_MODAL', map.battle.isExtraReceiveModal, 2000 },
        { 'BATTLE_BATTLE_START_PAGE', map.battle.isBattleStartPage },
        { 'BATTLE_FORMATION_PAGE', map.battle.isFormationPage },
        { 'BATTLE_PURSUE_PAGE', map.battle.isPursueModal },
        { 'BATTLE_VICTORY_PAGE', map.battle.isVictoryPage },
        { 'BATTLE_VICTORY_NEXT_PAGE', map.battle.isVictoryPage2 },
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_BATTLE_START_PAGE') then

      -- 6-1第一战，遇到2航母，返回港口
      state.battle.passBattleStartPage = true
      if (settings.battleRebootAt6_1AMeetCV) then
        stepLabel.setStepLabelContent('2-49.开始检测航母')
        if (settings.battleChapter == '6-1') then
          if (state.battle.battleNum == 1) then
            c.yield(sleepPromise(500))
            if (map.battle.isEnemyShipIsCV()) then
              stepLabel.setStepLabelContent('2-49.遇到航母，返回港口')
              return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' }), state
            end
          end
        end
      end
      -- 6-1第一战，遇到2雷巡，返回港口
      if (settings.battleRebootAt6_1AMeetCit) then
        stepLabel.setStepLabelContent('2-50.开始检测雷巡')
        if (settings.battleChapter == '6-1') then
          if (state.battle.battleNum == 1) then
            c.yield(sleepPromise(500))
            if (map.battle.isEnemyShipIsCit()) then
              stepLabel.setStepLabelContent('2-51.遇到雷巡，返回港口')
              return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' }), state
            end
          end
        end
      end
      -- 所有关卡，遇到补给船就继续，没遇到就返回港口
      if (settings.battleRebootAtNotMeetAP) then
        stepLabel.setStepLabelContent('2-52.开始检测补给')
        c.yield(sleepPromise(500))
        if (not map.battle.isEnemyShipIsAP()) then
          stepLabel.setStepLabelContent('2-53.没遇到补给，返回港口')
          return makeAction({ type = 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME' }), state
        end
      end


      stepLabel.setStepLabelContent('2-54.开始面板，点击开始')
      c.yield(sleepPromise(200))
      if (settings.battleRoundabout and map.battle.isBattleStartPageCanRoundabout()) then
        map.battle.clickBattleStartModalRoundaboutBtn()
      else
        map.battle.clickBattleStartModalStartBtn()
      end
      stepLabel.setStepLabelContent('2-55.等待阵型面板，追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_BATTLE_START_PAGE', map.battle.isBattleStartPage, 2000 },
        { 'BATTLE_FORMATION_PAGE', map.battle.isFormationPage },
        { 'BATTLE_PURSUE_PAGE', map.battle.isPursueModal },
        { 'BATTLE_VICTORY_PAGE', map.battle.isVictoryPage },
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_FORMATION_PAGE') then

      -- 6-1未发现敌舰
      if (settings.battleRebootAt6_1AMeetCV) then
        if (not state.battle.passBattleStartPage) then
          if (settings.battleChapter == '6-1') then
            if (state.battle.battleNum == 1) then
              c.yield(sleepPromise(500))
              stepLabel.setStepLabelContent('2-56.未发现敌舰，SL大法')
              return makeAction({ type = 'LOGIN_START_APP' }), state
            end
          end
        end
      end

      stepLabel.setStepLabelContent('2-57.阵型面板')
      c.yield(sleepPromise(100))
      map.battle.clickFormationPageStartBtn(settings.battleFormation)
      stepLabel.setStepLabelContent('2-58.等待追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'BATTLE_BATTLE_START_PAGE', map.battle.isBattleStartPage, 2000 },
        { 'BATTLE_FORMATION_PAGE', map.battle.isFormationPage, 2000 },
        { 'BATTLE_PURSUE_PAGE', map.battle.isPursueModal },
        { 'BATTLE_VICTORY_PAGE', map.battle.isVictoryPage },
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_PURSUE_PAGE') then

      stepLabel.setStepLabelContent('2-59.追击面板')
      if ((settings.battlePursue and (state.battle.battleNum < settings.battleMaxBattleNum))
        or (settings.battlePursueBoss and (state.battle.battleNum == settings.battleMaxBattleNum))) then
        stepLabel.setStepLabelContent('2-60.追击')
        map.battle.clickPursueModalOk()
      else
        stepLabel.setStepLabelContent('2-61.放弃追击')
        map.battle.clickPursuePageCancel()
      end
      stepLabel.setStepLabelContent('2-62.等待胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_FORMATION_PAGE', map.battle.isFormationPage, 2000 },
        { 'BATTLE_PURSUE_PAGE', map.battle.isPursueModal, 2000 },
        { 'BATTLE_VICTORY_PAGE', map.battle.isVictoryPage },
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_VICTORY_PAGE') then

      c.yield(sleepPromise(1000))
      stepLabel.setStepLabelContent('2-63.胜利界面检测HP是否安全')
      c.yield(sleepPromise(300))
      -- 有大破就回港
      state.battle.HPIsSafe = map.battle.isVictoryPageShipHPSafe(1)
      if (state.battle.HPIsSafe) then
        stepLabel.setStepLabelContent('2-64.HP安全')
      else
        stepLabel.setStepLabelContent('2-65.HP不安全')
      end
      c.yield(sleepPromise(200))
      stepLabel.setStepLabelContent('2-66.点击胜利继续')
      map.battle.clickVictoryPageContinueBtn()
      stepLabel.setStepLabelContent('2-67.等待胜利继续界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_PURSUE_PAGE', map.battle.isPursueModal, 2000 },
        { 'BATTLE_VICTORY_PAGE', map.battle.isVictoryPage, 2000 },
        { 'BATTLE_VICTORY_NEXT_PAGE', map.battle.isVictoryPage2 },
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_VICTORY_NEXT_PAGE') then

      stepLabel.setStepLabelContent('2-68.点击胜利继续')
      map.battle.clickVictoryPageContinueBtn2()
      stepLabel.setStepLabelContent('2-69.等待大破警告，新船，下回合窗口，勋章对话框，home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_VICTORY_PAGE', map.battle.isVictoryPage, 2000 },
        { 'BATTLE_VICTORY_NEXT_PAGE', map.battle.isVictoryPage2, 2000 },
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_SHIP_SERVER_DAMAGE_MODAL') then

      stepLabel.setStepLabelContent('2-70.大破警告框点击返回')
      map.battle.clickShipSevereDamageModalBack()
      stepLabel.setStepLabelContent('2-71.等待新船，下回合窗口，勋章对话框，home')
      state.battle.HPIsSafe = false
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_VICTORY_NEXT_PAGE', map.battle.isVictoryPage2, 2000 },
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal, 2000 },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_SHIP_CANT_GO_ON_MODAL') then

      stepLabel.setStepLabelContent('2-72.无法前进警告框点击返回')
      map.battle.clickShipCantGoOnModalBackBtn()
      stepLabel.setStepLabelContent('2-73.等待新船，下回合窗口，勋章对话框，home')
      state.battle.HPIsSafe = false
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal, 2000 },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal, 2000 },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_NEW_SHIP_PAGE') then

      stepLabel.setStepLabelContent('2-74.获取新船')
      c.yield(sleepPromise(500))
      map.battle.clickNewShip()
      stepLabel.setStepLabelContent('2-75.等待新船锁定窗口，下回合窗口，勋章对话框，home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal, 2000 },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal, 2000 },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage, 2000 },
        { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', map.battle.isNewShipPageLockModal },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL') then

      stepLabel.setStepLabelContent('2-76.新船锁定窗口点击确认')
      map.battle.clickNewShipPageLockModalOkBtn()
      stepLabel.setStepLabelContent('2-77.等待下回合窗口，勋章对话框，home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_SHIP_SERVER_DAMAGE_MODAL', map.battle.isShipSevereDamageModal, 2000 },
        { 'BATTLE_SHIP_CANT_GO_ON_MODAL', map.battle.isShipCantGoOnModal, 2000 },
        { 'BATTLE_NEW_SHIP_PAGE', map.battle.isNewShipPage, 2000 },
        { 'BATTLE_NEW_SHIP_PAGE_LOCK_MODAL', map.battle.isNewShipPageLockModal, 2000 },
        { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_NEXT_LEVEL_STEP_MODAL') then

      if ((state.battle.battleNum < settings.battleMaxBattleNum) and state.battle.HPIsSafe) then
        stepLabel.setStepLabelContent('2-78.点击继续下一关')
        map.battle.clickLevelStepModalContinueBtn()
        state.battle.battleNum = state.battle.battleNum + 1
        return { type = 'BATTLE_GO_A_BATTLE' }, state
      else
        stepLabel.setStepLabelContent('2-79.点击回港')
        map.battle.clickLevelStepModalBackBtn()
        stepLabel.setStepLabelContent('2-80.等待主界面')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'BATTLE_NEXT_LEVEL_STEP_MODAL', map.battle.isNextLevelStepModal, 2000 },
        }))
        return makeAction(newstateTypes), state
      end

    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_CANT_GO') then

      -- 提示不能战斗
      if (settings.battleAlertWhenNoHp) then
        if settings.alertUseVibrate then
          vibrator(500)
          mSleep(500)
          vibrator(500)
        end
        if settings.alertUsePushbullet then
          local datestr = os.date('%Y-%m-%d %X')
          sendToPushBullet(settings.pushbulletsToken,
            datestr .. ' ' .. settings.pushbulletNickname,
            datestr .. '  ' .. getDeviceModel() .. '  ' .. '不能出征')
        end
      end

      -- 开启解体舰船功能
      state.disintegrateShip.nextDisintegrateShipStartTime = os.time()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', map.battle.isReadyBattlePage },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', map.battle.isBattleBattlePage },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', map.battle.isBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME') then

      map.battle.clickBattleStartModalBackToHomeBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_BATTLE_START_PAGE_BACK_TO_HOME', map.battle.isBattleStartPage },
        { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', map.battle.isReadyBattlePage },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', map.battle.isBattleBattlePage },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', map.battle.isBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME') then

      map.battle.clickReadyBattlePageBackBtn()
      stepLabel.setStepLabelContent('2-81.等待出征界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_READY_BATTLE_PAGE_BACK_TO_HOME', map.battle.isReadyBattlePage, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', map.battle.isBattleBattlePage },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', map.battle.isBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME') then

      map.battle.clickBackToHomeBtn()
      stepLabel.setStepLabelContent('2-82.等待主界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', map.battle.isBattleBattlePage, 2000 },
        { 'BATTLE_BATTLE_BATTLE_PAGE_BACK_TO_HOME', map.battle.isBattlePage, 2000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil, state
  end))
end

return function(state)
  state.battle = {}
  return battleOnce
end
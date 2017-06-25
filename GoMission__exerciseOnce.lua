local co = require 'Co'
local c = coroutine
local stepLabel = require 'StepLabel'
local makeAction = (require 'GoMission__utils').makeAction
local sleepPromise = (require 'GoMission__utils').sleepPromise
local setScreenListeners = (require 'GoMission__utils').setScreenListeners
local commonListenerFactory = require 'GoMission__commonListener'
local allOptions = require 'GoMission__options'

local getHomeListener = (require 'GoMission__commonListener').getHomeListener
local getLoginListener = (require 'GoMission__commonListener').getLoginListener
local getComListener = (require 'GoMission__commonListener').getComListener

local exerciseOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

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
          stepLabel.setStepLabelContent('6-10.状态正常')
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
        local res = map.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))
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

return function(state)
  state.exercise = {}
  return exerciseOnce
end
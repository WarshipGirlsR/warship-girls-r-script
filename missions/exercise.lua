local co = require '../lib/co'
local c = coroutine
local stepLabel = require '../utils/step-label'
local makeAction = (require './utils').makeAction
local sleepPromise = (require './utils').sleepPromise
local setScreenListeners = (require './utils').setScreenListeners
local commonListenerFactory = require './common-listener'

local getHomeListener = (require './common-listener').getHomeListener
local getLoginListener = (require './common-listener').getLoginListener
local getComListener = (require './common-listener').getComListener
local store = require '../store'

local moHome = require '../meta-operation/home'
local moExercise = require '../meta-operation/exercise'

local o = {
  home = moHome,
  exercise = moExercise,
}

store.exercise = store.exercise or {
  nextStartTime = os.time(),
}

local exerciseOnce = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'EXERCISE_START') then

      -- 没有到检查演习的时间
      if store.exercise.nextStartTime > os.time() then
        stepLabel.setStepLabelContent('6-1.跳过演习，下次检查时间：' .. os.date("%Y-%m-%d %H:%M:%S", store.exercise.nextStartTime))
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { '', o.home.isHome, 1000 }
        }))
        return makeAction(newstateTypes)
      end

      stepLabel.setStepLabelContent('6-2.等待home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'EXERCISE_INIT', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_INIT') then

      store.exercise.quickSupplyCount = 0
      store.exercise.quickRepairCount = 0
      store.exercise.quickRepairSingleLastShip = 0
      store.exercise.quickRepairSingleCount = 0
      store.exercise.battleNum = 1
      store.exercise.HPIsSafe = true

      stepLabel.setStepLabelContent('6-3.点击出征')
      o.home.clickBattleBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_INIT', o.home.isHome, 2000 },
        { 'EXERCISE_BATTLE_PAGE', o.exercise.isBattlePage },
        { 'EXERCISE_EXERCISE_PAGE', o.exercise.isExercisePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_BATTLE_PAGE') then

      stepLabel.setStepLabelContent('6-4.点击演习')
      o.exercise.clickExerciseBtn()
      stepLabel.setStepLabelContent('6-5.等待演习页面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_INIT', o.home.isHome },
        { 'EXERCISE_BATTLE_PAGE', o.exercise.isBattlePage, 2000 },
        { 'EXERCISE_EXERCISE_PAGE', o.exercise.isExercisePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_EXERCISE_PAGE') then

      stepLabel.setStepLabelContent('6-6.寻找演习对手')
      local res, exeList = o.exercise.isExercisePageHaveExercise()
      local nBtn = exeList[1]
      if (type(nBtn) ~= 'nil') then
        stepLabel.setStepLabelContent('6-7.发现演习对手' .. nBtn)
        o.exercise.clickToNExerciseBtn(nBtn)
        stepLabel.setStepLabelContent('6-8.等待出征准备界面')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXERCISE_BATTLE_PAGE', o.exercise.isBattlePage, 2000 },
          { 'EXERCISE_EXERCISE_PAGE', o.exercise.isExercisePage, 2000 },
          { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
        }))
        return makeAction(newstateTypes)
      else
        stepLabel.setStepLabelContent('6-9.没有可以挑战的人')

        -- 设置下一次演习检查时间
        store.exercise.nextStartTime = os.time() + settings.exerciseInterval

        return { type = 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME' }
      end

    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE') then

      if ((store.exercise.quickSupplyCount <= 0) and (store.exercise.quickRepairCount <= 0)) then
        stepLabel.setStepLabelContent('6-10.选择舰队:' .. settings.exerciseFleet)
        o.exercise.selectFleet(settings.exerciseFleet)
        stepLabel.setStepLabelContent('6-11检测所有状态')
        c.yield(sleepPromise(1000))
        local res = o.exercise.isReadyBattlePageShipStatusAllRight()
        if (res) then
          stepLabel.setStepLabelContent('6-12.状态正常')
          store.exercise.quickSupplyCount = 1
          store.exercise.quickRepairCount = 1
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }
        else
          stepLabel.setStepLabelContent('6-13.状态不正常')
          o.exercise.clickReadyBattlePageQuickSupplyBtn()
          stepLabel.setStepLabelContent('6-14.等待快速补给界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage, 2000 },
            { 'EXERCISE_QUICK_SUPPLY_MODAL', o.exercise.isQuickSupplyModal },
          }))
          return makeAction(newstateTypes)
        end
      elseif (store.exercise.quickRepairCount <= 0) then
        stepLabel.setStepLabelContent('6-15.检测血量是否安全')
        c.yield(sleepPromise(1000))
        local res = o.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('6-16.血量安全')
          store.exercise.quickRepairCount = 1
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO' }
        else
          if (settings.exerciseQuickRepair > 0) then
            stepLabel.setStepLabelContent('6-17.血量不安全，点击快修')
            o.exercise.clickQuickRepairBtn()
            stepLabel.setStepLabelContent('6-18.等待快修界面')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage, 2000 },
              { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal },
            }))
            return makeAction(newstateTypes)
          else
            stepLabel.setStepLabelContent('6-19.血量不安全，返回')
            return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }
          end
        end
      else
        stepLabel.setStepLabelContent('6-20.再次检测血量是否安全')
        c.yield(sleepPromise(1000))
        -- 不允许大破出征
        local res = o.exercise.isReadyBattlePageShipHPSafe(math.max(1, settings.exerciseQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('6-21.血量安全，继续')
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }
        else
          stepLabel.setStepLabelContent('6-22.血量不安全，返回')
          return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }
        end
      end

    elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL') then

      stepLabel.setStepLabelContent('6-23快速补给界面点击确定')
      o.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()
      stepLabel.setStepLabelContent('6-24.等待出征准备界面')
      store.exercise.quickSupplyCount = store.exercise.quickSupplyCount + 1
      if (store.exercise.quickSupplyCount < 3) then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
          { 'EXERCISE_QUICK_SUPPLY_MODAL', o.exercise.isQuickSupplyModal, 2000 },
        }))
        return makeAction(newstateTypes)
      else
        stepLabel.setStepLabelContent('6-25.资源数量不足')
        return { type = 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE' }
      end

    elseif (action.type == 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('6-26.点击快速补给关闭')
      c.yield(sleepPromise(100))
      o.exercise.clickQuickSupplyModalCloseBtn()
      stepLabel.setStepLabelContent('6-27.等待出征准备界面')
      c.yield(sleepPromise(300))
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
        { 'EXERCISE_QUICK_SUPPLY_MODAL_CLOSE', o.exercise.isQuickSupplyModal, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL') then

      if (settings.exerciseQuickRepair == 3) then
        -- 不满血则快修
        stepLabel.setStepLabelContent('6-28.点击快速修理确定')
        c.yield(sleepPromise(500))
        o.exercise.clickQuickRepairModalOkBtn()
        store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1
        stepLabel.setStepLabelContent('6-29.等待出征准备界面')
        if (store.exercise.quickRepairCount < 3) then
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal, 2000 },
          }))
          return makeAction(newstateTypes)
        else
          stepLabel.setStepLabelContent('6-30.快速修理数量不足')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickSupplyModal, 2000 },
          }))
          return makeAction(newstateTypes)
        end

      elseif (settings.exerciseQuickRepair == 2) then
        -- 中破或大破快修
        stepLabel.setStepLabelContent('6-31.寻找中破或大破的船')
        c.yield(sleepPromise(1000))
        local res = o.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
        if (#res > 0) then

          if ((store.exercise.quickRepairSingleLastShip ~= res[1]) or (store.exercise.quickRepairSingleCount < 3)) then
            store.exercise.quickRepairSingleLastShip = res[1]
            store.exercise.quickRepairSingleCount = store.exercise.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('6-32.中破或大破:' .. table.concat(res, ','))
            o.exercise.clickQuickRepairModalSingleShip(res[1])
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal, 500 },
            }))
            return makeAction(newstateTypes)
          else
            store.exercise.quickRepairSingleLastShip = 0
            store.exercise.quickRepairSingleCount = 0
            store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1
            stepLabel.setStepLabelContent('6-33快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickSupplyModal },
            }))
            return makeAction(newstateTypes)
          end
        else
          stepLabel.setStepLabelContent('6-34.修理完成')
          store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickRepairModal },
          }))
          return makeAction(newstateTypes)
        end

      elseif (settings.exerciseQuickRepair == 1) then
        -- 大破快修
        stepLabel.setStepLabelContent('6-35.寻找大破的船')
        c.yield(sleepPromise(1000))
        local res = o.exercise.isQuickRepairModalShipNeedRepair(settings.exerciseQuickRepair)
        if (#res > 0) then
          if ((store.exercise.quickRepairSingleLastShip ~= res[1]) or (store.exercise.quickRepairSingleCount < 3)) then
            store.exercise.quickRepairSingleLastShip = res[1]
            store.exercise.quickRepairSingleCount = store.exercise.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('6-36.大破:' .. table.concat(res, ','))
            o.exercise.clickQuickRepairModalSingleShip(res[1])
            c.yield(sleepPromise(500))
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_REPAIR_MODAL', o.exercise.isQuickRepairModal },
            }))
            return makeAction(newstateTypes)
          else
            store.exercise.quickRepairSingleLastShip = 0
            store.exercise.quickRepairSingleCount = 0
            store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1
            stepLabel.setStepLabelContent('6-37.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
              { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickSupplyModal },
            }))
            return makeAction(newstateTypes)
          end
        else
          stepLabel.setStepLabelContent('6-38修理完成')
          store.exercise.quickRepairCount = store.exercise.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
            { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickRepairModal },
          }))
          return makeAction(newstateTypes)
        end
      end

    elseif (action.type == 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('6-39点击快速修理关闭')
      c.yield(sleepPromise(500))
      o.exercise.clickQuickRepairModalCloseBtn()
      c.yield(sleepPromise(300))
      stepLabel.setStepLabelContent('6-40.等待出征准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_QUICK_REPAIR_MODAL_CLOSE', o.exercise.isQuickRepairModal, 2000 },
        { 'EXERCISE_READY_BATTLE_PAGE', o.exercise.isReadyBattlePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CHECK_CAN_GO') then

      stepLabel.setStepLabelContent('6-41.检测舰队是否可以出征')
      c.yield(sleepPromise(300))
      local fleetCanBattle = o.exercise.isFleetsCanBattle()
      if (not fleetCanBattle) then

        stepLabel.setStepLabelContent('6-42.舰队无法战斗')
        return { type = 'EXERCISE_READY_BATTLE_PAGE_CANT_GO' }
      else
        return { type = 'EXERCISE_READY_BATTLE_PAGE_CAN_GO' }
      end

    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CAN_GO') then

      stepLabel.setStepLabelContent('6-43.出征准备界面出征开始')
      c.yield(sleepPromise(100))
      o.exercise.clickBattleStartBtn()
      return { type = 'EXERCISE_GO_A_EXERCISE' }

    elseif (action.type == 'EXERCISE_GO_A_EXERCISE') then

      stepLabel.setStepLabelContent('6-44.等待出征准备界面，...')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_GO_A_EXERCISE', o.exercise.isReadyBattlePage, 2000 },
        { 'EXERCISE_START_PAGE', o.exercise.isBattleStartPage },
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage },
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal },
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },
        { 'EXERCISE_VICTORY_NEXT_PAGE', o.exercise.isVictoryPage2 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_START_PAGE') then

      stepLabel.setStepLabelContent('6-45.开始面板，点击开始')
      c.yield(sleepPromise(100))
      o.exercise.clickBattleStartModalStartBtn()
      stepLabel.setStepLabelContent('6-46等待阵型面板，追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_GO_A_EXERCISE', o.exercise.isReadyBattlePage },
        { 'EXERCISE_START_PAGE', o.exercise.isBattleStartPage, 2000 },
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage },
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal },
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_FORMATION_PAGE') then

      stepLabel.setStepLabelContent('6-47.阵型面板')
      c.yield(sleepPromise(100))
      o.exercise.clickFormationPageStartBtn(settings.exerciseFormation)
      stepLabel.setStepLabelContent('6-48.等待追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_START_PAGE', o.exercise.isBattleStartPage },
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage, 2000 },
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal },
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_PURSUE_MODAL') then

      stepLabel.setStepLabelContent('6-49.追击面板')
      c.yield(sleepPromise(100))
      if (settings.exercisePursue) then
        stepLabel.setStepLabelContent('6-50.追击')
        o.exercise.clickPursueModalOk()
      else
        stepLabel.setStepLabelContent('6-51.放弃追击')
        o.exercise.clickPursuePageCancel()
      end
      stepLabel.setStepLabelContent('6-52.等待胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage },
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal, 2000 },
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },
        { 'EXERCISE_VICTORY_NEXT_PAGE', o.exercise.isVictoryPage2 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_VICTORY_PAGE') then

      stepLabel.setStepLabelContent('6-53.点击胜利继续')
      o.exercise.clickVictoryPageContinueBtn()
      stepLabel.setStepLabelContent('6-54.等待胜利继续界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_FORMATION_PAGE', o.exercise.isFormationPage },
        { 'EXERCISE_PURSUE_MODAL', o.exercise.isPursueModal },
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage, 2000 },
        { 'EXERCISE_VICTORY_NEXT_PAGE', o.exercise.isVictoryPage2 },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_VICTORY_NEXT_PAGE') then

      stepLabel.setStepLabelContent('6-55点击胜利继续')
      o.exercise.clickVictoryPageContinueBtn2()
      stepLabel.setStepLabelContent('6-56.等待演习界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_VICTORY_PAGE', o.exercise.isVictoryPage },
        { 'EXERCISE_VICTORY_NEXT_PAGE', o.exercise.isVictoryPage2, 2000 },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_CANT_GO') then

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isReadyBattlePage },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME') then

      o.exercise.clickReadyBattlePageBackBtn()
      stepLabel.setStepLabelContent("6-57等待出征界面")
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXERCISE_READY_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isReadyBattlePage, 2000 },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME') then

      stepLabel.setStepLabelContent('6-58.点击回港')
      o.exercise.clickBackToHomeBtn()
      stepLabel.setStepLabelContent('6-59.等待home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isBattlePage, 2000 },
        { 'EXERCISE_BATTLE_PAGE_BACK_TO_HOME', o.exercise.isExercisePage, 2000 },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)
    end
    return nil
  end))
end

return exerciseOnce
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

local sendToTasker = require 'sendMessageToTasker'

local campaignOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'CAMPAIGN_START') then

      -- 没有到检查演习的时间
      if state.campaign.nextStartTime > os.time() then
        stepLabel.setStepLabelContent('7-1.跳过战役，下次检查时间：' .. os.date("%Y-%m-%d %H:%M:%S", state.campaign.nextStartTime))
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
        return makeAction(newstateTypes), state
      end

      stepLabel.setStepLabelContent('7-2.等待home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'CAMPAIGN_INIT', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_INIT') then

      state.campaign.quickSupplyCount = 0
      state.campaign.quickRepairCount = 0
      state.campaign.quickRepairSingleLastShip = 0
      state.campaign.quickRepairSingleCount = 0
      state.campaign.battleNum = 1
      state.campaign.HPIsSafe = true
      -- 出征后就应该需要维修
      state.repair.needRepair = true

      stepLabel.setStepLabelContent('7-3.点击出征')
      map.home.clickBattleBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_INIT', map.home.isHome, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE', map.campaign.isBattlePage },
        { 'CAMPAIGN_CAMPAIGN_PAGE', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_BATTLE_PAGE') then

      stepLabel.setStepLabelContent('7-4.点击战役')
      map.campaign.clickCampaignBtn()
      stepLabel.setStepLabelContent('7-5.等待战役页面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_INIT', map.home.isHome },
        { 'CAMPAIGN_BATTLE_PAGE', map.campaign.isBattlePage, 2000 },
        { 'CAMPAIGN_CAMPAIGN_PAGE', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_CAMPAIGN_PAGE') then

      c.yield(sleepPromise(100))
      stepLabel.setStepLabelContent('7-6.移动到战役' .. settings.campaignChapter)
      map.campaign.moveToCampaignMission(settings.campaignChapter)
      c.yield(sleepPromise(300))
      stepLabel.setStepLabelContent('7-7.点击战役')
      map.campaign.clickCampainReadyBtn(settings.campaignDifficulty)
      stepLabel.setStepLabelContent('7-8.等待战役准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_BATTLE_PAGE', map.campaign.isBattlePage, 2000 },
        { 'CAMPAIGN_CAMPAIGN_PAGE', map.campaign.isCampaignPage, 2000 },
        { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE') then

      if ((state.campaign.quickSupplyCount <= 0) and (state.campaign.quickRepairCount <= 0)) then
        stepLabel.setStepLabelContent('7-9.检测所有状态')
        c.yield(sleepPromise(1000))
        local res = map.campaign.isReadyBattlePageShipStatusAllRight()
        if (not res) then
          stepLabel.setStepLabelContent('7-10.状态不正常')
          map.campaign.clickReadyBattlePageQuickSupplyBtn()
          stepLabel.setStepLabelContent('7-11.等待快速补给界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage, 2000 },
            { 'CAMPAIGN_QUICK_SUPPLY_MODAL', map.campaign.isQuickSupplyModal },
          }))
          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('7-12.状态正常')
          state.campaign.quickSupplyCount = state.campaign.quickSupplyCount + 1
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE' }, state
        end
      elseif (state.campaign.quickRepairCount <= 0) then
        stepLabel.setStepLabelContent('7-13.检测血量是否安全')
        c.yield(sleepPromise(1000))
        local res = map.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))
        if (res) then
          state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
          stepLabel.setStepLabelContent('7-14.血量安全，继续')
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }, state
        else
          if (settings.campaignQuickRepair > 0) then
            stepLabel.setStepLabelContent('7-15.血量不安全，点击快修')
            map.campaign.clickQuickRepairBtn()
            stepLabel.setStepLabelContent('7-16.等待快修界面')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage, 2000 },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', map.campaign.isQuickRepairModal },
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
          { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
          { 'CAMPAIGN_QUICK_SUPPLY_MODAL', map.campaign.isQuickSupplyModal, 2000 },
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
        { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
        { 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE', map.campaign.isQuickSupplyModal, 2000 },
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
            { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL', map.campaign.isQuickRepairModal, 2000 },
          }))
          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('7-29.快修数量不足')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', map.campaign.isQuickRepairModal },
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
              { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', map.campaign.isQuickRepairModal, 500 },
            }))
            return makeAction(newstateTypes), state
          else
            state.campaign.quickRepairSingleLastShip = 0
            state.campaign.quickRepairSingleCount = 0
            state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
            stepLabel.setStepLabelContent('7-32.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', map.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('7-33.修理完成')
          state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', map.campaign.isQuickRepairModal },
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
              { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', map.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          else
            state.campaign.quickRepairSingleLastShip = 0
            state.campaign.quickRepairSingleCount = 0
            state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
            stepLabel.setStepLabelContent('7-36.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', map.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes), state
          end
        else
          stepLabel.setStepLabelContent('7-37.修理完成')
          state.campaign.quickRepairCount = state.campaign.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', map.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', map.campaign.isQuickRepairModal },
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
        { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', map.campaign.isQuickRepairModal, 2000 },
        { 'CAMPAIGN_QUICK_REPAIR_MODAL', map.campaign.isReadyBattlePage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO') then

      stepLabel.setStepLabelContent('7-39.出征准备界面出征开始')
      c.yield(sleepPromise(100))
      map.campaign.clickBattleStartBtn()
      -- 如果没有开始说明无法战役
      -- 设置下一次检查战役的时间
      state.campaign.nextStartTime = os.time() + settings.campaignInterval

      return { type = 'CAMPAIGN_GO_A_EXERCISE' }, state

    elseif (action.type == 'CAMPAIGN_GO_A_EXERCISE') then

      stepLabel.setStepLabelContent('7-40.等待出征准备界面，...')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO', map.campaign.isReadyBattlePage, 3000 },
        { 'CAMPAIGN_START_PAGE', map.campaign.isBattleStartPage },
        { 'CAMPAIGN_FORMATION_PAGE', map.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', map.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', map.campaign.isVictoryPage },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', map.campaign.isVictoryPage2 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_START_PAGE') then

      stepLabel.setStepLabelContent('7-41.开始面板，点击开始')
      c.yield(sleepPromise(100))
      map.campaign.clickBattleStartModalStartBtn()
      stepLabel.setStepLabelContent('7-42.等待阵型面板，追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_GO_A_EXERCISE', map.campaign.isReadyBattlePage },
        { 'CAMPAIGN_START_PAGE', map.campaign.isBattleStartPage, 2000 },
        { 'CAMPAIGN_FORMATION_PAGE', map.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', map.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', map.campaign.isVictoryPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_FORMATION_PAGE') then

      stepLabel.setStepLabelContent('7-43.阵型面板')
      c.yield(sleepPromise(100))
      map.campaign.clickFormationPageStartBtn(settings.exerciseFormation)
      stepLabel.setStepLabelContent('7-44.等待追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_START_PAGE', map.campaign.isBattleStartPage },
        { 'CAMPAIGN_FORMATION_PAGE', map.campaign.isFormationPage, 2000 },
        { 'CAMPAIGN_PURSUE_MODAL', map.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', map.campaign.isVictoryPage },
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
        { 'CAMPAIGN_FORMATION_PAGE', map.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', map.campaign.isPursueModal, 2000 },
        { 'CAMPAIGN_VICTORY_PAGE', map.campaign.isVictoryPage },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', map.campaign.isVictoryPage2 },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_VICTORY_PAGE') then

      stepLabel.setStepLabelContent('7-49.点击胜利继续')
      map.campaign.clickVictoryPageContinueBtn()
      stepLabel.setStepLabelContent('7-50.等待胜利继续界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_FORMATION_PAGE', map.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', map.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', map.campaign.isVictoryPage, 2000 },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', map.campaign.isVictoryPage2 },
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_VICTORY_NEXT_PAGE') then

      stepLabel.setStepLabelContent('7-51.点击胜利继续')
      map.campaign.clickVictoryPageContinueBtn2()
      stepLabel.setStepLabelContent('7-52.等待演习界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_VICTORY_PAGE', map.campaign.isVictoryPage },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', map.campaign.isVictoryPage2, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO') then

      -- 震动提示不能战斗
      if (settings.campaignAlertWhenCantBattle) then
        --        vibrator(500)
        --        mSleep(500)
        --        vibrator(500)
        sendToTasker(os.date('%Y-%m-%d %X') .. '  ' .. getDeviceModel() .. '  ' .. '战役失败')
      end

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', map.campaign.isReadyBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME') then

      map.campaign.clickReadyBattlePageBackBtn()
      stepLabel.setStepLabelContent("7-53.等待出征界面")
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', map.campaign.isReadyBattlePage, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'CAMPAIGN_BATTLE_PAGE2') then

      stepLabel.setStepLabelContent('7-54.点击回港')
      map.campaign.clickBackToHomeBtn()
      stepLabel.setStepLabelContent('7-55.等待home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', map.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes), state
    end
    return nil, state
  end))
end

return function(state)
  state.campaign = {
    nextStartTime = os.time(),
  }
  return campaignOnce
end
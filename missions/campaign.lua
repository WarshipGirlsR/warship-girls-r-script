local co = require '../lib/co'
local c = coroutine
local stepLabel = require '../utils/step-label'
local makeAction = (require './utils').makeAction
local sleepPromise = (require './utils').sleepPromise
local setScreenListeners = (require './utils').setScreenListeners
local getHomeListener = (require './common-listener').getHomeListener
local getLoginListener = (require './common-listener').getLoginListener
local getComListener = (require './common-listener').getComListener
local store = require '../store'

local sendToPushBullet = require '../utils/ajax-sent-to-push-bullet'

local moBattle = require '../meta-operation/battle'
local moHome = require '../meta-operation/home'
local moCampaign = require '../meta-operation/campaign'

local o = {
  home = moHome,
  battle = moBattle,
  campaign = moCampaign,
}

store.campaign = store.campaign or {
  nextStartTime = os.time()
}

local campaign = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'CAMPAIGN_START') then

      -- 没有到检查战役的时间
      if store.campaign.nextStartTime > os.time() then
        stepLabel.setStepLabelContent('7-1.跳过战役，下次检查时间：' .. os.date("%Y-%m-%d %H:%M:%S", store.campaign.nextStartTime))
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', o.home.isHome }
        }))
        return makeAction(newstateTypes)
      end

      stepLabel.setStepLabelContent('7-2.等待home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'CAMPAIGN_INIT', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_INIT') then

      store.campaign.quickSupplyCount = 0
      store.campaign.quickRepairCount = 0
      store.campaign.quickRepairSingleLastShip = 0
      store.campaign.quickRepairSingleCount = 0
      store.campaign.battleNum = 1
      store.campaign.HPIsSafe = true
      -- 出征后就应该需要维修
      store.repair.nextRepairStartTime = os.time()

      stepLabel.setStepLabelContent('7-3.点击出征')
      o.home.clickBattleBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_INIT', o.home.isHome, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE', o.campaign.isBattlePage },
        { 'CAMPAIGN_CAMPAIGN_PAGE', o.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_BATTLE_PAGE') then

      stepLabel.setStepLabelContent('7-4.点击战役')
      o.campaign.clickCampaignBtn()
      stepLabel.setStepLabelContent('7-5.等待战役页面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_INIT', o.home.isHome },
        { 'CAMPAIGN_BATTLE_PAGE', o.campaign.isBattlePage, 2000 },
        { 'CAMPAIGN_CAMPAIGN_PAGE', o.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_CAMPAIGN_PAGE') then

      c.yield(sleepPromise(100))
      stepLabel.setStepLabelContent('7-6.移动到战役' .. settings.campaignChapter)
      o.campaign.moveToCampaignMission(settings.campaignChapter)
      c.yield(sleepPromise(300))
      stepLabel.setStepLabelContent('7-7.点击战役')
      o.campaign.clickCampainReadyBtn(settings.campaignDifficulty)
      stepLabel.setStepLabelContent('7-8.等待战役准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_BATTLE_PAGE', o.campaign.isBattlePage, 2000 },
        { 'CAMPAIGN_CAMPAIGN_PAGE', o.campaign.isCampaignPage, 2000 },
        { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE') then

      if ((store.campaign.quickSupplyCount <= 0) and (store.campaign.quickRepairCount <= 0)) then
        stepLabel.setStepLabelContent('7-9.检测所有状态')
        c.yield(sleepPromise(1000))
        local res = o.campaign.isReadyBattlePageShipStatusAllRight()
        if (not res) then
          stepLabel.setStepLabelContent('7-10.状态不正常')
          o.campaign.clickReadyBattlePageQuickSupplyBtn()
          stepLabel.setStepLabelContent('7-11.等待快速补给界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage, 2000 },
            { 'CAMPAIGN_QUICK_SUPPLY_MODAL', o.campaign.isQuickSupplyModal },
          }))
          return makeAction(newstateTypes)
        else
          stepLabel.setStepLabelContent('7-12.状态正常')
          store.campaign.quickSupplyCount = store.campaign.quickSupplyCount + 1
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE' }
        end
      elseif (store.campaign.quickRepairCount <= 0) then
        stepLabel.setStepLabelContent('7-13.检测血量是否安全')
        c.yield(sleepPromise(1000))
        local res = o.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))
        if (res) then
          store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1
          stepLabel.setStepLabelContent('7-14.血量安全，继续')
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }
        else
          if (settings.campaignQuickRepair > 0) then
            stepLabel.setStepLabelContent('7-15.血量不安全，点击快修')
            o.campaign.clickQuickRepairBtn()
            stepLabel.setStepLabelContent('7-16.等待快修界面')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage, 2000 },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes)
          else
            stepLabel.setStepLabelContent('7-17.血量不安全，返回')
            return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }
          end
        end
      else
        stepLabel.setStepLabelContent('7-18.再次检测血量是否安全')
        c.yield(sleepPromise(1000))
        -- 不允许大破出征
        local res = o.campaign.isReadyBattlePageShipHPSafe(math.max(1, settings.campaignQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('7-19.血量安全，继续')
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO' }
        else
          stepLabel.setStepLabelContent('7-20.血量不安全，返回')
          return { type = 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO' }
        end
      end

    elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL') then

      stepLabel.setStepLabelContent('7-22.快速补给界面点击确定')
      o.campaign.clickReadyBattlePageQuickSupplyModalOkBtn()
      stepLabel.setStepLabelContent('7-23.等待出征准备界面')
      store.campaign.quickSupplyCount = store.campaign.quickSupplyCount + 1
      if (store.campaign.quickSupplyCount < 3) then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
          { 'CAMPAIGN_QUICK_SUPPLY_MODAL', o.campaign.isQuickSupplyModal, 2000 },
        }))
        return makeAction(newstateTypes)
      else
        stepLabel.setStepLabelContent('7-24.资源数量不足')
        return { type = 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE' }
      end

    elseif (action.type == 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('7-25.点击快速补给关闭')
      c.yield(sleepPromise(100))
      o.campaign.clickQuickSupplyModalCloseBtn()
      stepLabel.setStepLabelContent('7-26.等待出征准备界面')
      c.yield(sleepPromise(300))
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
        { 'CAMPAIGN_QUICK_SUPPLY_MODAL_CLOSE', o.campaign.isQuickSupplyModal, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL') then

      if (settings.campaignQuickRepair == 3) then
        stepLabel.setStepLabelContent('7-27.点击快速修理确定')
        o.campaign.clickQuickRepairModalOkBtn()
        store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1
        stepLabel.setStepLabelContent('7-28.等待出征准备界面')
        if (store.campaign.quickRepairCount < 3) then
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal, 2000 },
          }))
          return makeAction(newstateTypes)
        else
          stepLabel.setStepLabelContent('7-29.快修数量不足')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },
          }))
          return makeAction(newstateTypes)
        end

      elseif (settings.campaignQuickRepair == 2) then
        -- 中破或大破快修
        stepLabel.setStepLabelContent('7-30.寻找中破或大破的船')
        c.yield(sleepPromise(1000))
        local res = o.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
        if (#res > 0) then
          if ((store.campaign.quickRepairSingleLastShip ~= res[1]) or (store.campaign.quickRepairSingleCount < 3)) then
            store.campaign.quickRepairSingleLastShip = res[1]
            store.campaign.quickRepairSingleCount = store.campaign.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('7-31.中破或大破:' .. table.concat(res, ','))
            o.campaign.clickQuickRepairModalSingleShip(res[1])
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal, 500 },
            }))
            return makeAction(newstateTypes)
          else
            store.campaign.quickRepairSingleLastShip = 0
            store.campaign.quickRepairSingleCount = 0
            store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1
            stepLabel.setStepLabelContent('7-32.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes)
          end
        else
          stepLabel.setStepLabelContent('7-33.修理完成')
          store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },
          }))
          return makeAction(newstateTypes)
        end

      elseif (settings.campaignQuickRepair == 1) then
        -- 大破快修
        stepLabel.setStepLabelContent('7-34.寻找大破的船')

        c.yield(sleepPromise(500))
        local res = o.campaign.isQuickRepairModalShipNeedRepair(settings.campaignQuickRepair)
        if (#res > 0) then
          if ((store.campaign.quickRepairSingleLastShip ~= res[1]) or (store.campaign.quickRepairSingleCount < 3)) then
            store.campaign.quickRepairSingleLastShip = res[1]
            store.campaign.quickRepairSingleCount = store.campaign.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('7-35.大破:' .. table.concat(res, ','))
            o.campaign.clickQuickRepairModalSingleShip(res[1])
            c.yield(sleepPromise(500))
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes)
          else
            store.campaign.quickRepairSingleLastShip = 0
            store.campaign.quickRepairSingleCount = 0
            store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1
            stepLabel.setStepLabelContent('7-36.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
              { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },
            }))
            return makeAction(newstateTypes)
          end
        else
          stepLabel.setStepLabelContent('7-37.修理完成')
          store.campaign.quickRepairCount = store.campaign.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'CAMPAIGN_READY_BATTLE_PAGE', o.campaign.isReadyBattlePage },
            { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal },
          }))
          return makeAction(newstateTypes)
        end
      end

    elseif (action.type == 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('7-38.点击快速修理关闭')
      c.yield(sleepPromise(500))
      o.campaign.clickQuickRepairModalCloseBtn()
      c.yield(sleepPromise(300))
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_QUICK_REPAIR_MODAL_CLOSE', o.campaign.isQuickRepairModal, 2000 },
        { 'CAMPAIGN_QUICK_REPAIR_MODAL', o.campaign.isReadyBattlePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CAN_GO') then

      stepLabel.setStepLabelContent('7-39.出征准备界面出征开始')
      c.yield(sleepPromise(100))
      o.campaign.clickBattleStartBtn()
      -- 如果没有开始说明无法战役

      return makeAction('CAMPAIGN_GO_A_EXERCISE')

    elseif (action.type == 'CAMPAIGN_GO_A_EXERCISE') then

      stepLabel.setStepLabelContent('7-40.等待出征准备界面，...')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO', o.campaign.isReadyBattlePage, 3000 },
        { 'CAMPAIGN_START_PAGE', o.campaign.isBattleStartPage },
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', o.campaign.isVictoryPage2 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_START_PAGE') then

      stepLabel.setStepLabelContent('7-41.开始面板，点击开始')
      c.yield(sleepPromise(100))
      o.campaign.clickBattleStartModalStartBtn()
      stepLabel.setStepLabelContent('7-42.等待阵型面板，追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_GO_A_EXERCISE', o.campaign.isReadyBattlePage },
        { 'CAMPAIGN_START_PAGE', o.campaign.isBattleStartPage, 2000 },
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_FORMATION_PAGE') then

      stepLabel.setStepLabelContent('7-43.阵型面板')
      c.yield(sleepPromise(100))
      o.campaign.clickFormationPageStartBtn(settings.exerciseFormation)
      stepLabel.setStepLabelContent('7-44.等待追击面板，胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_START_PAGE', o.campaign.isBattleStartPage },
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage, 2000 },
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_PURSUE_MODAL') then

      stepLabel.setStepLabelContent('7-45.追击面板')
      c.yield(sleepPromise(100))
      if (settings.exercisePursue) then
        stepLabel.setStepLabelContent('7-46.追击')
        o.campaign.clickPursueModalOk()
      else
        stepLabel.setStepLabelContent('7-47.放弃追击')
        o.campaign.clickPursuePageCancel()
      end
      stepLabel.setStepLabelContent('7-48.等待胜利界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal, 2000 },
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', o.campaign.isVictoryPage2 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_VICTORY_PAGE') then

      stepLabel.setStepLabelContent('7-49.点击胜利继续')
      o.campaign.clickVictoryPageContinueBtn()
      stepLabel.setStepLabelContent('7-50.等待胜利继续界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_FORMATION_PAGE', o.campaign.isFormationPage },
        { 'CAMPAIGN_PURSUE_MODAL', o.campaign.isPursueModal },
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage, 2000 },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', o.campaign.isVictoryPage2 },
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_VICTORY_NEXT_PAGE') then

      stepLabel.setStepLabelContent('7-51.点击胜利继续')
      o.campaign.clickVictoryPageContinueBtn2()
      stepLabel.setStepLabelContent('7-52.等待演习界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_VICTORY_PAGE', o.campaign.isVictoryPage },
        { 'CAMPAIGN_VICTORY_NEXT_PAGE', o.campaign.isVictoryPage2, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_CANT_GO') then

      -- 提示不能战役
      if (settings.campaignAlertWhenCantBattle) then
        if settings.alertUseVibrate then
          vibrator(500)
          mSleep(500)
          vibrator(500)
        end
        if settings.alertUsePushbullet then
          local datestr = os.date('%Y-%m-%d %X')
          sendToPushBullet(settings.pushbulletsToken,
            datestr .. ' ' .. settings.pushbulletNickname,
            datestr .. '  ' .. getDeviceModel() .. '  ' .. '战役失败')
        end
      end

      -- 设置下一次检查战役的时间
      store.campaign.nextStartTime = os.time() + settings.campaignInterval

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', o.campaign.isReadyBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME') then

      o.campaign.clickReadyBattlePageBackBtn()
      stepLabel.setStepLabelContent("7-53.等待出征界面")
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'CAMPAIGN_READY_BATTLE_PAGE_BACK_TO_HOME', o.campaign.isReadyBattlePage, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage },
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'CAMPAIGN_BATTLE_PAGE2') then

      stepLabel.setStepLabelContent('7-54.点击回港')
      o.campaign.clickBackToHomeBtn()
      stepLabel.setStepLabelContent('7-55.等待home')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isBattlePage, 2000 },
        { 'CAMPAIGN_BATTLE_PAGE2', o.campaign.isCampaignPage, 2000 },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)
    end
    return nil
  end))
end

return campaign
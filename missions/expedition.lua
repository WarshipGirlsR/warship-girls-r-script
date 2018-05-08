local co = require '../lib/co'
local c = coroutine
local stepLabel = require '../utils/step-label'
local makeAction = (require './utils').makeAction
local sleepPromise = (require './utils').sleepPromise
local setScreenListeners = (require './utils').setScreenListeners
local commonListenerFactory = require './common-listener'
local vibratorPromise = require '../utils/vibrator-promise'

local getHomeListener = (require './common-listener').getHomeListener
local getLoginListener = (require './common-listener').getLoginListener
local getComListener = (require './common-listener').getComListener

local sendToPushBullet = require '../utils/ajax-sent-to-push-bullet'

local store = require '../store'

local moHome = require '../meta-operation/home'
local moExpedition = require '../meta-operation/expedition'

local o = {
  home = moHome,
  expedition = moExpedition,
}

store.expedition = store.expedition or {
  needExpedition = true,
}

local expedition = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'EXPEDITION_ONCE_START') then

      if (not store.expedition.needExpedition) then
        stepLabel.setStepLabelContent('4-18.跳过远征派遣，返回港口')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', 'homeGroup', o.home.isHome },
        }))
        return makeAction(newstateTypes)
      end

      if (type(settings.expeditionFleetToChapter) ~= 'table') then
        store.expedition.expeditionFleetToChapter = { false, false, false, false }
      end

      if ((not settings.expeditionFleetToChapter[1])
        and (not settings.expeditionFleetToChapter[2])
        and (not settings.expeditionFleetToChapter[3])
        and (not settings.expeditionFleetToChapter[4])) then
        stepLabel.setStepLabelContent('4-18.没有远征任务！返回港口')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
        return makeAction(newstateTypes)
      end

      stepLabel.setStepLabelContent('4-16.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_INIT', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_INIT') then
      stepLabel.setStepLabelContent('4-17.准备远征派遣舰队')
      -- 准备开始远征派遣舰队任务

      -- 将出征派遣列表复制到缓存中
      store.expedition.expeditionFleetToChapter = {}
      for k = 1, #settings.expeditionFleetToChapter do
        local v = settings.expeditionFleetToChapter[k]
        if (v) then
          table.insert(store.expedition.expeditionFleetToChapter, { k, v })
        end
      end


      -- 此任务使用的变量恢复默认值
      store.expedition.quickSupplyCount = 0
      store.expedition.quickRepairCount = 0
      store.expedition.quickRepairSingleLastShip = 0
      store.expedition.quickRepairSingleCount = 0
      store.expedition.lastChapter = nil
      store.expedition.fleet = nil
      store.expedition.chapters = nil
      store.expedition.hasShipCantExpedition = false


      stepLabel.setStepLabelContent('4-19.点击出征')
      o.expedition.clickBattle()
      stepLabel.setStepLabelContent('4-20.等待出征界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_INIT', o.home.isHome, 2000 },
        { 'EXPEDITION_IS_BATTLE_PAGE', o.expedition.isBattlePage },
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_IS_BATTLE_PAGE') then
      -- 进入出征大页面
      stepLabel.setStepLabelContent('4-21.点击远征')
      o.expedition.clickExpedition()
      stepLabel.setStepLabelContent('4-22.等待远征界面')


      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_INIT', o.home.isHome, 2000 },
        { 'EXPEDITION_IS_BATTLE_PAGE', o.expedition.isBattlePage, 2000 },
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_IS_EXPEDITION_PAGE') then
      -- 进入远征页面
      if (#store.expedition.expeditionFleetToChapter > 0) then
        c.yield(sleepPromise(500))

        store.expedition.quickSupplyCount = 0
        store.expedition.quickRepairCount = 0

        store.expedition.fleet, store.expedition.chapters = table.unpack(store.expedition.expeditionFleetToChapter[1])

        local chapter, section = table.unpack(strSplit(store.expedition.chapters, '-'))
        if (store.expedition.lastChapter ~= chapter) then
          stepLabel.setStepLabelContent('4-21.移动到第' .. chapter .. '章')
          o.expedition.moveToChapter(chapter, store.expedition.lastChapter)
          store.expedition.lastChapter = chapter
          c.yield(sleepPromise(500))
        end

        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_EXPEDITION_PAGE_CLICK_START_EXPEDITION_BTN', o.expedition.isBattleExpedition, 2000 },
          { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
        }))
        return makeAction(newstateTypes)
      else
        stepLabel.setStepLabelContent('4-27.没有远征')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isReadyBattlePage, 2000 },
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isBattleExpedition, 2000 },
        }))
        return makeAction(newstateTypes)
      end

    elseif (action.type == 'EXPEDITION_EXPEDITION_PAGE_CLICK_START_EXPEDITION_BTN') then

      if (#store.expedition.expeditionFleetToChapter > 0) then
        local chapter, section = table.unpack(strSplit(store.expedition.chapters, '-'))
        stepLabel.setStepLabelContent('4-23.检测第' .. section .. '节能否远征')
        local res = o.expedition.isChapterCanExpedition(section)
        if (res) then
          stepLabel.setStepLabelContent('4-24.点击按钮' .. section)
          o.expedition.clickExpeditionBtn(section)
          stepLabel.setStepLabelContent('4-25.等待远征准备界面')

          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_EXPEDITION_PAGE_CLICK_START_EXPEDITION_BTN', o.expedition.isBattleExpedition, 2000 },
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
          }))
          return makeAction(newstateTypes)
        else
          stepLabel.setStepLabelContent('4-26.本章不能远征')
          -- 执行下一个章节
          table.remove(store.expedition.expeditionFleetToChapter, 1)
          return makeAction('EXPEDITION_IS_EXPEDITION_PAGE')
        end
      else
        stepLabel.setStepLabelContent('4-27.没有远征')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isReadyBattlePage, 2000 },
          { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isBattleExpedition, 2000 },
        }))
        return makeAction(newstateTypes)
      end

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE') then

      if ((store.expedition.quickSupplyCount <= 0) and (store.expedition.quickRepairCount <= 0)) then
        -- 还没快速补给，还没维修
        stepLabel.setStepLabelContent('4-28.选择舰队' .. store.expedition.fleet)
        o.expedition.clickSelectFleet(store.expedition.fleet)
        stepLabel.setStepLabelContent('4-29.检测所有状态正常')
        c.yield(sleepPromise(500))
        -- 检测舰队是否在最佳状态
        local res = o.expedition.isReadyBattlePageShipStatusAllRight()
        if (res) then
          stepLabel.setStepLabelContent('4-30.状态正常')
          store.expedition.quickSupplyCount = 1
          store.expedition.quickRepairCount = 1
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }
        else
          stepLabel.setStepLabelContent('4-31.状态不正常')
          o.expedition.clickReadyBattlePageQuickSupplyBtn()
          stepLabel.setStepLabelContent('4-32.等待快速补给界面')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_QUICK_SUPPLY_MODAL', o.expedition.isQuickSupplyModal },
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage, 2000 },
          }))
          return makeAction(newstateTypes)
        end
      elseif (store.expedition.quickRepairCount <= 0) then
        -- 已经快速补给，还没维修
        stepLabel.setStepLabelContent('4-33.检测血量是否安全')
        c.yield(sleepPromise(1000))
        local res = o.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('4-34.血量安全')
          store.expedition.quickRepairCount = 1
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }
        else
          if (settings.expeditionQuickRepair > 0) then
            stepLabel.setStepLabelContent('4-35.血量不安全，快修')
            o.expedition.clickQuickRepairBtn()
            stepLabel.setStepLabelContent('4-36.等待快速修理界面')

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal },
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage, 2000 },
            }))

            return makeAction(newstateTypes)
          else
            stepLabel.setStepLabelContent('4-37.血量不安全')
            store.expedition.quickRepairCount = 1
            return { type = 'EXPEDITION_READY_BATTLE_PAGE' }
          end
        end
      else
        -- 已经快速补给，已经维修
        stepLabel.setStepLabelContent('4-38.再次检测血量是否安全')
        c.yield(sleepPromise(500))
        -- 不允许大破出征
        local res = o.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))
        if (res) then
          stepLabel.setStepLabelContent('4-39.血量安全，继续')
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO' }
        else
          stepLabel.setStepLabelContent('4-40.血量不安全，返回')
          return { type = 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO' }
        end
      end

    elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL') then
      -- 快速补给界面
      stepLabel.setStepLabelContent('4-41.快速补给界面点击确定')
      o.expedition.clickReadyBattlePageQuickSupplyModalOkBtn()
      stepLabel.setStepLabelContent('4-42.等待远征准备界面')
      store.expedition.quickSupplyCount = store.expedition.quickSupplyCount + 1
      if (store.expedition.quickSupplyCount < 3) then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_QUICK_SUPPLY_MODAL', o.expedition.isQuickSupplyModal, 2000 },
          { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
        }))
        return makeAction(newstateTypes)
      else
        stepLabel.setStepLabelContent('4-43.资源数量不足')
        return { type = 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE' }
      end

    elseif (action.type == 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('4-44.点击快速补给关闭')
      c.yield(sleepPromise(100))
      o.expedition.clickQuickSupplyModalCloseBtn()
      c.yield(sleepPromise(300))
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_QUICK_SUPPLY_MODAL_CLOSE', o.expedition.isQuickSupplyModal, 2000 },
        { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', o.expedition.isReadyBattlePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL') then


      if (settings.expeditionQuickRepair == 3) then
        -- 不满血则快修
        stepLabel.setStepLabelContent('4-45.点击快速修理确定')
        c.yield(sleepPromise(500))
        o.expedition.clickQuickRepairModalOkBtn()
        store.expedition.quickRepairCount = store.expedition.quickRepairCount + 1
        stepLabel.setStepLabelContent('4-46.等待出征准备界面')
        if (store.expedition.quickRepairCount < 3) then
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
            { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal, 2000 },
          }))
          return makeAction(newstateTypes)
        else
          stepLabel.setStepLabelContent('4-47.快修数量不足')
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
            { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },
          }))
          return makeAction(newstateTypes)
        end

      elseif (settings.expeditionQuickRepair == 2) then
        -- 中破或大破快修
        stepLabel.setStepLabelContent('4-48.寻找中破或大破的船')
        c.yield(sleepPromise(1000))
        local res = o.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)
        if (#res > 0) then
          if ((store.expedition.quickRepairSingleLastShip ~= res[1]) or (store.expedition.quickRepairSingleCount < 3)) then
            store.expedition.quickRepairSingleLastShip = res[1]
            store.expedition.quickRepairSingleCount = store.expedition.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('4-49.中破或大破:' .. table.concat(res, ','))
            o.expedition.clickQuickRepairModalSingleShip(res[1])
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
              { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal, 500 },
            }))
            return makeAction(newstateTypes)
          else
            store.expedition.quickRepairSingleLastShip = 0
            store.expedition.quickRepairSingleCount = 0
            store.expedition.quickRepairCount = store.battle.quickRepairCount + 1
            stepLabel.setStepLabelContent('4-50.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },
            }))
            return makeAction(newstateTypes)
          end
        else
          stepLabel.setStepLabelContent('4-51.修理完成')
          store.expedition.quickRepairCount = store.expedition.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
            { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },
          }))
          return makeAction(newstateTypes)
        end

      elseif (settings.expeditionQuickRepair == 1) then
        -- 大破快修
        stepLabel.setStepLabelContent('4-52.寻找大破的船')
        c.yield(sleepPromise(1000))
        local res = o.expedition.isQuickRepairModalShipNeedRepair(settings.expeditionQuickRepair)
        if (#res > 0) then
          if ((store.expedition.quickRepairSingleLastShip ~= res[1]) or (store.expedition.quickRepairSingleCount < 3)) then
            store.expedition.quickRepairSingleLastShip = res[1]
            store.expedition.quickRepairSingleCount = store.expedition.quickRepairSingleCount + 1

            stepLabel.setStepLabelContent('4-53.大破:' .. table.concat(res, ','))
            o.expedition.clickQuickRepairModalSingleShip(res[1])
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
              { 'EXPEDITION_QUICK_REPAIR_MODAL', o.expedition.isQuickRepairModal, 500 },
            }))
            return makeAction(newstateTypes)
          else
            store.expedition.quickRepairSingleLastShip = 0
            store.expedition.quickRepairSingleCount = 0
            store.expedition.quickRepairCount = store.battle.quickRepairCount + 1
            stepLabel.setStepLabelContent('4-54.快修数量不足')
            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
              { 'BATTLE_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },
            }))
            return makeAction(newstateTypes)
          end
        else
          stepLabel.setStepLabelContent('4-55.修理完成')
          store.expedition.quickRepairCount = store.expedition.quickRepairCount + 1
          local newstateTypes = c.yield(setScreenListeners(getComListener(), {
            { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
            { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal },
          }))
          return makeAction(newstateTypes)
        end
      end

    elseif (action.type == 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE') then

      stepLabel.setStepLabelContent('4-56.点击快速修理关闭')
      c.yield(sleepPromise(500))
      o.expedition.clickQuickRepairModalCloseBtn()
      c.yield(sleepPromise(300))
      stepLabel.setStepLabelContent('4-57.等待出征准备界面')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_QUICK_REPAIR_MODAL_CLOSE', o.expedition.isQuickRepairModal, 2000 },
        { 'EXPEDITION_READY_BATTLE_PAGE', o.expedition.isReadyBattlePage },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO') then

      stepLabel.setStepLabelContent('4-58.检测舰队可以出征')
      c.yield(sleepPromise(500))
      local fleetCanBattle = o.expedition.isFleetsCanBattle()
      if (fleetCanBattle) then
        stepLabel.setStepLabelContent('4-59.可以出征')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO', o.expedition.isReadyBattlePage },
        }))
        return makeAction(newstateTypes)
      else
        stepLabel.setStepLabelContent('4-60.返回')
        return makeAction('EXPEDITION_READY_BATTLE_PAGE_CANT_GO')
      end

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CAN_GO') then

      stepLabel.setStepLabelContent('4-61.出征准备界面，点击出征开始')
      c.yield(sleepPromise(100))
      stepLabel.setStepLabelContent('4-62.点击远征开始')
      o.expedition.clickBattleStartBtn()
      stepLabel.setStepLabelContent('4-63.等待战斗开始')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO', o.expedition.isReadyBattlePage, 2000 },
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then
      -- 舰队不能远征，准备返回远征页
      store.expedition.hasShipCantExpedition = true

      -- 震动提示不能远征
      if (settings.expeditionAlertWhenNoHp) then
        if settings.alertUseVibrate then
          vibratorPromise(3)
        end
        if settings.alertUsePushbullet then
          local datestr = os.date('%Y-%m-%d %X')
          sendToPushBullet(settings.pushbulletsToken,
            datestr .. ' ' .. settings.pushbulletNickname,
            datestr .. '  ' .. getDeviceModel() .. '  ' .. '远征失败')
        end
      end

      stepLabel.setStepLabelContent('4-64.点击返回远征界面')
      o.expedition.clickBackToExpedition()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO', o.expedition.isReadyBattlePage, 2000 },
        { 'EXPEDITION_IS_EXPEDITION_PAGE', o.expedition.isBattleExpedition },
      }))

      -- 如果离开这一页，则从远征队列里退出一个队伍
      if (newstateTypes ~= 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then
        table.remove(store.expedition.expeditionFleetToChapter, 1)
      end

      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME') then

      if (not store.expedition.hasShipCantExpedition) then
        store.expedition.needExpedition = false
      end

      stepLabel.setStepLabelContent('4-66.返回远征页')
      o.expedition.clickBackToExpedition()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isReadyBattlePage, 2000 },
        { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', o.expedition.isBattleExpedition, 2000 },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME') then

      stepLabel.setStepLabelContent('4-67.返回港口')
      o.expedition.clickBackToHome()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'EXPEDITION_READY_BATTLE_PAGE_BACK_TO_HOME', o.expedition.isReadyBattlePage, 2000 },
        { 'EXPEDITION_EXPEDITION_PAGE_BACK_TO_HOME', o.expedition.isBattleExpedition, 2000 },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)
    end
  end))
end

return expedition
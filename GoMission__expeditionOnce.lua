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

local expeditionOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'EXPEDITION_ONCE_START') then

      if (not state.expedition.needExpedition) then
        stepLabel.setStepLabelContent('4-18.跳过远征派遣，返回港口')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'HOME_HOME', 'homeGroup', map.home.isHome },
        }))
        return makeAction(newstateTypes), state
      end

      if (type(settings.expeditionFleetToChapter) ~= 'table') then
        state.expedition.expeditionFleetToChapter = { false, false, false, false }
      end

      if ((not settings.expeditionFleetToChapter[1])
        and (not settings.expeditionFleetToChapter[2])
        and (not settings.expeditionFleetToChapter[3])
        and (not settings.expeditionFleetToChapter[4])) then
        stepLabel.setStepLabelContent('4-18.没有远征任务！返回港口')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
        return makeAction(newstateTypes), state
      end

      stepLabel.setStepLabelContent('4-16.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_INIT', 'missionsGroup', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_INIT') then
      stepLabel.setStepLabelContent('4-17.准备远征派遣舰队')
      -- 准备开始远征派遣舰队任务

      -- 将出征派遣列表复制到缓存中
      state.expedition.expeditionFleetToChapter = {}
      for k = 1, #settings.expeditionFleetToChapter do
        local v = settings.expeditionFleetToChapter[k]
        if (v) then
          table.insert(state.expedition.expeditionFleetToChapter, { k, v })
        end
      end


      -- 此任务使用的变量恢复默认值
      state.expedition.quickSupplyCount = 0
      state.expedition.quickRepairCount = 0
      state.expedition.quickRepairSingleLastShip = 0
      state.expedition.quickRepairSingleCount = 0
      state.expedition.lastChapter = nil
      state.expedition.fleet = nil
      state.expedition.chapters = nil
      state.expedition.hasShipCantExpedition = false


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
        local res = map.expedition.isReadyBattlePageShipHPSafe(math.max(1, settings.expeditionQuickRepair))
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
      stepLabel.setStepLabelContent('4-63.等待战斗开始')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'EXPEDITION_READY_BATTLE_PAGE_CHECK_CAN_GO', 'missionsGroup', map.expedition.isReadyBattlePage, 2000 },
        { 'EXPEDITION_IS_EXPEDITION_PAGE', 'missionsGroup', map.expedition.isBattleExpedition },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'EXPEDITION_READY_BATTLE_PAGE_CANT_GO') then
      -- 舰队不能远征，准备返回远征页
      state.expedition.hasShipCantExpedition = true

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

      if (not state.expedition.hasShipCantExpedition) then
        state.expedition.needExpedition = false
      end

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

return function(state)
  state.expedition = {
    needExpedition = true,
  }
  return expeditionOnce
end
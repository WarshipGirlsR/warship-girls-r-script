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
store.repair = store.repair or {}

local moHome = require '../meta-operation/home'
local moRepair = require '../meta-operation/repair'

local o = {
  home = moHome,
  repair = moRepair,
}

local repair = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'REPAIR_ONCE_START') then

      store.repair.repairNum = 0
      -- 维修滑动界面次数
      store.repair.moveCount = 4

      if store.repair.nextRepairStartTime > os.time() then
        stepLabel.setStepLabelContent('5-1.跳过维修，返回港口')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener()), {
          { '', o.home.isHome }
        })
        return makeAction(newstateTypes)
      end

      stepLabel.setStepLabelContent('5-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'REPAIR_INIT', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'REPAIR_INIT') then

      store.repair.slot = nil

      stepLabel.setStepLabelContent('5-2.点击出征')
      c.yield(sleepPromise(100))
      o.repair.clickDockBtn()
      stepLabel.setStepLabelContent('5-3.等待船坞界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_INIT', o.home.isHome, 2000 },
        { 'REPAIR_REPAIR_PAGE', o.repair.isRepairPage },
        { 'REPAIR_DOCK_PAGE', o.repair.isDockPage },
      }))

      return makeAction(newstateTypes)

    elseif (action.type == 'REPAIR_DOCK_PAGE') then

      stepLabel.setStepLabelContent('5-4.点击修理按钮')
      c.yield(sleepPromise(100))
      o.repair.clickRepairBtn()
      stepLabel.setStepLabelContent('5-5.等待修理界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_REPAIR_PAGE', o.repair.isRepairPage },
        { 'REPAIR_DOCK_PAGE', o.repair.isDockPage, 2000 },
      }))

      return makeAction(newstateTypes)

    elseif (action.type == 'REPAIR_REPAIR_PAGE') then

      if (store.repair.repairNum < 6) then
        stepLabel.setStepLabelContent('5-6.检测空闲槽位')
        c.yield(sleepPromise(500))
        local res, hasList = o.repair.hasEmptyRepairSlot()
        if (res) then
          store.repair.slot = hasList[1]
          stepLabel.setStepLabelContent('5-7.有空闲槽位')
          stepLabel.setStepLabelContent('5-8.点击第' .. store.repair.slot .. '个空闲槽位')
          c.yield(sleepPromise(100))
          o.repair.clickRepairSlotBtn(store.repair.slot)
          c.yield(sleepPromise(100))
          stepLabel.setStepLabelContent('5-9.检测修理界面，选船界面')

          -- 如果一没进入修船选船页面说明没有需要维修的船
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_SELECT_SHIP_PAGE', o.repair.isSelectShipPage },
            { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage, 3000 },
          }))

          if (newstateTypes == 'REPAIR_REPAIR_FINISH') then
            store.repair.nextRepairStartTime = os.time() + 1800
            stepLabel.setStepLabelContent('5-10.没有船需要维修')
          end

          return makeAction(newstateTypes)
        else
          stepLabel.setStepLabelContent('5-11.没有空位')
          store.repair.nextRepairStartTime = os.time()

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage },
          }))
          return makeAction(newstateTypes)
        end
      else
        stepLabel.setStepLabelContent('5-12.维修出现意外')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage },
        }))
        return makeAction(newstateTypes)
      end

    elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then

      if (settings.repairAll) then
        stepLabel.setStepLabelContent('5-13.选择第一个船')
        c.yield(sleepPromise(200))
        o.repair.clickFirstShip()

        store.repair.repairNum = store.repair.repairNum + 1
        stepLabel.setStepLabelContent('5-14.等待返回修理界面')

        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', o.repair.isRepairPage },
          { 'REPAIR_SELECT_SHIP_PAGE', o.repair.isSelectShipPage, 2000 },
        }))

        return makeAction(newstateTypes)
      else
        if (store.repair.moveCount > 0) then
          stepLabel.setStepLabelContent('5-15.寻找一个不在舰队里的船')
          c.yield(sleepPromise(600))
          local point = o.repair.findFirstShipNotInFleet()
          if (point) then
            stepLabel.setStepLabelContent('5-16.找到 [' .. point[1] .. ',' .. point[2] .. ']，点击')
            o.repair.clickAShip(point)
            store.repair.repairNum = store.repair.repairNum + 1
          else
            -- 没找到点，移动一次
            stepLabel.setStepLabelContent('5-17.检测是否需要向左滑动')
            local needMove = o.repair.isNeedMoveToNextPage();
            if needMove then
              stepLabel.setStepLabelContent('5-18.向左滑一次')
              o.repair.moveToNextPage()
              store.repair.moveCount = store.repair.moveCount - 1

              local newstateTypes = c.yield(setScreenListeners(getComListener(), {
                { 'REPAIR_RETURN_TO_REPAIR_PAGE', o.repair.isRepairPage },
                { 'REPAIR_SELECT_SHIP_PAGE', o.repair.isSelectShipPage },
              }))

              return makeAction(newstateTypes)
            else
              stepLabel.setStepLabelContent('5-19.不需要向左滑')
              store.repair.moveCount = 0
            end
          end
        end

        stepLabel.setStepLabelContent('5-20.等待返回修理界面')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', o.repair.isRepairPage },
          { 'REPAIR_SELECT_SHIP_PAGE_RETURN', o.repair.isSelectShipPage, 2000 },
        }))

        if (newstateTypes == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then
          store.repair.nextRepairStartTime = os.time() + 1800
          stepLabel.setStepLabelContent('5-21.没有需要修理的船')
        end

        return makeAction(newstateTypes)
      end

    elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then

      stepLabel.setStepLabelContent('5-22.等待第' .. store.repair.slot .. '个槽位变成修理状态')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_REPAIR_PAGE', o.repair.isSlotNotEmpty(store.repair.slot) },
        { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage, 3000 },
      }))

      return makeAction(newstateTypes)

    elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then

      stepLabel.setStepLabelContent('5-23.没有可以修的船，返回维修页面')
      o.repair.clickSelectShipPageBackBtn()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_SELECT_SHIP_PAGE_RETURN', o.repair.isSelectShipPage, 2000 },
        { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'REPAIR_REPAIR_FINISH') then

      stepLabel.setStepLabelContent('5-24.完成维修')
      o.repair.clickBackToHomeBtn()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_SELECT_SHIP_PAGE_RETURN', o.repair.isSelectShipPage, 3000 },
        { 'REPAIR_REPAIR_FINISH', o.repair.isRepairPage, 2000 },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)
    end

    return nil
  end))
end

return repair
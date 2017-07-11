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

local repairOnce = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'REPAIR_ONCE_START') then

      state.repair.repairNum = 0
      -- 维修滑动界面次数
      state.repair.moveCount = 4

      if (not state.repair.needRepair) then
        stepLabel.setStepLabelContent('5-1.跳过维修，返回港口')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener()))
        return makeAction(newstateTypes), state
      end

      stepLabel.setStepLabelContent('5-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'REPAIR_INIT', 'missionsGroup', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_INIT') then
      state.repair.slot = nil

      stepLabel.setStepLabelContent('5-2.点击出征')
      c.yield(sleepPromise(100))
      map.repair.clickDockBtn()
      stepLabel.setStepLabelContent('5-3.等待船坞界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
        { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_DOCK_PAGE') then

      stepLabel.setStepLabelContent('5-4.点击修理按钮')
      c.yield(sleepPromise(100))
      map.repair.clickRepairBtn()
      stepLabel.setStepLabelContent('5-5.等待修理界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
        { 'REPAIR_DOCK_PAGE', 'missionsGroup', map.repair.isDockPage, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_REPAIR_PAGE') then

      if (state.repair.repairNum < 6) then
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
          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage },
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
          }))

          if (newstateTypes == 'REPAIR_REPAIR_FINISH') then
            state.repair.needRepair = false
            stepLabel.setStepLabelContent('5-10.没有船需要维修')
          end

          return makeAction(newstateTypes), state
        else
          stepLabel.setStepLabelContent('5-11.没有空位')
          state.repair.needRepair = true

          local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
            { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
          }))
          return makeAction(newstateTypes), state
        end
      else
        stepLabel.setStepLabelContent('5-12.维修出现意外')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
        }))
        return makeAction(newstateTypes), state
      end

    elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE') then

      if (settings.repairAll) then
        stepLabel.setStepLabelContent('5-13.选择第一个船')
        c.yield(sleepPromise(200))
        map.repair.clickFirstShip()

        state.repair.repairNum = state.repair.repairNum + 1
        stepLabel.setStepLabelContent('5-14.等待返回修理界面')

        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
          { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
        }))

        return makeAction(newstateTypes), state
      else
        if (state.repair.moveCount > 0) then
          stepLabel.setStepLabelContent('5-15.寻找一个不在舰队里的船')
          c.yield(sleepPromise(600))
          local point = map.repair.findFirstShipNotInFleet()
          if (point) then
            stepLabel.setStepLabelContent('5-16.找到 [' .. point[1] .. ',' .. point[2] .. ']，点击')
            map.repair.clickAShip(point)
            state.repair.repairNum = state.repair.repairNum + 1
          else
            -- 没找到点，移动一次
            stepLabel.setStepLabelContent('5-17.没找到，向左滑一次')
            map.repair.moveToNextPage()
            state.repair.moveCount = state.repair.moveCount - 1

            local newstateTypes = c.yield(setScreenListeners(getComListener(), {
              { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
              { 'REPAIR_SELECT_SHIP_PAGE', 'missionsGroup', map.repair.isSelectShipPage },
            }))

            return makeAction(newstateTypes), state
          end
        end

        stepLabel.setStepLabelContent('5-18.等待返回修理界面')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { 'REPAIR_RETURN_TO_REPAIR_PAGE', 'missionsGroup', map.repair.isRepairPage },
          { 'REPAIR_SELECT_SHIP_PAGE_RETURN', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
        }))

        if (newstateTypes == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then
          state.repair.needRepair = false
          stepLabel.setStepLabelContent('5-19.没有需要修理的船')
        end

        return makeAction(newstateTypes), state
      end

    elseif (action.type == 'REPAIR_RETURN_TO_REPAIR_PAGE') then

      stepLabel.setStepLabelContent('5-20.等待第' .. state.repair.slot .. '个槽位变成修理状态')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_REPAIR_PAGE', 'missionsGroup', map.repair.isSlotNotEmpty(state.repair.slot) },
        { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 3000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_SELECT_SHIP_PAGE_RETURN') then

      stepLabel.setStepLabelContent('5-21.没有可以修的船，返回维修页面')
      map.repair.clickSelectShipPageBackBtn()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_SELECT_SHIP_PAGE_RETURN', 'missionsGroup', map.repair.isSelectShipPage, 2000 },
        { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'REPAIR_REPAIR_FINISH') then

      stepLabel.setStepLabelContent('5-22.完成维修')
      map.repair.clickBackToHomeBtn()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'REPAIR_SELECT_SHIP_PAGE_RETURN', 'missionsGroup', map.repair.isSelectShipPage, 3000 },
        { 'REPAIR_REPAIR_FINISH', 'missionsGroup', map.repair.isRepairPage, 2000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil, state
  end))
end

return function(state)
  state.repair = {
    needRepair = true,
  }
  return repairOnce
end
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



local disintegrateShip = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if action.type == 'DISINTEGRATE_SHIP_INIT' then
      if state.disintegrateShip.nextStartTime > os.time() then
        stepLabel.setStepLabelContent('8-1.跳过解体，下次检查时间：' .. os.date("%Y-%m-%d %H:%M:%S", state.disintegrateShip.nextStartTime))
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { '', map.home.isHome, 1000 }
        }))
        return makeAction(newstateTypes), state
      end

      state.disintegrateShip.clickDisintegrateShipBtnCount = 0
      return makeAction('DISINTEGRATE_SHIP_START'), state

    elseif action.type == 'DISINTEGRATE_SHIP_START' then

      stepLabel.setStepLabelContent('8-2.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', map.home.isHome },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', map.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN' then

      stepLabel.setStepLabelContent('8-3.点击建造按钮')
      map.disintegrateShip.clickBuildPageBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', map.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN' then

      stepLabel.setStepLabelContent('8-4.点击解体页面按钮')
      map.disintegrateShip.clickDisintegratePageBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.disintegrateShip.isBuildPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', map.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN' then

      stepLabel.setStepLabelContent('8-5.点击添加按钮')
      map.disintegrateShip.clickAddShipBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.disintegrateShip.isBuildPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', map.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP' then

      stepLabel.setStepLabelContent('8-6.检测是否有船')
      c.yield(sleepPromise(500))
      local hasShipRes = map.disintegrateShip.hasShip()

      if hasShipRes then
        stepLabel.setStepLabelContent('8-7.有船，选中所有船')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', map.home.isHome, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.disintegrateShip.isBuildPage, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.disintegrateShip.isDisintegrateShipPage, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', map.disintegrateShip.addShipPage },
        }))
        return makeAction(newstateTypes), state
      end

      stepLabel.setStepLabelContent('8-8.没船，返回')
      return makeAction('DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK'), state

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK' then

      stepLabel.setStepLabelContent('8-9.点击返回')
      map.disintegrateShip.selectAllShipClickCancel()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP' then

      stepLabel.setStepLabelContent('8-10.点击所有船')
      map.disintegrateShip.clickAllShip()
      stepLabel.setStepLabelContent('8-11.点击确定')
      c.yield(sleepPromise(500))
      map.disintegrateShip.selectAllShipClickOk()
      state.disintegrateShip.clickDisintegrateShipBtnCount = 0
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_CHECK_REMOVED_ALL_EQUIPMENT_ENABLE', map.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', map.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_CHECK_REMOVED_ALL_EQUIPMENT_ENABLE' then

      stepLabel.setStepLabelContent('8-12.检测是否选中卸下所有装备选项')
      local res = map.disintegrateShip.checkIsRemoveAllEquipmentEnable()
      if res then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', map.home.isHome, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isBuildPage },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', map.disintegrateShip.isDisintegrateShipPage, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', map.disintegrateShip.addShipPage, 2000 },
        }))
        return makeAction(newstateTypes), state
      end
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_SELECT_REMOVED_ALL_EQUIPMENT', map.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', map.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_SELECT_REMOVED_ALL_EQUIPMENT' then

      stepLabel.setStepLabelContent('8-13.选中卸下所有装备选项')
      map.disintegrateShip.clickRemoveAllEquipmentCheckbox()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', map.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', map.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL' then

      stepLabel.setStepLabelContent('8-14.稀有解体确认面板')
      map.disintegrateShip.clickDisintegratePanelOkBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel, 2000 },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', map.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN' then

      stepLabel.setStepLabelContent('8-15.点击解体')
      map.disintegrateShip.clickDisintegrateShipBtn()
      state.disintegrateShip.clickDisintegrateShipBtnCount = state.disintegrateShip.clickDisintegrateShipBtnCount + 1
      if state.disintegrateShip.clickDisintegrateShipBtnCount <= 2 then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', map.home.isHome, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.disintegrateShip.isBuildPage },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', map.disintegrateShip.isDisintegrateShipPage, 1000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel, 2000 },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', map.disintegrateShip.addShipPage, 2000 },
        }))
        return makeAction(newstateTypes), state
      end

      -- 如果是快速解体模式，则不再进行第二次检查，直接退出
      if settings.disintegrateShipFastMode then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', map.home.isHome, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isBuildPage },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isDisintegrateShipPage, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel, 2000 },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.addShipPage, 2000 },
        }))
        return makeAction(newstateTypes), state
      end

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', map.disintegrateShip.disintegrateSRPanel, 2000 },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK' then

      state.disintegrateShip.nextStartTime = os.time() + settings.disintegrateShipInterval
      stepLabel.setStepLabelContent('8-16.点击返回')
      map.disintegrateShip.disintegrateShipPageClickBackToHome()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isBuildPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', map.disintegrateShip.addShipPage, 2000 },
        { '', map.home.isHome },
      }))
      return makeAction(newstateTypes), state
    end

    return nil, state
  end))
end

return function(state)
  state.disintegrateShip = {
    nextStartTime = os.time(),
  }
  return disintegrateShip
end
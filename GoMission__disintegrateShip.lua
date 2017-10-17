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

      -- 出征后就应该需要维修
      state.repair.nextRepairStartTime = os.time()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_START', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_START' then

      stepLabel.setStepLabelContent('8-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN' then

      stepLabel.setStepLabelContent('8-2.点击建造按钮')
      map.disintegrateShip.clickBuildPageBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.home.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', map.home.addShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.home.isBuildPage },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN' then

      stepLabel.setStepLabelContent('8-3.点击解体页面按钮')
      map.disintegrateShip.clickBuildPageBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.home.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', map.home.addShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.home.isBuildPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN' then

      stepLabel.setStepLabelContent('8-4.点击添加按钮')
      map.disintegrateShip.clickAddShipBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.home.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', map.home.addShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.home.isBuildPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP' then

      stepLabel.setStepLabelContent('8-5.检测是否有船')
      local hasShipRes = map.disintegrateShip.hasShip()

      if hasShipRes then
        stepLabel.setStepLabelContent('8-5.有船，退役')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', map.home.isHome, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.home.isDisintegrateShipPage },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', map.home.addShipPage },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.home.isBuildPage, 2000 },
        }))
        return makeAction(newstateTypes), state
      end

      stepLabel.setStepLabelContent('8-6.没船，返回')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', map.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.home.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', map.home.addShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.home.isBuildPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP' then

      stepLabel.setStepLabelContent('8-6.点击所有船')
      map.disintegrateShip.clickAllShip()
      stepLabel.setStepLabelContent('8-6.点击确定')
      map.disintegrateShip.selectAllShipClickOk()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.home.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', map.home.addShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.home.isBuildPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN' then

      stepLabel.setStepLabelContent('8-7.点击解体')
      map.disintegrateShip.clickDisintegrateShipBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.home.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', map.home.addShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.home.isBuildPage, 2000 },
      }))
      return makeAction(newstateTypes), state

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK' then

      map.disintegrateShip.selectAllShipClickCancel()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', map.home.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', map.home.addShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', map.home.isBuildPage, 2000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil, state
  end))
end

return function(state)
  state.disintegrateShip = {}
  return disintegrateShip
end
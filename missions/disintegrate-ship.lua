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

local moHome = require '../meta-operation/home'
local moDisintegrateShip = require '../meta-operation/disintegrateShip'

local o = {
  home = moHome,
  disintegrateShip = moDisintegrateShip,
}

store.disintegrateShip = store.disintegrateShip or {
  nextStartTime = os.time(),
}

local disintegrateShip = function(action)
  local settings = store.settings

  return co(c.create(function()
    if action.type == 'DISINTEGRATE_SHIP_INIT' then
      if store.disintegrateShip.nextStartTime > os.time() then
        stepLabel.setStepLabelContent('8-1.跳过解体，下次检查时间：' .. os.date("%Y-%m-%d %H:%M:%S", store.disintegrateShip.nextStartTime))
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
          { '', o.home.isHome, 1000 }
        }))
        return makeAction(newstateTypes)
      end

      store.disintegrateShip.clickDisintegrateShipBtnCount = 0
      return makeAction('DISINTEGRATE_SHIP_START')

    elseif action.type == 'DISINTEGRATE_SHIP_START' then

      stepLabel.setStepLabelContent('8-2.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', o.home.isHome },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', o.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN' then

      stepLabel.setStepLabelContent('8-3.点击建造按钮')
      o.disintegrateShip.clickBuildPageBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', o.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', o.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN' then

      stepLabel.setStepLabelContent('8-4.点击解体页面按钮')
      o.disintegrateShip.clickDisintegratePageBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', o.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', o.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN' then

      stepLabel.setStepLabelContent('8-5.点击添加按钮')
      o.disintegrateShip.clickAddShipBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_HOME_CLICK_BUILD_BTN', o.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP', o.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CHECK_HAS_SHIP' then

      stepLabel.setStepLabelContent('8-6.检测是否有船')
      c.yield(sleepPromise(500))
      local hasShipRes = o.disintegrateShip.hasShip()

      if hasShipRes then
        stepLabel.setStepLabelContent('8-7.有船，选中所有船')
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', o.home.isHome, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage },
        }))
        return makeAction(newstateTypes)
      end

      stepLabel.setStepLabelContent('8-8.没船，返回')
      return makeAction('DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK')

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK' then

      stepLabel.setStepLabelContent('8-9.点击返回')
      o.disintegrateShip.selectAllShipClickCancel()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', o.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.addShipPage },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP' then

      stepLabel.setStepLabelContent('8-10.点击所有船')
      o.disintegrateShip.clickAllShip()
      stepLabel.setStepLabelContent('8-11.点击确定')
      c.yield(sleepPromise(500))
      o.disintegrateShip.selectAllShipClickOk()
      store.disintegrateShip.clickDisintegrateShipBtnCount = 0
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', o.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_CHECK_REMOVED_ALL_EQUIPMENT_ENABLE', o.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_CHECK_REMOVED_ALL_EQUIPMENT_ENABLE' then

      stepLabel.setStepLabelContent('8-12.检测是否选中卸下所有装备选项')
      local res = o.disintegrateShip.checkIsRemoveAllEquipmentEnable()
      if res then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', o.home.isHome, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },
        }))
        return makeAction(newstateTypes)
      end
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', o.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_SELECT_REMOVED_ALL_EQUIPMENT', o.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_SELECT_REMOVED_ALL_EQUIPMENT' then

      stepLabel.setStepLabelContent('8-13.选中卸下所有装备选项')
      o.disintegrateShip.clickRemoveAllEquipmentCheckbox()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', o.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL' then

      stepLabel.setStepLabelContent('8-14.稀有解体确认面板')
      o.disintegrateShip.clickDisintegratePanelOkBtn()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', o.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel, 2000 },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN' then

      stepLabel.setStepLabelContent('8-15.点击解体')
      o.disintegrateShip.clickDisintegrateShipBtn()
      store.disintegrateShip.clickDisintegrateShipBtnCount = store.disintegrateShip.clickDisintegrateShipBtnCount + 1
      if store.disintegrateShip.clickDisintegrateShipBtnCount <= 2 then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', o.home.isHome, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_DISINTEGRATE_SHIP_PAGE_BTN', o.disintegrateShip.isBuildPage },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_DISINTEGRATE_BTN', o.disintegrateShip.isDisintegrateShipPage, 1000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel, 2000 },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_ALL_SHIP', o.disintegrateShip.addShipPage, 2000 },
        }))
        return makeAction(newstateTypes)
      end

      -- 如果是快速解体模式，则不再进行第二次检查，直接退出
      if settings.disintegrateShipFastMode then
        local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
          { '', o.home.isHome, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isDisintegrateShipPage, 2000 },
          { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel, 2000 },
          { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.addShipPage, 2000 },
        }))
        return makeAction(newstateTypes)
      end

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { '', o.home.isHome, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_ADD_SHIP_BTN', o.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SR_PANEL', o.disintegrateShip.disintegrateSRPanel, 2000 },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.addShipPage, 2000 },
      }))
      return makeAction(newstateTypes)

    elseif action.type == 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK' then

      store.disintegrateShip.nextStartTime = os.time() + settings.disintegrateShipInterval
      stepLabel.setStepLabelContent('8-16.点击返回')
      o.disintegrateShip.disintegrateShipPageClickBackToHome()
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isBuildPage, 2000 },
        { 'DISINTEGRATE_SHIP_DISINTEGRATE_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.isDisintegrateShipPage, 2000 },
        { 'DISINTEGRATE_SHIP_ADD_SHIP_PAGE_CLICK_BACK', o.disintegrateShip.addShipPage, 2000 },
        { '', o.home.isHome },
      }))
      return makeAction(newstateTypes)
    end

    return nil
  end))
end

return disintegrateShip
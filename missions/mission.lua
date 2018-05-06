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
store.mission = store.mission or {}

local moHome = require '../meta-operation/home'
local moMission = require '../meta-operation/mission'

local o = {
  home = moHome,
  mission = moMission,
}

local mission = function(action)
  local settings = store.settings

  return co(c.create(function()
    if (action.type == 'MISSION_START') then

      stepLabel.setStepLabelContent('3-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'MISSION_IS_UNRECEIVED_MISSION', o.home.isHome },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then

      stepLabel.setStepLabelContent('3-2.检测是否有任务奖励')
      c.yield(sleepPromise(100))
      local res = o.mission.isUnreceivedMission()
      if (res) then
        return { type = 'MISSION_INIT' }
      end
      stepLabel.setStepLabelContent('3-3.没有任务奖励')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
      return makeAction(newstateTypes)

    elseif (action.type == 'MISSION_INIT') then

      stepLabel.setStepLabelContent('3-4点击任务按钮')
      o.mission.clickMission()
      stepLabel.setStepLabelContent('3-5.等待任务界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'MISSION_INIT', 'homeGroup', o.home.isHome, 2000 },
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission },
        { 'MISSION_PAGE', o.mission.isMission },
      }))
      return makeAction(newstateTypes)

    elseif (action.type == 'MISSION_PAGE') then

      stepLabel.setStepLabelContent('3-6.点击全部任务')
      o.mission.clickAllMission()
      stepLabel.setStepLabelContent('3-7.等待任务全部任务界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission },
        { 'MISSION_PAGE', o.mission.isMission, 2000 },
      }))

      return makeAction(newstateTypes)

    elseif (action.type == 'MISSION_IS_MISSION_ALL_MISSION') then

      c.yield(sleepPromise(100))
      local res = o.mission.isMissionUnreceivedReward()
      if (not res) then
        stepLabel.setStepLabelContent('3-8.没有任务奖励')
        return { type = 'MISSION_PAGE_NO_REWAR' }
      else
        stepLabel.setStepLabelContent('3-9.有任务奖励')
        o.mission.clickGetFirstReward()
        stepLabel.setStepLabelContent('3-10.等待获得面板')

        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission, 2000 },
          { 'MISSION_REWAR_PANNEL', o.mission.isRewardPannel },
        }))

        return makeAction(newstateTypes)
      end

    elseif (action.type == 'MISSION_REWAR_PANNEL') then

      stepLabel.setStepLabelContent('3-11.点击确定')
      o.mission.clickRewardPannelOk()
      stepLabel.setStepLabelContent('3-12.等待新船，任务全部任务')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', o.mission.isNewShipPageLockModal },
        { 'MISSION_IS_NEW_SHIP', o.mission.isNewShipPage },
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission, 1000 },
        { 'MISSION_REWAR_PANNEL', o.mission.isRewardPannel, 2000 },
      }))

      return makeAction(newstateTypes)

    elseif (action.type == 'MISSION_IS_NEW_SHIP') then

      stepLabel.setStepLabelContent('3-13.点击新船')
      o.mission.clickNewShip()
      stepLabel.setStepLabelContent('3-14.等待新船锁定，任务全部任务')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', o.mission.isNewShipPageLockModal },
        { 'MISSION_IS_NEW_SHIP', o.mission.isNewShipPage },
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission, 2000 },
        { 'MISSION_REWAR_PANNEL', o.mission.isRewardPannel, 2000 },
      }))

      return makeAction(newstateTypes)

    elseif (action.type == 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL') then

      stepLabel.setStepLabelContent('3-15.点击新船')
      o.mission.clickNewShipPageLockModalOkBtn()
      stepLabel.setStepLabelContent('3-16.等待任务全部任务')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_NEW_SHIP', o.mission.isNewShipPage },
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', o.mission.isNewShipPageLockModal },
        { 'MISSION_IS_MISSION_ALL_MISSION', o.mission.isMissionAllMission },
        { 'MISSION_REWAR_PANNEL', o.mission.isRewardPannel, 2000 },
      }))

      return makeAction(newstateTypes)

    elseif (action.type == 'MISSION_PAGE_NO_REWAR') then

      stepLabel.setStepLabelContent('3-17.等待返回home')
      o.mission.clickBackToHome()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_PAGE_NO_REWAR', o.mission.isMission, 2000 },
      }))
      return makeAction(newstateTypes)
    end

    return nil
  end))
end

return mission
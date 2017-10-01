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

local mission = function(action, state)
  local map = allOptions.map
  local settings = allOptions.settings

  return co(c.create(function()
    if (action.type == 'MISSION_START') then

      stepLabel.setStepLabelContent('3-1.等待HOME')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), getLoginListener(), {
        { 'MISSION_IS_UNRECEIVED_MISSION', map.home.isHome },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_IS_UNRECEIVED_MISSION') then

      stepLabel.setStepLabelContent('3-2.检测是否有任务奖励')
      c.yield(sleepPromise(100))
      local res = map.mission.isUnreceivedMission()
      if (res) then
        return { type = 'MISSION_INIT' }, state
      end
      stepLabel.setStepLabelContent('3-3.没有任务奖励')
      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener()))
      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_INIT') then

      stepLabel.setStepLabelContent('3-4点击任务按钮')
      map.mission.clickMission()
      stepLabel.setStepLabelContent('3-5.等待任务界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), {
        { 'MISSION_INIT', 'homeGroup', map.home.isHome, 2000 },
        { 'MISSION_IS_MISSION_ALL_MISSION', map.mission.isMissionAllMission },
        { 'MISSION_PAGE', map.mission.isMission },
      }))
      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_PAGE') then

      stepLabel.setStepLabelContent('3-6.点击全部任务')
      map.mission.clickAllMission()
      stepLabel.setStepLabelContent('3-7.等待任务全部任务界面')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_MISSION_ALL_MISSION', map.mission.isMissionAllMission },
        { 'MISSION_PAGE', map.mission.isMission, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_IS_MISSION_ALL_MISSION') then

      c.yield(sleepPromise(100))
      local res = map.mission.isMissionUnreceivedReward()
      if (not res) then
        stepLabel.setStepLabelContent('3-8.没有任务奖励')
        return { type = 'MISSION_PAGE_NO_REWAR' }, state
      else
        stepLabel.setStepLabelContent('3-9.有任务奖励')
        map.mission.clickGetFirstReward()
        stepLabel.setStepLabelContent('3-10.等待获得面板')

        local newstateTypes = c.yield(setScreenListeners(getComListener(), {
          { 'MISSION_IS_MISSION_ALL_MISSION', map.mission.isMissionAllMission, 2000 },
          { 'MISSION_REWAR_PANNEL', map.mission.isRewardPannel },
        }))

        return makeAction(newstateTypes), state
      end

    elseif (action.type == 'MISSION_REWAR_PANNEL') then

      stepLabel.setStepLabelContent('3-11.点击确定')
      map.mission.clickRewardPannelOk()
      stepLabel.setStepLabelContent('3-12.等待新船，任务全部任务')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', map.mission.isNewShipPageLockModal },
        { 'MISSION_IS_NEW_SHIP', map.mission.isNewShipPage },
        { 'MISSION_IS_MISSION_ALL_MISSION', map.mission.isMissionAllMission, 1000 },
        { 'MISSION_REWAR_PANNEL', map.mission.isRewardPannel, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_IS_NEW_SHIP') then

      stepLabel.setStepLabelContent('3-13.点击新船')
      map.mission.clickNewShip()
      stepLabel.setStepLabelContent('3-14.等待新船锁定，任务全部任务')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', map.mission.isNewShipPageLockModal },
        { 'MISSION_IS_NEW_SHIP', map.mission.isNewShipPage },
        { 'MISSION_IS_MISSION_ALL_MISSION', map.mission.isMissionAllMission, 2000 },
        { 'MISSION_REWAR_PANNEL', map.mission.isRewardPannel, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL') then

      stepLabel.setStepLabelContent('3-15.点击新船')
      map.mission.clickNewShipPageLockModalOkBtn()
      stepLabel.setStepLabelContent('3-16.等待任务全部任务')

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_IS_NEW_SHIP', map.mission.isNewShipPage },
        { 'MISSION_IS_NEW_SHIP_PAGE_LOCK_MODAL', map.mission.isNewShipPageLockModal },
        { 'MISSION_IS_MISSION_ALL_MISSION', map.mission.isMissionAllMission },
        { 'MISSION_REWAR_PANNEL', map.mission.isRewardPannel, 2000 },
      }))

      return makeAction(newstateTypes), state

    elseif (action.type == 'MISSION_PAGE_NO_REWAR') then

      stepLabel.setStepLabelContent('3-17.等待返回home')
      map.mission.clickBackToHome()

      local newstateTypes = c.yield(setScreenListeners(getComListener(), getHomeListener(), {
        { 'MISSION_PAGE_NO_REWAR', map.mission.isMission, 2000 },
      }))
      return makeAction(newstateTypes), state
    end

    return nil
  end))
end

return function(state)
  state.mission = {}
  return mission
end
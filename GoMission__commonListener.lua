local allOptions = require 'GoMission__options'

local getComListener = function()
  local map = allOptions.map
  local settings = allOptions.settings

  return {
    { { type = 'NETWORK_NETWORK_FAILURE_MODAL', addToStart = true }, 'homeGroup', map.network.isNetworkFailureModal, 6000 },
    { { type = 'NETWORK_CHECK_NETWORK_MODAL', addToStart = true }, 'homeGroup', map.network.isCheckNetworkModal, 6000 },
    { 'LOGIN_START_APP', 'homeGroup', map.login.isAppNotRun, 20000 },
    -- 5分钟界面不变化则重启游戏
    { 'LOGIN_START_APP', 'homeGroup', function() return true end, settings.restartInterval * 1000 },
    --        { { type = 'PAUSE_PAUSE', addToStart = true }, 'homeGroup', map.home.isPause },
  }
end
local getHomeListener = function()
  local map = allOptions.map
  local settings = allOptions.settings

  return {
    { 'HOME_HOME', 'homeGroup', map.home.isHome, 2000 },
    { { type = 'HOME_MEDAL_MODAL', addToStart = true }, 'homeGroup', map.home.isMedalModal, 6000 },
    { { type = 'HOME_NEWS_MODAL', addToStart = true }, 'homeGroup', map.home.isNewsModal, 6000 },
    { { type = 'HOME_SIGN_MODAL', addToStart = true }, 'homeGroup', map.home.isSignModal, 6000 },
  }
end

local getLoginListener = function()
  local map = allOptions.map
  local settings = allOptions.settings

  return {
    { { type = 'LOGIN_SELECT_SERVER', addToStart = true }, 'loginGroup', map.login.isSelectServerPage, 6000 },
  }
end

return {
  getComListener = getComListener,
  getHomeListener = getHomeListener,
  getLoginListener = getLoginListener,
}
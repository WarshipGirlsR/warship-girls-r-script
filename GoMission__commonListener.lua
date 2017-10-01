local allOptions = require 'GoMission__options'

local getComListener = function()
  local map = allOptions.map
  local settings = allOptions.settings
  return {
    { { type = 'NETWORK_NETWORK_FAILURE_MODAL', addToStart = true }, map.network.isNetworkFailureModal, 6000 },
    { { type = 'NETWORK_CHECK_NETWORK_MODAL', addToStart = true }, map.network.isCheckNetworkModal, 6000 },
    { 'LOGIN_START_APP', map.login.isAppNotRun, 20000 },
    -- 5分钟界面不变化则重启游戏
    { 'LOGIN_START_APP', function() return true end, settings.restartInterval * 1000 },
    --        { { type = 'PAUSE_PAUSE', addToStart = true },  map.home.isPause },
  }
end
local getHomeListener = function()
  local map = allOptions.map
  local settings = allOptions.settings

  return {
    { 'HOME_HOME', map.home.isHome, 2000 },
    { { type = 'HOME_MEDAL_MODAL', addToStart = true }, map.home.isMedalModal, 6000 },
    { { type = 'HOME_NEWS_MODAL', addToStart = true }, map.home.isNewsModal, 6000 },
    { { type = 'HOME_SIGN_MODAL', addToStart = true }, map.home.isSignModal, 6000 },
  }
end

local getLoginListener = function()
  local map = allOptions.map
  local settings = allOptions.settings

  return {
    { { type = 'LOGIN_SELECT_SERVER' }, map.login.isSelectServerPage, 6000 },
    { { type = 'LOGIN_SELECT_SERVER' }, map.login.isLoginPage, 6000 },
  }
end

return {
  getComListener = getComListener,
  getHomeListener = getHomeListener,
  getLoginListener = getLoginListener,
}
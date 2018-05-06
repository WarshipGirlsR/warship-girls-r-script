local moBattle = require '../meta-operation/battle'
local moHome = require '../meta-operation/home'
local moNetwork = require '../meta-operation/network'
local moLogin = require '../meta-operation/login'

local store = require '../store'

local o = {
  home = moHome,
  battle = moBattle,
  network = moNetwork,
  login = moLogin,
}

local getComListener = function()
  local settings = store.settings
  return {
    { { type = 'NETWORK_NETWORK_FAILURE_MODAL', addToStart = true }, o.network.isNetworkFailureModal, 6000 },
    { { type = 'NETWORK_CHECK_NETWORK_MODAL', addToStart = true }, o.network.isCheckNetworkModal, 6000 },
    { 'LOGIN_START_APP', o.login.isAppNotRun, 20000 },
    -- 5分钟界面不变化则重启游戏
    { 'LOGIN_START_APP', function() return true end, settings.restartInterval * 1000 },
    --        { { type = 'PAUSE_PAUSE', addToStart = true },  o.home.isPause },
  }
end
local getHomeListener = function()
  local settings = store.settings

  return {
    { 'HOME_HOME', o.home.isHome, 2000 },
    { { type = 'HOME_MEDAL_MODAL', addToStart = true }, o.home.isMedalModal, 6000 },
    { { type = 'HOME_NEWS_MODAL', addToStart = true }, o.home.isNewsModal, 6000 },
    { { type = 'HOME_SIGN_MODAL', addToStart = true }, o.home.isSignModal, 6000 },
  }
end

local getLoginListener = function()
  local settings = store.settings

  return {
    { { type = 'LOGIN_SELECT_SERVER' }, o.login.isSelectServerPage, 6000 },
    { { type = 'LOGIN_SELECT_SERVER' }, o.login.isLoginPage, 6000 },
  }
end

return {
  getComListener = getComListener,
  getHomeListener = getHomeListener,
  getLoginListener = getLoginListener,
}
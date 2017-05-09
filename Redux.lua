local Redux

Redux = {}

Redux.createStore = function(fn)
  local store = fn()
  local storeTree = {}
  store.getState = function()
    return storeTree
  end

  return store;
end

return Redux
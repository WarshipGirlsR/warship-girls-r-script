return {
  createChain = function(missionList)
    assert(type(missionList) == "table", 'bad argument #1 "createChain" (table excepted, got ' .. type(missionList) .. ')')


    return {
      next = function(action)
      end,
    }
  end,
}
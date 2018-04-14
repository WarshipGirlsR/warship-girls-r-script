local socket = require 'socket'
local co = require './co'
local c = coroutine

return {
  createChain = function(missionStoreList)
    assert(type(missionStoreList) == 'table', ' bad argument # 1 "createChain"(table excepted, got ' .. type(missionStoreList) .. ')')

    local defaultOptions = {
      runCount = 0,
      missionsQuery = {},
      beforeAction = function() end,
      afterAction = function() end,
    }
    local chainObj
    chainObj = {
      runMission = function(options)
        options = options or {}
        options.runCount = options.runCount or defaultOptions.runCount
        options.missionsQuery = options.missionsQuery or defaultOptions.missionsQuery
        options.beforeAction = options.beforeAction or defaultOptions.beforeAction
        options.afterAction = options.afterAction or defaultOptions.afterAction

        local runStartTime = socket.gettime() * 1000
        local missionsQuery = {}
        table.insert(missionsQuery, { isBase = true, isStart = true })
        for key = 1, #options.missionsQuery do
          table.insert(missionsQuery, options.missionsQuery[key])
        end
        table.insert(missionsQuery, { isBase = true, isEnd = true })

        while (#missionsQuery > 0 and not luaExisted) do
          local action = missionsQuery[1]

          if (action.isStart) then
            runStartTime = socket.gettime() * 1000
          end

          c.yield(options.beforeAction({
            action = action,
            missionsQuery = missionsQuery,
            runCount = options.runCount,
            runStartTime = runStartTime,
          }))

          -- 如果是队列原有任务则将其加入队列末尾，以保证能一直循环
          -- 如果是从原有任务衍生的下一步任务，则不加入队列末尾，会被新的下一步任务替换或者删除
          if (action.isBase) then
            table.insert(missionsQuery, action)
          end

          -- 执行一个 action
          if action.type then
            local nextAction = c.yield(chainObj.next(action))
            if type(nextAction) == 'table' and type(nextAction[1]) == 'table' and nextAction[1].type then
              -- 返回的是 action 列表，将列表插入到 missionsQuery 的开头
              table.remove(missionsQuery, 1)
              for key = #nextAction, 1, -1 do
                table.insert(missionsQuery, 1, nextAction[key])
              end
            elseif type(nextAction) == 'table' and nextAction.type then
              -- 返回的是单个 action
              if nextAction.addToStart then
                table.insert(missionsQuery, 1, nextAction)
              else
                missionsQuery[1] = nextAction
              end
            else
              table.remove(missionsQuery, 1)
            end
          else
            table.remove(missionsQuery, 1)
          end

          c.yield(options.afterAction({
            action = action,
            nextAction = missionsQuery[1],
            missionsQuery = missionsQuery,
            runCount = options.runCount,
            runStartTime = runStartTime,
          }))

          if (action.isEnd) then
            options.runCount = options.runCount + 1
          end

          -- 如果是任务队列结尾标志，则count+1
        end
      end,
      next = function(action)
        if type(action) ~= 'table' then
          error(' bad argument # 1 "next"(table excepted, got ' .. type(action) .. ')', 2)
        end

        return co(c.create(function()
          if action.type and action.type ~= '' then
            local nextAction
            for key = 1, #missionStoreList do
              local item = missionStoreList[key]
              local theAction = c.yield(item(action))
              if theAction then
                nextAction = theAction
              end
            end
            if not nextAction then
              error('Action "' .. action.type .. '" not found')
            end
            return nextAction
          end
        end))
      end,
    }
    return chainObj
  end,
}

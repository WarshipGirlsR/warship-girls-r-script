return function(map, stepLabel, setOnceListener)
  local gomission = {}
  -- 出征
  -- 参数：章节，追击，追击boss，快修，使用舰队，最大战斗次数
  gomission.battleOnce = function(chapter, pursue, pursueBoss, quickRepair, fleet, alertWhenNoHp, maxBattleNum)
    stepLabel:setStepLabelContent("1-1.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
      { battlePage = map.battle.battle.isBattlePage },
      { thePage = map.battle.isBattlePage },
      -- 检测是否已在战斗中
      { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
      { battleStartPage = map.battle.battle.isBattleStartPage },
      { formationPage = map.battle.battle.isFormationPage },
      { pursueModal = map.battle.battle.isPursueModal },
      { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
      { victoryPage = map.battle.battle.isVictoryPage },
      { medalModal = map.home.isMedalModal },
      { isHome2 = map.home.isHome },
    })

    local quickSupplyCount = 0
    local quickRepairCount = 0
    local HPIsSafe = true
    local battleNum = 1
    local cantBattle = true
    while (state ~= 0) do
      if (state == "isHome") then

        stepLabel:setStepLabelContent("1-2.点击出征")
        map.home.clickBattleBtn()
        stepLabel:setStepLabelContent("1-3.等待出征页面")

        state = setOnceListener({
          { battlePage = map.battle.battle.isBattlePage },
          { thePage = map.battle.isBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { battlePage = map.battle.battle.isBattlePage },
            { thePage = map.battle.isBattlePage },
          })
        end

      elseif (state == "thePage") then

        stepLabel:setStepLabelContent("1-4.出征页面")
        stepLabel:setStepLabelContent("1-5.点击出征的出征按钮")
        mSleep(500)
        map.battle.battle.clickBattleBtn()
        stepLabel:setStepLabelContent("1-6.等待出征的出征界面")
        state = setOnceListener({
          { battlePage = map.battle.battle.isBattlePage },
          { readyBattlePage = map.battle.battle.isReadyBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { battlePage = map.battle.battle.isBattlePage },
            { thePage = map.battle.isBattlePage },
            { readyBattlePage = map.battle.battle.isReadyBattlePage },
          })
        end

      elseif (state == "battlePage") then

        stepLabel:setStepLabelContent("1-7.出征的出征页面")
        stepLabel:setStepLabelContent("1-8.移动到章节" .. chapter)
        mSleep(300)
        map.battle.battle.moveToChapter(chapter)
        stepLabel:setStepLabelContent("1-9.进入章节")
        mSleep(300)
        map.battle.battle.clickReadyBattleBtn()
        mSleep(100)
        stepLabel:setStepLabelContent("1-10.等待出征准备界面")
        state = setOnceListener({
          { readyBattlePage = map.battle.battle.isReadyBattlePage },
          { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
          { quickRepairModal = map.battle.battle.isQuickRepairModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { battlePage = map.battle.battle.isBattlePage },
            { thePage = map.battle.isBattlePage },
            { readyBattlePage = map.battle.battle.isReadyBattlePage },
            { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
            { quickRepairModal = map.battle.battle.isQuickRepairModal },
          })
        end

      elseif (state == "readyBattlePage") then

        stepLabel:setStepLabelContent("1-11.选择舰队:" .. fleet)
        map.battle.battle.selectFleet(fleet)
        stepLabel:setStepLabelContent("1-12.检测所有状态正常")
        mSleep(500)
        local res = map.battle.battle.isReadyBattlePageShipStatusAllRignt()
        if (not res) then
          map.battle.battle.clickReadyBattlePageQuickSupplyBtn()
          stepLabel:setStepLabelContent("1-13.等待快速补给界面")
          state = setOnceListener({
            { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePage = map.battle.battle.isReadyBattlePage },
              { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
            })
          end
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "quickSupplyModal") then

        stepLabel:setStepLabelContent("1-14.快速补给界面")
        stepLabel:setStepLabelContent("1-15.快速补给界面点击确定")
        map.battle.battle.clickReadyBattlePageQuickSupplyModalOkBtn()
        stepLabel:setStepLabelContent("1-16.等待出征准备界面")
        quickSupplyCount = quickSupplyCount + 1
        if (quickSupplyCount < 3) then
          state = setOnceListener({
            { readyBattlePage2 = map.battle.battle.isReadyBattlePage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { quickSupplyModal = map.battle.battle.isQuickSupplyModal },
              { readyBattlePage2 = map.battle.battle.isReadyBattlePage },
            })
          end
        else
          stepLabel:setStepLabelContent("1-17.资源数量不足")
          state = "quickSupplyModalFail"
        end

      elseif (state == "quickSupplyModalFail") then

        stepLabel:setStepLabelContent("1-18.点击快速补给关闭")
        mSleep(100)
        map.battle.battle.clickQuickSupplyModalCloseBtn()
        mSleep(300)
        cantBattle = false
        state = setOnceListener({
          { readyBattleFleetsCantBattle = map.battle.battle.isReadyBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickSupplyModalFail = map.battle.battle.isQuickSupplyModal },
            { readyBattleFleetsCantBattle = map.battle.battle.isReadyBattlePage },
          })
        end

      elseif (state == "readyBattlePage2") then

        stepLabel:setStepLabelContent("1-19.检测血量是否安全")
        mSleep(500)
        local res = map.battle.battle.isReadyBattlePageShipHPSafe()
        if (not res) then
          state = "readyBattlePageCheckHp"
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "readyBattlePageCheckHp") then

        if (quickRepair) then
          -- 如果快速修理
          stepLabel:setStepLabelContent("1-20.点击快速修理按钮")
          map.battle.battle.clickQuickRepairBtn()
          stepLabel:setStepLabelContent("1-21.等待快速修理界面")
          state = setOnceListener({
            { quickRepairModal = map.battle.battle.isQuickRepairModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePageCheckHp = map.battle.battle.isReadyBattlePage },
              { quickRepairModal = map.battle.battle.isQuickRepairModal },
            })
          end
        else
          stepLabel:setStepLabelContent("1-22.不允许快速维修，继续检测血量")
          state = "readyBattlePage4"
        end

      elseif (state == "quickRepairModal") then

        stepLabel:setStepLabelContent("1-23.点击快速修理确定")
        map.battle.battle.clickQuickRepairModalOkBtn()
        quickRepairCount = quickRepairCount + 1
        stepLabel:setStepLabelContent("1-24.等待出征准备界面")
        if (quickRepairCount < 3) then
          state = setOnceListener({
            { readyBattlePageCheckCanBattle = map.battle.battle.isReadyBattlePage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { quickRepairModal = map.battle.battle.isQuickRepairModal },
              { readyBattlePageCheckCanBattle = map.battle.battle.isReadyBattlePage },
            })
          end
        else
          stepLabel:setStepLabelContent("1-25.快速修理数量不足")
          state = "quickRepairModalFail"
        end

      elseif (state == "quickRepairModalFail") then

        stepLabel:setStepLabelContent("1-26.点击快速修理关闭")
        mSleep(100)
        map.battle.battle.clickQuickRepairModalCloseBtn()
        mSleep(300)
        cantBattle = false
        state = setOnceListener({
          { readyBattleFleetsCantBattle = map.battle.battle.isReadyBattlePage },
        })


      elseif (state == "readyBattlePage4") then

        stepLabel:setStepLabelContent("1-27.再次检测血量是否安全")
        mSleep(500)
        local res = map.battle.battle.isReadyBattlePageShipHPSafe()
        if (not res) then
          stepLabel:setStepLabelContent("1-28.血量不安全，返回")
          cantBattle = false
          state = "readyBattleFleetsCantBattle"
        else
          stepLabel:setStepLabelContent("1-29.血量安全，继续")
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "readyBattlePageCheckCanBattle") then

        stepLabel:setStepLabelContent("1-30.检测舰队可以出征")
        mSleep(500)
        local fleetCanBattle = map.battle.battle.isFleetsCanBattle()
        if (not fleetCanBattle) then
          cantBattle = false
          state = "readyBattleFleetsCantBattle"
        else
          stepLabel:setStepLabelContent("1-23.等待出征准备界面，...")
          state = setOnceListener({
            { readyBattlePageCanBattle = map.battle.battle.isReadyBattlePage },
            { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
            { battleStartPage = map.battle.battle.isBattleStartPage },
            { formationPage = map.battle.battle.isFormationPage },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { medalModal = map.home.isMedalModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { isHome = map.home.isHome },
              { battlePage = map.battle.battle.isBattlePage },
              { thePage = map.battle.isBattlePage },
              { readyBattlePageCanBattle = map.battle.battle.isReadyBattlePage },
              { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
              { battleStartPage = map.battle.battle.isBattleStartPage },
              { formationPage = map.battle.battle.isFormationPage },
              { pursueModal = map.battle.battle.isPursueModal },
              { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
              { victoryPage = map.battle.battle.isVictoryPage },
              { medalModal = map.home.isMedalModal },
            })
          end
        end

      elseif (state == "readyBattlePageCanBattle") then

        stepLabel:setStepLabelContent("1-31.出征准备界面")
        stepLabel:setStepLabelContent("1-32.点击出征开始")
        mSleep(100)
        map.battle.battle.clickBattleStartBtn()
        state = "startBattle"

      elseif (state == "startBattle") then

        if (battleNum < maxBattleNum) then
          stepLabel:setStepLabelContent("1-33.第" .. battleNum .. "战开始")
        else
          stepLabel:setStepLabelContent("1-34.第" .. battleNum .. "战Boss战开始")
        end
        stepLabel:setStepLabelContent("1-35.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面")
        state = setOnceListener({
          { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
          { battleStartPage = map.battle.battle.isBattleStartPage },
          { formationPage = map.battle.battle.isFormationPage },
          { pursueModal = map.battle.battle.isPursueModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { readyBattlePageCanBattle = map.battle.battle.isReadyBattlePage },
            { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
            { battleStartPage = map.battle.battle.isBattleStartPage },
            { formationPage = map.battle.battle.isFormationPage },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "extraReceiveModal") then

        stepLabel:setStepLabelContent("1-36.额外获得面板，点击确定")
        map.battle.battle.clickExtraReceiveModalOk()
        battleNum = battleNum + 1
        stepLabel:setStepLabelContent("1-37.等待额外获得面板，开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面")
        state = setOnceListener({
          { battleStartPage = map.battle.battle.isBattleStartPage },
          { formationPage = map.battle.battle.isFormationPage },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { pursueModal = map.battle.battle.isPursueModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
            { battleStartPage = map.battle.battle.isBattleStartPage },
            { formationPage = map.battle.battle.isFormationPage },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "battleStartPage") then

        stepLabel:setStepLabelContent("1-38.开始面板，点击开始")
        mSleep(100)
        map.battle.battle.clickBattleStartModalStartBtn()
        stepLabel:setStepLabelContent("1-39.等待阵型面板，追击面板，胜利界面")
        state = setOnceListener({
          { formationPage = map.battle.battle.isFormationPage },
          { pursueModal = map.battle.battle.isPursueModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { battleStartPage = map.battle.battle.isBattleStartPage },
            { formationPage = map.battle.battle.isFormationPage },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
          })
        end

      elseif (state == "formationPage") then

        stepLabel:setStepLabelContent("1-40.阵型面板")
        mSleep(100)
        map.battle.battle.clickFormationPageStartBtn()
        stepLabel:setStepLabelContent("1-41.等待追击面板，胜利界面")
        state = setOnceListener({
          { pursueModal = map.battle.battle.isPursueModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
          { victoryPageNext = map.battle.battle.isVictoryPage2 },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { formationPage = map.battle.battle.isFormationPage },
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { victoryPageNext = map.battle.battle.isVictoryPage2 },
          })
        end

      elseif (state == "pursueModal") then

        stepLabel:setStepLabelContent("1-58.追击面板")
        mSleep(100)
        if ((pursue and (battleNum < maxBattleNum)) or (pursueBoss and (battleNum == maxBattleNum))) then
          stepLabel:setStepLabelContent("1-59.追击")
          map.battle.battle.clickPursueModalOk()
        else
          stepLabel:setStepLabelContent("1-60.放弃追击")
          map.battle.battle.clickPursuePageCancel()
        end
        stepLabel:setStepLabelContent("1-61.等待胜利界面")
        state = setOnceListener({
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { victoryPage = map.battle.battle.isVictoryPage },
          { victoryPageNext = map.battle.battle.isVictoryPage2 },
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { pursueModal = map.battle.battle.isPursueModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { victoryPage = map.battle.battle.isVictoryPage },
            { victoryPageNext = map.battle.battle.isVictoryPage2 },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal }
          })
        end

      elseif (state == "victoryPage") then

        mSleep(1000)
        stepLabel:setStepLabelContent("1-42.胜利界面检测HP是否安全")
        mSleep(300)
        HPIsSafe = map.battle.battle.isVictoryPageShipHPSafe()
        if (HPIsSafe) then
          stepLabel:setStepLabelContent("1-43.HP安全")
        else
          stepLabel:setStepLabelContent("1-44.HP不安全")
        end
        mSleep(200)
        stepLabel:setStepLabelContent("1-45.点击胜利继续")
        mSleep(200)
        map.battle.battle.clickVictoryPageContinueBtn()
        stepLabel:setStepLabelContent("1-46.等待胜利继续界面")
        state = setOnceListener({
          { victoryPageNext = map.battle.battle.isVictoryPage2 },
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPage = map.battle.battle.isVictoryPage },
            { victoryPageNext = map.battle.battle.isVictoryPage2 },
            { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          })
        end

      elseif (state == "shipSevereDamageModal") then

        stepLabel:setStepLabelContent("1-47.大破警告框点击返回")
        map.battle.battle.clickShipSevereDamageModalBack()
        stepLabel:setStepLabelContent("1-48.等待新船，下回合窗口，勋章对话框，home")
        HPIsSafe = false
        state = setOnceListener({
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "shipCantGoOnModal") then

        stepLabel:setStepLabelContent("1-49.无法前进警告框点击返回")
        map.battle.battle.clickShipCantGoOnModalBackBtn()
        stepLabel:setStepLabelContent("1-50.等待新船，下回合窗口，勋章对话框，home")
        HPIsSafe = false
        state = setOnceListener({
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "newShipPage") then

        stepLabel:setStepLabelContent("1-51.获取新船")
        mSleep(500)
        map.battle.battle.clickNewShip()
        stepLabel:setStepLabelContent("1-52.等待新船锁定窗口，下回合窗口，勋章对话框，home")
        state = setOnceListener({
          { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
          { newShipPageLockModal = map.battle.battle.isNewShipPageLockModal },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { newShipPage = map.battle.battle.isNewShipPage },
            { hipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
            { newShipPageLockModal = map.battle.battle.isNewShipPageLockModal },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "newShipPageLockModal") then

        stepLabel:setStepLabelContent("1-53.新船锁定窗口点击确认")
        map.battle.battle.clickNewShipPageLockModalOkBtn()
        stepLabel:setStepLabelContent("1-54.等待下回合窗口，勋章对话框，home")
        state = setOnceListener({
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { edalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { newShipPageLockModal = map.battle.battle.isNewShipPageLockModal },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "nextLevelStepModal") then

        if ((battleNum < maxBattleNum) and HPIsSafe) then
          stepLabel:setStepLabelContent("1-55.点击继续下一关")
          map.battle.battle.clickLevelStepModalContinueBtn()
          state = "startBattle"
          battleNum = battleNum + 1
        else
          stepLabel:setStepLabelContent("1-56.点击回港")
          map.battle.battle.clickLevelStepModalBackBtn()
          stepLabel:setStepLabelContent("1-57.等待勋章对话框，主界面")
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
              { medalModal = map.home.isMedalModal },
              { isHome2 = map.home.isHome },
            })
          end
        end

      elseif (state == "victoryPageNext") then

        stepLabel:setStepLabelContent("1-62.点击胜利继续")
        map.battle.battle.clickVictoryPageContinueBtn2()
        stepLabel:setStepLabelContent("1-63.等待大破警告，新船，下回合窗口，勋章对话框，home")
        state = setOnceListener({
          { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
          { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
          { newShipPage = map.battle.battle.isNewShipPage },
          { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPageNext = map.battle.battle.isVictoryPage2 },
            { shipSevereDamageModal = map.battle.battle.isShipSevereDamageModal },
            { shipCantGoOnModal = map.battle.battle.isShipCantGoOnModal },
            { newShipPage = map.battle.battle.isNewShipPage },
            { nextLevelStepModal = map.battle.battle.isNextLevelStepModal },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "readyBattleFleetsCantBattle") then

        stepLabel:setStepLabelContent("1-64.舰队无法继续战斗")
        map.battle.battle.clickReadyBattlePageBackBtn()
        stepLabel:setStepLabelContent("1-65.等待出征界面")
        state = setOnceListener({
          { readyBattleFleetsCantBattleBattlePage = map.battle.isBattlePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { readyBattleFleetsCantBattle = map.battle.battle.isReadyBattlePage },
            { readyBattleFleetsCantBattleBattlePage = map.battle.isBattlePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "readyBattleFleetsCantBattleBattlePage") then

        map.battle.clickBackToHomeBtn()
        stepLabel:setStepLabelContent("1-66.等待勋章对话框，主界面")
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { readyBattleFleetsCantBattleBattlePage = map.battle.isBattlePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("1-67.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        stepLabel:setStepLabelContent("1-68.出征结束")
        if ((not cantBattle) and alertWhenNoHp) then
          for i = 1, 2 do
            vibrator();
            mSleep(1000);
          end
        end
        state = 0
        return true, HPIsSafe
      end
    end

    return true
  end

  -- 领取任务奖励
  gomission.mission = function()
    stepLabel:setStepLabelContent("2-1.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
    })

    while (state ~= 0) do
      if (state == "isHome") then

        stepLabel:setStepLabelContent("2-2.检测是否有任务奖励")
        mSleep(500)
        local res = map.mission.isUnreceivedMission()
        if (not res) then
          stepLabel:setStepLabelContent("2-3.没有任务奖励")
          state = "isHome2"
        else
          state = "startMission"
        end

      elseif (state == "startMission") then

        stepLabel:setStepLabelContent("2-4.点击任务按钮")
        map.mission.clickMission()
        stepLabel:setStepLabelContent("2-5.等待任务界面")
        state = setOnceListener({
          { missionPage = map.mission.isMission },
          { allMissionPage = map.mission.isMissionAllMission },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { missionPage = map.mission.isMission },
            { allMissionPage = map.mission.isMissionAllMission },
          })
        end

      elseif (state == "missionPage") then

        stepLabel:setStepLabelContent("2-6.点击全部任务")
        map.missionClickAllMission()
        stepLabel:setStepLabelContent("2-7.等待任务全部任务界面")
        state = setOnceListener({
          { allMissionPage = map.mission.isMissionAllMission },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { missionPage = map.mission.isMission },
            { allMissionPage = map.mission.isMissionAllMission },
          })
        end

      elseif (state == "allMissionPage") then

        mSleep(100)
        local res = map.mission.isMissionUnreceivedReward()
        if (not res) then
          stepLabel:setStepLabelContent("2-8.没有任务奖励")
          state = "missionPageNoRewar"
        else
          stepLabel:setStepLabelContent("2-9.有任务奖励")
          map.mission.clickGetFirstReward()
          stepLabel:setStepLabelContent("2-10.等待获得面板")

          state = setOnceListener({
            { rewardPage = map.mission.isRewardPannel },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { allMissionPage = map.mission.isMissionAllMission },
              { rewardPage = map.mission.isRewardPannel },
            })
          end
        end

      elseif (state == "rewardPage") then

        stepLabel:setStepLabelContent("2-11.点击确定")
        map.mission.clickRewardPannelOk()
        stepLabel:setStepLabelContent("2-12.等待任务全部任务界面")
        state = setOnceListener({
          { allMissionPage = map.mission.isMissionAllMission },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { rewardPage = map.mission.isRewardPannel },
            { allMissionPage = map.mission.isMissionAllMission },
          })
        end

      elseif (state == "missionPageNoRewar") then

        stepLabel:setStepLabelContent("2-13.等待返回home")
        map.mission.clickBackToHome()
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { missionPageNoRewar = map.mission.isMission },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("2-14.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        stepLabel:setStepLabelContent("2-15.返回港口")
        state = 0
      end
    end

    return true
  end


  -- 远征回收
  gomission.expeditionReward = function(enableChapter, expeditionTogether)
    if (type(enableChapter) ~= "table") then
      enableChapter = { 1, 2, 3, 4, 5, 6, 7 }
    end

    if (#enableChapter < 1) then
      stepLabel:setStepLabelContent("3-1.没有远征任务！")
      return true
    end
    -- 复制一份数组
    (function()
      local newC = {}
      for i, v in ipairs(enableChapter) do
        table.insert(newC, v)
      end
      enableChapter = newC
    end)()

    stepLabel:setStepLabelContent("3-2.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
      { battleExpedition = map.expedition.isBattleExpedition },
      { expeditionIsBattle = map.expedition.isBattle },
    })

    local lastChapter = nil

    while (state ~= 0) do
      if (state == "isHome") then
        stepLabel:setStepLabelContent("3-3.检测是否有远征奖励")
        mSleep(100)
        local res = map.expedition.isExpeditionCompleted()
        if (not res) then
          stepLabel:setStepLabelContent("3-4.没有远征奖励和任务")
          state = 0
          return true
        end
        stepLabel:setStepLabelContent("3-5.点击出征")
        map.expedition.clickBattle()
        stepLabel:setStepLabelContent("3-6.等待出征界面")
        state = setOnceListener({
          { expeditionIsBattle = map.expedition.isBattle },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { battleExpedition = map.expedition.isBattleExpedition },
            { expeditionIsBattle = map.expedition.isBattle },
          })
        end

      elseif (state == "expeditionIsBattle") then

        stepLabel:setStepLabelContent("3-7.点击远征")
        map.expedition.clickExpedition()
        stepLabel:setStepLabelContent("3-8.等待远征界面")
        state = setOnceListener({
          { battleExpedition = map.expedition.isBattleExpedition },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { battleExpedition = map.expedition.isBattleExpedition },
            { expeditionIsBattle = map.expedition.isBattle },
          })
        end

      elseif (state == "battleExpedition") then

        if (#enableChapter > 0) then
          local chapter = enableChapter[1]

          stepLabel:setStepLabelContent("3-9.移动到第" .. chapter .. "章")
          map.expedition.moveToChapter(chapter, lastChapter)
          lastChapter = chapter
          stepLabel:setStepLabelContent("3-10.检测本页有可收获奖励")
          mSleep(200)
          state = "checkHasReward"
        else
          state = "returnToHome"
        end

      elseif (state == "checkHasReward") then

        local res, list = map.expedition.isThisExpeditionPageHasReward()
        if (res) then
          local v = list[1]
          stepLabel:setStepLabelContent("3-11.点击按钮" .. v)
          map.expedition.clickExpeditionBtn(v)
          stepLabel:setStepLabelContent("3-12.等待远征完成页面")
          state = setOnceListener({
            { expeditionCompletedPage = map.expedition.isExpeditionCompletedPage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { expeditionIsBattle = map.expedition.isBattleExpedition },
              { expeditionCompletedPage = map.expedition.isExpeditionCompletedPage },
            })
          end
        else
          stepLabel:setStepLabelContent("3-13.本页没有可收获的奖励")
          state = "battleExpedition"
          table.remove(enableChapter, 1)
        end

      elseif (state == "expeditionCompletedPage") then

        map.expedition.clickRewardPannelOk()
        stepLabel:setStepLabelContent("3-14.等待远征界面")
        state = setOnceListener({
          { checkHasReward = map.expedition.isBattleExpedition },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { expeditionCompletedPage = map.expedition.isExpeditionCompletedPage },
            { checkHasReward = map.expedition.isBattleExpedition },
          })
        end

      elseif (state == "returnToHome") then

        if (expeditionTogether) then
          stepLabel:setStepLabelContent("3-15.等待派遣舰队")
          state = 0
          return true
        else
          stepLabel:setStepLabelContent("3-16.返回港口")
          map.expedition.clickBackToHome()
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { returnToHome = map.expedition.isBattleExpedition },
              { medalModal = map.home.isMedalModal },
              { isHome2 = map.home.isHome },
            })
          end
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("3-17.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        state = 0
        stepLabel:setStepLabelContent("3-18.home")
        return true
      end
    end
    return true
  end

  -- 远征派遣舰队
  gomission.expeditionOnce = function(expeditionFleetToChapter, expeditionQuickRepair)
    if (type(expeditionFleetToChapter) ~= "table") then
      expeditionFleetToChapter = { false, false, false, false }
    end

    if ((not expeditionFleetToChapter[1]) and (not expeditionFleetToChapter[2]) and (not expeditionFleetToChapter[3]) and (not expeditionFleetToChapter[4])) then
      stepLabel:setStepLabelContent("3-19.没有远征任务！")
      return true
    end
    -- 转换数组
    (function()
      local newC = {}
      for i, v in ipairs(expeditionFleetToChapter) do
        if (v) then
          table.insert(newC, { i, v })
        end
      end
      expeditionFleetToChapter = newC
    end)()

    stepLabel:setStepLabelContent("3-20.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
      { expeditionIsBattle = map.expedition.isBattle },
      { expeditionExpeditionPage = map.expedition.isBattleExpedition },
    })
    local lastChapter = nil
    local fleet, chapters

    while (state ~= 0) do
      if (state == "isHome") then
        stepLabel:setStepLabelContent("3-21.点击出征")
        map.expedition.clickBattle()
        stepLabel:setStepLabelContent("3-22.等待出征界面")
        state = setOnceListener({
          { expeditionIsBattle = map.expedition.isBattle },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { expeditionIsBattle = map.expedition.isBattle },
          })
        end

      elseif (state == "expeditionIsBattle") then

        stepLabel:setStepLabelContent("3-23.点击远征")
        map.expedition.clickExpedition()
        stepLabel:setStepLabelContent("3-24.等待远征界面")
        state = setOnceListener({
          { expeditionExpeditionPage = map.expedition.isBattleExpedition },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { expeditionIsBattle = map.expedition.isBattle },
            { expeditionExpeditionPage = map.expedition.isBattleExpedition },
          })
        end

      elseif (state == "expeditionExpeditionPage") then

        if (#expeditionFleetToChapter > 0) then
          fleet, chapters = table.unpack(expeditionFleetToChapter[1])

          local chapter, section = table.unpack(strSplit(chapters, "-"))
          if (lastChapter ~= chapter) then
            stepLabel:setStepLabelContent("3-25.移动到第" .. chapter .. "章")
            map.expedition.moveToChapter(chapter, lastChapter)
            lastChapter = chapter
            mSleep(300)
          end
          stepLabel:setStepLabelContent("3-26.检测第" .. section .. "节能否远征")
          mSleep(200)
          local res = map.expedition.isChapterCanExpedition(section)
          if (res) then
            stepLabel:setStepLabelContent("3-27.点击按钮" .. section)
            map.expedition.clickExpeditionBtn(section)
            stepLabel:setStepLabelContent("3-28.等待远征准备界面")
            state = setOnceListener({
              { battleExpeditionPreparePage = map.expedition.isExpeditionPrepare },
            }, 2000)
            if (state == 0) then
              state = setOnceListener({
                { expeditionExpeditionPage = map.expedition.isBattleExpedition },
                { battleExpeditionPreparePage = map.expedition.isExpeditionPrepare },
              })
            end
          else
            stepLabel:setStepLabelContent("3-29.本章不能远征")
            state = "expeditionExpeditionPage"
            -- 执行下一个章节
            table.remove(expeditionFleetToChapter, 1)
          end
        else
          stepLabel:setStepLabelContent("3-30.没有远征")
          state = "returnToHome"
        end

      elseif (state == "battleExpeditionPreparePage") then

        stepLabel:setStepLabelContent("3-31.选择舰队" .. fleet)
        map.expedition.clickSelectFleet(fleet)
        stepLabel:setStepLabelContent("3-32.检测所有状态正常")
        mSleep(300)
        local res = map.expedition.isReadyExpeditionShipStatus()
        if (not res) then
          stepLabel:setStepLabelContent("3-33.状态不正常")
          map.expedition.clickQuickSupply()
          stepLabel:setStepLabelContent("3-34.等待快速补给界面")
          state = setOnceListener({
            { quickSupplyPage = map.expeditionIsQuickSupply },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { battleExpeditionPreparePage = map.expedition.isExpeditionPrepare },
              { quickSupplyPage = map.expeditionIsQuickSupply },
            })
          end
        else
          state = "expeditionPreparePage2"
        end

      elseif (state == "quickSupplyPage") then

        map.expedition.clickQuickSupplyDo()
        stepLabel:setStepLabelContent("3-35.等待远征准备界面")
        state = setOnceListener({
          { expeditionPreparePage = map.expedition.isExpeditionPrepare },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickSupplyPage = map.expeditionIsQuickSupply },
            { expeditionPreparePage = map.expedition.isExpeditionPrepare },
          })
        end

      elseif (state == "expeditionPreparePage") then

        if (expeditionQuickRepair) then
          -- 如果快速修理
          map.expedition.clickQuickRepair()
          stepLabel:setStepLabelContent("3-36.等待快速修理界面")
          state = setOnceListener({
            { quickRepairPage = map.expedition.isQuickRepair },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { expeditionPreparePage = map.expedition.isExpeditionPrepare },
              { quickRepairPage = map.expedition.isQuickRepair },
            })
          end
        else
          state = "expeditionPreparePage2"
        end

      elseif (state == "quickRepairPage") then

        map.expedition.clickQuickRepairDo()
        stepLabel:setStepLabelContent("3-37.等待远征准备界面")
        state = setOnceListener({
          { expeditionPreparePage2 = map.expedition.isExpeditionPrepare },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickRepairPage = map.expedition.isQuickRepair },
            { expeditionPreparePage2 = map.expedition.isExpeditionPrepare },
          })
        end

      elseif (state == "expeditionPreparePage2") then

        stepLabel:setStepLabelContent("3-38.检测舰队可以远征")
        mSleep(500)
        local fleetCanExpedition = map.expedition.isCanExpedition()
        if (not fleetCanExpedition) then
          stepLabel:setStepLabelContent("3-39.点击返回远征界面")
          map.expedition.clickBackToExpeditionPrepare()
          table.remove(expeditionFleetToChapter, 1)
        else
          stepLabel:setStepLabelContent("3-40.点击远征开始")
          map.expedition.clickBattleStart()
        end
        stepLabel:setStepLabelContent("3-41.等待远征界面")
        state = setOnceListener({
          { expeditionExpeditionPage = map.expedition.isBattleExpedition },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { expeditionPreparePage2 = map.expedition.isExpeditionPrepare },
            { expeditionExpeditionPage = map.expedition.isBattleExpedition },
          })
        end

      elseif (state == "returnToHome") then

        stepLabel:setStepLabelContent("3-42.返回港口")
        map.expedition.clickBackToHome()
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { returnToHome = map.expedition.isBattleExpedition },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("3-43.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        state = 0
        stepLabel:setStepLabelContent("3-44.home")
        return true
      end
    end

    return true
  end


  -- 修理
  gomission.repairOnce = function()
    stepLabel:setStepLabelContent("4-1.等待home")

    local needRepair = true
    local slot

    local state = setOnceListener({
      { isHome = map.home.isHome },
      { repairPage = map.repair.isRepairPage },
      { dockPage = map.repair.isDockPage },
    })
    while (state ~= 0) do
      if (state == "isHome") then

        stepLabel:setStepLabelContent("4-2.点击出征")
        mSleep(100)
        map.repair.clickDockBtn()
        stepLabel:setStepLabelContent("4-3.等待船坞界面")
        state = setOnceListener({
          { repairPage = map.repair.isRepairPage },
          { dockPage = map.repair.isDockPage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { repairPage = map.repair.isRepairPage },
            { dockPage = map.repair.isDockPage },
          })
        end

      elseif (state == "dockPage") then

        stepLabel:setStepLabelContent("4-4.点击修理按钮")
        mSleep(100)
        map.repair.clickRepairBtn()
        stepLabel:setStepLabelContent("4-5.等待修理界面")
        state = setOnceListener({
          { repairPage = map.repair.isRepairPage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { dockPage = map.repair.isDockPage },
            { repairPage = map.repair.isRepairPage },
            { medalModal = map.home.isMedalModal },
          })
        end

      elseif (state == "repairPage") then

        stepLabel:setStepLabelContent("4-6.检测空闲槽位")
        mSleep(500)
        local res, hasList = map.repair.hasEmptyRepairSlot()
        if (res) then
          slot = hasList[1]
          stepLabel:setStepLabelContent("4-7.有空闲槽位")
          stepLabel:setStepLabelContent("4-8.点击第" .. slot .. "个空闲槽位")
          mSleep(100)
          map.repair.clickRepairSlotBtn(slot)
          mSleep(100)
          stepLabel:setStepLabelContent("4-9.检测修理界面，选船界面")
          state = setOnceListener({
            { selectShipPage = map.repair.isSelectShipPage },
          }, 3000)
          -- 如果一没进入修船选船页面说明没有需要维修的船
          if (state == 0) then
            state = setOnceListener({
              { selectShipPage = map.repair.isSelectShipPage },
              { repairFinish = map.repair.isRepairPage },
              { medalModal = map.home.isMedalModal },
              { isHome2 = map.home.isHome },
            })
          end
        else
          stepLabel:setStepLabelContent("4-10.没有空位")
          state = setOnceListener({
            { repairFinish = map.repair.isRepairPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "selectShipPage") then

        stepLabel:setStepLabelContent("4-11.选择第一个船")
        mSleep(200)
        map.repair.clickFirstShip()
        stepLabel:setStepLabelContent("4-12.等待返回修理界面")
        state = setOnceListener({
          { returnToRepairPage = map.repair.isRepairPage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { selectShipPage = map.repair.isSelectShipPage },
            { returnToRepairPage = map.repair.isRepairPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "returnToRepairPage") then

        stepLabel:setStepLabelContent("4-13.等待第" .. slot .. "个槽位变成修理状态")
        state = setOnceListener({
          { repairPage = map.repair.isSlotNotEmpty(slot) },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 3000)
        if (state == 0) then
          state = setOnceListener({
            { repairFinish = map.repair.isRepairPage },
            { repairPage = map.repair.isSlotNotEmpty(slot) },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "repairFinish") then

        stepLabel:setStepLabelContent("4-14.完成维修")
        map.repair.clickBackToHomeBtn()
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { returnToHome = map.expedition.isBattleExpedition },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("4-15.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        stepLabel:setStepLabelContent("4-16.维修结束")
        state = 0
        return true, needRepair
      end
    end


    return true, needRepair
  end
  -- 修理

  -- 演习
  gomission.exerciseOnce = function(chapter, pursue, quickRepair, fleet, maxBattleNum)
    stepLabel:setStepLabelContent("5-1.等待home")
    local state = setOnceListener({
      { isHome = map.home.isHome },
      { thePage = map.exercise.isBattlePage },
      -- 检测是否已在战斗中
      { extraReceiveModal = map.battle.battle.isExtraReceiveModal },
      { battleStartPage = map.battle.battle.isBattleStartPage },
      { formationPage = map.battle.battle.isFormationPage },
      { pursueModal = map.battle.battle.isPursueModal },
      { victoryPage = map.battle.battle.isVictoryPage },
      { medalModal = map.home.isMedalModal },
      { isHome2 = map.home.isHome },
    })

    local quickSupplyCount = 0
    local quickRepairCount = 0
    local battleNum = 1
    local HPIsSafe = true
    while (state ~= 0) do
      if (state == "isHome") then

        stepLabel:setStepLabelContent("5-2.点击出征")
        map.home.clickBattleBtn()
        state = setOnceListener({
          { thePage = map.exercise.isBattlePage },
          { exercisePage = map.exercise.isExercisePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { isHome = map.home.isHome },
            { thePage = map.exercise.isBattlePage },
            { exercisePage = map.exercise.isExercisePage },
          })
        end

      elseif (state == "thePage") then

        stepLabel:setStepLabelContent("5-3.点击演习")
        map.exercise.clickExerciseBtn()
        stepLabel:setStepLabelContent("5-4.等待演习页面")

        state = setOnceListener({
          { exercisePage = map.exercise.isExercisePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { thePage = map.exercise.isBattlePage },
            { exercisePage = map.exercise.isExercisePage },
          })
        end

      elseif (state == "exercisePage") then

        mSleep(100)
        local res, exeList = map.exercise.isExercisePageHaveExercise()
        local nBtn = exeList[1]
        if (type(nBtn) ~= "nil") then
          map.exercise.clickToNExerciseBtn(nBtn)
          stepLabel:setStepLabelContent("5-5.等待出征准备界面")
          state = setOnceListener({
            { readyBattlePage = map.exercise.isReadyBattlePage },
            { quickSupplyModal = map.exercise.isQuickSupplyModal },
            { quickRepairModal = map.exercise.isQuickRepairModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { thePage = map.exercise.isBattlePage },
              { exercisePage = map.exercise.isExercisePage },
              { readyBattlePage = map.exercise.isReadyBattlePage },
              { quickSupplyModal = map.exercise.isQuickSupplyModal },
              { quickRepairModal = map.exercise.isQuickRepairModal },
            })
          end
        else
          stepLabel:setStepLabelContent("5-6.没有可以挑战的人")
          state = "readyBattleFleetsCantBattle"
        end

      elseif (state == "readyBattlePage") then

        stepLabel:setStepLabelContent("5-7.选择舰队:" .. fleet)
        map.exercise.selectFleet(fleet)
        stepLabel:setStepLabelContent("5-8.检测所有状态正常")
        mSleep(500)
        local res = map.exercise.isReadyBattlePageShipStatusAllRignt()
        if (not res) then
          map.exercise.clickReadyBattlePageQuickSupplyBtn()
          stepLabel:setStepLabelContent("5-9.等待快速补给界面")
          state = setOnceListener({
            { quickSupplyModal = map.exercise.isQuickSupplyModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePage = map.exercise.isReadyBattlePage },
              { quickSupplyModal = map.exercise.isQuickSupplyModal },
            })
          end
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "quickSupplyModal") then

        stepLabel:setStepLabelContent("5-10.快速补给界面")
        stepLabel:setStepLabelContent("5-11.快速补给界面点击确定")
        map.exercise.clickReadyBattlePageQuickSupplyModalOkBtn()
        stepLabel:setStepLabelContent("5-12等待出征准备界面")
        quickSupplyCount = quickSupplyCount + 1
        if (quickSupplyCount < 3) then
          state = setOnceListener({
            { readyBattlePage2 = map.exercise.isReadyBattlePage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { quickSupplyModal = map.exercise.isQuickSupplyModal },
              { readyBattlePage2 = map.exercise.isReadyBattlePage },
            })
          end
        else
          stepLabel:setStepLabelContent("5-13.资源数量不足")
          state = "quickSupplyModalFail"
        end

      elseif (state == "quickSupplyModalFail") then

        stepLabel:setStepLabelContent("5-14.点击快速补给关闭")
        mSleep(100)
        map.exercise.clickQuickSupplyModalCloseBtn()
        mSleep(300)
        state = setOnceListener({
          { readyBattleFleetsCantBattle = map.exercise.isReadyBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickSupplyModalFail = map.exercise.isQuickSupplyModal },
            { readyBattleFleetsCantBattle = map.exercise.isReadyBattlePage },
          })
        end

      elseif (state == "readyBattlePage2") then

        stepLabel:setStepLabelContent("5-15.检测血量是否安全")
        mSleep(500)
        local res = map.exercise.isReadyBattlePageShipHPSafe()
        if (not res) then
          state = "readyBattlePageCheckHp"
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "readyBattlePageCheckHp") then

        if (quickRepair) then
          -- 如果快速修理
          stepLabel:setStepLabelContent("5-16.点击快速修理按钮")
          map.exercise.clickQuickRepairBtn()
          stepLabel:setStepLabelContent("5-17.等待快速修理界面")
          state = setOnceListener({
            { quickRepairModal = map.exercise.isQuickRepairModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePageCheckHp = map.exercise.isReadyBattlePage },
              { quickRepairModal = map.exercise.isQuickRepairModal },
            })
          end
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "quickRepairModal") then

        stepLabel:setStepLabelContent("5-18.点击快速修理确定")
        map.exercise.clickQuickRepairModalOkBtn()
        quickRepairCount = quickRepairCount + 1
        stepLabel:setStepLabelContent("5-19.等待出征准备界面")
        if (quickRepairCount < 3) then
          state = setOnceListener({
            { readyBattlePageCheckCanBattle = map.exercise.isReadyBattlePage },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { quickRepairModal = map.exercise.isQuickRepairModal },
              { readyBattlePageCheckCanBattle = map.exercise.isReadyBattlePage },
            })
          end
        else
          stepLabel:setStepLabelContent("5-20.快速修理数量不足")
          state = "quickRepairModalFail"
        end

      elseif (state == "quickRepairModalFail") then

        stepLabel:setStepLabelContent("5-21.点击快速修理关闭")
        mSleep(100)
        map.exercise.clickQuickRepairModalCloseBtn()
        mSleep(300)
        state = setOnceListener({
          { readyBattleFleetsCantBattle = map.exercise.isReadyBattlePage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { quickRepairModalFail = map.exercise.isQuickRepairModal },
            { readyBattleFleetsCantBattle = map.exercise.isReadyBattlePage },
          })
        end

      elseif (state == "readyBattlePage4") then

        stepLabel:setStepLabelContent("5-22.再次检测血量是否安全")
        mSleep(500)
        local res = map.exercise.isReadyBattlePageShipHPSafe()
        if (not res) then
          state = "readyBattleFleetsCantBattle"
        else
          state = "readyBattlePageCheckCanBattle"
        end

      elseif (state == "readyBattlePageCheckCanBattle") then

        stepLabel:setStepLabelContent("5-23.检测舰队可以出征")
        mSleep(500)
        local fleetCanBattle = map.exercise.isFleetsCanBattle()
        if (not fleetCanBattle) then
          state = "readyBattleFleetsCantBattle"
        else
          stepLabel:setStepLabelContent("5-24.等待出征准备界面，...")
          state = setOnceListener({
            { readyBattlePageCanBattle = map.exercise.isReadyBattlePage },
            { battleStartPage = map.exercise.isBattleStartPage },
            { formationPage = map.exercise.isFormationPage },
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
            { medalModal = map.home.isMedalModal },
          }, 2000)
          if (state == 0) then
            state = setOnceListener({
              { readyBattlePageCheckCanBattle = map.exercise.isReadyBattlePage },
              { readyBattlePageCanBattle = map.exercise.isReadyBattlePage },
              { battleStartPage = map.exercise.isBattleStartPage },
              { formationPage = map.exercise.isFormationPage },
              { pursueModal = map.exercise.isPursueModal },
              { victoryPage = map.exercise.isVictoryPage },
              { medalModal = map.home.isMedalModal },
              { isHome2 = map.home.isHome },
            })
          end
        end

      elseif (state == "readyBattlePageCanBattle") then

        stepLabel:setStepLabelContent("5-25.出征准备界面")
        stepLabel:setStepLabelContent("5-26.点击出征开始")
        mSleep(100)
        map.exercise.clickBattleStartBtn()
        state = "startBattle"

      elseif (state == "startBattle") then

        stepLabel:setStepLabelContent("5-27.等待开始面板，阵型面板，追击面板，勋章对话框，home，胜利界面")
        state = setOnceListener({
          { battleStartPage = map.exercise.isBattleStartPage },
          { formationPage = map.exercise.isFormationPage },
          { pursueModal = map.exercise.isPursueModal },
          { victoryPage = map.exercise.isVictoryPage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { readyBattlePageCheckCanBattle = map.exercise.isReadyBattlePage },
            { battleStartPage = map.exercise.isBattleStartPage },
            { formationPage = map.exercise.isFormationPage },
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "battleStartPage") then

        stepLabel:setStepLabelContent("5-28.开始面板，点击开始")
        mSleep(100)
        map.exercise.clickBattleStartModalStartBtn()
        stepLabel:setStepLabelContent("5-29.等待阵型面板，追击面板，胜利界面")
        state = setOnceListener({
          { formationPage = map.exercise.isFormationPage },
          { pursueModal = map.exercise.isPursueModal },
          { victoryPage = map.exercise.isVictoryPage },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { battleStartPage = map.exercise.isBattleStartPage },
            { formationPage = map.exercise.isFormationPage },
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
          })
        end

      elseif (state == "formationPage") then

        stepLabel:setStepLabelContent("5-30.阵型面板")
        mSleep(100)
        map.exercise.clickFormationPageStartBtn()
        stepLabel:setStepLabelContent("5-31.等待追击面板，胜利界面")
        state = setOnceListener({
          { pursueModal = map.exercise.isPursueModal },
          { victoryPage = map.exercise.isVictoryPage },
          { victoryPageNext = map.exercise.isVictoryPage2 },
          { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { formationPage = map.exercise.isFormationPage },
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
          })
        end

      elseif (state == "pursueModal") then

        stepLabel:setStepLabelContent("5-32.追击面板")
        mSleep(100)
        if (pursue) then
          stepLabel:setStepLabelContent("5-33.追击")
          map.exercise.clickPursueModalOk()
        else
          stepLabel:setStepLabelContent("5-34.放弃追击")
          map.exercise.clickPursuePageCancel()
        end
        stepLabel:setStepLabelContent("5-35.等待胜利界面")
        state = setOnceListener({
          { victoryPage = map.exercise.isVictoryPage },
          { victoryPageNext = map.exercise.isVictoryPage2 },
          { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { pursueModal = map.exercise.isPursueModal },
            { victoryPage = map.exercise.isVictoryPage },
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "victoryPage") then

        mSleep(1000)
        stepLabel:setStepLabelContent("5-36.胜利界面检测HP是否安全")
        mSleep(300)
        HPIsSafe = map.exercise.isVictoryPageShipHPSafe()
        if (HPIsSafe) then
          stepLabel:setStepLabelContent("5-37.HP安全")
        else
          stepLabel:setStepLabelContent("5-38.HP不安全")
        end
        mSleep(200)
        stepLabel:setStepLabelContent("5-39.点击胜利继续")
        mSleep(200)
        map.exercise.clickVictoryPageContinueBtn()
        stepLabel:setStepLabelContent("5-40.等待胜利继续界面")
        state = setOnceListener({
          { victoryPageNext = map.exercise.isVictoryPage2 },
          { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPage = map.exercise.isVictoryPage },
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "victoryPageNext") then

        stepLabel:setStepLabelContent("5-41.点击胜利继续")
        map.exercise.clickVictoryPageContinueBtn2()
        stepLabel:setStepLabelContent("5-42.等待演习界面")
        state = setOnceListener({
          { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { victoryOpponentDetailPage = map.exercise.isVictoryOpponentDetailPage },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "victoryOpponentDetailPage") then
        stepLabel:setStepLabelContent("5-41.点击关闭挑战")
        map.exercise.clickVictoryOpponentDetailPageClose()
        stepLabel:setStepLabelContent("5-42.等待勋章对话框，home")
        state = setOnceListener({
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
          isHome2 = map.home.isHome
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { victoryPageNext = map.exercise.isVictoryPage2 },
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "exercisePage2") then

        stepLabel:setStepLabelContent("5-43.点击回港")
        map.exercise.clickBackToHomeBtn()
        stepLabel:setStepLabelContent("5-44.等待勋章对话框，home")
        state = setOnceListener({
          { medalModal = map.home.isMedalModal },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { exercisePage2 = map.exercise.isExercisePage },
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "readyBattleFleetsCantBattle") then

        stepLabel:setStepLabelContent("5-45.舰队无法继续战斗")
        map.exercise.clickReadyBattlePageBackBtn()
        stepLabel:setStepLabelContent("5-46.等待出征界面")
        state = setOnceListener({
          { exercisePage2 = map.exercise.isExercisePage },
          { medalModal = map.home.isMedalModal },
          { isHome2 = map.home.isHome },
        })

      elseif (state == "medalModal") then

        stepLabel:setStepLabelContent("5-48.勋章取消")
        map.home.clickMedalModalCancelBtn()
        state = setOnceListener({
          { isHome2 = map.home.isHome },
        }, 2000)
        if (state == 0) then
          state = setOnceListener({
            { medalModal = map.home.isMedalModal },
            { isHome2 = map.home.isHome },
          })
        end

      elseif (state == "isHome2") then

        stepLabel:setStepLabelContent("5-49.演习结束")
        state = 0
        return true, HPIsSafe
      end
    end
  end

  -- 演习
  return gomission
end
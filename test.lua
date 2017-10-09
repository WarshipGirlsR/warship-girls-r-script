for i = 1, 1000000 do
  local id = fwGetPressedButton()
  nLog(i)
  nLog(id)
  mSleep(200)
end

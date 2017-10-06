function multiColor(array, s)
  s = s or 90
  s = math.floor(0xff * (100 - s) * 0.01)
  keepScreen(true)
  for var = 1, #array do
    local lr, lg, lb = getColorRGB(array[var][1], array[var][2])
    local r = math.floor(array[var][3] / 0x10000)
    local g = math.floor(array[var][3] % 0x10000 / 0x100)
    local b = math.floor(array[var][3] % 0x100)
    if math.abs(lr - r) > s or math.abs(lg - g) > s or math.abs(lb - b) > s then
      keepScreen(false)
      return false
    end
  end
  keepScreen(false)
  return true
end
for i = 1, 1000000 do
  keepScreen(true)
  nLog(i)
  nLog(multiColor({ { 1, 1, 0 }, { 2, 1, 0 } }) and 'true' or 'false')
  nLog(multiColor({ { 1, 2, 0 }, { 2, 2, 0 } }) and 'true' or 'false')
  nLog(multiColor({ { 1, 3, 0 }, { 2, 3, 0 } }) and 'true' or 'false')
  nLog(multiColor({ { 1, 4, 0 }, { 2, 4, 0 } }) and 'true' or 'false')
  nLog(multiColor({ { 1, 5, 0 }, { 2, 5, 0 } }) and 'true' or 'false')
  nLog(multiColor({ { 1, 6, 0 }, { 2, 6, 0 } }) and 'true' or 'false')
  nLog(multiColor({ { 1, 7, 0 }, { 2, 7, 0 } }) and 'true' or 'false')
  keepScreen(false)
  mSleep(200)
end

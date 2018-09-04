multiColorS = multiColorS or function(array, s)
  s = s or 90
  local theS = math.floor(0xff * (100 - s) * 0.01)

  local __keepScreenState = keepScreenState
  if not __keepScreenState then keepScreen(true) end

  local result = true
  for var = 1, #array do
    local lr, lg, lb = getColorRGB(array[var][1], array[var][2])
    local r = math.floor(array[var][3] / 0x10000)
    local g = math.floor(array[var][3] % 0x10000 / 0x100)
    local b = math.floor(array[var][3] % 0x100)
    if math.abs(lr - r) > theS or math.abs(lg - g) > theS or math.abs(lb - b) > theS then
      result = false
      break
    end
  end

  if not __keepScreenState then keepScreen(false) end
  return result
end

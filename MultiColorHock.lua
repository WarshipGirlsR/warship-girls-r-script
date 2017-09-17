require 'KeepScreenHock'

multiColorS = multiColorS or function(array, s)
  s = s or 90

  local __keepScreenState = keepScreenState
  if not __keepScreenState then keepScreen(true) end

  local result = true
  for var = 1, #array do
    local lr, lg, lb = getColorRGB(array[var][1], array[var][2])
    local r = math.floor(array[var][3] / 0x10000)
    local g = math.floor(array[var][3] % 0x10000 / 0x100)
    local b = math.floor(array[var][3] % 0x100)
    if math.abs(lr - r) > s or math.abs(lg - g) > s or math.abs(lb - b) > s then
      result = false
      break
    end
  end

  if not __keepScreenState then keepScreen(false) end
  return result
end

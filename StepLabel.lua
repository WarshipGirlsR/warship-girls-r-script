local StepLable = {
  originText = '',
  text = '',
  labelId = '',
  prefix = '',
}

local fontSize = 16
local tsver = getTSVer(); --获取触动精灵引擎版本
local tsint = tonumber(string.sub(tsver, 1, 1) .. string.sub(tsver, 3, 3) .. string.sub(tsver, 5, 5));
--转化为数字版本号
if tsint >= 225 then
  fontSize = 7
end

fwShowWnd('steplabel', 300, 50, 300, 100, 0)

StepLable.init = function(labelId)
  StepLable.labelId = labelId
  return StepLable
end

StepLable.setPrefix = function(prefix)
  StepLable.prefix = prefix
  local finalText = StepLable.prefix .. StepLable.text
  fwShowButton('steplabel', StepLable.labelId, finalText, '90333333', '90FFFFFF', '', fontSize, 0, 0, 300, 100)
  return StepLable
end

StepLable.setStepLabelContent = function(text, noNLog)
  StepLable.originText = text
  if ((type(runCount) == 'number') or (type(runCode) == 'string')) then
    text = tostring(runCount) .. '.. ' .. text
  end
  StepLable.text = text
  local finalText = StepLable.prefix .. text
  fwShowButton('steplabel', StepLable.labelId, finalText, '90333333', '90FFFFFF', '', fontSize, 0, 0, 300, 100)
  local dateStr = os.date('%Y-%m-%d %X')
  if (not noNLog) then
    wLog('warship-girls-r-script', '[DATE] ' .. finalText);
  end
  if useNlog then
    nLog(dateStr .. ' ' .. finalText)
  end
end


StepLable.getText = function()
  return StepLable.originText
end

return StepLable
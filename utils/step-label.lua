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
if tsint >= 170 then
  fontSize = 7
end

if tsint < 230 then
  fwShowWnd('steplabel', 650, 50, 300, 100, 0)
else
  fwShowWnd('steplabel', 650, 50, 950, 150, 0)
end

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
  fwShowButton('steplabel', StepLable.labelId, finalText, '90333333', '90FFFFFF', '', 7, 0, 0, 300, 100)
  local dateStr = os.date('%Y-%m-%d %X')
  if not noNLog then
    local info = debug.getinfo(2, 'Sl')
    local lineInfo = ''
    if info.currentline then
      lineInfo = info.source .. ': ' .. info.currentline .. ': '
    end
    wLog('azur_lane', '[DATE] ' .. lineInfo .. finalText);
  end
  if useNlog then
    local info = debug.getinfo(2, 'Sl')
    local lineInfo = ''
    if info.currentline then
      lineInfo = info.source .. ': ' .. info.currentline .. ':\n'
    end
    nLog(lineInfo .. dateStr .. ' ' .. finalText .. '\n')
  end
end


StepLable.getText = function()
  return StepLable.originText
end

return StepLable

local StepLable = {
  originText = "",
  text = "",
}
fwShowWnd("steplabel", 300, 50, 300, 100, 0)

StepLable.setStepLabelContent = function(text, noNLog)
  StepLable.originText = text
  if ((type(runCount) == "number") or (type(runCode) == "string")) then
    text = tostring(runCount) .. ".. " .. text
  end
  StepLable.text = text
  fwShowButton("steplabel", "stopbtn", text, "90333333", "90FFFFFF", "", 7, 0, 0, 300, 100)
  if (not noNLog) then
    local dateStr = os.date("%Y-%m-%d %X")
    wLog("warship-girls-r-script", "[DATE] " .. text);
    nLog(dateStr .. " " .. text)
  end
end

StepLable.getText = function()
  return StepLable.originText
end

return StepLable
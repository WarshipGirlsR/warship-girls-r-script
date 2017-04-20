return (function()
  local StepLable = {
    originText = "",
    text = "",
  }
  fwShowWnd("steplabel", 300, 50, 300, 100, 0)

  function StepLable:setStepLabelContent(text, noNLog)
    self.originText = text
    if ((type(runCount) == "number") or (type(runCode) == "string")) then
      text = tostring(runCount) .. ".. " .. text
    end
    self.text = text
    fwShowButton("steplabel", "stopbtn", text, "90333333", "90FFFFFF", "", 28, 0, 0, 300, 100)
    if (not noNLog) then
      local dateStr = os.date("%Y-%m-%d %X")
      wLog("shipr1-1", "[DATE] " .. text);
      nLog(dateStr .. " " .. text)
    end
  end

  function StepLable:getText()
    return StepLable.originText
  end

  return StepLable
end)()
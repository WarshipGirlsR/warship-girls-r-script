local eq = require 'EventQuery'

local titleFileName = '/sdcard/.tsnotificationt.txt'
local textFileName = '/sdcard/.tsnotificationb.txt'

function sendToTasker(title, text)
  if not title then
    title = ''
  end
  if not text then
    text = title
  end
  os.execute('rm -rf ' .. titleFileName)
  os.execute('rm -rf ' .. textFileName)
  local titleFile = io.open(titleFileName, 'w')
  if titleFile then
    io.output(titleFile)
    io.write(title)
    io.flush()
    io.close()
  end
  local textFile = io.open(textFileName, 'w')
  if textFile then
    io.output(textFile)
    io.write(text)
    io.flush()
    io.close()
  end
  if titleFile or textFile then
    os.execute("am broadcast -a net.dinglisch.android.tasker.ACTION_TASK --es task_name warship-girls-r")
  end

  eq.setTimeout(function()
    os.execute('rm -rf ' .. titleFileName)
    os.execute('rm -rf ' .. textFileName)
  end, 10000)
end

return sendToTasker

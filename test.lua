local file = io.open('/sdcard/.tsnotification.txt', 'w')
nLog(file)
if file then
  io.output(file)
  io.write('不能出征234')
  io.flush()
  io.close()
  os.execute("am broadcast -a net.dinglisch.android.tasker.ACTION_TASK --es task_name warship-girls-r")
end

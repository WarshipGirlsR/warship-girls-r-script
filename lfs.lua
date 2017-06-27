local lfs = {}

lfs.dir = function(path)
  local res = io.popen('ls ' .. path);
  local text = {};
  for line in res:lines() do
    table.insert(text, line)
  end
  return text
end

lfs.rm = function(path)
  local res = io.popen('rm ' .. path);
  local text = {};
  for line in res:lines() do
    table.insert(text, line)
  end
  local res = table.concat(text, '\n')
  return res
end

lfs.rmdir = function(path)
  local res = io.popen('rm -rf' .. path);
  local text = {};
  for line in res:lines() do
    table.insert(text, line)
  end
  local res = table.concat(text, '\n')
  return res
end

return lfs
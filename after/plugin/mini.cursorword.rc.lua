local status, cs = pcall(require, "mini.cursorword")
if (not status) then
  print("mini.cursorword not installed")
  return
end

cs.setup()

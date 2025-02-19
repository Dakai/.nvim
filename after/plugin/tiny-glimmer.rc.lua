local status, tiny = pcall(require, "tiny-glimmer")
if (not status) then
  print("tiny-glimmer not installed")
  return
end


tiny.setup({
  transparency_color = "#1e1d32",
  animations = {
    fade = {
      from_color = "#74f2f1",
      to_color = "#1e1d32",
    },
    --bounce = {
    --  from_color = "#ff0000",
    --  to_color = "#00ff00",
    --},
  },
})

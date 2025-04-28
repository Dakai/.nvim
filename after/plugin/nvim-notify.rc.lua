local status, notify = pcall(require, "notify")
if not status then
  return
end

notify.setup({
  -- background_colour = "#000000",
  background_colour = "#100E23",
  top_down = false, -- Notifications start at the bottom to stay out of your way.
})

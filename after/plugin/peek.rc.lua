local status, peek = pcall(require, "peek")
if not status then
  return
end

peek.setup({
  auto_load = true,
  theme = 'light',
  app = 'browser', -- 'webview', 'browser', string or a table of strings
})

local status, peek = pcall(require, "peek")
if not status then
  return
end

peek.setup({
  theme = 'light',
  app = 'browser', -- 'webview', 'browser', string or a table of strings
})

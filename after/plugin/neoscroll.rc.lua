local status, ns = pcall(require, "neoscroll")
if not status then
  return
end

ns.setup({

  pre_hook = function()
    vim.opt.eventignore:append({
      'WinScrolled',
      'CursorMoved',
    })
  end,
  post_hook = function()
    vim.opt.eventignore:remove({
      'WinScrolled',
      'CursorMoved',
    })
  end,
})

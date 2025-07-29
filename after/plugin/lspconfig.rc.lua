-- Neovim 0.11 changes
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = '⚠ ',
      [vim.diagnostic.severity.INFO] = ' ',
      [vim.diagnostic.severity.HINT] = ' ',
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
})

vim.diagnostic.config({ virtual_text = true })


vim.keymap.set("n", "<Space>f", function()
  -- If we find a floating window, close it.
  local found_float = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.api.nvim_win_get_config(win).relative ~= "" then
      vim.api.nvim_win_close(win, true)
      found_float = true
    end
  end

  if found_float then
    return
  end

  vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
end, { desc = "Toggle Diagnostics" })

-- nvim_lsp.jedi_language_server.setup {}

-- how to add customer server
-- local configs = require 'lspconfig.configs'
-- if not configs.noir_lsp then
--   configs.noir_lsp = {
--     default_config = {
--       cmd = { 'nargo', 'lsp' },
--       root_dir = lspconfig.util.root_pattern('.git'),
--       filetypes = { 'noir' },
--     },
--   }
-- end

-- hack for svelte-language-server watcher doesn't work in neovim lspconfig #2008
-- https://github.com/sveltejs/language-tools/issues/2008

-- nvim_lsp.svelte.setup {
--   filetypes = { "svelte" },
--   on_attach = function(client, bufnr)
--     if client.name == 'svelte' then
--       vim.api.nvim_create_autocmd("BufWritePost", {
--         pattern = { "*.js", "*.ts", "*.svelte" },
--         callback = function(ctx)
--           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
--         end,
--       })
--     end
--     if vim.bo[bufnr].filetype == "svelte" then
--       vim.api.nvim_create_autocmd("BufWritePost", {
--         pattern = { "*.js", "*.ts", "*.svelte" },
--         callback = function(ctx)
--           client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
--         end,
--       })
--     end
--   end
-- }

-- local function on_attach(on_attach)
--   vim.api.nvim_create_autocmd("LspAttach", {
--     callback = function(args)
--       local buffer = args.buf
--       local client = vim.lsp.get_client_by_id(args.data.client_id)
--       on_attach(client, buffer)
--     end,
--   })
-- end
--
-- on_attach(function(client)
--   vim.api.nvim_create_autocmd("BufWritePost", {
--     pattern = { "*.js", "*.ts" },
--     callback = function(ctx)
--       if client.name == "svelte" then
--         client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
--       end
--     end,
--   })
-- end)
-- -- hack end

--nvim_lsp.svelte.setup {
--  filetypes = { "svelte" },
--  on_attach = function(client, bufnr)
--    if vim.bo[bufnr].filetype == "svelte" then
--      vim.api.nvim_create_autocmd("BufWritePost", {
--        command = "LspRestart svelte",
--      })
--    end
--  end
--}

--nvim_lsp.tailwindcss.setup {
--  filetypes = { "markdown" },
--  on_attach = function(client, bufnr)
--    if vim.bo[bufnr].filetype == "markdown" then
--      client.stop()
--    end
--    if vim.bo[bufnr].filetype == "markdown" then
--      client.stop()
--    end
--  end
--}

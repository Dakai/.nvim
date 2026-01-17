-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Save File
vim.keymap.set("n", "<leader>a", "<cmd>w<cr>", { desc = "Save file" })

-- From https://www.reddit.com/r/neovim/comments/13y3thq/whats_a_very_simple_config_change_that_you_cant/
-- Remap y to ygv<esc> in visual mode so the cursor does not jump back to where you started the selection.
-- vnoremap y ygv<esc>
vim.api.nvim_set_keymap("v", "y", "ygv<esc>", { noremap = true })

vim.api.nvim_set_keymap("n", "<A-BS>", "bved", { desc = "Atl+BS delete entire word" })

vim.api.nvim_set_keymap(
  "n",
  "<cr>",
  "ciw",
  { desc = "Enter in normal mode to delete entire word and into insert mode" }
)

-- Map gt to next buffer or gT directly to certain buffer
vim.keymap.set("n", "gt", function()
  return ("<Plug>(cokeline-focus-%s)"):format(vim.v.count > 0 and vim.v.count or "next")
end, { silent = true, expr = true })

vim.keymap.set("n", "gT", function()
  return ("<Plug>(cokeline-focus-%s)"):format(vim.v.count > 0 and vim.v.count or "prev")
end, { silent = true, expr = true })

-- move highlighted text up and down"
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.o.lazyredraw = false
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

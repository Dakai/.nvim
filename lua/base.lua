local vg = vim.g
local vb = vim.bo
local vw = vim.wo
local vo = vim.opt

-- Speed up loading Lua modules in Neovim to improve startup time.
vim.loader.enable()
-- disable netrw at the very start of your init.lua per nvim-tree/nvim-tree.lua
vg.loaded_netrw = 1
vg.loaded_netrwPlugin = 1


-- remove all previously defined autocmds and start with a clean slate
vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vo.encoding = 'utf-8'
vo.fileencoding = 'utf-8'

-- enables line numbering only for the current window
vo.number = true
vo.title = true

-- Neovim will automatically add spaces or tabs to new lines to match the existing indentation level
vo.autoindent = true
-- highlight all matching search patterns
vo.hlsearch = true
vo.backup = false
vo.showcmd = true
vo.cmdheight = 1

-- individual status line for split window
vo.laststatus = 2
-- space is used instead of real tab
vo.expandtab = true
-- Minimal number of screen lines to keep above and below the cursor.
vo.scrolloff = 10

vo.shell = 'zsh'
vo.backupskip = { "*.bak", "*/tmp/*" }
-- incremental search in split window
vo.inccommand = 'split'
-- ignore case when searching for a pattern
vo.ignorecase = true
-- Vim will automatically use a mix of spaces and tabs for indentation, depending on the current context.
vo.smarttab = true
-- Show a visual indication of wrapped lines in Vim
vo.breakindent = true
-- set the number of spaces to be used for each level of indentation
vo.shiftwidth = 2
vo.tabstop = 2
-- Auto indent
vo.ai = true
-- Smart indent
vo.si = true
-- No wrap lines
vo.wrap = false
-- vo.backspace = 'start,eol,indent'
vo.path:append { '**' } -- Finding files - Search down into subfolders
vo.wildignore:append { '*/node_modules/*' }
vo.textwidth = 120      -- Total allowed width on the screen
vo.smoothscroll = true  -- Smoother scrolling

-- Undercurl
-- "\e[4:3m" is an ANSI escape sequence for underlining text with a 1-pixel thick line
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})
-- Add asterisks in block comments
vo.formatoptions:append { 'r' }

--"remove trailing on save
--vim.cmd([[
--  augroup TrimWhitespace
--    autocmd!
--    autocmd BufWritePre * %s/\s\+$//e
--  augroup END
--]])

-- Enable 'splitright' option
vo.splitright = true

-- vo.conceallevel = 3
-- Neorg setup
vo.conceallevel = 3

-- Recommended Neovoions for avante.nvim:
-- views can only be fully collapsed with the global statusline
vo.laststatus = 3

--vw.colorcolumn = "80,120" -- Make a ruler at 80px and 120px
vw.colorcolumn = "80"    -- Make a ruler at 80px
vw.numberwidth = 2       -- Make the line number column thinner
vw.signcolumn = "yes"    -- Show information next to the line numbers
vw.wrap = false          -- Do not display text over multiple lines
vw.relativenumber = true -- Display relative line number

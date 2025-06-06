local status, ts = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

ts.setup({
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" },
  },
  ensure_installed = {
    "markdown",
    "markdown_inline",
    "tsx",
    "typescript",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    -- "swift",
    "css",
    "html",
    "lua",
    "python",
    "javascript",
    "svelte",
    "cpp",
    "latex"
  },
  --autotag = {
  --  enable = true,
  --},
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  --refactor = {
  --  highlight_definitions = {
  --    enable = true,
  --    -- Set to false if you have an `updatetime` of ~100.
  --    clear_on_cursor_move = true,
  --  },
  --  -- highlight_current_scope = { enable = true },

  --},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

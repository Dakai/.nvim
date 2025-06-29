local status, format_on_save = pcall(require, "format-on-save")
if (not status) then
  print("format_on_save not installed")
  return
end
-- if (not status) then return end
local formatters = require("format-on-save.formatters")

format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    ".local/share/nvim/lazy",
  },
  formatter_by_ft = {
    -- php = formatter.lsp,
    --css = formatters.lsp,
    --html = formatters.lsp,
    --java = formatters.lsp,
    --svelte = {
    --  formatters.if_file_exists({
    --    pattern = ".eslintrc.*",
    --    formatter = formatters.eslint_d_fix
    --  }),
    --  formatters.if_file_exists({
    --    pattern = { ".prettierrc", ".prettierrc.*", "prettier.config.*" },
    --    formatter = formatters.prettierd,
    --  }),
    --  --formatters.lsp
    --},
    ---- javascript = formatters.lsp,
    ---- typescript = formatters.lsp,
    --svelte = formatters.lsp,
    svelte = formatters.prettierd,
    --json = formatters.lsp,
    --lua = formatters.lsp,
    python = formatters.black,
    -- python = formatters.shell({ cmd = { "black", "%" } }),
    --markdown = formatters.prettierd,
    --md = formatters.prettierd,
    --javascript = formatters.prettierd,
    --openscad = formatters.lsp,
    -- python = formatters.lsp,
    --rust = formatters.lsp,
    --scad = formatters.lsp,
    --scss = formatters.lsp,
    --sh = formatters.lsp,
    --terraform = formatters.lsp,
    --typescript = formatters.prettierd,
    --typescriptreact = formatters.prettierd,
    ---- yaml = formatters.lsp,
    ---- Optional: fallback formatter to use when no formatters match the current filetype
    fallback_formatter = {
      formatters.remove_trailing_whitespace,
      formatters.remove_trailing_newlines,
      formatters.prettierd,
    }
  },
  -- run_with_sh = false,
})

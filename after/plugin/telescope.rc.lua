local status, telescope = pcall(require, "telescope")
if not status then
  return
end
-- local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
  extensions = {
    repo = {
      list = {
        fd_opts = { "--no-ignore-vcs" },
        search_dirs = { "~/repos", "~/Apps", './' },

      }
    }
  }
})
telescope.load_extension('repo')
--local function telescope_buffer_dir()
--  return vim.fn.expand("%:p:h")
--end

-- local fb_actions = require("telescope").extensions.file_browser.actions

---telescope.setup({
---  defaults = {
---    mappings = {
---      n = {
---        ["q"] = actions.close,
---      },
---    },
---  },
---  extensions = {
---    file_browser = {
---      theme = "dropdown",
---      -- disables netrw and use telescope-file-browser in its place
---      hijack_netrw = true,
---      mappings = {
---        -- your custom insert mode mappings
---        ["i"] = {
---          ["<C-w>"] = function()
---            vim.cmd("normal vbd")
---          end,
---        },
---        ["n"] = {
---          -- your custom normal mode mappings
---          ["N"] = fb_actions.create,
---          ["h"] = fb_actions.goto_parent_dir,
---          ["/"] = function()
---            vim.cmd("startinsert")
---          end,
---        },
---      },
---    },
---  },
---})
---
---telescope.load_extension("file_browser")

vim.keymap.set(
  "n",
  "<Space>s", function()
    require('telescope').extensions.smart_open.smart_open()
  end,
  { noremap = true, silent = true }
)

--vim.keymap.set("n", ";f", function()
--  builtin.find_files({
--    respect_gitignore = false,
--    no_ignore = true,
--    hidden = true,
--    file_ignore_patterns = {
--      "node_modules",
--      ".git",
--      ".next",
--      ".lock",
--      "package-lock.json",
--      ".jpg",
--      "jpeg",
--      "png",
--      "PNG",
--      "JPEG",
--      "JPG"
--    },
--  })
--end)

vim.keymap.set(
  "n",
  "<Space>t", function()
    require('telescope').extensions.smart_open.smart_open {
      -- current working directory
      cwd_only = true
    }
  end,
  { noremap = true, silent = true }
)
vim.keymap.set("n", "<Space>g", function()
  builtin.live_grep({
    respect_gitignore = false,
    no_ignore = false,
    hidden = false,
    file_ignore_patterns = {
      "node_modules/",
      ".git",
      ".next",
      ".lock",
      ".lockb",
      "package-lock.json",
      ".jpg",
      "jpeg",
      "png",
      "PNG",
      "JPEG",
      "JPG",
      'venv',
      'venv/',
      'build/',
      ".svelte-kit/",
      "vite_cache/"
    },
  })
end)

vim.keymap.set("n", "<Space>b", function()
  builtin.buffers()
end)
vim.keymap.set("n", "<Space>h", function()
  builtin.help_tags()
end)
vim.keymap.set("n", "<Space>r", function()
  builtin.resume()
end)
vim.keymap.set("n", "<Space>e", function()
  builtin.diagnostics()
end)
-- Show Todos
vim.keymap.set("n", "<space>d", ":TodoTelescope<Return>", { silent = true })
-- repo list
vim.keymap.set("n", "<space>p", ":Telescope repo list<Return>", { silent = true })

--vim.keymap.set("n", "sf", function()
--  telescope.extensions.file_browser.file_browser({
--    path = "%:p:h",
--    cwd = telescope_buffer_dir(),
--    respect_gitignore = false,
--    hidden = true,
--    grouped = true,
--    previewer = false,
--    initial_mode = "normal",
--    layout_config = { height = 40 },
--  })
--end)

-- vim.keymap.set("n", ";r", function()
--   builtin.live_grep()
-- end)
-- vim.keymap.set("n", "\\\\", function()
--   builtin.buffers()
-- end)
-- vim.keymap.set("n", ";h", function()
--   builtin.help_tags()
-- end)
-- vim.keymap.set("n", ";;", function()
--   builtin.resume()
-- end)
-- vim.keymap.set("n", ";e", function()
--   builtin.diagnostics()
-- end)


-- prevent insert mode when open file from telescope
-- https://github.com/nvim-telescope/telescope.nvim/issues/2027#issuecomment-1561836585
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

-- Error when opening files through telescope from nvim tree #7952
-- https://github.com/nvim-treesitter/nvim-treesitter/issues/7952
local actions = require("telescope.actions")

local open_after_tree = function(prompt_bufnr)
  vim.defer_fn(function()
    actions.select_default(prompt_bufnr)
  end, 100) -- Delay allows filetype and plugins to settle before opening
end

require("telescope").setup({
  defaults = {
    mappings = {
      i = { ["<CR>"] = open_after_tree },
      n = { ["<CR>"] = open_after_tree },
    },
  },
})

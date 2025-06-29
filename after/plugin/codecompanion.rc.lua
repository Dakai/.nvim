-- disabled in plugins.lua
local status, code = pcall(require, "codecompanion")
if (not status) then
  print("codecompanion not installed")
  return
end

local VERCEL_GEMINI_API_PATH = os.getenv("VERCEL_GEMINI_API_PATH")
local GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")

code.setup({
  strategies = {
    chat = {
      adapter = 'gemini'
    },
    inline = {
      adapter = 'gemini'
    },
    cmd = {
      adapter = 'gemini'
    }
  },
  adapter = {
    gemini = function()
      return require("codecompanion.adapter").extend('gemini', {
        env = {
          api_key = GEMINI_API_KEY,
          url = VERCEL_GEMINI_API_PATH
        },
        schema = {
          model = {
            default = 'gemini-2.0-flash'
          }
        }
      })
    end
  }
})

vim.api.nvim_set_keymap("n", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>ae", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true }) -- Inline
vim.api.nvim_set_keymap("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])

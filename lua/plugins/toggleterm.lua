return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = { --[[ things you want to change go here]]
    },
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        direction = "horizontal",
        hide_numbers = true, -- hide the number column in toggleterm buffers
        autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
        persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
        close_on_exit = true, -- close the terminal window when the process exits
        auto_scroll = true, -- automatically scroll to the bottom on terminal output
      })
    end,
  },
}

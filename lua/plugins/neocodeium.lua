return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require("neocodeium")
      neocodeium.setup()
      vim.keymap.set("i", "<M-l>", function()
        require("neocodeium").accept()
      end)
      vim.keymap.set("i", "<M-j>", function()
        require("neocodeium").cycle(1)
      end)
      vim.keymap.set("i", "<M-k>", function()
        require("neocodeium").cycle(-1)
      end)
      --vim.keymap.set("i", "<M-l>", neocodeium.accept)
      --vim.keymap.set("i", "<M-j>", neocodeium.cycle(1))
      --vim.keymap.set("i", "<M-k>", neocodeium.cycle(-1))
    end,
  },
}

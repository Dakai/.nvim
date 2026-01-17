return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- show hidden (dot)files
            -- ignored = true, -- show gitignored files too (optional)
          },
          -- also enable hidden/ignored in fuzzy picker
          files = {
            hidden = true,
            -- ignored = true,
          },
        },
      },
    },
  },
}

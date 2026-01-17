-- local GEMINI2OPENAI_PROXY_API_PATH = os.getenv("GEMINI2OPENAI_PROXY_API_PATH")
-- local VERCEL_GEMINI_API_PATH = os.getenv("VERCEL_GEMINI_API_PATH")

--if not GEMINI2OPENAI_PROXY_API_PATH then
--  print("GEMINI2OPENAI_PROXY_API_PATH is not set")
--end
--
--if not VERCEL_GEMINI_API_PATH then
--  print("VERCEL_GEMINI_API_PATH is not set")
--end

return {
  {
    "yetone/avante.nvim",
    build = "make",
    version = false,
    event = "VeryLazy",
    ---@module 'avante'
    ---@type avante.Config
    opts = {
      provider = "nvidia",
      providers = {
        openrouter = {
          __inherited_from = "openai",
          endpoint = "https://openrouter.ai/api/v1",
          api_key_name = "OPENROUTER_API_KEY",
          model = "xiaomi/mimo-v2-flash:free",
        },
        nvidia = {
          __inherited_from = "openai",
          endpoint = "https://integrate.api.nvidia.com/v1",
          api_key_name = "NVIDIA_API_KEY",
          model = "z-ai/glm4.7",
        },
      },
      --acp_providers = {
      --  ["gemini-cli"] = {
      --    command = "gemini",
      --    args = { "--experimental-acp" },
      --    env = {
      --      NODE_NO_WARNINGS = "1",
      --      GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
      --    },
      --  },
      --provider = "openai", -- You can then change this provider here
      --provider = "gemini", -- You can then change this provider here
      --cursor_applying_provider = "gemini",
      --auto_suggestions_provider = "gemini",
      --memory_summary_provider = "gemini",
      --providers = {
      --  openai = {
      --    -- api_key_name = "OPENAI_API_KEY",
      --    endpoint = GEMINI2OPENAI_PROXY_API_PATH,
      --    timeout = 10000, -- Timeout in milliseconds
      --    api_key_name = "GEMINI_API_KEY",
      --    model = "gpt-4o-mini",
      --    extra_request_body = {
      --      temperature = 0,
      --    },
      --    max_tokens = 4096,
      --  },
      --  gemini = {
      --    endpoint = VERCEL_GEMINI_API_PATH,
      --    api_key_name = "GEMINI_API_KEY",
      --    timeout = 10000, -- Timeout in milliseconds
      --    -- model = "gemini-1.5-pro-latest",
      --    -- model = "gemini-exp-1206",
      --    --model = "gemini-2.5-flash-preview-04-17",
      --    model = "gemini-2.0-flash",
      --    temperature = 0,
      --    max_tokens = 4096,
      --  },
      --},
    },
    keys = {
      {
        "<leader>aa",
        function()
          require("avante.api").ask()
        end,
        desc = "avante: ask",
        mode = { "n", "v" },
      },
      {
        "<leader>ar",
        function()
          require("avante.api").refresh()
        end,
        desc = "avante: refresh",
      },
      {
        "<leader>ae",
        function()
          require("avante.api").edit()
        end,
        desc = "avante: edit",
        mode = "v",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      ---  "nvim-mini/mini.pick", -- for file_selector provider mini.pick
      "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "ibhagwan/fzf-lua", -- for file_selector provider fzf
      "stevearc/dressing.nvim", -- for input provider dressing
      "folke/snacks.nvim", -- for input provider snacks
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to setup it properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        --dependencies = {
        --  "nvim-treesitter/nvim-treesitter",
        --  "nvim-tree/nvim-web-devicons",
        --},
        --- @module 'render-markdown'
        --- @type render.md.UserConfig
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}

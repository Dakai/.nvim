local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local GEMINI2OPENAI_PROXY_API_PATH = os.getenv("GEMINI2OPENAI_PROXY_API_PATH")
local VERCEL_GEMINI_API_PATH = os.getenv("VERCEL_GEMINI_API_PATH")
if (not GEMINI2OPENAI_PROXY_API_PATH) then
  print("GEMINI2OPENAI_PROXY_API_PATH is not set")
end

if (not VERCEL_GEMINI_API_PATH) then
  print("VERCEL_GEMINI_API_PATH is not set")
end

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim....")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print("Done.")
end

vim.opt.rtp:prepend(lazypath)

-- https://yeripratama.com/blog/customizing-nvim-telescope/

local function highlight_telescope(hl, c)
  local prompt = c.bg
  hl.TelescopeNormal = {
    bg = c.bg,
    fg = c.fg,
  }
  hl.TelescopeBorder = {
    bg = c.bg,
    fg = c.bg,
  }
  hl.TelescopePromptNormal = {
    bg = prompt,
  }
  hl.TelescopePromptBorder = {
    bg = prompt,
    fg = prompt,
  }
  hl.TelescopePromptTitle = {
    bg = c.bg_highlight,
    fg = c.fg,
  }
  hl.TelescopePreviewTitle = {
    bg = c.bg,
    fg = c.bg,
  }
  hl.TelescopeResultsTitle = {
    bg = c.bg,
    fg = c.bg,
  }
  hl.NoiceCmdlinePopupBorder = {
    bg = c.bg,
    fg = c.bg,
  }
end

require("lazy").setup({
  { "xiyaowong/nvim-transparent" },
  {
    "gelguy/wilder.nvim",
    keys = { "/", "?", ":" },
    build = ":UpdateRemotePlugins"
  },
  --{
  --  "rebelot/kanagawa.nvim",
  --  config = function()
  --    vim.cmd("colorscheme kanagawa")
  --  end,
  --},
  --{
  --  "folke/tokyonight.nvim",
  --  lazy = false,
  --  priority = 1000,
  --  opts = {
  --    style = "day",
  --    light_style = "day",
  --    transparent = true,
  --  },
  --  config = function()
  --    vim.cmd("colorscheme tokyonight")
  --  end,
  --},
  --{
  --  "wnkz/monoglow.nvim",
  --  lgzy = false,
  --  priority = 1000,
  --  opts = {},
  --  config = function()
  --    vim.cmd("colorscheme monoglow-z")
  --  end,

  --},
  --{
  --  "embark-theme/vim",
  --  config = function()
  --    vim.cmd("colorscheme embark")
  --    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#777777' })
  --    vim.opt.cursorline = true
  --    vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#100e23' })
  --  end,
  --},
  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.cmd("colorscheme nightfox")
    end,
    -- opts = {
    --   on_highlights = function(hl, c)
    --     highlight_telescope(hl, c)
    --   end,
    -- },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    lazy = false,
    config = false,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- 'hrsh7th/cmp-nvim-lsp' ,
      'saghen/blink.cmp'
    },
  },
  {
    "williamboman/mason.nvim",
  },
  { "williamboman/mason-lspconfig.nvim" },

  -- Autocompletion
  --{ "hrsh7th/nvim-cmp" },
  --{ "hrsh7th/cmp-buffer" },
  --{ "hrsh7th/cmp-path" },
  --{ 'saadparwaiz1/cmp_luasnip' },
  --{ "hrsh7th/cmp-nvim-lsp" },
  --{ "hrsh7th/cmp-nvim-lua" },

  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*",
    dependencies = { "rafamadriz/friendly-snippets" },
    build = "make install_jsregexp"
    --config = function()
    --  require("luasnip.loaders.from_vscode").lazy_load()
    --end,
  },
  { "onsails/lspkind-nvim" },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  { "nvim-treesitter/nvim-treesitter" },
  { "windwp/nvim-ts-autotag" },
  { "windwp/nvim-autopairs" },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            -- prompt_position = "top",
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.5,
          },
        },
        -- sorting_strategy = "ascending",
      },
    },
  },
  -- {
  --   "nvim-telescope/telescope-file-browser.nvim",
  --   dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  -- },
  {
    "willothy/nvim-cokeline",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    'echasnovski/mini.indentscope',
    version = '*',
    config = function()
      require("mini.indentscope").setup()
    end,
  }
  ,
  --{
  --  "lukas-reineke/indent-blankline.nvim",
  --  main = "ibl",
  --  opts = {},
  --  config = function()
  --    require("ibl").setup()
  --  end,
  --},
  { "karb94/neoscroll.nvim" },
  -- {
  --   "Exafunction/codeium.vim",
  --   --commit = '289eb72',
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   event = 'BufEnter',
  --   config = function()
  --     --require("codeium").setup({
  --     --})
  --     vim.g.codeium_no_map_tab = 1
  --     vim.keymap.set("i", "<M-l>", function()
  --       return vim.fn["codeium#Accept"]()
  --     end, { expr = true })
  --     vim.keymap.set("i", "<M-i>", function()
  --       return vim.fn["codeium#CycleCompletions"](1)
  --     end, { expr = true })
  --     vim.keymap.set("i", "<M-k>", function()
  --       return vim.fn["codeium#CycleCompletions"](-1)
  --     end, { expr = true })
  --     vim.keymap.set("i", "<M-j>", function()
  --       return vim.fn["codeium#Complete"]()
  --     end, { expr = true })
  --   end,
  -- },
  -- add this to the file where you setup your other plugins:
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
  -- { 'davidosomething/format-ts-errors.nvim' },
  { "elentok/format-on-save.nvim", },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    "toppair/peek.nvim",
    event = { "VeryLazy" },
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup()
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  --{
  --  "iamcco/markdown-preview.nvim",
  --  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  --  build = "cd app && yarn install",
  --  init = function()
  --    vim.g.mkdp_filetypes = { "markdown" }
  --  end,
  --  ft = { "markdown" },
  --  config = function()
  --    vim.g.mkdp_auto_close = 0
  --  end,
  --},
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },
  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    config = function()
      require("telescope").load_extension("smart_open")
    end,
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  --{ 'nvim-treesitter/nvim-treesitter-context' },
  --{ 'RRethy/vim-illuminate' },
  -- {
  --   'echasnovski/mini.animate',
  --   version = '*',
  --   config = function()
  --     require('mini.animate').setup()
  --   end,
  -- },
  {
    "piersolenski/wtf.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    event = "VeryLazy",
    opts = {},
    keys = {
      {
        "gw",
        mode = { "n" },
        function()
          require("wtf").ai()
        end,
        desc = "Debug diagnostic with AI",
      },
      {
        mode = { "n" },
        "gW",
        function()
          require("wtf").search()
        end,
        desc = "Search diagnostic with Google",
      },
    },
  },
  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  -- },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
    },
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = { --[[ things you want to change go here]] },
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        direction = 'horizontal',
        hide_numbers = true,  -- hide the number column in toggleterm buffers
        autochdir = false,    -- when neovim changes it current directory the terminal will change it's own when next it's opened
        persist_mode = true,  -- if set to true (default) the previous terminal mode will be remembered
        close_on_exit = true, -- close the terminal window when the process exits
        auto_scroll = true,   -- automatically scroll to the bottom on terminal output

      }
    end,
  },
  --{
  --  "nvim-neorg/neorg",
  --  -- build = ":Neorg sync-parsers",
  --  dependencies = { "nvim-lua/plenary.nvim" },
  --  config = function()
  --    require("neorg").setup {
  --      load = {
  --        ["core.defaults"] = {},  -- Loads default behaviour
  --        ["core.concealer"] = {}, -- Adds pretty icons to your documents
  --        ["core.dirman"] = {      -- Manages Neorg workspaces
  --          config = {
  --            workspaces = {
  --              notes = "~/Sync/notes",
  --            },
  --          },
  --        },
  --        ["core.completion"] = {
  --          config = {
  --            engine = "nvim-cmp"
  --          }
  --        },
  --      },
  --    }
  --  end,
  --},
  --{
  --  "yuchanns/phpfmt.nvim",
  --  config = function()
  --    require("phpfmt").setup({
  --      -- Default configs
  --      cmd = "phpcbf",
  --      standard = "PSR12",
  --      auto_format = true,
  --    })
  --  end
  --},
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        -- command_palette = true,   -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        -- inc_rename = false,       -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      cmdline = {
        view = "cmdline",
      },

    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, view events will be queued until next update
      -- "rcarriga/nvim-notify",
    },
  },
  -- {
  --   "rcarriga/nvim-notify", -- Notification plugin used by noice.
  --   event = "VeryLazy",
  --   opts = {
  --   },
  -- },
  --  {
  --    "stevearc/dressing.nvim"
  --  },
  --{
  --  "kiyoon/jupynium.nvim",
  --  build = "pipx install .",
  --  dependencies = {
  --    "rcarriga/nvim-notify",
  --    "stevearc/dressing.nvim"
  --  }
  --  -- build = "conda run --no-capture-output -n jupynium pip install .",
  --  -- enabled = vim.fn.isdirectory(vim.fn.expand "~/miniconda3/envs/jupynium"),
  --},
  {
    'cljoly/telescope-repo.nvim',
    --'airblade/vim-rooter',
    --config = function()
    --  vim.g.rooter_cd_cmd = 'lcd'
    --  --g['rooter_cd_cmd'] = 'lcd'
    --end
  },
  {
    'stevearc/aerial.nvim', -- Neovim plugin for a code outline window
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },
  --{
  --  "epwalsh/pomo.nvim",
  --  version = "*", -- Recommended, use latest release instead of latest commit
  --  lazy = true,
  --  cmd = { "TimerStart", "TimerStop", "TimerRepeat" },
  --  dependencies = {
  --    -- Optional, but highly recommended if you want to use the "Default" timer
  --    "rcarriga/nvim-notify",
  --    config = function()
  --      vim.notify = require("notify")
  --    end

  --  },
  --  opts = {
  --    -- See below for full list of options 👇
  --  },
  --},
  {
    'dmmulroy/ts-error-translator.nvim',
    config = function()
      require("ts-error-translator").setup()
    end
  },
  {
    "robitx/gp.nvim",
    config = function()
      require("gp").setup()

      -- or setup with your own config (see Install > Configuration in Readme)
      -- require("gp").setup(config)

      -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
    end,
  },
  { "tpope/vim-fugitive" },
  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   init = function()
  --     vim.o.timeout = true
  --     vim.o.timeoutlen = 300
  --   end,
  --   opts = {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --   }
  -- },
  --{
  --  "nvimtools/none-ls.nvim",
  --  dependencies = {
  --    "nvimtools/none-ls-extras.nvim"
  --  },
  --},
  --{
  --  "jay-babu/mason-null-ls.nvim",
  --  event = { "BufReadPre", "BufNewFile" },
  --  dependencies = {
  --    "williamboman/mason.nvim",
  --    "nvimtools/none-ls.nvim",
  --  },
  --  --config = function()
  --  --  require("your.null-ls.config") -- require your null-ls config here (example below)
  --  --end,
  --}
  {
    "yetone/avante.nvim",
    version = false,
    event = "VeryLazy",
    opts = {
      --provider = "openai", -- You can then change this provider here
      provider = "gemini", -- You can then change this provider here
      cursor_applying_provider = "gemini",
      auto_suggestions_provider = "gemini",
      memory_summary_provider = "gemini",
      providers = {
        openai = {
          -- api_key_name = "OPENAI_API_KEY",
          endpoint = GEMINI2OPENAI_PROXY_API_PATH,
          timeout = 10000, -- Timeout in milliseconds
          api_key_name = "GEMINI_API_KEY",
          model = "gpt-4o-mini",
          extra_request_body = {
            temperature = 0
          },
          max_tokens = 4096,
        },
        gemini = {
          endpoint = VERCEL_GEMINI_API_PATH,
          api_key_name = "GEMINI_API_KEY",
          timeout = 10000, -- Timeout in milliseconds
          -- model = "gemini-1.5-pro-latest",
          -- model = "gemini-exp-1206",
          --model = "gemini-2.5-flash-preview-04-17",
          model = 'gemini-2.0-flash',
          temperature = 0,
          max_tokens = 4096,
        }
      }
    },
    build = 'make',
    keys = {
      { "<leader>aa", function() require("avante.api").ask() end,     desc = "avante: ask",    mode = { "n", "v" } },
      { "<leader>ar", function() require("avante.api").refresh() end, desc = "avante: refresh" },
      { "<leader>ae", function() require("avante.api").edit() end,    desc = "avante: edit",   mode = "v" },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
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
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = {
          'nvim-treesitter/nvim-treesitter',
          'nvim-tree/nvim-web-devicons'
        },
        --- @module 'render-markdown'
        --- @type render.md.UserConfig
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "rachartier/tiny-glimmer.nvim",
    -- event = 'VeryLazy',
    priority = 10,
    --event = "TextYankPost",
    opts = {
      transparency_color = "#1e1d32",
      animations = {
        fade = {
          from_color = "#74f2f1",
          to_color = "#1e1d32",
        },
        -- transparency_color = "#1e1d32",
        -- your configuration
      },
      overwrite = {
        paste = {
          enabled = true,
          default_animation = "reverse_fade",

          -- Keys to paste
          paste_mapping = "p",

          -- Keys to paste above the cursor
          Paste_mapping = "P",
        },
        undo = {
          enabled = true,

          default_animation = {
            name = "fade",

            settings = {
              from_color = "DiffDelete",

              max_duration = 500,
              min_duration = 500,
            },
          },
          undo_mapping = "u",
        },
        redo = {
          enabled = true,

          default_animation = {
            name = "fade",

            settings = {
              from_color = "DiffAdd",

              max_duration = 500,
              min_duration = 500,
            },
          },

          redo_mapping = "<c-r>",
        },
      }
    },
  },
  -- { 'nvim-treesitter/nvim-treesitter-refactor',},
  { 'echasnovski/mini.cursorword', version = '*' },
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "okular"
    end
  },
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = {
        -- set to 'none' to disable the 'default' preset
        -- preset = 'default',
        preset = 'none',

        ['<CR>'] = { 'accept', 'fallback' },
        ['<A-s>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<A-e>'] = { 'hide' },
        --['<C-y>'] = { 'select_and_accept' },

        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        --['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
        --['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

        ['<A-b>'] = { 'scroll_documentation_up', 'fallback' },
        ['<A-f>'] = { 'scroll_documentation_down', 'fallback' },

        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },

        ['<A-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  }
  --{
  --  "m4xshen/hardtime.nvim",
  --  lazy = false,
  --  dependencies = { "MunifTanjim/nui.nvim" },
  --  opts = {},
  --},
  --{
  --  'tzachar/local-highlight.nvim',
  --  config = function()
  --    require('local-highlight').setup({
  --      hlgroup = "Underlined",
  --      cw_hlgroup = "Underlined",
  --      animate = {
  --        enabled = false
  --      }
  --    })
  --  end
  --},
  --{
  --  "3rd/image.nvim",
  --  config = function()
  --    -- ...
  --  end
  --}
  -- {
  --   "olimorris/codecompanion.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     {
  --       -- Make sure to setup it properly if you have lazy=true
  --       'MeanderingProgrammer/render-markdown.nvim',
  --       ft = { "markdown", "codecompanion" },
  --     },

  --   },
  --   config = true
  -- }
})

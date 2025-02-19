# dakai/.nvim

My personal Neovim configuration built with Lua.

## Features

This configuration aims to provide a pleasant and productive Neovim experience with features such as:

- **LSP Support:** Integration with Language Server Protocol for code completion, diagnostics, and more.
- **Autocompletion:** Enhanced autocompletion powered by `nvim-cmp`.
- **Treesitter:** Syntax highlighting and code folding using `nvim-treesitter`.
- **Fuzzy Finding:** Fast file and buffer searching with `telescope.nvim`.
- **Aesthetics:** A clean and modern UI with custom colorscheme support.
- **Code Generation & Completion:** AI powered code companion with NeoCodeium and Avante.
- **File Management:** Easy file browsing with `nvim-tree.lua`.
- **Statusline:** Rich statusline powered by `lualine.nvim`.
- **Format on Save:** Auto formatting with `format-on-save.nvim`.
- **Tabline**: Enhanced tab line using `nvim-cokeline`.
- **Terminal Management:** Integrated terminal management with `toggleterm.nvim`.
- **Markdown Preview:** Native Markdown preview with `Peek.nvim`.

## Prerequisites

- Neovim v0.9+
- Node.js (for some LSP servers and tools)
- Python 3 (for some LSP servers and tools)
- `ripgrep` (for `telescope.nvim`)
- A Nerd Font (`https://www.nerdfonts.com/`)

## Installation

1.  Clone this repository:

    ```bash
    git clone <repository_url> ~/.config/nvim
    ```

2.  Start Neovim. Lazy.nvim will automatically install the plugins.

    ```bash
    nvim
    ```

3.  If the plugins don't install automatically, run `:Lazy sync` in Neovim.

## Directory Structure

```
dakai-.nvim/
├── init.lua         -- Main entry point, loads all other modules
├── after/
│   └── plugin/       -- Plugin configurations
└── lua/              -- Lua modules
    ├── autocmds.lua         -- Autocommand definitions
    ├── base.lua             -- Basic settings and options
    ├── highlights.lua       -- Custom highlight definitions
    ├── maps.lua             -- Key mappings
    ├── plugins.lua          -- Plugin definitions using lazy.nvim
    └── statusline.lua       -- Statusline configuration
```

## Configuration Files

- `init.lua`: This is the main entry point for the Neovim configuration. It loads all other modules, effectively setting up the entire environment.

- `lua/base.lua`: Contains basic settings and options for Neovim, such as enabling line numbering, setting the encoding, and configuring indentation.

- `lua/highlights.lua`: Defines custom highlight groups and sets terminal colors.

- `lua/maps.lua`: Configures key mappings for various actions, such as saving files, moving windows, and searching.

- `lua/plugins.lua`: Sets up plugins using `lazy.nvim`. This file specifies each plugin to install, along with any configuration options.

- `lua/autocmds.lua`: Defines custom autocommands for tasks like auto-formatting YAML files on save.

- `lua/statusline.lua`: Configures the statusline using Lua, displaying information such as file name, diagnostics, and cursor position.

- `after/plugin/*.rc.lua`: These files configure individual plugins after they are loaded.

## Key Mappings

Here are some important key mappings:

- `<Space>w`: Save the current file.
- `<Space>q`: Delete current buffer or exit nvim if only one buffer. Requires `Delete_buffer_or_exit` function in `map.lua`.
- `<Space>n`: Toggle the `nvim-tree` file explorer.
- `<Space>m`: Native Markdown preview.
- `<Space>s`: Telescope smart open.
- `<Space>t`: Telescope smart open in current working directory.
- `<Space>g`: Telescope live grep.
- `<Space>b`: Telescope buffers.
- `<Space>h`: Telescope help tags.
- `<Space>r`: Telescope resume.
- `<Space>e`: Telescope diagnostics.
- `<Space>d`: Todo Telescope.
- `<Space>p`: Telescope repo List.
- `gw`: ChatGPT diagnostics.
- `;aa`: Avante.nvim Panel

## Customization

Feel free to customize this configuration to your liking by modifying the files in the repository.

local status, lualine = pcall(require, 'lualine')
if (not status) then return end

local function Codeium()
  local fn_result = vim.fn['codeium#GetStatusString']() -- call the function you want to use
  local new_string = "{…} " .. tostring(fn_result) -- concatenate the string and the function's return value
  return new_string -- return the new string
end

local function NeoCodeium()
  local codeium_status, serverstatus = require("neocodeium").get_status()

  -- Tables to map serverstatus and status to corresponding symbols
  local server_status_symbols = {
    [0] = "󰣺 ", -- Connected
    [1] = "󱤚 ", -- Connecting
    [2] = "󰣽 ", -- Disconnected
  }

  local status_symbols = {
    [0] = "󰚩 ", -- Enabled
    [1] = "󱚧 ", -- Disabled Globally
    [3] = "󱚢 ", -- Disabled for Buffer filetype
    [5] = "󱚠 ", -- Disabled for Buffer encoding
    [2] = "󱙻 ", -- Disabled for Buffer (catch-all)
  }

  -- Handle serverstatus and status fallback (safeguard against any unexpected value)
  local luacodeium = server_status_symbols[serverstatus] or "󰣼 "
  luacodeium = luacodeium .. (status_symbols[codeium_status] or "󱚧 ")

  return luacodeium
end

lualine.setup {
  options = {
    icons_enabled = true,
    -- theme = 'embark',
    -- theme = 'monoglow',
    -- theme = 'tokyonight',
    theme = 'nightfox',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true, -- display file status
      path = 1            -- 0 = just filename
    } },
    lualine_x = {
      function()
        local ok, pomo = pcall(require, "pomo")
        if not ok then
          return ""
        end

        local timer = pomo.get_first_to_finish()
        if timer == nil then
          return ""
        end

        return "󰄉 " .. tostring(timer)
      end,
      NeoCodeium,
      -- Codeium,
      {
        'diagnostics',
        source = { 'nvim_diagnostics' },
        symbols = {
          error = ' ',
          warn = ' ',
          info = ' ',
          hint = ' '
        }
      },
      'encoding',
      'filetype',
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  tabline = {},
  extensions = { 'nvim-tree', 'trouble', 'lazy' }
}

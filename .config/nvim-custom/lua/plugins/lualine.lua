local colors = require('tokyonight.colors').setup { style = 'night' }
local tokyonight_night = {
  normal = {
    a = { fg = colors.bg, bg = colors.blue, gui = 'bold' },
    b = { fg = colors.blue, bg = colors.bg_highlight },
    c = { fg = colors.fg, bg = colors.bg_dark },
  },
  insert = {
    a = { fg = colors.bg, bg = colors.teal, gui = 'bold' },
    b = { fg = colors.teal, bg = colors.bg_highlight },
  },
  visual = {
    a = { fg = colors.bg, bg = colors.purple, gui = 'bold' },
    b = { fg = colors.purple, bg = colors.bg_highlight },
  },
  command = {
    a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.yellow, bg = colors.bg_highlight },
  },
  replace = {
    a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
    b = { fg = colors.red, bg = colors.bg_highlight },
  },
  inactive = {
    a = { fg = colors.blue, bg = colors.bg_highlight, gui = 'italic' },
  },
}

return {
  -- Set lualine as statusline
  -- See `:help lualine.txt`
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = vim.g.have_nerd_font,
      theme = tokyonight_night,
    },
    sections = {
      lualine_x = { 'fileformat', 'filetype' },
    },
    inactive_sections = {
      lualine_c = {},
    },
    -- TODO: Read from Harpoon list
    -- tabline = {
    --   lualine_z = {"os.date()"},
    -- },
    winbar = {
      -- TODO: include path
      lualine_a = { 'filename' },
    },
    -- TODO: include path
    inactive_winbar = {
      lualine_a = { 'filename' },
    },
  },
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}

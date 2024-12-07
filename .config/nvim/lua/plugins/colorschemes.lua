return {
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'folke/tokyonight.nvim',
  priority = 1000, -- Make sure to load this before all the other start plugins.
  opts = {
    style = 'night',
    -- on_colors = function(colors)
    -- colors.diff.change = colors.orange
    -- colors.diff = colors.orange
    -- colors.change = colors.orange
    -- colors.git_change = colors.orange
    -- colors.git.change = colors.orange
    -- colors.git.diff = colors.orange
    -- colors.diff = {
    --   change = colors.orange,
    --   add = colors.red1,
    -- }
    -- end,
  },
  init = function()
    -- Alts: 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    -- vim.cmd.colorscheme 'tokyonight-night'
    vim.cmd.colorscheme 'tokyonight'

    -- You can configure highlights by doing something like:
    vim.cmd.hi 'Comment gui=none'
  end,
}

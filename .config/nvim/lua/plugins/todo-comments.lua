-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = true, -- show icons in gutter
    sign_priority = 0, -- don't overlay gitsigns
    keywords = {
      -- TODO: make color pink
      OVERRIDE = { icon = '󰬲 ', color = 'hint', alt = { 'OVERRIDE FILE' } },
    },
  },
}

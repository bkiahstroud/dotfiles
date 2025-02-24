require 'keymaps'

require 'options'

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'plugins' },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',
  -- require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- TODO: Plugins to consider:
  -- Comment.nvim
  -- LuaSnip
  -- catppuccin
  -- cmp-buffer
  -- cmp-nvim-lsp
  -- cmp-path
  -- cmp_luasnip
  -- co-author.nvim
  -- conform.nvim
  -- dressing.nvim
  -- fidget.nvim
  -- friendly-snippets
  -- gitsigns.nvim
  -- harpoon
  -- indent-blankline.nvim
  -- lazy.nvim
  -- leap.nvim
  -- lualine.nvim
  -- mason-lspconfig.nvim
  -- mason-tool-installer.nvim
  -- mason.nvim
  -- mini.nvim
  -- neodev.nvim
  -- neorg
  -- nvim-cmp
  -- nvim-lspconfig
  -- nvim-surround
  -- nvim-treesitter
  -- nvim-treesitter-context
  -- nvim-treesitter-textobjects
  -- nvim-web-devicons
  -- nvim_context_vt
  -- oil.nvim
  -- onedark.nvim
  -- playground
  -- plenary.nvim
  -- rainbow-delimiters.nvim
  -- refactoring.nvim
  -- telescope-fzf-native.nvim
  -- telescope-fzf-native.nvim
  -- telescope-ui-select.nvim
  -- telescope.nvim
  -- todo-comments.nvim
  -- tokyonight.nvim
  -- vim-fugitive
  -- vim-repeat
  -- vim-rhubarb
  -- vim-sleuth
  -- vimwiki
  -- which-key.nvim
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

require 'snippets'
require 'xeref'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

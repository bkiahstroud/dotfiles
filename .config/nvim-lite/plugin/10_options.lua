local now, later = MiniDeps.now, MiniDeps.later
local now_if_args = _G.Config.now_if_args

now(function()
  vim.cmd('colorscheme miniautumn')
end)

vim.g.have_nerd_font = true
vim.o.scrolloff = 5
vim.o.confirm = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.listchars = 'extends:…,nbsp:␣,precedes:…,tab:» '
vim.o.inccommand = 'split'
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.spelloptions = 'camel'

-- Override options by listing them before mini.basics setup
now(function()
  require('mini.basics').setup({
    options = { extra_ui = true },
    mappings = {
      -- Create `<C-hjkl>` mappings for window navigation
      windows = true,
    },
    autocommands = {
      -- Set 'relativenumber' only in linewise and blockwise Visual mode
      relnum_in_visual_mode = true,
    },
  })
end)

-- vim.o.iskeyword = '@,48-57,_,192-255,-'
--
-- -- Pattern for a start of numbered list (used in `gw`). This reads as
-- -- "Start of list item is: at least one special character (digit, -, +, *)
-- -- possibly followed by punctuation (. or `)`) followed by at least one space".
-- vim.o.formatlistpat = [[^\s*[0-9\-\+\*]\+[\.\)]*\s\+]]
--
-- vim.o.complete    = '.,w,b,kspell' -- TODO: research
-- vim.o.completeopt = 'menuone,noselect,fuzzy,nosort' -- TODO: research
--
-- vim.schedule(function()
--   vim.o.clipboard = 'unnamedplus'
-- end)

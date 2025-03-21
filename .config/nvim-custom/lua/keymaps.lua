-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader><CR>', vim.cmd.noh, { silent = true, desc = 'which_key_ignore' })

vim.keymap.set({ 'v', 'i' }, 'jk', '<Esc>', { silent = true, desc = 'which_key_ignore' })
vim.keymap.set({ 'v', 'i' }, 'Jk', '<Esc>', { silent = true, desc = 'which_key_ignore' })
vim.keymap.set({ 'v', 'i' }, 'jK', '<Esc>', { silent = true, desc = 'which_key_ignore' })
vim.keymap.set({ 'v', 'i' }, 'JK', '<Esc>', { silent = true, desc = 'which_key_ignore' })

vim.keymap.set('n', 'J', '}', { silent = true, desc = 'which_key_ignore' })
vim.keymap.set('n', 'K', '{', { silent = true, desc = 'which_key_ignore' })

-- vim.keymap.set('n', '<leader>l', '$', { silent = true, desc = 'which_key_ignore' })
-- vim.keymap.set('v', '<leader>l', '$h', { silent = true, desc = 'which_key_ignore' })
-- vim.keymap.set({ 'n', 'v' }, '<leader>h', '^', { silent = true, desc = 'which_key_ignore' })

vim.keymap.set('i', '<C-e>', '<Esc>$a', { silent = true, desc = 'which_key_ignore' })
vim.keymap.set('i', '<C-a>', '<Esc>^i', { silent = true, desc = 'which_key_ignore' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--
vim.keymap.set('n', '-', '<cmd>Oil --float<cr>', { desc = 'Open parent directory' })
vim.keymap.set('n', '<leader>nf', '<cmd>Oil ~/notes --float<cr>', { desc = 'Open Neorg notes' })

local getReletiveFilePath = function()
  local homePath = os.getenv 'HOME'
  local fullPath = vim.fn.expand '%'
  -- Will match $HOME/Development/my-project/
  local basePath = homePath .. '/Development/' .. '[^/]+/'
  local relativePath = fullPath:gsub(basePath, '')

  vim.fn.setreg('+', relativePath)
  print('Copied ' .. relativePath)
end

-- vim.keymap.set('n', 'yfp', "<cmd>let @+ = expand('%')<cr>", { desc = '[y]ank [f]ile [p]ath' })
vim.keymap.set('n', 'yfp', getReletiveFilePath, { desc = '[y]ank [f]ile [p]ath' })
vim.keymap.set('n', 'yfn', "<cmd>let @+ = expand('%:t')<cr>", { desc = '[y]ank [f]ile [n]ame' })

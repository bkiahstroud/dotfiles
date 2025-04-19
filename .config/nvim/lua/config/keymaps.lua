-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "v", "i" }, "jk", "<Esc>")
vim.keymap.set({ "v", "i" }, "Jk", "<Esc>")
vim.keymap.set({ "v", "i" }, "jK", "<Esc>")
vim.keymap.set({ "v", "i" }, "JK", "<Esc>")

vim.keymap.set("n", "<leader>yfn", "<cmd>let @+ = expand('%:t')<cr>", { desc = "file [n]ame" })
vim.keymap.set("n", "<leader>yfp", function()
  local homePath = os.getenv("HOME")
  local fullPath = vim.fn.expand("%")
  -- Will match $HOME/Development/my-project/
  local basePath = homePath .. "/Development/" .. "[^/]+/"
  local relativePath = fullPath:gsub(basePath, "")

  vim.fn.setreg("+", relativePath)
  print("Copied " .. relativePath)
end, { desc = "file [p]ath" })

vim.keymap.set("n", "<leader>yr", "<cmd>Xeref<cr>", { desc = "[r]eference" })

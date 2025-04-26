-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set({ "v", "i" }, "jk", "<Esc>")
vim.keymap.set({ "v", "i" }, "Jk", "<Esc>")
vim.keymap.set({ "v", "i" }, "jK", "<Esc>")
vim.keymap.set({ "v", "i" }, "JK", "<Esc>")

vim.keymap.set("n", "<leader>yfn", "<cmd>let @+ = expand('%:t')<cr>", { desc = "Name" })
vim.keymap.set("n", "<leader>yfp", function()
  local homePath = os.getenv("HOME")
  local fullPath = vim.fn.expand("%")
  -- Will match $HOME/Development/my-project/
  local basePath = homePath .. "/Development/" .. "[^/]+/"
  local relativePath = fullPath:gsub(basePath, "")

  vim.fn.setreg("+", relativePath)
  print("Copied " .. relativePath)
end, { desc = "Path" })

vim.keymap.set("n", "<leader>yr", "<cmd>Xeref<cr>", { desc = "Reference" })

vim.keymap.set("n", "<leader>ss", function()
  -- WARN: includes stopped LSPs, which will cause lsp_symbols() to fail
  local current_buf_lsp_list = vim.lsp.get_clients({ bufnr = 0 })
  if next(current_buf_lsp_list) == nil then
    Snacks.picker.treesitter()
  else
    Snacks.picker.lsp_symbols()
  end
end, { desc = "Symbols" })

require("which-key").add({
  { "<leader>o", group = "Obsidian", icon = { icon = "", color = "purple" } },
  { "<leader>y", group = "yank", icon = { icon = "", color = "azure" } },
  { "<leader>yf", group = "file" },
})

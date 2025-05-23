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

vim.keymap.set("n", "<leader>yr", function()
  require("xeref").copy_method_ref()
end, { desc = "Reference" })

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
  { "<leader>t", group = "toggle", icon = { icon = "󰨚", color = "cyan" } },
  { "<leader>y", group = "yank", icon = { icon = "", color = "azure" } },
  { "<leader>yf", group = "file" },
})

Snacks.toggle
  .new({
    id = "auto_format",
    name = "Auto-format",
    get = function()
      return vim.opt_local.formatoptions:get()["a"] or false
    end,
    set = function(state)
      if state then
        vim.opt_local.formatoptions:append("a")
      else
        vim.opt_local.formatoptions:remove("a")
      end
    end,
  })
  :map("<leader>ta")

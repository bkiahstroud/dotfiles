return {
  "aaronik/treewalker.nvim",
  keys = {
    {
      "<C-k>",
      mode = { "n", "v" },
      function()
        vim.cmd("Treewalker Up")
      end,
      desc = "Treewalker up",
    },
    {
      "<C-j>",
      mode = { "n", "v" },
      function()
        vim.cmd("Treewalker Down")
      end,
      desc = "Treewalker Down",
    },
    {
      "<C-h>",
      mode = { "n", "v" },
      function()
        vim.cmd("Treewalker Left")
      end,
      desc = "Treewalker left",
    },
    {
      "<C-l>",
      mode = { "n", "v" },
      function()
        vim.cmd("Treewalker Right")
      end,
      desc = "Treewalker right",
    },
  },
}

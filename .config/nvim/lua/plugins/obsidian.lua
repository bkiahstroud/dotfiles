return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  keys = {
    {
      "<leader>ot",
      mode = "n",
      function()
        vim.cmd("ObsidianToday")
      end,
      desc = "Today",
    },
    {
      "<leader>of",
      mode = "n",
      function()
        vim.cmd("ObsidianQuickSwitch")
      end,
      desc = "Files",
    },
    {
      "<leader>os",
      mode = "n",
      function()
        vim.cmd("ObsidianSearch")
      end,
      desc = "Search",
    },
    {
      "<leader>oT",
      mode = "n",
      function()
        vim.cmd("ObsidianTags")
      end,
      desc = "Tags",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "work",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/work",
      },
      {
        name = "personal",
        path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/personal",
      },
    },
    completion = {
      nvim_cmp = false,
      blink = true,
    },
    -- picker = {
    --   name = "fzf-lua",
    -- },
  },
}

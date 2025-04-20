return {
  "folke/todo-comments.nvim",
  opts = {
    keywords = {
      OVERRIDE = { icon = "󰬲 ", color = "override", alt = { "OVERRIDE FILE" } },
    },
    colors = {
      override = { "#FF66FF" },
    },
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*:?]], -- match even if colon is missing
    },
  },
}

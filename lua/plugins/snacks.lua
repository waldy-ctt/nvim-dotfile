return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      enabled = true,
      preset = {
        header = [[
  ┓ ┏┏┓┓ ┳┓┓┏
  ┃┃┃┣┫┃ ┃┃┗┫
  ┗┻┛┛┗┗┛┻┛┗┛
  ─────────────────────────────
   w a l d y  ·  n e o v i m
  ─────────────────────────────]],
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    statusline = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scroll = { enabled = true },
  },
  keys = {
    { "<leader>.", function() require("snacks").dashboard.open() end, desc = "Dashboard" },
  },
}

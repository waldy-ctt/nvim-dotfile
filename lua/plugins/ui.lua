return {
  -- Bufferline
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers",
        numbers = "none",
        indicator = { style = "underline" },
        separator_style = "thin",
        show_close_icon = false,
        color_icons = false,
      },
    },
  },

  -- Oil
  {
    "stevearc/oil.nvim",
    cmd = "Oil",
    opts = { default_file_explorer = true },
  },

  -- Todo comments
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
      local wk = require("which-key")
      wk.add({
        { "<leader> ", group = "Telescope" },
        { "<leader>c", group = "Code" },
        { "<leader>b", group = "Buffer" },
        { "<leader>w", group = "Window" },
        { "g", group = "Go" },
      })
    end,
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {},
  },

  -- Trouble
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Trouble" },
    },
  },
}

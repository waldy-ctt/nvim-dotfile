return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
    },
    keys = {
      { "<leader> f", false },
      { "<leader> g", false },
      { "<leader> b", false },
      { "<leader> h", false },
    },
  },
}

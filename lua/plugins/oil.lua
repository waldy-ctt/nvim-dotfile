return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  lazy = false,
  config = function()
    require("oil").setup({
      columns = {
        "icon",
        "size",
      },
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
      win_options = {
        wrap = false,
        signcolumn = "no",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
      },
      delete_to_trash = false,
      watch_for_changes = true,
      keymaps = {
        ["<leader>e"] = { "actions.close", mode = "n" },
        ["<C-h>"] = { "actions.toggle_hidden" },
      },
    })
  end,
}

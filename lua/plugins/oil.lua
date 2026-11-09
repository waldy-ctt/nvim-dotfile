vim.pack.add({
  { src = "https://github.com/stevearc/oil.nvim", name = "oil" }
})

require('oil').setup({
  keymaps = {
    ["<leader>e"] = { "actions.close", mode = "n" },
    ["<C-h>"] = { "actions.toggle_hidden" },
  },
})

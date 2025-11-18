-- Load config
require("config.lazy")
require("mason-lspconfig").setup()

-- Load theme and set colorscheme
require("plugins.theme")
require("config.colorscheme")

require('config.keymap')

require('config.whichkey')

-- Turn on relative number
vim.o.relativenumber = true

-- Change tab's depth
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Make nvim copy to clipboard
vim.opt.clipboard = "unnamedplus"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.statusline:append("%{&endofline?'':'[noeol]'}")

require("config.options")
require("config.lazy")
require("config.keymaps")
require("config.colors")


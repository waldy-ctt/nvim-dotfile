vim.g.mapleader = " " -- Set leader = space
vim.g.maplocalleader = " "

vim.opt.statusline:append("%{&endofline?'':'[noeol]'}")

require('keymaps')
require('options')
require('plugins.lsp')
require('plugins.oil')
require('plugins.mini')

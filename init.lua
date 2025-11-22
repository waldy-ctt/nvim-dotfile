vim.opt.termguicolors = true
-- Load config
require("config.lazy")
require('plugins.mason')
require("plugins.mason-lsp")
require("plugins.treesitter")
require("telescope").load_extension('fzf')

-- Load theme and set colorscheme
require("plugins.theme")
require("config.colorscheme")

require("config.keymap")

require("config.whichkey")

require("bufferline").setup()
require("plugins.conform")

require("plugins.oil") -- Require the plugin file so it can load the keymap of oil in it
require("config.hover")


require("plugins.lsp")
require('plugins.docscribe')

require('plugins.flutter')
-- Turn on relative number
vim.o.relativenumber = true
vim.opt.number = true

-- Change tab's depth
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Make nvim copy to clipboard
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes" -- always show the sign column



-- Down here is auto CMD
local my_augroup = vim.api.nvim_create_augroup("MyUserSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	group = my_augroup,
	pattern = "*", -- This rule should apply to ALL file types.
	callback = function()
		-- This is the code that will be executed WHEN the event happens.
		-- We use `vim.opt` here because `opt` was a local variable in options.lua
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})

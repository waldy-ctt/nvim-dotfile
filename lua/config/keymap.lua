vim.g.mapleader = " "

-- Format file
vim.keymap.set("n", "<leader>cf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format file" })

-- Telescope keymap
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader> f", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader> g", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader> b", builtin.buffers, { desc = "Telescope find buffers" })
vim.keymap.set("n", "<leader> h", builtin.help_tags, { desc = "Telescope find help tags" })
vim.keymap.set("n", "<leader> u", builtin.colorscheme, { desc = "Telescope colorscheme" })
vim.keymap.set("n", "<leader> c", function()
	vim.cmd([[TodoTelescope]])
end, { desc = "Telescope find comment note" })

-- Todo

-- Which Key
local wk = require("which-key")
wk.add({
	{ "<leader> ", group = "Telescope" },
    { "<leader>c", group = "Code Action" }
})

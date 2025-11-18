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

-- Code Action LSP
vim.keymap.set({ "n", "x" }, "<leader>ca", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true, desc = "Show Code Action" })

-- Show Diagnose
vim.keymap.set(
	"n",
	"<leader>cd",
	vim.diagnostic.open_float,
	{ noremap = true, silent = true, desc = "Show Diagnostic" }
)

-- Buffer
vim.keymap.set("n", "<S-l>", function()
	vim.cmd([[BufferLineCycleNext]])
end, { desc = "Move to next buffer" })

vim.keymap.set("n", "<S-h>", function()
	vim.cmd([[BufferLineCyclePrev]])
end, { desc = "Move to previous buffer" })

vim.keymap.set("n", "<A-l>", function()
	vim.cmd([[BufferLineMoveNext]])
end, { desc = "Move buffer to next" })

vim.keymap.set("n", "<A-h>", function()
	vim.cmd([[BufferLineMovePrev]])
end, { desc = "Move buffer to previous" })

vim.keymap.set("n", "<leader>bd", function()
	vim.cmd([[bd]])
end, { desc = "Close current buffer" })

vim.keymap.set("n", "<leader>bP", function()
	vim.cmd([[BufferLineCloseOthers]])
end, { desc = "Close all others buffer" })

-- Window
vim.keymap.set("n", "<leader>wd", function()
	vim.cmd([[close]])
end, { desc = "Close window" })

vim.keymap.set("n", "<leader>w|", function()
	vim.cmd([[vsplit]])
end, { desc = "Split right" })

vim.keymap.set("n", "<leader>w-", function()
	vim.cmd([[botright split]])
end, { desc = "Split down" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Go to right window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Go to upper window", remap = true })

-- Esc
vim.keymap.set("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

-- Oil
vim.keymap.set("n", "<leader>e", function()
	require("oil").open()
end, { desc = "Open oil" })

-- Which Key
local wk = require("which-key")
wk.add({
	{ "<leader> ", group = "Telescope" },
	{ "<leader>c", group = "Code Action" },
	{ "<leader>b", group = "Buffer" },
	{ "<leader>w", group = "Window" },
})

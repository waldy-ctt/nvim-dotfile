-- Format
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 2500 })
end, { desc = "Format file" })

-- Telescope (require inside function so it loads after lazy)
vim.keymap.set("n", "<leader> f", function()
  require("telescope.builtin").find_files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader> g", function()
  require("telescope.builtin").live_grep()
end, { desc = "Live grep" })
vim.keymap.set("n", "<leader> b", function()
  require("telescope.builtin").buffers()
end, { desc = "Find buffers" })
vim.keymap.set("n", "<leader> h", function()
  require("telescope.builtin").help_tags()
end, { desc = "Help tags" })
vim.keymap.set("n", "<leader> c", "<cmd>TodoTelescope<CR>", { desc = "Find TODOs" })

-- LSP
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })

-- Smart gd (go to definition, prefer telescope if available)
local function smart_gd()
  local ok, _ = pcall(require, "telescope.builtin")
  if ok then
    vim.cmd("Telescope lsp_definitions")
  else
    vim.lsp.buf.definition()
  end
end

-- Smart gr (go to references, prefer telescope if available)
local function smart_gr()
  local ok, _ = pcall(require, "telescope.builtin")
  if ok then
    vim.cmd("Telescope lsp_references")
  else
    vim.lsp.buf.references()
  end
end

vim.keymap.set("n", "gd", smart_gd, { desc = "Go to definition" })
vim.keymap.set("n", "gr", smart_gr, { desc = "Go to references" })

-- Buffer
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
vim.keymap.set("n", "<A-l>", "<cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
vim.keymap.set("n", "<A-h>", "<cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
vim.keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close others" })

-- Window
vim.keymap.set("n", "<leader>wd", "<cmd>close<CR>", { desc = "Close window" })
vim.keymap.set("n", "<leader>w|", "<cmd>vsplit<CR>", { desc = "Split right" })
vim.keymap.set("n", "<leader>w-", "<cmd>split<CR>", { desc = "Split down" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Go left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Go right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Go down window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Go up window" })

-- Misc
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Oil file explorer" })
vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble toggle" })

-- Dashboard
vim.keymap.set("n", "<leader>.", function()
  local ok, snacks = pcall(require, "snacks")
  if ok then snacks.dashboard.open() end
end, { desc = "Dashboard" })

-- Notification log
vim.keymap.set("n", "<leader>nl", function()
  local ok, snacks = pcall(require, "snacks")
  if ok then snacks.notifier.show_history() end
end, { desc = "Notification history" })

-- Which-key groups are configured in plugins/ui.lua (which-key plugin config)

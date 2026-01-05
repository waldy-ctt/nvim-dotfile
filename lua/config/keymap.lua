vim.g.mapleader = " "

-- Format file
vim.keymap.set("n", "<leader>cf", function()
  require("conform").format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 2500,
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

-- Go
pcall(vim.keymap.del, "n", "gra")
pcall(vim.keymap.del, "n", "gri")
pcall(vim.keymap.del, "n", "grn")
pcall(vim.keymap.del, "n", "grr")
pcall(vim.keymap.del, "n", "grt")

-- vim.keymap.set("n", "gd", function ()
--     vim.cmd([[Telescope definition]])
-- end, { buffer = true, desc = "Go to definition", remap = true })
--
-- vim.keymap.set("n", "gr", function ()
--     vim.cmd([[Telescope references]])
-- end, { buffer = true, desc = "Go to references", remap = true })

-- Universal gd / gr – works 100 % of the time in 2025
local function smart_gd()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    require("telescope.builtin").lsp_definitions({ reuse_win = true })
  else
    -- No LSP → fall back to Vim’s native "go to local declaration"
    vim.cmd("normal! gd")
  end
end

local function smart_gr()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    require("telescope.builtin").lsp_references({
      include_declaration = false,
      jump_type = "never",
      show_line = true,
    })
  else
    vim.notify("No references (no LSP)", vim.log.levels.INFO)
  end
end

-- Set them globally once – no LspAttach needed!
vim.keymap.set("n", "gd", smart_gd, { desc = "[LSP/vim] Go to definition" })
vim.keymap.set("n", "gr", smart_gr, { desc = "[LSP] Go to references" })

-- Which Key
local wk = require("which-key")
wk.add({
  { "<leader> ", group = "Telescope" },
  { "<leader>c", group = "Code Action" },
  { "<leader>b", group = "Buffer" },
  { "<leader>w", group = "Window" },
  { "g",         group = "Go" },
})

local kulala = require("kulala")
vim.keymap.set("n", "<leader>rs", kulala.run, { desc = "[Kulala] Run request", group = "Kulala" })
vim.keymap.set("n", "<leader>ra", kulala.run_all, { desc = "[Kulala] Run request", group = "Kulala" })
vim.keymap.set("n", "<leader>rb", kulala.scratchpad, { desc = "[Kulala] Open scratchpad", group = "Kulala" })

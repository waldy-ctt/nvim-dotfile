vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.undofile = true

-- Register built-in treesitter languages
local languages = {
  "lua", "typescript", "javascript", "tsx", "json", "html", "css",
  "markdown", "bash", "go", "rust", "python", "toml", "yaml",
  "dockerfile", "gitcommit", "gitignore", "regex", "vim", "query",
}
for _, lang in ipairs(languages) do
  pcall(function() vim.treesitter.language.add(lang) end)
end

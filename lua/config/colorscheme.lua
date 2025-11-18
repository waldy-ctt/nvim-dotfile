local colorscheme = "gruvbox"

local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!", vim.log.levels.WARN)
    vim.cmd.colorscheme("gruvbox") -- NOTE: Set this to fallback theme
    return
end

vim.o.background = "dark"

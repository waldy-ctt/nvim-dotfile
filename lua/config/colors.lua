local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Function to read active vibe state from file
local function get_active_vibe()
  local vibe_file = vim.fn.expand("~/.config/nvim/lua/config/active_vibe.lua")
  local f = io.open(vibe_file, "r")
  if f then
    local vibe = f:read("*all"):gsub("%s+", "")
    f:close()
    return vibe
  end
  return "soft"   -- Default fallback
end

local vibe = get_active_vibe()

if vibe == "hard" then
  -- Hard / Focus Mode: Ergonomic Dark Slate (No eye-straining pure black/white)
  hl("Normal", { fg = "#d4d4d8", bg = "#121214" })
  hl("Comment", { fg = "#71717a", italic = true })
  hl("String", { fg = "#a1a1aa" })
  hl("Number", { fg = "#f4f4f5" })
  hl("Keyword", { fg = "#f4f4f5", bold = true })
  hl("Function", { fg = "#ffffff", bold = true })

  hl("LineNr", { fg = "#52525b" })
  hl("CursorLineNr", { fg = "#ffffff", bold = true })
  hl("SignColumn", { bg = "#121214" })
  hl("CursorLine", { bg = "#18181b" })
  hl("Visual", { bg = "#27272a" })
  hl("Search", { fg = "#121214", bg = "#e4e4e7" })

  vim.g.colors_name = "focus-slate"
else
  -- Soft / Cozy Mode: Your original Stale Earth theme
  hl("Normal", { fg = "#e6dcc8", bg = "#1e1c19" })
  hl("Comment", { fg = "#a09880", italic = true })
  hl("String", { fg = "#d4a848" })
  hl("Character", { fg = "#d4a848" })
  hl("Number", { fg = "#d4a848" })
  hl("Boolean", { fg = "#d4a848" })
  hl("Float", { fg = "#d4a848" })
  hl("Function", { fg = "#c4746e" })
  hl("Identifier", { fg = "#e6dcc8" })
  hl("Keyword", { fg = "#c4746e", bold = true })
  hl("Conditional", { fg = "#c4746e" })
  hl("Repeat", { fg = "#c4746e" })
  hl("Statement", { fg = "#c4746e" })
  hl("Type", { fg = "#d4a848" })
  hl("Constant", { fg = "#d4a848" })
  hl("Special", { fg = "#c4746e" })
  hl("PreProc", { fg = "#c4746e" })
  hl("Operator", { fg = "#e6dcc8" })
  hl("Title", { fg = "#c4746e", bold = true })
  hl("Todo", { fg = "#1e1c19", bg = "#d4a848", bold = true })

  -- Diagnostics
  hl("DiagnosticError", { fg = "#c4746e" })
  hl("DiagnosticWarn", { fg = "#d4a848" })
  hl("DiagnosticInfo", { fg = "#a09880" })
  hl("DiagnosticHint", { fg = "#a09880" })
  hl("DiagnosticUnderlineError", { sp = "#c4746e", underline = true })
  hl("DiagnosticUnderlineWarn", { sp = "#d4a848", underline = true })
  hl("DiagnosticUnderlineInfo", { sp = "#a09880", underline = true })
  hl("DiagnosticUnderlineHint", { sp = "#a09880", underline = true })

  -- Line / gutter
  hl("LineNr", { fg = "#555046" })
  hl("CursorLineNr", { fg = "#d4a848" })
  hl("SignColumn", { bg = "#1e1c19" })
  hl("ColorColumn", { bg = "#252320" })
  hl("CursorLine", { bg = "#252320" })
  hl("CursorColumn", { bg = "#252320" })
  hl("Visual", { bg = "#332f2b" })
  hl("Search", { fg = "#1a1815", bg = "#d4a848" })
  hl("IncSearch", { fg = "#1a1815", bg = "#c4746e" })

  -- Popup / completion
  hl("Pmenu", { bg = "#252320" })
  hl("PmenuSel", { bg = "#c4746e", fg = "#1a1815" })
  hl("PmenuSbar", { bg = "#332f2b" })
  hl("PmenuThumb", { bg = "#555046" })

  -- Statusline / tabline
  hl("StatusLine", { fg = "#e6dcc8", bg = "#252320" })
  hl("StatusLineNC", { fg = "#a09880", bg = "#252320" })
  hl("TabLine", { fg = "#a09880", bg = "#1e1c19" })
  hl("TabLineSel", { fg = "#e6dcc8", bg = "#252320" })
  hl("TabLineFill", { bg = "#1e1c19" })

  -- Splits / folds
  hl("VertSplit", { fg = "#332f2b" })
  hl("Folded", { fg = "#a09880", bg = "#252320" })
  hl("FoldColumn", { fg = "#555046", bg = "#1e1c19" })

  -- Diffs
  hl("DiffAdd", { bg = "#3a4030" })
  hl("DiffDelete", { bg = "#402a2a" })
  hl("DiffChange", { bg = "#2d2a26" })
  hl("DiffText", { bg = "#4a3a30" })

  -- Misc
  hl("NonText", { fg = "#555046" })
  hl("Whitespace", { fg = "#332f2b" })
  hl("SpecialKey", { fg = "#555046" })
  hl("Conceal", { fg = "#a09880" })
  hl("ErrorMsg", { fg = "#c4746e" })
  hl("WarningMsg", { fg = "#d4a848" })
  hl("ModeMsg", { fg = "#e6dcc8" })
  hl("MoreMsg", { fg = "#a09880" })
  hl("Question", { fg = "#d4a848" })
  hl("Directory", { fg = "#d4a848" })
  hl("MatchParen", { fg = "#c4746e", bold = true })
  hl("WildMenu", { fg = "#1a1815", bg = "#c4746e" })
  hl("EndOfBuffer", { fg = "#1e1c19" })

  -- Spell
  hl("SpellBad", { sp = "#c4746e", underline = true })
  hl("SpellCap", { sp = "#d4a848", underline = true })
  hl("SpellRare", { sp = "#d4a848", underline = true })
  hl("SpellLocal", { sp = "#a09880", underline = true })

  vim.g.colors_name = "stale-earth"
end

-- =====================================================================
-- SMART LSP SYNTAX LINKING
-- Maps your native LSP token context back to your current theme colors
-- =====================================================================

-- 1. Parameters & Arguments (Makes variable usage inside functions smart)
vim.api.nvim_set_hl(0, "@lsp.type.parameter", { link = "Identifier" })

-- 2. Clean up Object Methods vs Regular Global Functions
vim.api.nvim_set_hl(0, "@lsp.type.method",    { link = "Function" })

-- 3. Types, Structs, Classes, and Interfaces 
vim.api.nvim_set_hl(0, "@lsp.type.type",      { link = "Type" })
vim.api.nvim_set_hl(0, "@lsp.type.class",     { link = "Type" })
vim.api.nvim_set_hl(0, "@lsp.type.struct",    { link = "Type" })
vim.api.nvim_set_hl(0, "@lsp.type.enum",      { link = "Type" })

-- 4. Constants and Macros (Ensures your LSP spots global variables)
vim.api.nvim_set_hl(0, "@lsp.type.macro",     { link = "Constant" })
vim.api.nvim_set_hl(0, "@lsp.type.enumMember",{ link = "Constant" })

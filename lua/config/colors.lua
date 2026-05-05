-- Stale Earth colorscheme
-- Warm, earthy tones — no blue, cyan, bright green, purple, or pink

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Base UI
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

-- Set colorscheme name
vim.g.colors_name = "stale-earth"

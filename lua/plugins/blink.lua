return {
  "saghen/blink.cmp",
  version = "*",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    keymap = { preset = "enter" },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = { auto_show = false },
      list = {
        selection = { preselect = true, auto_insert = true },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}

return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = { border = "single" },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "lua_ls", "ts_ls", "html", "cssls", "jsonls",
        "gopls", "rust_analyzer", "pyright", "bashls",
        "markdown"
      },
    },
  },

  -- nvim-lspconfig provides server definitions in its lsp/ directory.
  -- vim.lsp.enable() reads them automatically. No require('lspconfig') needed.
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    dependencies = { "saghen/blink.cmp" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Apply capabilities globally
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- Override specific servers
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = { enable = false },
          },
        },
      })

      vim.lsp.config("gopls", {
        settings = { gopls = { staticcheck = true, gofumpt = true } },
      })

      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = { check = { command = "clippy" } },
        },
      })

      -- Enable all servers — nvim-lspconfig provides the configs in lsp/
      vim.lsp.enable({
        "lua_ls", "ts_ls", "html", "cssls", "jsonls",
        "gopls", "rust_analyzer", "pyright", "bashls",
        "markdown"
      })
    end,
    event = { "BufReadPre", "BufNewFile" },
  },
}

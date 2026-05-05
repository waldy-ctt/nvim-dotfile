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
      },
    },
  },

  -- nvim-lspconfig: provides server definitions consumed by vim.lsp.enable()
  -- Neovim 0.12 native API — NO require('lspconfig').setup() calls
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Custom server configs using vim.lsp.config (0.12 API)
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
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
        capabilities = capabilities,
        settings = { gopls = { staticcheck = true, gofumpt = true } },
      })

      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
        settings = {
          ["rust-analyzer"] = { check = { command = "clippy" } },
        },
      })

      -- Servers that only need capabilities
      local basic = { "ts_ls", "html", "cssls", "jsonls", "pyright", "bashls" }
      for _, s in ipairs(basic) do
        vim.lsp.config(s, { capabilities = capabilities })
      end

      -- Activate all servers
      vim.lsp.enable({
        "lua_ls", "ts_ls", "html", "cssls", "jsonls",
        "gopls", "rust_analyzer", "pyright", "bashls",
      })
    end,
    event = "VeryLazy",
  },
}

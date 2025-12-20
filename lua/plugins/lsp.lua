return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" }, -- Make sure blink loads first
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- 2. Configure Typescript (ts_ls)
    vim.lsp.config['ts_ls'] = {
      capabilities = capabilities, -- Pass blink capabilities
      on_attach = function(client)
        -- Disable formatting so Prettier handles it
        client.server_capabilities.documentFormattingProvider = false
      end,
    }

    -- 3. Configure Go (gopls)
    -- This standard syntax ensures options + capabilities are passed correctly
    vim.lsp.config['gopls'] = {
      capabilities = capabilities, -- CRITICAL: This enables rich completions
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
            shadow = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    }

    vim.lsp.enable('ts_ls')
    vim.lsp.enable('gopls')
  end,
}

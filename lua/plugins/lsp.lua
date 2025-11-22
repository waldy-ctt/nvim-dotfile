return {
  "neovim/nvim-lspconfig",
  config = function()
    -- 1. Define the configuration (Merges with nvim-lspconfig defaults)
    vim.lsp.config('ts_ls', {
      -- Disable formatting so Prettier can handle it
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = false
      end,
      -- Add Blink.cmp capabilities if you use it
      capabilities = require("blink.cmp").get_lsp_capabilities(
         vim.lsp.protocol.make_client_capabilities()
      ),
    })

    -- 2. Enable the server
    vim.lsp.enable('ts_ls')
  end
}

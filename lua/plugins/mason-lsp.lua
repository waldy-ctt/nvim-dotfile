return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    ensure_installed = { "ts_ls" },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    require("mason-lspconfig").setup()

    local installed_servers = require("mason-lspconfig").get_installed_servers()

    for _, server in ipairs(installed_servers) do
      -- 1. SKIP LIST
      -- rust_analyzer / rust-analyzer: Handled by rustaceanvim
      -- ts_ls: Handled by your separate manual config
      if server ~= "rust_analyzer" and server ~= "rust-analyzer" then
        -- 2. Configure the server (for Nvim 0.11+)
        vim.lsp.config(server, {
          capabilities = require("blink.cmp").get_lsp_capabilities(
            vim.lsp.protocol.make_client_capabilities()
          ),
        })

        -- 3. Enable ONLY this server
        vim.lsp.enable(server)
      end
    end

    -- IMPORTANT: Do NOT put vim.lsp.enable() here.
    -- It will re-enable the duplicate Rust client you just tried to skip.
  end,
}

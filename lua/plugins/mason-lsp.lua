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

        for _, server in ipairs(require("mason-lspconfig").get_installed_servers()) do
            vim.lsp.config[server] = {
                setup = function()
                    lspconfig[server].setup({
                        capabilities = require("blink.cmp").get_lsp_capabilities(
                            vim.lsp.protocol.make_client_capabilities()
                        ),
                    })
                end,
            }
        end

        -- Auto-start any registered server when a matching buffer opens
        vim.lsp.enable({ reuse_client = true })
    end,
}

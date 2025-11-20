return {
	"neovim/nvim-lspconfig",
    config = function ()
        vim.lsp.tsserver = {
            format = false
        }
    end
}

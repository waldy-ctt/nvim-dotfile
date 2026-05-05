return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      typescript = { "prettierd" },
      javascript = { "prettierd" },
      typescriptreact = { "prettierd" },
      javascriptreact = { "prettierd" },
      json = { "prettierd" },
      html = { "prettierd" },
      css = { "prettierd" },
      go = { "gofumpt", "goimports" },
      rust = { "rustfmt" },
      python = { "isort", "black" },
      markdown = { "prettierd" },
      yaml = { "prettierd" },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 2500, lsp_fallback = true }
    end,
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ lsp_fallback = true })
      end,
      desc = "Format",
    },
  },
}

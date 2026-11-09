local server_list = { 'ts_ls', 'lua_ls' }

vim.pack.add({
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/mason-org/mason.nvim', name = 'mason' },
  { src = 'https://github.com/mason-org/mason-lspconfig.nvim', name = 'mason-lspconfig' },
})

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = server_list
})

vim.lsp.enable(server_list)

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    if client:supports_method('textDocument/completion', bufnr) then
      vim.lsp.completion.enable(true, client.id, bufnr, {
        autotrigger = false,
      })
    end

    if client and client:supports_method('textDocument/inlineCompletion', bufnr) then
      -- Enable the feature with the correct API
      vim.lsp.inline_completion.enable(true, { bufnr = bufnr })

      -- Add keymaps to accept or cycle suggestions
      vim.keymap.set('i', '<Tab>', function()
        if not vim.lsp.inline_completion.get() then
          return '<Tab>'
        end
      end, { expr = true, buffer = bufnr, desc = 'LSP: Accept inline completion' })
      
      vim.keymap.set('i', '<C-]>', vim.lsp.inline_completion.select, { buffer = bufnr, desc = 'LSP: Next inline suggestion' })
      vim.keymap.set('i', '<C-[>', function() vim.lsp.inline_completion.select({ count = -1 }) end, { buffer = bufnr, desc = 'LSP: Previous inline suggestion' })
    end
  end,
})

vim.opt.completeopt = { 'menuone', 'noinsert' }
vim.o.pumborder = 'single' -- or 'single', 'double', 'shadow', 'solid', 'none'
vim.api.nvim_set_hl(0, 'PmenuBorder', { link = 'FloatBorder' })
-- or a custom color:
-- vim.api.nvim_set_hl(0, 'PmenuBorder', { fg = '#4c566a' })
-- Example: a dark background for the menu, a blue highlight for the selection
vim.api.nvim_set_hl(0, 'Pmenu',   { bg = '#2e3440' })
vim.api.nvim_set_hl(0, 'PmenuSel', { bg = '#5e81ac', fg = '#eceff4', bold = true })

vim.cmd('syntax enable')

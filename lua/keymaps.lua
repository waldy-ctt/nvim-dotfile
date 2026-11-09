-- Oil
vim.keymap.set("n", "<leader>e", "<cmd>Oil<CR>", { desc = "Open Oil" })

-- Clean ESC
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR>", { silent = true })

-- Completion: <C-n> triggers if closed, navigates if open
vim.keymap.set("i", "<C-n>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-n>"
  end
  vim.lsp.completion.get()
end, { expr = true, desc = "Trigger/Next completion" })

-- Symmetric <C-p> (previous). Native <C-p> would trigger keyword
-- completion, not LSP; this overrides it to match <C-n>.
vim.keymap.set("i", "<C-p>", function()
  if vim.fn.pumvisible() == 1 then
    return "<C-p>"
  end
  vim.lsp.completion.get()
end, { expr = true, desc = "Trigger/Previous completion" })

-- Scroll the documentation popup when the completion menu is visible
vim.keymap.set('i', '<C-f>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-f>'
  end
  return '<C-f>' -- Fallback for normal scrolling
end, { expr = true, desc = 'Scroll docs forward' })

vim.keymap.set('i', '<C-b>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-b>'
  end
  return '<C-b>' -- Fallback
end, { expr = true, desc = 'Scroll docs backward' })

-- Confirm selected completion item with <CR>
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-y>' -- Accept the currently selected item
  end
  return '<CR>'   -- Normal newline when menu is closed
end, { expr = true, desc = 'Confirm completion' })

local completion_docs = require('completion_docs')

vim.keymap.set('i', '<C-Space>', function()
  if vim.fn.pumvisible() == 1 then
    completion_docs.toggle()
  else
    vim.lsp.completion.get()
  end
end, { desc = 'Toggle completion/docs' })

-- HACK: force a border on the documentation float
local orig_complete_set = vim.api.nvim__complete_set
vim.api.nvim__complete_set = function(...)
  local result = orig_complete_set(...)
  if result and result.winid then
    pcall(vim.api.nvim_win_set_config, result.winid, { border = 'rounded' })
  end
  return result
end

local M = {}
local doc_win = nil

local function close_doc()
  if doc_win and vim.api.nvim_win_is_valid(doc_win) then
    vim.api.nvim_win_close(doc_win, true)
  end
  doc_win = nil
end

function M.toggle()
  -- If a doc float is already open, close it and return
  if doc_win and vim.api.nvim_win_is_valid(doc_win) then
    close_doc()
    return
  end

  local info = vim.fn.complete_info({ 'selected', 'items' })
  if info.selected < 0 or not info.items or #info.items == 0 then
    return
  end

  local item = info.items[info.selected + 1]
  local user_data = item.user_data
  local lsp_item = user_data
    and user_data.nvim
    and user_data.nvim.lsp
    and user_data.nvim.lsp.completion_item

  local docs = nil
  if lsp_item and lsp_item.documentation then
    local doc = lsp_item.documentation
    docs = type(doc) == 'table' and doc.value or tostring(doc)
  elseif item.info then
    docs = item.info
  end

  if not docs then return end

  local lines = vim.split(docs, '\n')
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local width = 60
  local height = math.min(#lines, 15)

  doc_win = vim.api.nvim_open_win(buf, false, {
    relative = 'editor',
    row = vim.fn.line('w0') + 2,
    col = vim.fn.wincol() + 10,
    width = width,
    height = height,
    style = 'minimal',
    border = 'rounded',
    title = ' Documentation ',
    title_pos = 'center',
  })

  vim.bo[buf].filetype = 'markdown'
end

-- Auto-close the float when completion ends
vim.api.nvim_create_autocmd('CompleteDone', {
  callback = close_doc,
})

return M

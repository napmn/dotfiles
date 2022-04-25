local M = {}
-- currently doesnt work, preview_location returns nil and nothing is showed
local function preview_location_callback(_, method, result)
  if result == nil or vim.tbl_isempty(result) then
    vim.notify("No location found", "error")
    return nil
  end
  if vim.tbl_islist(result) then
    vim.notify("first")
    vim.notify(vim.inspect(result))
    vim.lsp.util.preview_location(result[1])
  else
    vim.notify("second")
    vim.notify(vim.inspect(result))
    local something = vim.lsp.util.preview_location(result)
  end
end

M.peek_definition = function()
  local params = vim.lsp.util.make_position_params()
  return vim.lsp.buf_request(0, 'textDocument/definition', params, preview_location_callback)
end

return M

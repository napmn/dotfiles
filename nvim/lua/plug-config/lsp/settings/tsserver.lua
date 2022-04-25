local filter = function(arr, fn)
  if type(arr) ~= "table" then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local filter_react_dts = function(value)
  return string.match(value.uri, 'react/index.d.ts') == nil
end

return {
  handlers = {
    -- filter out "react/index.d.ts" FC definition when using 'go to definition' on FC components
    ['textDocument/definition'] = function(err, result, method, ...)
      local filtered_result = result
      if vim.tbl_islist(result) and #result > 1 then
        filtered_result = filter(result, filter_react_dts)
      end
      vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
    end
  }
}

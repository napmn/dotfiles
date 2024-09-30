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
  return string.match(value.targetUri, 'react/index%.d%.ts') == nil
end

local filter_styled_components_dts = function(value)
  return string.match(value.targetUri, 'styled%-components/index%.d%.ts') == nil
end

local opts = {
  on_attach = require("plug-config.lsp.handlers").on_attach,
  capabilities = require("plug-config.lsp.handlers").capabilities
}

require("typescript-tools").setup {
  on_attach = require("plug-config.lsp.handlers").on_attach,
  capabilities = require("plug-config.lsp.handlers").capabilities,
  handlers = {
    -- filter out "react/index.d.ts" and "styled-components/index.d.ts" FC definition when using 'go to definition' on FC components
    ['textDocument/definition'] = function(err, result, method, ...)
      local filtered_result = result
      if vim.tbl_islist(result) and #result > 1 then
        filtered_result = filter(result, filter_react_dts)
        filtered_result = filter(filtered_result, filter_styled_components_dts)
      end
      vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
    end
  },
  settings = {
    -- spawn additional tsserver instance to calculate diagnostics on it
    separate_diagnostic_server = true,
    -- "change"|"insert_leave" determine when the client asks the server about diagnostic
    publish_diagnostic_on = "insert_leave",
    -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
    -- "remove_unused_imports"|"organize_imports") -- or string "all"
    -- to include all supported code actions
    -- specify commands exposed as code_actions
    expose_as_code_action = "all",
    -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
    -- not exists then standard path resolution strategy is applied
    tsserver_path = nil,
    -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
    -- (see 💅 `styled-components` support section)
    tsserver_plugins = {
      '@styled/typescript-styled-plugin'
    },
    -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
    -- memory limit in megabytes or "auto"(basically no limit)
    tsserver_max_memory = "auto",
    -- described below
    tsserver_format_options = {},
    tsserver_file_preferences = {
      importModuleSpecifierPreference = "project-relative",
    },
    -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
    complete_function_calls = false,
    include_completions_with_insert_text = true,
    -- CodeLens
    -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
    -- possible values: ("off"|"all"|"implementations_only"|"references_only")
    code_lens = "off",
    -- by default code lenses are displayed on all referencable values and for some of you it can
    -- be too much this option reduce count of them by removing member references from lenses
    disable_member_code_lens = true,
  },
}

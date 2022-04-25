local null_ls = require("null-ls")
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    diagnostics.flake8.with({
      condition = function()
        -- TODO: check if flake should be used
        return false
      end
    }),
    diagnostics.pylint.with({
      condition = function()
        -- TODO: check if pylint should be used
        return false
      end
    }),
    diagnostics.eslint
  },
})

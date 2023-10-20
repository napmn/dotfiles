require("mason-lspconfig").setup()

local opts = {
  on_attach = require("plug-config.lsp.handlers").on_attach,
  capabilities = require("plug-config.lsp.handlers").capabilities
}

local pyright_opts = require("plug-config.lsp.settings.pyright")
require("lspconfig").pyright.setup(vim.tbl_deep_extend("force", pyright_opts, opts))

require("plug-config.lsp.handlers").setup()

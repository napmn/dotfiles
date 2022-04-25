local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("plug-config.lsp.handlers").on_attach,
    capabilities = require("plug-config.lsp.handlers").capabilities
  }

  if server.name == "pyright" then
    local pyright_opts = require("plug-config.lsp.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server.name == "tsserver" then
    local tsserver_opts = require("plug-config.lsp.settings.tsserver")
    opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("plug-config.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  server:setup(opts)
end)

local notify_utils = require("napmn.nvim-notify")
local M = {}

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", hl = "DiagnosticError", text = "" },
    { name = "DiagnosticSignWarn", hl = "DiagnosticWarn", text = "" },
    { name = "DiagnosticSignHint", hl = "DiagnosticInfo", text = "" },
    { name = "DiagnosticSignInfo", hl = "DiagnosticHint", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.hl, text = sign.text, numhl = "" })
  end

  --  TODO: check severities after pylint / flake is working
  local config = {
    virtual_text = false,
    signs = {
      active = signs,
      severity = { min = vim.diagnostic.severity.INFO }
    },
    update_in_insert = false,
    underline = {
      severity = { min = vim.diagnostic.severity.ERROR }
    },
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = ""
    }
  }

  vim.diagnostic.config(config)

  -- filters out empty suggestions for hover
  vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
    config = config or {}
    config.focus_id = ctx.method
    if not (result and result.contents) then
      return
    end
    local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
    if vim.tbl_isempty(markdown_lines) then
      return
    end
    return vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })(_, result, ctx, config)
  end

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded"
  })

  vim.lsp.handlers["$/progress"] = function(_, result, ctx)
    local value = result.value
    local client_id = ctx.client_id

    if not value.kind then
      return
    end

    if vim.lsp.get_client_by_id(client_id).name == "sumneko_lua" then
      -- showing loading of two workspaces which is weird
      return
    end

    -- !!!
    -- displaying only initial load progress of client, not additional
    -- because pyright omits progress after each change in the file...
    -- !!!

    -- local notif_data = notify_utils.get_notif_data(client_id, result.token)
    local notif_data = notify_utils.get_notif_data(client_id, nil)

    if notif_data.client_loaded then
      return
    end

    if value.kind == "begin" then
      local message = notify_utils.format_message(value.message, value.percentage)

      notif_data.notification = vim.notify(message, "info", {
        title = notify_utils.format_title(value.title, vim.lsp.get_client_by_id(client_id).name),
        icon = notify_utils.spinner_frames[1],
        timeout = false,
        hide_from_history = false
      })

      notif_data.spinner = 1
      -- notify_utils.update_spinner(client_id, result.token)
      notify_utils.update_spinner(client_id, nil)
    elseif value.kind == "report" and notif_data then
      local message = notify_utils.format_message(value.message, value.percentage)

      notif_data.notification = vim.notify(message, "info", {
        replace = notif_data.notification,
        hide_from_history = false
      })
    elseif value.kind == "end" and notif_data then
      local message = value.message and notify_utils.format_message(value.message) or "Complete"
      notif_data.notification = vim.notify(message, "info", {
        icon = "",
        replace = notif_data.notification,
        timeout = 3000
      })

      notif_data.spinner = nil
      notif_data.client_loaded = true
    end
  end
end

local lsp_signature_config = {
  hint_enable = false -- disable virtual text hint
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  -- preview https://www.reddit.com/r/neovim/comments/jsdox0/builtin_lsp_preview_definition_under_cursor/
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", ":lua vim.lsp.buf.definition()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", ":lua vim.lsp.buf.hover()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gH", ":lua vim.diagnostic.open_float()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>fd", "<cmd>Format<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "v", "<Leader>fd", "<cmd>Format<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<Leader>ca", ":lua vim.lsp.buf.code_action()<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]g", '<cmd>lua vim.diagnostic.goto_next({ severity = { min = vim.diagnostic.severity.INFO } })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[g", '<cmd>lua vim.diagnostic.goto_prev({ severity = { min = vim.diagnostic.severity.INFO } })<CR>', opts)
end

local function lsp_highlight_document(client)
  -- highlight references on cursor hold
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
      ]],
      false
    )
  end
end

local deprecated_handler = require("nvim-custom-diagnostic-highlight").setup {
    register_handler = false,
    highlight_group = "LSPDeprecated",
    patterns_override = { "deprecated" },
    diagnostic_handler_namespace = "deprecated_handler",
}
vim.cmd [[highlight LSPDeprecated gui=strikethrough]]
vim.diagnostic.handlers["my/deprecated"] = deprecated_handler

M.on_attach = function(client, bufnr)
  require("lsp_signature").on_attach(lsp_signature_config)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return M

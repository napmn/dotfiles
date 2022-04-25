local M = {}

local colors = {
  bg = '#2e3447',
  fg = '#bfc7d5',
  section_bg = '#414860',
  fg_darker = '#697098',
  grey = "#3e4452",
  blue = '#82aaff',
  orange = '#ffcb6b',
  red = '#ff5370',
  magenta = '#c792ea',
  cyan = '#89ddff',
  green = '#c3e88d'
}


M.theme = {
  -- normal is used for all other modes
  normal = {
    a = { bg = colors.cyan, fg = colors.bg, gui = "bold" },
    b = { bg = colors.section_bg },
    c = { bg = colors.bg, fg = colors.orange },
    x = { bg = colors.bg, fg = colors.fg_darker },
    y = { bg = colors.section_bg, fg = colors.fg },
    z = { bg = colors.section_bg, fg = colors.fg }
  }
}

local lenny_mapping = {
  n       = '  (⌐■_■)  ',
  i       = '  (ಠ_ಠ)   ',
  c       = '  ⤜(ʘ_ʘ)⤏ ',
  V       = ' ( ͡° ͜ʖ ͡°) ',
  ['']    = ' ( ͡° ͜ʖ ͡°) ',
  v       = ' ( ͡° ͜ʖ ͡°) ',
  R       = ' ⤜(ʘ_ʘ)⤏  ',
  s       = '  (ಠ_ಠ)   ',
  S       = '  (ಠ_ಠ)   ',
}

local highlight_mapping = {
  n       = 'LualineModeN',
  i       = 'LualineModeI',
  c       = 'LualineModeC',
  V       = 'LualineModeV',
  ['']    = 'LualineModeV',
  v       = 'LualineModeV',
  R       = 'LualineModeR',
  s       = 'LualineModeR',
  S       = 'LualineModeR',
}

local mode_alias = {
  n       = ' NORMAL ',
  i       = ' INSERT ',
  c       = ' COMMAND',
  V       = ' VISUAL ',
  ['']    = ' VISUAL ',
  v       = ' VISUAL ',
  R       = ' REPLACE',
  s       = ' SELECT ',
  S       = ' SELECT ',
}

M.mode_with_lenny = function()
  local mode = vim.fn.mode()
  return lenny_mapping[mode]
    .. "%#" .. highlight_mapping[mode] .. "#"
    .. mode_alias[mode]
end

M.lsp_server_info = function()
  local msg = "No active LSP"
  local clients = vim.lsp.get_active_clients()

  if #clients == 0 then
    return msg
  end

  msg = clients[1].name
  for i = 2, #clients do
    msg = msg .. ", " .. clients[i].name
  end
  return msg
end

return M

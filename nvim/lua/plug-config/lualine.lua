local my_lualine = require("napmn.lualine")
local theme = my_lualine.theme
local mode_with_lenny = my_lualine.mode_with_lenny
local lsp_server_info = my_lualine.lsp_server_info

require("lualine").setup({
  options = {
    theme = 'tokyonight',
    -- theme = theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = ''},
    -- globalstatus = true,
  },
  sections = {
    lualine_a = {
      {
        mode_with_lenny,
        padding = 0,
      },
    },
    lualine_b = {
      {
        "filetype",
        colored = true,
        icon_only = true,
        padding = { left = 1, right = 0}
      },
      {
        "filename",
        symbols = {
          modified = " ",
          readonly = "",
          unnamed = " "
        }
      }
    },
    lualine_c = {
      { "branch", icon = "" },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " "
        }
      }
    },
    lualine_x = {
      {
        lsp_server_info,
        icon = " LSP:"
      }
    },
    lualine_y = {
      {
        "progress",
        separator = { left = "", right = ""},
        fmt = function(str)
          return "%#MiniStatuslineDevinfo#" .. str
        end
      }
    },
    lualine_z = {
      {
        "location",
        fmt = function(str)
          return "%#MiniStatuslineDevinfo#▎" .. str
        end,
        padding = { left = 0, right = 1}
      }
    }
  },
})

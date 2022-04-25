local gl = require('galaxyline')
local gls = gl.section
-- local condition = require('galaxyline.condition')
-- local diagnostic = require('galaxyline.provider_diagnostic')

gl.short_line_list = {'NvimTree','vista','dbui','packer', 'startify'}

-- Onedark
-- local colors = {
--   bg = '#2e3440',
--   fg = '#c8ccd4',
--   fg_darker = '#abb2bf',
--   section_bg = '#3D434F',
--   grey = "#545454",

--   blue = '#61afef',
--   orange = '#e5c07b',
--   red = '#e06c75',
--   magenta = '#c678dd',
--   cyan = '#56b6c2',
--   green = '#98c379'
-- }

-- Palenight
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


local mode_color = function()
  local mode_colors = {
    -- onedark
    -- n = colors.blue,
    -- palenight
    n = colors.cyan,
    -- onedark
    -- i = colors.green,
    -- palenight
    i = colors.orange,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
  }

  return mode_colors[vim.fn.mode()]
end

local icons = {
    sep = {
        right = "",
        left = ""
    },
    diagnostic = {
        error = " ",
        warn = " ",
        info = " "
    },
    diff = {
        add = " ",
        modified = " ",
        remove = " "
    },
    git = "",
}

local white_space = function() return ' ' end

-- --------------------------------------Left side-----------------------------------------------------------
gls.left[1] = {
  FirstElement = {
    provider = function() return icons.sep.right end,
    -- onedark
    -- highlight = { colors.blue, colors.bg }
    -- palenight
    highlight = { colors.cyan, colors.bg }
  },
}

gls.left[2] = {
  Logo = {
    provider = function()
      local mapping = {
        n       = '  (⌐■_■)  ',
        i       = '  (ಠ_ಠ)   ',
        c       = '  ⤜(ʘ_ʘ)⤏ ',
        V       = ' ( ͡° ͜ʖ ͡°) ',
        ['']    = ' ( ͡° ͜ʖ ͡°) ',
        v       = ' ( ͡° ͜ʖ ͡°) ',
        R       = ' ⤜(ʘ_ʘ)⤏  ',
      }
      return '' .. mapping[vim.fn.mode()]
    end,
    -- onedark
    -- highlight = { colors.bg, colors.blue }
    -- palenight
    highlight = { colors.bg, colors.cyan }
  },
}

gls.left[3] = {
  ViMode = {
    provider = function()
      local alias = {
        n       = 'NORMAL ',
        i       = 'INSERT ',
        c       = 'COMMAND',
        V       = 'VISUAL ',
        ['']    = 'VISUAL ',
        v       = 'VISUAL ',
        R       = 'REPLACE',
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color()..' gui=bold')
      return '  ' .. alias[vim.fn.mode()]
    end,
    highlight = { colors.bg, colors.bg },
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.section_bg},
  },
}

gls.left[4] ={
  FileIcon = {
    provider = {white_space, 'FileIcon'},
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
  },
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    highlight = { colors.fg, colors.section_bg },
    separator = icons.sep.left .. ' ',
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

gls.left[6] = {
    GitIcon = {
        provider = function()
            return "  "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[7] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.orange, colors.bg}
    }
}

gls.left[8] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg,colors.bg},
  }
}

gls.left[9] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = icons.diagnostic.error,
    highlight = {colors.red,colors.bg}
  }
}

gls.left[10] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg,colors.bg},
  }
}

gls.left[11] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = icons.diagnostic.warn,
    highlight = {colors.orange,colors.bg},
  }
}

gls.left[12] = {
  Space = {
    provider = white_space,
    highlight = {colors.bg,colors.bg},
  }
}

gls.left[13] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = icons.diagnostic.info,
    highlight = {colors.cyan, colors.bg},
  }
}

-- ------------------------------------Right side-----------------------------------------------------
-- gls.right[1] = {
--     GitBlame = {
--         provider = function()
--           local blame = vim.b.coc_git_blame
--           if vim.api.nvim_win_get_width(0) > 120 and blame then
--             return blame .. ' '
--           else
--             return ''
--           end
--         end,
--         condition = require("galaxyline.provider_vcs").check_git_workspace,
--         highlight = {colors.fg_darker, colors.bg}
--     }
-- }

gls.right[1] = {
  FirstSeparator = {
    provider = function() return icons.sep.right end,
    highlight = { colors.section_bg, colors.bg },
  }
}

gls.right[2] = {
  LinePercent = {
    provider = 'LinePercent',
    highlight = { colors.fg, colors.section_bg },
  },
}

gls.right[3] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = { colors.fg, colors.section_bg },
    separator = '| ',
    -- onedark
    -- separator_highlight = { colors.blue, colors.section_bg },
    -- palenight
    separator_highlight = { colors.cyan, colors.section_bg },
  },
}

gls.right[4] = {
  LastElement = {
    provider = function() return icons.sep.left end,
    -- onedark
    -- highlight = { colors.blue, colors.bg }
    -- palenight
    highlight = { colors.cyan, colors.bg }
  },
}

-- -------------------------Short status line---------------------------------------
gls.short_line_left[1] = {
  SFirstElement = {
    provider = function() return icons.sep.right end,
    highlight = { colors.grey, colors.bg },
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.bg},
  },
}

gls.short_line_left[2] ={
  SFileIcon = {
    provider = 'FileIcon',
    highlight = { colors.grey, colors.bg },
  },
}

gls.short_line_left[3] = {
  SFileName = {
    provider = 'FileName',
    highlight = {colors.grey, colors.bg},
    separator = icons.sep.left,
    separator_highlight = {colors.bg, colors.bg}
  }
}

gls.short_line_right[4] = {
  SLastElement = {
    provider = function() return icons.sep.left end,
    highlight = { colors.grey, colors.bg }
  },
}

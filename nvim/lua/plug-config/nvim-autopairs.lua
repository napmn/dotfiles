local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
fast_wrap = {
      map = '<C-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
      offset = -1, -- Offset from pattern match
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      highlight = 'Search',
      highlight_grey='Comment'
    },
})

-- Add spaces between parentheses (|) -> space -> ( | )
npairs.add_rules {
  Rule(' ', ' ')
    :with_pair(function(opts)
      local pair = opts.line:sub(opts.col - 1, opts.col)
      return vim.tbl_contains({ '()', '{}', '[]' }, pair)
    end)
    :with_move(cond.none())
    :with_cr(cond.none())
    :with_del(function(opts)
      local col = vim.api.nvim_win_get_cursor(0)[2]
      local context = opts.line:sub(col - 1, col + 2)
      return vim.tbl_contains({ '(  )', '{  }', '[  ]' }, context)
    end),
  Rule('', ' )')
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == ')' end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(')'),
  Rule('', ' }')
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == '}' end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key('}'),
  Rule('', ' ]')
    :with_pair(cond.none())
    :with_move(function(opts) return opts.char == ']' end)
    :with_cr(cond.none())
    :with_del(cond.none())
    :use_key(']'),
  -- to imitate vim auto-pairs -> remove one space if the content is blank
  Rule("%{%s+","")
    :use_regex(true, "}")
    :with_pair(function(opts)
      return cond.before_regex("%{%s+$", -1)(opts) and cond.after_text(" }")(opts) and opts.char == "}"
    end)
    :with_move(cond.none())
    :replace_endpair(function() return "<del><right>" end)
    :with_del(cond.none()),
  Rule("%[%s+","")
    :use_regex(true, "]")
    :with_pair(function(opts)
      return cond.before_regex("%[%s+$", -1)(opts) and cond.after_text(" ]")(opts) and opts.char == "]"
    end)
    :with_move(cond.none())
    :replace_endpair(function() return "<del><right>" end)
    :with_del(cond.none()),
  Rule("%(%s+","")
    :use_regex(true, ")")
    :with_pair(function(opts)
      return cond.before_regex("%(%s+$", -1)(opts) and cond.after_text(" )")(opts) and opts.char == ")"
    end)
    :with_move(cond.none())
    :replace_endpair(function() return "<del><right>" end)
    :with_del(cond.none()),
}

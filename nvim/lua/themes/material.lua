vim.cmd[[
" Don't set a background color when running in a terminal;
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let white = { "gui": "#bfc7d5", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call palenight#set_highlight("Normal", { "fg": white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif

if (has('termguicolors'))
  set termguicolors
endif

" let &t_Cs = "\e[4:3m"
" let &t_Ce = "\e[4:0m"
let g:palenight_terminal_italics=1

syntax on
colorscheme palenight

let float_color = "#414860"
let float_highlight = "#89ddff"

hi CursorLine guibg=#2e3447

hi! GitSignsChange guifg=#82b1ff

" floating diagnostics
exe 'hi! CocFloating guibg=' . float_color
" suggestion list
exe 'hi! Pmenu guibg=' . float_color
exe 'hi! PmenuSel guibg=#697098 guifg=' . float_highlight
exe 'hi! PmenuSbar guibg=' . float_color
exe 'hi! PmenuThumb guibg=' . float_highlight

hi! NormalFloat guibg=NONE

exe 'hi! Search guibg=' . float_highlight

hi! htmlTag guifg=#697098
hi! htmlEndTag guifg=#697098

hi! VertSplit guifg=#3e4452

" lualine custom
hi LualineModeN guibg=#2e3447 guifg=#89ddff gui=bold
hi LualineModeI guibg=#2e3447 guifg=#ffcb6b gui=bold
hi LualineModeC guibg=#2e3447 guifg=#ffcb6b gui=bold
hi LualineModeV guibg=#2e3447 guifg=#c792ea gui=bold
hi LualineModeR guibg=#2e3447 guifg=#ff5370 gui=bold
hi LualineSeparator guibg=#414860 guifg=#89ddff


" treesitter colors changes
hi! link TSKeyword TSConditional
hi! link TSParameter TSNone
hi! link TSTagDelimiter Comment
hi! link TSTag Keyword
hi! link TSProperty Type

" LSP
let error_color = "#ff5370"
let warn_color = "#ffcb6b"
let info_color = "#82b1ff"
let hint_color = "#82b1ff"
let highlight_color = "#414860"

" errors
exe 'hi! DiagnosticError guifg=' . error_color
exe 'hi! DiagnosticUnderlineError gui=undercurl guisp=' . error_color
exe 'hi LspDiagnosticsDefaultError guifg=' . error_color
exe 'hi LspDiagnosticsVirtualTextError guifg=' . error_color
exe 'hi LspDiagnosticsFloatingError guifg=' . error_color
exe 'hi DiagnosticSignError guifg=' . error_color
exe 'hi LspDiagnosticsSignError guifg=' . error_color
exe 'hi LspDiagnosticsError guifg=' . error_color

" warnings
exe 'hi! DiagnosticWarn guifg=' . warn_color
exe 'hi LspDiagnosticsDefaultWarning guifg=' . warn_color
exe 'hi LspDiagnosticsVirtualTextWarning guifg=' . warn_color
exe 'hi LspDiagnosticsFloatingWarning guifg=' . warn_color
exe 'hi DiagnosticSignWarning guifg=' . warn_color
exe 'hi LspDiagnosticsSignWarning guifg=' . warn_color
exe 'hi LspDiagnosticsWarning guifg=' . warn_color

" info and hints
exe 'hi! DiagnosticHint guifg=' . hint_color
exe 'hi LspDiagnosticsDefaultHint guifg=' . hint_color
exe 'hi LspDiagnosticsVirtualTextHint guifg=' . hint_color
exe 'hi LspDiagnosticsFloatingHint guifg=' . hint_color
exe 'hi DiagnosticSignHint guifg=' . hint_color
exe 'hi LspDiagnosticsSignHint guifg=' . hint_color
exe 'hi LspDiagnosticsHint guifg=' . hint_color

exe 'hi! DiagnosticInfo guifg=' . info_color
exe 'hi LspDiagnosticsDefaultInfo guifg=' . info_color
exe 'hi LspDiagnosticsVirtualTextInfo guifg=' . info_color
exe 'hi LspDiagnosticsFloatingInfo guifg=' . info_color
exe 'hi DiagnosticSignInfo guifg=' . info_color
exe 'hi LspDiagnosticsSignInfo guifg=' . info_color
exe 'hi LspDiagnosticsInfo guifg=' . info_color

" highlight
exe 'hi LspReferenceRead guibg=' . highlight_color
exe 'hi LspReferenceText guibg=' . highlight_color
exe 'hi LspReferenceWrite guibg=' . highlight_color

hi LspSignatureActiveParameter gui=underline

" notify
hi NotifyBackground guibg=#292d3e

hi NotifyERRORBorder guifg=#8A1F1F
hi NotifyWARNBorder guifg=#79491D
hi NotifyINFOBorder guifg=#82aaff
hi NotifyDEBUGBorder guifg=#8B8B8B
hi NotifyTRACEBorder guifg=#4F3552
hi NotifyERRORIcon guifg=#F70067
hi NotifyWARNIcon guifg=#F79000
hi NotifyINFOIcon guifg=#9cc4ff
hi NotifyDEBUGIcon guifg=#8B8B8B
hi NotifyTRACEIcon guifg=#D484FF
hi NotifyERRORTitle  guifg=#F70067
hi NotifyWARNTitle guifg=#F79000
hi NotifyINFOTitle guifg=#9cc4ff
hi NotifyDEBUGTitle  guifg=#8B8B8B
hi NotifyTRACETitle  guifg=#D484FF

hi IndentBlanklineChar guifg=#3b4048 gui=nocombine
hi NonText guifg=#3b4048 gui=nocombine
hi EndOfBuffer guibg=NONE guifg=#292d3e
]]

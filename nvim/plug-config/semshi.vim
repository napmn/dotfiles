let g:semshi#error_sign = v:false
" let g:semshi#simplify_markup = v:false
let g:semshi#excluded_hl_groups = ['local', 'unresolved']

"---------- ONEDARK CONFIG ----------"
" guidelines: http://chriskempson.com/projects/base16/
" base16 colors list: https://github.com/chriskempson/base16-html-previews/blob/master/previews/base16-onedark.html

function MyCustomHighlights()
  hi semshiLocal           ctermfg=209 guifg=#ff875f
  hi semshiFree            ctermfg=218 guifg=#ffafd7
  hi semshiUnresolved      ctermfg=226 guifg=#e5c07b cterm=underline gui=underline
  hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f
  " custom
  hi semshiImported        ctermfg=214 guifg=#c8ccd4
  hi semshiParameter       ctermfg=75  guifg=#56b6c2
  hi semshiAttribute       ctermfg=49  guifg=#abb2bf 
  hi semshiParameterUnused ctermfg=117 guifg=#abb2bf cterm=underline gui=underline
  hi semshiSelf            ctermfg=249 guifg=#e06c75 cterm=italic gui=italic
  hi semshiBuiltin         ctermfg=207 guifg=#61afef
  hi semshiGlobal          ctermfg=214 guifg=#e5c07b
endfunction
autocmd FileType python call MyCustomHighlights()

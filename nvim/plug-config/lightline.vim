" config for lightline as well as lightline-bufferline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'branch', 'readonly', 'filename', 'modified' ],
      \     [ 'cocstatus' ],
      \   ],
      \   'right': [
      \     [ 'lineinfo' ],
      \     [ 'percent' ],
      \     [ 'filetype', 'fileencoding' ],
      \     [ 'blame' ]
      \   ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'blame': 'LightlineGitBlame',
      \   'branch': 'LightlineGitBranch',
      \   'cocstatus': 'coc#status',
      \ }
\}

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  return winwidth(0) > 120 ? blame : ''
endfunction

function! LightlineGitBranch() abort
  let branch = get(g:, 'coc_git_status', '')
  return winwidth(0) > 80 ? branch : ''
endfunction

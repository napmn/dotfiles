" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use option + hjkl to resize windows - option has to be set as Meta key in
" terminal
nnoremap <C-A-j>    :resize -2<CR>
nnoremap <C-A-k>    :resize +2<CR>
nnoremap <C-A-h>    :vertical resize -2<CR>
nnoremap <C-A-l>    :vertical resize +2<CR>

" I hate escape more than anything else
inoremap jj <Esc>

" Easy CAPS
" inoremap <c-u> <ESC>viwUi
" nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

nnoremap <C-n> :nohl<CR>
" closes buffer but will not close split if it was opened
nnoremap <C-c> :bp\|bd #<CR>


nnoremap <A-j> :<c-u>execute 'move +'. v:count1<cr>
nnoremap <A-k> :<c-u>execute 'move -1-'. v:count1<cr>
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

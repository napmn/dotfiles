call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support - NOTE: this shit is slow with python files
    Plug 'sheerun/vim-polyglot'
    " Good for python indents - NOTE: also slows down empty line creation...
    Plug 'Vimjas/vim-python-pep8-indent'
    " Python syntax highlighting
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " statusline
    Plug 'itchyny/lightline.vim'
    " bufferline for lightline
    Plug 'mengelbrecht/lightline-bufferline'
    " startup and session manager
    Plug 'mhinz/vim-startify'
    " code completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'airblade/vim-rooter'
    " Easy 'surrounding' like brackets, quotes
    Plug 'tpope/vim-surround'
    " Commenting stuff
    Plug 'tpope/vim-commentary'
    " Replace with register
    Plug 'vim-scripts/ReplaceWithRegister'

    " tmux integration
    Plug 'christoomey/vim-tmux-navigator'

    " html / jsx tags closing
    Plug 'alvan/vim-closetag'

    " Themes
    Plug 'chriskempson/base16-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'tomasiser/vim-code-dark'
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }

call plug#end()

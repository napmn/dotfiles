local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/autoload/plugged')
-- improves startup time
Plug('lewis6991/impatient.nvim')

-- Good for python indents - NOTE: also slows down empty line creation...
Plug('Vimjas/vim-python-pep8-indent')
-- JSX indents because treesitters indents are still wonky
Plug('MaxMEllon/vim-jsx-pretty')
-- Better syntax highlighting
Plug('nvim-treesitter/nvim-treesitter') -- do :TSUpdate
Plug 'nvim-treesitter/playground'
-- Auto pairs for '(' '[' '{'
Plug('windwp/nvim-autopairs')
-- statusline
Plug('nvim-lualine/lualine.nvim')
-- bufferline
Plug('romgrk/barbar.nvim')
-- icons
Plug('kyazdani42/nvim-web-devicons')
-- startup and session manager
Plug('goolord/alpha-nvim')
-- completion
Plug('L3MON4D3/LuaSnip') -- snippet engine (needed for cmp)
Plug('hrsh7th/nvim-cmp')
Plug('saadparwaiz1/cmp_luasnip')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-nvim-lua')
-- lsp
Plug('neovim/nvim-lspconfig')
Plug('williamboman/nvim-lsp-installer')
Plug('ray-x/lsp_signature.nvim') -- for nice function signatures
Plug('jose-elias-alvarez/null-ls.nvim')
-- file explorer
Plug('MunifTanjim/nui.nvim') -- needed by neo-tree
Plug('nvim-neo-tree/neo-tree.nvim', { branch = 'v2.x' })
-- git
Plug('lewis6991/gitsigns.nvim')
-- fuzzy finder
Plug('nvim-lua/popup.nvim')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
Plug('airblade/vim-rooter')
-- Easy 'surrounding' like brackets, quotes
Plug('tpope/vim-surround')
-- Repeat plugin commands with dot
Plug('tpope/vim-repeat')
-- Commenting stuff
Plug('tpope/vim-commentary')
Plug('JoosepAlviste/nvim-ts-context-commentstring') -- for context aware comments using treesitter
-- Replace with register
Plug('vim-scripts/ReplaceWithRegister')
-- tmux integration
Plug('christoomey/vim-tmux-navigator')
-- html / jsx tags closing and replacing
Plug('windwp/nvim-ts-autotag')
-- toggle terminal
Plug('akinsho/toggleterm.nvim')
-- markdown preview
Plug('iamcco/markdown-preview.nvim', {['do'] = 'cd app && yarn install'})
-- cool scroll
Plug('karb94/neoscroll.nvim')
-- pretty notifications
Plug('rcarriga/nvim-notify')
-- colorizer of color codes
Plug('rrethy/vim-hexokinase', {['do'] = 'make hexokinase'})
-- indentlines
Plug('lukas-reineke/indent-blankline.nvim')
-- measures startup time
Plug('dstein64/vim-startuptime')
-- zen mode
Plug('folke/zen-mode.nvim')

-- Themes
-- Plug 'chriskempson/base16-vim'
-- Plug 'joshdick/onedark.vim'
Plug('drewtempelmeyer/palenight.vim')
Plug('marko-cerovac/material.nvim')

-- Local dev
-- Plug('~/Projects/opensource/react-extract.nvim')
Plug('napmn/react-extract.nvim')


vim.call('plug#end')

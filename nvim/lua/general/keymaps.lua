-- Functional wrapper for mapping custom keybindings
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- leader
map("", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- better nav for autocompletion
map("i", "<C-j>", "(\"\\<C-n>\")", { expr = true })
map("i", "<C-k>", "(\"\\<C-p>\")", { expr = true })

-- better navigation in cmdline path completion
vim.keymap.set({ "c" }, "<C-j>", "<C-n>")
vim.keymap.set({ "c" }, "<C-k>", "<C-p>")
vim.keymap.set({ "c" }, "<cr>", function()
  return vim.fn.wildmenumode() == 1 and "<Down>" or "<cr>"
end, { expr = true })

-- use option + hjkl to resize windows - option has to be set as Meta key in terminal
map("n", "<C-A-j>", ":resize -2<cr>")
map("n", "<C-A-k>", ":resize +2<cr>")
map("n", "<C-A-h>", ":vertical resize -2<cr>")
map("n", "<C-A-l>", ":vertical resize +2<cr>")

map("i", "jj", "<Esc>")

-- TAB in normal mode will move to text buffer (mapped to use bbye from barbar)
map("n", "<Tab>", ":BufferNext<cr>", { silent = true })
map("n", "<S-Tab>", ":BufferPrevious<cr>", { silent = true })

map("n", "<Leader>bp", "<cmd>BufferPick<cr>")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

map("n", "<Leader>o", "o<Esc>^Da")
map("n", "<Leader>O", "O<Esc>^Da")

-- toggle search highlighting
map("n", "<C-n>", "(&hls && v:hlsearch ? ':nohls' : ':set hls').\"\\n\"", { silent = true, expr = true })

-- closes buffer but will not mess up splits
map("n", "<C-c>", ":BufferClose<cr>", { silent = true })

map("n", "<A-j>", ":<c-u>execute 'move +'. v:count1<cr>")
map("n", "<A-k>", ":<c-u>execute 'move -1-'. v:count1<cr>")
map("v", "<A-j>", ":m '>+1<cr>gv=gv")
map("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- telescope
map("n", "<C-p>", "<cmd>Telescope find_files hidden=true<cr>", {})
map("n", "<C-f>", "<cmd>Telescope live_grep<cr>", { silent = true })
map("n", "<C-b>", "<cmd>Telescope buffers<cr>", { silent = true })
map("n", "<leader>tr", "<cmd>Telescope resume<cr>", { silent = true })
map("n", "<leader>twf", ":lua require('napmn.telescope').search_tailwind_docs()<cr>", { silent = true })
map("n", "<leader>twp", ":lua require('napmn.telescope').browse_tailwind_docs()<cr>", { silent = true })
map("n", "<leader>mdf", ":lua require('napmn.telescope').my_dotfiles()<cr>", { silent = true })

-- neo-tree
map("n", "<Leader>ff", ":NeoTreeFloatToggle<cr>", { silent = true })

-- gitsigns
map("n", "<Leader>gm", "<cmd>Gitsigns blame_line<cr>")
map("n", "<Leader>gp", "<cmd>Gitsigns preview_hunk<cr>")
map("n", "<Leader>g]g", "<cmd>Gitsigns next_hunk<cr>")
map("n", "<Leader>g[g", "<cmd>Gitsigns prev_hunk<cr>")

-- vim-tmux-navigator
map("n", "<C-h>", ":TmuxNavigateLeft<cr>", { silent = true })
map("n", "<C-j>", ":TmuxNavigateDown<cr>", { silent = true })
map("n", "<C-k>", ":TmuxNavigateUp<cr>", { silent = true })
map("n", "<C-l>", ":TmuxNavigateRight<cr>", { silent = true })

-- toggleterm
map("n", "<Leader>lg", ":lua require('napmn.toggleterm').lazygit_toggle()<cr>", { silent= true, noremap = true })
map("n", "<Leader>spt", ":lua require('napmn.toggleterm').spotify_toggle()<cr>", { silent= true, noremap = true })

-- completion keymaps are set in plug-config/cmp
-- LSP keymaps are set in plug-config/lsp/handlers

map("n", "<Leader>og", ":OpenGitRepo<cr>", { silent= true })

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

map("n", "<Leader><Leader>s", "<cmd>source ~/.config/nvim/lua/napmn/luasnip.lua<cr>", { silent = true })

-- react-extract
vim.keymap.set({ "v" }, "<Leader>re", require("react-extract").extract_to_new_file)
vim.keymap.set({ "v" }, "<Leader>rc", require("react-extract").extract_to_current_file)

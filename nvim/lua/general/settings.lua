vim.g.mapleader = "\\<Space>"

local options = {
    hidden = true,              -- Required to keep multiple buffers open multiple buffers
    wrap = false,               -- Display long lines as just one line
    encoding = "utf-8",         -- The encoding displayed
    pumheight = 10,             -- Makes popup menu smaller
    fileencoding = "utf-8",     -- The encoding written to file
    ruler = true,               -- Show the cursor position all the time
    cmdheight = 1,              -- For no extra space at the bottom
    mouse = "a",                -- Enable mouse in neovim
    splitbelow = true,          -- Horizontal splits will automatically be below
    splitright = true,          -- Vertical splits will automatically be to the right
    -- t_Co = 256,                 -- Support 256 colors
    conceallevel = 0,           -- To be able to see `` in markdown files
    tabstop = 2,                -- Insert 2 spaces for a tab
    shiftwidth = 2,             -- Change the number of space characters inserted for indentation
    smarttab = true,            -- Makes tabbing smarter will realize you have 2 vs 4
    expandtab = true,           -- Converts tabs to spaces
    smartindent = true,         -- Makes indenting smart
    autoindent = true,          -- Good auto indent
    relativenumber = true,      -- Line numbers
    number = true,              -- Both relativenumber and number are set for relative and current line absolute
    showmode = false,
    cursorline = true,          -- Enable highlighting of the current line
    background = "dark",        -- Tell vim what the background color looks like
    showtabline = 2,            -- Always show tabs
    backup = false,             -- This is recommended by coc
    writebackup = false,        -- This is recommended by coc
    updatetime = 300,           -- Faster completion
    timeoutlen = 500,           -- By default timeoutlen is 1000ms
    clipboard = "unnamedplus",  -- Copy paste between vim and everything else
    -- laststatus = 3,          -- Global statusline (lualine handles this)
    scrolloff = 8,              -- Scroll X lines before hitting bottom or top
    ignorecase = true,          -- Ignores case in commands
    smartcase = true,
    signcolumn="yes",           -- always include sign column
    termguicolors = true
}

vim.opt.shortmess:append "c"
vim.opt.listchars = {
    tab = "→ ",
    trail = "•",
}
vim.opt.list = true

for k, v in pairs(options) do
    vim.opt[k] = v
end


vim.cmd("syntax enable") -- Enable syntax highlighting vim.opt.shortmess:append "c"
vim.cmd("set iskeyword+=-") -- vim.opt.shortmess:append "c"
vim.cmd("set formatoptions-=cro")
vim.cmd("language en_US.UTF-8") -- Necessary for correct copy and paste of unicode

vim.cmd[[
augroup source_init_file
    autocmd!
    autocmd BufWritePost $MYVIMRC source %
augroup END
]]

-- sets cursor to vertical line after leaving nvim
vim.cmd[[
augroup restore_cursor
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25
augroup END
]]

-- changes colors of trailing whitespace when entering and leaving insert mode
vim.cmd[[
augroup toggle_list_in_insert_mode
    autocmd!
    autocmd InsertEnter * hi Whitespace guifg=#2e3447 gui=nocombine
        \ | hi IndentBlanklineSpaceChar guifg=#2e3447 gui=nocombine
    autocmd InsertLeave * hi Whitespace guifg=#ff5370 gui=nocombine
        \ | hi IndentBlanklineSpaceChar guifg=#ff5370 gui=nocombine
augroup END
]]

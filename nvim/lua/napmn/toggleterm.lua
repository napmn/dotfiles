local M = {}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-\\>", "<cmd>close<CR>", { noremap = true, silent = true })
  end
})
local spotify = Terminal:new({
  cmd = "spt",
  hidden = true,
  on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-\\>", "<cmd>close<CR>", { noremap = true, silent = true })
  end
})

M.lazygit_toggle = function()
  lazygit:toggle()
end

M.spotify_toggle = function()
  spotify:toggle()
end

return M

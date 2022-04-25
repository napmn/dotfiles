local alpha = require('alpha')
local dashboard = require('alpha.themes.dashboard')
local fortune = require('alpha.fortune')

local function footer()
  local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
  -- NOTE: works for vim plug
  local plugins_count = vim.fn.len(vim.fn.globpath("~/.config/nvim/autoload/plugged", "*", 0, 1))
  local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch

  return {
    "", -- empty line
    datetime .. "   " .. plugins_count .. "   v" .. version,
  }
end

dashboard.section.buttons.val = {
  dashboard.button("f", "  File explorer", "<cmd>:NeoTreeFloatToggle<cr><cr>"),
  dashboard.button("p", "  Find file", "<cmd> Telescope find_files hidden=true<cr>"),
  dashboard.button("g", "  Find text", "<cmd>Telescope live_grep<cr>"),
  dashboard.button("r", "  Recently opened", "<cmd>Telescope oldfiles<cr>"),
  dashboard.button("n", "  New file", ":ene <bar> startinsert <cr>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
  dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
}

dashboard.section.footer.val = footer()

dashboard.config.layout = {
  { type = "padding", val = 2 },
  dashboard.section.header,
  { type = "padding", val = 5 },
  dashboard.section.buttons,
  dashboard.section.footer,
}

alpha.setup(dashboard.config)

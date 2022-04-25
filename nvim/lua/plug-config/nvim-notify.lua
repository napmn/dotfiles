local notify = require("notify")

vim.notify = notify

notify.setup({
  background_colour = "NotifyBackground",
  -- minimum_width = 35,
  stages = "fade",
})

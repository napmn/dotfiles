local misc = require("napmn.misc")

-- later use vim.api.nvim_add_user_command (neovim 0.7+)
vim.cmd[[ command! OpenGitRepo exe 'lua require("napmn.misc").open_repo_in_browser()' ]]

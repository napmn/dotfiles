local utils = require("napmn.utils")

local M = {}

-- get git repo root dir (or nil)
local function get_git_root()
  local git_cmd = "git -C " .. vim.fn.getcwd() .. " rev-parse --show-toplevel"
  local root, rc = utils.lua_systemlist(git_cmd)

  if rc == 0 then return root[1] end
  return nil
end

-- get git remote names
local function get_git_remotes()
  local table, rc = utils.lua_systemlist("git remote -v | cut -f 1 | uniq")
  if rc ~= 0 then
    return {}
  end

  return table
end

-- open git repository in browser
M.open_repo_in_browser = function(remote)
  if get_git_root() == nil then
    vim.notify("Not in a git repository", "error", { title = "Could not open repo in browser" })
    return
  end

  remote = remote or "origin"

  local url, rc = utils.lua_system("git config remote." .. remote .. ".url")
  if rc ~= 0 then
    vim.notify(
      string.format("Found invalid remote url: [%s] -> %s", remote, url),
      "error",
      { title = "Could not open repo in browser" }
    )
    return
  end

  url = url:gsub("git:", "https://")
  url = url:gsub("git@", "https://")
  url = url:gsub("com:", "com/")
  url = url:gsub("org:", "org/") -- for bitbucket
  utils.lua_system("open -u " .. url)

  vim.notify(string.format("[%s] -> %s", remote, url), "info", { title = "opening remote in browser" })
end

return M

require'nvim-treesitter.configs'.setup {
  -- this is not installed automatically for some reason
  -- maybe becauses :TSUpdate post install hook doesnt work?? so install manually
  ensure_installed = {
    "css",
    "comment",
    "dockerfile",
    "html",
    "javascript",
    "json",
    "lua",
    "python",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false, -- huh??
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["tsx.type"] = "Identifier",
    },
  },
  autotag = {
    enable = true
  },
  context_commentstring = {
    enable = true
  },
  -- treesitter indent is not very good yet
  -- indent = {
  --   enable = true
  -- },
}

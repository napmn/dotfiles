require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- DevIcon will be appended to `name`
 override = {
  -- default xml icon causes telescope in tmux to make a weird shift of whole line
  xml = {
    icon = "",
    color = "#e37933",
    name = "Xml"
  }
 }
}

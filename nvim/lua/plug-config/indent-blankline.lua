require("ibl").setup({
  indent = { char = "┊" },
  scope = {
    enabled = false,
  },
  exclude = {
    filetypes = {
      "lspinfo",
      "lsp-installer",
      "packer",
      "checkhealth",
      "help",
      "alpha",
      "neo-tree"
    }
  },
})

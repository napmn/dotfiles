local M = {}

M.search_tailwind_docs = function()
  require('telescope.builtin').live_grep(
    require('telescope.themes').get_dropdown({
      layout_config = {
        width = 0.5,
      },
      -- results_height = 10,
      prompt_title = "Search Tailwind Docs",
      preview_title = "Documentation",
      cwd = "~/Projects/fun/scraping/tailwind-docs/tailwind_docs/"
    })
  )
end

M.browse_tailwind_docs = function()
  require('telescope.builtin').find_files(
    require('telescope.themes').get_dropdown({
      width = 0.5,
      -- results_height = 15,
      prompt_title = "Browse Tailwind Docs",
      preview_title = "Documentation",
      cwd = "~/Projects/fun/scraping/tailwind-docs/tailwind_docs/"
    })
  )
end

M.my_dotfiles = function()
  require('telescope.builtin').find_files(
    require('telescope.themes').get_dropdown({
      layout_config = {
        width = 0.5
      },
      preview_title = "Dotfiles",
      cwd = "~/.config/"
    })
  )
end

return M

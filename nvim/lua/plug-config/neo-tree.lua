local config = {
  default_source = "filesystem",
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  use_popups_for_input = false, -- If false, inputs will use vim.ui.input() instead of custom floats.
  close_floats_on_escape_key = true,
  enable_git_status = true,
  enable_diagnostics = true,
  open_files_in_last_window = true, -- false = open files in top left window
  log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
  log_to_file = false, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 1,
      with_markers = false,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
    },
    icon = {
      folder_closed = "",
      folder_open = "ﱮ",
      default = "*",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
    },
    git_status = {
      highlight = "NeoTreeDimText",
    },
  },
  filesystem = {
    bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
    -- The renderer section provides the renderers that will be used to render the tree.
    -- The first level is the node type.
    -- For each node type, you can specify a list of components to render.
    -- Components are rendered in the order they are specified.
    -- The first field in each component is the name of the function to call.
    -- The rest of the fields are passed to the function as the "config" argument.
    filtered_items = {
      visible = true, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_by_name = {
        ".DS_Store",
        "node_modules"
      },
      never_show = { -- remains hidden even if visible is toggled to true
        ".DS_Store",
        "node_modules"
      },
      gitignore_source = "git check-ignore", -- or "git status", which may be faster in some repos
    },
    find_by_full_path_words = false,  -- `false` means it only searches the tail of a path.
    -- `true` will change the filter into a full path
    -- search with space as an implicit ".*", so 
    -- `fi init`
    -- will match: `./sources/filesystem/init.lua
    --find_command = "fd",
    find_args = {  -- you can specify extra args to pass to the find command.
       "--exclude", ".git",
       "--exclude",  "node_modules"
    },
    ---- or use a function instead of list of strings
    --find_args = function(cmd, path, search_term, args)
      --  if cmd ~= "fd" then
        --    return args
      --  end
      --  --maybe you want to force the filter to always include hidden files:
      --  table.insert(args, "--hidden")
      --  -- but no one ever wants to see .git files
      --  table.insert(args, "--exclude")
      --  table.insert(args, ".git")
      --  -- or node_modules
      --  table.insert(args, "--exclude")
      --  table.insert(args, "node_modules")
      --  --here is where it pays to use the function, you can exclude more for
        --  --short search terms, or vary based on the directory
        --  if string.len(search_term) < 4 and path == "/home/cseickel" then
          --    table.insert(args, "--exclude")
          --    table.insert(args, "Library")
        --  end
        --  return args
        --end,
    search_limit = 50, -- max number of search results when using filters
    follow_current_file = false, -- This will find and focus the file in the active buffer every time
      -- the current file is changed while the tree is open.
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
      -- in whatever position is specified in window.position
      -- "open_split",  -- netrw disabled, opening a directory opens within the
      -- window like netrw would, regardless of window.position
      -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
    window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
      -- possible options. These can also be functions that return these options.
      position = "left", -- left, right, float, split
      width = 40, -- applies to left and right positions
      popup = { -- settings that apply to float position only
        size = {
          height = "80%",
          width = "50%",
        },
        position = "50%", -- 50% means center it
          -- you can also specify border here, if you want a different setting from
          -- the global popup_border_style.
        border = {
          style = "rounded",
          text = {
            top = " Files ",
            top_align = "center",
          },
        },
      },
      -- Mappings for tree window. See `:h nep-tree-mappings` for a list of built-in commands.
      -- You can also create your own commands by providing a function instead of a string.
      mappings = {
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["v"] = "open_vsplit",
        ["C"] = "close_node",
        ["z"] = "close_all_nodes",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["R"] = "refresh",
        -- ["/"] = "fuzzy_finder",
        ["/"] = "filter_as_you_type", -- this was the default until v1.28
        ["f"] = "filter_on_submit",
        ["<C-x>"] = "clear_filter",
        ["a"] = "add",
        ["A"] = "add_directory",
        -- double d because single waits a bit before asking for confirm
        ["dd"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["y"] = "copy", -- takes text input for destination
        ["m"] = "move", -- takes text input for destination
        ["q"] = "close_window",
      },
    },
    renderers = {
      directory = {
        { "indent" },
        { "icon" },
        { "current_filter" },
        { "name" },
        {
          "symlink_target",
          highlight = "NeoTreeSymbolicLinkTarget",
        },
        { "clipboard" },
        { "diagnostics", errors_only = true },
        -- { "git_status" },
      },
      file = {
        { "indent" },
        { "icon" },
        {
          "name",
          use_git_status_colors = true,
        },
        {
          "symlink_target",
          highlight = "NeoTreeSymbolicLinkTarget",
        },
        { "clipboard" },
        { "diagnostics" },
        { "git_status" },
      },
    },
  },
  buffers = {
    bind_to_cwd = true,
    window = {
      position = "left",
      width = 40,
      mappings = {
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["R"] = "refresh",
        ["a"] = "add",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["bd"] = "buffer_delete",
      },
    },
    renderers = {
      directory = {
        { "indent" },
        { "icon" },
        { "name" },
        { "diagnostics", errors_only = true },
        { "clipboard" },
      },
      file = {
        { "indent" },
        { "icon" },
        { "name" },
        { "bufnr" },
        { "diagnostics" },
        { "git_status" },
        { "clipboard" },
      },
    },
  },
  git_status = {
    window = {
      position = "left",
      width = 40,
      mappings = {
        ["<2-LeftMouse>"] = "open",
        ["<cr>"] = "open",
        ["S"] = "open_split",
        ["s"] = "open_vsplit",
        ["C"] = "close_node",
        ["R"] = "refresh",
        ["d"] = "delete",
        ["r"] = "rename",
        ["c"] = "copy_to_clipboard",
        ["x"] = "cut_to_clipboard",
        ["p"] = "paste_from_clipboard",
        ["A"] = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      },
    },
    renderers = {
      directory = {
        { "indent" },
        { "icon" },
        { "name" },
        { "diagnostics", errors_only = true },
      },
      file = {
        { "indent" },
        { "icon" },
        { "name" },
        { "diagnostics" },
        { "git_status" },
      },
    },
  },
  -- TODO: check this after https://github.com/nvim-neo-tree/neo-tree.nvim/issues/155#issuecomment-1081338852
  -- is merged
  -- event_handlers = {
  --   {
  --     event = "neo_tree_buffer_enter",
  --     handler = function()
  --       vim.cmd 'highlight! Cursor blend=100'
  --     end
  --   },
  --   {
  --     event = "neo_tree_buffer_leave",
  --     handler = function()
  --       vim.cmd 'highlight! Cursor guibg=#5f87af blend=0'
  --     end
  --   }
  -- }
}

require('neo-tree').setup(config)

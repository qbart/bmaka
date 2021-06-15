local config_helper = require('config_helper')
local nnoremap = config_helper.nnoremap
local tree_cb = require "nvim-tree.config".nvim_tree_callback
local g = vim.g

g.nvim_tree_width = 40
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":t"
g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 1

g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1
}

g.nvim_tree_icons = {
  default = " ",
  symlink = " ",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = "",
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = "",
  }
}

g.nvim_tree_bindings = {
	  ["<CR>"]           = tree_cb("edit"),
	  ["o"]              = tree_cb("edit"),
	  ["<2-LeftMouse>"]  = tree_cb("edit"),
	  ["<2-RightMouse>"] = tree_cb("cd"),
	  ["<C-]>"]          = tree_cb("cd"),
	  ["<C-v>"]          = tree_cb("vsplit"),
	  ["<C-x>"]          = tree_cb("split"),
	  ["<C-t>"]          = tree_cb("tabnew"),
	  ["<"]              = tree_cb("prev_sibling"),
	  [">"]              = tree_cb("next_sibling"),
	  ["P"]              = tree_cb("parent_node"),
	  ["<BS>"]           = tree_cb("close_node"),
	  ["<S-CR>"]         = tree_cb("close_node"),
	  ["<Tab>"]          = tree_cb("preview"),
	  ["K"]              = tree_cb("first_sibling"),
	  ["J"]              = tree_cb("last_sibling"),
	  ["I"]              = tree_cb("toggle_ignored"),
	  ["H"]              = tree_cb("toggle_dotfiles"),
	  ["R"]              = tree_cb("refresh"),
	  ["a"]              = tree_cb("create"),
	  ["d"]              = tree_cb("remove"),
	  ["r"]              = tree_cb("rename"),
	  ["<C-r>"]          = tree_cb("full_rename"),
	  ["x"]              = tree_cb("cut"),
	  ["c"]              = tree_cb("copy"),
	  ["p"]              = tree_cb("paste"),
	  -- ["[c"]             = tree_cb("prev_git_item"),
	  -- ["]c"]             = tree_cb("next_git_item"),
	  -- ["-"]              = tree_cb("dir_up"),
	  -- ["q"]              = tree_cb("close"),

  ["X"] = tree_cb("close_node"),
  ["ma"] = tree_cb("create"),
  ["md"] = tree_cb("remove"),
  ["mm"] = tree_cb("rename"),
  ["y"] = tree_cb("cut"),
  ["cn"] = tree_cb("copy_name"),
  ["cf"] = tree_cb("copy_path"),
  ["gy"] = tree_cb("copy_absolute_path"),
  ["[g"] = tree_cb("prev_git_item"),
  ["]g"] = tree_cb("next_git_item"),
}

nnoremap('<C-k><C-e>', ':NvimTreeToggle<CR>')

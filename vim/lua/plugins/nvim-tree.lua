local config_helper = require('config_helper')
local nnoremap = config_helper.nnoremap
local tree_cb = require "nvim-tree.config".nvim_tree_callback
local g = vim.g

function _G.nvim_tree_os_open()
  local lib = require "nvim-tree.lib"
  local node = lib.get_node_at_cursor()
  if node then
    vim.fn.jobstart("open '" .. node.absolute_path .. "' &", { detach = true })
  end
end

vim.cmd[[
  highlight NvimTreeIndentMarker guifg=#455574
]]

g.nvim_tree_indent_markers = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":t"
g.nvim_tree_allow_resize = 1
g.nvim_tree_highlight_opened_files = 1

g.nvim_tree_show_icons = {
  git = 1,
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


nnoremap('<C-k><C-r>', ':NvimTreeToggle<CR>')
nnoremap('<C-k><C-e>', ':NvimTreeFindFileToggle<CR>')

require'nvim-tree'.setup {
  actions = {
    open_file = {
      quit_on_open = 0
    }
  },
  filters = {
    dotfiles = false
  },
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  hijack_cursor       = false,
  update_cwd          = false,
  -- lsp_diagnostics     = false,
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },

  view = {
    width = 40,
    height = 30,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = true,
      list = {
        { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
        { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
        { key = {"<C-v>", "s"},                 cb = tree_cb("vsplit") },
        { key = "<C-x>",                        cb = tree_cb("split") },
        { key = "<C-t>",                        cb = tree_cb("tabnew") },
        { key = "<",                            cb = tree_cb("prev_sibling") },
        { key = ">",                            cb = tree_cb("next_sibling") },
        { key = "P",                            cb = tree_cb("parent_node") },
        { key = "<BS>",                         cb = tree_cb("close_node") },
        { key = "<S-CR>",                       cb = tree_cb("close_node") },
        { key = "<Tab>",                        cb = tree_cb("preview") },
        { key = "<leader>k",                    cb = tree_cb("first_sibling") },
        { key = "<leader>j",                    cb = tree_cb("last_sibling") },
        { key = "I",                            cb = tree_cb("toggle_ignored") },
        { key = "H",                            cb = tree_cb("toggle_dotfiles") },
        { key = "R",                            cb = tree_cb("refresh") },
        { key = "a",                            cb = tree_cb("create") },
        { key = "d",                            cb = tree_cb("remove") },
        { key = "r",                            cb = tree_cb("rename") },
        { key = "<C-r>",                        cb = tree_cb("full_rename") },
        { key = "x",                            cb = tree_cb("cut") },
        { key = "c",                            cb = tree_cb("copy") },
        { key = "p",                            cb = tree_cb("paste") },
        { key = "y",                            cb = tree_cb("copy_name") },
        { key = "Y",                            cb = tree_cb("copy_path") },
        { key = "gy",                           cb = tree_cb("copy_absolute_path") },
        { key = "g?",                           cb = tree_cb("toggle_help") },

        { key = "X", cb = tree_cb("close_node"), },
        { key = "ma", cb = tree_cb("create"), },
        { key = "md", cb = tree_cb("remove"), },
        { key = "mm", cb = tree_cb("rename"), },
        { key = "y", cb = tree_cb("cut"), },
        { key = "cn", cb = tree_cb("copy_name"), },
        { key = "cf", cb = tree_cb("copy_path"), },
        { key = "gy", cb = tree_cb("copy_absolute_path"), },
        { key = "[g", cb = tree_cb("prev_git_item"), },
        { key = "]g", cb = tree_cb("next_git_item"), },
        { key = "<C-o>", cb = "<Cmd>lua _G.nvim_tree_os_open()<CR>" },
      }
    }
  }
}

vim.g.lf_netrw = 1

  require("lf").setup({
    default_actions = { -- default action keybindings
    ["<C-k>"] = "split",
    ["<C-l>"] = "vsplit",
  },

  winblend = 10, -- psuedotransparency level
  dir = "", -- directory where `lf` starts ('gwd' is git-working-directory, "" is CWD)
  direction = "float", -- window type: float horizontal vertical
  border = "curved", -- border kind: single double shadow curved
  height = 0.80, -- height of the *floating* window
  width = 0.80, -- width of the *floating* window
  escape_quit = true, -- map escape to the quit command (so it doesn't go into a meta normal mode)
  focus_on_open = true, -- focus the current file when opening Lf (experimental)
  mappings = true, -- whether terminal buffer mapping is enabled
  tmux = false, -- tmux statusline can be disabled on opening of Lf

  -- Layout configurations
  layout_mapping = "<A-u>" -- resize window with this key
})

vim.api.nvim_set_keymap(
  "n",
  "<C-e>",
  "<cmd>lua require('lf').start()<CR>",
  { noremap = true }
)

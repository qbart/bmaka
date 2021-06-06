local cmd = vim.cmd
local o = vim.o
local w = vim.wo
local b = vim.bo
local g = vim.g

-- gui
o.syntax = 'enable'         -- enable syntax highlighting
w.number = true             -- show line numbers
g.scrolloff = 4             -- show at least 4 lines when scrolling horizontaly
g.sidescrolloff = 15        -- show at lleast 4 lines when scrolling verticaly
o.mouse = 'a'               -- enable mouse support
w.colorcolumn = '81'        -- line lenght marker at 80 columns
o.splitright = true         -- vertical split to the right
o.splitbelow = true         -- orizontal split to the bottom
w.wrap = false              -- don't wrap lines by default
w.listchars = [[tab:>-,trail:~,extends:>,precedes:<]]
w.list = true               -- show whitespaces
w.cursorline = true
g.inccommand = 'nosplit'    -- live preview replace
w.signcolumn = 'yes'        -- always display column for signs left to numbers

-- Meta
g.mapleader = ' '
g.hidden = true
o.clipboard = "unnamedplus"
b.swapfile = false          -- don't use swapfile
o.lazyredraw = true         -- faster scrolling
b.synmaxcol = 240           -- max column for syntax highlight

-- indent
b.smartindent = true
b.tabstop = 2
b.softtabstop = 2
b.shiftwidth = 2
b.expandtab = true

-- encoding
b.fileencoding = 'utf-8'
g.encoding = 'utf-8'
g.langmenu = 'en_US.UTF-8'

-- searching and commangs
o.ignorecase = true         -- ignore case letters when search
o.smartcase = true          -- ignore lowercase for the whole pattern

-- for some reason I can't set it via lua api
cmd [[
  set undofile
  set undodir=$HOME/.config/nvim/undo
  set noswapfile
  set hidden
  set showtabline=2
  set inccommand=nosplit
]]

g.vimsyn_embed = 'l'

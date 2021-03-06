local config_helper = require('config_helper')

-- aliases
local map = config_helper.map
local vmap = config_helper.vmap
local tmap = config_helper.tmap
local imap = config_helper.imap
local nmap = config_helper.nmap
local cmap = config_helper.cmap
local vnoremap = config_helper.vnoremap
local inoremap = config_helper.inoremap
local nnoremap = config_helper.nnoremap
local cnoremap = config_helper.cnoremap
local tnoremap = config_helper.tnoremap
local unmap = config_helper.unmap

-- unmaps
nnoremap('Q', '<NOP>')  -- disable ex mode
nnoremap('q:', '<NOP>') -- disable command line
nnoremap('ZZ', '<NOP>') -- disable quit with ZZ

-- better movement
-- inoremap('jk', '<ESC>')
-- tmap('jk', [[<C-\><C-n>]])
tmap('<esc>', [[<C-\><C-n>]])
nmap('<leader>h', '^')
nmap('<leader>l', '$')
vmap('<leader>h', '^')
vmap('<leader>l', '$')
nnoremap('K', '5k')
nnoremap('J', '5j')
vnoremap('K', '5k')
vnoremap('J', '5j')
nnoremap('j', 'gj')
nnoremap('k', 'gk')

vnoremap('<Tab>', '>gv')
vnoremap('<S-Tab>', '<gv')

-- console like keymaps
cnoremap('<C-a>', '<Home>')
cnoremap('<C-e>', '<End>')
cnoremap('<C-p>', '<Up>')
cnoremap('<C-n>', '<Down>')
cnoremap('<C-b>', '<S-Left>')
cnoremap('<C-f>', '<S-Right>')
cnoremap('<C-g>', '<C-c>')
inoremap('<C-a>', '<Home>')
nnoremap('<C-e>', '<End>')

-- center screen after jump
nnoremap('g;', 'g;zz')
nnoremap('``', '``zz')
vnoremap('>', '>gv')
vnoremap('<', '<gv')
vnoremap('<Tab>', '>gv')
vnoremap('<S-Tab>', '<gv')
-- replaced by anzu
-- nnoremap('n', 'nzz')
-- nnoremap('N', 'Nzz')
-- nnoremap('*', '*zz')
-- nnoremap('#', '#zz')

-- save on cmd + s (mapped to f13-14 in alacritty config)
nnoremap('<F13>', '<esc>:w<CR>')
nnoremap('<F14>', '<esc>:wa<CR>')
inoremap('<F13>', '<esc>:w<CR>')
inoremap('<F14>', '<esc>:wa<CR>')

-- alt + hjkl to jump windows (cmd + hjkl mapped in alacritty config)
tnoremap('<C-w>h', [[<C-\><C-n><C-w>h]])
tnoremap('<C-w>j', [[<C-\><C-n><C-w>j]])
tnoremap('<C-w>k', [[<C-\><C-n><C-w>k]])
tnoremap('<C-w>l', [[<C-\><C-n><C-w>l]])
nnoremap('<M-h>', '<C-w>h')
nnoremap('<M-j>', '<C-w>j')
nnoremap('<M-k>', '<C-w>k')
nnoremap('<M-l>', '<C-w>l')

-- split and join lines
nnoremap('<leader>j', 'i<CR><Esc>')
nnoremap('<leader>k', '<esc>kJ')

nnoremap('/', [[/\V]])                                          -- search with nomagic flag
nnoremap('?', '/')                                              -- search with magic flag (default)
nnoremap('<Bs>', ':noh<CR>')                                    -- turn off highlight
vnoremap('*', 'y<Esc>/<C-r>"<CR>``')                            -- search under cursor
nnoremap('<leader>r', [["zyiw:%s/\V<C-r>z//g<Left><Left>]])       -- replace under cursor
vnoremap('<leader>r', [["zy:%s/\V<C-r>z//g<Left><Left>]])         -- replace under cursor
nnoremap('<leader>R', [["zyiw:%s/\V<C-r>z/<C-r>z/g<Left><Left>]]) -- replace under cursor and paste same word into target
vnoremap('<leader>R', [["zy:%s/\V<C-r>z/<C-r>z/g<Left><Left>]])   -- replace under cursor and paste same word into target

vnoremap('<C-m><C-s>', ':sort<CR>')

-- nnoremap('<C-[>', 'g]')
-- nnoremap('g]', '<C-[>')

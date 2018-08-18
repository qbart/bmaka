filetype off
call plug#begin()
" Cosmetic
Plug 'nathanaelkane/vim-indent-guides'                             " visualize indent level
Plug 'joshdick/onedark.vim'                                        " colorscheme
Plug 'bling/vim-airline'                                           " UI improvement
Plug 'vim-airline/vim-airline-themes'                              " themes for airline
Plug 'machakann/vim-highlightedyank'                               " highlight yanked code
Plug 'blueyed/vim-diminactive'                                     " dim inactive windows
Plug 'ryanoasis/vim-devicons'                                      " Fancy icons

" command improvements
if exists('$TMUX')
  Plug 'christoomey/vim-tmux-navigator'                            " tmux integration
endif
Plug 'tpope/vim-commentary'                                        " change selected code into comment
Plug 'tpope/vim-repeat'                                            " better .
Plug 'easymotion/vim-easymotion'                                   " adds improved w e b j k
Plug 'rhysd/clever-f.vim'                                          " better f F

" tools
Plug 'tpope/vim-fugitive'                                          " git related commands
Plug 'airblade/vim-gitgutter'                                      " shows git signs next to line numbers
Plug 'christoomey/vim-tmux-runner'                                 " tmux integration
Plug 'bartoszmaka/vim_current_word'                                " highlight word under cursor
Plug 'janko-m/vim-test'                                            " test launcher
Plug 'terryma/vim-multiple-cursors'                                " multiple cursors
Plug 'scrooloose/nerdtree'                                         " project explorer
Plug 'jistr/vim-nerdtree-tabs'                                     " better behavior for nerdtree
Plug 'Xuyuanp/nerdtree-git-plugin'                                 " nerdTree git integration
Plug 'szw/vim-maximizer'                                           " maximize window
Plug 'simeji/winresizer'                                           " window resize helper
Plug 'godlygeek/tabular',               { 'on': 'Tabularize' }     " text align with regexp
Plug 'majutsushi/tagbar',               { 'on': 'TagbarToggle' }   " preview file structure
Plug 'simnalamburt/vim-mundo',          { 'on': 'MundoToggle' }    " preview undos
Plug 'zefei/vim-wintabs'                                           " tabs and buffers management
Plug 'zefei/vim-wintabs-powerline'

" Fuzzy searcher
Plug 'junegunn/fzf',                    { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pbogut/fzf-mru.vim'

" search in project
Plug 'mhinz/vim-grepper'                                           " search projectwide
Plug 'rking/ag.vim'                                                " searching engine

" simple autocomplete
Plug 'Shougo/echodoc.vim'                                          " displays function signatures from completions in the command line.
Plug 'jiangmiao/auto-pairs'                                        " auto insert parentheses, quotes etc.
Plug 'tpope/vim-endwise'                                           " auto insert 'end', 'endif' etc.
Plug 'tpope/vim-surround'                                          " vim verb for surrounding word
Plug 'alvan/vim-closetag'                                          " autoclose html tag
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" IDE like autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim',          { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'                                      " autocompletion engine
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
" Plug 'Shougo/neoinclude.vim'                                       " extends deoplete
Plug 'autozimu/LanguageClient-neovim',  { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'ludovicchabant/vim-gutentags'                                " ctags engine
Plug 'w0rp/ale'                                                    " async syntax checking

" syntax sources
Plug 'pangloss/vim-javascript',         { 'for': ['javascript', 'html', 'css', 'coffee', 'eruby'] }
Plug 'aliou/sql-heredoc.vim'
Plug 'MaxMEllon/vim-jsx-pretty',        { 'for': ['javascript'] }

" autocomplete sources
Plug 'Shougo/neco-vim',                 { 'for': ['vim'] }
Plug 'deathlyfrantic/deoplete-spell'
Plug 'elixir-editors/vim-elixir',       { 'for': ['elixir', 'eelixir'] }
Plug 'slashmili/alchemist.vim',         { 'for': ['elixir', 'eelixir'] }
Plug 'carlitux/deoplete-ternjs',        { 'for': ['javascript', 'html', 'css', 'coffee', 'eruby'], 'do': 'npm install -g tern' }

" language scoped tools
Plug 'tpope/vim-rails',                 { 'for': ['ruby, eruby'] }
Plug 'moll/vim-node',                   { 'for': ['javascript'] }
Plug 'galooshi/vim-import-js',          { 'for': ['javascript'], 'do': 'npm install -g import-js' }
Plug 'rlue/vim-getting-things-down',    { 'for': ['markdown'] }
Plug 'lmeijvogel/vim-yaml-helper',      { 'for': ['yaml'] }
Plug 'maksimr/vim-jsbeautify',          { 'for': ['javascript', 'html', 'css', 'coffee', 'eruby'] }

call plug#end()

" **********************************
" custom functions
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
" Go to alternative file
function! AltCommand(path, vim_command)
  let l:alternate = system("find . -path ./_site -prune -or -path ./target -prune -or -path ./.DS_Store -prune -or -path ./build -prune -or -path ./Carthage -prune -or -path tags -prune -or -path ./tmp -prune -or -path ./log -prune -or -path ./.git -prune -or -type f -print | alt -f - " . a:path)
  if empty(l:alternate)
    echo "No alternate file for " . a:path . " exists!"
  else
    exec a:vim_command . " " . l:alternate
  endif
endfunction

" Disable Deoplete when selecting multiple cursors starts
function! Multiple_cursors_before()
  if exists('*deoplete#disable')
    exe 'call deoplete#disable()'
  elseif exists(':NeoCompleteLock') == 2
    exe 'NeoCompleteLock'
  endif
endfunction

" Enable Deoplete when selecting multiple cursors ends
function! Multiple_cursors_after()
  if exists('*deoplete#enable')
    exe 'call deoplete#enable()'
  elseif exists(':NeoCompleteUnlock') == 2
    exe 'NeoCompleteUnlock'
  endif
endfunction

function! TweakedDiffPut()
  :diffput 1
  :diffupdate
endfunction

" **********************************
" vim variables

filetype plugin indent on
syntax on                               " Enable syntax coloring
let mapleader="\<Space>"

" meta
set shell=/bin/zsh                      " shell path
if has('nvim') && has('mac')
  let g:python_host_prog  = '/usr/local/bin/python2'
  let g:python3_host_prog = '/usr/local/bin/python3'
endif
set autoread
syntax sync minlines=256
set novisualbell
set undofile                            " keep history in file
set undodir=$HOME/.vim/undo             " path for this file
set grepprg=ag
set swapfile                            " shit happens (segmentation faults also)
set directory=/tmp
set autoread
set lazyredraw
set hidden                              " don't close buffers
set cmdheight=2
set wildignore+=
      \*/tmp/*,
      \*/node_modules/*,
      \*/.git/*,
      \*.so,
      \*.swp,
      \*.zipo

" encoding
language en_US.UTF-8
set langmenu=en_US.UTF-8
set fileencoding=utf-8
set encoding=utf8

" behavior
set completeopt=longest,menuone,preview
set omnifunc=syntaxcomplete#Complete
set noshowmatch                         " has something to do with matching brackets
set backspace=indent,eol,start
set updatetime=500
set spell

" indent
set autoindent
set smartindent

" window management
set scrolloff=4                         " show at least 4 lines above or under cursor
set sidescrolloff=15
set splitright                          " place new vertical split on right side of current window
set splitbelow                          " place new horizontal split under current window
set diffopt+=vertical

" tabulator
set smarttab
set softtabstop=2
set shiftwidth=2                        " default tab width
set expandtab                           " Spaces instead of tabs

" line length
set synmaxcol=350                       " disable syntax colors after given column
set colorcolumn=80                      " color 120th column
set textwidth=0                         " do not break lines automatically
set showbreak=\/_
set nowrap                              " don't wrap lines

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" ui
set noshowmode                          " do not display current mode in cmdline (airline already handles it)
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:< " define how whitespaces will be displayed
set nolist                              " show whitespaces
set mouse=a
set laststatus=2                        " always show status line
set showcmd                             " show pressed keys
set number                              " show line numbers
set norelativenumber
set signcolumn=auto                      " make place for symbols next to line numbers
set ruler
set cursorline                          " Highlight current line
set title
set title titlestring=%<%F%=

" **********************************
" colorscheme tweaks

if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme onedark
let g:airline_theme = 'onedark'
set fillchars+=stl:\ ,stlnc:\ ,vert:\│

if has('conceal')
  set conceallevel=0
endif

" **********************************
" plugin variables
let g:workspace_powerline_separators                 = 1
let g:webdevicons_enable                             = 1
let g:webdevicons_enable_nerdtree                    = 0
let g:airline_powerline_fonts                        = 1
let g:airline#extensions#branch#enabled              = 1
let g:airline#extensions#branch#format               = 2
let g:airline#extensions#branch#displayed_head_limit = 15
let g:airline#extensions#tagbar#enabled              = 1
let g:airline#extensions#hunks#enabled               = 1
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
    \ 't'  : 'T',
    \ }
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.readonly = '🔒'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.whitespace = 'Ξ'
let g:gitgutter_map_keys                             = 0
let g:gitgutter_sign_added                           = '+'
let g:gitgutter_sign_modified                        = '.'
let g:gitgutter_sign_removed                         = '-'
let g:gitgutter_sign_removed_first_line              = '-'
let g:gitgutter_sign_modified_removed                = '.'

let g:diminactive_buftype_blacklist                  = ['nofile', 'nowrite', 'acwrite', 'quickfix', 'help']
let g:diminactive_enable_focus                       = 1

let g:indent_guides_exclude_filetypes                = ['help', 'nerdtree', 'quickfix', 'qf']
let g:indent_guides_enable_on_vim_startup            = 1
let g:indent_guides_auto_colors                      = 0
" let g:indent_guides_default_mapping = 0

" nerdtree, mundo, tagbar
let g:NERDTreeWinSize = 35
let g:mundo_right     = 1
let g:NERDTreeMinimalUI = 1

let g:winresizer_vert_resize    = 1
let g:winresizer_horiz_resize   = 1

" vim current word
let g:vim_current_word#enabled                        = 1
let vim_current_word#highlight_only_in_focused_window = 1
let g:vim_current_word#highlight_twins                = 1
let g:vim_current_word#highlight_current_word         = 1
let g:vim_current_word#highlight_after_delay          = 1

" easymotion
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

" ale syntax checker
let g:ale_completion_enabled   = 1
let g:ale_echo_msg_error_str   = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format      = '[%linter%] %s [%severity%]'
let g:ale_sign_error           = '💩'
let g:ale_sign_warning         = '🤔'
let g:ale_lint_on_save         = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_column_always   = 1
let g:ale_set_highlights       = 0
let g:ale_fixers = {
      \ 'ruby':           ['remove_trailing_lines', 'trim_whitespace', 'rubocop'],
      \ 'javascript':     ['remove_trailing_lines', 'trim_whitespace', 'eslint', 'importjs'],
      \ 'vim':            ['remove_trailing_lines', 'trim_whitespace'],
      \}
let g:ale_linters = {
      \ 'ruby':           ['rubocop'],
      \ 'javascript':     ['eslint'],
      \}
let g:ale_linter_aliases = {'jsx': 'css'}

let g:AutoPairsShortcutToggle     = ''
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsShortcutJump       = ''
let g:AutoPairsShortcutFastWrap   = ''
let g:AutoPairsMapCh              = ''
let g:ag_highlight=1

" completion
let deoplete#tag#cache_limit_size      = 50000000
let g:deoplete#auto_complete_delay     = 2
let g:deoplete#enable_ignore_case      = 0
let g:deoplete#enable_smart_case       = 1
let g:deoplete#enable_at_startup       = 1
let g:deoplete#enable_refresh_always   = 1
let g:deoplete#auto_refresh_delay      = 2
let g:deoplete#max_abbr_width          = 0
let g:deoplete#max_menu_width          = 50
let g:deoplete#max_list                = 30
let g:deoplete#file#enable_buffer_path = 1

let g:deoplete#sources#ternjs#tern_bin = '/usr/local/bin/ternjs'
let g:deoplete#sources#ternjs#timeout = 0
let g:deoplete#sources#ternjs#docs = 0
let g:LanguageClient_autoStop = 0
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['tcp://localhost:7658'],
    \ }
let g:vim_jsx_pretty_colorful_config = 1

let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list')
      \ }

let g:gutentags_ctags_exclude = ["node_modules", ".git"]

if has('gui_macvim')
  let test#strategy          = 'iterm'
elseif exists('$TMUX')
  let test#strategy          = 'vtr'
endif

if(has('nvim'))
  let g:neosnippet#snippets_directory='~/.repos/dotfiles/vim/vimsnippets'
  let g:neosnippet#scope_aliases = {}
  let g:neosnippet#scope_aliases['javascript'] = 'html,javascript,javascript.jsx'
endif

" closetag config
let g:closetag_filenames               = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.erb,*.eex'
let g:closetag_xhtml_filenames         = '*.xhtml,*.jsx,*.js,*.erb,*.eex'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut                = '>'

" **********************************

" augroup filetype-omnifunc 
"   autocmd FileType ruby setlocal omnifunc=LanguageClient#complete
" augroup END

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
      \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

augroup fix-filetypes
  autocmd!
  autocmd BufNewFile,BufRead .eslintrc  setlocal filetype=json
  autocmd BufNewFile,BufRead *.slim     setlocal filetype=slim
  autocmd BufNewFile,BufRead *.pdf      setlocal filetype=pdf.html
  autocmd BufNewFile,BufRead *.pdf.erb  setlocal filetype=pdf.html.eruby
  autocmd BufNewFile,BufRead *.js,*.jsx setlocal filetype=javascript.jsx
augroup END

augroup tab-lengths-per-filetype
  autocmd!
  autocmd Filetype gitcommit  setlocal colorcolumn=72
  autocmd Filetype nerdtree   setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

augroup open-nerdtree-at-start
  autocmd!
  autocmd VimEnter *
        \   if !argc()
        \ |   NERDTree
        \ |   wincmd w
        \ | endif
        \ | set list
augroup END

augroup spell-tweaks
  autocmd!
  autocmd Filetype 
        \ fugitiveblame,qf
        \ setlocal nospell
augroup END

augroup csv
  autocmd!
  autocmd BufReadPost *.csv
        \ NERDTreeClose
        \ | Tabularize /,
augroup END

augroup remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

augroup disable-hls-on-insert-enter
  autocmd!
  autocmd InsertEnter * setlocal nohls
augroup END

augroup color-scheme-tweaks
  autocmd!
  highlight CursorColumn     guibg=#512121
  highlight CursorColumnNR   guibg=#512121
  highlight Search           guifg=#CDB07A guibg=NONE gui=bold
  highlight CurrentWordTwins guibg=#1A1A1A
  highlight CurrentWord      guibg=#0D0D0D
  highlight IndentGuidesEven guibg=#272C34
  highlight IndentGuidesOdd  guibg=#373E49
  highlight TabLineSel       guifg=#E5C07B
  highlight SpellBad         guifg=NONE    guibg=#260F0D

  autocmd InsertEnter * set cursorcolumn
  autocmd InsertLeave * set nocursorcolumn
  autocmd InsertEnter * highlight CursorLine   guibg=#512121
  autocmd InsertEnter * highlight CursorLineNR guibg=#512121
  autocmd InsertLeave * highlight CursorLine   guibg=#343D46
  autocmd InsertLeave * highlight CursorLineNR guibg=#343D46
augroup END

augroup yaml-helper
  autocmd!
  autocmd CursorHold *.yml YamlGetFullPath
augroup END

" **********************************
" Plugin related keymaps

" autocomplete
inoremap <expr><TAB>   pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
" imap     <C-e>         <Plug>(neosnippet_expand_or_jump)
" smap     <C-e>         <Plug>(neosnippet_expand_or_jump)
" xmap     <C-e>         <Plug>(neosnippet_expand_target)
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" imap <silent> <C-p> <Plug>(coc-complete-custom)

" " Use `[c` and `]c` for navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K for show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if &filetype == 'vim'
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Show signature help while editing
" autocmd CursorHoldI,CursorMovedI * silent! call CocAction('showSignatureHelp')

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" " Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" vmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)

" tools windows management
let g:winresizer_start_key          = '<C-w>e'
let g:maximizer_default_mapping_key = '<C-w>m'
nnoremap <C-k><C-u> :MundoToggle<CR>
nnoremap <C-k><C-f> :NERDTreeFind<CR>zz
nnoremap <C-k><C-e> :NERDTreeToggle<CR>
nnoremap <C-k><C-v> :TagbarToggle<CR>
nnoremap <C-g><C-s> :Gstatus<CR>
nnoremap <C-g><C-b> :Gblame<CR>
nnoremap <C-g><C-d> :Gdiff<CR>
nnoremap <C-g><C-p> :execute TweakedDiffPut()<CR>
nnoremap <C-g><C-h> :diffget //2<CR>
nnoremap <C-g><C-l> :diffget //3<CR>

" Find the alternate file for the current path and open it (basically go to test file)
nnoremap <C-o><C-t> :w<cr>:call AltCommand(expand('%'), ':e')<cr>

nmap <leader>1 :WintabsGo 1<CR>
nmap <leader>2 :WintabsGo 2<CR>
nmap <leader>3 :WintabsGo 3<CR>
nmap <leader>4 :WintabsGo 4<CR>
nmap <leader>5 :WintabsGo 5<CR>
nmap <leader>6 :WintabsGo 6<CR>
nmap <leader>7 :WintabsGo 7<CR>
nmap <leader>8 :WintabsGo 8<CR>
nmap <leader>9 :WintabsGo 9<CR>
map <M-{>      <Plug>(wintabs_previous)
map <leader>[  <Plug>(wintabs_previous)
map <C-H>      <Plug>(wintabs_previous)
map <M-}>      <Plug>(wintabs_next)
map <leader>]  <Plug>(wintabs_next)
map <C-L>      <Plug>(wintabs_next)
map <leader>w  <Plug>(wintabs_close)
map <leader>W  <Plug>(wintabs_undo)
map <C-T>o     <Plug>(wintabs_only)
map <C-W>c     <Plug>(wintabs_close_window)
map <C-W>o     <Plug>(wintabs_only_window)
command! Tabc WintabsCloseVimtab
command! Tabo WintabsOnlyVimtab

" launch test suite
nnoremap <leader>tt :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ta :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tg :TestVisit<CR>
nnoremap <leader>to :w<cr>:call AltCommand(expand('%'), ':e')<cr>

" list mappings
nnoremap <C-k><C-s> :FzfMaps<CR>


" popup fuzzy finders
" nnoremap <C-p><C-e> :call LanguageClient_contextMenu()<CR>
" nnoremap K :call LanguageClient#textDocument_hover()<CR>
" nnoremap gd :call LanguageClient#textDocument_definition()<CR>
" nnoremap <C-m><C-r> :call LanguageClient#textDocument_rename()<CR>
nnoremap <C-p><C-p> :FZF<CR>
nnoremap <C-p><C-r> :FZFFreshMru<CR>
nnoremap <C-p><C-g> :FzfGitFiles<CR>
nnoremap <C-p><C-h> :FzfHistory<CR>
nnoremap <C-p><C-b> :FzfBuffers<CR>
nnoremap <C-p><C-f> :FzfAg<CR>
nnoremap <C-p><C-l> :FzfLines<CR>
nnoremap <C-p><C-v> :FzfCommits<CR>
nnoremap <C-p><C-w> :FzfWindows<CR>
nnoremap <C-p><C-o> viwy:FzfTags <C-r>"<CR>
nnoremap <C-p><C-t> viwy:FzfBTags <C-r>"<CR>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)
imap <expr> <C-c><C-s> fzf#vim#complete#word({'right': '15%'})

" find in project => ag --vimgrep> pattern [location]
nnoremap <C-m><C-g> :Grepper<CR>
vnoremap <C-m><C-g> y:GrepperAg <C-r>"<CR>
nnoremap <leader>f :Grepper<CR>
vnoremap <leader>f y:GrepperAg <C-r>"<CR>

" ALE actions
nnoremap <C-m><C-f> :ALEFix<CR>
nnoremap <C-m><C-l> :ALELint<CR>
nnoremap <C-m><C-w> :set list!<CR>

" Indent whole file
nnoremap <C-m><C-i> m`gg=G``

nnoremap [c :GitGutterPrevHunk<CR>
nnoremap ]c :GitGutterNextHunk<CR>

nnoremap [e :ALEPrevWrap<CR>
nnoremap ]e :ALENextWrap<CR>

let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-c>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" **********************************
" Non plugin related keymaps

" sometimes I just hold shift for too long
cabbrev W   w
cabbrev Wa  wa
cabbrev Wq  wq
cabbrev Wqa wqa
cabbrev WQa wqa
cabbrev Q   q
cabbrev Qa  qa
cabbrev Q!  q
cabbrev Qa! qa

inoremap jk <ESC>

" disable entering Ex-mode with Q (accessible through :<C-f>)
nnoremap Q <NOP>
map q: <NOP>

" windows navigation
nnoremap <M-h>      <C-w>h
nnoremap <M-j>      <C-w>j
nnoremap <M-k>      <C-w>k
nnoremap <M-l>      <C-w>l
" for iterm (also requires 'send hex' config)
nnoremap <C-space>h <C-w>h
nnoremap <C-space>j <C-w>j
nnoremap <C-space>k <C-w>k
nnoremap <C-space>l <C-w>l
if exists('$TMUX')
  let g:tmux_navigator_no_mappings = 1
  nnoremap <C-w>h :TmuxNavigateLeft<CR>
  nnoremap <C-w>j :TmuxNavigateDown<CR>
  nnoremap <C-w>k :TmuxNavigateUp<CR>
  nnoremap <C-w>l :TmuxNavigateRight<CR>
endif
" unify keymaps with tmux
nnoremap <C-w>" <C-w>s
nnoremap <C-w>% <C-w>v

" close buffer
nnoremap <leader>q :close<CR>

" split and merge lines
nnoremap <leader>j i<CR><Esc>
nnoremap <leader>k <esc>kJ

" copy current line
inoremap <C-d> <esc>YpA

" begin and end of line
map <leader>h ^
map <leader>l $

" treat multiline statement as multiple lines
nnoremap j gj
nnoremap k gk

" always focus after cursor jump
nnoremap n     :setlocal hls<CR>nzz
nnoremap N     :setlocal hls<CR>Nzz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
nnoremap <C-J> jzz
nnoremap <C-K> kzz
nnoremap <C-L> 5zl
nnoremap <C-H> 5zh

vnoremap <Tab>   >gv
vnoremap <S-Tab> <gv

" replace word under cursor
nnoremap <leader>r viwy:%s/<C-r>"/

" replace selected word
vnoremap <leader>r y:%s/<C-r>"/

" tabs navigation
nnoremap tt :tabnew<CR>
nnoremap TT :tabclose<CR>
nnoremap tl :tabs<CR>

" select whole file, (map old C-a functionality to <leader>a)
nnoremap <C-a>     ggVG
nnoremap <leader>a <C-a>

" system clipboard integration
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

nnoremap <leader>ts :e db/schema.rb<CR>

if has("gui_macvim")
  set guifont=Hasklug\ Nerd\ Font\ Complete:h18
  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guioptions-=e  "remove left-hand scroll bar
endif

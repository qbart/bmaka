filetype off
call plug#begin('~/.vim/plugged')
    if has('nvim')
        Plug 'benekastah/neomake'           "async make
        Plug 'kassio/neoterm'               "terminal mode
        Plug 'janko-m/vim-test'
    endif
    " New plugins to be tested
    Plug 'tpope/vim-repeat'
    Plug 'machakann/vim-swap'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'Shougo/neosnippet'
    Plug 'Shougo/neosnippet-snippets'
    " Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py' }
    " Plug 'honza/vim-snippets'                     " Snippets for various languages pac
    " Plug 'SirVer/ultisnips'                       " Snippet engine

    Plug 'machakann/vim-highlightedyank'
    Plug 'rhysd/clever-f.vim'
    Plug 'tomasr/molokai'                    "Color Scheme
    Plug 'sjl/gundo.vim'                     "Visualise undo tree
    Plug 'gko/vim-coloresque'                "Color perview for vim
    Plug 'haya14busa/incsearch.vim'          "Incrementally highlights ALL pattern
    Plug 'Valloric/MatchTagAlways'           "Highlight current html, eruby, etc tag
    Plug 'majutsushi/tagbar'                 "Kind of tags minimap
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-easytags'                "To check
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'blueyed/vim-diminactive'           "Dim inactive windows
    Plug 'airblade/vim-gitgutter'            "Shows git signs next to line numbers
    Plug 'tpope/vim-fugitive'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ctrlpvim/ctrlp.vim'                "Path file finder
    Plug 'JazzCore/ctrlp-cmatcher', { 'do': './install.sh' }  "different matching algorithm for ctrlp
    Plug 'tpope/vim-rvm'                          " Enable 'Rvm use' in vim
    Plug 'tpope/vim-commentary'                   " Comments

    Plug 'scrooloose/syntastic'                   " Syntax
    Plug 'tpope/vim-ragtag'                       " Set of mappings for html, eruby, etc
    Plug 'tpope/vim-surround'                     " Auto complete matching ( | { [ ' etc
    Plug 'ervandew/supertab'                      " Confrim autocompletion with tab
    Plug 'tpope/vim-repeat'                       " Repeat plugin commands with .
    Plug 'bling/vim-airline'                      " Airline
    Plug 'vim-airline/vim-airline-themes'         " Themes for airline
    Plug 'bronson/vim-trailing-whitespace'        " Detect trailing whitespaces
    Plug 'terryma/vim-expand-region'              " Select region +/-
    Plug 'terryma/vim-multiple-cursors'           " Multiple cursors
    Plug 'szw/vim-maximizer'                      " Maximize/minimize window on f3
    Plug 'ngmy/vim-rubocop'                       " Rubocop
    Plug 'tpope/vim-endwise'                      " Auto add ends, endfuncion, endif
    Plug 'octol/vim-cpp-enhanced-highlight'       " Better highlighting for c++
    Plug 'jiangmiao/auto-pairs'                   " Auto insert matching brackets
    Plug 'slim-template/vim-slim'                 " Slim support
    Plug 'mattn/emmet-vim'                        " HTML support
    Plug 'godlygeek/tabular'                      " Easy text align with regexp

    " Ruby support
    Plug 'vim-ruby/vim-ruby'

    " Haml support
    Plug 'tpope/vim-haml'

    " " JS ************************************
    " Plug 'pangloss/vim-javascript'
    " Plug 'isRuslan/vim-es6'
    " Plug 'kchmck/vim-coffee-script'
    " Plug 'mxw/vim-jsx'

    " " TYPESCRIPT ************************************
    " Plug 'Quramy/tsuquyomi'
    " Plug 'leafgarland/typescript-vim'
    " " Async execution library, required by tsuquyomi
    " Plug 'Shougo/vimproc.vim'

    " " RAILS ************************************
    " Plug 'tpope/vim-bundler'    " Enable 'bunle' in vim and more
    " Plug 'tpope/vim-rails'      " Add rails-releated shortcuts to vim
    " Plug 'tpope/vim-rake'       " Vim-rails shortcuts everywhere!

    " Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
call plug#end()

set shell=/bin/zsh
language en_US.UTF-8
set langmenu=en_US.UTF-8
set fileencoding=utf-8
set encoding=utf8

set ttimeoutlen=0
set smarttab
set softtabstop=4

set updatetime=300
set mouse=a                             " Mouse support
set lazyredraw                          " Only redraw when it is needed
set timeoutlen=900                      " Sequence timeout
set number                              " Show absolute line number in current line
set relativenumber                      " Show relative line number
set showbreak=▶▶                        " Wrapped line symbol
" set textwidth=120                       " Text (e. g. comment) break point
set noshowmatch                         " Disable jumping to matching parenthesis after typing it
set noswapfile                          " Disable creating swap files
set novisualbell                        " Turn screen blinking off
set laststatus=2                        " Always show status line
set showcmd                             " Show commands as they are entered
set splitright                          " Create vsplit on right side
set splitbelow                          " Create hsplit on bottom *
set hidden                              " Hide buffers instead of closing them
set nobackup                            " Disable creating backup files
set hlsearch                            " Highlight search results
set ignorecase
set smartcase                           " Override the 'ignorecase' option if the search pattern contains upper case characters.
set incsearch                           " Search as you type
set autoindent                          " Copy indent from current line when starting new line
set expandtab                           " Spaces instead of tabs in insert mode
set shiftwidth=4                        " Default tab width
set smartindent                         " Add extra tab when starting new line in some cases
set ruler                               " Show column and row numbers
set colorcolumn=120                     " Color 120th column
set undolevels=100                      " Amount of possible undos
set cursorline                          " Highlight current line
set backspace=indent,eol,start          " Allow backspacing over everything in insert mode
set scrolloff=4
set sidescrolloff=5
syntax on                               " Enable syntax coloring
let mapleader = "'"

" vim-diminactive
    let g:diminactive_use_colorcolumn=0
" TAB LENGTHS ************************************
    autocmd Filetype eruby setlocal ts=2 sts=2 sw=2
    autocmd Filetype scss setlocal ts=2 sts=2 sw=2
    autocmd Filetype sass setlocal ts=2 sts=2 sw=2
    autocmd Filetype slim setlocal ts=2 sts=2 sw=2
    autocmd Filetype html setlocal ts=2 sts=2 sw=2
    autocmd Filetype haml setlocal ts=2 sts=2 sw=2
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
    autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4
    autocmd Filetype python setlocal ts=4 sts=4 sw=4
" Ragtag config and recommended mappings
    inoremap <M-o>       <Esc>o
    " inoremap <M-j>       <Down>
    let g:ragtag_global_maps = 1

" Gundo ************************************************************
    let g:gundo_prefer_python3=1

" AutoPairs config
    let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|':'|'}

    if has('nvim')
    " " Deoplete Config (async YouCompleteMe)
    "     let g:deoplete#enable_at_startup = 1
    "     let g:deoplete#auto_complete_delay = 0

    " Neomake Config (async make)
        let g:neomake_ruby_enabled_makers = ['rubocop']
        autocmd! BufWritePost * Neomake

    " " TERMINAL MODE SHORTCUTS ************************************
    "     " Exit terminal mode with esc
    "     :tnoremap <Esc> <C-\><C-n>"
    "     " Improve windows navigation by using 'alt + *' combination even when terminal window is active
    "     :tnoremap <A-h> <C-\><C-n><C-w>h
    "     :tnoremap <A-j> <C-\><C-n><C-w>j
    "     :tnoremap <A-k> <C-\><C-n><C-w>k
    "     :tnoremap <A-l> <C-\><C-n><C-w>l
    "     :nnoremap <A-h> <C-w>h
    "     :nnoremap <A-j> <C-w>j
    "     :nnoremap <A-k> <C-w>k
    "     :nnoremap <A-l> <C-w>l
    endif

" deoplete
    let g:SuperTabDefaultCompletionType = '<C-n>'
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_refresh_always = 1
    let g:deoplete#auto_refresh_delay = 30
    " imap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
    " imap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"
    imap <C-j> <Tab>
    imap <C-k> <S-Tab>
" deosnipplets
    imap <C-e><C-e>     <Plug>(neosnippet_expand_or_jump)
    smap <C-e><C-e>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-e><C-e>     <Plug>(neosnippet_expand_target)

" AIRLINE CONFIG **************************************************
    set fillchars+=stl:\ ,stlnc:\
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'molokai'
    let g:airline#extensions#tabline#enabled = 1

" CTRLP CONFIG ************************************
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPMixed'
    map <C-w> :CtrlPMRU<CR>
        "show hidden files
    let g:ctrlp_show_hidden = 1
        "Speed fixes http://stackoverflow.com/questions/21346068/slow-performance-on-ctrlp-it-doesnt-work-to-ignore-some-folders
    let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
    " Use ag instead of grep if installed
    if executable('ag')
        set grepprg=ag\ --nogroup\ --nocolor
            " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
        let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
            " ag is fast enough that CtrlP doesn't need to cache
        let g:ctrlp_use_caching = 0
    endif

" MatchTagAlways config
    let g:mta_use_matchparen_group = 1
    let g:mta_filetypes = {
        \ 'html' : 1,
        \ 'xhtml' : 1,
        \ 'xml' : 1,
        \ 'jinja' : 1,
        \ 'eruby' : 1,
        \}

" NERDTREE CONFIG ************************************
    let g:NERDTreeWinSize = 25
        "close vim if only NERDTree is opened
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        " start with nerdtree open if no file were specified (2 lines below)
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        " NerdTree toggle
    " let g:nerdtree_tabs_open_on_console_startup = 1
    nmap <F2> :NERDTreeTabsToggle<CR>

" Remember cursor position
    augroup vimrc-remember-cursor-position
        autocmd!
        autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END

" Incsearch Config
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    " :h g:incsearch#auto_nohlsearch
    " set hlsearch
    let g:incsearch#auto_nohlsearch = 1
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)


" Remove Whitespaces on save
    autocmd BufWritePre * FixWhitespace

" RuboCop config
    let g:vimrubocop_config = '~/.rubocop.yml'

" GITGUTTER CONFIG ************************************
    let g:gitgutter_sign_column_always = 1
        " View diff with <leader>1
    nnoremap <expr> <leader>1 (g:gitgutter_highlight_lines) ? ':GitGutterLineHighlightsToggle<CR>:NERDTreeToggle<CR><C-w>l:q!<CR>' : ':GitGutterLineHighlightsToggle<CR>:Gvsplit<CR>:NERDTreeToggle<CR>'
        " uncomment 2 lines below in case of performance issues
    " let g:gitgutter_realtime = 0
    " let g:gitgutter_eager = 0

" Colorscheme settings
    if !exists('g:not_finish_vimplug')
        colorscheme molokai
    endif
    let &t_Co=256

    " NOT SURE OR TOO LAZY TO CHECK ************************************
        filetype plugin indent on
        set wildignore+=*/tmp/*,*.so,*.swp,*.zipo
        set omnifunc=syntaxcomplete#Complete
    " JS thing
        let g:jsx_ext_required = 0
    " LIVEDOWN CONFIG *************************************************
        " nmap gm :LivedownToggle<CR>
        "     " The system command to launch a browser
        " let g:livedown_browser = 'google-chrome'
        "     " Should the browser window pop-up upon previewing
        " let g:livedown_open = 1
    " EASYTAGS CONFIG ************************************
            "Async easytags
        let g:easytags_async = 1
            "Better performance
        let g:easytags_syntax_keyword = 'always'
            "tags filename and placement
        set tags=./tags;
            "create tag file per project
        let g:easytags_dynamic_files = 2
            "needed for upper line to work
        set cpoptions+=d
    " VIM-TEST CONFIG ************************************
        nnoremap <silent> <leader>t :TestNearest<CR>
        nnoremap <silent> <leader>T :TestFile<CR>
        nnoremap <silent> <leader>a :TestSuite<CR>
        nnoremap <silent> <leader>l :TestLast<CR>
        nnoremap <silent> <leader>g :TestVisit<CR>
        let test#strategy = 'neoterm'
        let g:neoterm_position = 'horizontal'

    " TYPESCRIPT SETTINGS ************************************
        " let g:neomake_javascript_enabled_makers = ['eslint']
        " let g:tsuquyomi_disable_quickfix = 1
        " let g:neomake_typescript_enabled_makers = []
        " let g:syntastic_typescript_tsc_fname = ''
        " let g:syntastic_typescript_checkers = ['tsuquyomi']
        " autocmd FileType typescript setlocal completeopt+=menu,preview
" Break current line
    nnoremap <leader>o i<CR><Esc>

" Buftabline Config
    nnoremap g5 :bnext<CR>
    nnoremap g4 :bprev<CR>

    nnoremap tt :tabnew<CR>
    nnoremap TT :tabclose<CR>
    nnoremap tl :tabs<CR>
    nnoremap Tl :buffers<CR>
    noremap <F4> :TagbarToggle<CR>
    nnoremap <F5> :GundoToggle<CR>

" ^ and $ aliases
    " unmap <C-h>
    inoremap <C-l> $
    nnoremap <C-l> $
    vnoremap <C-l> $
    inoremap <C-h> ^
    nnoremap <C-h> ^
    vnoremap <C-h> ^

" swap relativenumber/norelativenumber or insert mode enter/leave
    autocmd InsertEnter * set norelativenumber
    autocmd InsertLeave * set relativenumber

" Search on , (2 lines below)
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap , :Ag<SPACE>

" Change current line color when entering insert mode
    autocmd InsertEnter * highlight  CursorLine ctermbg=52

" Revert current line color to default when leaving insert mode
    autocmd InsertLeave * highlight  CursorLine ctermbg=232

" " Copy to clipboard
    vnoremap  <leader>y  "+y
    nnoremap  <leader>Y  "+yg_
    nnoremap  <leader>y  "+y
    nnoremap  <leader>yy  "+yy

" " Paste from clipboard
    nnoremap <leader>p "+p
    nnoremap <leader>P "+P
    vnoremap <leader>p "+p
    vnoremap <leader>P "+P

" Disable arrow keys
    nnoremap <Up> <NOP>
    nnoremap <Down> <NOP>
    nnoremap <Left> <NOP>
    nnoremap <Right> <NOP>
    inoremap <Up> <NOP>
    inoremap <Down> <NOP>
    inoremap <Left> <NOP>
    inoremap <Right> <NOP>
    vnoremap <Up> <NOP>
    vnoremap <Down> <NOP>
    vnoremap <Left> <NOP>
    vnoremap <Right> <NOP>

" Disable esc in insert mode
    " inoremap <Esc> <NOP>


" map ; as :
    nnoremap ; :

" Esc key mappings
    inoremap jk <Esc>
    inoremap ii <Esc>
    vnoremap ii <Esc>

" Move lines or blocks up and down
    function! MoveLineUp()
      call MoveLineOrVisualUp(".", "")
    endfunction

    function! MoveLineDown()
      call MoveLineOrVisualDown(".", "")
    endfunction

    function! MoveVisualUp()
      call MoveLineOrVisualUp("'<", "'<,'>")
      normal gv
    endfunction

    function! MoveVisualDown()
      call MoveLineOrVisualDown("'>", "'<,'>")
      normal gv
    endfunction

    function! MoveLineOrVisualUp(line_getter, range)
      let l_num = line(a:line_getter)
      if l_num - v:count1 - 1 < 0
        let move_arg = "0"
      else
        let move_arg = a:line_getter." -".(v:count1 + 1)
      endif
      call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
    endfunction

    function! MoveLineOrVisualDown(line_getter, range)
      let l_num = line(a:line_getter)
      if l_num + v:count1 > line("$")
        let move_arg = "$"
      else
        let move_arg = a:line_getter." +".v:count1
      endif
      call MoveLineOrVisualUpOrDown(a:range."move ".move_arg)
    endfunction

    function! MoveLineOrVisualUpOrDown(move_arg)
      let col_num = virtcol(".")
      execute "silent! ".a:move_arg
      execute "normal! ".col_num."|"
    endfunction

    nnoremap <silent> <C-k> :<C-u>call MoveLineUp()<CR>
    nnoremap <silent> <C-j> :<C-u>call MoveLineDown()<CR>
    " inoremap <silent> <C-k> <C-o>:call MoveLineUp()<CR>
    " inoremap <silent> <C-j> <C-o>:call MoveLineDown()<CR>
    vnoremap <silent> <C-k> :<C-u>call MoveVisualUp()<CR>
    vnoremap <silent> <C-j> :<C-u>call MoveVisualDown()<CR>
    " xnoremap <silent> <C-k> :<C-u>call MoveVisualUp()<CR>
    " xnoremap <silent> <C-j> :<C-u>call MoveVisualDown()<CR>

" vim-repeat thing
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

filetype off
call plug#begin('~/.vim/plugged')

    " Plug 'ryanoasis/vim-devicons'
    Plug 'majutsushi/tagbar'                "kind of tags minimap
    Plug 'tomasr/molokai'                   "Color Scheme
    Plug 'sjl/gundo.vim'                    "visualise undo tree
    Plug 'gko/vim-coloresque'
    " Plug 'easymotion/vim-easymotion'
    Plug 'haya14busa/incsearch.vim'         "incrementally highlights ALL pattern
    Plug 'jistr/vim-nerdtree-tabs'
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-ragtag'
    Plug 'ap/vim-buftabline'
        " GENERAL ************************************
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-easytags'               "to check"
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-surround'

        " GIT INTEGRATION ************************************
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'Xuyuanp/nerdtree-git-plugin'

        " SMART SEARCH ************************************
    Plug 'kien/ctrlp.vim'
    Plug 'JazzCore/ctrlp-cmatcher'
    " <!!!!!!!!**************!!!!!!!!>

        " " RAILS ************************************
    " Plug 'tpope/vim-bundler'    " Enable 'bunle' in vim and more
    " Plug 'tpope/vim-rails'      " Add rails-releated shortcuts to vim
    " Plug 'tpope/vim-rake'       " Vim-rails shortcuts everywhere!


    Plug 'scrooloose/syntastic'    " Syntax
        " Live markdown preview
    Plug 'shime/vim-livedown', { 'do': 'npm install -g livedown' }
    Plug 'tpope/vim-rvm'           " Enable 'Rvm use' in vim
    Plug 'tpope/vim-commentary'    " Comments

    " AUTOCOMPLETE AND SNIPPETS ************************************
        " Autocomplete
    Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py' }
    Plug 'ervandew/supertab'     " Confrim autocompletion with tab
    Plug 'honza/vim-snippets'    " Snippets for various languages pac
    Plug 'SirVer/ultisnips'      " Snippet engine

    Plug 'tpope/vim-repeat'      " Repeat plugin commands with .

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


    Plug 'bling/vim-airline'                      " Airline
    Plug 'vim-airline/vim-airline-themes'         "themes for airline
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

    " " GVIM ONLY ************************************
    " " Enabling fulscreen helper
    " Plug 'lambdalisue/vim-fullscreen'

    " Ruby support
    Plug 'vim-ruby/vim-ruby'

    " NEOVIM ONLY ************************************
    Plug 'benekastah/neomake'
    Plug 'kassio/neoterm'
    Plug 'janko-m/vim-test'

    " Haml support
    Plug 'tpope/vim-haml'
call plug#end()

set shell=/bin/zsh
" ENCODING ************************************
language en_US.UTF-8
set langmenu=en_US.UTF-8
set fileencoding=utf-8
set encoding=utf8
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
" <!!!!!!!!**************!!!!!!!!>

" Removed in nvim, keeping for backwards compatibility
" set nocompatible

" NOT SURE OR TOO LAZY TO CHECK ************************************
set ttimeoutlen=0
set smarttab
set softtabstop=4
" <!!!!!!!!**************!!!!!!!!>

set updatetime=300
set mouse=a                             " Mouse support
set lazyredraw                          " Only redraw when it is needed
set timeoutlen=900                      " Sequence timeout
set number                              " Show absolute line number in current line
" set relativenumber                      " Show relative line number
set showbreak=▶▶                        " Wrapped line symbol
set textwidth=120                       " Text (e. g. comment) break point
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
syntax on                               " Enable syntax coloring
let mapleader = "'"
" Gundo ***********************************
    let g:gundo_prefer_python3=1


" NOT SURE OR TOO LAZY TO CHECK ************************************
    filetype plugin indent on
    set wildignore+=*/tmp/*,*.so,*.swp,*.zipo
    set omnifunc=syntaxcomplete#Complete
    if !exists('g:not_finish_vimplug')
        colorscheme molokai
    endif
    let &t_Co=256
" JS thing
    let g:jsx_ext_required = 0

" YOUCOMPLETEME CONFIG ************************************
        " Path to python interpreter for ycm
    let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
    let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
    " let g:ycm_server_python_interpreter = '/usr/bin/python'
        " Make YCM compatible with UltiSnips using supertab (3 lines below)
    let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-m>'

" ULTISNIPS CONFIG ************************************
        " Better key bindings for UltiSnipsExpandTrigger (3 lines below)
    let g:UltiSnipsExpandTrigger = "<C-e>"
    let g:UltiSnipsJumpForwardTrigger = "<tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" LIVEDOWN CONFIG ************************************
    nmap gm :LivedownToggle<CR>
        " The system command to launch a browser
    let g:livedown_browser = 'google-chrome'
        " Should the browser window pop-up upon previewing
    let g:livedown_open = 1

" AIRLINE CONFIG ************************************
    set fillchars+=stl:\ ,stlnc:\
    let g:airline_powerline_fonts = 1
    let g:airline_theme = 'molokai'
    let g:airline#extensions#tabline#enabled = 1

" CTRLP CONFIG ************************************
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPMixed'
    map <C-l> :CtrlPMRU<CR>
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

" Closetag config
    let g:closetag_filenames = "*.html, *.xhtml *.phtml, *.erb"

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

" NERDTREE CONFIG ************************************
    let g:NERDTreeWinSize = 23
        "close vim if only NERDTree is opened
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        " start with nerdtree open if no file were specified (2 lines below)
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
        " NerdTree toggle
    " let g:nerdtree_tabs_open_on_console_startup = 1
    nmap <leader>2 :NERDTreeTabsToggle<CR>
    nmap <F2> :NERDTreeTabsToggle<CR>

" GITGUTTER CONFIG ************************************
    let g:gitgutter_sign_column_always = 1
        " View diff with <leader>1
    nnoremap <expr> <leader>1 (g:gitgutter_highlight_lines) ? ':GitGutterLineHighlightsToggle<CR>:NERDTreeToggle<CR><C-w>l:q!<CR>' : ':GitGutterLineHighlightsToggle<CR>:Gvsplit<CR>:NERDTreeToggle<CR>'
        " uncomment 2 lines below in case of performance issues
        " let g:gitgutter_realtime = 0
        " let g:gitgutter_eager = 0

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
" Not Mine Thing
" VIM-TEST CONFIG ************************************
    nmap <silent> <leader>t :TestNearest<CR>
    nmap <silent> <leader>T :TestFile<CR>
    nmap <silent> <leader>a :TestSuite<CR>
    nmap <silent> <leader>l :TestLast<CR>
    nmap <silent> <leader>g :TestVisit<CR>
    let test#strategy = 'neoterm'
    let g:neoterm_position = 'horizontal'

" Not Mine Thing
" TERMINAL MODE SHORTCUTS ************************************
    if has('nvim')
            " Exit terminal mode with esc
        :tnoremap <Esc> <C-\><C-n>"
            " Improve windows navigation by using 'alt + *' combination even when terminal window is active
        :tnoremap <A-h> <C-\><C-n><C-w>h
        :tnoremap <A-j> <C-\><C-n><C-w>j
        :tnoremap <A-k> <C-\><C-n><C-w>k
        :tnoremap <A-l> <C-\><C-n><C-w>l
        :nnoremap <A-h> <C-w>h
        :nnoremap <A-j> <C-w>j
        :nnoremap <A-k> <C-w>k
        :nnoremap <A-l> <C-w>l
    endif

" Not Mine Thing
" TAB LENGTHS ************************************
    autocmd Filetype slim setlocal ts=2 sts=2 sw=2
    autocmd Filetype html setlocal ts=2 sts=2 sw=2
    autocmd Filetype haml setlocal ts=2 sts=2 sw=2
    autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
    autocmd Filetype coffee setlocal ts=2 sts=2 sw=2
    autocmd Filetype sass setlocal ts=4 sts=4 sw=4
    autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" RuboCop config
    let g:vimrubocop_config = '/home/bartosz/.rubocop.yml'
" Devicons config
    " let g:webdevicons_conceal_nerdtree_brackets = 0
    " let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" Not Mine Thing
" TYPESCRIPT SETTINGS ************************************
    let g:neomake_javascript_enabled_makers = ['eslint']
    let g:tsuquyomi_disable_quickfix = 1
        " let g:neomake_typescript_enabled_makers = []
        " let g:syntastic_typescript_tsc_fname = ''
        " let g:syntastic_typescript_checkers = ['tsuquyomi']
    autocmd FileType typescript setlocal completeopt+=menu,preview

" Auto remove trailing whitespaces on save
    autocmd BufWritePre * FixWhitespace

" PERSONAL CONFIG AND SHORTCUTS ************************************
    let g:neomake_ruby_enabled_makers = ['rubocop']
    autocmd! BufWritePost * Neomake

" Buftabline Config
    nnoremap g5 :bnext<CR>
    nnoremap g4 :bprev<CR>

" " Easymotion Config
"     " <Leader>f{char} to move to {char}
"     map  <Leader>f <Plug>(easymotion-bd-f)
"     nmap <Leader>f <Plug>(easymotion-overwin-f)

"     " s{char}{char} to move to {char}{char}
"     nmap <Leader>s <Plug>(easymotion-overwin-f2)

"     " Move to line
"     map <Leader>L <Plug>(easymotion-bd-jk)
"     nmap <Leader>L <Plug>(easymotion-overwin-line)

"     " Move to word
"     map  <Leader>w <Plug>(easymotion-bd-w)
"     nmap <Leader>w <Plug>(easymotion-overwin-w)

" " Easymotion - Incsearch integration
"     " You can use other keymappings like <C-l> instead of <CR> if you want to
"     " use these mappings as default search and somtimes want to move cursor with
"     " EasyMotion.
"     function! s:incsearch_config(...) abort
"       return incsearch#util#deepextend(deepcopy({
"       \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"       \   'keymap': {
"       \     "\<CR>": '<Over>(easymotion)'
"       \   },
"       \   'is_expr': 0
"       \ }), get(a:, 1, {}))
"     endfunction

"     noremap <expr> /  incsearch#go(<SID>incsearch_config())
"     noremap <expr> ?  incsearch#go(<SID>incsearch_config({'command': '?'}))
"     noremap <expr> g/ incsearch#go(<SID>incsearch_config({'is_stay': 1}))

"     function! s:config_easyfuzzymotion(...) abort
"       return extend(copy({
"       \   'converters': [incsearch#config#fuzzyword#converter()],
"       \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
"       \   'keymap': {"\<CR>": '<Over>(easymotion)'},
"       \   'is_expr': 0,
"       \   'is_stay': 1
"       \ }), get(a:, 1, {}))
"     endfunction

" noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


"Multiple Cursors Config
    " let g:multi_cursor_next_key='<leader>m'

" Custom Shortcuts
    nmap gW :tabclose<CR>
    map <F4> :TagbarToggle<CR>
    nnoremap <F5> :GundoToggle<CR>
    " ctrl+move line (2 lines below)
        nmap <C-S>k ddkP
        nmap <C-S>j ddp
    " inoremap <C-d> <esc>ddi
    " map ; as :
        nnoremap ; :
    " nnoremap , ;
    " some kind of searching
        " imap <C-l> <Esc>$a
    " Copy to system clipboard with 'YY'
        noremap <leader>y "+y<CR>
    " Paste
        noremap <leader>p "+p
        inoremap <C-p> <Esc>pa
        imap <C-v> <Esc>"+pa
    " Change current line color when entering insert mode
        autocmd InsertEnter * highlight  CursorLine ctermbg=52
    " Revert current line color to default when leaving insert mode
        autocmd InsertLeave * highlight  CursorLine ctermbg=233
    " Search on , (2 lines below)
        command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
        nnoremap , :Ag<SPACE>

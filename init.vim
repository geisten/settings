"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

" Completions and snippets
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
Plug 'zchee/deoplete-jedi', {'for': 'python'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-clang'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Helpers
Plug 'bronson/vim-trailing-whitespace'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'

" IDE
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'scrooloose/nerdcommenter'

let g:make = 'gmake'
if exists('make')
    let g:make = 'make'
endif

" Run unit tests embedded
Plug 'janko-m/vim-test'


"" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

Plug 'Shougo/vimshell.vim'


"" Color
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'jacoborus/tender'


"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" c
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'


" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'

"  RUST
Plug 'rust-lang/rust.vim'
"Plug 'racer-rust/vim-racer'
Plug 'sebastianmarkow/deoplete-rust'

" Python
Plug 'python-mode/python-mode'

" TOML
Plug 'cespare/vim-toml'

" javascript
"" Javascript Bundle
Plug 'pangloss/vim-javascript'

Plug 'rhysd/vim-grammarous'

Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'
Plug 'ternjs/tern_for_vim'
Plug 'mxw/vim-jsx'

"Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()
"
"*****************************************************************************
"*****************************************************************************

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=' '

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac
set showcmd
set shell=/bin/sh

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

hi ALEErrorSign ctermfg=red ctermbg=none
hi ALEWarningSign ctermfg=yellow ctermbg=none
let no_buffers_menu=1
colorscheme gruvbox
set background=dark
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 10

if has("gui_running")
    if has("gui_mac") || has("gui_macvim")
        set guifont=Menlo:h12
        set transparency=7
    endif
else
    let g:CSApprox_loaded = 1

    " IndentLine
    let g:indentLine_enabled = 1
    let g:indentLine_concealcursor = 0
    let g:indentLine_char = '┆'
    let g:indentLine_faster = 1
endif



"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w\ -\ %{fugitive#statusline()}%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\ %{ALEGetStatusLine()}\

if exists("*fugitive#statusline")
    set statusline+=%{fugitive#statusline()}
endif

"gruvbox
let g:gruvbox_italic=1
set termguicolors
set termencoding=utf-8

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '


"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
    function s:setupWrapping()
        set wrap
        set wm=2
        set textwidth=99
    endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync fromstart
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
    autocmd!
    autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
    autocmd!
    autocmd FileType make setlocal noexpandtab
    autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" vim-tests
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" make test commands execute using neovim terminal
let test#strategy = "neovim"
let test#javascript#mocha#options = '--compilers js:babel-core/register'

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
    " pbcopy for OSX copy/paste
    vmap <C-x> :!pbcopy<CR>
    vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>


" Edit utils
let delimitMate_expand_cr = 1


"*****************************************************************************
"" Custom configs
"*****************************************************************************

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1


" python
" vim-python
augroup vimrc-python
    autocmd!
    autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
                \ formatoptions+=croq softtabstop=4 smartindent
                \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1


"Markdown
"# Wann geladen wird              # Maske   # Aktivieren      # Zu verwendende Sprache
au BufNewFile,BufRead,BufEnter   *.wiki    setlocal spell    spelllang=en_us
au BufNewFile,BufRead,BufEnter   *.md      setlocal spell    spelllang=en_us
au BufNewFile,BufRead,BufEnter   *de.md    setlocal spell    spelllang=de_de
au BufNewFile,BufRead,BufEnter   *.txt     setlocal spell    spelllang=en_us
au BufNewFile,BufRead,BufEnter   README    setlocal spell    spelllang=en_us
"*****************************************************************************
"" Convenience variables
"*****************************************************************************


" ale settings -  modify status line
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Put this in vimrc or a plugin file of your own.
" After this is configured, :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'rust':['rustfmt'],
\   'python':['pycodestyle', 'pylint']
\}

" This is off by default.
let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'rust': ['rls'],
\   'python':['yapf']
\}

let g:ale_rust_rls_executable='rs'
let g:ale_javascript_prettier_options = '--tab-width 4 --print-width 100 '

" clang formatter
let g:clang_format#style_options = {
            \ "AccessModifierOffset" : -4,
            \ "AllowShortIfStatementsOnASingleLine" : "true",
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "C++11"}

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" if you install vim-operator-user
autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

" Use deoplete.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/4.0.0_1/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/4.0.0_1/lib/clang'
let g:deoplete#sources = {}
let g:deoplete#keyword_patterns={}

" Set bin if you have many instalations
"let g:deoplete#sources#ternjs#tern_bin = '/path/to/tern_bin'
let g:deoplete#sources#ternjs#timeout = 1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for
" properties) between the completions and the origin position in the result
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 1

" Whether to use a case-insensitive compare between the current word and
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 0

" When completing a property and no completions are found, Tern will use some
" heuristics to try and return some properties anyway. Set this to 0 to
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 1

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 1

" Whether to ignore the properties of Object.prototype unless they have been
" spelled out by at least to characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 1


"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
            \ 'jsx',
            \ 'javascript.jsx',
            \ 'vue'
            \ ]

" neosnippet

let g:neosnippet#enable_completed_snippet = 1



"call deoplete#util#set_pattern(
"\ g:deoplete#omni#input_patterns,
"\ 'gitcommit', [g:deoplete#keyword_patterns.gitcommit])

"Javascript syntax highlighting
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

let g:jsx_ext_required = 0

set conceallevel=1
" Set Vimwiki locations
let g:vimwiki_list = [
            \{'path': '~/workspace/gcore/docs/wiki.wiki'}
            \]

"Rust settings
set hidden
let g:deoplete#sources#rust#racer_binary='/Users/germar/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path='Users/germar/workspace/rust/src'

" Show duplicate matches.
let g:deoplete#sources#rust#show_duplicates=1
" To disable default key mappings (gd & K) add the following
let g:deoplete#sources#rust#disable_keymap=1
" Set max height of documentation split.
let g:deoplete#sources#rust#documentation_max_height=20

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Python settings
let g:pymode_python = 'python3'

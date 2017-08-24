set nocompatible              " be iMproved
filetype off                  " required!

set t_Co=256

set rtp+=~/.vim/bundle/Vundle.vim
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"" let Vundle manage Vundle, required
call vundle#begin()
" My bundles here:

Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'digitaltoad/vim-jade'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'sickill/vim-monokai'
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/vimproc.vim', {'do' : 'make'}
Plugin 'Quramy/tsuquyomi'
Plugin 'wincent/command-t'
" All of your Plugins must be added before the following line

call vundle#end()            " required
"filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
" syntax highlighting
"set background=dark     " you can use `dark` or `light` as your background
"color mango
"set smarttab
set list
syntax on
set backspace=2 " make backspace work like most other apps
set tabstop=2
" Enable smart indent. it add additional indents whe necessary
set smartindent
" number of spaces to use for each step of indent
set shiftwidth=4
" Replace tabs with spaces
set expandtab
" Display Line numbers
set number
" Enable display whitespace characters
set list
set background=dark
" Auto reload file
set autoread
set encoding=utf-8
" Setting up how to display whitespace characters
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~
" The cursor should stay where you leave it, instead of moving to the first non
" blank of the line
set nostartofline
" Ignore case in search patterns
set ignorecase
" Add full file path to your existing statusline
set laststatus=2
set statusline+=%f

set foldmethod=syntax
set foldlevel=20

set clipboard+=unnamed  " use the clipboards of vim and win
set go+=a               " Visual selection automatically copied to the clipboard

"keep swap files in one place
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

let g:javascript_enable_domhtmlcss = 1
" Show a vertical line on a 80th character
set colorcolumn=120
highlight ColorColumn ctermbg=DarkGrey

"recolor errors in checkers
highlight SpellBad ctermbg=DarkGrey  
color monokai
" JSX syntax ext jsx
let g:jsx_ext_required = 0
" Don't show pair brackets
let loaded_matchparen = 0
autocmd FileType sass setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType typescript :set makeprg=tsc
let g:syntastic_javascript_checkers = ['gjslint', 'jsxhint']
"typescript checkers
"let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tsc', 'tslint']
" for CPP autocomplete
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"let g:ycm_filetype_whitelist = { '*.ts': 1, 'css': 1, 'html': 1, 'sass': 1, 'json': 1 }
"NerdTree
"let NERDTreeIgnore = ['\.js$', '\.js.map$']
let NERDTreeIgnore = ['\.js.map$']
"for youcompliteme
"if !exists("g:ycm_semantic_triggers")
"  let g:ycm_semantic_triggers = {}
"endif
"let g:ycm_semantic_triggers['typescript'] = ['.']
"commandt ignore dirs
:set wildignore+=node_modules

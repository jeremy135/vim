syntax on
set t_Co=256

execute pathogen#infect()
set tabstop=2
set smartindent
set shiftwidth=4
set expandtab

set number
set list
syntax enable
set background=dark

color monokai

let g:jsx_ext_required = 0

let loaded_matchparen = 0

autocmd FileType sass set omnifunc=csscomplete#CompleteCSS

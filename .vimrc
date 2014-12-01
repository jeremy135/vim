syntax on                                                                        
set t_Co=256                                                                     
                                                                                 
execute pathogen#infect()                                                        
" Number of spaces that a Tab in the file counts for                             
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
" Show a vertical line on a 80th character                                       
set textwidth=80                                                                 
set colorcolumn=+1                                                               
highlight ColorColumn ctermbg=DarkGrey                                           
                                                                                 
color monokai                                                                    
" JSX syntax ext jsx                                                             
let g:jsx_ext_required = 0                                                       
" Don't show pair brackets                                                       
let loaded_matchparen = 0                                                        
                                                                                 
autocmd FileType sass setlocal omnifunc=csscomplete#CompleteCSS                  
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS      
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags                  
                                                                                 
let g:syntastic_javascript_checkers = ['gjslint', 'jsxhint'] 

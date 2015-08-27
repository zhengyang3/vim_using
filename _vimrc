"Cscope Usage 
"Usage:
"#######  cd ~/src/project
"#######  find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.java" > cscope.files 
"#######  cscope -bq         (update datebase automatically)                      


"all plugins: 
"MRU 
"CommandT 
"pathogen
"watchman
"Nerdtree
"tagbar
"minibufexplorer
"grep
"quickfix
"Cscope


set nu
set ignorecase
set smartcase
set keywordprg=dic
set foldenable
set hlsearch
set foldmethod=indent
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>


let mapleader = ","
let g:mapleader = ","


nmap <leader>r :MRU<CR>

execute pathogen#infect()
syntax on
filetype plugin indent on

noremap <leader>t :CommandT<CR>
set wildignore+=*.o,*.obj,.git,*.pyc,*.ko,out
let g:CommandTCancelMap=['<Esc>', '<C-c>']
let g:CommandTMaxFiles=500000
let g:CommandTMaxCachedDirectories=20
let g:CommandTFileScanner = 'watchman'


nmap <leader>e :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows=0


nmap <leader>a :TagbarToggle<CR>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap <silent> <F3> :Grep -rnsi<CR>
nmap <leader>q :q<cr>
nmap <leader>f :q!<cr>
nmap <leader>c :copen<cr>


"Cscope Usage and Config
"Usage:
"#######  cd ~/src/project
"#######  find . -name "*.h" -o -name "*.c" -o -name "*.cpp" -o -name "*.java" > cscope.files 
"#######  cscope -bq         (update datebase automatically)                      

if has("cscope") 
    set cscopequickfix=s-,c-,d-,i-,t-,e- 
    set cscopetag 
    set csto=0 
    if filereadable("cscope.out")   
        cs add cscope.out   
    "else search cscope.out elsewhere   
    else   
       let cscope_file=findfile("cscope.out", ".;")   
       let cscope_pre=matchstr(cscope_file, ".*/")   
       if !empty(cscope_file) && filereadable(cscope_file)   
           exe "cs add" cscope_file cscope_pre   
       endif             
     endif 
    set cscopeverbose 

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR> 
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR> 
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR> 
endif

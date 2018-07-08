"Important Key Mapping
let mapleader = ','
inoremap <leader>s <C-c>:w<cr>
inoremap <leader>w <C-c>:w<cr>
inoremap <leader>wq <C-c>:wq<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>copy :%w !pbcopy<cr>
nnoremap <leader>k gcc
nnoremap <leader>, :b 
nnoremap <leader>. :bd<cr>
nnoremap <leader><Space> /MARKER<cr>cw

"General
set number
set backspace=2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nocompatible
set ignorecase
set smartcase

"Split Screen Controls
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sh :split<cr>
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"Pathogen
execute pathogen#infect()
syntax on 
filetype plugin indent on

"Plugins
let g:go_fmt_command = "goimports"

"Template Checker
" Store skel.* files in $DOTFILES/vim/templates to automatically load
" them when you create a new file of the same *.extension
function CheckForTemplate()
    let extension = expand('%:e')
    let skelfile = $DOTFILES . "/vim/templates/skel." . extension
    if filereadable(skelfile)
        execute "0read " . fnameescape(skelfile)
    else
        echom "could not load " . "." . extension . " template"
    endif
endf

if has("autocmd")
    autocmd BufNewFile * call CheckForTemplate()
endif
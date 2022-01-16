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

set encoding=utf-8

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
set hlsearch
set incsearch
set pastetoggle=<F2>
noremap <F3> :set invnumber<CR>

"hi Search ctermbg=DarkMagenta
"hi Search ctermfg=Red

"Split Screen Controls
nnoremap <leader>sv :vsplit<cr>
nnoremap <leader>sh :split<cr>
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

syntax on
filetype plugin indent on

"M-x delete-trailing-whitespace
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

"Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

Plug 'markonm/traces.vim'

Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"

Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['go']

Plug 'dense-analysis/ale'
"This will only work if using language servers
let g:ale_completion_enabled = 1
"Needed to tab through completion options
inoremap <silent><expr> <Tab>
        \ pumvisible() ? "\<C-n>" : "\<TAB>"

"Sane defaults that are only set like that sometimes
set completeopt=menu,menuone,preview,noselect,noinsert
let g:ale_linters = {
        \ 'go': ['gopls'],
        \'typescript': ['tsserver'],
\}
let g:ale_fixers = {
        \'typescript' : ['eslint'],
        \'typescriptreact' : ['eslint'],
\}

map <C-d> :ALEGoToDefinitionInVSplit<CR>

Plug 'preservim/nerdtree'
map <C-n> :NERDTreeToggle<CR>

call plug#end()

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

let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 1

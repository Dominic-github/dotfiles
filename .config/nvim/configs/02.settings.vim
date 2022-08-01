let mapleader = ","

filetype plugin on
filetype plugin indent on

autocmd BufEnter * :set scroll=10
syntax on
set encoding=UTF-8
set mouse=a

"Set font and font size // need Fira Code
set guifont=Fira\ Code:h10

set incsearch
set hlsearch

set signcolumn=yes
set cursorline

set number
set relativenumber
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=100
set wildignore+=*/node_modules/*  "ignore node_modules folder in fuzzy finder

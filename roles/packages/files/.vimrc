" Basic settings
set nocompatible
set backspace=indent,eol,start

" Display settings
set number
set ruler
set showcmd
set showmatch

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Indentation
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Syntax highlighting
syntax on
filetype plugin indent on

" Color scheme
colorscheme default
set background=dark

" Performance
set lazyredraw

" File handling
set autowrite
set autoread

" Status line
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]

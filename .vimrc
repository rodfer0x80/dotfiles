syntax on
set ruler
set number
set relativenumber
nnoremap <F2> :set paste!<CR>
set pastetoggle=<F2>
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set tabstop=4          
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent        
set incsearch
set fileformats=unix
if $SHELL != ''
  set shell=$SHELL
else
  set shell=/bin/sh
endif
let g:session_directory = '~/.vim/session'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_command_aliases = 1
set wildmenu
set guicursor=a:blinkon0
"set guifont=Monospace\ 14
set scrolloff=16
set laststatus=2
nnoremap n nzzzv
nnoremap N Nzzzv
let mapleader = " "
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set updatetime=42
set colorcolumn=80
set signcolumn=yes
set isfname+=@-@

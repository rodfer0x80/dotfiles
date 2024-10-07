" Basic settings
set nocompatible
set encoding=utf-8
set fileencoding=utf-8

" UI settings
set number
"set relativenumber
set ruler
set wildmenu
set showcmd
set showmatch
set laststatus=2
set noshowmode

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Indentation settings
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Text rendering settings
set wrap
set linebreak
set scrolloff=3

" Performance settings
set lazyredraw

" Syntax highlighting
syntax enable
filetype plugin indent on

" Custom color scheme with transparent background
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

" Set colors
hi Normal           ctermfg=White       ctermbg=NONE
hi LineNr           ctermfg=DarkGray    ctermbg=NONE
hi CursorLineNr     ctermfg=White       ctermbg=DarkGray
hi CursorLine       cterm=NONE          ctermbg=DarkGray
hi Comment          ctermfg=DarkGray
hi Constant         ctermfg=Green
hi String           ctermfg=Green
hi Identifier       ctermfg=White
hi Statement        ctermfg=Yellow
hi PreProc          ctermfg=Yellow
hi Type             ctermfg=White
hi Special          ctermfg=Green
hi Error            ctermfg=White       ctermbg=Red
hi Todo             ctermfg=Black       ctermbg=Green
hi Search           ctermfg=Black       ctermbg=Green
hi IncSearch        ctermfg=Black       ctermbg=Green
hi MatchParen       ctermfg=Black       ctermbg=Green

" Status line colors
hi StatusLine       ctermfg=DarkGray       ctermbg=White
hi StatusLineNC     ctermfg=White          ctermbg=NONE

" Tab line colors
hi TabLine          ctermfg=DarkGray    ctermbg=NONE
hi TabLineFill      ctermfg=DarkGray    ctermbg=NONE
hi TabLineSel       ctermfg=White       ctermbg=DarkGray

" Enable cursor line
"set cursorline

" Ensure Vim uses the terminal background
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE

" Key mappings
nnoremap <space> :
inoremap jk <esc>

" Miscellaneous
set backspace=indent,eol,start
set hidden
set history=1000
set wildignore+=*.swp,*.bak,*.pyc,*.class
set nobackup
set noswapfile

" Enable mouse support
set mouse=a

" Persistent undo
set undofile
set undodir=.vim/undodir

" Disable arrow keys to encourage hjkl usage
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

set paste
" If setting paste by default doesnt break stuff ignore this "
" Create a paste mode toggle function
"function! TogglePaste()
"    if &paste
"        set nopaste
"        echo "Paste Mode OFF"
"    else
"        set paste
"        echo "Paste Mode ON"
"    endif
"endfunction
"
" Map the toggle function to 'z' key in normal mode
"nnoremap <Leader>z :call TogglePaste()<CR>


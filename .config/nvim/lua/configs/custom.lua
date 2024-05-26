vim.cmd("colorscheme molokai")
-- Transparent background
vim.cmd([[
let t:is_transparent = 0
hi Normal guibg=NONE ctermbg=NONE
function! Toggle_transparent_background()
      if t:is_transparent == 0
              hi Normal guibg=#111111 ctermbg=black
                  let t:is_transparent = 1
                    else
                            hi Normal guibg=NONE ctermbg=NONE
                                let t:is_transparent = 0
                                  endif
endfunction
nnoremap <C-X><C-T> :call Toggle_transparent_background()<CR>
]])

-- Basic setup
vim.cmd([[
"" Lines
syntax on
set ruler
""set number
set nu
set relativenumber
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
"" It's 8 or nothing 
set tabstop=8
set softtabstop=8
set shiftwidth=8
set expandtab
set smartindent
"" buffers
""set hidden=true
""let no_buffers_menu=1
"" Searching
set incsearch
""set ignorecase=true
""set smartcase=true
"" nix all the things
set fileformats=unix,dos,mac
if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif
" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
"" Better command line completion
set wildmenu
"" mouse support
""set mouse=a
""set mousemodel=popup
"" Disable the blinking cursor.
set gcr=a:blinkon0
"" gay stuff
""set t_Co=256
""set guioptions=egmrti
set gfn=Monospace\ 12
"" 16 lines down up is nice
set scrolloff=16
"" Status bar
set laststatus=2
"" Use modeline overrides
""set modeline
""set modelines=10
"" more gay stuff
set title
set titleold="Terminal"
set titlestring=%F
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
"" *sexy not gay
]])
vim.g.mapleader = " "
-- undos and backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- *sexy colours, not gay
vim.opt.termguicolors = true

-- my dog wrote this part not sure what it does
vim.opt.updatetime = 42
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

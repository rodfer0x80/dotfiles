-- Set colorscheme (uncomment if needed)
-- vim.cmd("colorscheme molokai")

-- Transparent background toggle
local is_transparent = true
function Toggle_transparent_background()
  if is_transparent then
    vim.api.nvim_set_hl(0, "Normal", { bg = "#111111", ctermbg = "black" })
  else
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  end
  is_transparent = not is_transparent
end
vim.api.nvim_set_keymap("n", "<C-X><C-T>", ":lua Toggle_transparent_background()<CR>", { noremap = true, silent = true })

-- Basic setup
-- Lines
vim.cmd("syntax on")
vim.o.ruler = true
vim.o.number = true
vim.o.relativenumber = true

-- Encoding
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "utf-8"
vim.o.ttyfast = true

-- Tabs and Indentation
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smartindent = true

-- Searching
vim.o.incsearch = true

-- File formats
vim.o.fileformats = "unix" -- dos, mac

-- Shell setup
if vim.env.SHELL then
  vim.o.shell = vim.env.SHELL
else
  vim.o.shell = "/bin/sh"
end

-- Session management
vim.g.session_directory = "~/.vim/session"
vim.g.session_autoload = "no"
vim.g.session_autosave = "no"
vim.g.session_command_aliases = 1

-- Command line completion
vim.o.wildmenu = true

-- Mouse support (uncomment if needed)
-- vim.o.mouse = "a"
-- vim.o.mousemodel = "popup"

-- Disable blinking cursor
vim.o.guicursor = "a:blinkon0"

-- Font (adjust if needed)
vim.o.guifont = "Hack Nerd Font Mono 12"

-- Scrolling
vim.o.scrolloff = 16

-- Status bar
vim.o.laststatus = 2

-- Titles
--vim.o.title = true
--vim.o.titleold = "Terminal"
--vim.o.titlestring = "%F"

-- Search mappings to center line on search result
vim.api.nvim_set_keymap("n", "n", "nzzzv", { noremap = true })
vim.api.nvim_set_keymap("n", "N", "Nzzzv", { noremap = true })

-- Leader key
vim.g.mapleader = " "

-- Undo and backup
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = vim.fn.expand("~/.vim/undodir")
vim.o.undofile = true

-- Colors and appearance
vim.o.termguicolors = true
vim.o.updatetime = 42
vim.o.colorcolumn = "80"
vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")

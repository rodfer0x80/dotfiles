-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "hard", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})

-- Colours
-- https://github.com/ellisonleao/gruvbox.nvim/blob/main/lua/gruvbox.lua
require("gruvbox").setup({
    palette_overrides = {
      bright_green = "#00ff00",
    	bright_red = "#ffa000",
      bright_blue = "#00edff",
	    bright_purple = "#ff49ff",
      bright_yellow = "#ffff00",
      dark_green = "#00ff00",
    	dark_red = "#ffa000",
      dark_blue = "#00edff",
	    dark_purple = "#ff49ff",
      dark_yellow = "#ffff00",
	    light0_hard = "#ffffff",
	    light0 = "#ffffff",
	    light1_hard = "#ffffff",
	    light1 = "#ffffff",
	    light2_hard = "#ffffff",
	    light2 = "#ffffff",
	    light3_hard = "#ffffff",
	    light3 = "#ffffff",
	    light4_hard = "#ffffff",
	    light4 = "#ffffff",
    }
})

vim.cmd("colorscheme gruvbox")

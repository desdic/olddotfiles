local cmd = vim.cmd
local option = vim.o
local window_option = vim.wo

cmd 'syntax enable'
option.background = 'dark'
option.termguicolors = true
window_option.cursorline = true
-- cmd 'colorscheme nvcode'
cmd 'colorscheme catppuccin'

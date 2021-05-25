-- local cmd = vim.cmd
-- local api = vim.api
local global = vim.g
local option = vim.o
local buffer_option = vim.bo
local window_option = vim.wo
local indent = 2

global.mapleader = ',' -- Set leader

option.shortmess = option.shortmess .. 'I' -- Turn off splash
option.shortmess = option.shortmess .. 'c' -- Avoid showing message extra message when using completion

option.cmdheight = 2 -- Set height to prevent 'press enter to continue'
option.hidden = true -- Allow to switch buffer without saving
option.iskeyword = vim.o.iskeyword:gsub('_', '') -- Setup word boundry on _
option.completeopt = "menuone,noinsert,noselect"
--option.completeopt = "menuone,noselect"
option.updatetime = 300 -- Faster completion

option.showmode = false -- We don't need to see things like -- INSERT -- anymore
option.ruler = true -- Make search act like search in modern browsers
option.incsearch = true
option.hlsearch = false -- No search highlight
option.backup = false -- Don't use swap or backup
option.writebackup = false
option.swapfile = false -- TODO this dosn't work
option.showmatch = true -- Show matching braces
option.synmaxcol = 500 -- Stop syntax highlight on long lines
option.wrap = false -- Don't wrap lines
option.textwidth = 0 -- Don't add newline after 80 chars
option.scrolloff = 10 -- Always keep 10 lines visible
option.errorbells = false -- Disable error bells
option.showcmd = true -- Show the (partial) command as it’s being typed

-- TODO
option.undodir = '/home/kgn/.config/nvim/undo' -- Save and set undo/redo levels
option.undofile = true
option.undolevels = 100
option.undoreload = 100

window_option.signcolumn = 'number' -- Always show signcolumn
window_option.number = true -- Show numbers
window_option.relativenumber = true -- Show relative numbers

window_option.listchars = 'tab:▸ ,trail:·,nbsp:_' -- Hidden chars
window_option.list = true -- Show hidden chars

buffer_option.tabstop = indent -- Default set to spaces
buffer_option.shiftwidth = indent
buffer_option.expandtab = true
buffer_option.autoindent = true
buffer_option.smartindent = true

-- print(vim.o.listchars)
-- lua print(vim.bo.formatoptions)


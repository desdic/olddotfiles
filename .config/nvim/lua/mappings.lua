local api = vim.api
-- local cmd = vim.cmd

-- Vertical split
api.nvim_set_keymap('n', '<C-\\>', ':vs<CR>', {})

api.nvim_set_keymap('n', '<C-p>', ':BufferLineCyclePrev<CR>', {})
api.nvim_set_keymap('n', '<C-n>', ':BufferLineCycleNext<CR>', {})

api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap=true})

-- Close, write and quit buffers
-- api.nvim_set_keymap('', '<Leader>c', ':close<CR>', {})
api.nvim_set_keymap('', '<Leader>c', ':close<CR>', {})
api.nvim_set_keymap('', '<Leader>w', ':w!<CR>', {})
--api.nvim_set_keymap('n', '<Leader>q', ':BufferClose<CR>', {})
api.nvim_set_keymap('', '<Leader>q', ':bp <BAR> bd #<CR>', {})

api.nvim_set_keymap('', '<Leader>t', ':terminal<CR>', {})

api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

-- Indent in visual mode
api.nvim_set_keymap('v', '<', '<gv', {})
api.nvim_set_keymap('v', '>', '>gv', {})

-- Move with CTRL+Meta (Alt)
api.nvim_set_keymap('n', '<C-m-j>', ':m .+1<CR>==', {noremap = true})
api.nvim_set_keymap('n', '<C-m-k>', ':m .-2<CR>==', {noremap = true})
api.nvim_set_keymap('i', '<C-m-j>', '<Esc>:m .+1<CR>==gi', {noremap = true})
api.nvim_set_keymap('i', '<C-m-k>', '<Esc>:m .-2<CR>==gi', {noremap = true})
api.nvim_set_keymap('v', '<C-m-j>', ':m \'>+1<CR>gv=gv', {noremap = true})
api.nvim_set_keymap('v', '<C-m-k>', ':m \'<-2<CR>gv=gv', {noremap = true})

api.nvim_set_keymap('n', '<Leader>qa', ':qa!<CR>', {noremap = true})

-- CTRL+Backspace to delete word
api.nvim_set_keymap('i', '<C-H>', '<C-W>', {noremap = true})

-- jj as escape
api.nvim_set_keymap('i', 'jj', '<ESC>', {})

api.nvim_set_keymap('n', '<Leader><space>', ':nohlsearch<CR>', {noremap = true, silent = false, expr = false})

-- {{ Telescope
api.nvim_set_keymap('n', '<Leader>a', ':lua require("telescope.builtin").marks()<CR>', {})
api.nvim_set_keymap('n', '<Leader>ff', ':lua require("telescope.builtin").find_files({hidden=true})<CR>', {})
api.nvim_set_keymap('n', '<Leader>fv', ':lua require("telescope.builtin").treesitter()<CR>', {})
api.nvim_set_keymap('n', '<Leader>fm', ':lua require("telescope").extensions.media_files.media_files()<CR>', {})
api.nvim_set_keymap('n', '<Leader>fg', ':lua require("telescope.builtin").live_grep()<CR>', {})
api.nvim_set_keymap('n', '<Leader>fb', ':lua require("telescope.builtin").buffers()<CR>', {})
api.nvim_set_keymap('n', '<Leader>fh', ':lua require("telescope.builtin").help_tags()<CR>', {})
api.nvim_set_keymap('n', '<Leader>fo', ':lua require("telescope.builtin").tags{ only_current_buffer = true }<CR>', {})
api.nvim_set_keymap('n', '<Leader>vrc', ':lua require("config.telescope").search_nvim()<CR>', {noremap=true})
api.nvim_set_keymap('n', '<Leader>notes', ':lua require("config.telescope").grep_notes()<CR>', {noremap=true})
-- }}

-- {{ Trouble
api.nvim_set_keymap('n', '<Leader>p', ':TroubleToggle<CR>', {noremap=true})
-- }}

-- {{ Focus
api.nvim_set_keymap('n', '<Leader>h', ':FocusSplitLeft<CR>', { silent = true })
api.nvim_set_keymap('n', '<Leader>j', ':FocusSplitDown<CR>', { silent = true })
api.nvim_set_keymap('n', '<Leader>k', ':FocusSplitUp<CR>', { silent = true })
api.nvim_set_keymap('n', '<Leader>l', ':FocusSplitRight<CR>', { silent = true })
-- }}

api.nvim_set_keymap('n', '<Leader>pack', ':PackerSync<CR>', {noremap=true})

-- {{ NvimTree
api.nvim_set_keymap('n', '<Leader>n',':NvimTreeToggle<CR>', {noremap=true})
api.nvim_set_keymap('n', '<Leader>r',':NvimTreeRefresh<CR>', {noremap=true})
-- }}

-- {{ LSPSaga
-- Not working at the moment
-- api.nvim_set_keymap('n', 'K',            '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', {noremap=true})
api.nvim_set_keymap('n', '<Leader>ca',   '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', {noremap=true})
api.nvim_set_keymap('n', '<C-k>',        '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', {noremap=true, silent=true})
api.nvim_set_keymap('n', '<C-j>',        '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', {noremap=true, silent=true})
api.nvim_set_keymap('n', '<Leader>gr',   '<cmd>lua require("lspsaga.rename").rename()<CR>', {noremap=true, silent=true})
api.nvim_set_keymap('n', '<C-f>',        '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>)', {noremap=true, silent=true})
api.nvim_set_keymap('n', '<C-b>',        '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>)', {noremap=true, silent=true})
api.nvim_set_keymap('n', '<Leader>gs',   '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>)', {noremap=true, silent=true})
-- }}

-- {{ renamer
api.nvim_set_keymap('n', '<Leader>rn',   '<cmd>lua require("renamer").rename()<CR>', {noremap=true, silent=true})
api.nvim_set_keymap('v', '<Leader>rn',   '<cmd>lua require("renamer").rename()<CR>', {noremap=true, silent=true})

api.nvim_set_keymap('n', 'gd',' <cmd>lua vim.lsp.buf.definition()<CR>', {})
api.nvim_set_keymap('n', 'gD',' <cmd>lua vim.lsp.buf.declaration()<CR>', {})
api.nvim_set_keymap('n', 'gr',' <cmd>lua vim.lsp.buf.references()<CR>', {})
api.nvim_set_keymap('n', 'gi',' <cmd>lua vim.lsp.buf.implementation()<CR>', {})
api.nvim_set_keymap('n', 'K',' <cmd>lua vim.lsp.buf.hover()<CR>', {})

vim.cmd('command! -nargs=0 LspVirtualTextToggle lua require("lsp/virtual_text").toggle()')

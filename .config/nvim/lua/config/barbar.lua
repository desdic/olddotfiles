-- vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<S-x>', ':BufferClose<CR>', { noremap = true, silent = true })
--\
-- cmd("let bufferline = get(g:, 'bufferline', {})")
-- cmd('let bufferline.clickable = v:false')
--
vim.api.nvim_exec([[
	let bufferline = get(g:, 'bufferline', {})
	let bufferline.animation = v:false
	let bufferline.auto_hide = v:false
	let bufferline.clickable = v:false
	let bufferline.closable = v:false
]], false)

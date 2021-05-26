vim.api.nvim_exec([[
	let bufferline = get(g:, 'bufferline', {})
	let bufferline.animation = v:false
	let bufferline.auto_hide = v:false
	let bufferline.clickable = v:false
	let bufferline.closable = v:false
]], false)

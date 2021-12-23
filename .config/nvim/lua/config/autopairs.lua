local ok, ap = pcall(require, 'nvim-autopairs')
if not ok then
	vim.notify("Unable to require nvim-autopairs")
	return
end

ap.setup ({
	disable_filetype = { "TelescopePrompt" }
})

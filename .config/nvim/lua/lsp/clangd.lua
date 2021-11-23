local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

require'lspconfig'.clangd.setup {
	cmd = {DATA_PATH .. "/lsp_servers/clangd/clangd"},
	on_attach = require'lsp'.common_on_attach,
	capabilities = capabilities
}

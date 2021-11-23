-- requires vscode-json-languageserver installed

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

require'lspconfig'.jsonls.setup{
	cmd = { "node", DATA_PATH .. "/lsp_servers/jsonls/node_modules/vscode-langservers-extracted/dist/json-language-server/node/jsonServerMain.js", "--stdio"},
	on_attach = require'lsp'.common_on_attach,
	capabilities = capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics, {
				virtual_text = O.python.diagnostics.virtual_text,
				signs = O.python.diagnostics.signs,
				underline = O.python.diagnostics.underline,
				update_in_insert = true
			}
		)
	},
}

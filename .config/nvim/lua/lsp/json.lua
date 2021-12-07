local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.jsonls.setup{
	cmd = { "node", DATA_PATH .. "/lsp_servers/jsonls/node_modules/vscode-langservers-extracted/dist/json-language-server/node/jsonServerMain.js", "--stdio"},
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
    flags = {
      debounce_text_changes = O.json.debounce_text_changes,
    },
}

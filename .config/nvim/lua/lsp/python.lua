local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.pyright.setup {
	cmd = {"node", DATA_PATH .. "/lsp_servers/python/node_modules/pyright/langserver.index.js", "--stdio"},
	capabilities = capabilities,
    flags = {
      debounce_text_changes = O.python.debounce_text_changes,
    },
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
	settings = {
		python = {
			analysis = O.python.analysis,
		}
	}
}

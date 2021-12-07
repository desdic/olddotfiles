-- If you are using rvm, make sure to change below configuration
-- Make sure that ruby < 3.x.x is installed since solargraph failed with 3.x

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.solargraph.setup {
	cmd = { DATA_PATH .. "/lsp_servers/solargraph/bin/solargraph", "stdio"},
	capabilities = capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = O.ruby.diagnostics.virtual_text,
			signs = O.ruby.diagnostics.signs,
			underline = O.ruby.diagnostics.underline,
			update_in_insert = true

		})
	},
	filetypes = O.ruby.filetypes,
    flags = {
      debounce_text_changes = O.ruby.debounce_text_changes,
    },
}

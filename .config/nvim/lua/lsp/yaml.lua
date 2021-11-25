local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.yamlls.setup{
	cmd = { DATA_PATH .. "/lsp_servers/yaml/node_modules/yaml-language-server/bin/yaml-language-server", "--stdio"},
	capabilities = capabilities,
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(
			vim.lsp.diagnostic.on_publish_diagnostics, {
				virtual_text = O.yaml.diagnostics.virtual_text,
				signs = O.yaml.diagnostics.signs,
				underline = O.yaml.diagnostics.underline,
				update_in_insert = true
			}
		)
	},
}

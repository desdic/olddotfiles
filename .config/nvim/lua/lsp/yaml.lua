-- requires yaml-language-server installed

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.yamlls.setup{
  cmd = {"/usr/bin/yaml-language-server", "--stdio"},
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

-- requires pyright installed

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

require'lspconfig'.pyright.setup {
    cmd = {"/usr/bin/pyright-langserver", "--stdio"},
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
    settings = {
      python = {
        analysis = O.python.analysis,
      }
    }
}

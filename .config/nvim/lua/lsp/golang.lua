local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)

	if client.resolved_capabilities.document_formatting then
		vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
	end

	-- Make sure only null-ls runs formatting
	client.resolved_capabilities.document_formatting = false
	client.resolved_capabilities.document_range_formatting = false

end

local handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = O.golang.diagnostics.virtual_text,
			signs = O.golang.diagnostics.signs,
			underline = O.golang.diagnostics.underline,
			update_in_insert = true
		}
	)
}

local lspconfig = require 'lspconfig'
lspconfig.gopls.setup{
	cmd = { DATA_PATH .. "/lsp_servers/go/gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true
			},
			staticcheck = true,
			gofumpt = true
		}
	},
	root_dir = require'lspconfig'.util.root_pattern(".git","go.mod", "."),
	init_options = {
		usePlaceholders = true;
		completeUnimported = true;
		gofumpt = true;
	},
	capabilities = capabilities,
	handlers = handlers,
	flags = {
		debounce_text_changes = O.golang.debounce_text_changes,
	},
	on_attach = on_attach,
}

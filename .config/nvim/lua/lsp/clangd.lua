local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.clangd.setup {
	cmd = {DATA_PATH .. "/lsp_servers/clangd/clangd"},
	capabilities = capabilities
}

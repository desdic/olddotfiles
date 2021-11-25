local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.dockerls.setup {
	cmd = {DATA_PATH .. "/lsp_servers/dockerfile/node_modules/.bin/docker-langserver", "--stdio"},
	root_dir = vim.loop.cwd,
	capabilities = capabilities,
}

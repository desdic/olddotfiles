local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.bashls.setup {
	cmd = {"node", DATA_PATH .. "/lsp_servers/bash/node_modules/bash-language-server/bin/main.js", "start"},
	filetypes = { "sh", "zsh" },
	capabilities = capabilities,
}

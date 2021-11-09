-- npm install -g dockerfile-language-server-nodejs

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
require'lspconfig'.dockerls.setup {
    cmd = {DATA_PATH .. "/lsp_servers/dockerfile/node_modules/.bin/docker-langserver", "--stdio"},
    on_attach = require'lsp'.common_on_attach,
	root_dir = vim.loop.cwd,
	capabilities = capabilities,
}

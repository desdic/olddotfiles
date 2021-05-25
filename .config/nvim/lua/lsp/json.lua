-- requires vscode-json-languageserver installed

require'lspconfig'.jsonls.setup{
  cmd = {"node", "/usr/lib/node_modules/vscode-json-languageserver/out/node/jsonServerMain.js", "--stdio"},
  on_attach = require'lsp'.common_on_attach,
  capabilities = capabilities
}

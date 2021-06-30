-- requires vscode-json-languageserver installed

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.jsonls.setup{
  cmd = {"node", "/usr/lib/node_modules/vscode-json-languageserver/out/node/jsonServerMain.js", "--stdio"},
  on_attach = require'lsp'.common_on_attach,
  capabilities = capabilities
}

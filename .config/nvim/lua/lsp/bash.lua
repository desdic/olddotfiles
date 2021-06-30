-- requires bash-language-server installed

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.bashls.setup {
  cmd = {"/usr/bin/bash-language-server", "start"},
  on_attach = require'lsp'.common_on_attach,
  filetypes = { "sh", "zsh" },
  capabilities = capabilities,
}

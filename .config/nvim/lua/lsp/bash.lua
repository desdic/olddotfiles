-- requires bash-language-server installed

require'lspconfig'.bashls.setup {
  cmd = {"/usr/bin/bash-language-server", "start"},
  on_attach = require'lsp'.common_on_attach,
  filetypes = { "sh", "zsh" },
  capabilities = capabilities,
}

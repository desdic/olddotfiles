-- requires gopls installed

require'lspconfig'.gopls.setup{
  cmd = {"/usr/bin/gopls"},
  on_attach = require'lsp'.common_on_attach,
  settings = {gopls = {analyses = {unusedparams = true}, staticcheck = true}},
  root_dir = require'lspconfig'.util.root_pattern(".git","go.mod","."),
  init_options = {usePlaceholders = true, completeUnimported = true},
  -- capabilities = capabilities,
}

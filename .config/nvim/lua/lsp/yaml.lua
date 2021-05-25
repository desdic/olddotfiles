-- requires yaml-language-server installed
require'lspconfig'.yamlls.setup{
  cmd = {"/usr/bin/yaml-language-server", "--stdio"},
  capabilities = capabilities
}

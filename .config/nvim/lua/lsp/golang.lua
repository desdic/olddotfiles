-- requires gopls installed

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.gopls.setup{
  cmd = {"/usr/bin/gopls", "serve"},
  on_attach = require'lsp'.common_on_attach,
  settings = {
		gopls = {
			analyses = {
				unusedparams = true
			},
			staticcheck = true,
		}
  },
  root_dir = require'lspconfig'.util.root_pattern(".git","go.mod","."),
  init_options = {usePlaceholders = true, completeUnimported = true},
  capabilities = capabilities,
}

-- requires efm-langserver installed

local python_arguments = {}
local flake8 = {
  LintCommand = "/usr/bin/flake8 --ignore=E501 --stdin-display-name ${INPUT} -",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"}
}

local mypy = {
  LintCommand = "/sbin/mypy mypy --show-column-numbers",
  lintFormats = { '%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}

table.insert(python_arguments, flake8)
table.insert(python_arguments, mypy)

local sh_arguments = {}
local shellcheck = {
  LintCommand = "/usr/bin/shellcheck -f gcc -x",
  lintFormats = {'%f:%l:%c: %trror: %m', '%f:%l:%c: %tarning: %m', '%f:%l:%c: %tote: %m'}
}
table.insert(sh_arguments, shellcheck)

require'lspconfig'.efm.setup{
  cmd = {"/usr/bin/efm-langserver"},
  on_attach = require'lsp'.common_on_attach,
  init_options = {documentFormatting = true, codeAction = false},
  filetypes = {"python", "sh"},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      python = python_arguments,
      sh = sh_arguments
    }
  },
  capabilities = capabilities
}

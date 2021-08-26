DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
HOME_PATH = '/home/' .. vim.fn.expand('$USER')

O = {
  auto_close_tree = 0,
  auto_complete = true,
  colorscheme = 'lunar',
  hidden_files = true,
  wrap_lines = false,
  number = true,
  relative_number = true,
  shell = 'zsh',
  timeoutlen = 100,
  nvim_tree_disable_netrw = 0, -- "1 by default, disables netrw (must be set before plugin's packadd)

  database = {save_location = '~/.config/nvcode_db', auto_execute = 1},
  python = {
    autoformat = false,
    isort = false,
    diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
    analysis = { autoSearchPaths = true, diagnosticMode = "openFilesOnly", useLibraryCodeForTypes = true,},
  },
  lua = {
    autoformat = false,
    diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
  },
  sh = {
    autoformat = false,
    diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
  },
  json = {
    autoformat = false,
    diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
  },
  clang = {
    diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
  },
  ruby = {
    diagnostics = {virtualtext = {spacing = 0, prefix = ""}, signs = true, underline = true},
    filetypes = {'ruby', 'rb', 'erb', 'rakefile'}
  },
  golang = {
    diagnostics = {virtualtext = {spacing = 0, prefix = ""}, signs = true, underline = true},
    autoformat = true,
  }
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = O.treesitter.ensure_installed,
  ignore_install = O.treesitter.ignore_install,
  rainbow = O.treesitter.rainbow,
  highlight = O.treesitter.highlight,
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  }
}


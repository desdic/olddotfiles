require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "javascript", "haskell" }, -- List of parsers to ignore installing
  indent = {
    enable = true,
    disable = {"python"},
  },
  highlight = {
    enable = true,         -- false will disable the whole extension
    disable = { "rust" },  -- list of language that will be disabled
  },
  rainbow = {
    enable = true,
    max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  refactor = {
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        list_definitions_toc = "gO",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
}

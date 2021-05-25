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

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = {"lua", "dockerfile", "cpp", "bash", "gomod", "go", "python", "c", "ruby", "json", "yaml"},
        ignore_install = {"javascript", "haskell"},
        highlight = {enabled = true, disable={"brainfuck"}},
        playground = {enabled = true},
        rainbow = {
          enabled = false,
          max_file_lines = 1000 -- Do not enable for files with more than 1000 lines, int
        }
    },

    database = {save_location = '~/.config/nvcode_db', auto_execute = 1},
    python = {
        linter = '',
        -- @usage can be 'yapf', 'black'
        formatter = '',
        autoformat = false,
        isort = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
        analysis = {type_checking = "basic", auto_search_paths = true, use_library_code_types = true}
    },
    lua = {
        -- @usage can be 'lua-format'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck'
        linter = '',
        -- @usage can be 'shfmt'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    clang = {diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}},
    ruby = {
      diagnostics = {virtualtext = {spacing = 0, prefix = ""}, signs = true, underline = true},
      filetypes = {'rb', 'erb', 'rakefile'}
    },
    golang = {
      diagnostics = {virtualtext = {spacing = 0, prefix = ""}, signs = true, underline = true},
      autoformat = true,
    }
}

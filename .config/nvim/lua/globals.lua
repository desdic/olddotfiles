DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
HOME_PATH = '/home/' .. vim.fn.expand('$USER')

O = {
	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	auto_close_tree = 0,
	auto_complete = true,
	hidden_files = true,
	wrap_lines = false,
	shell = 'zsh',
	timeoutlen = 100,
	nvim_tree_disable_netrw = 0, -- "1 by default, disables netrw (must be set before plugin's packadd)

	python = {
		autoformat = false,
		isort = false,
		-- diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
		diagnostics = {virtual_text = false, signs = true, underline = false},
		analysis = { autoSearchPaths = true, diagnosticMode = "openFilesOnly", useLibraryCodeForTypes = true,},
		debounce_text_changes = 150,
	},
	lua = {
		autoformat = false,
		diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = false},
		debounce_text_changes = 150,
	},
	sh = {
		autoformat = false,
		diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = false}
	},
	json = {
		autoformat = false,
		diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = false},
		debounce_text_changes = 150,
	},
	clang = {
		diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = false},
		debounce_text_changes = 150,
	},
	ruby = {
		diagnostics = {virtual_text = false, signs = true, underline = false},
		filetypes = {'ruby', 'rb', 'erb', 'rakefile'},
		debounce_text_changes = 150,
	},
	golang = {
		diagnostics = {virtual_text = true, signs = true, underline = false},
		autoformat = true,
		debounce_text_changes = 150,
	},
	yaml = {
		diagnostics = {virtual_text = false, signs = true, underline = false},
		autoformat = true,
		debounce_text_changes = 150,
	}
}

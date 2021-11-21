DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')
HOME_PATH = '/home/' .. vim.fn.expand('$USER')

O = {
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
	},
	lua = {
		autoformat = false,
		diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = false}
	},
	sh = {
		autoformat = false,
		diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = false}
	},
	json = {
		autoformat = false,
		diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = false}
	},
	clang = {
		diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = false}
	},
	ruby = {
		diagnostics = {virtual_text = false, signs = true, underline = false},
		filetypes = {'ruby', 'rb', 'erb', 'rakefile'}
	},
	golang = {
		diagnostics = {virtual_text = false, signs = true, underline = false},
		autoformat = true,
	},
	yaml = {
		diagnostics = {virtual_text = false, signs = true, underline = false},
		autoformat = true,
	}
}

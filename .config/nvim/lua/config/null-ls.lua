local M = {}

function M.config()
	local null_ls = require("null-ls")
	local h = require 'null-ls.helpers'

	local gci_format = {
		method = null_ls.methods.FORMATTING,
		filetypes = { "go" },
		generator = h.formatter_factory {
			command = "gci",
			args = {
				"$FILENAME",
			},
			to_stdin = false,
		}
	}

	require("null-ls").setup({
		-- debug = true,
		sources = {
			null_ls.builtins.completion.spell,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.lua_format,
			gci_format,
			null_ls.builtins.formatting.gofmt,
			null_ls.builtins.formatting.gofumpt,
			null_ls.builtins.formatting.goimports,
			null_ls.builtins.diagnostics.golangci_lint.with({
				args = {
					"run",
					"--enable-all",
					"--disable", "lll",
					"--out-format=json",
					"$DIRNAME",
					"--path-prefix",
					"$ROOT",
				}
			}),
			null_ls.builtins.formatting.rubocop,
		},
	})
end

return M

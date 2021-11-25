local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = O.golang.diagnostics.virtual_text,
			signs = O.golang.diagnostics.signs,
			underline = O.golang.diagnostics.underline,
			update_in_insert = true
		}
	)
}

require'lspconfig'.gopls.setup{
	cmd = { DATA_PATH .. "/lsp_servers/go/gopls", "serve"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true
			},
			staticcheck = true,
			gofumpt = true
		}
	},
	root_dir = require'lspconfig'.util.root_pattern(".git","go.mod", "."),
	init_options = {
		usePlaceholders = true;
		completeUnimported = true;
		gofumpt = true;
	},
	capabilities = capabilities,
	handlers = handlers,
}

local lspconfig = require 'lspconfig'
local configs = require 'lspconfig/configs'

if not lspconfig.golangcilsp then
	configs.golangcilsp = {
		default_config = {
			cmd = {HOME_PATH .. "/go/bin/golangci-lint-langserver"},
			root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
			init_options = {
				command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
				-- command = { "golangci-lint", "run", "--disable", "lll", "--out-format", "json" };
			}
		};
	}
end

lspconfig.golangcilsp.setup {
	filetypes = {'go'},
	capabilities = capabilities,
	handlers = handlers,
}

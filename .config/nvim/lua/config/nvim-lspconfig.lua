require("config.null-ls").config()

local i = require('config.icons')
local signs = {
	{ name = "DiagnosticSignError", text = i.diag.error },
	{ name = "DiagnosticSignWarn", text = i.diag.warn },
	{ name = "DiagnosticSignHint", text = i.diag.hint },
	{ name = "DiagnosticSignInfo", text = i.diag.info },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
	-- disable virtual text
	virtual_text = false,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = false,
		style = "minimal",
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

-- Set Default Prefix.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false
	}
)

vim.lsp.handlers["textDocument/hover"] =
	vim.lsp.with(
		vim.lsp.handlers.hover,
		{
			border = "rounded",
		}
	)

vim.lsp.handlers["textDocument/signatureHelp"] =
	vim.lsp.with(
		vim.lsp.handlers.signature_help,
		{
			border = "rounded"
		}
	)

-- Set Default Prefix.
-- Note: You can set a prefix per lsp server in the lv-globals.lua file
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			prefix = "",
			spacing = 0,
		},
		signs = true,
		underline = true,
	}
)

-- Custom golangci-lint
local servers = require 'nvim-lsp-installer.servers'
local golangcilsp = require 'lsp.servers.golangci'
servers.register(golangcilsp.get_server())

local lsp_installer_servers = require'nvim-lsp-installer.servers'
local myservers = {'bashls', 'yamlls', 'pyright', 'efm', 'solargraph', 'gopls', 'golangci_lint_ls', 'dockerls', 'clangd', 'sumneko_lua', 'jsonls'}
for _, myserver in ipairs(myservers) do
	local _, requested_server = lsp_installer_servers.get_server(myserver)
	if not requested_server:is_installed() then
		-- Queue the server to be installed
		requested_server:install()
	end
end

require('lsp.efm-general')
require('lsp.golang')
require('lsp.python')
require('lsp.clangd')
require('lsp.bash')
require('lsp.json')
require('lsp.yaml')
require('lsp.lua')
require('lsp.ruby')
require('lsp.docker')

-- Set Default Prefix.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false
	}
)

-- local function documentHighlight(client, bufnr)
-- 	-- Set autocommands conditional on server_capabilities
-- 	if client.resolved_capabilities.document_highlight then
-- 		vim.api.nvim_exec(
-- 			[[
-- 			hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
-- 			hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
-- 			hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
-- 			augroup lsp_document_highlight
-- 			autocmd! * <buffer>
-- 			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
-- 			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
-- 			augroup END
-- 			]],
-- 			false
-- 		)
-- 	end
-- end

local i = require('config.icons')
vim.fn.sign_define(
	"LspDiagnosticsSignError",
	{texthl = "LspDiagnosticsSignError", text = i.diag.error, numhl = "LspDiagnosticsSignError"}
)
vim.fn.sign_define(
	"LspDiagnosticsSignWarning",
	{texthl = "LspDiagnosticsSignWarning", text = i.diag.warn, numhl = "LspDiagnosticsSignWarning"}
)
vim.fn.sign_define(
	"LspDiagnosticsSignHint",
	{texthl = "LspDiagnosticsSignHint", text = i.diag.hint, numhl = "LspDiagnosticsSignHint"}
)
vim.fn.sign_define(
	"LspDiagnosticsSignInformation",
	{texthl = "LspDiagnosticsSignInformation", text = i.diag.info, numhl = "LspDiagnosticsSignInformation"}
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

local lsp_installer_servers = require'nvim-lsp-installer.servers'
local servers = {'bashls', 'yamlls', 'pyright', 'efm', 'solargraph', 'gopls', 'dockerls', 'clangd', 'sumneko_lua', 'jsonls'}
for _, server in ipairs(servers) do
	local _, requested_server = lsp_installer_servers.get_server(server)
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

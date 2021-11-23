-- Set Default Prefix.
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false
	}
)

local function documentHighlight(client, bufnr)
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
			hi LspReferenceRead cterm=bold ctermbg=red guibg=#464646
			hi LspReferenceText cterm=bold ctermbg=red guibg=#464646
			hi LspReferenceWrite cterm=bold ctermbg=red guibg=#464646
			augroup lsp_document_highlight
			autocmd! * <buffer>
			autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
			autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
			augroup END
			]],
			false
		)
	end
end

require('lsp')
require('lsp.capabilities')
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

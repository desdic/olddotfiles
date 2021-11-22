local lsp_installer_servers = require'nvim-lsp-installer.servers'

local servers = {'bashls', 'yamlls', 'pyright', 'efm', 'solargraph', 'gopls', 'dockerls', 'clangd', 'sumneko_lua', 'jsonls'}
for _, server in ipairs(servers) do
	local server_available, requested_server = lsp_installer_servers.get_server(server)
	if server_available then
		requested_server:on_ready(function ()
			local opts = {}
			requested_server:setup(opts)
		end)
		if not requested_server:is_installed() then
			-- Queue the server to be installed
			requested_server:install()
		end
	end
end

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

--[[ " autoformat
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100) ]]
-- Java
-- autocmd FileType java nnoremap ca <Cmd>lua require('jdtls').code_action()<CR>

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
local lsp_config = {}

function lsp_config.common_on_attach(client, bufnr)
    documentHighlight(client, bufnr)
end

function lsp_config.tsserver_on_attach(client, bufnr)
    lsp_config.common_on_attach(client, bufnr)
    client.resolved_capabilities.document_formatting = false
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
-- local servers = {"pyright", "tsserver"}
-- for _, lsp in ipairs(servers) do nvim_lsp[lsp].setup {on_attach = on_attach} end
return lsp_config



function goimports(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = {only = {"source.organizeImports"}}
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for _, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				vim.lsp.util.apply_workspace_edit(r.edit)
			else
				vim.lsp.buf.execute_command(r.command)
			end
		end
	end
	-- Always do formating
	-- vim.lsp.buf.formatting()
end


-- Watch a file for changes
local w = vim.loop.new_fs_event()
local function on_change(err, fname, status)
	-- Do work...
	vim.api.nvim_command('checktime')
	-- Debounce: stop/start.
	w:stop()
	watch_file(fname)
end

function watch_file(fname)
	local fullpath = vim.api.nvim_call_function(
		'fnamemodify', {fname, ':p'})
	w:start(fullpath, {}, vim.schedule_wrap(function(...)
		on_change(...) end))
end
vim.api.nvim_command("command! -nargs=1 Watch call luaeval('watch_file(_A)', expand('<args>'))")

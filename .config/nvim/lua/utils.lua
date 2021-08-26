local nv_utils = {}

-- organize imports sync
function go_organize_imports_sync(timeoutms)
  local context = {source = {organizeImports = true}}
  vim.validate {context = {context, 't', true}}

  local params = vim.lsp.util.make_range_params()
  params.context = context

  local method = 'textDocument/codeAction'
  local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)

  for _, v in next, resp, nil do
    local result = v.result
    if result and result[1] then
      local edit = result[1].edit
      vim.lsp.util.apply_workspace_edit(edit)
    end
  end
  -- Always do formating
  vim.lsp.buf.formatting()
end

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
  vim.lsp.buf.formatting()
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

function nv_utils.define_augroups(definitions) -- {{{1
  -- Create autocommand groups based on the passed definitions
  --
  -- The key will be the name of the group, and each definition
  -- within the group should have:
  --    1. Trigger
  --    2. Pattern
  --    3. Text
  -- just like how they would normally be defined from Vim itself
  for group_name, definition in pairs(definitions) do
    vim.cmd('augroup ' .. group_name)
    vim.cmd('autocmd!')

    for _, def in pairs(definition) do
      local command = table.concat(vim.tbl_flatten {'autocmd', def}, ' ')
      vim.cmd(command)
    end

    vim.cmd('augroup END')
  end
end

-- lsp

function nv_utils.add_to_workspace_folder()
  vim.lsp.buf.add_workspace_folder()
end

function nv_utils.clear_references()
  vim.lsp.buf.clear_references()
end

function nv_utils.code_action()
  vim.lsp.buf.code_action()
end

function nv_utils.declaration()
  vim.lsp.buf.declaration()
  vim.lsp.buf.clear_references()
end

function nv_utils.definition()
  vim.lsp.buf.definition()
  vim.lsp.buf.clear_references()
end

function nv_utils.document_highlight()
  vim.lsp.buf.document_highlight()
end

function nv_utils.document_symbol()
  vim.lsp.buf.document_symbol()
end

function nv_utils.formatting()
  vim.lsp.buf.formatting()
end

function nv_utils.formatting_sync()
  vim.lsp.buf.formatting_sync()
end

function nv_utils.hover()
  vim.lsp.buf.hover()
end

function nv_utils.implementation()
  vim.lsp.buf.implementation()
end

function nv_utils.incoming_calls()
  vim.lsp.buf.incoming_calls()
end

function nv_utils.list_workspace_folders()
  vim.lsp.buf.list_workspace_folders()
end

function nv_utils.outgoing_calls()
  vim.lsp.buf.outgoing_calls()
end

function nv_utils.range_code_action()
  vim.lsp.buf.range_code_action()
end

function nv_utils.range_formatting()
  vim.lsp.buf.range_formatting()
end

function nv_utils.references()
  vim.lsp.buf.references()
  vim.lsp.buf.clear_references()
end

function nv_utils.remove_workspace_folder()
  vim.lsp.buf.remove_workspace_folder()
end

function nv_utils.rename()
  vim.lsp.buf.rename()
end

function nv_utils.signature_help()
  vim.lsp.buf.signature_help()
end

function nv_utils.type_definition()
  vim.lsp.buf.type_definition()
end

function nv_utils.workspace_symbol()
  vim.lsp.buf.workspace_symbol()
end

-- diagnostic

function nv_utils.get_all()
  vim.lsp.diagnostic.get_all()
end

function nv_utils.get_next()
  vim.lsp.diagnostic.get_next()
end

function nv_utils.get_prev()
  vim.lsp.diagnostic.get_prev()
end

function nv_utils.goto_next()
  vim.lsp.diagnostic.goto_next()
end

function nv_utils.goto_prev()
  vim.lsp.diagnostic.goto_prev()
end

function nv_utils.show_line_diagnostics()
  vim.lsp.diagnostic.show_line_diagnostics()
end

-- git signs

function nv_utils.next_hunk()
  require('gitsigns').next_hunk()
end

function nv_utils.prev_hunk()
  require('gitsigns').prev_hunk()
end

function nv_utils.stage_hunk()
  require('gitsigns').stage_hunk()
end

function nv_utils.undo_stage_hunk()
  require('gitsigns').undo_stage_hunk()
end

function nv_utils.reset_hunk()
  require('gitsigns').reset_hunk()
end

function nv_utils.reset_buffer()
  require('gitsigns').reset_buffer()
end

function nv_utils.preview_hunk()
  require('gitsigns').preview_hunk()
end

function nv_utils.blame_line()
  require('gitsigns').blame_line()
end

-- misc
function nv_utils.file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

return nv_utils

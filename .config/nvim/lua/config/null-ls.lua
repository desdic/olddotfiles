local M = {}

function M.config()
    local null_ls = require("null-ls")
    local h = require("null-ls.helpers")

    local gci_format = {
        method = null_ls.methods.FORMATTING,
        filetypes = {"go"},
        generator = h.formatter_factory({
            command = "gci",
            args = {"-w", "$FILENAME"},
            to_temp_file = true
        })
    }

    require("null-ls").setup({
        -- debug = true,
        on_attach = function(client)
            if client.resolved_capabilities.document_formatting then
                vim.cmd("autocmd BufWritePre <buffer> FormatWrite")
            end
        end,
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.lua_format,
            null_ls.builtins.formatting.gofmt,
            null_ls.builtins.formatting.gofumpt,
            null_ls.builtins.formatting.goimports,
            null_ls.builtins.diagnostics.golangci_lint.with({
                args = {
                    "run", "--enable-all", "--disable", "lll", "--disable",
                    "godot", "--out-format=json", "$DIRNAME", "--path-prefix",
                    "$ROOT"
                }
            }), null_ls.builtins.formatting.rubocop.with({
                args = {
                    "--auto-correct", "-f", "-c", "~/.work-rubocop.yml",
                    "quiet", "--stderr", "--stdin", "$FILENAME"
                }
            }), null_ls.builtins.diagnostics.rubocop.with({
                args = {
                    "-c", "~/.work-rubocop.yml", "-f", "json", "--stdin",
                    "$FILENAME"
                }
            }), gci_format
        }
    })
end

return M

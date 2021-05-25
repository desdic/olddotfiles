-- Trigger a highlight in the appropriate direction when pressing these keys:
vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}

-- augroup qs_colors
--   autocmd!
--   autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
--   autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
-- augroup END

-- Disable long lines
vim.g.qs_max_chars = 150

-- Backlist types
vim.g.qs_buftype_blacklist = {'terminal', 'nofile'}

-- Be lazy to reduce slowdown
vim.g.qs_lazy_highlight = 1

" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

" Disable long lines
let g:qs_max_chars=150

" Blacklist types
let g:qs_buftype_blacklist = ['terminal', 'nofile']

" Be lazy to reduce slowdown
let g:qs_lazy_highlight = 1

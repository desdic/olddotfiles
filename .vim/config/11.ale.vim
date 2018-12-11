" Ale --- {{{
"let g:ale_sign_column_always = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'ℹ'
let g:airline#extensions#ale#enabled = 1
"let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_linters = {'go': ['gometalinter']}
let g:ale_go_gometalinter_options = ' --disable="gotype"'

" ---}}}

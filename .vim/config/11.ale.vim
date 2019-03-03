" Ale --- {{{
"let g:ale_sign_column_always = 1
"let g:ale_sign_error = '✖'
"let g:ale_sign_warning = '⚠'
"let g:ale_sign_info = 'ℹ'

let g:ale_sign_error = ''
let g:ale_sign_warning = ''

let g:airline#extensions#ale#enabled = 1
"let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

let g:ale_echo_msg_format = '%linter% says %s'

let g:ale_linters = {'go': ['gometalinter']}
let g:ale_go_gometalinter_options = ' --fast --disable="gotype"'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0

"let g:ale_open_list = 1
"" Set this if you want to.
"" " This can be useful if you are combining ALE with
"" " some other plugin which sets quickfix errors, etc.
"let g:ale_keep_list_window_open = 1
"" Show 5 lines of errors (default: 10)
"let g:ale_list_window_size = 5

"let g:ale_go_gometalinter_options = ' --disable="gotype"'

" ---}}}

" vim-go ---{{{
"let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']


" gometalinter configuration
"let g:go_metalinter_command = ""
"let g:go_metalinter_deadline = "5s"
"let g:go_metalinter_enabled = [
"    \ 'deadcode',
"    \ 'gas',
"    \ 'goconst',
"    \ 'errcheck',
"    \ 'gocyclo',
"    \ 'golint',
"    \ 'gosimple',
"    \ 'ineffassign',
"    \ 'vet',
"    \ 'vetshadow'
"\]

let g:go_metalinter_autosave = 0 " Use Ale
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
"let g:go_list_type = "quickfix"
"let g:go_def_mode = "guru"
let g:go_def_mode = "gopls"
let g:go_info_mode= "gopls"

let g:go_echo_command_info = 1  " Show the progress when running :GoCoverage
let g:go_test_show_name = 1     " Add the failing test name to the output of :GoTest

let g:go_gocode_autobuild = 1
let g:go_gocode_unimported_packages = 1

"Enabled for go 1.11
"let g:go_autodetect_gopath = 0  " This does not seem to work so I have disabled it and set it on every project
let g:go_info_mode = "gopls"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_auto_sameids = 0

let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1

let g:go_modifytags_transform = 'camelcase'
let g:go_addtags_transform = 'camelcase'

let g:go_jump_to_error = 0
"---}}}

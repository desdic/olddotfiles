" Deoplete ---{{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 0 " set to 1 if you want to disable autocomplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go'

" Test options
let g:deoplete#sources#go#align_class = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns = {}

" Disable the candidates in Comment/String syntaxes.
"call deoplete#custom#source('_',
"            \ 'disabled_syntaxes', ['Comment', 'String'])

function! s:tab_complete()
  " is completion menu open? cycle to next item
  if pumvisible()
    return "\<c-n>"
  endif

  " if none of these match just use regular tab
  return "\<tab>"
endfunction

imap <silent><expr><TAB> <SID>tab_complete()
" ---}}}

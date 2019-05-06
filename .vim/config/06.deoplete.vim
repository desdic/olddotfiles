" Deoplete ---{{{

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']


"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#disable_auto_complete = 0 " set to 1 if you want to disable autocomplete
""autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
"let g:deoplete#sources#go#package_dot = 1
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
"
"" Test options
""let g:deoplete#keyword_patterns = {}
""let g:deoplete#keyword_patterns['default'] = '\h\w*'
"let g:deoplete#auto_complete_start_length = 2
""let g:deoplete#omni#input_patterns = {}
"let g:deoplete#sources#go#align_class = 1
"let g:deoplete#sources#go#pointer = 1
"let g:deoplete#sources#go#builtin_objects = 1
"let g:deoplete#sources#go#unimported_packages = 1
"
"
"function! s:tab_complete()
"  " is completion menu open? cycle to next item
"  if pumvisible()
"    return "\<c-n>"
"  endif
"
"  " is there a snippet that can be expanded?
"  " is there a placholder inside the snippet that can be jumped to?
"  if neosnippet#expandable_or_jumpable() 
"    return "\<Plug>(neosnippet_expand_or_jump)"
"  endif
"
"  " if none of these match just use regular tab
"  return "\<tab>"
"endfunction
"
"imap <silent><expr><TAB> <SID>tab_complete()
"
"" Disable the candidates in Comment/String syntaxes.
""call deoplete#custom#source('_',
""            \ 'disabled_syntaxes', ['Comment', 'String'])
"
""function! s:tab_complete()
""  " is completion menu open? cycle to next item
""  if pumvisible()
""    return "\<c-n>"
""  endif
""
""  " if none of these match just use regular tab
""  return "\<tab>"
""endfunction
""
""imap <silent><expr><TAB> <SID>tab_complete()
"
"""<TAB>: completion.
""inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"
"
""function! s:check_back_space() abort "{{{
""  let col = col('.') - 1
""  return !col || getline('.')[col - 1]  =~ '\s'
""endfunction"}}}
""inoremap <silent><expr> <TAB>
""      \ pumvisible() ? "\<C-n>" :
""      \ <SID>check_back_space() ? "\<TAB>" :
""      \ deoplete#manual_complete()
"
"" ---}}}

let g:coc_global_extensions = [
\ 'coc-tsserver',
\ 'coc-json',
\ 'coc-yaml',
\ 'coc-highlight',
\ 'coc-python',
\ 'coc-pairs',
\ 'coc-snippets',
\ 'coc-go'
\ ]

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <C-k> for trigger snippet expand.
imap <C-k> <Plug>(coc-snippets-expand)

" Use <C-k> for select text for visual placeholder of snippet.
vmap <C-k> <Plug>(coc-snippets-select)

" Use <tab> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'

" Use <s-tab> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<s-tab>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

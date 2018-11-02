" Neosnippet --- {{{
"let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"map <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

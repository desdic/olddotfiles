let g:vim_markdown_folding_disabled=1
"autocmd FileType markdown setlocal tw=80
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown set noexpandtab shiftwidth=4 tabstop=4

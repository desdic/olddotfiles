
" GO
autocmd FileType go set nolist

" C/C++
autocmd FileType c setlocal expandtab ts=4 sw=4
autocmd FileType cpp setlocal expandtab ts=4 sw=4

" json
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd FileType javascript setlocal expandtab ts=4 sw=4
autocmd FileType json setlocal expandtab ts=4 sw=4
autocmd BufNewFile,BufRead *.json.disabled set ft=json
autocmd BufNewFile,BufRead *.jsondisabled set ft=json

"let g:vim_markdown_folding_disabled=1
"autocmd FileType markdown setlocal tw=80
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.md set syntax=off
autocmd FileType markdown set noexpandtab shiftwidth=4 tabstop=4

" don't show whitespace in help files
autocmd FileType help set nolist

autocmd FileType python setlocal expandtab ts=4 sw=4
autocmd FileType text setlocal tw=80 noexpandtab
autocmd FileType ruby setlocal expandtab ts=4 sw=4

" Yaml
autocmd FileType yaml setlocal expandtab ts=2 sw=2
autocmd BufRead,BufNewFile *.yml setfiletype yaml

" Make
autocmd FileType make setlocal noexpandtab

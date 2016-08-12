
" GO
autocmd FileType go set nolist
set rtp+=~/.vim/plugin/lint.vim
autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

" C/C++
autocmd FileType c set tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp set tabstop=4 shiftwidth=4 expandtab

" json
autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd FileType javascript set tabstop=4 shiftwidth=4 expandtab
autocmd FileType json set tabstop=4 shiftwidth=4 expandtab
autocmd BufNewFile,BufRead *.json.disabled set ft=json
autocmd BufNewFile,BufRead *.jsondisabled set ft=json

"let g:vim_markdown_folding_disabled=1
"autocmd FileType markdown setlocal tw=80
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.md set syntax=off
autocmd FileType markdown set noexpandtab shiftwidth=4 tabstop=4

" don't show whitespace in help files
autocmd FileType help set nolist

autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType text set tabstop=4 shiftwidth=4 expandtab
autocmd FileType ruby set tabstop=4 shiftwidth=4 expandtab

" Yaml
autocmd FileType yaml setlocal expandtab ts=2 sw=2
autocmd BufRead,BufNewFile *.yml setfiletype yaml

" Make
autocmd FileType make set noexpandtab

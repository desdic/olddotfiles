
" Mail
autocmd FileType mail set tw=72 fo+=taw spell

" GO
autocmd FileType go set nolist

set rtp+=~/.vim/plugin/lint.vim
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"autocmd BufWritePost,FileWritePost *.go execute 'GoLint' | cwindow

" C/C++
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType asm setlocal tabstop=4 shiftwidth=4 expandtab

" json
"autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.json set ft=json
autocmd BufNewFile,BufRead *.json.disabled set ft=json
autocmd BufNewFile,BufRead *.jsondisabled set ft=json
autocmd FileType json setlocal tabstop=4 shiftwidth=4 expandtab

autocmd FileType javascript setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS


"let g:vim_markdown_folding_disabled=1
"autocmd FileType markdown setlocal tw=80
autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
"autocmd BufNewFile,BufRead *.md set syntax=off
autocmd FileType markdown setlocal noexpandtab shiftwidth=4 tabstop=4

" don't show whitespace in help files
autocmd FileType help set nolist

autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

autocmd FileType text setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType ruby setlocal tabstop=4 shiftwidth=4 expandtab

" Yaml
autocmd BufRead,BufNewFile *.yml setfiletype yaml
"autocmd BufRead,BufNewFile *.yml syntax clear
autocmd FileType yaml setlocal expandtab ts=2 sw=2

" Make
autocmd FileType make setlocal noexpandtab

" Eruby
autocmd BufRead,BufNewFile *.erb setfiletype eruby

" Ruby
autocmd BufRead,BufNewFile *.rb setfiletype ruby

" Git
autocmd FileType gitcommit setlocal spell


augroup filetypedetect
    command! -nargs=* -complete=help Help vertical belowright help <args>
    autocmd FileType help wincmd L

    autocmd BufEnter * :syn sync maxlines=200

    autocmd BufNewFile,BufRead *.go   setlocal noexpandtab tabstop=4 shiftwidth=4
    autocmd BufNewFile,BufRead *.md   setlocal filetype=markdown noexpandtab shiftwidth=4 tabstop=4
    autocmd BufNewFile,BufRead *.yml  setfiletype yaml
    autocmd BufNewFile,BufRead *.txt  setlocal noet ts=4 sw=4
    autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
    autocmd BufNewFile,BufRead *.vim  setlocal expandtab shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.sh   setlocal expandtab shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.js   setlocal tabstop=4 shiftwidth=4 expandtab
    autocmd BufNewFile,BufRead *.json setlocal expandtab shiftwidth=2 tabstop=2
    autocmd BufNewFile,BufRead *.erb  setlocal expandtab shiftwidth=2 tabstop=2 set filetype=ruby.eruby.chef setfiletype eruby
    autocmd BufNewFile,BufRead *.rb   setlocal expandtab shiftwidth=2 tabstop=2 setfiletype ruby

    autocmd FileType markdown let b:deoplete_disable_auto_complete = 1
    autocmd FileType python   setlocal expandtab shiftwidth=4 tabstop=4 omnifunc=pythoncomplete#Complete
    autocmd FileType c        setlocal expandtab tabstop=4 shiftwidth=4
    autocmd FileType cpp      setlocal expandtab tabstop=4 shiftwidth=4
    autocmd FileType asm      setlocal expandtab tabstop=4 shiftwidth=4
    autocmd FileType html     setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType xml      setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType yaml     setlocal expandtab ts=2 sw=2
    autocmd FileType make     setlocal noexpandtab
    autocmd FileType text let b:deoplete_disable_auto_complete = 1
    autocmd FileType help     setlocal nolist " don't show whitespace in help files
    autocmd FileType vim let b:deoplete_disable_auto_complete = 1
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitcommit let b:deoplete_disable_auto_complete = 1
augroup END

augroup json
    autocmd!
    autocmd BufNewFile,BufRead *.json set conceallevel=0
    autocmd BufNewFile,BufRead *.json set ft=json
    autocmd BufNewFile,BufRead *.json.disabled set ft=json
    autocmd BufNewFile,BufRead *.jsondisabled set ft=json
augroup END

augroup mail
    autocmd!
    autocmd FileType mail set tw=72 fo+=taw spell
    autocmd FileType mail let b:deoplete_disable_auto_complete = 1
augroup END

augroup go
    autocmd!
    autocmd FileType go set nolist "Don't want to see those tabs

    set rtp+=~/.vim/plugin/lint.vim
    au FileType go nmap <leader>r <Plug>(go-run-split)
    au FileType go nmap <leader>b <Plug>(go-build)
    au FileType go nmap <leader>t <Plug>(go-test)
    au FileType go nmap <leader>c <Plug>(go-coverage)
    au FileType go nmap <leader>l <Plug>(go-metalinter)
    nmap <leader>d :GoDef<CR>
    nmap <leader>g :GoDecls<CR>
    nmap <leader>s :GoFillStruct<CR>
augroup END
" ---}}}

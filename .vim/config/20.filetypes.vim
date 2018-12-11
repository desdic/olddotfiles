augroup filetypedetect
    command! -nargs=* -complete=help Help vertical belowright help <args>
    autocmd FileType help wincmd L
    autocmd BufEnter * :syn sync maxlines=200
    autocmd BufNewFile,BufRead *.erb  set filetype=ruby.eruby.chef setfiletype eruby
augroup END

augroup filetype_help
    autocmd!
    autocmd FileType help     setlocal nolist " don't show whitespace in help files
augroup END

augroup filetype_xml
    autocmd!
    autocmd FileType xml     set omnifunc=xmlcomplete#CompleteTags
augroup END

augroup filetype_ruby
    autocmd!
    autocmd FileType ruby set expandtab
    autocmd FileType ruby set shiftwidth=2
    autocmd FileType ruby set softtabstop=2
    autocmd FileType ruby set tabstop=2
    autocmd FileType eruby set expandtab
    autocmd FileType eruby set shiftwidth=2
    autocmd FileType eruby set softtabstop=2
    autocmd FileType eruby set tabstop=2
    autocmd FileType ruby.eruby.chef set expandtab
    autocmd FileType ruby.eruby.chef set shiftwidth=2
    autocmd FileType ruby.eruby.chef set softtabstop=2
    autocmd FileType ruby.eruby.chef set tabstop=2
augroup END

augroup filetype_sql
    autocmd!
    autocmd FileType sql set expandtab
    autocmd FileType sql set shiftwidth=4
    autocmd FileType sql set softtabstop=4
    autocmd FileType sql set tabstop=4
augroup END

augroup filetype_c
    autocmd!
    autocmd FileType c set expandtab
    autocmd FileType c set shiftwidth=4
    autocmd FileType c set softtabstop=4
    autocmd FileType c set tabstop=4
    autocmd FileType cpp set expandtab
    autocmd FileType cpp set shiftwidth=4
    autocmd FileType cpp set softtabstop=4
    autocmd FileType cpp set tabstop=4
augroup END

augroup filetype_asm
    autocmd!
    autocmd FileType asm set expandtab
    autocmd FileType asm set shiftwidth=4
    autocmd FileType asm set softtabstop=4
    autocmd FileType asm set tabstop=4
augroup END

augroup filetype_javascript
    autocmd!
    autocmd FileType javascript set expandtab
    autocmd FileType javascript set shiftwidth=4
    autocmd FileType javascript set softtabstop=4
    autocmd FileType javascript set tabstop=4
augroup END

augroup filetype_text
    autocmd!
    autocmd FileType text set noexpandtab
    autocmd FileType text set tabstop=4
    autocmd FileType text set shiftwidth=4
    autocmd FileType text let b:deoplete_disable_auto_complete = 1
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType html set noexpandtab
    autocmd FileType html set tabstop=4
    autocmd FileType html set shiftwidth=4
    autocmd FileType html let b:deoplete_disable_auto_complete = 1
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
augroup END

augroup filetype_sh
    autocmd!
    autocmd FileType sh set expandtab
    autocmd FileType sh set tabstop=2
    autocmd FileType sh set shiftwidth=2
    autocmd FileType sh set omnifunc=pythoncomplete#Complete
augroup END

augroup filetype_gitcommit
    autocmd!
    autocmd FileType gitcommit set spell
    autocmd FileType gitcommit let b:deoplete_disable_auto_complete = 1
augroup END

augroup filetype_python
    autocmd!
    autocmd FileType python set expandtab
    autocmd FileType python set tabstop=4
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set omnifunc=pythoncomplete#Complete
augroup END

augroup filetype_make
    autocmd!
    autocmd FileType make set noexpandtab
    autocmd FileType make set tabstop=2
    autocmd FileType make set shiftwidth=2
augroup END

augroup filetype_yaml
    autocmd!
    autocmd FileType yaml set expandtab
    autocmd FileType yaml set tabstop=2
    autocmd FileType yaml set shiftwidth=2
augroup END

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown set noexpandtab
    autocmd FileType markdown set tabstop=4
    autocmd FileType markdown set shiftwidth=4
    autocmd FileType markdown let b:deoplete_disable_auto_complete = 1
augroup END

augroup filetype_json
    autocmd!
    autocmd FileType json set conceallevel=0
    autocmd FileType json set ft=json
    autocmd FileType json set expandtab
    autocmd FileType json set tabstop=2
    autocmd FileType json set shiftwidth=2
augroup END

augroup filetype_mail
    autocmd!
    autocmd FileType mail set tw=72 fo+=taw spell
    autocmd FileType mail let b:deoplete_disable_auto_complete = 1
augroup END

augroup filetype_go
    autocmd!
    autocmd FileType go set nolist "Don't want to see those tabs
    autocmd FileType go set noexpandtab
    autocmd FileType go set tabstop=4
    autocmd FileType go set softtabstop=4
    autocmd FileType go set shiftwidth=4

    autocmd FileType set rtp+=~/.vim/plugin/lint.vim
    autocmd FileType go nmap <leader>r <Plug>(go-run-split)
    autocmd FileType go nmap <leader>b <Plug>(go-build)
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd FileType go nmap <leader>c <Plug>(go-coverage)
    autocmd FileType go nmap <leader>l <Plug>(go-metalinter)
    autocmd FileType go nmap <leader>d :GoDef<CR>
    autocmd FileType go nmap <leader>g :GoDecls<CR>
    autocmd FileType go nmap <leader>s :GoFillStruct<CR>
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim set expandtab
    autocmd FileType vim set shiftwidth=4
    autocmd FileType vim set softtabstop=4
    autocmd FileType vim set tabstop=4
    autocmd FileType vim let b:deoplete_disable_auto_complete = 1
augroup END

augroup filetype_toml
    autocmd!
    autocmd FileType toml set expandtab
    autocmd FileType toml set shiftwidth=2
    autocmd FileType toml set softtabstop=2
    autocmd FileType toml set tabstop=2
augroup END

augroup filetype_proto
    autocmd!
    autocmd FileType proto set expandtab
    autocmd FileType proto set shiftwidth=2
    autocmd FileType proto set softtabstop=2
    autocmd FileType proto set tabstop=2
augroup END
" ---}}}


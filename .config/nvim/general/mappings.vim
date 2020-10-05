" Close the preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" mapping
" Ctrl + n change buffer
map <C-n> :bnext<CR>
" Ctrl + p change buffer
map <C-p> :bprevious<CR>
" ,n new buffer
nmap <leader>n :enew<CR>
" ,q quit buffer
nmap <leader>q :bp <BAR> bd #<CR>
" close window
map <Leader>c :close<CR>
map <Leader>w :w!<CR>

map <Leader>f :FZF!<CR>

" redraw buffer
nmap <C-l> :redraw!
nmap <Leader>n :NERDTreeToggle<CR>

" ,s sort
vnoremap <Leader>s :sort<CR>
map <Leader>t :s/\s\+$//
nmap <C-f> :Files<CR>

" Indentation
vnoremap < <gv
vnoremap > >gv

" Quoting in visuel mode
vnoremap <Leader>q" c"<C-R>""<ESC>
vnoremap <Leader>q' c'<C-R>"'<ESC>

" Quoting in non visuel mode
nnoremap <Leader>q" ciw"<C-R>""<ESC>
nnoremap <Leader>q' ciw'<C-R>"'<ESC>
" Delete quote
nnoremap <Leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" Split navigation
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

" Select all
map <Leader>a ggVG

map <Leader>l :redraw!<CR>
"map <Leader>p :set paste<CR> i

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Count selection
map <Leader>g <C-g>

" Move with CTRL+Meta (Alt)
nnoremap <C-m-j> :m .+1<CR>==
nnoremap <C-m-k> :m .-2<CR>==
inoremap <C-m-j> <Esc>:m .+1<CR>==gi
inoremap <C-m-k> <Esc>:m .-2<CR>==gi
vnoremap <C-m-j> :m '>+1<CR>gv=gv
vnoremap <C-m-k> :m '<-2<CR>gv=gv

" nnoremap <A-j> :lnext<CR>
" nnoremap <A-k> :lprevious<CR>

" Resizing
nnoremap <silent> <Leader>+ :exe "resize +5"<CR>
nnoremap <silent> <Leader>- :exe "resize -5"<CR>
nnoremap <silent> <Leader>% :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>& :exe "vertical resize -5"<CR>

command! Vmake silent w | silent make | unsilent redraw! | cwindow

" Run make and if we get errors show them in a 3 line window
command -nargs=* Make make <args> | copen
map <Leader>m :Vmake<CR>

" ctrl arrow delete so remap
map <ESC>[1;5D <C-Left>
map! <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>
map! <ESC>[1;5C <C-Right>

" Alt+arrow left deletes a line so disable it
noremap <ESC>[1;3C <NOP>

set pastetoggle=<Leader>p

imap jj <ESC>


" fuzzy find text in the working directory
nnoremap <leader>/ :Rg<CR>

" Map shift+down = 2B to move lines down (od -a)
nnoremap <ESC>[1;2B :m .+1<CR>==
inoremap <ESC>[1;2B <Esc>:m .+1<CR>==gi
vnoremap <ESC>[1;2B :m '>+1<CR>gv=gv

" Map shift+up = 2A to move lines up (od -a)
nnoremap <ESC>[1;2A :m .-2<CR>==
inoremap <ESC>[1;2A <Esc>:m .-2<CR>==gi
vnoremap <ESC>[1;2A :m '<-2<CR>gv=gv

" if s:has_plugin('coc.nvim')
  " Remap keys for gotos
  nmap <silent> <leader>dr <Plug>(coc-references)
  nmap <silent> <leader>dd <Plug>(coc-implementation)
  nmap <silent> <leader>dy <Plug>(coc-type-definition)
  nmap <silent> <leader>dn <Plug>(coc-rename)
  nmap <silent> <leader>dl <Plug>(coc-codelens-action)
  nmap <silent> <leader>da <Plug>(coc-codeaction)
  nmap <silent> <leader>dv :vsplit<cr> <Plug>(coc-implementation)
  nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
  nmap <silent> <C-j> <Plug>(coc-diagnostic-next)
" endif

" Feature in neovim 0.5 to highlight yanked lines
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=200}
augroup END

" files
augroup filetypedetect
    command! -nargs=* -complete=help Help vertical belowright help <args>
    autocmd FileType help wincmd L
    autocmd BufEnter * :syn sync maxlines=200
    " autocmd BufNewFile,BufRead *.erb  set filetype=ruby.eruby.chef setfiletype eruby
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
    " autocmd BufWritePost *.rb !/opt/chefdk/embedded/bin/rubocop -a <afile>
    " autocmd FocusGained,BufEnter *.rb :checktime
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
    autocmd FileType c setlocal expandtab
    autocmd FileType c setlocal shiftwidth=4
    autocmd FileType c setlocal softtabstop=4
    autocmd FileType c setlocal tabstop=4
    autocmd FileType cpp setlocal expandtab
    autocmd FileType cpp setlocal shiftwidth=4
    autocmd FileType cpp setlocal softtabstop=4
    autocmd FileType cpp setlocal tabstop=4
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
    " autocmd FileType text let b:deoplete_disable_auto_complete = 1
    autocmd FileType text let b:delimitMate_autoclose = 0
augroup END

augroup filetype_html
    autocmd!
    autocmd FileType html set noexpandtab
    autocmd FileType html set tabstop=4
    autocmd FileType html set shiftwidth=4
    " autocmd FileType html let b:deoplete_disable_auto_complete = 1
    autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
augroup END

augroup filetype_sh
    autocmd!
    autocmd FileType sh set expandtab
    autocmd FileType sh set tabstop=2
    autocmd FileType sh set shiftwidth=2
augroup END

augroup filetype_gitcommit
    autocmd!
    autocmd FileType gitcommit set spell
    " autocmd FileType gitcommit let b:deoplete_disable_auto_complete = 1
augroup END

augroup filetype_python
    autocmd!
    autocmd FileType python set expandtab
    autocmd FileType python set tabstop=4
    autocmd FileType python set shiftwidth=4
augroup END

augroup filetype_make
    autocmd!
    autocmd FileType make set noexpandtab
    autocmd FileType make set tabstop=2
    autocmd FileType make set shiftwidth=2
augroup END

augroup filetype_tex
    autocmd!
    autocmd FileType tex set noexpandtab
    autocmd FileType tex set tabstop=2
    autocmd FileType tex set shiftwidth=2
augroup END

augroup filetype_yaml
    autocmd!
    autocmd FileType yaml set expandtab
    autocmd FileType yaml set tabstop=2
    autocmd FileType yaml set shiftwidth=2
    autocmd FileType yaml set softtabstop=2
augroup END

augroup filetype_markdown
    autocmd!
    autocmd FileType markdown set noexpandtab
    autocmd FileType markdown set tabstop=4
    autocmd FileType markdown set shiftwidth=4
    autocmd FileType markdown let b:coc_pairs_disabled = ['`']
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
    autocmd FileType mail let b:delimitMate_autoclose = 0
augroup END

augroup filetype_go
    autocmd!
    autocmd FileType go set nolist "Don't want to see those tabs
    autocmd FileType go set noexpandtab
    autocmd FileType go set tabstop=4
    autocmd FileType go set softtabstop=4
    autocmd FileType go set shiftwidth=4

    autocmd FileType set rtp+=~/.vim/plugin/lint.vim

    autocmd FileType go nmap <silent> <leader>d <Plug>(coc-definition)

    autocmd FileType go nmap <leader>s :GoFillStruct<CR>
    autocmd FileType go nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
    autocmd FileType go vmap <leader>f  <Plug>(coc-format-selected)
    autocmd FileType go nmap <leader>f  <Plug>(coc-format-selected)

    autocmd FileType go nmap   <F5>    :GoCallers<CR>
    autocmd FileType go nmap   <F6>    :GoCallstack<CR>
    autocmd FileType go nmap   <F8>    :TagbarToggle<CR>
    autocmd FileType go nmap   <F9>    :make

    " map keys to fill json/yaml or clear tags
    autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
    autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
    autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

    " Add missing imports on save
    autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
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

augroup filetype_systemd
    au BufNewFile,BufRead */systemd/*.{automount,mount,path,service,socket,swap,target,timer} setfiletype systemd
    " Systemd overrides
    au BufNewFile,BufRead /etc/systemd/system/*.d/*.conf setfiletype systemd
    " Systemd temp files
    au BufNewFile,BufRead /etc/systemd/system/*.d/.#* setfiletype systemd
augroup END

" Don't continue comments for any filetype
au BufEnter * set formatoptions-=cro

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction

" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    endif
endfunction

" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
endif

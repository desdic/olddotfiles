" Disable arrow keys
""no <down> ddp
"no <down> <Nop>
"no <left> <Nop>
"no <right> <Nop>
""no <up> ddkP
"no <up> <Nop>
"ino <down> <Nop>
"ino <left> <Nop>
"ino <right> <Nop>
"ino <up> <Nop>

let mapleader = ","

" mapping ,"
"imap <leader>' ''<ESC>i
"imap <leader>" ""<ESC>i
"imap <leader>( ()<ESC>i
"imap <leader>[ []<ESC>i


" Ctrl + n change buffer
nmap <c-n> :bnext<CR>
" Ctrl + p change buffer
nmap <c-p> :bprevious<CR>
",n new buffer
nmap <leader>n :enew<CR>
" ,q quit buffer
nmap <leader>q :bp <BAR> bd #<CR>

" ,s sort
vnoremap <Leader>s :sort<CR>

" Indentation
vnoremap < <gv
vnoremap > >gv

" Quoting in visuel mode
vnoremap <Leader>" c"<C-R>""<ESC>
vnoremap <Leader>' c'<C-R>"'<ESC>

" Quoting in non visuel mode
nnoremap <Leader>" ciw"<C-R>""<ESC>
nnoremap <Leader>' ciw'<C-R>"'<ESC>

" Split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"nnoremap <M-j> <C-w>-
"nnoremap <M-k> <C-w>+
"nnoremap <M-h> <C-w><
"nnoremap <M-l> <C-w>>

" Select all
map <Leader>a ggVG

" Tab to complete (http://www.vimbits.com)
function! SuperTab()
    if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
        return "\<Tab>"
    else
        return "\<C-n>"
    endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>

" Typeos
iabbr ture true
iabbr flase false

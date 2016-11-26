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

nmap <C-l> :redraw!

nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>f :CtrlP<CR>

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

"Remap arrow keys for moving in compile errors
"nnoremap <silent> <Up> :cprev<CR>
"nnoremap <silent> <Down> :cnext<CR>


" Select all
map <Leader>a ggVG

map <Leader>l :redraw!<CR>
map <Leader>x :set tabstop=4 shiftwidth=4 expandtab
map <Leader>p :set paste<CR> i
map <Leader>C :let @/=""<CR>

" Count selection
map <Leader>g <C-g>
map <Leader>c :close<CR>

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

" Netrw Style Listing. Open ctags/filebrowser
nnoremap <Leader><Leader> :Tlist<CR><C-W>h<C-W>s:e .<CR><C-W>l:let g:netrw_chgwin=winnr()<CR><C-W>h

" Run make and if we get errors show them in a 3 line window
command -nargs=* Make make <args> | copen
map <Leader>m :Make<CR><CR><CR>

" Resizing
nnoremap <silent> <Leader>+ :exe "resize +5"<CR>
nnoremap <silent> <Leader>- :exe "resize -5"<CR>
nnoremap <silent> <Leader>% :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>& :exe "vertical resize -5"<CR>


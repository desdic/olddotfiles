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

" mapping \"
imap <leader>' ''<ESC>i
imap <leader>" ""<ESC>i
imap <leader>( ()<ESC>i
imap <leader>[ []<ESC>i

" Ctrl + n change buffer
nmap <c-n> :bnext<CR>
" Ctrl + p change buffer
nmap <c-p> :bprevious<CR>
"\n new buffer
nmap <leader>n :enew<CR>
" \q quit buffer
nmap <leader>q :bp <BAR> bd #<CR>

" Mappings ---{{{
let mapleader = ","

nmap <c-n> :bnext<CR>             " Ctrl + n change buffer
nmap <c-p> :bprevious<CR>         " Ctrl + p change buffer
nmap <leader>n :enew<CR>          " ,n new buffer
nmap <leader>q :bp <BAR> bd #<CR> " ,q quit buffer
map <Leader>c :close<CR>          " close window
map <Leader>w :w!<CR>
nmap <C-l> :redraw!               " redraw buffer
nmap <Leader>n :NERDTreeToggle<CR>
vnoremap <Leader>s :sort<CR>      " ,s sort
map <Leader>t :s/\s\+$//

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

" Select all
map <Leader>a ggVG

map <Leader>l :redraw!<CR>
"map <Leader>p :set paste<CR> i

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Count selection
map <Leader>g <C-g>

" Move
"nnoremap <C-j> :m .+1<CR>==
"nnoremap <C-k> :m .-2<CR>==
"inoremap <C-j> <Esc>:m .+1<CR>==gi
"inoremap <C-k> <Esc>:m .-2<CR>==gi
"vnoremap <C-j> :m '>+1<CR>gv=gv
"vnoremap <C-k> :m '<-2<CR>gv=gv

nnoremap <A-j> :lnext<CR>
nnoremap <A-k> :lprevious<CR>

" Resizing
nnoremap <silent> <Leader>+ :exe "resize +5"<CR>
nnoremap <silent> <Leader>- :exe "resize -5"<CR>
nnoremap <silent> <Leader>% :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>& :exe "vertical resize -5"<CR>

" Run make and if we get errors show them in a 3 line window
command -nargs=* Make make <args> | copen
"map <Leader>m :Make<CR><CR><CR>
map <Leader>m :Make<CR>

" ctrl arrow delete so remap
map <ESC>[1;5D <C-Left>
map! <ESC>[1;5D <C-Left>
map <ESC>[1;5C <C-Right>
map! <ESC>[1;5C <C-Right>

" Alt+arrow left deletes a line so disable it
noremap <ESC>[1;3C <NOP>

set pastetoggle=<Leader>p

imap jj <ESC>

" Jump between errors found by ale linters
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" https://github.com/simonsmith/dotfiles/blob/master/dots/vimrc
let g:plugin_path = '~/.config/nvim/plugged'

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(g:plugin_path)
    " Airline for tab like menu but for buffers
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'junegunn/fzf.vim'

    " Color theme
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'tomasiser/vim-code-dark'

    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'ctrlpvim/ctrlp.vim'

    " Nerdtree + icons
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'ryanoasis/vim-devicons'

    " Comments
    Plug 'scrooloose/nerdcommenter'

    " Autocompletion
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " :CocInstall coc-tsserver coc-yaml coc-python coc-pairs coc-highlight
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'

    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
call plug#end()

" Shortcut for checking if a plugin is loaded
function! s:has_plugin(plugin)
  let lookup = 'g:plugs["' . a:plugin . '"]'
  return exists(lookup)
endfunction

" Turn off spash
set shortmess=I

" Set height of commands to prevent 'press enter to contiue'
set cmdheight=1

" Enable 24 colors
set termguicolors

" Use Dracula theme
syntax on
set background=dark
"color dracula
colorscheme codedark
let g:airline_theme = 'codedark'

" Use systems clipboard
" set clipboard+=unnamedplus

set tabstop=2
set shiftwidth=2
" Use spaces and not tabs
set expandtab
set ai
set number

" Always keep 5 lines visibile
set scrolloff=5

" maximum number of items to show in the popup menu
set pumheight=10

" Makes search act like search in modern browsers
set incsearch
set ruler

" No search highlight
set nohlsearch

" Don't use swap or backup
set nobackup
set nowritebackup
set noswapfile

" Set leader to ,
let mapleader=','

" Make it obvious where 80 characters is
set textwidth=80

" Set relative numbers
set number relativenumber

" Lazyredraw attempts to solve Vim lag by reducing the amount of
" processing required. When enabled, any action that is not typed
" will not cause the screen to redraw
set lazyredraw

" Highlight current line
" set cursorline

" Briefly move the cursor to the matching brace
set showmatch
" Stop vim trying to syntax highlight long lines, typically found in minified
" files. This greatly reduces lag yet is still wide enough for large displays
set synmaxcol=500

" Don't wrap lines
set nowrap

" For autocompletion, complete as much as you can.
"set wildmode=list:longest,full

if has("persistent_undo")
  set undodir=~/.config/nvim/undo
  set undofile
  set undolevels=1000
  set undoreload=1000
  " Disable undo since it triggers automount
  autocmd BufWritePre /mnt/* setlocal noundofile
  autocmd BufWritePre /boot/* setlocal noundofile

  autocmd BufWritePre /mnt/* setlocal shada="NONE"
  autocmd BufWritePre /boo/* setlocal shada="NONE"
endif

" Disable shada
set shada="NONE"

" Always show sign column for git icons
set signcolumn=yes

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" Disable error bells
set noerrorbells

" take indent for new line from previous line
set autoindent
" enable smart indentation
set smartindent

filetype plugin indent on
syntax sync minlines=128

" Prevent autocomplete options opening in scratchpad
set completeopt=longest,menuone
"set completeopt-=preview

" Allow to switch buffer without saving
set hidden

" Show the (partial) command as it’s being typed
set showcmd

"       _        _       
"   ___| |_ _ __| |_ __  
"  / __| __| '__| | '_ \ 
" | (__| |_| |  | | |_) |
"  \___|\__|_|  |_| .__/ 
"                 |_|    
"  Disable ctrlp since its only used in vim-go
let g:ctrlp_map = ''

"  _   _              _ _                 
" | \ | | ___ _ __ __| | |_ _ __ ___  ___ 
" |  \| |/ _ \ '__/ _` | __| '__/ _ \/ _ \
" | |\  |  __/ | | (_| | |_| | |  __/  __/
" |_| \_|\___|_|  \__,_|\__|_|  \___|\___

let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=0
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
"let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0

" airline
if s:has_plugin('vim-airline')
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " Only show tabs if we have more than one file open
    let g:airline#extensions#tabline#buffer_min_count = 1
    let g:airline_skip_empty_sections = 1
    let g:airline#extensions#tabline#fnamemod = ':t'

    " Enable buffer tabs
    let g:airline#extensions#tabline#enabled =  1
    let g:airline_powerline_fonts = 1

    " Turn off arrows
    " let g:airline_powerline_fonts = 0
    " let g:airline_left_sep = ''
    " let g:airline_right_sep = ''
endif

" coc
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" vim-go
let g:go_metalinter_autosave = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode = "gopls"
let g:go_info_mode= "gopls"

" Show the progress when running :GoCoverage
let g:go_echo_command_info = 1  
" Add the failing test name to the output of :GoTest
let g:go_test_show_name = 1     

let g:go_gocode_autobuild = 1
let g:go_gocode_unimported_packages = 1

"Enabled for go 1.11
"let g:go_autodetect_gopath = 0  " This does not seem to work so I have disabled it and set it on every project

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1
let g:go_auto_sameids = 0
let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_modifytags_transform = 'camelcase'
let g:go_addtags_transform = 'camelcase'
let g:go_jump_to_error = 0
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_null_module_warning = 0

" Turn off folding for markdown
let g:vim_markdown_folding_disabled = 1

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

if s:has_plugin('coc.nvim')
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
endif

if s:has_plugin('neosnippet.vim')
    " Plugin key-mappings.
    " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-k>     <Plug>(neosnippet_expand_target)

    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

    let g:neosnippet#snippets_directory='~/.config/nvim/snippets'
    let g:neosnippet#enable_snipmate_compatibility = 1
endif

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
    autocmd FileType text let b:deoplete_disable_auto_complete = 1
    autocmd FileType text let b:delimitMate_autoclose = 0
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
    autocmd FileType go nmap <leader>r <Plug>(go-run-split)
    autocmd FileType go nmap <leader>b <Plug>(go-build)
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd FileType go nmap <leader>c <Plug>(go-coverage)
    autocmd FileType go nmap <leader>l <Plug>(go-metalinter)
""    autocmd FileType go nmap <leader>d :GoDef<CR>
    autocmd FileType go nmap <leader>g :GoDecls<CR>

    autocmd FileType go nmap <silent> <leader>d <Plug>(coc-definition)

    autocmd FileType go nmap <leader>s :GoFillStruct<CR>
    "autocmd FileType go nmap <leader>e <Plug>(go-rename)
    autocmd FileType go nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
    autocmd FileType go vmap <leader>f  <Plug>(coc-format-selected)
    autocmd FileType go nmap <leader>f  <Plug>(coc-format-selected)

    "autocmd FileType go nmap   <F4>    :GoDef<CR>
    autocmd FileType go nmap   <F5>    :GoCallers<CR>
    autocmd FileType go nmap   <F6>    :GoCallstack<CR>
    autocmd FileType go nmap   <F8>    :TagbarToggle<CR>
    autocmd FileType go nmap   <F9>    :make

    autocmd FileType go nmap     <leader>dd    <Plug>(go-def)
    autocmd FileType go nmap     <leader>ds    <Plug>(go-def-split)
    autocmd FileType go nmap     <leader>dv    <Plug>(go-def-vertical)
    autocmd FileType go nmap     <leader>dt    <Plug>(go-def-tab)
    autocmd FileType go nmap     <leader>kk    <Plug>(go-doc)
    autocmd FileType go nmap     <leader>kv    <Plug>(go-doc-vertical)
    autocmd FileType go nmap     <leader>kb    <Plug>(go-doc-browser)
    autocmd FileType go nmap     <leader>im    <Plug>(go-implements)
    autocmd FileType go nmap     <leader>in    <Plug>(go-info)
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

"  Plugin key-mappings.
"" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


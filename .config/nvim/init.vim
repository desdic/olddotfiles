set shell=bash

" NeoBundle --- {{{
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif
" ---}}}

" Plugins --- {{{"
call neobundle#begin(expand('$HOME/.config/nvim/bundle'))
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/deoplete.nvim'
NeoBundle 'zchee/deoplete-go', {'build': {'unix': 'make'}}
NeoBundle 'honza/vim-snippets'
NeoBundle 'neomake/neomake.git'
NeoBundle 'editorconfig/editorconfig-vim.git'
NeoBundle 'frankier/neovim-colors-solarized-truecolor-only.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'vim-airline/vim-airline.git'
NeoBundle 'vim-airline/vim-airline-themes.git'
NeoBundle 'tpope/vim-git.git'
NeoBundle 'tpope/vim-fugitive.git'
NeoBundle 'tpope/vim-dispatch.git'
NeoBundle 'AndrewRadev/splitjoin.vim'
NeoBundle 'fatih/vim-go.git'
NeoBundle 'vim-syntastic/syntastic.git'
NeoBundle 'bronson/vim-trailing-whitespace.git'
NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight.git'
NeoBundle 'Raimondi/delimitMate.git'
NeoBundle 'vim-scripts/grep.vim'
NeoBundle 'ryanoasis/vim-devicons.git'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'nsf/gocode', {'rtp': 'vim/'}
NeoBundle 'ctrlpvim/ctrlp.vim'
call neobundle#end()
NeoBundleCheck
" --- }}

silent! call pathogen#infect()


" Settings ---{{{
set omnifunc=syntaxcomplete#Complete
set nocursorcolumn
" do not highlight line
set nocursorline
set norelativenumber
" Enable true colors
set encoding=utf-8
"set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
"set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline\ Nerd\ Font\ Complete:h12
set t_Co=256
set vb
set ruler
" Show commands that I type
set showcmd
set showmatch
set backspace=2
set list
set listchars=tab:→·,trail:·
set modeline
set modelines=5
set cursorline
set autowrite
set showmode
set noshowmode
set noerrorbells
set novisualbell
" Speed up when using syntax highlight
set synmaxcol=200
syntax sync minlines=256
set scrolljump=5
set lazyredraw
set hidden
set number
set hlsearch
set incsearch
set spelllang=en
"set completeopt=longest,menuone
set completeopt=menu,menuone

" Path to python interpreter for neovim
let g:python3_host_prog  = '/usr/bin/python3'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

set mouse=c
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" Crosshair plugin
"set cursorline    " enable the horizontal line
"set cursorcolumn  " enable the vertical line
" Enable status line always
set laststatus=2
set tabstop=4 shiftwidth=4 expandtab
" Disable welcome
set shortmess+=I
syntax enable
filetype plugin indent on
syntax sync minlines=128

" Theme --- {{{
set termguicolors
set background=dark
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Solarized
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_termtrans = 0
colorscheme solarized
let g:airline_theme='solarized'

" Addon to highlighting of folding
"hi Folded          ctermfg=14   ctermbg=0

" Highlight lines over 80 chars
highlight ColorColumn ctermfg=green
call matchadd('ColorColumn', '\%81v', 100)

"autocmd BufWinLeave * call clearmatches()
" ---}}}

" Syntastic --- {{{
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_open = 1
let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

let g:syntastic_style_error_symbol = ''
let g:syntastic_style_warning_symbol = ''
highlight SyntasticStyleErrorSign guifg=#ff0000 guibg=#073642
highlight SyntasticStyleWarningSign  guifg=#fffc56 guibg=#073642

" Use Neomake insted (Not)
let b:syntastic_skip_checks = 0
" --- }}}

" Airline {{{
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Only show tabs if we have more than one file open
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#neomake#error_symbol=''
let g:airline#extensions#neomake#warning_symbol=''

" Enable buffer tabs
let g:airline#extensions#tabline#enabled =  1
"
" Show hex value of char
let g:airline_section_y = airline#section#create_right(['ffenc', 'Hex:0x%02B'])
"let g:airline_section_c = airline#section#create_right(['file','BN: %{bufnr("%")}'])

let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" ---}}}

" Neosnippet --- {{{
"let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" ---}}}

" ctrlp ---{{{
let g:ctrlp_map = '<c-m>'
let g:ctrlp_cmd = 'CtrlP'
" ---}}}

" Deoplete ---{{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 0 " set to 1 if you want to disable autocomplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go'

function! s:tab_complete()
  " is completion menu open? cycle to next item
  if pumvisible()
    return "\<c-n>"
  endif

  " is there a snippet that can be expanded?
  " is there a placholder inside the snippet that can be jumped to?
  if neosnippet#expandable_or_jumpable() 
    return "\<Plug>(neosnippet_expand_or_jump)"
  endif

  " if none of these match just use regular tab
  return "\<tab>"
endfunction

imap <silent><expr><TAB> <SID>tab_complete()

" ---}}}

" Neomake ---{{{
highlight NeomakeErrorSign guifg=#ff0000 guibg=#073642
highlight NeomakeWarnSign  guifg=#fffc56 guibg=#073642
highlight NeomakeInfoSign  guifg=#4264ff guibg=#073642
let g:neomake_error_sign={'text': '', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign={'text': '', 'texthl': 'NeomakeWarnSign'}
let g:neomake_info_sign={'text': '', 'texthl': 'NeomakeInfoSign'}

let g:neomake_open_list = 0 " 2
let g:neomake_list_height = 5

" Only add neomake to known files
autocmd! BufWritePost,BufRead *.c Neomake
autocmd! BufWritePost,BufRead *.cpp Neomake
autocmd! BufWritePost,BufRead *.asm Neomake
autocmd! BufWritePost,BufRead *.go Neomake
autocmd! BufWritePost,BufRead *.py Neomake
autocmd! BufWritePost,BufRead *.yaml Neomake
autocmd! BufWritePost,BufRead *.json Neomake
autocmd! BufWritePost,BufRead *.sh Neomake
autocmd! BufWritePost,BufRead *.yml Neomake
autocmd! BufWritePost,BufRead *.rb Neomake
" ---}}}

" Devicons ---{{{
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsOS = 'Linux'
" ---}}}

" Nerdtree ---{{{
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=0
let g:NERDTreeWinSize=45
let g:NERDTreeAutoDeleteBuffer=1
"let NERDTreeMinimalUI=1
let NERDTreeCascadeSingleChildDir=0
" ---}}}

"delimate ---{{{
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
" ---}}}


" Mappings ---{{{
let mapleader = ","

" Ctrl + n change buffer
nmap <c-n> :bnext<CR>
" Ctrl + p change buffer
nmap <c-p> :bprevious<CR>
",n new buffer
nmap <leader>n :enew<CR>
" ,q quit buffer
nmap <leader>q :bp <BAR> bd #<CR>

" close window
map <Leader>c :close<CR>
" Save
map <Leader>w :w!<CR>

" redraw buffer
nmap <C-l> :redraw!
nmap <Leader>t :NERDTreeToggle<CR>
" ,s sort
vnoremap <Leader>s :sort<CR>

command W w

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
map <Leader>x :set tabstop=4 shiftwidth=4 expandtab
map <Leader>p :set paste<CR> i
" Remove highlight after search
"map <Leader>C :let @/=""<CR>

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

"  Toogle spell language
"  (http://vim.wikia.com/wiki/Toggle_spellcheck_with_function_keys)
let b:myLang=0
let g:myLangList=["nospell","en_us","da"]
function! ToggleSpell()
  let b:myLang=b:myLang+1
  if b:myLang>=len(g:myLangList) | let b:myLang=0 | endif
  if b:myLang==0
    setlocal nospell
  else
    execute "setlocal spell spelllang=".get(g:myLangList, b:myLang)
  endif
  echo "spell checking language:" g:myLangList[b:myLang]
endfunction
map <Leader>s :call ToggleSpell()<CR>
" ---}}}

" vim-go ---{{{
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_auto_type_info = 0
let g:go_def_mode = "guru"
let g:go_echo_command_info = 1
let g:go_gocode_autobuild = 0
let g:go_gocode_unimported_packages = 1

let g:go_autodetect_gopath = 1
let g:go_info_mode = "guru"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 0
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_structs = 1

let g:go_highlight_space_tab_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_trailing_whitespace_error = 1

let g:go_modifytags_transform = 'camelcase'
"---}}}

" Typeos
iabbr ture true
iabbr flase false

" Run make and if we get errors show them in a 3 line window
command -nargs=* Make make <args> | copen
map <Leader>m :Make<CR><CR><CR>

" Resizing
nnoremap <silent> <Leader>+ :exe "resize +5"<CR>
nnoremap <silent> <Leader>- :exe "resize -5"<CR>
nnoremap <silent> <Leader>% :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>& :exe "vertical resize -5"<CR>

" Files ---{{{
" Vim
autocmd FileType vim let b:deoplete_disable_auto_complete = 1

" Mail
autocmd FileType mail set tw=72 fo+=taw spell
autocmd FileType mail let b:deoplete_disable_auto_complete = 1

" GO
autocmd FileType go set nolist
autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType go setlocal tabstop=4 shiftwidth=4 expandtab

set rtp+=~/.vim/plugin/lint.vim
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>l <Plug>(go-metalinter)
nmap <leader>d :GoDef<CR>
nmap <leader>g :GoDecls<CR>

autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" C/C++
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType asm setlocal tabstop=4 shiftwidth=4 expandtab

" json
autocmd BufNewFile,BufRead *.json set conceallevel=0
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
autocmd FileType markdown let b:deoplete_disable_auto_complete = 1

" don't show whitespace in help files
autocmd FileType help set nolist

autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

autocmd FileType text setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType text let b:deoplete_disable_auto_complete = 1
autocmd FileType ruby setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType ruby,eruby set filetype=ruby.eruby.chef

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
autocmd FileType gitcommit let b:deoplete_disable_auto_complete = 1

autocmd BufEnter * :syn sync maxlines=200
" ---}}}


" go language
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
                           \ 'v:variable;f:function'
" Netrw Style Listing
let g:netrw_liststyle = 3

"autocmd VimEnter * :call AfterOpen()

" auto save and restore foldings
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview




call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'Raimondi/delimitMate'
    Plug 'fatih/vim-go', { 'tag': '*', 'do': ':GoInstallBinaries' }
    Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'neomake/neomake'
    Plug 'ctrlpvim/ctrlp.vim'

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/vim-hug-neovim-rpc'
        Plug 'roxma/nvim-yarp'
    endif
    Plug 'Shougo/denite.nvim'
    Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'honza/vim-snippets'
    Plug 'fenetikm/falcon'
call plug#end()

" Settings --- {{{
"set omnifunc=syntaxcomplete#Complete
set nocursorcolumn
set nocursorline "do not highlight line
"set norelativenumber
set encoding=utf-8
set t_Co=256
set vb
set ruler
set showcmd "Show commands that I type
set showmatch
set backspace=2

" Display whitespaces
set list
set listchars=tab:→·,trail:·

set modeline
set modelines=5
"set cursorline
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
set completeopt=menu,menuone
"set nowrap

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
set shortmess+=I "Disable welcome
syntax enable
filetype plugin indent on
syntax sync minlines=128
" --- }}}

" Theme --- {{{

" color
syntax enable
set t_Co=256
set background=dark

" Enable 24bit colors in falcon
"set termguicolors
colorscheme falcon
let g:falcon_airline = 1
let g:airline_theme = 'falcon'

" For some reason only the comment colors are wrong when using tmux
if exists('$TMUX')
    hi Comment guifg=#89898c ctermfg=black guibg=NONE ctermbg=245 gui=italic cterm=italic
endif
" Make it easier to see the match
hi MatchParen ctermbg=blue guibg=lightblue

"" Airline {{{
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"
" Only show tabs if we have more than one file open
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#neomake#error_symbol=''
let g:airline#extensions#neomake#warning_symbol=''
"
" Enable buffer tabs
let g:airline#extensions#tabline#enabled =  1
"
" Show hex value of char
"let g:airline_section_y = airline#section#create_right(['ffenc', 'Hex:0x%02B'])
"let g:airline_section_c = airline#section#create_right(['file','BN: %{bufnr("%")}'])

let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
" ---}}}

" ctrlp ---{{{
let g:ctrlp_map = '<c-m>'
let g:ctrlp_cmd = 'CtrlP'
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
"---}}}

" Neomake ---{{{
highlight NeomakeErrorSign ctermfg=red guifg=#ff0000
highlight NeomakeWarnSign  ctermfg=yellow guifg=#fffc56
highlight NeomakeInfoSign  ctermfg=blue guifg=#4264ff
let g:neomake_error_sign={'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign={'text': '⚠', 'texthl': 'NeomakeWarnSign'}
let g:neomake_info_sign={'text': 'i', 'texthl': 'NeomakeInfoSign'}

" Do not open any pane with errors
let g:neomake_open_list = 0
let g:neomake_list_height = 5
let g:neomake_python_enabled_makers = ['flake8']
" ---}}}

source ~/.config/nvim/mapping.vim

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
let g:go_addtags_transform = 'camelcase'

let g:go_jump_to_error = 1
"let g:go_bin_path = "~/go/bin/"
"---}}}

" Deoplete ---{{{
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#disable_auto_complete = 0 " set to 1 if you want to disable autocomplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode'
"let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory = '~/.cache/deoplete/go'

function! s:tab_complete()
  " is completion menu open? cycle to next item
  if pumvisible()
    return "\<c-n>"
  endif

  " if none of these match just use regular tab
  return "\<tab>"
endfunction

imap <silent><expr><TAB> <SID>tab_complete()
" ---}}}

" Neosnippet --- {{{
"let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
"map <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" ---}}}

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

"call neomake#configure#automake({
"  \ 'TextChanged': {},
"  \ 'InsertLeave': {},
"  \ 'BufWritePost': {'delay': 500},
"  \ 'BufWinEnter': {},
"  \ }, 500)

source ~/.config/nvim/filetypes.vim

" go language
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;v:variable;f:function'
" Netrw Style Listing
let g:netrw_liststyle = 3



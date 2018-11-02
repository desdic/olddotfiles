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
set nocompatible

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
"
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

" Do not hide symbols in markdown or json
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" ---}}}

" go language
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;v:variable;f:function'
" Netrw Style Listing
let g:netrw_liststyle = 3

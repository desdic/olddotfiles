" Settings --- {{{
"set omnifunc=syntaxcomplete#Complete
set nocursorcolumn
set nocursorline "do not highlight line
set encoding=utf-8
set t_Co=256
set vb
set ruler
set showcmd                         "Show commands that I type
set showmatch                       " Show matching brackets when text indicator is over them
set backspace=2
set nocompatible

" Display whitespaces
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
set number relativenumber
set hlsearch                        " Highlight search results"
set incsearch                       " Makes search act like search in modern browsers
set spelllang=en
"set completeopt=menu,menuone
set completeopt=longest,menuone " auto complete setting"
set completeopt+=noinsert
set completeopt+=noselect
set nowrap

set title                           " let vim set the terminal title
if has('mouse')
    set mouse=c
endif
set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" Crosshair plugin
"set cursorcolumn  " enable the vertical line
" Enable status line always
set laststatus=2

set autoindent                      " take indent for new line from previous line
set smartindent                     " enable smart indentation
set softtabstop=2
set tabstop=2
set expandtab                       " expands tabs to spaces"
set shortmess+=I                    " Disable welcome
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

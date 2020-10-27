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
" colorscheme codedark
colorscheme Tomorrow-Night
let g:airline_theme = 'codedark'

" Disable Background Color Erase (BCE) so that color schemes
" render properly when inside 256-color tmux and GNU screen.
if &term =~ '256color'
    set t_ut=
endif

" Use systems clipboard
" set clipboard+=unnamedplus

set tabstop=2
set shiftwidth=2
" Use spaces and not tabs
set expandtab
set ai
set number

" Always keep 10 lines visibile
set scrolloff=10

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

" Don't add newlines after 80 chars
set textwidth=0

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
  set undolevels=100
  set undoreload=100
  " Disable undo in automount mountpoints since it triggers automount
  " When writing files and if mount is not available it hangs
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

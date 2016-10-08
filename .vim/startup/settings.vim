set encoding=utf-8
set vb
set ruler
set showmatch
set backspace=2
set list
set listchars=tab:→·,trail:·
set modeline
set modelines=5
set cursorline
set nocompatible
set autowrite
set showmode
set noshowmode
set noerrorbells
set novisualbell
set synmaxcol=200
set scrolljump=5
set lazyredraw
set hidden
set number
" Really nice mouse marking but removed cut'n'paste from the prompt
"set mouse=a

" Crosshair plugin
"set cursorline    " enable the horizontal line
"set cursorcolumn  " enable the vertical line

" Enable status line always
set laststatus=2

set tabstop=4 shiftwidth=4 expandtab

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "▸"
let g:syntastic_warning_symbol = "▸"
let g:syntastic_style_error_symbol = "▹"
let g:syntastic_style_warning_symbol = "▹"

let g:syntastic_enable_perl_checker = 1
let g:syntastic_enable_go_checker = 1
let g:syntastic_enable_json_checker = 1
let g:syntastic_enable_yaml_checker = 1
let g:syntastic_enable_eruby_checker = 1
let g:syntastic_enable_markdown_checker = 1
let g:syntastic_enable_sh_checker = 1

let g:syntastic_python_checkers = ['python', 'pylint']
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_go_checkers = ['golint']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_sh_checkers = ['shellcheck']

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Only show tabs if we have more than one file open
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" Enable buffer tabs
let g:airline#extensions#tabline#enabled =  1

" Show hex value of char
let g:airline_section_y = 'hex:0x%B'

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let NERDTreeShowHidden=1

set completeopt=longest,menuone

highlight SpecialKey ctermfg=19
highlight CursorLine cterm=NONE ctermbg=17
highlight StatusLine ctermfg=18 ctermbg=106
highlight ExtraWhitespace ctermbg=red
highlight LineNr ctermfg=darkgrey

match ExtraWhitespace /\s\+$/

autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd VimEnter * :call AfterOpen()
autocmd BufEnter * :syn sync maxlines=200


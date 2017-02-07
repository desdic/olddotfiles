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
set hlsearch
set incsearch

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
let g:syntastic_enable_asm_checker = 1

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_perl_checkers = ['perl']
let g:syntastic_go_checkers = ['golint']
let g:syntastic_yaml_checkers = ['yamllint']
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_asm_checkers = ['nasm']

let g:syntastic_cpp_config_file = '.include_file_for_syntastic'
let g:syntastic_cpp_check_header = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Only show tabs if we have more than one file open
let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" Enable buffer tabs
let g:airline#extensions#tabline#enabled =  1
"
" Show hex value of char
let g:airline_section_b = 'BN: %{bufnr("%")}'
let g:airline_section_y = 'Hex:0x%02B'

let g:airline_powerline_fonts = 1
let g:airline_symbols.space = "\ua0"

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Settings for vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_bin_path = expand("~/GOPATH/bin")

set completeopt=longest,menuone

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

let s:dict_dir = $HOME . '/.vim/dicts'


" Define dictionary.
"    \ 'python'  : s:dict_dir . '/python.dict',
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'ruby'    : s:dict_dir . '/ruby.dict',
    \ 'c'       : s:dict_dir . '/c.dict',
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#data_directory = $HOME.'/.vim/cache'

" Enable omni completion.
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete


" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#keyword_patterns['default'] = '\h\w*'
"let g:neocomplete#sources#omni#input_patterns.python = '\h\w*\|[^. \t]\.\w*'

if !exists('g:neocomplete#sources')
    let g:neocomplete#sources = {}
endif
let g:neocomplete#sources._ = ['buffer']
let g:neocomplete#sources.cpp = ['buffer', 'dictionary']
let g:neocomplete#sources.c = ['buffer', 'dictionary']
let g:neocomplete#sources.python = ['buffer', 'dictionary']

" go language
let s:tlist_def_go_settings = 'go;g:enum;s:struct;u:union;t:type;' .
                           \ 'v:variable;f:function'
" Netrw Style Listing
let g:netrw_liststyle = 3

let NERDTreeShowHidden=1

highlight SpecialKey ctermfg=19
highlight CursorLine cterm=NONE ctermbg=17
highlight StatusLine ctermfg=18 ctermbg=106
highlight ExtraWhitespace ctermbg=red
highlight LineNr ctermfg=darkgrey

" Highlight lines over 80 chars
highlight ColorColumn ctermfg=green
call matchadd('ColorColumn', '\%81v', 100)

match ExtraWhitespace /\s\+$/

autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd VimEnter * :call AfterOpen()
autocmd BufEnter * :syn sync maxlines=200

" CtrlP settings
let g:ctrlp_working_path_mode = 'cra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|svn)$'
let g:ctrlp_user_command = 'find %s -type f'
let g:ctrlp_map = '<Leader>f'

" auto save and restore foldings
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview


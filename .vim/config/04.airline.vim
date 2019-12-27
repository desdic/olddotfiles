" Airline {{{
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"
" Only show tabs if we have more than one file open
let g:airline#extensions#tabline#buffer_min_count = 1
"let g:airline#extensions#tabline#left_sep = ''
"let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#neomake#error_symbol=''
"let g:airline#extensions#neomake#warning_symbol=''
"
" Enable buffer tabs
let g:airline#extensions#tabline#enabled =  1
"
" Show hex value of char
"let g:airline_section_y = airline#section#create_right(['ffenc', 'Hex:0x%02B'])
"let g:airline_section_c = airline#section#create_right(['file','BN: %{bufnr("%")}'])

let g:airline_powerline_fonts = 1
"let g:airline_symbols.space = "\ua0"

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_sep = '◀'
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = 'Ξ'

if &term=~'rxvt-unicode-256color'
    let g:airline_symbols.linenr = '¶'
endif
"
" ---}}}

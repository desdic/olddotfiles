" airline
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
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let g:airline_theme = 'codedark'

" We don't need to see things like -- INSERT -- anymore
set noshowmode

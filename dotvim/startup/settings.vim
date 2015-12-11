set t_Co=256
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

" Enable status line always
set laststatus=2

function! Mode()
    redraw
    let l:mode = mode()
    if     mode ==# 'n'         | exec 'hi User4 ctermbg=108 ctermfg=254' | return 'NORMAL'
    elseif mode ==# 'i'         | exec 'hi User4 ctermbg=9   ctermfg=254' | return 'INSERT'
    elseif mode ==# 'R'         | exec 'hi User4 ctermbg=9   ctermfg=254' | return 'REPLACE'
    elseif mode ==# 'v'         | exec 'hi User4 ctermbg=13  ctermfg=254' | return 'VISUAL'
    elseif mode ==# 'V'         | exec 'hi User4 ctermbg=108 ctermfg=254' | return 'V-LINE'
    elseif mode ==# ''        | exec 'hi User4 ctermbg=108 ctermfg=254' | return 'V-BLOCK'
    elseif mode ==# ''        | exec 'hi User4 ctermbg=108 ctermfg=254' | return 'S-BLOCK'
    elseif mode ==# 'S'         | exec 'hi User4 ctermbg=108 ctermfg=254' | return 'S-LINE'
    elseif mode ==# 's'         | exec 'hi User4 ctermbg=108 ctermfg=254' | return 'SELECT'
    else                        | return l:mode
    endif
endfunc

set statusline=
set statusline+=%4*%8{Mode()}\                              " Show mode
set statusline+=%1*\ %.60F                                  " filename
set statusline+=\ \[%n/%{bufnr('$')}]\                      " buffer number / number of buffers
set statusline+=\ %h
set statusline+=%m                                          " Modified
set statusline+=%r                                          " Readonly
set statusline+=%y                                          " Filetype
set statusline+=%w
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},%{&ff}]      " file type
set statusline+=%=                                          " right align remainder
set statusline+=\ %=row:(%l,%c)/%L\ (%p%%)\                 " line, character
set statusline+=hex:0x%B                                    " character value
set statusline+=\ %<%P                                      " file position

set tabstop=4 shiftwidth=4 expandtab

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = "▸"
let g:syntastic_warning_symbol = "▸"
let g:syntastic_style_error_symbol = "▹"
let g:syntastic_style_warning_symbol = "▹"
let g:syntastic_enable_perl_checker = 1
let g:syntastic_python_pylint_exec = '/usr/local/bin/pylint'
let g:syntastic_python_checkers = ['python', 'pylint']
let g:syntastic_perl_checkers = ['perl']

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'Þ'

highlight SpecialKey ctermfg=19
highlight CursorLine cterm=NONE ctermbg=17
highlight StatusLine ctermfg=18 ctermbg=106
highlight ExtraWhitespace ctermbg=red

match ExtraWhitespace /\s\+$/

autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

autocmd VimEnter * :call AfterOpen()



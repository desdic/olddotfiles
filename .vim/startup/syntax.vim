syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set nocursorcolumn
set norelativenumber
syntax sync minlines=128

if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
endif

"syntax enable
"set background=light
"let g:solarized_termcolors=256
"colorscheme solarized


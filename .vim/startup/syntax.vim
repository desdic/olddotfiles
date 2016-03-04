syntax on
filetype plugin indent on
set nocursorcolumn
set norelativenumber
syntax sync minlines=128

if !has("gui_running")
    let g:solarized_termtrans=1
    let g:solarized_termcolors=256
    let g:solarized_visibility = "high"
    let g:solarized_contrast = "high"
endif

colorscheme solarized
set background=dark


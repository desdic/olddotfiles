" Theme --- {{{
" color
syntax enable
set t_Co=256

" Only set termguicolors if its not rxvt
if ! &term=~'urxvt-unicode-256color'
    set termguicolors
endif

" Correct RGB escape codes for vim inside tmux
if !has('nvim') && $TERM ==# 'screen-256color'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


try
    set background=dark
    let g:gruvbox_italic=1
    if exists('$TMUX')
        " urxvt-unicode+tmux italic problems
        let g:gruvbox_italic=0
    endif
    let g:gruvbox_contrast_dark='hard'
    colorscheme gruvbox
    let g:airline_theme = 'gruvbox'
catch
endtry

" Spelling mistakes should only be underlined and not red
hi SpellBad term=NONE cterm=underline ctermbg=NONE gui=NONE guisp=NONE
 

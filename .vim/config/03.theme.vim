" Theme --- {{{
" color
syntax enable
set t_Co=256

set t_8f=[38;2;%lu;%lu;%lum
set t_8b=[48;2;%lu;%lu;%lum

" Only set termguicolors if its not rxvt
if ! &term=~'urxvt-unicode-256color'
    set termguicolors
endif

try
    "colorscheme falcon
    set background=dark
    let g:gruvbox_italic=1
    let g:gruvbox_contrast_dark='hard'
    colorscheme gruvbox
    let g:airline_theme = 'gruvbox'
catch
endtry

" For some reason only the comment colors are wrong when using tmux (falcon
" theme)
"if exists('$TMUX')
"    "hi Comment guifg=#89898c ctermfg=16 guibg=NONE ctermbg=245 gui=italic cterm=italic
"    hi Comment guifg=#89898c ctermfg=235 guibg=NONE ctermbg=243 gui=italic cterm=italic
"endif
" Make it easier to see the match
"hi MatchParen ctermbg=blue guibg=lightblue

" Spelling mistakes should only be underlined and not red
hi SpellBad term=NONE cterm=underline ctermbg=NONE gui=NONE guisp=NONE

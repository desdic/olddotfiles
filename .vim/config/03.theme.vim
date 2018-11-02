" Theme --- {{{
" color
syntax enable
set t_Co=256
set background=dark

" Enable 24bit colors in falcon
"set termguicolors
colorscheme falcon
let g:falcon_airline = 1
let g:airline_theme = 'falcon'

" For some reason only the comment colors are wrong when using tmux
if exists('$TMUX')
    hi Comment guifg=#89898c ctermfg=black guibg=NONE ctermbg=245 gui=italic cterm=italic
endif
" Make it easier to see the match
hi MatchParen ctermbg=blue guibg=lightblue

" Spelling mistakes should only be underlined and not red
hi SpellBad term=NONE cterm=underline ctermbg=NONE gui=NONE guisp=NONE

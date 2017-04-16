function TypesetLatex()
    silent !pdflatex -interaction=nonstopmode %
    redraw!
endfunction

function AfterOpen()
    if exists("g:loaded_syntastic_plugin")
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%{fugitive#statusline()}
    endif
    redraw!
endfunction

function! g:ToggleBackground()
  if &background != 'dark'
    colorscheme solarized
    set background=dark
  else
    colorscheme solarized
    set background=light
  endif
endfunction
nnoremap <silent> <F3> :call g:ToggleBackground()<CR>

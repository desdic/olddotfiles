function TypesetLatex()
	silent !pdflatex -interaction=nonstopmode %
	redraw!
endfunction

function AfterOpen()
	if exists("g:loaded_syntastic_plugin")
		set statusline+=%{SyntasticStatuslineFlag()}
	endif
endfunction


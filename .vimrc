for f in split(glob('~/.vim/config/*.vim'), '\n')
    exe 'source' f
endfor

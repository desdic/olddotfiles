call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'Raimondi/delimitMate'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ctrlpvim/ctrlp.vim'

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'roxma/vim-hug-neovim-rpc'
        Plug 'roxma/nvim-yarp'
        Plug 'Shougo/deoplete.nvim'
    endif
    Plug 'Shougo/denite.nvim'
    Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'honza/vim-snippets'
    " Not used in vim but for taskwarrior
    Plug 'fenetikm/falcon'
    " Plug 'sickill/vim-monokai'
    Plug 'morhetz/gruvbox'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'w0rp/ale'
    Plug 'ap/vim-css-color'
call plug#end()

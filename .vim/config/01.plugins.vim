call plug#begin('~/.vim/plugged')
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'Raimondi/delimitMate'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " Plug 'tpope/vim-fugitive'
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'ryanoasis/vim-devicons'
    "Plug 'neomake/neomake'
    " Plug 'ctrlpvim/ctrlp.vim'

    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/vim-hug-neovim-rpc'
        Plug 'roxma/nvim-yarp'
    endif
    Plug 'Shougo/denite.nvim'
    Plug 'zchee/deoplete-go', {'build': {'unix': 'make'}}
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
    Plug 'honza/vim-snippets'
    Plug 'fenetikm/falcon'
    Plug 'editorconfig/editorconfig-vim'
    " Needs to redefine C-n
    " Plug 'terryma/vim-multiple-cursors'
    Plug 'w0rp/ale'
call plug#end()

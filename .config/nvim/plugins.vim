" https://github.com/simonsmith/dotfiles/blob/master/dots/vimrc
let g:plugin_path = '~/.config/nvim/plugged'

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(g:plugin_path)
    " Airline for tab like menu but for buffers
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'junegunn/fzf.vim'

    " Color theme
    Plug 'dracula/vim', { 'as': 'dracula' }

    " Golang
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'ctrlpvim/ctrlp.vim'

    " Nerdtree + icons
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'ryanoasis/vim-devicons'

    " Comments
    Plug 'scrooloose/nerdcommenter'

    " Autocompletion
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " :CocInstall coc-tsserver coc-yaml coc-python coc-pairs coc-highlight
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
call plug#end()


let g:plugin_path = '~/.config/nvim/modules/plugged'

if ! filereadable(expand('~/.config/nvim/modules/autoload/plug.vim'))
    echo "Downloading junegunn/vim-plug to manage plugins..."
    silent !mkdir -p ~/.config/nvim/modules/autoload/
    silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/modules/autoload/plug.vim
    autocmd VimEnter * PlugInstall
endif

call plug#begin(g:plugin_path)
    " Airline for tab like menu but for buffers
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'junegunn/fzf.vim'

    " Color theme
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'tomasiser/vim-code-dark'

    " Nerdtree + icons
    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'ryanoasis/vim-devicons'

    " Comments
    Plug 'scrooloose/nerdcommenter'

    " Autocompletion
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " :CocInstall coc-tsserver coc-yaml coc-python coc-pairs coc-highlight coc-snippets coc-go

    Plug 'plasticboy/vim-markdown'

    Plug 'honza/vim-snippets'
    Plug 'Shougo/neosnippet-snippets'

    Plug 'unblevable/quick-scope'
call plug#end()

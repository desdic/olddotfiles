" NeoBundle Scripts-----------------------------
if has('vim_starting')  
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/
endif

let neobundle_readme=expand('~/.config/nvim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)  
  echo "Installing NeoBundle..."
  echo ""
  silent !mkdir -p ~/.config/nvim/bundle
  silent !git clone https://github.com/Shougo/neobundle.vim ~/.config/nvim/bundle/neobundle.vim/
  let g:not_finsh_neobundle = "yes"
endif

call neobundle#begin(expand('$HOME/.config/nvim/bundle'))  
NeoBundleFetch 'Shougo/neobundle.vim'

" ------------------------------------
" THIS IS WHERE YOUR PLUGINS WILL COME
" ------------------------------------

call neobundle#end()  

silent! call pathogen#infect()

source ~/.config/nvim/startup/syntax.vim
source ~/.config/nvim/startup/mappings.vim
source ~/.config/nvim/startup/functions.vim
source ~/.config/nvim/startup/filetypes.vim
source ~/.config/nvim/startup/settings.vim


filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck  
"End NeoBundle Scripts-------------------------

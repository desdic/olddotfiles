silent! call pathogen#infect()

source ~/.vim/startup/syntax.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/functions.vim
source ~/.vim/startup/filetypes.vim
source ~/.vim/startup/settings.vim

if has("gui_running")
    set lines=24 columns=80
endif



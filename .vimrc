silent! call pathogen#infect()

source ~/.vim/startup/syntax.vim
source ~/.vim/startup/settings.vim
source ~/.vim/startup/mappings.vim
source ~/.vim/startup/functions.vim
source ~/.vim/startup/json.vim
source ~/.vim/startup/yaml.vim
source ~/.vim/startup/python.vim
source ~/.vim/startup/go.vim
source ~/.vim/startup/markdown.vim
source ~/.vim/startup/otherfiles.vim

if has("gui_running")
	set lines=24 columns=80
endif


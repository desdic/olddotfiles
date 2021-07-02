export GOPATH=${HOME}/go

PATH="${HOME}/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/opt/chefdk/embedded/bin/"
for p in /usr/bin/vendor_perl /usr/bin/core_perl ${GOPATH}/bin ${HOME}/.gem/ruby/2.7.0/bin ${HOME}/.gem/ruby/2.6.0/bin ${HOME}/.rvm/bin
do
  if [ -d "${p}" ]; then
    PATH="${PATH}:${p}"
  fi
done
export PATH

export LANG=en_DK.UTF-8

function highlight() {
    /usr/bin/grep -E --color=auto "$@|";
}

export BROWSER=google-chrome-stable
export LESS=-Xr

if [ -x "$(which nvim)" ]; then
    alias vim="nvim"
fi
export EDITOR="vim"
export VISUAL="${EDITOR}"
export FCEDIT="${EDITOR}"
alias view="$EDITOR} -M"
alias rm='rm -i'

export LSCOLORS="Exfxcxdxbxegedabagacad"

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

export TERMINAL='st'

if [ -f ~/.config/dircolors ]; then
    eval $(dircolors ~/.config/dircolors)
fi

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

ssh-add -l | grep -q ED25519 || ssh-add ~/.ssh/id_rsa_onecom ~/.ssh/id_rsa ~/.ssh/id_ed25519

unsetopt share_history
unsetopt AUTO_CD

# Keyboard bindings
bindkey -e

# Enable CTRL+x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# CTRL + Arrowkeys to jump words
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

if [ -n "${DISPLAY}" ]; then
  ~/bin/keyboard.sh
fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U select-word-style
select-word-style bash

eval $(starship init zsh)

if [ -d ~/.config/zsh ]; then
  for config in ~/.config/zsh/*.zsh
  do
    source $config
  done
fi

eval "$(rbenv init -)"

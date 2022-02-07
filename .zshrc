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

export EDITOR="vim"
if [ -x "$(which nvim)" ]; then
    alias vim="nvim"
fi
export VISUAL="${EDITOR}"
export FCEDIT="${EDITOR}"
alias view="$EDITOR} -M"
alias rm='rm -i'

export LSCOLORS="Exfxcxdxbxegedabagacad"

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000

export TERMINAL='alacritty'

if [ -f ~/.config/dircolors ]; then
    eval $(dircolors ~/.config/dircolors)
fi

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

ssh-add -l | grep -q ED25519 || ssh-add ~/.ssh/id_rsa_onecom ~/.ssh/id_rsa ~/.ssh/id_ed25519

unsetopt share_history
unsetopt AUTO_CD

function cnodesfzf() {
  local selected_host=$(~/git/chef-repo/scripts/cnodes|fzf +m --query "$LBUFFER" --prompt="SSH remote > ")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle reset-prompt
}

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

zle -N cnodesfzf
bindkey '^s' cnodesfzf

# Turn ctrl+s off
setopt no_flow_control

autoload -U select-word-style
select-word-style bash

xset s on
xset s 600
xkbset repeatkeys rate 600 25
if [ -n "${DISPLAY}" ]; then
  xkbcomp -w0 -I"$HOME/.xkb" -R"$HOME/.xkb" keymap/custom "$DISPLAY" >/dev/null 2>&1
fi
setxkbmap -variant altgr-intl

eval $(starship init zsh)

if [ -d ~/.config/zsh ]; then
  for config in ~/.config/zsh/*.zsh
  do
    source $config
  done
fi

eval "$(rbenv init -)"

alias luamake=/home/kgn/.local/share/nvim/site/pack/packer/start/lua-language-server/3rd/luamake/luamake

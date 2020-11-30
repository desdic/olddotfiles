export GOPATH=${HOME}/go

PATH="${HOME}/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"
for p in /usr/bin/core_perl ${GOPATH}/bin /opt/chefdk/embedded/bin/ ${HOME}/.gem/ruby/2.7.0/bin ${HOME}/.gem/ruby/2.6.0/bin ${HOME}/.rvm/bin
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
alias view="${EDITOR} -M"

export LSCOLORS="Exfxcxdxbxegedabagacad"

export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000

export TERMINAL='alacritty'

if [ -f ~/.config/dircolors ]; then
    eval $(dircolors ~/.config/dircolors)
fi

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

ssh-add -l | grep -q ED25519 || ssh-add ~/.ssh/id_rsa_onecom ~/.ssh/id_rsa ~/.ssh/id_ed25519

ZSH=/usr/share/oh-my-zsh/
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    ZSH_THEME="robbyrussell"

    COMPLETION_WAITING_DOTS="true"
    DISABLE_AUTO_UPDATE="true"
    #CASE_SENSITIVE="true"

    if [ -f /etc/arch-release ]; then
        plugins=(archlinux git colored-man-pages colorize)
    else
        plugins=(git)
    fi
    ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
    if [[ ! -d $ZSH_CACHE_DIR ]]; then
      mkdir $ZSH_CACHE_DIR
    fi
    ZSH_CUSTOM=~/.oh-my-zsh/custom
    source $ZSH/oh-my-zsh.sh

    # Simple term cannot display the weird X that is default
    ZSH_THEME_GIT_PROMPT_DIRTY="%{%}) %{%}*"

fi

unsetopt share_history
unsetopt AUTO_CD

# Keyboard bindings
bindkey -e

# Enable CTRL+x-e to edit command line
zle -N edit-command-line
bindkey '^xe' edit-command-line

if [ -n "${DISPLAY}" ]; then
  ~/bin/keyboard.sh
fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

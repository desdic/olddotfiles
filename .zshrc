
function ef() {
    /sbin/fzf | /sbin/xargs /sbin/zsh -c '</dev/tty $EDITOR "$@"' ignoreme
}

function fcd() {
  dir=$(find ${1:-.} -type d -path ./.cache -prune -o -print 2> /dev/null | fzf +m) && cd "$dir"
}

function fzgrep() {
  /sbin/grep --line-buffered --color=never -r "" * | fzf
}

export GOPATH=${HOME}/go

PATH="${HOME}/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"
for p in /usr/bin/core_perl ${GOPATH}/bin /opt/chefdk/embedded/bin/ ${HOME}/.gem/ruby/2.7.0/bin ${HOME}/.gem/ruby/2.6.0/bin ${HOME}/.rvm/bin
do
  if [ -d "${p}" ]; then
    PATH="${PATH}:${p}"
  fi
done
export PATH

alias newlinestring='sed -e '\'':a'\'' -e '\''N'\'' -e '\''$!ba'\'' -e '\''s/\n/\\n/g'\'
alias newlinecomma='sed -e '\'':a'\'' -e '\''N'\'' -e '\''$!ba'\'' -e '\''s/\n/,/g'\'
alias newlinespace='sed -e '\'':a'\'' -e '\''N'\'' -e '\''$!ba'\'' -e '\''s/\n/\ /g'\'

export LANG=en_US.UTF-8
export LC_NUMERIC=C
export LC_COLLATE=C
export LC_MONETARY=da_DK.UTF-8
export LC_TIME=en_US.UTF-8
export LC_MESSAGES=C
export PAGER='less -R'

alias ls='/bin/ls -F --color=auto'
alias lc='/bin/ls -F --color'
alias grep='/usr/bin/grep --color=auto'
alias egrep='/usr/bin/egrep --color=auto'
alias tree='tree -C'
alias t='task'
alias tl='task list'
if [ -x /usr/local/bin/xping ]; then
    alias xping='xping -B'
fi
if [ -x /usr/local/bin/xping-http ]; then
    alias xping-http='xping-http -B'
fi

function highlight() {
    /usr/bin/grep -E --color=auto "$@|";
}

export BROWSER=brave
export LESS=-Xr

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

if [ -x "$(which nvim)" ]; then
    alias vim="nvim"
    export EDITOR="nvim"
    export VISUAL="${EDITOR}"
    export FCEDIT="${EDITOR}"
    alias view="${EDITOR} -M"
elif [ -x "$(which vim)" ]; then
    export EDITOR="vim"
    export VISUAL="${EDITOR}"
    export FCEDIT="${EDITOR}"
    alias view="${EDITOR} -M"
fi

export LSCOLORS="Exfxcxdxbxegedabagacad"

export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000

export TERMINAL='st'

if [ -f ~/.config/dircolors ]; then
    eval $(dircolors ~/.config/dircolors)
fi

if [ -x /sbin/fzf ]; then
  if [ -x /sbin/ag ]; then
    export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git -f -g ''"
  else
    export FZF_DEFAULT_COMMAND="find -L"
  fi
fi

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"

if [ -x /usr/bin/qt4-ssh-askpass ]; then
    export SSH_ASKPASS=/usr/bin/qt4-ssh-askpass
fi

if [ -x /usr/bin/keychain ]; then
    eval $(keychain -q -Q --systemd --inherit any --agents ssh --noask --eval id_rsa)
    eval $(keychain -q -Q --agents gpg --timeout 60 --noask --eval AB222CB2)
fi

ZSH=/usr/share/oh-my-zsh/
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
    ZSH_THEME="robbyrussell"

    COMPLETION_WAITING_DOTS="true"
    DISABLE_AUTO_UPDATE="true"
    #CASE_SENSITIVE="true"

    if [ -f /etc/arch-release ]; then
        plugins=(archlinux git go systemd colored-man-pages colorize)
    else
        plugins=(git)
    fi
    ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
    if [[ ! -d $ZSH_CACHE_DIR ]]; then
      mkdir $ZSH_CACHE_DIR
    fi
    source $ZSH/oh-my-zsh.sh
    if [ -x /sbin/gopass ]; then
      source <(/sbin/gopass completion zsh | head -n -1 | tail -n +2)
      compdef _gopass gopass
    fi
fi

unsetopt share_history
unsetopt AUTO_CD

# Keyboard bindings
bindkey -e

# Enable CTRL+x-e to edit command line
zle -N edit-command-line
bindkey '^xe' edit-command-line

if [ -z "${DISPLAY}" ]; then
  # After sleep the custom mapping is gone
  xkbcomp -w0 -I"$HOME/.xkb" -R"$HOME/.xkb" keymap/custom "$DISPLAY"
fi

if [ -f ~/.zshrc.work ]; then
  source ~/.zshrc.work
fi

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

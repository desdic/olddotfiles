export GOPATH=$(pwd)/go

PATH="${HOME}/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/bin/core_perl:${GOPATH}/bin"
export PATH

alias newlinestring='sed -e '\'':a'\'' -e '\''N'\'' -e '\''$!ba'\'' -e '\''s/\n/\\n/g'\'
alias newlinecomma='sed -e '\'':a'\'' -e '\''N'\'' -e '\''$!ba'\'' -e '\''s/\n/,/g'\'
alias newlinespace='sed -e '\'':a'\'' -e '\''N'\'' -e '\''$!ba'\'' -e '\''s/\n/\ /g'\'

function take {
    mkdir -p $1
    cd $1
}

function ef() {
    /sbin/fzf | /sbin/xargs /sbin/zsh -c '</dev/tty $EDITOR "$@"' ignoreme
}

function fcd() {
  dir=$(find ${1:-.} -type d -path ./.cache -prune -o -print 2> /dev/null | fzf +m) && cd "$dir"
}

function fzgrep() {
  /sbin/grep --line-buffered --color=never -r "" * | fzf
}

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
if [ -x ~/bin/vifmrun ]; then
        alias vifm=~/bin/vifmrun
fi

function highlight() {
    /usr/bin/grep -E --color=auto "$@|";
}

export BROWSER=firefox
export LESS=-Xr

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export GIT_AUTHOR_NAME="Kim Nielsen"
export GIT_AUTHOR_EMAIL=kgn@biq.dk
export GIT_COMMITTER_NAME="${GIT_AUTHOR_NAME}"
export GIT_COMMITTER_EMAIL="${GIT_AUTHOR_EMAIL}"
export DEBFULLNAME="${GIT_AUTHOR_NAME}"
export DEBEMAIL="${GIT_AUTHOR_EMAIL}"
export DEBCHANGE_AUTO_NMU=no

if [ -x "$(which vim)" ]; then
    export EDITOR="$(which vim)"
    export VISUAL="${EDITOR}"
    export FCEDIT="${EDITOR}"
    alias view="${EDITOR} -M"
fi

export LSCOLORS="Exfxcxdxbxegedabagacad"

export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000

# Keyboard bindings
bindkey -e

# Enable CTRL+x-e to edit command line
zle -N edit-command-line
bindkey '^xe' edit-command-line

export TERMINAL='kitty'

#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [ -f ~/.config/dircolors ]; then
    eval $(dircolors ~/.config/dircolors)
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
fi

unsetopt share_history

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Colors please
autoload -U colors && colors

# Case insensative tab completion
autoload -U compinit && compinit
unsetopt menu_complete   # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu         # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end
setopt hist_ignore_space
setopt no_hist_beep
setopt hist_save_no_dups
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select
WORDCHARS=${WORDCHARS//[\/.;-]}

# Status of exit code %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}✗ %s)
# Status of background processes %(1j.%j.)
# Full path %~

if [ $(id -u) -eq 0 ]; then
    # Root terminal
    HOST_COLOR=red
else
    if [ "$SSH_TTY" ]; then
        # Non-local terminal
        HOST_COLOR=yellow
    else
        # Local terminal
        HOST_COLOR=green
    fi
fi

export PROMPT="%(?:%{$reset_color%}:%{$fg_bold[red]%}✗ %s)%{$fg[red]%}%{$reset_color%}%{$fg[${HOST_COLOR}]%}%n@%m %{$fg[cyan]%}%1~%{$reset_color%}\$ "

if [ -f ~/.git-prompt.sh ]; then
    # Use git-prompt
    source ~/.git-prompt.sh
    setopt PROMPT_SUBST
    export GIT_PS1_SHOWDIRTYSTATE=1
    RPROMPT='%{$fg[red]%}$(__git_ps1 "(%s)") %{$fg_bold[green]%}%(1j.%j.)%{$reset_color%}'
else
    RPROMPT=" %{$fg_bold[green]%}%(1j.%j.)%{$reset_color%}"
fi

export RPROMPT
export GOPATH=$(pwd)/GOPATH

PATH=""
for dir in ${HOME}/bin /usr/local/MacGPG2/bin /{sbin,bin} /usr/{sbin,bin} /usr/local/{sbin,bin} /Library/Ruby/Gems/2.0.0/gems/librarian-chef-0.0.4/bin /usr/bin/core_perl $GOPATH/bin
do
    [ -d "${dir}" ] && PATH="${dir}:${PATH}"
done
export PATH

alias newlinestring='sed -e '\'':a'\'' -e '\''N'\'' -e '\''$!ba'\'' -e '\''s/\n/\\n/g'\'
alias newlinecomma='sed -e '\'':a'\'' -e '\''N'\'' -e '\''$!ba'\'' -e '\''s/\n/,/g'\'
alias newlinespace='sed -e '\'':a'\'' -e '\''N'\'' -e '\''$!ba'\'' -e '\''s/\n/\ /g'\'

function take {
    mkdir -p $1
    cd $1
}

case $(uname -s) in
   'Darwin')
        alias ls='/bin/ls -FGh'
        if [ -f ~/.githubhomebrewapi ]; then
            source ~/.githubhomebrewapi
        fi
        export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
        export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
        export LESS_TERMCAP_me=$'\E[0m'           # end mode
        export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
        export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
        export LESS_TERMCAP_ue=$'\E[0m'           # end underline
        export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
        [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
        ;;
    'Linux')
        alias ls='/bin/ls -F --color=auto'
        alias lc='/bin/ls -F --color'
        alias grep='/usr/bin/grep --color=auto'
        alias egrep='/usr/bin/egrep --color=auto'
        alias tree='tree -C'
        if [ -x /usr/bin/dsh ]; then
            alias dchi='dch --no-auto-nmu -i'
        fi
        export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
        export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
        export LESS_TERMCAP_me=$'\E[0m'           # end mode
        export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
        export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
        export LESS_TERMCAP_ue=$'\E[0m'           # end underline
        export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
        export LESS=-Xr
        [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
        ;;
esac

export GIT_AUTHOR_NAME="Kim Nielsen"
export GIT_AUTHOR_EMAIL=kgn@one.com
export GIT_COMMITTER_NAME="${GIT_AUTHOR_NAME}"
export GIT_COMMITTER_EMAIL="${GIT_AUTHOR_EMAIL}"
export DEBFULLNAME="${GIT_AUTHOR_NAME}"
export DEBEMAIL="${GIT_AUTHOR_EMAIL}"
export DEBCHANGE_AUTO_NMU=no

if [ -x "$(which vim)" ]; then
    export EDITOR="$(which vim)"
    export VISUAL="${EDITOR}"
    export FCEDIT="${EDITOR}"
    alias vi="${EDITOR}"
    alias nvi="/usr/bin/vi"
    alias view="${EDITOR} -M"
fi

export ONECOMID=kgn
export LC_CTYPE=en_US.UTF-8
export LSCOLORS="Exfxcxdxbxegedabagacad"

export HISTFILE=~/.zsh_history
export HISTSIZE=5000
export SAVEHIST=5000

# Keyboard bindings
bindkey -e
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[^[[D" backward-word
bindkey "^[^[[C" forward-word
bindkey '^w' backward-delete-word

export TERMINAL='xterm -fg PapayaWhip -fg "rgb:00/80/00" -bg "rgb:00/00/00"'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

case "$(hostname)" in
    'horus.insecurity.dk')
        eval $(ssh-agent) > /dev/null
        ;;
esac

# On work days I'd like it to show me my tasks (Without Wednesday meetings)
if [ -x /usr/bin/task ]; then
    H=$(date +%H)
    if [ $(date +%u) -lt 6 -a $H -gt 8 -a $H -lt 16 ]; then
        /usr/bin/task long project.not:wednesday +Work
    else
        /usr/bin/task long +Private 2>&1|grep -v '^No matches'
    fi
fi

if [ -f ~/.config/.dircolors ]; then
    eval $(dircolors ~/.config/.dircolors)
fi

if [ -x /usr/bin/keychain ]; then
    eval $(keychain -q --systemd --noask --eval id_rsa)
    eval $(keychain -q --systemd --timeout 60 --noask --eval AB222CB2)
fi


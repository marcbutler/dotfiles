# # -*- Mode: shell-script -*-

export PROMPT_DIRTRIM=2
export PS1='\h:\w$(__git_ps1 " (%s)") [$?]\$ '

export EDITOR=vim
export VISUAL=$EDITOR

alias h=history
shopt -s histappend
export HISTCONTROL='ignoredups:erasedups'
export HISTIGNORE='history:ls:l:la:ll:pd:pd1:pd2:pd3:xd:xd1:xd1:xd2:xd3'

export IGNOREEOF=3

alias e='emacsclient -n'

alias l='\ls -htr'
alias ls='\ls -tr'
alias ll='\ls -lhtr'
alias la='\ls -Alhtr'

# Protect myself from myself.
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I'

# directory stack
alias ds='dirs -v'
alias pd=pushd
alias pd1='pushd +1'
alias pd2='pushd +2'
alias pd3='pushd +3'
alias xd=popd
alias xd1='popd +1'
alias xd2='popd +2'
alias xd3='popd +3'

# docker aliases
alias dcnt='docker container'
alias dcmp='docker compose'
alias dimg='docker image'

# list directories
lsd() {
    local top="${1:-${PWD}}"
    find "$top" -mindepth 1 -maxdepth 1 -type d -not -path '*/.*'
}

# list all directories recursively
tree() {
    local top="${1:-${PWD}}"
    find "$top" -mindepth 1 -type d -not -path '*/.*'
}

add_to_path() {
    # Ignore if it doesn't exist.
    [[ -d $1 ]] || return 0

    # Don't add if already in path.
    for d in ${PATH//:/ }; do
	if [[ "$d" = "$1" ]]; then
	    return 0
	fi
    done

    export PATH=$PATH:$1
    return 0
}

add_to_path /lib/cargo/bin
add_to_path $HOME/.local/bin
add_to_path $HOME/.cargo/bin

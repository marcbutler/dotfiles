# -*- Mode: shell-script -*-

export PROMPT_DIRTRIM=2
export PS1='\h:\w$(__git_ps1 " (%s)") [$?]\$ '

export EDITOR=vim
export VISUAL=$EDITOR

alias h=history
shopt -s histappend
export HISTCONTROL='ignoredups:erasedups'
export HISTIGNORE='history:ls:l:la:ll:h:n:d:pd:pd1:pd2:pd3:xd:xd1:xd1:xd2:xd3'

alias l='\ls -htr'
alias ls='\ls -tr'
alias ll='\ls -lhtr'
alias la='\ls -Alhtr'

# Protect myself from myself.
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I'

alias d='dirs -v'
alias pd=pushd
alias pd1='pushd +1'
alias pd2='pushd +2'
alias pd3='pushd +3'
alias xd=popd
alias xd1='popd +1'
alias xd2='popd +2'
alias xd3='popd +3'

add_to_path() {
    # Ignore if it doesn't exist.
    [[ -d $1 ]] || return

    # Don't add if already in path.
    for d in ${PATH//:/ }; do
	if [[ "$d" = "$1" ]]; then
	    return
	fi
    done

    export PATH=$PATH:$1
}

add_to_path /lib/cargo/bin
add_to_path $HOME/.local/bin
add_to_path $HOME/.cargo/bin
#add_to_path /opt/hiroco/bin


# -*- Mode: shell-script -*-

export PROMPT_DIRTRIM=2
export PS1='\h:\w$(__git_ps1 " (%s)") [$?]\$ '

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

add_to_path $HOME/.local/bin
add_to_path /lib/cargo/bin
#add_to_path /opt/hiroco/bin

# Protect myself from myself.
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I'


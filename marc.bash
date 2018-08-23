export PROMPT_DIRTRIM=3
export PS1="\h:\w [\$?]\$ "

alias mv='mv -i'
alias cp='cp -i'
alias pd='pushd'
alias pd1='pushd +1'
alias pd2='pushd +2'
alias xd='popd'
alias pd1='pushd +1'
alias pd2='pushd +2'
alias d='dirs -v'
alias diff='diff -u'

export EDITOR=mg
export VISUAL=$EDITOR
export IGNOREEOF=3
export HISTIGNORE='ls:cd'
export HISTCONTROL=ignoreboth
export HISTTIMEFORMAT='%F %T  '

if [ $(type -t ls) == "alias" ]; then
    unalias ls
fi

# Emulate Mac pb(copy|paste) on Linux
if [[ "$(uname -o)" == "GNU/Linux" ]]; then
    alias pbcopy='xclip -selection clipboard -i'
    alias pbpaste='xclip -selection clipboard -o'
fi

# Start a program in the background preventing output
# in the current terminal.
function disavow {
    COPROC=(/dev/null /dev/null)
    if coproc $* ; then
        disown -h $!
    fi
}

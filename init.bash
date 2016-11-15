export PROMPT_DIRTRIM=3
export PS1="\h:\w [\$?]\$ "
export EDITOR=mg
export VISUAL=$EDITOR

export HISTIGNORE='h:p:history:pwd:ls:ls -l:emacs'
export HISTCONTROL=erasedups
export HISTTIMEFORMAT='%F %T  '

if [ $(type -t ls) == "alias" ]; then
    unalias ls
fi

# Linux pbcopy/pbpaste
if [[ "$(uname -o)" == "GNU/Linux" ]]; then
    alias pbcopy='xclip -selection clipboard -i'
    alias pbpaste='xclip -selection clipboard -o'
fi

eval $(opam config env)

export PS1="\h:\w [\$?]\$ "
export HISTCONTROL=ignoreboth

if [ $(type -t ls) == "alias" ]; then
    unalias ls
fi

eval $(opam config env)

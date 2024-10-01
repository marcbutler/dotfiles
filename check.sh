#!/usr/bin/env bash

diff -q ~/.emacs.d/init.el init.el
diff -q ~/.gitconfig gitconfig
grep -q 'dotfiles/bashrc' ~/.bashrc || echo "~/.bashrc not setup"

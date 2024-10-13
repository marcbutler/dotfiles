#!/usr/bin/env bash

diff -q ~/.emacs.d/init.el init.el
diff -q ~/.emacs.d/mockingbird-theme.el mockingbird-theme.el
diff -q ~/.gitconfig gitconfig
grep -q 'dotfiles/bashrc' ~/.bashrc || echo "~/.bashrc not setup"

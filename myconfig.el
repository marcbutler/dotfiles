(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;
;; Emacs builtin facitlities.
;;

(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(size-indication-mode 1)
(delete-selection-mode 1)
(show-paren-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq kill-whole-line t)
(setq load-prefer-newer t)
(setq mouse-yank-at-point t)
(setq show-paren-style 'mixed)
(setq transient-mark-mode t)
(setq uniquify-buffer-name-style 'forward)
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)

(setq-default truncate-lines 1)         ; Don't soft wrap by default.
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)

(windmove-default-keybindings)
(setq windmove-wrap-around t)

(cond
 ((executable-find "aspell")
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=enUS"))))

;;
;; Emacs managed packages.
;;

(require 'mmm-mode)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'c-mode nil 'ragel)

;;
;; Local code.
;;

(add-to-list 'load-path "~/emacslisp")
(load-file "~/emacslisp/ragel.el")

(provide 'myconfig)

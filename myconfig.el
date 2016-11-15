(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (package-initialize))

(add-to-list 'load-path "~/.dotfiles/site-lisp")

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

(require 'windmove)
(windmove-default-keybindings)
(setq windmove-wrap-around t)

(require 'server)
(unless (server-running-p)
  (server-start))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Emacs builtin facitlities.
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(size-indication-mode 1)
(delete-selection-mode 1)
(show-paren-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)
(defalias 'list-buffers 'ibuffer)

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

(setq-default backward-delete-function nil)
(setq-default fill-column 80)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines 1)

(add-hook 'dired-load-hook
          (function (lambda () (load "dired-x"))))

(cond
 ((executable-find "aspell")
  (setq ispell-program-name "aspell")
  (setq ispell-extra-args '("--sug-mode=ultra" "--lang=enUS"))))

;; Emacs managed packages.
(require 'mmm-mode)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'c-mode nil 'ragel)

;; Requires mmm-mode.
(load-file "~/.dotfiles/site-lisp/ragel.el")

(add-to-list 'auto-mode-alist '("\\.gdb\\'" . gdb-script-mode))

;; Use helm instead of ido.
;; http://tuhdo.github.io/helm-intro.html
(require 'helm)
(require 'helm-config)
(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))
(setq helm-split-window-in-side-p t
      helm-move-to-line-cycle-in-source t
      helm-ff-search-library-in-sexp t
      helm-scroll-amount 8
      helm-ff-file-name-history-use-recentf t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t)
(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)
(helm-autoresize-mode t)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
(helm-mode 1)
;; Insinuate helm.
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x C-f") 'helm-find-files)


(require 'mockb)
(provide 'myconfig)

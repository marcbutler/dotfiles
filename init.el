;;; init.el --- Initialization
;;; Code:
;;; Commentary:

(defun marc/dotemacsdir-relative-path (path)
  "Path to PATH in user Emacs customization directory."
  (expand-file-name (concat user-emacs-directory path)))

(defun marc/home-relative-path (path)
  "Path to PATH in my dotfiles configuration."
  (expand-file-name
   (substitute-in-file-name (concat "$HOME/" path))))

(setq custom-file (marc/dotemacsdir-relative-path "custom.el"))
(load custom-file)

(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(setq
 auto-save-default t
 auto-save-interval 200			; Keystrokes.
 auto-save-timeout 20			; Seconds.
 backup-by-copying t			; Don't clobber symlinks.
 delete-by-moving-to-trash t
 delete-old-versions t
 make-backup-files t
 sentence-end-double-space nil		; Sentences are demarcated by single and not double
					; spaces.
 version-control nil
 )

;; allow typing y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(require 'use-package)

(use-package diminish)


(add-to-list 'auto-mode-alist '("\\.gdb\\'" . gdb-script-mode))


(add-hook 'prog-mode-hook
	  (lambda ()
	    (setq truncate-lines t
		  comment-auto-fill-only-comments t
		  ;; Big dislays.
		  fill-column 96)))


(when window-system
  (exec-path-from-shell-initialize))


;; Builtin and not supported by use-package circa version 29.
(require 'server)
(unless (server-running-p)
  (server-start))

(setq inhibit-startup-message t
      inhibit-splash-screen t)

(show-paren-mode 1)
(setq show-paren-context-when-offscreen t)

;; MOAR text.

(if (display-graphic-p)
    (progn
      (require 'modus-themes)
      (tool-bar-mode -1)
      (scroll-bar-mode -1)
      (load-theme 'modus-operandi :no-confirm)))

(use-package ispell)
(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))

(use-package flycheck
  :ensure t
  :hook
  (after-init . global-flycheck-mode))

(use-package adoc-mode)

(use-package json-mode)

;; On Ubuntu install libtext-multimarkdown-perl for multimarkdown command.
(use-package markdown-mode
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
	      ("C-c C-e" . markdown-do)))

(use-package ansible
  :hook (yaml-mode . (lambda () (ansible-mode 1))))

(use-package yaml-mode
  :mode ("\\.yml\\'" . yaml-mode)
  :mode	("\\.yaml\\'" . yaml-mode))

(use-package toml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)


(use-package session
  :hook (after-save . session-save-session)
  :config
  (session-initialize))

(use-package projectile
  :ensure t
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  :config
  (projectile-mode +1))


(use-package git-link
  :ensure t
  :bind
  ("C-c g l" . git-link))

(use-package poetry)

(use-package python
  ;; TODO
  :hook (python-mode . (lambda ())))

(use-package python-docstring
  :diminish
  :hook (python-mode . python-docstring-mode))

(use-package typescript-mode)

(use-package go-mode)

(use-package editorconfig
  :diminish editorconfig-mode
  :config
  (editorconfig-mode 1))

(defmacro if-bound-invoke (fun expr)
  "If the FUN is bound, invoke EXPR."
  `(if (fboundp ,fun) ,expr))

(use-package dired
  :config
  (require 'dired-x)
  :hook
  ;; Emacs-lisp mode doesn't understand use-package and thinks dired-x
  ;; won't be loaded when the hook is installed.
  ((dired-mode . (lambda () (if-bound-invoke `dired-omit-mode
					      '(dired-omit-mode))))))


;;
;; Custom functions.
;;

(defun marc/copy-path-to-kill-ring ()
  "Copy current buffer path to the \"kill-ring\"."
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))))

(use-package ace-window
  :diminish)

(global-set-key (kbd "M-p") 'ace-window)

(use-package ace-window
  :diminish)

(global-set-key (kbd "M-p") 'ace-window)

;; User available keys.
(global-set-key [f6] 'comment-or-uncomment-region)
(global-set-key [f8] 'save-buffer)

(provide 'init)
;;; init.el ends here

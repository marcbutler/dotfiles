(setq custom-file (expand-file-name (concat user-emacs-directory "custom.el")))
(load custom-file)

(set-charset-priority 'unicode)
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system        'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(setq make-backup-files t
      backup-by-copying t		; Don't clobber symlinks.
      version-control nil
      delete-old-versions t
      delete-by-moving-to-trash t
      auto-save-default t
      auto-save-timeout 20		; Seconds.
      auto-save-interval 200		; Keystrokes.
      )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)

(when window-system
  (exec-path-from-shell-initialize))

;; User available keys.
(global-set-key [f6] 'comment-or-uncomment-region)
(global-set-key [f8] 'save-buffer)

;; Builtin and not supported by use-package circa version 29.
(require 'server)
(unless (server-running-p)
  (server-start))

(setq inhibit-startup-message t
      inhibit-splash-screen t)

(show-paren-mode 1)
(setq show-paren-context-when-offscreen t)

;; Moar text.
(if (display-graphic-p)
    (progn (tool-bar-mode -1)
	   (scroll-bar-mode -1)
	   (load-theme 'mockingbird t)))

;;
;; spell checking
;;
(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))
(use-package flycheck
  :hook
  (after-init . global-flycheck-mode))


(use-package json-mode)

;; On Ubuntu install libtext-multimarkdown-perl for multimarkdown command.
(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
	      ("C-c C-e" . markdown-do)))

(use-package yaml-mode
  :ensure t
  :mode ("\\.yml\\'" . yaml-mode)
  :mode	("\\.yaml\\'" . yaml-mode))

(use-package toml-mode)

(use-package dockerfile-mode)

(use-package projectile
  :bind-keymap ("C-c p" . projectile-command-map)
  :init
  :config
  (projectile-global-mode))

(use-package perspective
  :bind
  ("C-x C-b" . persp-list-buffers)         ; or use a nicer switcher, see below
  :custom
  (persp-mode-prefix-key (kbd "C-c P"))  ; pick your own prefix key here
  :init
  (persp-mode))

(use-package git-link
  :bind
  ("C-c g l" . git-link))

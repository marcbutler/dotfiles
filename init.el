(setq custom-file (expand-file-name (concat user-emacs-directory "custom.el")))
(load custom-file)

;; Enable numbered backup files as I use emacs primarily for files outside of version control.
(setq make-backup-files t
      backup-by-copying t		; Don't clobber symlinks.
      version-control t
      delete-old-versions t
      delete-by-moving-to-trash t
      auto-save-default t
      auto-save-timeout 20		; Seconds.
      auto-save-interval 200	       	; Keystrokes.
      )

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(require 'use-package)
(use-package clingo-mode)

(when window-system
  (exec-path-from-shell-initialize))

;; User available keys.
(global-set-key [f6] 'comment-or-uncomment-region)
(global-set-key [f8] 'save-buffer)

(load-theme 'mockingbird t)

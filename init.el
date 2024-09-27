(setq custom-file (expand-file-name (concat user-emacs-directory "custom.el")))
(load custom-file)

;; ubuntu 22 does not appear to have the emacs standard themese as
;; part of the emacs installation
(load-theme 'whiteboard)

;; I use emacs primarily for files outside of version control: so
;; enable numbered backup files.
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

;; Key customizations.
(global-set-key [f8] 'save-buffer)
(global-set-key [f6] 'comment-region)
(global-set-key [(control f6)] 'uncomment-region)

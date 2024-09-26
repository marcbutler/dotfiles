;; ubuntu 22 does not appear to have the emacs standard themese as
;; part of the emacs installation
(load-theme 'whiteboard)

;; I use emacs primarily for files outside of version control: so
;; enable numbered backup files.
(setq make-backup-files t
      backup-by-copying t		; Don't clobber symlinks.
      delete-by-moving-to-trash t
      version-control t
      delete-old-versions t
      auto-save-default t
      auto-save-timeout 20		; Seconds.
      auto-save-interval 200	       	; Keystrokes.
      )

(global-set-key [f8] 'save-buffer)

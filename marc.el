(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)

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

(add-to-list 'auto-mode-alist '("\\.gdb\\'" . gdb-script-mode))

(defun marc/this-word-occur ()
  "Run occur using the current word under the point."
  (interactive)
  (save-excursion
    (progn
      (backward-word)
      (setq beg (point))
      (forward-word)
      (setq end (point))
      (setq word (buffer-substring-no-properties beg end))
      (occur word))))
(global-set-key (kbd "M-s t") 'mockb-occurances-of-this-word)

(defun marc/copy-file-location ()
  "Copy file name and line position in the format file:line
suitable for tools like gdb to kill ring."
  (interactive)
  (save-excursion
    (let ((ln (line-number-at-pos))
          (fn (file-name-nondirectory buffer-file-truename)))
      (kill-new (format "%s:%d" fn ln)))))

;; http://stackoverflow.com/questions/3669511/the-function-to-show-current-files-full-path-in-mini-buffer
(defun marc/copy-full-path-to-kill-ring ()
  "Copy the canonical path of the current buffer to the kill ring."
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))))

;; https://rejeep.github.io/emacs/elisp/2010/11/16/delete-file-and-buffer-in-emacs.html
(defun marc/delete-this-buffer-and-file ()
  "Kill current buffer and corresponding file."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Really delete the backing file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully deleted." filename)))))

(defun marc/text-of-thing-at-point ()
  (cond
   ((thing-at-point 'symbol) (kill-new (thing-at-point 'symbol t)))
   ((thing-at-point 'word) (kill-new (thing-at-point 'word t)))
   (t nil)))

(defun marc/copy-thing-at-point ()
  (interactive)
  (let ((txt (marc/text-of-thing-at-point)))
    (if txt
        (kill-new txt)
      (message "No word/symbol at point to copy."))))
(global-set-key (kbd "C-c s") 'marc/copy-thing-at-point)

(defun marc/where-does-this-occur ()
  (interactive)
  (if (use-region-p)
      (occur (buffer-substring-no-properties (region-beginning) (region-end)))
    (let ((txt (marc/text-thing-at-point)))
      (if txt
          (occur (concat "\\b" txt "\\b"))
        (message "No region/symbol/word for occur.")))))

(defun marc/tidy-function ()
  "Reindent and cleanup whitespace in the current function."
  (interactive)
  (save-excursion
    (c-mark-function)
    (let ((rbeg (region-beginning))
          (rend (region-end)))
      (indent-region rbeg rend)
      (whitespace-cleanup-region rbeg rend))))

(defun marc/extract-from-quoted (txt)
  (let* ((joined (replace-regexp-in-string "\n$" "" txt))
         (exploded (split-string joined))
         (noquotes (delete ">" exploded)))
    (mapconcat 'identity noquotes " ")))

(defun marc/remove-header-guard ()
  (save-excursion
    (goto-char (point-min))
    (delete-region (point) (line-end-position 3))
    (goto-char (point-max))
    (let ((start (search-backward "#endif" (point-min) t)))
      (if start
          (delete-region start (point-max))
        (message "No #endif")))))

(defun marc/re-search (dir re bound)
  "Search for regular expression if not found return bound.
Parameter dir can be either 'forward or 'backward."
  (save-excursion
    (cond ((eq dir 'backward)
           (let ((pos (re-search-backward re bound t)))
             (if pos pos bound)))
          ((eq dir 'forward)
           (let ((pos (re-search-forward re bound t)))
             (if pos pos bound)))
          (t (error "invalid direction")))))

(provide 'myconfig)

(defun mockb-this-word-occur ()
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

(defun mockb-copy-file-location ()
  "Copy file name and line position in the format file:line
suitable for tools like gdb to kill ring."
  (interactive)
  (save-excursion
    (let ((ln (line-number-at-pos))
          (fn (file-name-nondirectory buffer-file-truename)))
      (kill-new (format "%s:%d" fn ln)))))

;; http://stackoverflow.com/questions/3669511/the-function-to-show-current-files-full-path-in-mini-buffer
(defun copy-full-path-to-kill-ring ()
  "Copy the canonical path of the current buffer to the kill ring."
  (interactive)
  (when buffer-file-name
    (kill-new (file-truename buffer-file-name))))

;; https://rejeep.github.io/emacs/elisp/2010/11/16/delete-file-and-buffer-in-emacs.html
(defun delete-this-buffer-and-file ()
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

(provide 'mockb)

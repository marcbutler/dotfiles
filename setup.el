;;; package -- setup
;;; Commentary:
;;; Code:

(package-initialize)
(require 'package)
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-refresh-contents)

(defvar setup/packages
  '(ace-window
    adoc-mode
    ansible
    diminish
    dockerfile-mode
    editorconfig
    flycheck
    git-link
    go-mode
    json-mode
    ispell
    markdown-mode
    modus-themes
    poetry
    projectile
    python-docstring
    session
    toml-mode
    typescript-mode
    yaml-mode))

(dolist (package setup/packages)
   (unless (package-installed-p package)
       (package-install package)))

(provide 'setup)
;;; setup.el ends here

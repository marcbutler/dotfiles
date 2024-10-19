;;; package -- setup
;;; Commentary:
;;; Code:

(package-initialize)
(require 'package)
(add-to-list 'package-archives
    '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-refresh-contents)

(defvar setup/packages
  '(dockerfile-mode
    editorconfig
    git-link
    json-mode
    ispell
    markdown-mode
    poetry
    projectile
    python-docstring
    session
    toml-mode
    yaml-mode))

(dolist (package setup/packages)
   (unless (package-installed-p package)
       (package-install package)))

(provide 'setup)
;;; setup.el ends here

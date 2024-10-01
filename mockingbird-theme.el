(deftheme mockingbird
  "A little more than minimal: based on eink theme.")

(custom-theme-set-faces
 'mockingbird
 '(cursor ((t (:foreground "white smoke" :background "#111111"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:weight bold :foreground "#111111"))))
 '(highlight ((t nil)))
 '(region ((t (:extend t :foreground "#111111" :background "#eeeee8"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((((class color) (min-colors 88) (background light)) (:extend t :background "yellow1")) (((class color) (min-colors 88) (background dark)) (:extend t :background "SkyBlue4")) (((class color) (min-colors 16) (background light)) (:extend t :background "yellow")) (((class color) (min-colors 16) (background dark)) (:extend t :background "SkyBlue4")) (((class color) (min-colors 8)) (:extend t :foreground "black" :background "cyan")) (t (:inverse-video t))))
 '(trailing-whitespace ((((class color) (background light)) (:background "red1")) (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
 '(font-lock-bracket-face ((t (:inherit (font-lock-punctuation-face)))))
 '(font-lock-builtin-face ((t (:foreground "#111111" :background "#fffff8"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "dark green"))))
 '(font-lock-comment-face ((t (:foreground "dark green" :weight regular))))
 '(font-lock-constant-face ((t (:foreground "#111111"))))
 '(font-lock-delimiter-face ((t (:inherit (font-lock-punctuation-face)))))
 '(font-lock-doc-face ((t (:foreground "dark green" :weight semi-bold))))
 '(font-lock-doc-markup-face ((t (:inherit (font-lock-constant-face)))))
 '(font-lock-escape-face ((t (:inherit (font-lock-regexp-grouping-backslash)))))
 '(font-lock-function-call-face ((t (:inherit font-lock-function-name-face))))
 '(font-lock-function-name-face ((t (:foreground "#111111" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "blue"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-number-face ((t nil)))
 '(font-lock-misc-punctuation-face ((t (:inherit (font-lock-punctuation-face)))))
 '(font-lock-operator-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:foreground "#111111"))))
 '(font-lock-property-name-face ((t (:inherit (font-lock-variable-name-face)))))
 '(font-lock-property-use-face ((t (:inherit (font-lock-property-name-face)))))
 '(font-lock-punctuation-face ((t nil)))
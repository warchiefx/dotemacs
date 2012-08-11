;; Using auto-complete mode from https://github.com/m2ym/auto-complete

(add-to-list 'load-path (concat site-lisp-path "auto-complete"))

(require 'auto-complete)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/dict")
(require 'auto-complete-config)
(ac-config-default)

(global-auto-complete-mode t)

(provide 'wcx-auto-complete)

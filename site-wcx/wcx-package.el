;;; wcx-package.el --- Package system setup
(require 'package)
(package-initialize)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("elpy" . "http://jorgenschaefer.github.io/packages/")
                         ("org" . "http://orgmode.org/elpa/")))

; Workaround for missing url-insert-buffer-contents function
(load-library "url-handlers")

;; Improved package manager
(use-package paradox
  :ensure t)

(provide 'wcx-package)

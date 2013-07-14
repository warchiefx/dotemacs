;;; wcx-python.el --- Python setup
;;
;; Filename: wcx-python.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:32:07 2008
;;
;; Last-Updated: Wed Oct  6 09:39:15 2010 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat site-lisp-path "emacs-for-python"))
(add-to-list 'load-path (concat site-lisp-path "emacs-jedi"))

(when (locate-library "python-mode")
  (load-library "python-mode"))

;; (when (locate-library "epy-init")
;;   (load-library "epy-init")
;;   (require 'epy-setup)
;;   (epy-setup-ipython))

(require 'epy-setup)      ;; It will setup other loads, it is required!
;; (require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
;;(require 'epy-bindings)   ;; For my suggested keybindings [optional]
(require 'epy-nose)       ;; For nose integration

(setq python-saved-check-command nil)

(when (locate-library "jedi")
  (autoload 'jedi:setup "jedi" nil t)
  (setq jedi:setup-keys t)
  (add-hook 'python-mode-hook 'jedi:setup))

(provide 'wcx-python)

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

;; (add-to-list 'load-path (concat site-lisp-path "emacs-for-python"))
;; (add-to-list 'load-path (concat site-lisp-path "emacs-jedi"))

;; (when (locate-library "python-mode")
;;   (load-library "python-mode"))

;; (when (locate-library "epy-init")
;;   (load-library "epy-init")
;;   (require 'epy-setup)
;;   (epy-setup-ipython))

;; (require 'epy-setup)      ;; It will setup other loads, it is required!
;; ;; (require 'epy-python)     ;; If you want the python facilities [optional]
;; (require 'epy-completion) ;; If you want the autocompletion settings [optional]
;; (require 'epy-editing)    ;; For configurations related to editing [optional]
;; ;;(require 'epy-bindings)   ;; For my suggested keybindings [optional]
;; (require 'epy-nose)       ;; For nose integration

(when (locate-library "elpy")
  (load-library "elpy")
  (elpy-enable)
  (elpy-clean-modeline)
  (elpy-use-ipython))

(when (locate-library "autopair")
  (add-hook 'python-mode-hook
            #'(lambda ()
                (setq autopair-handle-action-fns
                      (list #'autopair-default-handle-action
                            #'autopair-python-triple-quote-action)))))

(setq python-saved-check-command nil)

(provide 'wcx-python)

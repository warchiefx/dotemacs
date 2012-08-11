;;; wcx-malabar.el --- Malabar-mode integration
;;
;; Filename: wcx-malabar.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct  6 09:35:09 2010
;;
;; Last-Updated: Wed Oct  6 09:38:09 2010 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Or enable more if you wish

(add-to-list 'load-path (concat site-lisp-path "malabar/lisp"))

(setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                  global-semanticdb-minor-mode
                                  global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))
(semantic-mode 1)
(require 'malabar-mode)
(setq malabar-groovy-lib-dir (concat site-lisp-path "malabar/lib"))
(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(add-hook 'malabar-mode-hook
          (lambda ()
            (add-hook 'after-save-hook 'malabar-compile-file-silently
                      nil t)))

(provide 'wcx-malabar)
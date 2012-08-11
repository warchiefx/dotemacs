;;; wcx-javascript.el --- Javascript related setups
;; 
;; Filename: wcx-javascript.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 12:01:11 2008
;; 
;; Last-Updated: Wed Oct 22 12:02:11 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load Steve Yegge's javascript-ide-mode
(when (locate-library "js2")
  (autoload 'js2-mode "js2" nil t)
  (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
  (setq js2-use-font-lock-faces t))

(provide 'wcx-javascript)
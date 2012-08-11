;;; wcx-ido.el --- ido-mode config
;; 
;; Filename: wcx-ido.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Tue Oct 28 10:59:03 2008
;; 
;; Last-Updated: Tue Oct 28 13:46:19 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ido-mode t)

;; Use ido for buffer search
(ido-everywhere t)
(global-set-key "\C-xb" 'ido-switch-buffer)

(provide 'wcx-ido)
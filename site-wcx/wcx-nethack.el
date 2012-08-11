;;; wcx-nethack.el --- Nethack.el compatibility
;; 
;; Filename: wcx-nethack.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Sun Nov  2 15:03:38 2008
;; 
;; Last-Updated: Sun Nov  2 15:05:12 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat site-lisp-path "nethack-el"))

(when (locate-library "nethack")
  (load-library "nethack"))

(provide 'wcx-nethack)
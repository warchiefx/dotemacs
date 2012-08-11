;;; wcx-ecb.el --- ECB setup
;; 
;; Filename: wcx-ecb.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:54:42 2008
;; 
;; Last-Updated: Tue Oct 28 22:51:00 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;(add-to-list 'load-path (concat site-lisp-path "ecb"))

;; Load ECB and set bindings

(when (locate-library "ecb")
  (load-library "ecb")
  (require 'ecb)
  (global-set-key [?\C-c ?e ?a] 'ecb-activate)
  (global-set-key [?\C-c ?e ?d] 'ecb-deactivate))

(provide 'wcx-ecb)

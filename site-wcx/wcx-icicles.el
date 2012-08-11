;;; wcx-icicles.el --- Icicles setup
;; 
;; Filename: wcx-icicles.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:32:28 2008
;; 
;; Last-Updated: Wed Oct 22 15:26:18 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load paths
(add-to-list 'load-path (concat site-lisp-path "icicles"))

(when (locate-library "icicles")
  (load-library "icicles")
  (when (locate-library "icicles-iswitchb")
    (require 'icicles-iswitchb))
  (icy-mode))

(provide 'wcx-icicles)
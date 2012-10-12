;;; wcx-slime.el --- SLIME setup
;; 
;; Filename: wcx-slime.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:56:57 2008
;; 
;; Last-Updated: Fri Aug  7 11:52:52 2009 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (locate-library "slime")
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq common-lisp-hyperspec-root "file:///home/warchiefx/Docs/LISP/HyperSpec/HyperSpec/")
  (setq slime-complete-symbol-function (quote slime-fuzzy-complete-symbol))
  (require 'slime)
  (slime-setup)
  (global-set-key [f7] 'slime-selector)
  (global-set-key [?\C-c ?s ?n] 'slime-list-compiler-notes))

(provide 'wcx-slime)

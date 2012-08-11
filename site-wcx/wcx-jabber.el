;;; wcx-jabber.el --- emacs-jabber mode configuration
;; 
;; Filename: wcx-jabber.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Thu Oct 30 18:28:29 2008
;; 
;; Last-Updated: Thu Oct 30 18:29:28 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat site-lisp-path "emacs-jabber"))

(when (locate-library "jabber.el")
  (require 'jabber))

(provide 'wcx-jabber)
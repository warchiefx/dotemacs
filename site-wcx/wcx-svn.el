;;; wcx-svn.el --- SVN Setup
;; 
;; Filename: wcx-svn.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:59:53 2008
;; 
;; Last-Updated: Wed Oct 22 12:00:24 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load SVN library and setup keys
(when (locate-library "psvn")
  (load-library "psvn")
  (global-set-key [?\C-c ?v ?s] 'svn-status))

(provide 'wcx-svn)
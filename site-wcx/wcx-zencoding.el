;;; wcx-zencoding.el --- zencoding-mode
;; 
;; Filename: wcx-zencoding.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Apr 07 10:40:26 2010
;; 
;; Last-Updated: Wed Apr  7 20:02:41 2010 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Home: http://github.com/chrisdone/zencoding

(add-to-list 'load-path (concat site-lisp-path "zencoding-mode"))

(when (locate-library "zencoding-mode")
  (load-library "zencoding-mode")
  (add-hook 'sgml-mode-hook 'zencoding-mode)  ;; Auto-start on any markup modes
  (add-hook 'nxml-mode-hook 'zencoding-mode))

(provide 'wcx-zencoding)
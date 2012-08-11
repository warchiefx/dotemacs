;;; wcx-w3m.el --- W3M setup
;; 
;; Filename: wcx-w3m.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:36:31 2008
;; 
;; Last-Updated: Sun Oct 26 23:29:29 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; W3M setup
(when (locate-library "w3m")
  (load-library "w3m")
  (setq browse-url-browser-function 'w3m-browse-url)
  (autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
  ;; optional keyboard short-cut
  (global-set-key "\C-cw" 'browse-url-at-point)
  (global-set-key (quote [f7]) 'w3m))

(provide 'wcx-w3m)
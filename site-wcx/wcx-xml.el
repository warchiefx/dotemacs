;;; wcx-xml.el --- XML modes setup
;; 
;; Filename: wcx-xml.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:32:54 2008
;; 
;; Last-Updated: Wed Oct 22 15:09:39 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat site-lisp-path "nxml-mode"))

(when (locate-library "rng-auto")
  (load-library "rng-auto"))

;; NXML-mdoe
(when (locate-library "nxml-mode")
  (load-library "nxml-mode")
  (add-to-list 'auto-mode-alist
               (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss" "jsp") t) "\\'")
                     'nxml-mode))
  (unify-8859-on-decoding-mode)
  
  (setq magic-mode-alist
        (cons '("<\\?xml " . nxml-mode)
              magic-mode-alist))
  (fset 'xml-mode 'nxml-mode))

(provide 'wcx-xml)
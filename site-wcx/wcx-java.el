;;; wcx-java.el --- Java setup
;; 
;; Filename: wcx-java.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:31:43 2008
;; 
;; Last-Updated: Fri Jun 11 09:24:24 2010 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (add-to-list 'load-path (concat site-lisp-path "jdee/lisp"))

;; Setup JDE
;; (when (locate-library "jde")
;;   (setq defer-loading-jde t)
;;   (if defer-loading-jde
;;       (progn
;; 	(autoload 'jde-mode "jde" "JDE mode." t)
;; 	(setq auto-mode-alist
;; 	      (append
;; 	       '(("\\.java\\'" . jde-mode))
;; 	       auto-mode-alist)))
;;     (require 'overlay-fix)
;;     (require 'jde)
;;     (require 'jde-ant)))

;; Use the full Java 1.5 grammar to parse Java files
(autoload 'wisent-java-default-setup "wisent-java"
  "Hook run to setup Semantic in `java-mode'." nil nil)

;; Java-complete package
;; (when (locate-library "java-complete")
;;   (load-library "java-complete")
;;   (add-hook 'java-mode-hook (lambda () 
;;                               (local-set-key (kbd "M-<enter>") 'jde-complete))))

(provide 'wcx-java)
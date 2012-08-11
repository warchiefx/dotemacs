;;; wcx-nxhtml.el --- nXhtml-mode integration
;; 
;; Filename: wcx-nxhtml.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Tue Oct 28 20:41:47 2008
;; 
;; Last-Updated: Tue Oct 28 20:49:30 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defvar nxhtml-install-path (concat site-lisp-path "nxhtml"))
(defvar nxhtml-autoload-script (concat nxhtml-install-path "/autostart.el"))

(add-to-list 'load-path (concat site-lisp-path nxhtml-install-path))
(when (locate-library nxhtml-autoload-script)
  (when (load nxhtml-autoload-script t)
    (setq nxhtml-skip-welcome t
          mumamo-chunk-coloring 'submode-colored
          indent-region-mode t
          rng-nxml-auto-validate-flag nil))
  (autoload 'django-html-mumamo-mode nxhtml-autoload-script)
  (setq auto-mode-alist
        (append '(("\\.html?$" . django-html-mumamo-mode)) auto-mode-alist))
  (setq mumamo-background-colors nil) 
  (add-to-list 'auto-mode-alist '("\\.html$" . django-html-mumamo-mode)))

(provide 'wcx-nxhtml)

;;; wcx-javascript.el --- Javascript related setups
;; 
;; Filename: wcx-javascript.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 12:01:11 2008
;; 
;; Last-Updated: Wed Oct 22 12:02:11 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load Steve Yegge's javascript-ide-mode
;; (when (locate-library "js2-mode")
;;   (autoload 'js2-mode "js2-mode" nil t)
;;   (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
;;   (setq js2-use-font-lock-faces t))

;; (when (locate-library "ac-js2")
;;   (load-library "ac-js2"))

;; (when (locate-library "tern")
;;   (autoload 'tern-mode "tern.el" nil t)
;;   (autoload 'tern-auto-complete "tern-auto-complete.el" nil t)
  
;;   (add-hook 'js2-mode-hook (lambda () (tern-mode t)))

;;   (eval-after-load 'tern
;;     '(progn
;;        (require 'tern-auto-complete)
;;        (tern-ac-setup))))
;;; Code:


(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode)))

(use-package company-tern
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern)
  (add-hook 'js2-mode-hook (lambda ()
                              (ycmd-mode -1)
                              (rainbow-identifiers-mode -1))))

(use-package indium
  :ensure t
  :config
  (add-hook 'rjsx-mode-hook #'indium-interaction-mode))

(provide 'wcx-javascript)

;;; wcx-malabar.el --- Malabar-mode integration
;;
;; Filename: wcx-malabar.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct  6 09:35:09 2010
;;
;; Last-Updated: Wed Oct  6 09:38:09 2010 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:
(when (locate-library "malabar-mode")
  ;; (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
  ;;                                   global-semanticdb-minor-mode
  ;;                                   global-semantic-idle-summary-mode
  ;;                                   global-semantic-mru-bookmark-mode))
  ;; (semantic-mode 1)
  (require 'malabar-mode)
  (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

  (add-hook 'malabar-mode-hook
            (lambda ()
              (yas/minor-mode-on)
              (flycheck-mode-on-safe)))

  (add-hook 'malabar-mode-hook
            (lambda ()
              (add-hook 'after-save-hook 'malabar-compile-file-silently
                        nil t)))

  (eval-after-load 'malabar-mode
    '(define-key malabar-mode-map [f7] 'malabar-run-maven-command))

  (setenv "ANDROID_HOME" "/home/warchiefx/Apps/android-sdk")
  (setenv "JAVA_HOME" "/opt/java")

  (setq malabar-groovy-lib-dir (concat site-lisp-path "malabar/lib")))

(provide 'wcx-malabar)
;;; wcx-malabar.el ends here

;;; wcx-cedet.el --- Load CEDET and components.
;;
;; Filename: wcx-cedet.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Sun Oct 26 19:58:20 2008
;;
;; Last-Updated: Wed Feb 17 15:37:23 2010 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; Commented, use the OS installed version.
;; (setq cedet-install-path (concat site-lisp-path "cedet/")
;;       cedet-main-file (concat cedet-install-path "common/cedet.el"))

;; (add-to-list 'load-path (concat site-lisp-path cedet-install-path))

(require 'ede)
(global-ede-mode 1)
(require 'semantic)
(require 'semantic/sb)
(semantic-mode 1)

;; (when (locate-library "cedet")
;;   (load-library "cedet")

;;   (require 'ede)
;;   (global-ede-mode 1)
;;   (require 'semantic)
;;   (require 'semantic/sb)
;;   (semantic-mode 1)
;;   ;; Enabling various SEMANTIC minor modes.  See semantic/INSTALL for more ideas.
;;   ;; Select one of the following:

;;   ;; * This enables the database and idle reparse engines
;;   ;;(semantic-load-enable-minimum-features)

;;   ;; * This enables some tools useful for coding, such as summary mode
;;   ;;   imenu support, and the semantic navigator
;;   ;;(semantic-load-enable-code-helpers)

;;   ;; * This enables even more coding tools such as the nascent intellisense mode
;;   ;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;;   ;;(semantic-load-enable-gaudy-code-helpers)

;;   ;; * This turns on which-func support (Plus all other code helpers)
;;   ;;(semantic-load-enable-excessive-code-helpers)
  
;;   ;; This turns on modes that aid in grammar writing and semantic tool
;;   ;; development.  It does not enable any other features such as code
;;   ;; helpers above.
;;   ;; (semantic-load-enable-semantic-debugging-helpers)

;;   ;; Enable SRecode (Template management) minor-mode.
;;   ;;(global-srecode-minor-mode 1))

;;   ;; Disable stickyfunc header
;;   ;;(semantic-stickyfunc-mode 0))
;;   )
(provide 'wcx-cedet)

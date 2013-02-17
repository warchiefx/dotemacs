;;; wcx-git.el --- git integration
;; 
;; Filename: wcx-git.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Mon Oct 27 19:16:28 2008
;; 
;; Last-Updated: Mon Oct 27 19:25:42 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (locate-library "vc-git")
  (require 'vc-git)
  (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
  (require 'git)
  (autoload 'git-blame-mode "git-blame"
    "Minor mode for incremental blame for Git." t))

(when (locate-library "magit")
  (require 'magit)
  (global-set-key [?\C-c ?\C-x ?g] 'magit-status))

(provide 'wcx-git)

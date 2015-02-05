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

(when (locate-library "git-timemachine")
  (load-library "git-timemachine")
  (global-set-key [?\C-c ?\C-x ?h] 'git-timemachine))

;; full screen magit-status

(defadvice magit-status (around magit-fullscreen activate)
  (window-configuration-to-register :magit-fullscreen)
  ad-do-it
  (delete-other-windows))

(defun magit-quit-session ()
  "Restores the previous window configuration and kills the magit buffer"
  (interactive)
  (kill-buffer)
  (jump-to-register :magit-fullscreen))

(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)

(when (locate-library "gist")
  (load-library "gist"))

(when (locate-library "magit-gitflow")
  (require 'magit-gitflow)
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(provide 'wcx-git)

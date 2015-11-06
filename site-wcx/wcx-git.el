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

(use-package vc-git
  :config
  (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
  (require 'git)
  (autoload 'git-blame-mode "git-blame"
    "Minor mode for incremental blame for Git." t)
  )

(use-package magit
  :ensure t
  :init
  (setq magit-last-seen-setup-instructions "1.4.0")
  :config
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
  :bind ("C-c C-x g" . magit-status)
  )

(use-package magit-gitflow
  :ensure t
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(use-package git-timemachine
  :bind ("C-c C-x h". git-timemachine)
  :defer t)

(use-package gist
  :defer t)

(provide 'wcx-git)

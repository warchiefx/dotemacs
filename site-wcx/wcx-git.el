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

;; (use-package vc-git
;;   :config
;;   (when (featurep 'vc-git) (add-to-list 'vc-handled-backends 'git))
;;   (require 'git)
;;   (autoload 'git-blame-mode "git-blame"
;;     "Minor mode for incremental blame for Git." t)
;;   )

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

  (defun my/magit-hook ()
    (setq-local display-line-numbers nil))
  (add-hook 'magit-mode-hook 'my/magit-hook)

  :commands (magit-status magit-blame)
  :bind ("C-c C-x g" . magit-status))

(use-package magit-gitflow
  :ensure t
  :after magit
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(use-package git-timemachine
  :ensure t
  :bind ("C-c C-x h". git-timemachine)
  :defer t)

(use-package gist
  :ensure t
  :defer t)

(use-package git-commit
  :ensure t
  :after magit
  :preface
  (defun me/git-commit-auto-fill-everywhere ()
    (setq fill-column 72)
    (setq-local comment-auto-fill-only-comments nil))
  :init
  (add-hook 'git-commit-mode-hook #'me/git-commit-auto-fill-everywhere)
  (global-git-commit-mode)
  :config (setq-default git-commit-summary-max-length 50))

(use-package diff-hl
  :ensure t
  :demand t
  :config
  (global-diff-hl-mode 1)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package ghub
  :ensure t)

(use-package magit-org-todos
  :ensure t
  :config
  (magit-org-todos-autoinsert))

(use-package magit-gh-pulls
  :ensure t
  :after magit
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls))

(provide 'wcx-git)

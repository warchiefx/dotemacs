(use-package magit
  :defer t
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
  :after magit
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gitflow))

(use-package git-timemachine
  :bind ("C-c C-x h". git-timemachine)
  :defer t)

(use-package gist
  :defer t)

(use-package git-commit
  :after magit
  :defer t
  :preface
  (defun me/git-commit-auto-fill-everywhere ()
    (setq fill-column 72)
    (setq-local comment-auto-fill-only-comments nil))
  :init
  (add-hook 'git-commit-mode-hook #'me/git-commit-auto-fill-everywhere)
  (global-git-commit-mode)
  :config (setq-default git-commit-summary-max-length 50))

(use-package diff-hl
  :demand t
  :config
  (global-diff-hl-mode 1)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package magit-org-todos
  :after magit
  :defer t
  :config
  (magit-org-todos-autoinsert))

(use-package magit-gh-pulls
  :after magit
  :config
  (add-hook 'magit-mode-hook 'turn-on-magit-gh-pulls))

(use-package smerge-mode
  :bind (:map smerge-mode-map ("C-<f12>" . hydra-smerge/body))
  :hydra (hydra-smerge (:color pink :hint nil :pre (smerge-mode 1) :post (smerge-auto-leave))
                       "
^Move^       ^Keep^               ^Diff^                 ^Other^
^^-----------^^-------------------^^---------------------^^-------
_n_ext       _b_ase               _<_: upper/base        _C_ombine
_p_rev       _u_pper              _=_: upper/lower       _r_esolve
^^           _l_ower              _>_: base/lower        _k_ill current
^^           _a_ll                _R_efine
^^           _RET_: current       _E_diff
"
                       ("n" smerge-next)
                       ("p" smerge-prev)
                       ("b" smerge-keep-base)
                       ("u" smerge-keep-upper)
                       ("l" smerge-keep-lower)
                       ("a" smerge-keep-all)
                       ("RET" smerge-keep-current)
                       ("\C-m" smerge-keep-current)
                       ("<" smerge-diff-base-upper)
                       ("=" smerge-diff-upper-lower)
                       (">" smerge-diff-base-lower)
                       ("R" smerge-refine)
                       ("E" smerge-ediff)
                       ("C" smerge-combine-with-next)
                       ("r" smerge-resolve)
                       ("k" smerge-kill-current)
                       ("q" nil "cancel" :color blue)))

(provide 'wcx-git)

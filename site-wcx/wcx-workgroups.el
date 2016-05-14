(use-package workgroups2
  :ensure t
  :config
  (setq wg-prefix-key [f7])
  (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
  (workgroups-mode 1))

(provide 'wcx-workgroups)

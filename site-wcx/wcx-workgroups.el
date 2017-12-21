(use-package workgroups2
  :ensure t
  :config
  (setq wg-prefix-key [C-f7])
  (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
  (workgroups-mode 1)
  :diminish workgroups-mode)

(provide 'wcx-workgroups)

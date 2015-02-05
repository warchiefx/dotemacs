(when (locate-library "workgroups2")
  (require 'workgroups2)
  ;; Your settings here

  ;;(setq wg-session-load-on-start t)    ; default: (not (daemonp))

  ;; Change prefix key (before activating WG)
  (setq wg-prefix-key (kbd "C-c z"))

  ;; Change workgroups session file
  (setq wg-session-file "~/.emacs.d/.emacs_workgroups")
  (workgroups-mode 1))

(provide 'wcx-workgroups)

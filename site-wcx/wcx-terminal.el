(use-package sane-term
  :ensure t
  :commands sane-term
  :init
  ;; shell to use for sane-term
  (setq sane-term-shell-command "/usr/bin/zsh")
  ;; sane-term will create first term if none exist
  (setq sane-term-initial-create t)
  ;; `C-d' or `exit' will kill the term buffer.
  (setq sane-term-kill-on-exit t)
  ;; After killing a term buffer, not cycle to another.
  (setq sane-term-next-on-kill nil))

(use-package shell-pop
  :ensure t
  :after sane-term
  :bind (([f7] . shell-pop)
         ([shift f7] . sane-term-create)))

(use-package xterm-color
  :ensure t
  :init
  ;; comint install
  (progn (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
         (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions)))

  ;; comint uninstall
  (progn (remove-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
         (add-to-list 'comint-output-filter-functions 'ansi-color-process-output)))

(provide 'wcx-terminal)

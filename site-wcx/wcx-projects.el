
(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init (projectile-mode 1)
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  ;; Don't auto-discover projects over tramp — too slow over the wire.
  (defun wcx/projectile-skip-remote (orig-fn &rest args)
    (unless (--any? (and it (file-remote-p it))
                    (list (buffer-file-name)
                          list-buffers-directory
                          default-directory))
      (apply orig-fn args)))
  (advice-add 'projectile-on :around #'wcx/projectile-skip-remote))

(provide 'wcx-projects)
;;; wcx-projects.el ends here

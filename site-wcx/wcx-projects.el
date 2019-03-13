
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode 1)

  ;; Disable projectile over tramp
  (defadvice projectile-on (around exlude-tramp activate)
    (unless  (--any? (and it (file-remote-p it))
        (list
            (buffer-file-name)
            list-buffers-directory
            default-directory))
    ad-do-it))
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  :diminish projectile-mode)

(use-package helm-projectile
  :ensure t)

;; (use-package persp-mode
;;   :ensure t
;;   :config
;;   (setq wg-morph-on nil) ;; switch off animation
;;   (setq persp-autokill-buffer-on-remove 'kill-weak)
;;   (add-hook 'after-init-hook #'(lambda () (persp-mode 1)))
;;   :diminish persp-mode)

;; (use-package persp-mode-projectile-bridge
;;   :ensure t
;;   :after persp-mode
;;   :config
;;   (with-eval-after-load "persp-mode-projectile-bridge-autoloads"
;;       (add-hook 'persp-mode-projectile-bridge-mode-hook
;;                 #'(lambda ()
;;                     (if persp-mode-projectile-bridge-mode
;;                         (persp-mode-projectile-bridge-find-perspectives-for-all-buffers)
;;                       (persp-mode-projectile-bridge-kill-perspectives))))
;;       (add-hook 'after-init-hook
;;                 #'(lambda ()
;;                     (persp-mode-projectile-bridge-mode 1))
;;                 t)))

(provide 'wcx-projects)
;;; wcx-projects.el ends here

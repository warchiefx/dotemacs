(use-package codesearch
  :ensure t)

(use-package projectile-codesearch
  :ensure t
  :after projectile
  :demand t
  :config
  (add-hook 'projectile-after-switch-project-hook (lambda () (codesearch-build-index (projectile-project-root)))))

(use-package helm-codesearch
  :ensure t
  :config
  (setq helm-codesearch-global-csearchindex "~/.csearchindex")
  :bind
  (("C-c h f" . helm-codesearch-find-file)
   ("C-c f" . helm-codesearch-find-pattern)
   ("C-c h I" . helm-codesearch-create-csearchindex)))


(provide 'wcx-codesearch)

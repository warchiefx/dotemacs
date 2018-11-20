(use-package eglot
  :ensure t
  :config
  (defun wcx/activate-lsp ()
    (flycheck-mode 0)
    (eglot-ensure))

  (defun wcx/find-projectile-project (dir)
    (if (fboundp 'projectile-project-root)
        (let ((root (projectile-project-root dir)))
          (and root (cons 'transient root)))))

  ;; Integrate project.el with projectile
  (add-to-list 'project-find-functions #'wcx/find-projectile-project)

  (add-hook 'java-mode-hook 'wcx/activate-lsp)
  (add-hook 'python-mode-hook 'wcx/activate-lsp)
  (add-hook 'ruby-mode-hook 'wcx/activate-lsp)
  (add-hook 'bash-mode-hook 'wcx/activate-lsp))

(provide 'wcx-lsp)

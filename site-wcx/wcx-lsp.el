;; (use-package lsp-mode
;;   :ensure t
;;   :commands lsp
;;   :init
;;   (setq lsp-auto-guess-root t)
;;   (setq lsp-prefer-flymake nil)
;;   :config
;;   (require 'lsp-clients)
;;   (add-hook 'prog-mode-hook (lambda () (flymake-mode -1)))
;;   (define-key lsp-mode-map (kbd "S-<f6>") 'lsp-rename)
;;   (defun wcx/activate-lsp ()
;;     (ycmd-mode -1)
;;     (lsp))
;;   :hook ((python-mode java-mode bash-mode lua-mode ruby-mode) . wcx/activate-lsp))

;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode)

;; (use-package company-lsp
;;   :ensure t
;;   :commands company-lsp)

;; (use-package lsp-java
;;   :ensure t)

;; (use-package lsp-python-ms
;;   :ensure t
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-python-ms)
;;                           (lsp))))  ; or lsp-deferred

;; (use-package dap-mode
;;   :ensure t
;;   :config
;;   (dap-mode 1)
;;   (dap-ui-mode 1)
;;   (require 'dap-java)
;;   (require 'dap-python))

(use-package eglot
  :ensure t
  :config
  (defun wcx/activate-lsp ()
    (eglot-ensure))

  (defun wcx/find-projectile-project (dir)
    (if (fboundp 'projectile-project-root)
        (let ((root (projectile-project-root dir)))
          (and root (cons 'transient root)))))

  ;; Integrate project.el with projectile
  (add-to-list 'project-find-functions #'wcx/find-projectile-project)
  (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

  (define-key eglot-mode-map (kbd "C-c h") 'eglot-help-at-point)
  (define-key eglot-mode-map (kbd "S-<f6>") 'eglot-rename)
  (define-key eglot-mode-map (kbd "C-<f4>") 'eglot-code-actions)
  :hook ((python-mode java-mode bash-mode lua-mode ruby-mode rust-mode) . wcx/activate-lsp))

(provide 'wcx-lsp)

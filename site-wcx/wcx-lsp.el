(use-package lsp-mode
  :commands lsp
  :init
  (setq lsp-auto-guess-root t)
  (setq lsp-prefer-flymake nil)
  :config
  (require 'lsp-clients)
  (add-hook 'prog-mode-hook (lambda () (flymake-mode -1)))
  (define-key lsp-mode-map (kbd "S-<f6>") 'lsp-rename)
  (defun wcx/activate-lsp ()
    (ycmd-mode -1)
    (lsp))

  (with-eval-after-load 'lsp-pyls
    (setq lsp-pyls-plugins-pyls_mypy-live-mode nil))
  :hook ((python-mode java-mode bash-mode lua-mode ruby-mode) . wcx/activate-lsp))


(use-package lsp-ui
  :after lsp-mode
  :diminish
  :commands lsp-ui-mode
  :custom-face
  (lsp-ui-doc-background ((t (:background nil))))
  (lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))))
  :bind (:map lsp-ui-mode-map
              ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
              ([remap xref-find-references] . lsp-ui-peek-find-references)
              ("C-c u" . lsp-ui-imenu))
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-header t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'top)
  (lsp-ui-doc-border (face-foreground 'default))
  (lsp-ui-sideline-enable nil)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions nil)
  :config
  ;; Use lsp-ui-doc-webkit only in GUI
  (setq lsp-ui-doc-use-webkit nil)
  ;; WORKAROUND Hide mode-line of the lsp-ui-imenu buffer
  ;; https://github.com/emacs-lsp/lsp-ui/issues/243
  (defadvice lsp-ui-imenu (after hide-lsp-ui-imenu-mode-line activate)
    (setq mode-line-format nil)))

;; (use-package lsp-ui
;;   :after lsp
;;   :defer t
;;   :commands lsp-ui-mode)

(use-package company-lsp
  :after lsp-mode
  :commands company-lsp
  :init
  (setq company-lsp-async t)
  (setq company-lsp-enable-recompletion t)
  (setq company-lsp-enable-snippet t )
  :config
  (push 'company-lsp company-backends))

(use-package lsp-java
  :after lsp-mode
  :defer t)

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

;; (use-package eglot
;;   :ensure t
;;   :config
;;   (defun wcx/activate-lsp ()
;;     (eglot-ensure))

;;   (defun wcx/find-projectile-project (dir)
;;     (if (fboundp 'projectile-project-root)
;;         (let ((root (projectile-project-root dir)))
;;           (and root (cons 'transient root)))))

;;   ;; Integrate project.el with projectile
;;   (add-to-list 'project-find-functions #'wcx/find-projectile-project)
;;   (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

;;   (define-key eglot-mode-map (kbd "C-c h") 'eglot-help-at-point)
;;   (define-key eglot-mode-map (kbd "S-<f6>") 'eglot-rename)
;;   (define-key eglot-mode-map (kbd "C-<f4>") 'eglot-code-actions)
;;   :hook ((python-mode java-mode bash-mode lua-mode ruby-mode rust-mode) . wcx/activate-lsp))

(provide 'wcx-lsp)

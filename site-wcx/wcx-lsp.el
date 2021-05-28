(defvar wcx/lsp-provider)

(when (string-equal wcx/lsp-provider "lsp-mode")
  (use-package lsp-mode
    :commands lsp
    :init
    (setq lsp-auto-guess-root t)
    (setq lsp-prefer-flymake nil)
    :config
    (add-hook 'prog-mode-hook (lambda () (flymake-mode -1)))
    (define-key lsp-mode-map (kbd "S-<f6>") 'lsp-rename)
    (defun wcx/activate-lsp ()
      (when (equal major-mode 'python-mode)
        (require 'lsp-pyright))
      (lsp))

    ;; (with-eval-after-load 'lsp-pyls
    ;;   (setq lsp-pyls-plugins-pyls_mypy-live-mode nil))

    ;; (defun lsp-set-cfg ()
    ;;   (let ((lsp-cfg `(:pyls (:plugins (:pyls_mypy (:live_mode nil))))))
    ;;     (lsp--set-configuration lsp-cfg)))

    ;; (add-hook 'lsp-after-initialize-hook 'lsp-set-cfg)
    :hook ((python-mode java-mode bash-mode lua-mode ruby-mode js2-mode typescript-mode) . wcx/activate-lsp))

  (use-package lsp-pyright
    :ensure t
    :after lsp-mode
    :init
    (when (executable-find "python3")
      (setq lsp-pyright-python-executable-cmd "python3"))
    (setq lsp-enable-file-watchers t)
    (setq lsp-file-watch-threshold 2500)
    (setq lsp-pyright-venv-path (expand-file-name "~/.pyenv/versions/"))
    (setq lsp-pyright-venv-directory (expand-file-name "~/.pyenv/versions/")))

  (use-package lsp-ui
    :after lsp-mode
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

  (use-package company-lsp
    :defer t
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

  (use-package lsp-ivy
    :bind ("<f1>" . lsp-ivy-global-workspace-symbol))

  (use-package dap-mode
    :ensure t
    :defer 10
    :config
    (dap-auto-configure-mode)
    (require 'dap-java)
    (require 'dap-python)
    (add-hook 'dap-stopped-hook
              (lambda (arg) (call-interactively #'dap-hydra)))))

(when (string-equal wcx/lsp-provider "eglot")
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
    ;; (add-hook 'eglot--managed-mode-hook (lambda () (flymake-mode -1)))

    (define-key eglot-mode-map (kbd "C-c h") 'eglot-help-at-point)
    (define-key eglot-mode-map (kbd "S-<f6>") 'eglot-rename)
    (define-key eglot-mode-map (kbd "C-<f4>") 'eglot-code-actions)
    :hook ((python-mode java-mode bash-mode lua-mode ruby-mode rust-mode) . wcx/activate-lsp)))

(provide 'wcx-lsp)

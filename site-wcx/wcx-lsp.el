(use-package lsp-mode
    :config
    (add-hook 'prog-mode-hook 'lsp-mode))

(use-package company-lsp
  :ensure t
  :config
  (push 'company-lsp company-backends))

(use-package lsp-ui
  :ensure t
  :config (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-python
  :ensure t
  :config (add-hook 'python-mode-hook #'lsp-python-enable))

(provide 'wcx-lsp)

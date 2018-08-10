;;; wcx-go --- Go stuff
;;; Commentary:

;;; Code:
(use-package "go-mode"
  :ensure t
  :mode "\\.go\\'"
  :interpreter "go"
  :config
  (add-hook 'before-save-hook 'gofmt-before-save))

;; (use-package "go-autocomplete"
;;   :ensure t
;;   :bind (["M-return" ac-mode-map auto-complete])

(use-package "go-eldoc"
  :ensure t
  :config
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package "company-go")

(use-package "go-snippets"
  :ensure t)

(use-package godoctor
    :ensure t)

(use-package go-guru
    :ensure t)

(provide 'wcx-go)
;;; wcx-go.el ends here

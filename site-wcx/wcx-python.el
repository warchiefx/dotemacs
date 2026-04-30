;;; wcx-python.el --- Python development -*- lexical-binding: t -*-
;;; Commentary:
;; uv + ruff + pyright (via eglot, configured in wcx-lsp.el).
;; .py files open in python-ts-mode (tree-sitter); the Python tooling here
;; piggybacks on the python-mode-hook chain that python-ts-mode inherits.
;;; Code:

(defvar wcx/lsp-provider)
(defvar wcx/checker)

;; ---------------------------------------------------------------------------
;; Major mode mapping
;; ---------------------------------------------------------------------------

(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

;; ---------------------------------------------------------------------------
;; Per-project venv (uv)
;; ---------------------------------------------------------------------------

(use-package uv-mode
  :ensure t
  :hook ((python-mode    . uv-mode-auto-activate-hook)
         (python-ts-mode . uv-mode-auto-activate-hook)))

;; ---------------------------------------------------------------------------
;; Formatting (ruff) and linting (ruff via flycheck, see wcx-checking)
;; ---------------------------------------------------------------------------

(use-package ruff-format
  :ensure t
  :hook ((python-mode    . ruff-format-on-save-mode)
         (python-ts-mode . ruff-format-on-save-mode))
  :bind ([?\C-c ?\C-x ?a] . ruff-format-buffer))

(use-package py-isort
  :ensure t
  :defer t
  :commands (py-isort-buffer py-isort-region))

;; ---------------------------------------------------------------------------
;; Editing helpers
;; ---------------------------------------------------------------------------

(use-package python-docstring
  :ensure t
  :diminish python-docstring-mode
  :hook ((python-mode    . python-docstring-mode)
         (python-ts-mode . python-docstring-mode)))

(use-package smart-dash
  :ensure t
  :defer t
  :hook ((python-mode    . smart-dash-mode)
         (python-ts-mode . smart-dash-mode)))

;; Use ipython as the inferior shell when available.
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "--simple-prompt"))

;; ---------------------------------------------------------------------------
;; Other Python file types
;; ---------------------------------------------------------------------------

(use-package pip-requirements
  :ensure t
  :defer t
  :init
  (add-hook 'pip-requirements-mode-hook
            (lambda () (setq-local completion-ignore-case t))))

;; ---------------------------------------------------------------------------
;; Tests, navigation, tags
;; ---------------------------------------------------------------------------

(use-package python-pytest
  :ensure t
  :commands python-pytest-popup
  :bind ("C-c C-x t" . python-pytest-popup))

(use-package ggtags
  :ensure t
  :defer t
  :hook ((python-mode    . ggtags-mode)
         (python-ts-mode . ggtags-mode)))

;; ---------------------------------------------------------------------------
;; Per-buffer setup and per-mode hydra
;; ---------------------------------------------------------------------------

(defun wcx/python-mode-setup ()
  "Per-buffer Python configuration."
  (setq font-lock-maximum-decoration t)
  (when (string-equal wcx/checker "flycheck")
    (setq-local flycheck-checker 'python-ruff
                flycheck-checker-error-threshold 900)))

(add-hook 'python-mode-hook    #'wcx/python-mode-setup)
(add-hook 'python-ts-mode-hook #'wcx/python-mode-setup)

(defun wcx/python-restart-lsp ()
  "Reconnect the active LSP for this buffer (eglot or lsp-mode)."
  (interactive)
  (if (string-equal wcx/lsp-provider "eglot")
      (call-interactively #'eglot-reconnect)
    (call-interactively #'lsp-restart-workspace)))

(major-mode-hydra-define python-ts-mode (:title "Python")
  ("Nav"
   (("n" python-nav-forward-defun  "next defun" :exit nil)
    ("p" python-nav-backward-defun "prev defun" :exit nil))
   "Errors"
   (("<" flycheck-previous-error "prev" :exit nil)
    (">" flycheck-next-error     "next" :exit nil)
    ("l" flycheck-list-errors    "list"))
   "LSP"
   (("r" wcx/python-restart-lsp "restart"))
   "Env"
   (("a" uv-mode-set   "uv-activate"   :exit nil)
    ("d" uv-mode-unset "uv-deactivate" :exit nil)
    ("s" run-python    "pyshell"))
   "Tools"
   (("f" ruff-format-buffer  "reformat")
    ("c" whitespace-cleanup  "clean whitespace")
    ("i" py-isort-buffer     "sort imports"))
   "Test"
   (("t" python-pytest-popup "pytest..."))))

(provide 'wcx-python)
;;; wcx-python.el ends here

;;; wcx-lsp.el --- LSP support (eglot or lsp-mode) -*- lexical-binding: t -*-
;;; Commentary:
;; Two providers, picked by `wcx/lsp-provider' (set in dotemacs.el).
;; Default is "eglot" — built-in, fast, low-config.
;; Switch to "lsp-mode" when you need lsp-ui sideline/peek or dap-mode.
;;; Code:

(defvar wcx/lsp-provider)

;; ---------------------------------------------------------------------------
;; Shared helpers
;; ---------------------------------------------------------------------------

(defun wcx/find-projectile-project (dir)
  "Return the projectile project root for DIR as a project.el project."
  (when (fboundp 'projectile-project-root)
    (when-let ((root (projectile-project-root dir)))
      (cons 'transient root))))

;; ---------------------------------------------------------------------------
;; lsp-mode branch
;; ---------------------------------------------------------------------------

(when (string-equal wcx/lsp-provider "lsp-mode")
  (use-package lsp-mode
    :ensure t
    :commands lsp
    :init
    (setq lsp-auto-guess-root t
          lsp-prefer-flymake nil
          lsp-keymap-prefix "C-c l")
    :config
    (defun wcx/activate-lsp () (lsp))
    (define-key lsp-mode-map (kbd "S-<f6>") #'lsp-rename)
    :hook ((python-mode python-ts-mode java-mode java-ts-mode
            bash-mode lua-mode ruby-mode
            js2-mode typescript-mode typescript-ts-mode tsx-ts-mode)
           . wcx/activate-lsp))

  (use-package lsp-pyright
    :ensure t
    :after lsp-mode
    :init
    (setq lsp-enable-file-watchers t
          lsp-file-watch-threshold 2500
          lsp-pyright-auto-import-completions t
          lsp-pyright-use-library-code-for-types t
          lsp-pyright-auto-search-paths t
          lsp-pyright-multi-root nil))

  (use-package lsp-ui
    :ensure t
    :after lsp-mode
    :commands lsp-ui-mode
    :bind (:map lsp-ui-mode-map
                ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
                ([remap xref-find-references]  . lsp-ui-peek-find-references)
                ("C-c u" . lsp-ui-imenu))
    :custom
    (lsp-ui-doc-enable t)
    (lsp-ui-doc-header t)
    (lsp-ui-doc-include-signature t)
    (lsp-ui-doc-position 'top)
    (lsp-ui-doc-use-webkit nil)
    (lsp-ui-sideline-enable nil)
    (lsp-ui-sideline-ignore-duplicate t))

  (use-package lsp-java :ensure t :after lsp-mode :defer t)

  (use-package consult-lsp
    :ensure t
    :after lsp-mode
    :bind (:map lsp-mode-map
                ("<f1>" . consult-lsp-symbols)
                ("M-g e" . consult-lsp-diagnostics)))

  (use-package dap-mode
    :ensure t
    :defer 10
    :config
    (dap-auto-configure-mode)
    (require 'dap-java)
    (require 'dap-python)
    (add-hook 'dap-stopped-hook
              (lambda (_arg) (call-interactively #'dap-hydra)))))

;; ---------------------------------------------------------------------------
;; eglot branch (default)
;; ---------------------------------------------------------------------------

(when (string-equal wcx/lsp-provider "eglot")
  (use-package eglot
    :ensure t
    :init
    ;; Snappier hover docs and completion; quieter event log.
    (setq eldoc-idle-delay 0.2
          eglot-events-buffer-size 0
          eglot-send-changes-idle-time 0.3
          eglot-autoshutdown t)
    :config
    (defun wcx/activate-lsp () (eglot-ensure))

    ;; Use projectile's notion of project root.
    (add-to-list 'project-find-functions #'wcx/find-projectile-project)

    ;; Inlay hints (parameter names, inferred types) where supported.
    (when (fboundp 'eglot-inlay-hints-mode)
      (add-hook 'eglot-managed-mode-hook #'eglot-inlay-hints-mode))

    ;; uv projects keep their venv at <project>/.venv. Setting venvPath="."
    ;; + venv=".venv" tells pyright to resolve it relative to each workspace
    ;; root, so imports installed by `uv sync' are visible.
    (setq-default eglot-workspace-configuration
                  '(:python (:venvPath "." :venv ".venv")
                    :pyright (:useLibraryCodeForTypes t
                              :reportMissingImports "warning"
                              :autoImportCompletions t)))

    (pretty-hydra-define wcx/eglot-hydra
      (:title "Eglot" :color teal :quit-key "q")
      ("Edit"
       (("f" eglot-format-buffer                   "format buffer")
        ("a" eglot-code-actions                    "code actions")
        ("r" eglot-rename                          "rename")
        ("o" eglot-code-action-organize-imports    "organize imports"))
       "Navigate"
       (("." xref-find-definitions                 "definition")
        ("?" xref-find-references                  "references")
        ("i" eglot-find-implementation             "implementation")
        ("t" eglot-find-typeDefinition             "type definition"))
       "Docs"
       (("h" eldoc-box-help-at-point               "hover popup")
        ("d" eldoc-doc-buffer                      "doc buffer"))
       "Server"
       (("R" eglot-reconnect                       "reconnect")
        ("Q" eglot-shutdown                        "shutdown")
        ("e" eglot-events-buffer                   "events log"))))

    (define-key eglot-mode-map (kbd "C-c l")    #'wcx/eglot-hydra/body)
    (define-key eglot-mode-map (kbd "C-c h")    #'eldoc-box-help-at-point)
    (define-key eglot-mode-map (kbd "C-c C-d")  #'eldoc-doc-buffer)
    (define-key eglot-mode-map (kbd "S-<f6>")   #'eglot-rename)
    (define-key eglot-mode-map (kbd "C-<f4>")   #'eglot-code-actions)
    (define-key eglot-mode-map (kbd "M-RET")    #'eglot-code-actions)
    :hook ((python-ts-mode . wcx/activate-lsp)
           (python-mode    . wcx/activate-lsp)
           (prog-mode      . wcx/activate-lsp)
           (python-ts-mode . flyspell-prog-mode)))

  ;; Hover documentation in a child-frame popup, replacing the cramped echo
  ;; area display. Triggers automatically when the cursor rests on a symbol.
  (use-package eldoc-box
    :ensure t
    :diminish eldoc-box-hover-mode
    :hook (eglot-managed-mode . eldoc-box-hover-mode)
    :custom
    (eldoc-box-only-multi-line t)
    (eldoc-box-clear-with-C-g t)
    (eldoc-box-max-pixel-width 720)
    (eldoc-box-max-pixel-height 480)))

(provide 'wcx-lsp)
;;; wcx-lsp.el ends here

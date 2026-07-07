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
    ;; Snappier hover docs and completion. Keep a small events log so we
    ;; can inspect crashes via `M-x eglot-events-buffer'.
    (setq eldoc-idle-delay 0.2
          eglot-events-buffer-size 200000
          eglot-send-changes-idle-time 0.3
          eglot-autoshutdown t
          ;; Pyright registers `**' watchers on init. On large monorepos
          ;; (Django/finally-style trees with .venv + .git + node_modules)
          ;; that registration trips macOS's per-process kqueue/fd limit
          ;; and eglot returns -32603 to the registerCapability request,
          ;; which pyright then handles by giving up on workspace
          ;; analysis. Increase eglot's wait window for sync requests so
          ;; the watcher walk has time to finish.
          eglot-connect-timeout 60
          eglot-sync-connect 3)
    :config
    (defun wcx/activate-lsp () (eglot-ensure))

    ;; Use projectile's notion of project root.
    (add-to-list 'project-find-functions #'wcx/find-projectile-project)

    ;; Python LSP. ty is Astral's Rust-based type checker and language server;
    ;; basedpyright is the actively-maintained pyright fork;
    ;; pylsp is the conservative fallback (jedi-based, no watchers, runs
    ;; from the venv). Toggle via `wcx/python-lsp' below.
    (defvar wcx/python-lsp 'ty
      "Which Python LSP eglot should use: `ty', `basedpyright', or `pylsp'.
After changing, re-open the Python buffer (or `eglot-shutdown' + reopen).")

    (add-to-list 'eglot-server-programs
                 `((python-mode python-ts-mode)
                   . ,(pcase wcx/python-lsp
                        ('basedpyright '("basedpyright-langserver" "--stdio"))
                        ('ty           '("ty" "server"))
                        (_             '("pylsp")))))

    ;; Inlay hints (parameter names, inferred types) where supported.
    (when (fboundp 'eglot-inlay-hints-mode)
      (add-hook 'eglot-managed-mode-hook #'eglot-inlay-hints-mode))

    ;; Workspace config — computed per-project so the active Python LSP
    ;; (pylsp or basedpyright) gets pointed at the project's uv-managed
    ;; .venv, ensuring jedi/pyright introspect the right package set.
    ;; Brew-installed pylsp otherwise sees only brew's site-packages,
    ;; which is useless for project-specific imports.
    (defun wcx/find-project-venv ()
      "Return the absolute path to the project's `.venv' directory, or nil.
Looks first at projectile/project.el's notion of project root, then
falls back to the closest `.venv' anywhere up the tree."
      (let* ((root (or (and (fboundp 'projectile-project-root)
                            (ignore-errors (projectile-project-root)))
                       (when-let ((proj (project-current)))
                         (project-root proj))))
             (candidate (when root (expand-file-name ".venv" root))))
        (cond
         ((and candidate (file-directory-p candidate)) candidate)
         ((locate-dominating-file default-directory ".venv")
          (expand-file-name ".venv" (locate-dominating-file
                                     default-directory ".venv"))))))

    (defun wcx/eglot-python-workspace-config (_server)
      "Per-project Python LSP workspace settings. Injects the active
project's `.venv' so pylsp/basedpyright introspect the right packages.

jsonrpc's encoder serializes Lisp `nil' as JSON null (see
`jsonrpc--json-encode'), so use nil — not `:json-null' — for absent
values. `:json-null' would be rejected by `json-serialize' as an
unknown symbol."
      (let* ((venv (wcx/find-project-venv))
             (venv-python (when venv (expand-file-name "bin/python" venv)))
             (venv-parent (when venv (file-name-directory
                                      (directory-file-name venv))))
             (venv-leaf   (when venv (file-name-nondirectory
                                      (directory-file-name venv))))
             (jedi-extras (if venv
                              (vector (expand-file-name "src" venv-parent))
                            [])))
        `(:python
          (:pythonPath ,venv-python
           :venvPath ,venv-parent
           :venv ,venv-leaf
           :analysis (:useLibraryCodeForTypes t
                      :autoImportCompletions t
                      :diagnosticMode "openFilesOnly"
                      :typeCheckingMode "basic"
                      :inlayHints (:variableTypes t
                                   :functionReturnTypes t
                                   :callArgumentNames t)))
          :basedpyright
          (:analysis (:diagnosticMode "openFilesOnly"
                      :typeCheckingMode "basic"))
          :pylsp
          (:plugins
           (:jedi (:environment ,venv
                   :extra_paths ,jedi-extras)
            :jedi_completion (:enabled t :fuzzy t :include_params t :include_class_objects t)
            :jedi_definition (:enabled t :follow_imports t :follow_builtin_imports t)
            :jedi_hover (:enabled t)
            :jedi_references (:enabled t)
            :jedi_signature_help (:enabled t)
            :jedi_symbols (:enabled t :all_scopes t)
            :pyflakes (:enabled :json-false)
            :pylint (:enabled :json-false)
            :pycodestyle (:enabled :json-false)
            :pydocstyle (:enabled :json-false)
            :mccabe (:enabled :json-false)
            :rope_completion (:enabled :json-false)
            :rope_autoimport (:enabled :json-false))))))

    (setq-default eglot-workspace-configuration
                  #'wcx/eglot-python-workspace-config)

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
    (eldoc-box-max-pixel-height 480))

  ;; Single diagnostics UI: flycheck. Bridge eglot's diagnostics into
  ;; flycheck (so pyright/typescript-language-server errors show up in the
  ;; same UI as ruff/eslint), then suppress the flymake instance eglot
  ;; turns on by default.
  (when (string-equal wcx/checker "flycheck")
    (use-package flycheck-eglot
      :ensure t
      :after (flycheck eglot)
      :custom
      ;; nil = combine eglot diagnostics WITH native flycheck checkers;
      ;; t (default) replaces them.
      (flycheck-eglot-exclusive nil)
      :config (global-flycheck-eglot-mode 1))

    (add-hook 'eglot-managed-mode-hook
              (lambda () (when (bound-and-true-p flymake-mode)
                           (flymake-mode -1))))))

(provide 'wcx-lsp)
;;; wcx-lsp.el ends here

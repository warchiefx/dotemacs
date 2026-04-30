;;; wcx-webdev.el --- Web development (React/TS, REST) -*- lexical-binding: t -*-
;;; Commentary:
;; Frontend stack: tree-sitter modes for TS/JS/TSX/JSON, eglot for LSP
;; (typescript-language-server), prettier for formatting, web-mode/emmet
;; for templates. REST testing via restclient.
;;
;; Tree-sitter grammars are required for the *-ts-mode entries. Install
;; per-language with M-x treesit-install-language-grammar (typescript,
;; tsx, javascript, json).
;;; Code:

(defvar wcx/lsp-provider)

;; ---------------------------------------------------------------------------
;; Major modes (tree-sitter, all built-in)
;; ---------------------------------------------------------------------------

(use-package typescript-ts-mode
  :ensure nil
  :mode (("\\.ts\\'"  . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode)
         ("\\.jsx\\'" . tsx-ts-mode))
  :config
  (setq typescript-ts-mode-indent-offset 2))

(use-package js-ts-mode
  :ensure nil
  :mode "\\.\\(js\\|mjs\\|cjs\\)\\'"
  :config
  (setq js-indent-level 2))

(use-package json-ts-mode
  :ensure nil
  :mode "\\.json\\'")

(use-package web-mode
  :ensure t
  :mode "\\.\\(html?\\|hbs\\|svelte\\|ejs\\)\\'"
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-pairing nil
        web-mode-enable-auto-closing t
        web-mode-enable-current-element-highlight t))

(use-package scss-mode
  :ensure t
  :defer t
  :mode "\\.scss\\'")

;; ---------------------------------------------------------------------------
;; Editing helpers
;; ---------------------------------------------------------------------------

(use-package emmet-mode
  :ensure t
  :diminish emmet-mode
  :hook ((sgml-mode css-mode web-mode tsx-ts-mode) . emmet-mode)
  :config
  (setq emmet-expand-jsx-className? t))

;; Prettier — picks up .prettierrc from the project, runs on save.
(use-package prettier-js
  :ensure t
  :diminish prettier-js-mode
  :hook ((typescript-ts-mode tsx-ts-mode js-ts-mode web-mode css-mode scss-mode)
         . prettier-js-mode))

;; Make project-local node_modules/.bin available, so prettier, eslint,
;; and typescript-language-server resolve to the project's pinned versions.
(use-package add-node-modules-path
  :ensure t
  :hook ((typescript-ts-mode tsx-ts-mode js-ts-mode web-mode)
         . add-node-modules-path))

(use-package jest-test-mode
  :ensure t
  :defer t
  :diminish jest-test-mode
  :hook ((typescript-ts-mode tsx-ts-mode js-ts-mode) . jest-test-mode))

;; ---------------------------------------------------------------------------
;; REST testing
;; ---------------------------------------------------------------------------

(use-package restclient
  :ensure t
  :mode ("\\.http\\'" . restclient-mode)
  :mode-hydra
  (restclient-mode
   ("Nav"
    (("n" restclient-jump-next         "next"     :exit nil)
     ("p" restclient-jump-prev         "previous" :exit nil)
     ("N" restclient-narrow-to-current "narrow")
     ("W" widen                        "widen")
     ("q" nil                          "quit"))
    "Send"
    (("s" restclient-http-send-current-stay-in-window "send"        :exit nil)
     ("S" restclient-http-send-current                "send + jump")
     ("r" restclient-http-send-current-raw            "send raw"))
    "Misc"
    (("w" restclient-copy-curl-command "copy curl")
     ("m" restclient-mark-current      "mark")))))

(use-package restclient-jq
  :ensure t
  :after restclient)

;; ---------------------------------------------------------------------------
;; Hydras for the editor modes
;; ---------------------------------------------------------------------------

(defun wcx/web-restart-lsp ()
  "Reconnect the active LSP for this buffer."
  (interactive)
  (if (string-equal wcx/lsp-provider "eglot")
      (call-interactively #'eglot-reconnect)
    (call-interactively #'lsp-restart-workspace)))

(major-mode-hydra-define typescript-ts-mode (:title "TypeScript")
  ("Errors"
   (("<" flycheck-previous-error "prev" :exit nil)
    (">" flycheck-next-error     "next" :exit nil)
    ("l" flycheck-list-errors    "list"))
   "LSP"
   (("r" wcx/web-restart-lsp "restart"))
   "Tools"
   (("f" prettier-js "reformat"))))

(major-mode-hydra-define tsx-ts-mode (:title "TSX")
  ("Errors"
   (("<" flycheck-previous-error "prev" :exit nil)
    (">" flycheck-next-error     "next" :exit nil)
    ("l" flycheck-list-errors    "list"))
   "LSP"
   (("r" wcx/web-restart-lsp "restart"))
   "Tools"
   (("f" prettier-js "reformat"))))

(major-mode-hydra-define js-ts-mode (:title "JavaScript")
  ("Errors"
   (("<" flycheck-previous-error "prev" :exit nil)
    (">" flycheck-next-error     "next" :exit nil)
    ("l" flycheck-list-errors    "list"))
   "LSP"
   (("r" wcx/web-restart-lsp "restart"))
   "Tools"
   (("f" prettier-js "reformat"))))

(provide 'wcx-webdev)
;;; wcx-webdev.el ends here

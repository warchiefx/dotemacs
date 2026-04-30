;;; wcx-java.el --- Java setup -*- lexical-binding: t -*-
;;; Commentary:
;; Java tooling. LSP support comes from eglot+jdtls (configured in
;; wcx-lsp.el), which handles definitions, completion, refactoring,
;; and diagnostics. Install jdtls separately, e.g. `brew install jdtls'.
;;; Code:

(use-package java-ts-mode
  :ensure nil
  :mode "\\.java\\'"
  :config
  (setq-default java-ts-mode-indent-offset 4))

;; Decode .class bytecode into readable disassembly.
(use-package autodisass-java-bytecode
  :ensure t
  :defer t)

(provide 'wcx-java)
;;; wcx-java.el ends here

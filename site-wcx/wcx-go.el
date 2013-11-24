;;; wcx-go --- Go stuff
;;; Commentary:

;;; Code:

(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))
(when (locate-library "go-mode")
  (unless (package-installed-p 'go-autocomplete)
    (package-install 'go-autocomplete))
  (unless (package-installed-p 'go-eldoc)
    (package-install 'go-autocomplete))
  (unless (package-installed-p 'go-snippets)
    (package-install 'go-autocomplete))

  (require 'go-autocomplete)
  (require 'auto-complete-config)
  (define-key ac-mode-map [M-return] 'auto-complete)
  (require 'go-eldoc)
  (add-hook 'go-mode-hook 'go-eldoc-setup)
  (require 'go-snippets))

(provide 'wcx-go)
;;; wcx-go.el ends here

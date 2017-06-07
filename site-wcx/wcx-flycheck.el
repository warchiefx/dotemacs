;;; wcx-flycheck.el -- Flycheck config

;;; Code:

(use-package "flycheck"
  :ensure t
  :config
  (setq-default
   flycheck-check-syntax-automatically '(save mode-enabled)
   flycheck-disabled-checkers '(emacs-lisp-checkdoc)
   flycheck-display-errors-delay .3)
  (global-flycheck-mode 1)
  :diminish flycheck-mode)

(provide 'wcx-flycheck)
;;; wcx-flycheck ends here

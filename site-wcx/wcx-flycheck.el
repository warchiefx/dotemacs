;;; wcx-flycheck.el -- Flycheck config

;;; Code:

(use-package "flycheck"
  :ensure t
  :config
  (global-flycheck-mode 1)
  :diminish flycheck-mode)

(provide 'wcx-flycheck)
;;; wcx-flycheck ends here

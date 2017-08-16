;;; wcx-flycheck.el -- Flycheck config

;;; Code:

(declare-function python-shell-calculate-exec-path "python")

(defun flycheck-virtualenv-executable-find (executable)
  "Find an EXECUTABLE in the current virtualenv if any."
  (if (bound-and-true-p python-shell-virtualenv-root)
      (let ((exec-path (python-shell-calculate-exec-path)))
        (executable-find executable))
    (executable-find executable)))

(defun flycheck-virtualenv-setup ()
  "Setup Flycheck for the current virtualenv."
  (setq-local flycheck-executable-find #'flycheck-virtualenv-executable-find))

(use-package "flycheck"
  :ensure t
  :config
  (setq-default
   ;; flycheck-check-syntax-automatically '(save mode-enabled)
   flycheck-disabled-checkers '(emacs-lisp-checkdoc)
   flycheck-display-errors-delay .3)
  (global-flycheck-mode 1)
  (add-hook 'python-mode-hook #'flycheck-virtualenv-setup)
  (add-hook 'python-mode-hook (lambda ()
                               (setq flycheck-checker 'python-pylint
                                     flycheck-checker-error-threshold 900
                                     flycheck-pylintrc "~/.pylintrc")))

  :diminish flycheck-mode)

(use-package flycheck-popup-tip
  :ensure t
  :after flycheck
  :config
  (add-hook 'flycheck-mode-hook 'flycheck-popup-tip-mode))

(provide 'wcx-flycheck)
;;; wcx-flycheck ends here

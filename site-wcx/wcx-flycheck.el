;;; wcx-flycheck.el -- Flycheck config

;;; Code:

(declare-function python-shell-calculate-exec-path "python")

(defun flycheck-virtualenv-executable-find (executable)
  "Find an EXECUTABLE in the current virtualenv if any."
  (if (bound-and-true-p python-shell-virtualenv-root)
      (let ((exec-path (python-shell-calculate-exec-path)))
        (executable-find executable))
    (executable-find executable)))

(use-package "flycheck"
  :ensure t
  :config
  (setq-default
   flycheck-check-syntax-automatically '(save mode-enabled idle-change)
   flycheck-idle-change-delay 1
   flycheck-disabled-checkers '(emacs-lisp-checkdoc))
  (global-flycheck-mode 1)
  ;; (add-hook 'python-mode-hook (lambda ()
  ;;                              (setq flycheck-checker 'python-pylint
  ;;                                    flycheck-checker-error-threshold 900

  :diminish flycheck-mode)

(use-package flycheck-posframe
  :ensure t
  :after flycheck
  :config
  (flycheck-posframe-configure-pretty-defaults)
  (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode))

(provide 'wcx-flycheck)
;;; wcx-flycheck ends here

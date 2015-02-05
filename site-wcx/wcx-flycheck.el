;;; wcx-flycheck.el -- Flycheck config

;;; Code:
(when (locate-library "flycheck")
  (load-library "flycheck")
  (add-hook 'after-init-hook #'global-flycheck-mode)

  ;; (when (locate-library "flycheck-pos-tip")
  ;;   (load-library "flycheck-pos-tip")
  ;;   (eval-after-load 'flycheck
  ;;     '(custom-set-variables
  ;;       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))))
  )

(provide 'wcx-flycheck)
;;; wcx-flycheck ends here

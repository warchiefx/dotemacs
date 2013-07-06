
(when (locate-library "flycheck")
  (load-library "flycheck")
  (add-hook 'after-init-hook #'global-flycheck-mode))

(provide 'wcx-flycheck)

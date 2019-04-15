;; wcx-color-theme.el --- Color themes

(use-package kaolin-themes
  :ensure t
  :config
  (setq kaolin-themes-modeline-border nil)
  (load-theme 'kaolin-aurora)
  (kaolin-treemacs-theme))

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   (setq doom-themes-enable-bold t)
;;   (load-theme 'doom-city-lights)
;;   (doom-themes-visual-bell-config)
;;   (doom-themes-neotree-config)
;;   (doom-themes-org-config))

;; Favorite light theme
;; (use-package flucui-themes
;;   :ensure t
;;   :config
;;   (flucui-themes-load-style 'light))

;; (use-package theme-changer
;;   :ensure t
;;   :config
;;   (setq calendar-location-name "Santo Domingo, DO")
;;   (setq calendar-latitude 18.486058)
;;   (setq calendar-longitude -69.931212)
;;   (change-theme 'kaolin-mono-dark 'kaolin-aurora))

(defadvice load-theme (before clear-previous-themes activate)
  "Clear existing theme settings instead of layering them"
  (mapc #'disable-theme custom-enabled-themes))

(use-package color-identifiers-mode
  :ensure t
  :diminish color-identifiers-mode
  :config
  (add-hook 'after-init-hook 'global-color-identifiers-mode))

;; (use-package rainbow-identifiers
;;   :ensure t
;;   :config
;;   (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))


(provide 'wcx-color-theme)

;;; wcx-color-theme.el ends here

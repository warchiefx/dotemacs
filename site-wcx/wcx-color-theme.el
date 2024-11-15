;; wcx-color-theme.el --- Color themes

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;; Disable all themes before continuing
(mapcar 'disable-theme
    custom-enabled-themes)

(defadvice load-theme (before clear-previous-themes activate)
  "Clear existing theme settings instead of layering them"
  (mapc #'disable-theme custom-enabled-themes))

;; (use-package zerodark-theme
;;   :ensure t
;;   :config
;;   (load-theme 'zerodark t)
;;   (zerodark-setup-modeline-format))

;; (use-package constant-theme
;;   :config
;;   (load-theme 'constant t))

;; (use-package wilmersdorf-theme
;;   :load-path "themes/"
;;   :config
;;   (load-theme 'wilmersdorf t))

;; (use-package minsk-theme
;;   :ensure t
;;   :config
;;   (load-theme 'minsk t))


;; (load-theme 'wombat t)
;; (use-package kaolin-themes
;;   :ensure t
;;   :config
;;   (setq kaolin-themes-modeline-border nil)
;;   (load-theme 'kaolin-aurora)
;;   (kaolin-treemacs-theme))

(use-package kanagawa-themes
  :ensure t
  :config
  (load-theme 'kanagawa-dragon))

;; (use-package nano-theme
;;   :ensure t
;;   :quelpa (nano-theme
;;            :fetcher github
;;            :repo "rougier/nano-theme")
;;   :config
;;   (nano-dark))

;; (use-package modus-vivendi-theme
;;   :ensure t
;;   :config
;;   (load-theme 'modus-vivendi))

;; (use-package tron-legacy-theme
;;   :load-path "themes/"
;;   :config (load-theme 'tron-legacy t))

;; (use-package darkokai-theme
;;   :ensure t
;;   :config
;;   (setq darkokai-mode-line-padding 1)
;;   (load-theme 'darkokai t))

;; (use-package madhat2r-theme
;;   :ensure t
;;   :init
;;   (custom-set-variables '(madhat2r-theme-custom-colors
;;                         '((act1 . "#000000")
;;                           (act2 . "#000000")
;;                           (border . "#000000")
;;                           (act1-term . "#000000")
;;                           (act2-term . "#000000")
;;                           (border-term . "#000000"))
;;                         ))
;;   :config
;;   (load-theme 'madhat2r t))

;; (use-package overcast-theme
;;   :ensure t
;;   :config
;;   (load-theme 'overcast t))

;; (use-package mood-one-theme
;;   :ensure t
;;   :config
;;   (load-theme 'mood-one t))

;; (use-package nord-theme
;;   :ensure t
;;   :config
;;   (setq nord-comment-brightness 15)
;;   (setq nord-region-highlight "snowstorm")
;;   (load-theme 'nord t))

;; (use-package doom-themes
;;   :ensure t
;;   :init
;;   (setq doom-themes-enable-bold t)
;;   :config
;;   (load-theme 'doom-horizon t)
;;   (doom-themes-visual-bell-config)
;;   (doom-themes-org-config))

;; (use-package berrys-theme
;;   :ensure t
;;   :config
;;   (load-theme 'berrys t)

;;   :config ;; for good measure and clarity
;;   (setq-default cursor-type '(bar . 2))
;;   (setq-default line-spacing 2))

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
;;   (change-theme 'flucui-light 'kaolin-aurora))

;; (use-package color-identifiers-mode
;;   :ensure t
;;   :diminish color-identifiers-mode
;;   :config
;;   (add-hook 'after-init-hook 'global-color-identifiers-mode))

;; (use-package rainbow-identifiers
;;   :ensure t
;;   :config
;;   (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))

(mapatoms (lambda (atom)
            (let ((underline nil))
              (when (and (facep atom)
                         (setq underline
                               (face-attribute atom
                                               :underline))
                         (eq (plist-get underline :style) 'wave))
                (plist-put underline :style 'line)
                (set-face-attribute atom nil
                                    :underline underline)))))

;;(use-package solaire-mode
;; :hook
;;  ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
;;  (minibuffer-setup . solaire-mode-in-minibuffer)
;;   :config
;;  (solaire-global-mode +1)
;;  (solaire-mode-swap-bg))

(provide 'wcx-color-theme)

;;; wcx-color-theme.el ends here

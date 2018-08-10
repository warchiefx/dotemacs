;; wcx-color-theme.el --- Color themes
;;
;; Filename: wcx-color-theme.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:51:19 2008
;;
;; Last-Updated: Wed Mar 24 10:45:39 2010 (-14400 -0400)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:

(use-package kaolin-themes
  :ensure t
  :defer t)

;; (use-package flatui-theme
;;   :ensure t)

;; (use-package tao-theme
;;   :ensure t)

;; (use-package nord-theme
;;   :ensure t
;;   :config
;;   (setq nord-comment-brightness 15)
;;   )

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t)
  ;; (load-theme 'doom-citylights)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-org-config))

(use-package theme-changer
  :ensure t
  :config
  (setq calendar-location-name "Santo Domingo, DO")
  (setq calendar-latitude 18.486058)
  (setq calendar-longitude -69.931212)
  (change-theme 'doom-one-light 'doom-city-lights))
(defadvice load-theme (before clear-previous-themes activate)
  "Clear existing theme settings instead of layering them"
  (mapc #'disable-theme custom-enabled-themes))

;; (use-package color-identifiers-mode
;;   :ensure t
;;   :config
;;   (add-hook 'after-init-hook 'global-color-identifiers-mode))

(use-package rainbow-identifiers
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'rainbow-identifiers-mode))


(provide 'wcx-color-theme)

;;; wcx-color-theme.el ends here

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

;; (use-package molokai-theme
;;   :ensure t
;;   :config
;;   (setq molokai-theme-kit t)
;;   (load-theme 'molokai))

;; (use-package kaolin-theme
;;   :ensure t
;;   :config (load-theme 'kaolin))

;; (use-package darkokai-theme
;;   :ensure t
;;   :config
;;   (setq darkokai-mode-line-padding 1)
;;   (load-theme 'darkokai t))

;; (use-package material-theme
;;   :ensure t
;;   :config
;;   (load-theme 'material t))

(use-package doom-themes
  :ensure t
  :config
  (setq doom-themes-enable-bold t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (load-theme 'doom-molokai))

(provide 'wcx-color-theme)
;;; wcx-color-theme.el ends here

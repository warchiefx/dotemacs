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
  :config (load-theme 'kaolin-aurora))

;; (use-package nord-theme
;;   :ensure t
;;   :config
;;   (setq nord-comment-brightness 15)
;;   (load-theme 'nord))

;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   (setq doom-themes-enable-bold t)
;;   (load-theme 'doom-one)
;;   (doom-themes-visual-bell-config)
;;   (doom-themes-neotree-config)
;;   (doom-themes-org-config))

(provide 'wcx-color-theme)

;;; wcx-color-theme.el ends here

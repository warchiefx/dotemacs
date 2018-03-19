;;; wcx-modeline.el -- Modeline customization
;;; Commentary:
;;; Code:

;; (use-package smart-mode-line
;;   :ensure t
;;   :init
;;   (setq sml/override-theme nil)
;;   (setq powerline-arrow-shape 'curve)
;;   :config
;;   (eval-after-load "wcx-evil"
;;     '(sml/setup)
;;     )
;;   (sml/apply-theme 'respectful))

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  ;;(spaceline-emacs-theme)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  (spaceline-info-mode)
  (spaceline-toggle-evil-state-on)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-toggle-projectile-root-on)
  (spaceline-toggle-version-control-on)
  (spaceline-toggle-buffer-position-off)
  (spaceline-toggle-hud-off)
  (spaceline-toggle-which-function-on))

(use-package all-the-icons
  :ensure t)

;; (use-package spaceline-all-the-icons
;;     :ensure t
;;     :after spaceline
;;     :config (spaceline-all-the-icons-theme)
;;     ;;(spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
;;     (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
;;     (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line
;;     (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
;;     (spaceline-toggle-all-the-icons-git-status-on)
;;     (spaceline-toggle-all-the-icons-dedicated-on)
;;     (spaceline-toggle-all-the-icons-bookmark-on)
;;     (spaceline-toggle-all-the-icons-git-ahead-on)
;;     (spaceline-toggle-all-the-icons-minor-modes-on)
;;     (spaceline-toggle-all-the-icons-which-function-on)
;;     (spaceline-toggle-all-the-icons-time-off)
;;     (spaceline-toggle-all-the-icons-window-number-on))

(provide 'wcx-modeline)
;;; wcx-modeline.el ends here

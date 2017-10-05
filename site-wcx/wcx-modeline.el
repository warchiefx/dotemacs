;;; wcx-modeline.el -- Modeline customization
;;; Commentary:
;;; Code:

;; (use-package smart-mode-line
;;   :ensure t
;;   :init
;;   (setq sml/override-theme nil)
;;   (setq powerline-arrow-shape 'curve)
;;   :config
;;   (eval-after-load "wcx-color-theme"
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
;;     (spaceline-toggle-all-the-icons-window-number-on)
;; )

;; Mode line setup
;; (setq-default
;;  mode-line-format
;;  '(; Position, including warning for 80 columns
;;    "["
;;    (:propertize "%4l:" face mode-line-position-face)
;;    (:eval (propertize "%3c" 'face
;;                       (if (>= (current-column) 120)
;;                           'mode-line-80col-face
;;                         'mode-line-position-face)))
;;                                         ; emacsclient [default -- keep?]
;;    "]"
;;    mode-line-client
;;    " "
;;                                         ; read-only or modified status
;;    (:eval
;;     (cond (buffer-read-only
;;            (propertize "R" 'face 'mode-line-read-only-face))
;;           ((buffer-modified-p)
;;            (propertize "*" 'face 'mode-line-modified-face))
;;           (t " ")))
;;                                         ; directory and buffer/file name
;;    (:eval (if (ignore-errors (projectile-project-root))
;;               (propertize (concat " <" (projectile-project-name) "> ") 'face 'mode-line-folder-face)
;;             (propertize (shorten-directory default-directory 30) 'face 'mode-line-folder-face)))

;;    (:propertize "%b"
;;                 face mode-line-filename-face)
;;                                         ; narrow [default -- keep?]
;;    "%n "
;;                                         ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
;;    " %["
;;    (:propertize mode-name
;;                 face mode-line-mode-face)
;;    "%] "
;;    (:propertize (vc-mode vc-mode) face mode-line-vc-face)
;;    " "
;;    (:eval (propertize (format-mode-line minor-mode-alist)
;;                       'face 'mode-line-minor-mode-face))
;;    (:propertize mode-line-process
;;                 face mode-line-process-face)

;;    " "
;;    (:propertize (global-mode-string global-mode-string)
;;                        face mode-line-mode-string-face)
;;    ))

;; ;; Helper function
;; (defun shorten-directory (dir max-length)
;;   "Show up to `MAX-LENGTH' characters of a directory name `DIR'."
;;   (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
;;         (output ""))
;;     (when (and path (equal "" (car path)))
;;       (setq path (cdr path)))
;;     (while (and path (< (length output) (- max-length 4)))
;;       (setq output (concat (car path) "/" output))
;;       (setq path (cdr path)))
;;     (when path
;;       (setq output (concat ".../" output)))
;;     output))

;; (defvar lunaryorn-projectile-mode-line
;;   '(:propertize
;;     (:eval (when (ignore-errors (projectile-project-root))
;;              (concat " " (projectile-project-name))))
;;     face font-lock-constant-face)
;;   "Mode line format for Projectile.")

;; ;; Extra mode line faces
;; (make-face 'mode-line-read-only-face)
;; (make-face 'mode-line-modified-face)
;; (make-face 'mode-line-folder-face)
;; (make-face 'mode-line-filename-face)
;; (make-face 'mode-line-position-face)
;; (make-face 'mode-line-mode-face)
;; (make-face 'mode-line-minor-mode-face)
;; (make-face 'mode-line-process-face)
;; (make-face 'mode-line-80col-face)
;; (make-face 'mode-line-mode-string-face)
;; (make-face 'mode-line-vc-face)

;; (set-face-attribute 'mode-line nil
;;                     :foreground "gray80" :background "black"
;;                     :inverse-video nil :height 110 :family "Envy Code R"
;;                     :box '(:line-width 1 :color "gray10" :style nil))
;; (set-face-attribute 'mode-line-inactive nil
;;                     :foreground "gray60" :background "black"
;;                     :inverse-video nil :height 110 :family "Envy Code R"
;;                     :box '(:line-width 1 :color "black" :style nil))

;; (set-face-attribute 'mode-line-read-only-face nil
;;                     :inherit 'mode-line-face
;;                     :foreground "#4271ae" :family "Envy Code R"
;;                     :box '(:line-width 1 :color "#4271ae"))
;; (set-face-attribute 'mode-line-modified-face nil
;;                     :inherit 'mode-line-face
;;                     :foreground "#c82829"
;;                     :background "#000000" :family "Envy Code R"
;;                     :box '(:line-width 1 :color "#c82829"))
;; (set-face-attribute 'mode-line-folder-face nil
;;                     :inherit 'mode-line-face :family "Envy Code R"
;;                     :foreground "gray80")
;; (set-face-attribute 'mode-line-filename-face nil
;;                     :inherit 'mode-line-face
;;                     :foreground "#d7ff00" :family "Envy Code R"
;;                     :weight 'bold)
;; (set-face-attribute 'mode-line-position-face nil
;;                     :inherit 'mode-line-face
;;                     :family "Envy Code R" :height 100)
;; (set-face-attribute 'mode-line-mode-face nil
;;                     :inherit 'mode-line-face :family "Envy Code R"
;;                     :foreground "#FF5734" :height 100)
;; (set-face-attribute 'mode-line-minor-mode-face nil
;;                     :inherit 'mode-line-mode-face
;;                     :foreground "gray50" :family "Envy Code R"
;;                     :height 100)
;; (set-face-attribute 'mode-line-mode-string-face nil
;;                     :inherit 'mode-line-mode-face
;;                     :foreground "gray60" :family "Envy Code R"
;;                     :height 100)
;; (set-face-attribute 'mode-line-vc-face nil
;;                     :inherit 'mode-line-mode-face :bold t
;;                     :foreground "#5fafff" :family "Envy Code R"
;;                     :height 100)
;; (set-face-attribute 'mode-line-process-face nil
;;                     :inherit 'mode-line-face
;;                     :foreground "#718c00")
;; (set-face-attribute 'mode-line-80col-face nil
;;                     :inherit 'mode-line-position-face
;;                     :foreground "black" :background "#eab700")

(provide 'wcx-modeline)
;;; wcx-modeline.el ends here

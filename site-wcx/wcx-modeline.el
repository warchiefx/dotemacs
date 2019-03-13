;;;;; wcx-modeline.el -- Modeline customization
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
;;   (sml/setup))

;; (use-package spaceline
;;   :ensure t
;;   :config
;;   (require 'spaceline-config)
;;   ;;(spaceline-emacs-theme)
;;   (spaceline-spacemacs-theme)
;;   (spaceline-helm-mode)
;;   (spaceline-info-mode)
;;   (spaceline-toggle-evil-state-on)
;;   (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
;;   (spaceline-toggle-projectile-root-on)
;;   (spaceline-toggle-version-control-on)
;;   (spaceline-toggle-buffer-position-off)
;;   (spaceline-toggle-hud-off)
;;   (spaceline-toggle-which-function-on))

(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode)
      :init
      (setq doom-modeline-height 15)
      (setq doom-modeline-buffer-file-name-style 'relative-from-project)
      (setq doom-modeline-minor-modes t)
      (setq doom-modeline-icon nil)
      (setq doom-modeline-github t)
      (setq doom-modeline-env-version nil)
      (setq doom-modeline-python-executable "python"))

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-ivy
  :ensure t
  :after (all-the-icons ivy)
  :custom (all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window))
  :config
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-dired-jump)
  (add-to-list 'all-the-icons-ivy-file-commands 'counsel-find-library)
  (all-the-icons-ivy-setup))

;; (defun format-icon (func icon-name color)
;;   (let ((icon (funcall func icon-name)))
;;     (propertize icon
;;                 'face `(:family ,(all-the-icons-icon-family icon) :height 0.8 :foreground ,color)
;;                 'display '(raise 0.0))))

;; ;; Telephone line
;; (use-package telephone-line
;;   :ensure t
;;   :init
;;   ;; Need to display telephone-line in *Messages* buffer
;;   ;; (defun recreate-message-buffer ()
;;   ;;   (cl-flet ((buffer-string* (buffer)
;;   ;;               (with-current-buffer buffer
;;   ;;                 (buffer-string)))
;;   ;;     (let ((msg (buffer-string* "*Messages*")))
;;   ;;       (kill-buffer "*Messages*")
;;   ;;       (message msg))))

;;   ;; (add-hook 'after-init-hook #'recreate-message-buffer)
;;   :config
;;   ;; To create custom segments
;;   (require 'telephone-line-utils)

;;   ;; Declare some functions so that the parser is happy
;;   (declare-function all-the-icons-icon-family "ext:all-the-icons.el")
;;   (declare-function all-the-icons-octicon-family "ext:all-the-icons.el")
;;   (declare-function all-the-icons-octicon "ext:all-the-icons.el")
;;   (declare-function telephone-line-selected-window-active "ext:telephone-line.el")
;;   (declare-function projectile-project-name "ext:projectile.el")

;;   ;; Set subseparator
;;   (if window-system
;;       (progn
;;         (setq telephone-line-secondary-left-separator 'telephone-line-identity-hollow-left)
;;         (setq telephone-line-secondary-right-separator 'telephone-line-identity-hollow-right)))

;;   ;;;; Custom segments

;;   ;; Example of color string segment
;;   ;; (telephone-line-defsegment* wcx-color-segment
;;   ;;   (propertize "some-string" 'face `(:foreground "green")))

;;   (defun get-venv-name ()
;;     (when (and (telephone-line-selected-window-active)
;;                (eq 'python-mode major-mode)
;;                (bound-and-true-p pyvenv-virtual-env-name))
;;       (propertize (format "[%s]" pyvenv-virtual-env-name)
;;                   'face `(:foreground 'custom-comment-tag))))


;;   ;; Display major mode
;;   (telephone-line-defsegment* wcx-major-mode-segment ()
;;     (let* ((mode-text (propertize (format "%s %s"
;;                                    (all-the-icons-icon-for-file (buffer-file-name)
;;                                                                 :height 0.8)
;;                                    mode-name)
;;                                   'face `(:foreground 'custom-documentation)
;;                                   'display `(:raise 0.0)))
;;            (space (propertize " " 'face `(:height 0.6))))
;;       (mapconcat 'identity
;;                  (cl-remove-if
;;                   'null
;;                   `(,mode-text
;;                     ,(get-venv-name)))
;;                   space)))

;;   ;; Display evil state
;;   (defvar evil-state)
;;   (telephone-line-defsegment wcx-evil-segment ()
;;     (if (telephone-line-selected-window-active)
;;       (let ((tag (cond
;;                   ((string= evil-state "normal")    "NORMAL")
;;                   ((string= evil-state "insert")    "INSERT")
;;                   ((string= evil-state "replace")   "REPL  ")
;;                   ((string= evil-state "visual")    "VISUAL")
;;                   ((string= evil-state "operator")  "OP    ")
;;                   ((string= evil-state "motion")    "MOTION")
;;                   ((string= evil-state "emacs")     "EMACS ")
;;                   (t "-"))))
;;         (concat " " tag))))

;;   (telephone-line-defsegment wcx-projectile-segment ()
;;     (let ((help-echo "Switch Project")
;;         (local-map (make-mode-line-mouse-map 'mouse-1 'projectile-switch-project))
;;         (project-id (if (and (fboundp 'projectile-project-p) (projectile-project-p))
;;                         (projectile-project-name) "×"))
;;         (space (propertize " " 'face `(:height 0.6))))

;;     (concat
;;      (format-icon 'all-the-icons-octicon "repo" 'custom-documentation)
;;      space
;;      (propertize project-id
;;                  'display `(raise 0.0)
;;                  'help-echo help-echo
;;                  'local-map local-map)
;;      )))

;;   ;; Display buffer name
;;   (telephone-line-defsegment wcx-buffer-segment ()
;;     (buffer-name))

;;   ;; Display current position in a buffer
;;   (telephone-line-defsegment* wcx-position-segment ()
;;     (if (telephone-line-selected-window-active)
;;         (if (eq major-mode 'paradox-menu-mode)
;;             (telephone-line-trim (format-mode-line mode-line-front-space))
;;           '(" %3l,%2c "))))

;;   ;; Exclude some buffers in modeline
;;   (defvar modeline-ignored-modes nil
;;     "List of major modes to ignore in modeline")

;;   (setq modeline-ignored-modes '("Dashboard"
;;                                  "Warnings"
;;                                  "Compilation"
;;                                  "EShell"
;;                                  "paradox"
;;                                  "Packages"
;;                                  "Debugger"
;;                                  "Quickrun"
;;                                  "REPL"
;;                                  "IELM"
;;                                  "Messages"))

;;   ;; Display modified status
;;   (telephone-line-defsegment wcx-modified-status-segment ()
;;     (when (and (buffer-modified-p) (not (member mode-name modeline-ignored-modes)) (not buffer-read-only))
;;         (format-icon 'all-the-icons-octicon "primitive-dot" "#85b654")))

;;   ;; Display read-only status
;;   (telephone-line-defsegment wcx-read-only-status-segment ()
;;     (when buffer-read-only

;;       ;; (propertize "ro" 'face `(:foreground "#dbac66"))
;;       (propertize (all-the-icons-octicon "key")
;;                   'face `(:family ,(all-the-icons-octicon-family) :height 1.0 :foreground "dim gray")
;;                   'display '(raise 0.0))))

;;   ;; Display encoding system
;;   (telephone-line-defsegment wcx-coding-segment ()
;;     (let* ((code (symbol-name buffer-file-coding-system))
;;            (eol-type (coding-system-eol-type buffer-file-coding-system))
;;            (eol (cond
;;                  ((eq 0 eol-type) "unix")
;;                  ((eq 1 eol-type) "dos")
;;                  ((eq 2 eol-type) "mac")
;;                  (t "-"))))
;;       (concat eol " ")))

;;   (defadvice vc-mode-line (after strip-backend () activate)
;;       (when (stringp vc-mode)
;;         (let ((wcx-vc (replace-regexp-in-string "^ Git." "" vc-mode)))
;;           (setq vc-mode wcx-vc))))

;;   ;; Display current branch
;;   (telephone-line-defsegment wcx-vc-segment ()
;;     (let (
;;           ;; (fg-color "#6fb593") ; kaolin-dark
;;           ;; (fg-color "#9f84ae")) ; kaolin-galaxy
;;           ;; (fg-color "#709688")) ; kaolin-eclipse
;;           (fg-color 'custom-link)) ; kaolin-aurora
;;       (when vc-mode
;;           (format "%s %s"
;;                   (propertize (all-the-icons-octicon "git-branch")
;;                               'face `(:family ,(all-the-icons-octicon-family) :height 1.0 :foreground ,fg-color)
;;                               'display '(raise 0.0))
;;                   (propertize
;;                     (format "%s"
;;                       (telephone-line-raw vc-mode t))
;;                     'face `(:foreground ,fg-color))))))

;;   (defun column-num-at-pos (pos)
;;     (save-excursion
;;       (goto-char pos)
;;       (current-column)))

;;   (defvar evil-visual-selection)
;;   (telephone-line-defsegment selection-info ()
;;     "Information about the size of the current selection, when applicable.
;;   Supports both Emacs and Evil cursor conventions."
;;     (when (or mark-active
;;               (and (bound-and-true-p evil-local-mode)
;;                    (eq 'visual evil-state)))
;;       (let* ((lines (count-lines (region-beginning) (min (1+ (region-end)) (point-max))))
;;              (chars (- (1+ (region-end)) (region-beginning)))
;;              (cols (1+ (abs (- (column-num-at-pos (region-end))
;;                                (column-num-at-pos (region-beginning))))))
;;              (evil (and (bound-and-true-p evil-state) (eq 'visual evil-state)))
;;              (rect (or (bound-and-true-p rectangle-mark-mode)
;;                        (and evil (eq 'block evil-visual-selection))))
;;              (multi-line (or (> lines 1) (and evil (eq 'line evil-visual-selection)))))
;;         (cond
;;          (rect (format "%d×%d" lines (if evil cols (1- cols))))
;;          (multi-line (format "%dL" lines))
;;          (t (format "%d" (if evil chars (1- chars))))))))

;;  (defun format-flycheck-pip (icon text text-color)
;;     (when text
;;       (concat
;;        (propertize (format "%s " text) 'face `(:foreground ,text-color))
;;        (propertize icon 'display `(raise 0.0))
;;        )))

;;   (declare-function flycheck-count-errors  "ext:flycheck.el")
;;   (defvar flycheck-current-errors)
;;   (defvar flycheck-last-status-change)

;;   (telephone-line-defsegment wcx-flycheck-segment ()
;;     (let-alist (flycheck-count-errors flycheck-current-errors)
;;       (let* ((get-text (lambda (text) (cond ((eq 'running flycheck-last-status-change) "?")
;;                                             ((zerop (or text 0)) nil)
;;                                             (t text))))

;;              (error-text (funcall get-text .error))
;;              (warn-text  (funcall get-text .warning))
;;              (info-text  (funcall get-text .info))
;;              (error-color "#bd2c40")
;;              (warning-color "gold3")
;;              (info-color "royal blue")
;;              (error-icon (format-icon 'all-the-icons-material "error" error-color))
;;              (warn-icon (format-icon 'all-the-icons-material "warning" warning-color))
;;              (help-icon (format-icon 'all-the-icons-material "help" info-color))

;;              (space (propertize " " 'face `(:height 0.6))))

;;         (mapconcat
;;          'identity
;;          (cl-remove-if
;;           'null
;;           `(,(format-flycheck-pip error-icon error-text error-color)
;;             ,(format-flycheck-pip warn-icon warn-text warning-color)
;;             ,(format-flycheck-pip help-icon info-text info-color)))
;;          space))))

;;   ;; TODO: Add virtualenv segment
;;   (defvar pyvenv-virtual-env-name)
;;   (defvar pyvenv-virtual-env)
;;   (telephone-line-defsegment wcx-python-pyvenv-segment ()
;;     "The current python venv.  Works with `pyvenv'."
;;     (when (and (telephone-line-selected-window-active)
;;                (eq 'python-mode major-mode)
;;                (bound-and-true-p pyvenv-virtual-env-name))
;;       (propertize pyvenv-virtual-env-name
;;                   'face '(:face "dim gray")
;;                   'help-echo (format "Virtual environment (via pyvenv): %s"
;;                                      pyvenv-virtual-env))))

;;   (setq telephone-line-primary-left-separator 'telephone-line-identity-left)
;;   (setq telephone-line-primary-right-separator 'telephone-line-identity-right)

;;   ;; Left edge
;;   (setq telephone-line-lhs
;;         '((evil   . (wcx-evil-segment))
;;           (nil . (wcx-projectile-segment))
;;           (accent    . (wcx-buffer-segment))
;;           (nil    . (wcx-major-mode-segment))
;;           (nil    . (wcx-flycheck-segment))
;;           (nil    . (selection-info))
;;           (nil    . (wcx-read-only-status-segment))
;;           (nil    . (wcx-modified-status-segment))
;;           ))

;;   ;; Right edge
;;   (setq telephone-line-rhs
;;         '((nil    . (wcx-vc-segment))
;;           (accent . (wcx-position-segment))
;;           ))
;;   (telephone-line-mode 1))

(provide 'wcx-modeline)
;;; wcx-modeline.el ends here

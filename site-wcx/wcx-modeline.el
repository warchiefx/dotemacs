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

(use-package all-the-icons
  :ensure t)

(defun format-icon (func icon-name color)
  (let ((icon (funcall func icon-name)))
    (propertize icon
                'face `(:family ,(all-the-icons-icon-family icon) :height 0.8 :foreground ,color)
                'display '(raise 0.0))))

;; Telephone line
(use-package telephone-line
  :ensure t
  :init
  ;; Need to display telephone-line in *Messages* buffer
  ;; (defun recreate-message-buffer ()
  ;;   (cl-flet ((buffer-string* (buffer)
  ;;               (with-current-buffer buffer
  ;;                 (buffer-string)))
  ;;     (let ((msg (buffer-string* "*Messages*")))
  ;;       (kill-buffer "*Messages*")
  ;;       (message msg))))

  ;; (add-hook 'after-init-hook #'recreate-message-buffer)
  :config
  ;; To create custom segments
  (require 'telephone-line-utils)

  ;; Set subseparator
  (if window-system
      (progn
        (setq telephone-line-secondary-left-separator 'telephone-line-identity-hollow-left)
        (setq telephone-line-secondary-right-separator 'telephone-line-identity-hollow-right)))

  ;;;; Custom segments

  ;; Example of color string segment
  ;; (telephone-line-defsegment* my-color-segment
  ;;   (propertize "some-string" 'face `(:foreground "green")))

  ;; Display major mode
  (telephone-line-defsegment* my-major-mode-segment ()
    (let ((mode (cond
                 ((string= mode-name "Fundamental") "text")
                 ((string= mode-name "Emacs-Lisp") "elisp")
                 ((string= mode-name "Javascript-IDE") "js")
                 ((string= mode-name "Javascript-IDE") "js")
                 ((string= mode-name "undo-tree-visualizer") "undo-tree")
                 (t (downcase mode-name)))))
      (propertize mode 'face `(:foreground "#9d81ba")))) ;; galaxy

  ;; Display evil state
  (telephone-line-defsegment my-evil-segment ()
    (if (telephone-line-selected-window-active)
      (let ((tag (cond
                  ((string= evil-state "normal")    "N")
                  ((string= evil-state "insert")    "I")
                  ((string= evil-state "replace")   "r")
                  ((string= evil-state "visual")    "V")
                  ((string= evil-state "operator")  "=")
                  ((string= evil-state "motion")    "m")
                  ((string= evil-state "emacs")     "Emacs")
                  (t "-"))))
        (concat " " tag))))

  ;; Display buffer name
  (telephone-line-defsegment my-buffer-segment ()
    `(""
      ,(telephone-line-raw mode-line-buffer-identification t)))


  ;; Display current position in a buffer
  (telephone-line-defsegment* my-position-segment ()
    (if (telephone-line-selected-window-active)
        (if (eq major-mode 'paradox-menu-mode)
            (telephone-line-trim (format-mode-line mode-line-front-space))
          '(" %3l,%2c "))))

  ;; Exclude some buffers in modeline
  (defvar modeline-ignored-modes nil
    "List of major modes to ignore in modeline")

  (setq modeline-ignored-modes '("Dashboard"
                                 "Warnings"
                                 "Compilation"
                                 "EShell"
                                 "Debugger"
                                 "Quickrun"
                                 "REPL"
                                 "IELM"
                                 "Messages"))

  ;; Display modified status
  (telephone-line-defsegment my-modified-status-segment ()
    (if (and (buffer-modified-p) (not (member mode-name modeline-ignored-modes)) (not buffer-read-only))
        (format-icon 'all-the-icons-octicon "primitive-dot" "#85b654")
      (format-icon 'all-the-icons-octicon "primitive-dot" "dim gray")))

  ;; Display read-only status
  (telephone-line-defsegment my-read-only-status-segment ()
    (when buffer-read-only

      ;; (propertize "ro" 'face `(:foreground "#dbac66"))
      (propertize (all-the-icons-octicon "key")
                  'face `(:family ,(all-the-icons-octicon-family) :height 1.0 :foreground "dim gray")
                  'display '(raise 0.0))))

  ;; Display encoding system
  (telephone-line-defsegment my-coding-segment ()
    (let* ((code (symbol-name buffer-file-coding-system))
           (eol-type (coding-system-eol-type buffer-file-coding-system))
           (eol (cond
                 ((eq 0 eol-type) "unix")
                 ((eq 1 eol-type) "dos")
                 ((eq 2 eol-type) "mac")
                 (t "-"))))
      (concat eol " ")))

  (defadvice vc-mode-line (after strip-backend () activate)
      (when (stringp vc-mode)
        (let ((my-vc (replace-regexp-in-string "^ Git." "" vc-mode)))
          (setq vc-mode my-vc))))

  ;; Display current branch
  (telephone-line-defsegment my-vc-segment ()
    (let (
          ;; (fg-color "#6fb593") ; kaolin-dark
          ;; (fg-color "#9f84ae")) ; kaolin-galaxy
          ;; (fg-color "#709688")) ; kaolin-eclipse
          (fg-color "#68f3ca")) ; kaolin-aurora
      (when vc-mode
        ;; double format to prevent warnings in '*Messages*' buffer
          (format "%s %s"
                  (propertize (all-the-icons-octicon "git-branch")
                              'face `(:family ,(all-the-icons-octicon-family) :height 1.0 :foreground ,fg-color)
                              'display '(raise 0.0))
                  (propertize
                    (format "%s"
                      (telephone-line-raw vc-mode t))
                    'face `(:foreground ,fg-color))))))

  (defun column-num-at-pos (pos)
    (save-excursion
      (goto-char pos)
      (current-column)))

  (telephone-line-defsegment selection-info ()
    "Information about the size of the current selection, when applicable.
  Supports both Emacs and Evil cursor conventions."
    (when (or mark-active
              (and (bound-and-true-p evil-local-mode)
                   (eq 'visual evil-state)))
      (let* ((lines (count-lines (region-beginning) (min (1+ (region-end)) (point-max))))
             (chars (- (1+ (region-end)) (region-beginning)))
             (cols (1+ (abs (- (column-num-at-pos (region-end))
                               (column-num-at-pos (region-beginning))))))
             (evil (and (bound-and-true-p evil-state) (eq 'visual evil-state)))
             (rect (or (bound-and-true-p rectangle-mark-mode)
                       (and evil (eq 'block evil-visual-selection))))
             (multi-line (or (> lines 1) (and evil (eq 'line evil-visual-selection)))))
        (cond
         (rect (format "%d×%d" lines (if evil cols (1- cols))))
         (multi-line (format "%dL" lines))
         (t (format "%d" (if evil chars (1- chars))))))))


  ;; (telephone-line-defsegment my-flycheck-segment ()
  ;;   ;; TODO: split errors and warnings
  ;;   (if (telephone-line-selected-window-active)
  ;;       (when (boundp 'flycheck-last-status-change)
  ;;         (pcase flycheck-last-status-change
  ;;           ('finished (when flycheck-current-errors
  ;;                          (let-alist (flycheck-count-errors flycheck-current-errors)
  ;;                            (let ((errors (format "%s%s" (format-icon 'all-the-icons-material "error" "#bd2c40") (or .error 0)))
  ;;                                  (warnings (format "%s%s" (format-icon 'all-the-icons-material "warning" "gold") (or .warning 0))))
  ;;                              (string-join '(warnings errors) " ")))))
  ;;           ('running     (format-icon 'all-the-icons-material "refresh" "dim gray"))
  ;;           ('no-checker  "")
  ;;           ('errored (format-icon 'all-the-icons-material "error_outline" "dim gray"))
  ;;           ('interrupted "interrupted")))))
  (defun format-flycheck-pip (icon text)
    (when text
      (concat
       (propertize icon 'display `(raise 0.0))
       (propertize (format "%s" text) 'face `(:foreground "dim gray")))))

  (declare-function flycheck-count-errors  "ext:flycheck.el")
  (defvar flycheck-current-errors)
  (defvar flycheck-last-status-change)

  (telephone-line-defsegment my-flycheck-segment ()
    (let-alist (flycheck-count-errors flycheck-current-errors)
      (let* ((get-text (lambda (text) (cond ((eq 'running flycheck-last-status-change) "?")
                                            ((zerop (or text 0)) nil)
                                            (t text))))

             (error-text (funcall get-text .error))
             (warn-text  (funcall get-text .warning))
             (info-text  (funcall get-text .info))

             (error-icon (format-icon 'all-the-icons-material "error" "#bd2c40"))
             (warn-icon (format-icon 'all-the-icons-material "warning" "gold"))
             (help-icon (format-icon 'all-the-icons-material "help" "light blue"))

             (space (propertize " " 'face `(:height 0.6))))

        (mapconcat
         'identity
         (cl-remove-if
          'null
          `(,(format-flycheck-pip error-icon error-text)
            ,(format-flycheck-pip warn-icon warn-text)
            ,(format-flycheck-pip help-icon info-text)))
         space))))

  ;; TODO: Add virtualenv segment
  ;; Left edge
  (setq telephone-line-lhs
        '((evil   . (my-evil-segment))
          (nil    . (my-read-only-status-segment))
          (nil    . (my-modified-status-segment))
          (accent    . (my-buffer-segment))
          (nil    . (selection-info))
          (nil    . (my-flycheck-segment))))

  ;; Right edge
  (setq telephone-line-rhs
        '((nil    . (my-vc-segment))
          (accent . (my-position-segment))
          (nil    . (my-major-mode-segment))
          ))
  (telephone-line-mode 1))


(provide 'wcx-modeline)
;;; wcx-modeline.el ends here

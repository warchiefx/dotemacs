;;; wcx-companymode.el --- In-buffer completion (corfu + cape) -*- lexical-binding: t -*-
;;; Commentary:
;; corfu is the minibuffer-completion-style counterpart to vertico, but
;; for in-buffer popups. It's a thin wrapper around vanilla
;; `completion-at-point' — eglot, file paths, dabbrev, etc. all just
;; expose themselves via `completion-at-point-functions' (capf) and
;; corfu renders the result. orderless does the matching, marginalia
;; the annotations. cape adds extra capf sources where the major mode
;; doesn't supply enough.
;;
;; This file keeps the legacy `wcx-companymode' name to avoid touching
;; dotemacs.el's load list; the contents are now corfu-based.
;;; Code:

(use-package corfu
  :ensure t
  :init (global-corfu-mode 1)
  :custom
  (corfu-cycle t)
  (corfu-auto t)                          ; popup automatically while typing
  (corfu-auto-prefix 2)                   ; trigger after 2 chars
  (corfu-auto-delay 0.15)                 ; idle delay before popup
  (corfu-popupinfo-delay '(0.4 . 0.2))    ; quickhelp delay
  (corfu-quit-no-match 'separator)        ; stay open on no match w/ space
  (corfu-preview-current 'insert)
  (corfu-preselect 'prompt)
  (corfu-on-exact-match 'show)
  :bind (:map corfu-map
              ("TAB"     . corfu-next)
              ([tab]     . corfu-next)
              ("S-TAB"   . corfu-previous)
              ([backtab] . corfu-previous)
              ("M-d"     . corfu-info-documentation)
              ("M-l"     . corfu-info-location)))

(use-package corfu-popupinfo
  :ensure nil
  :after corfu
  :config (corfu-popupinfo-mode 1))

;; Pretty kind icons (function/variable/class/...) in the popup.
(use-package kind-icon
  :ensure t
  :after corfu
  :custom (kind-icon-default-face 'corfu-default)
  :config
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

;; Cape — Completion-At-Point Extensions: extra capf sources for things
;; the major mode doesn't natively provide (filenames anywhere, dabbrev
;; across buffers, abbreviations, …).
(use-package cape
  :ensure t
  :init
  ;; Add a couple of universally-useful capfs at the end of the chain so
  ;; eglot/major-mode capfs win when they have something to offer.
  (add-to-list 'completion-at-point-functions #'cape-file t)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev t)
  :bind (("C-c p p" . completion-at-point)
         ("C-c p f" . cape-file)
         ("C-c p d" . cape-dabbrev)
         ("C-c p k" . cape-keyword)
         ("C-c p s" . cape-elisp-symbol)
         ("C-c p a" . cape-abbrev)
         ("C-c p l" . cape-line)
         ("C-c p w" . cape-dict)))

;; Make TAB do the right thing in capf: indent if appropriate, complete
;; otherwise. corfu picks up from there.
(setq tab-always-indent 'complete)

(provide 'wcx-companymode)
;;; wcx-companymode.el ends here

;;; wcx-generic.el --- Generic customizations.
;;; Commentary:
;;; Code
(menu-bar-mode 0)

(require 'iso-transl)  ;; Handle dead keys and such

;;(horizontal-scroll-bar-mode 0)
(setq frame-title-format "emacs [%b]"
      icon-title-format "emacs [%b]"
      scroll-conservatively 1)
(windmove-default-keybindings 'meta)

;; ----- FontRelated Stuff
;; (setq emacs-font "Envy Code R-10")
;;(setq emacs-font "Input Sans Narrow Thin-11")
;; (setq emacs-font "M+ 1mn-11")
;;(setq emacs-font "M+ 1m regular-10.5")
;;(setq emacs-font "M+ 1m-10.5")
;;(setq emacs-font "M+ 1p regular-11")
;;(setq emacs-font "SourceCode Pro-10.5")
;;(setq emacs-font "PragmataPro-11")
;;(setq emacs-font "Mensch-11")
;;(setq emacs-font "Monaco-11")
;;(setq emacs-font "Inconsolata-10.5")
;;(setq emacs-font "Inconsolata-g-11")
;;(setq emacs-font "NotoSans-10.5")
;;(setq emacs-font "anonymous Pro-12"
;;(setq emacs-font "Consolas-11")
;;(setq emacs-font "Lucida Grande Mono-10.5")
;(setq emacs-font "MesloLGSDZ-10")
;; (setq emacs-font "Hack-10")
(setq emacs-font "Iosevka-10.5")
;;(setq emacs-font "DejaVu Sans Mono-10")
;;(setq emacs-font "FiraCode-9")
;;(setq emacs-font "Hermit-10")
;; (set-frame-font emacs-font)
(if (display-graphic-p)
    (set-face-attribute 'default nil :font emacs-font))

;;; It is always better to know current line and column number
(column-number-mode t)

;; Use relative-line-numbers
;; (global-display-line-numbers-mode 'relative)
;; (setq display-line-numbers 'relative)

;;; Overwrite selection
(delete-selection-mode t)

;;; Make all yes-or-no questions as y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;;; Change cursor into a bar instead of a block
;; (setq-default cursor-type 'bar)

(put 'narrow-to-region 'disabled nil)

(display-time-mode 0)

(add-hook 'conf-javaprop-mode-hook
          '(lambda () (conf-quote-normal nil)))

(winner-mode 1)

;; Some hooks
;; (add-hook 'term-mode-hook '(lambda () (yas/minor-mode nil)))
(add-hook 'python-mode-hook '(lambda () (yas/minor-mode 1)))

(mouse-avoidance-mode 'cat-and-mouse)

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-items '((recents  . 5)
                        (projects . 5)
                        (agenda . 5)))
  (dashboard-setup-startup-hook))

;; Buffer naming strategy
(require 'uniquify)

(use-package smex
  :ensure t
  :config
  (global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands))))


(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))


(use-package yascroll
  :ensure t
  :config
  (global-yascroll-bar-mode 1))

(use-package ido-completing-read+
  :ensure t)

;; (use-package rfringe
;;   :ensure t)

;; (use-package emacsd-tile
;;   :ensure t)

(use-package frame-tag
  :ensure t
  :config (frame-tag-mode 1))

(use-package vimish-fold
  :ensure t
  :defer 1
  :bind
  (:map vimish-fold-folded-keymap ("<tab>" . vimish-fold-unfold)
        :map vimish-fold-unfolded-keymap ("<tab>" . vimish-fold-refold))
  :init
  (setq-default vimish-fold-dir (expand-file-name ".vimish-fold/" user-emacs-directory))
  (vimish-fold-global-mode)
  :config
  (setq-default vimish-fold-header-width 79))

;; (use-package himp
;;   :ensure t
;;   :config
;;   (add-hook 'python-mode-hook 'himp-mode)
;;   (add-hook 'java-mode-hook 'himp-mode)
;;   :diminish himp-mode)

(use-package switch-window
  :ensure t
  :bind (("C-x o" . switch-window)
         ("C-x 0" . switch-window-then-delete)
         ("C-x 4 0" . switch-window-then-kill-buffer))
  :config
  (setq switch-window-threshold 2))


;; Avoid having to delete extra spaces after kill-line on end of line
(defadvice kill-line (before check-position activate)
  (if (and (eolp) (not (bolp)))
      (progn (forward-char 1)
             (just-one-space 0)
             (backward-char 1))))

;; Join next line with this.
(global-set-key (kbd "C-c j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; Indent on yank
;; (dolist (command '(yank yank-pop))
;;   (eval `(defadvice ,command (after indent-region activate)
;;            (and (not current-prefix-arg)
;;                 (member major-mode '(emacs-lisp-mode lisp-mode
;;                                                      clojure-mode    scheme-mode
;;                                                      haskell-mode    ruby-mode
;;                                                      rspec-mode      python-mode
;;                                                      c-mode          c++-mode
;;                                                      objc-mode       latex-mode
;;                                                      plain-tex-mode))
;;                 (let ((mark-even-if-inactive transient-mark-mode))
;;                   (indent-region (region-beginning) (region-end) nil))))))

(define-key global-map (kbd "RET") 'newline-and-indent)

;; Auto refresh buffers
;; (use-package auto-revert-mode
;;   :diminish auto-revert-mode
;;   :config
;;   ;; Also auto refresh dired, but be quiet about it
;;   (setq global-auto-revert-non-file-buffers t)
;;   (setq auto-revert-verbose nil)
;;   (global-auto-revert-mode 1))

;; (use-package dired+
;;   :ensure t)

(use-package whitespace-cleanup-mode
  :ensure t
  :config (global-whitespace-cleanup-mode))

(global-ede-mode 1)
(require 'semantic/sb)
(semantic-mode 1)

;; Post 24.4 stuff
(superword-mode 1)
(electric-pair-mode)  ;; Replaces autopair
(electric-indent-mode 0)  ;; Currently annoying on python-mode

(use-package smart-shift
  :ensure t
  :config (global-smart-shift-mode 1))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(use-package zeal-at-point
  :ensure t
  :bind (("C-c d" . zeal-at-point)))

;; (use-package vimish-fold
;;   :ensure t
;;   :config
;;   (vimish-fold-global-mode 1)
;;   :bind (("C-c g" . vimish-fold-toggle)
;;          ("C-c f f" . vimish-fold)
;;          ("C-c f v" . vimish-fold-delete)
;;          ("C-c f a" . vimish-fold-unfold-all)
;;   ))

(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (defun neotree-project-dir-toggle ()
    "Open NeoTree using the project root, using find-file-in-project,
or the current buffer directory."
    (interactive)
    (let ((project-dir
           (ignore-errors
           ;;; Pick one: projectile or find-file-in-project
                                        ; (projectile-project-root)
             (projectile-project-root)
             ))
          (file-name (buffer-file-name))
          (neo-smart-open t))
      (if (and (fboundp 'neo-global--window-exists-p)
               (neo-global--window-exists-p))
          (neotree-hide)
        (progn
          (neotree-show)
          (if project-dir
              (neotree-dir project-dir))
          (if file-name
              (neotree-find file-name))))))

  (defun my/neotree-hook (_unused)
    (setq-local display-line-numbers nil))
  (add-hook 'neo-after-create-hook 'my/neotree-hook)

  :bind (([f8] . neotree-project-dir-toggle)))

(use-package csv-mode
  :ensure t)

(use-package anzu
  :defer 1
  :bind ([remap query-replace] . anzu-query-replace-regexp)
  :config
  (global-anzu-mode)
  (setq-default
   anzu-cons-mode-line-p nil
   anzu-replace-to-string-separator " -> ")
  :diminish anzu-mode)


(use-package shackle
  :ensure t
  :config
  (shackle-mode t)

  (setq helm-display-function 'pop-to-buffer)

  (setq shackle-rules
        '(("*helm-ag*"              :select t   :align right :size 0.5)
          ("*helm semantic/imenu*"  :select t   :align right :size 0.4)
          ("*helm org inbuffer*"    :select t   :align right :size 0.4)
          (flycheck-error-list-mode :select nil :align below :size 0.15)
          (ert-results-mode         :select t   :align below :size 0.5)
          (calendar-mode            :select t   :align below :size 0.25)
          (racer-help-mode          :select t   :align right :size 0.5)
          (help-mode                :select t   :align right :size 0.5)
          (compilation-mode         :select t   :align right :size 0.5)
          ("*Org Select*"           :select t   :align below :size 0.33)
          ("*Org Note*"             :select t   :align below :size 0.33)
          ("*Org Links*"            :select t   :align below :size 0.2)
          ("*Org todo*"             :select t   :align below :size 0.2)
          ("*Org tags*"             :select t   :align below :size 0.2)
          ("*Man.*"                 :select t   :align below :size 0.5  :regexp t)
          ("*helm.*"                :select t   :align below :size 0.33 :regexp t)
          ("*Org Src.*"             :select t   :align below :size 0.5  :regexp t))))


(use-package makefile-executor
  :ensure t
  :config
  (add-hook 'makefile-mode-hook 'makefile-executor-mode))


(use-package comment-tags
  :ensure t
  :config
  (autoload 'comment-tags-mode "comment-tags-mode")
  (setq comment-tags-keymap-prefix (kbd "C-c t"))
  (with-eval-after-load "comment-tags"
    (setq comment-tags-keyword-faces
          `(("TODO" . ,(list :weight 'bold :foreground "#28ABE3"))
            ("FIXME" . ,(list :weight 'bold :foreground "#DB3340"))
            ("BUG" . ,(list :weight 'bold :foreground "#DB3340"))
            ("HACK" . ,(list :weight 'bold :foreground "#E8B71A"))
            ("KLUDGE" . ,(list :weight 'bold :foreground "#E8B71A"))
            ("XXX" . ,(list :weight 'bold :foreground "#F7EAC8"))
            ("INFO" . ,(list :weight 'bold :foreground "#F7EAC8"))
            ("DONE" . ,(list :weight 'bold :foreground "#1FDA9A"))))
    (setq comment-tags-comment-start-only t
          comment-tags-require-colon nil
          comment-tags-case-sensitive t
          comment-tags-show-faces t
          comment-tags-lighter nil))
  (add-hook 'prog-mode-hook 'comment-tags-mode))


;; (use-package zoom
;;   :ensure t
;;   :config
;;   (defun size-callback ()
;;     (cond ((> (frame-pixel-width) 1500) '(120 . 0.75))
;;           (t                            '(0.5 . 0.5))))

;;   (custom-set-variables
;;    '(zoom-size 'size-callback))
;;   (custom-set-variables
;;    '(zoom-ignored-major-modes '(flycheck-error-list-mode))
;;    ;; '(zoom-ignored-buffer-names '("zoom.el" "init.el"))
;;    '(zoom-ignored-buffer-name-regexps nil)
;;    ;; '(zoom-ignore-predicates '((lambda () (> (count-lines (point-min) (point-max)) 20))))
;;    )
;;   (zoom-mode t)
;;   :diminish zoom-mode)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package ggtags
  :ensure t
  :config
  (add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
              (ggtags-mode 1))))
  (add-hook 'python-mode-hook (lambda () (ggtags-mode 1))))

(use-package git-link
  :ensure t
  :bind (("C-c C-x p" . git-link)))

(use-package beacon
  :ensure t
  :diminish beacon-mode
  :config (beacon-mode 1))

;; History management
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length t)
(setq history-delete-duplicates t)
(setq savehist-save-minibuffer-history 1)
(setq savehist-additional-variables
      '(kill-ring
        search-ring
        regexp-search-ring))

;; (use-package dumb-jump
;;   :ensure t
;;   :diminish dumb-jump-mode
;;   ;; :bind (("C-M-g" . dumb-jump-go)
;;   ;;        ("C-M-p" . dumb-jump-back)
;;   ;;        ("C-M-S-g" . dumb-jump-quick-look)))
;;   )

(use-package smart-jump
  :ensure t
  :diminish smart-jump-mode
  :config
  (smart-jump-setup-default-registers))

(use-package nswbuff                    ; Quick switching between buffers
  :ensure t
  :bind* (("<C-tab>"           . nswbuff-switch-to-next-buffer)
          ("<C-S-iso-lefttab>" . nswbuff-switch-to-previous-buffer)
          ("<C-next>"           . nswbuff-switch-to-next-buffer)
          ("<C-prior>" . nswbuff-switch-to-previous-buffer))
  :config (setq nswbuff-buffer-list-function #'nswbuff-projectile-buffer-list
                nswbuff-display-intermediate-buffers t))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (add-hook 'lisp-mode-hook #'smartparens-strict-mode))

(use-package electric-operator
  :ensure t
  :diminish electric-operator-mode
  :hook
  ((python-mode java-mode shell-script-mdoe) . electric-operator-mode)
  :custom
  (electric-operator-R-named-argument-style 'spaced))

(provide 'wcx-generic)
;;; wcx-generic.el ends here

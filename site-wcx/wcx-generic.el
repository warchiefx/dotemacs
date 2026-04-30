;;; wcx-generic.el --- Generic customizations.
;;; Commentary:
;;; Code
(menu-bar-mode 0)

(require 'iso-transl)  ;; Handle dead keys and such
(require 'epa-file)    ;; Transparent GPG file decryption

;;(horizontal-scroll-bar-mode 0)
(setq frame-title-format "emacs [%b]"
      icon-title-format "emacs [%b]"
      scroll-conservatively 1)
(windmove-default-keybindings 'meta)

;; ----- FontRelated Stuff
;; (setq emacs-font "Envy Code R-12")
;;(setq emacs-font "Input Sans Narrow Thin-11")
;; (setq emacs-font "M+ 1mn-11")
;;(setq emacs-font "M+ 1m regular-10.5")
;; (setq emacs-font "M+ 1m regular-13")
;;(setq emacs-font "M+ 1p regular-11")
;;(setq emacs-font "SourceCode Pro-10.5")
;;(setq emacs-font "PragmataPro-11")
;;(setq emacs-font "Mensch-11")
;; (setq emacs-font "Monaco-11")
;;(setq emacs-font "Inconsolata-10.5")
;;(setq emacs-font "Inconsolata-g-11")
;;(setq emacs-font "NotoSans-10.5")
;;(setq emacs-font "anonymous Pro-12"
;;(setq emacs-font "Consolas-11")
;;(setq emacs-font "Lucida Grande Mono-10.5")
;(setq emacs-font "MesloLGSDZ-10")
;; (setq emacs-font "Hack-12")
(setq emacs-font "Iosevka-12")
;; (setq emacs-font "JetBrains Mono-12")
;; (setq emacs-font "Fira Code-12")
;; (setq emacs-font "Victor Mono-12")
;; (setq emacs-font "Hack-12")

;; macOS handles antialiasing/hinting on its own; the fontconfig-style
;; ":antialias=true:hinting=true" suffix produces an invalid font-spec
;; on Cocoa Emacs and triggers errors in timer-driven popups (which-key).
;; Always set `default-frame-alist' so daemon-spawned graphical frames
;; pick up the font; only call `set-face-attribute' if there's a GUI now.
(add-to-list 'default-frame-alist `(font . ,emacs-font))
(when (display-graphic-p)
  (set-face-attribute 'default nil :font emacs-font))

;; Taken from https://www.reddit.com/r/emacs/comments/qoslj5/automatic_text_size_adjustment_per_display/
;; Adapts font size depending on the display
(defun td/adapt-font-size (&optional frame)
  (let* ((attrs (frame-monitor-attributes frame))
         (size (alist-get 'mm-size attrs))
         (geometry (alist-get 'geometry attrs))
         (ppi (/ (caddr geometry) (/ (car size) 25.4))))
    ;; (message "PPI: %s" ppi)
    (if (> ppi 155)
        (set-face-attribute 'default frame :height 180)
      (set-face-attribute 'default frame :height 160))))

;; (add-function :after after-focus-change-function #'td/adapt-font-size)
(add-to-list 'window-size-change-functions #'td/adapt-font-size)
(add-hook 'after-make-frame-functions #'td/adapt-font-size)

;;; It is always better to know current line and column number
(column-number-mode t)

;; Use relative-line-numbers
;; (global-display-line-numbers-mode 'relative)
(setq display-line-numbers 'absolute)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;;; Overwrite selection
(delete-selection-mode t)

;;; Make all yes-or-no questions as y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;;; Change cursor into a bar instead of a block
;; (setq-default cursor-type 'bar)

(put 'narrow-to-region 'disabled nil)

(display-time-mode 0)

;(add-hook 'conf-javaprop-mode-hook
;          '(lambda () (conf-quote-normal nil)))

(use-package winner
  :bind (("C-<f3>" . winner-undo)
         ("M-<f3>" . winner-redo))
  :config
  (winner-mode 1))

;; Emacs auth-sources
(require 'auth-source)
(require 'auth-source-pass)
(auth-source-pass-enable)
(setq epg-pinentry-mode 'loopback)
(require 'epa-file)
(epa-file-enable)

(use-package auto-compile
  :defer nil
  :config (auto-compile-on-load-mode))

(mouse-avoidance-mode 'cat-and-mouse)

(use-package dashboard
  :diminish
  (dashboard-mode page-break-lines-mode)
  :custom
  (dashboard-center-content t)
  (dashboard-items '((recents . 10)
                     (projects . 5)
                     (bookmarks . 5)))
  :custom-face
  (dashboard-heading ((t (:weight bold))))
  :hook
  (after-init . dashboard-setup-startup-hook))

;; Buffer naming strategy
(require 'uniquify)

(use-package yascroll
  :config
  (global-yascroll-bar-mode 1))

(use-package frame-tag
  :ensure t
  :config (frame-tag-mode 1))

(use-package vimish-fold
  :defer t
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
  :defer t
  :bind (("C-x o" . switch-window)
         ("C-x 0" . switch-window-then-delete)
         ("C-x 4 0" . switch-window-then-kill-buffer))
  :config
  (setq switch-window-threshold 2))


;; Avoid having to delete extra spaces after kill-line on end of line.
(defun wcx/kill-line-collapse-space (&rest _)
  (when (and (eolp) (not (bolp)))
    (forward-char 1)
    (just-one-space 0)
    (backward-char 1)))
(advice-add 'kill-line :before #'wcx/kill-line-collapse-space)

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

;; Post 24.4 stuff
(superword-mode 1)
(electric-pair-mode)  ;; Replaces autopair
(electric-indent-mode 0)  ;; Currently annoying on python-mode

(use-package smart-shift
  :ensure t
  :config (global-smart-shift-mode 1))

;; Save point position between sessions
(use-package saveplace
  :defer nil
  :config
  (save-place-mode))

(use-package zeal-at-point
  :defer t
  :bind (("C-c d" . zeal-at-point)))

(use-package csv-mode)

(use-package anzu
  :defer t
  :bind ([remap query-replace] . anzu-query-replace-regexp)
  :config
  (global-anzu-mode)
  (setq-default
   anzu-cons-mode-line-p nil
   anzu-replace-to-string-separator " -> ")
  :diminish anzu-mode)


(use-package shackle
  :config
  (shackle-mode t)

  (setq helm-display-function 'pop-to-buffer)

  (setq shackle-rules
        '(("*helm-ag*"              :select t   :align right :size 0.5)
          ("*helm semantic/imenu*"  :select t   :align right :size 0.4)
          ("*helm org inbuffer*"    :select t   :align right :size 0.4)
          (flycheck-error-list-mode :select nil :align below :size 0.15)
          (flymake-diagnostics-buffer-mode :select nil :align below :size 0.15)
          (ert-results-mode         :select t   :align below :size 0.5)
          (calendar-mode            :select t   :align below :size 0.25)
          (racer-help-mode          :select t   :align right :size 0.5)
          (help-mode                :select t   :align right :size 0.5)
          (compilation-mode         :select t   :align below :size 0.3)
          (comint-mode              :select t   :align below :size 0.3)
          ("*Org Select*"           :select t   :align below :size 0.33)
          ("*Org Note*"             :select t   :align below :size 0.33)
          ("*Org Links*"            :select t   :align below :size 0.2)
          ("*Org todo*"             :select t   :align below :size 0.2)
          ("*Org tags*"             :select t   :align below :size 0.2)
          ("*Man.*"                 :select t   :align below :size 0.5  :regexp t)
          ("*helm.*"                :select t   :align below :size 0.33 :regexp t)
          ("*Org Src.*"             :select t   :align below :size 0.5  :regexp t))))


(use-package makefile-executor
  :defer t
  :hook (makefile-mode . makefile-executor-mode))


(use-package comment-tags
  :defer t
  :hook (prog-mode . comment-tags-mode)
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
          comment-tags-lighter nil)))


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
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package git-link
  :defer t
  :bind (("C-c C-x p" . git-link)))

;; (use-package beacon
;;   :diminish beacon-mode
;;   :config (beacon-mode 1))

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

(use-package dumb-jump
  :ensure t
  :demand t
  :diminish dumb-jump-mode
  :config
  (setq dumb-jump-prefer-searcher 'rg)
  ;; Replace the default etags backend (which always claims the request
  ;; and prompts for a TAGS file) with dumb-jump as the global fallback.
  ;; Eglot still wins because it prepends `eglot-xref-backend' buffer-locally
  ;; in managed buffers.
  (setq-default xref-backend-functions
                '(dumb-jump-xref-activate etags--xref-backend))
  :hydra (dumb-jumb-hydra (:color blue :columns 3)
    "Dumb Jump"
    ("j" dumb-jump-go "Go")
    ("o" dumb-jump-go-other-window "Other window")
    ("e" dumb-jump-go-prefer-external "Go external")
    ("x" dumb-jump-go-prefer-external-other-window "Go external other window")
    ("i" dumb-jump-go-prompt "Prompt")
    ("l" dumb-jump-quick-look "Quick look")
    ("b" dumb-jump-back "Back"))
  :bind (("s-." . xref-find-definitions)
         ("s-," . xref-pop-marker-stack)))

;; (use-package smart-jump
;;  :ensure t
;;  :diminish smart-jump-mode
;;  :config
;;  (smart-jump-setup-default-registers))

(use-package nswbuff                    ; Quick switching between buffers
  :bind* (("<C-tab>"           . nswbuff-switch-to-next-buffer)
          ("<C-S-iso-lefttab>" . nswbuff-switch-to-previous-buffer)
          ("<C-next>"           . nswbuff-switch-to-next-buffer)
          ("<C-prior>" . nswbuff-switch-to-previous-buffer))
  :config (setq nswbuff-buffer-list-function #'nswbuff-projectile-buffer-list
                nswbuff-display-intermediate-buffers t))

(use-package smartparens
  :hook (lisp-mode . smartparens-strict-mode)
  :config
  (require 'smartparens-config))

(use-package electric-operator
  :diminish electric-operator-mode
  :hook
  ((python-mode java-mode shell-script-mdoe) . electric-operator-mode)
  :custom
  (electric-operator-R-named-argument-style 'spaced))

(use-package dimmer
  :disabled
  :custom
  (dimmer-fraction 0.25)
  (dimmer-exclusion-regexp-list
       '(".*Minibuf.*"
         ".*which-key.*"
         ".*NeoTree.*"
         ".*Messages.*"
         ".*Async.*"
         ".*Warnings.*"
         ".*LV.*"
         ".*Flycheck.*"
         ".*Ilist.*"))
  :config
  (dimmer-mode t))

;; (use-package highlight-indent-guides
;;   :diminish
;;   :hook
;;   ((prog-mode yaml-mode) . highlight-indent-guides-mode)
;;   :custom
;;   (highlight-indent-guides-auto-enabled t)
;;   (highlight-indent-guides-responsive t)
;;   (highlight-indent-guides-method 'column)) ; character

(use-package deadgrep
  :bind
  (("C-<f1>" . deadgrep))
  :config
  (with-eval-after-load 'evil
    (evil-define-state deadgrep
      "Evil deadgrep state"
      :cursor 'bar
      :enable (motion))

    (add-hook 'deadgrep-mode-hook #'evil-deadgrep-state)

    (define-key evil-deadgrep-state-map (kbd "<return>") #'deadgrep-visit-result)
    (define-key evil-deadgrep-state-map (kbd "gr") #'deadgrep-restart))

  (defun wcx/find-projectile-project (dir)
    (if (fboundp 'projectile-project-root)
        (let ((root (projectile-project-root dir)))
          (and root (cons 'transient root)))))
  ;; Integrate project.el with projectile
  (add-to-list 'project-find-functions #'wcx/find-projectile-project))

;; (use-package fast-scroll
;;   :diminish fast-scroll-mode
;;   :config
;;   (fast-scroll-config)
;;   (fast-scroll-mode 1))

(use-package keychain-environment
  :ensure t
  :hook (after-init . keychain-refresh-environment))

; ; Minor optimizations, copied from doom-emacs
(setq fast-but-imprecise-scrolling t)
(setq frame-inhibit-implied-resize t)
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)
(blink-cursor-mode -1)
(setq visible-cursor nil)
(setq x-stretch-cursor nil)

;; Don't resize windows & frames in steps; it's prohibitive to prevent the user
;; from resizing it to exact dimensions, and looks weird.
(setq window-resize-pixelwise t
      frame-resize-pixelwise t)

(setq window-divider-default-places t
      window-divider-default-bottom-width 1
      window-divider-default-right-width 1)
(window-divider-mode)

(setq echo-keystrokes 0.02)

(setq minibuffer-prompt-properties '(read-only t intangible t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(setq ansi-color-for-comint-mode t)

;; always avoid GUI
(setq use-dialog-box nil)
;; Don't display floating tooltips; display their contents in the echo-area,
;; because native tooltips are ugly.
(when (bound-and-true-p tooltip-mode)
  (tooltip-mode -1))

;; Explicitly define a width to reduce computation
(setq-default display-line-numbers-width 3)

;; Show absolute line numbers for narrowed regions makes it easier to tell the
;; buffer is narrowed, and where you are, exactly.
(setq-default display-line-numbers-widen t)

;; Underline looks a bit better when drawn lower
(setq x-underline-at-descent-line t)

(use-package coverlay
  :ensure t
  :diminish coverlay-minor-mode
  :config
  (global-coverlay-mode))

(use-package popper
  :ensure t
  :bind (("s-p"   . popper-toggle-latest)
         ("M-p"   . popper-cycle)
         ("M-s-p" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*HTTP Response\\*"
          help-mode
          compilation-mode))
  (popper-mode +1))

(use-package consult-dir
  :ensure t
  :bind (("C-x C-d" . consult-dir)
         :map minibuffer-local-completion-map
         ("C-x C-d" . consult-dir)
         ("C-x C-j" . consult-dir-jump-file)))

(use-package jq-mode
  :ensure t)

(use-package crontab-mode
  :ensure t)

;; PlantUML — uses the homebrew-installed `plantuml' CLI; no bundled jar.
(use-package plantuml-mode
  :ensure t
  :mode "\\.plantuml\\'"
  :config
  (setq plantuml-default-exec-mode 'executable
        plantuml-executable-path (or (executable-find "plantuml") "plantuml")
        plantuml-output-type "png"))

(use-package flycheck-plantuml
  :ensure t
  :after (flycheck plantuml-mode)
  :config (flycheck-plantuml-setup))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(setq desktop-restore-frames t)
(setq desktop-restore-in-current-display t)
(setq desktop-restore-forces-onscreen nil)

(defun wcx/mouse-goto-definition (event)
  "Move point to the mouse click position, then jump to definition.
Uses `xref-find-definitions', which delegates to eglot when an LSP
server is active and falls back to dumb-jump otherwise."
  (interactive "e")
  (let ((posn (event-end event)))
    (when (windowp (posn-window posn))
      (select-window (posn-window posn)))
    (when (numberp (posn-point posn))
      (goto-char (posn-point posn))))
  (call-interactively #'xref-find-definitions))

(defun wcx/mouse-find-references (event)
  "Move point to the mouse click position, then list references."
  (interactive "e")
  (let ((posn (event-end event)))
    (when (windowp (posn-window posn))
      (select-window (posn-window posn)))
    (when (numberp (posn-point posn))
      (goto-char (posn-point posn))))
  (call-interactively #'xref-find-references))

;; Cmd+click (macOS) and Ctrl+click → go to definition.
;; Shift+Cmd+click and Shift+Ctrl+click → find references.
;; Suppress the down-events so the click doesn't drag-select.
(global-set-key [C-down-mouse-1] nil)
(global-set-key [s-down-mouse-1] nil)
(global-set-key [C-S-down-mouse-1] nil)
(global-set-key [s-S-down-mouse-1] nil)
(global-set-key [C-mouse-1] #'wcx/mouse-goto-definition)
(global-set-key [s-mouse-1] #'wcx/mouse-goto-definition)
(global-set-key [C-S-mouse-1] #'wcx/mouse-find-references)
(global-set-key [s-S-mouse-1] #'wcx/mouse-find-references)

;; Debugger (deferred — only loads when invoked).
(use-package realgud
  :ensure t
  :defer t
  :commands (realgud:ipdb realgud:pdb realgud:trepan3k))

(provide 'wcx-generic)
;;; wcx-generic.el ends here

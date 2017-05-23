;;; wcx-generic.el --- Generic customizations.
;;; Commentary:
;;; Code
(menu-bar-mode 0)

;;(horizontal-scroll-bar-mode 0)
(setq frame-title-format "emacs [%b]"
      icon-title-format "emacs [%b]"
      scroll-conservatively 1)
(windmove-default-keybindings 'meta)

;; ----- FontRelated Stuff
;(setq emacs-font "Envy Code R-11")
;;(setq emacs-font "Input Sans Narrow Thin-11")
;;(setq emacs-font "M+ 1mn regular-10.5")
;;(setq emacs-font "M+ 1m regular-10.5")
;;(setq emacs-font "M+ 2m regular-11")
;;(setq emacs-font "M+ 1p regular-11")
;;(setq emacs-font "SourceCode Pro-10.5")
;;(setq emacs-font "PragmataPro-11")
;;(setq emacs-font "Mensch-10.5")
;;(setq emacs-font "Monaco-11")
;;(setq emacs-font "Inconsolata-11")
;;(setq emacs-font "Inconsolata-g-11")
;;(setq emacs-font "NotoSans-10.5")
;;(setq emacs-font "anonymous Pro-12")
;;(setq emacs-font "Consolas-11")
;;(setq emacs-font "Lucida Grande Mono-10.5")
;(setq emacs-font "MesloLGSDZ-10.5")
(setq emacs-font "Hack-10.5")
;;(setq emacs-font "DejaVu Sans Mono-10.5")
;;(setq emacs-font "FiraMono-10.5")
;;(setq emacs-font "Hermit-10")
;; (set-frame-font emacs-font)
(if (display-graphic-p)
    (set-face-attribute 'default nil :font emacs-font))

;;; It is always better to know current line and column number
(column-number-mode t)
(line-number-mode t)

;;; Overwrite selection
(delete-selection-mode t)

;;; Make all yes-or-no questions as y-or-n
(fset 'yes-or-no-p 'y-or-n-p)

;;; Change cursor into a bar instead of a block
(setq-default cursor-type 'bar)

;; Highlight parentheses according to nesting level
(when (locate-library "highlight-parentheses")
  (require 'highlight-parentheses)
  (add-hook 'find-file-hooks 'highlight-parentheses-mode))

(put 'narrow-to-region 'disabled nil)

(display-time-mode 0)

(add-hook 'conf-javaprop-mode-hook
          '(lambda () (conf-quote-normal nil)))

(winner-mode 1)

;; Some hooks
;; (add-hook 'term-mode-hook '(lambda () (yas/minor-mode nil)))
(add-hook 'python-mode-hook '(lambda () (yas/minor-mode 1)))

(mouse-avoidance-mode 'cat-and-mouse)

;; Buffer naming strategy
(require 'uniquify)

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
                                   (smex-major-mode-commands)))


(use-package ido-vertical-mode
  :ensure t
  :config
  (ido-vertical-mode 1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-and-down))

(when (locate-library "yascroll")
  (load-library "yascroll")
  (global-yascroll-bar-mode 1))

;; (when (locate-library "smooth-scroll")
;;   (load-library "smooth-scroll")
;;   (smooth-scroll-mode))

(when (locate-library "json")
  (load-library "json"))

(when (locate-library "ido-ubiquitous")
  (load-library "ido-ubiquitous"))

(when (locate-library "rfringe")
  (load-library "rfringe"))

(when (locate-library "emacsd-tile")
  (load-library "emacsd-tile"))

(when (locate-library "frame-tag")
  (load-library "frame-tag")
  (frame-tag-mode 1))

(when (locate-library "git-commit")
  (load-library "git-commit"))

(when (locate-library "hideshowvis")
  (load-library "hideshowvis")
  (hideshowvis-minor-mode 1))

(when (locate-library "loccur")
  (load-library "loccur")

  ;; defines shortcut for loccur of the current word
  (define-key global-map [(control o)] 'loccur-current)
  ;; defines shortcut for the interactive loccur command
  (define-key global-map [(control meta o)] 'loccur)
  ;; defines shortcut for the loccur of the previously found word
  (define-key global-map [(control shift o)] 'loccur-previous-match))

(when (locate-library "dropdown-list")
  (load-library "dropdown-list"))

(when (locate-library "switch-window")
  (require 'switch-window)
  (global-set-key (kbd "C-x o") 'switch-window))

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
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(setq gc-cons-threshold 20000000)

;; (add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))

(when (locate-library "dired+")
  (load-library "dired+"))

(when (locate-library "whitespace-cleanup-mode")
  (load-library "whitespace-cleanup-mode")
  (global-whitespace-cleanup-mode))

(when (locate-library "exec-path-from-shell")
  (exec-path-from-shell-initialize))

(global-ede-mode 1)
(require 'semantic/sb)
(semantic-mode 1)

;; Post 24.4 stuff
(superword-mode 1)
(electric-pair-mode)  ;; Replaces autopair
(electric-indent-mode 0)  ;; Currently annoying on python-mode

(when (locate-library "smart-shift")
  (load-library "smart-shift")
  (global-smart-shift-mode 1))


(when (locate-library "toggle-quotes")
  (load-library "toggle-quotes")

  (global-set-key [?\C-c ?\C-x ?q] 'toggle-quotes))

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(use-package zeal-at-point
  :ensure t
  :bind (("C-c d" . zeal-at-point)))

(use-package vimish-fold
  :ensure t
  :config
  (vimish-fold-global-mode 1)
  :bind (("C-c g" . vimish-fold-toggle)
         ("C-c f f" . vimish-fold)
         ("C-c f v" . vimish-fold-delete)
         ("C-c f a" . vimish-fold-unfold-all)
  ))

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
             (ffip-project-root)
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
  :bind (([f8] . neotree-project-dir-toggle)))

(use-package nlinum
  :ensure t
  :bind (("C-c C-x l" . global-nlinum-mode)))

(use-package csv
  :ensure t)

(use-package anzu
  :ensure t
  :config
  (global-anzu-mode +1)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))

(provide 'wcx-generic)
;;; wcx-generic.el ends here

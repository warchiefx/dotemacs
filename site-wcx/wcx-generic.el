;;; wcx-generic.el --- Generic customizations.

;;; Code:
(which-function-mode t)
(menu-bar-mode 0)
(setq frame-title-format "emacs [%b]"
      icon-title-format "emacs [%b]"
      scroll-conservatively 1)
(windmove-default-keybindings 'meta)

;; ----- FontRelated Stuff
(setq emacs-font "Envy Code R-11.5")
;;(setq emacs-font "M+ 1mn regular-12")
;; (setq emacs-font "SourceCode Pro-11")
;; (setq emacs-font "PragmataPro-11")
;;(setq emacs-font "Mensch-10.5")
;;(setq emacs-font "Inconsolata-11")
;;(setq emacs-font "Consolas-11")
;; (set-frame-font emacs-font)
(set-face-attribute 'default nil :font emacs-font)

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

                                        ;(global-hl-line-mode 1)
                                        ;(set-face-background 'hl-line "#111")

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

(when (locate-library "adaptive-wrap")
  (load-library "adaptive-wrap"))

(when (locate-library "dpaste")
  (load-library "dpaste"))

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
  (require 'switch-window))

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
(dolist (command '(yank yank-pop))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode lisp-mode
                                                     clojure-mode    scheme-mode
                                                     haskell-mode    ruby-mode
                                                     rspec-mode      python-mode
                                                     c-mode          c++-mode
                                                     objc-mode       latex-mode
                                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))

(define-key global-map (kbd "RET") 'newline-and-indent)

;; Auto refresh buffers
(global-auto-revert-mode 1)

;; Also auto refresh dired, but be quiet about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

(setq gc-cons-threshold 20000000)

(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))

(when (locate-library "dired+")
  (load-library "dired+"))

(when (locate-library "anzu")
  (load-library "anzu")
  (set-face-attribute 'anzu-mode-line nil
                      :foreground "yellow" :weight 'bold)
  (global-anzu-mode))

(when (locate-library "whitespace-cleanup-mode")
  (load-library "whitespace-cleanup-mode")
  (global-whitespace-cleanup-mode))

(provide 'wcx-generic)

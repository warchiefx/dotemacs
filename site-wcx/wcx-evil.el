;;; wcx-evil.el --- Integrate EVIL vim compatibility

(use-package evil
  :ensure t
  :diminish undo-tree-mode
  :config
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
  (setq evil-default-state 'normal)
  (evil-set-initial-state 'org-mode 'emacs)
  (evil-set-initial-state 'git-commit-mode 'emacs)
  (evil-set-initial-state 'with-editor-mode 'emacs)
  (evil-set-initial-state 'paradox-menu-mode 'emacs)
  (evil-mode 1))

(use-package evil-anzu
  :ensure t
  :after evil)

(use-package evil-matchit
  :ensure t
  :after evil)

; Allow escaping of lots of things
(use-package evil-escape
  :ensure t
  :config
  (progn
    (evil-escape-mode)
    (global-set-key (kbd "<escape>") 'evil-escape))
  :diminish evil-escape-mode)

; C-+ C-- to increase/decrease number like Vim's C-a C-x
(use-package evil-numbers
  :ensure t
  :config
  (progn
    (define-key evil-normal-state-map (kbd "C-=") 'evil-numbers/inc-at-pt)
    (define-key evil-normal-state-map (kbd "C--") 'evil-numbers/dec-at-pt)))

(use-package evil-surround
  :ensure t
  :after evil
  :config
  (progn
    (global-evil-surround-mode 1)))

(use-package evil-leader
  :ensure t
  :after evil
  :config
  (progn
    (setq evil-leader/in-all-states 1)
    (evil-leader/set-leader ","))
    ; ,x to be M-x
    (evil-leader/set-key "x" 'execute-extended-command)
    (evil-leader/set-key "e" 'evil-ace-jump-word-mode) ; ,e for Ace Jump (word)
    (evil-leader/set-key "l" 'evil-ace-jump-line-mode) ; ,l for Ace Jump (line)
    (global-evil-leader-mode))

(use-package evil-nerd-commenter
  :ensure t
  :demand t
  :after evil
  :bind (("M-;" . evilnc-comment-or-uncomment-lines)
         ("C-c c" . evilnc-copy-and-comment-lines))
  :config
  (evil-leader/set-key
    "ci" 'evilnc-comment-or-uncomment-lines
    "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    "acc" 'evilnc-copy-and-comment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    "cv" 'evilnc-toggle-invert-comment-line-by-line
    "."  'evilnc-copy-and-comment-operator
    "\\" 'evilnc-comment-operator ; if you prefer backslash key
    ))

(use-package evil-goggles
  :ensure t
  :config
  (evil-goggles-mode)
  ;; optionally use diff-mode's faces; as a result, deleted text
  ;; will be highlighed with `diff-removed` face which is typically
  ;; some red color (as defined by the color theme)
  ;; other faces such as `diff-added` will be used for other actions
  (evil-goggles-use-diff-faces)
  :diminish (evil-goggles-mode))

(use-package evil-space
  :ensure t
  :config
  (evil-space-mode)
  :diminish (evil-space-mode))

(use-package evil-tutor
  :ensure evil-tutor)

(use-package evil-vimish-fold
  :ensure t
  :config
  (evil-vimish-fold-mode 1)
  :diminish evil-vimish-fold-mode)

(provide 'wcx-evil)

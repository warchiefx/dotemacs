;;; wcx-evil.el --- Integrate EVIL vim compatibility

(setq evil-want-integration 't)
(setq evil-want-keybinding nil)

(use-package evil
  :ensure t
  :diminish undo-tree-mode
  :config
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
  (setq evil-default-state 'normal)
  ;; (evil-set-initial-state 'org-mode 'emacs)
  (evil-set-initial-state 'git-commit-mode 'emacs)
  (evil-set-initial-state 'with-editor-mode 'emacs)
  (evil-set-initial-state 'paradox-menu-mode 'emacs)
  (evil-set-initial-state 'flycheck-error-list-mode 'emacs)
  (evil-set-initial-state 'dashboard-mode 'emacs)
  (evil-set-initial-state 'neotree-mode 'emacs)
  (evil-set-initial-state 'eww-mode 'emacs)
  (evil-set-initial-state 'magit-blame-mode 'emacs)
  (evil-set-initial-state 'git-blame-mode 'emacs)
  (evil-set-initial-state 'indium-repl-mode 'emacs)
  (add-hook 'git-commit-mode-hook 'evil-emacs-state)
  (evil-set-initial-state 'magit-log-edit-mode 'insert)
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

(use-package helm-projectile
  :bind (("C-S-P" . helm-projectile-switch-project)
         :map evil-normal-state-map
         ("C-p" . helm-projectile))
  :ensure t
  :config
  (evil-leader/set-key
    "ps" 'helm-projectile-ag
    "pa" 'helm-projectile-find-file-in-known-projects
    ))

(use-package evil-args
  :ensure t
  :config
  ;; bind evil-args text objects
  (define-key evil-inner-text-objects-map "a" 'evil-inner-arg)
  (define-key evil-outer-text-objects-map "a" 'evil-outer-arg)

  ;; bind evil-forward/backward-args
  (define-key evil-normal-state-map "L" 'evil-forward-arg)
  (define-key evil-normal-state-map "H" 'evil-backward-arg)
  (define-key evil-motion-state-map "L" 'evil-forward-arg)
  (define-key evil-motion-state-map "H" 'evil-backward-arg)

  ;; bind evil-jump-out-args
  (define-key evil-normal-state-map "K" 'evil-jump-out-args))

(use-package exato :ensure t)

(use-package evil-org
  :ensure t
  :after (evil org)
  :diminish evil-org-mode
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme '(navigation insert textobjects heading todo)))))

(use-package evil-collection
  :ensure t
  :custom (evil-collection-setup-minibuffer t)
  :init (evil-collection-init))

;; (use-package evil-mc
;;   :ensure t
;;   :diminish (evil-mc-mode)
;;   :config
;;   (evil-define-local-var evil-mc-custom-paused nil
;;     "Paused functionality when there are multiple cursors active.")

;;   (defvar evil-mc-mode-line-prefix "ⓜ"
;;     "Override of the default mode line string for `evil-mc-mode'.")

;;   (global-evil-mc-mode 1))

(use-package evil-multiedit
  :ensure t
  :after evil
  :config
  (evil-multiedit-default-keybinds))

(use-package evil-exchange
  :ensure t
  :config
  (evil-exchange-install))

(evil-define-operator evil-narrow-op (beg end type)
  "Evil indirect *narrow* operator."
  (interactive "<R>")
  (deactivate-mark)
  (let ((buf (clone-indirect-buffer nil nil)))
    (with-current-buffer buf
      (narrow-to-region beg end))
    (split-window-sensibly)
    (switch-to-buffer buf)))

(define-key evil-motion-state-map (kbd "g n") #'evil-narrow-op)

(when (package-installed-p 'expand-region)
  (use-package evil-indent-plus
    :ensure t
    :config
    (evil-indent-plus-default-bindings))

  (defun evil-visual-char-or-expand-region ()
    (interactive)
    (if (region-active-p)
        (call-interactively 'er/expand-region)
      (evil-visual-char)))

  (define-key evil-normal-state-map "v" 'evil-visual-char-or-expand-region)
  (define-key evil-visual-state-map "v" 'evil-visual-char-or-expand-region)
  (define-key evil-visual-state-map (kbd "M-v") 'er/contract-region)
  (define-key evil-visual-state-map [escape] 'evil-visual-char))

;; Taken from https://emacs.stackexchange.com/questions/47924/how-to-transpose-two-arguments-of-a-function-call-for-c-family-languages/47934#47934
(defun c-forward-to-argsep ()
  "Move to the end of the current c function argument.
Returns point."
  (interactive)
  (while
      (progn (comment-forward most-positive-fixnum)
             (looking-at "[^,)]"))
    (forward-sexp))
  (point)
  )

(defun c-backward-to-argsep ()
  "Move to the beginning of the current c function argument.
Returns point."
  (interactive)
  (let ((pt (point)) cur)
    (up-list -1)
    (forward-char)
    (while
        (progn
          (setq cur (point))
          (> pt (c-forward-to-argsep))
          )
      (forward-char)
      )
    (goto-char cur))
  )
(defun c-transpose-args-direction (is_forward)
  "Transpose two arguments of a c-function.
The first arg is the one with point in it."
  (interactive)
  (let*
      (
       ;; only different to pt when not 'is_forward'
       (pt-original (point))
       (pt
        (progn
          (when (not is_forward)
            (goto-char (- (c-backward-to-argsep) 1))
            (unless (looking-at ",")
              (goto-char pt-original)
              (user-error "Argument separator not found"))
            )
          (point))
        )
       (b (c-backward-to-argsep))
       (sep
        (progn (goto-char pt)
               (c-forward-to-argsep)))
       (e
        (progn
          (unless (looking-at ",")
            (goto-char pt-original)
            (user-error "Argument separator not found"))
          (forward-char)
          (c-forward-to-argsep))
        )
       (ws-first
        (buffer-substring-no-properties
         (goto-char b)
         (progn (skip-chars-forward "[[:space:]\n]")
                (point))
         )
        )
       (first (buffer-substring-no-properties (point) sep))
       (ws-second
        (buffer-substring-no-properties
         (goto-char (1+ sep))
         (progn (skip-chars-forward "[[:space:]\n]")
                (point))
         )
        )
       (second (buffer-substring-no-properties (point) e))
       )
    (delete-region b e)
    (insert ws-first second "," ws-second first)

    ;; Correct the cursor location to be on the same character.
    (if is_forward
        (goto-char
         (+
          ;; word start.
          (- (point) (length first))
          ;; Apply initial offset within the word.
          (- pt b (length ws-first))
          )
         )
      (goto-char
       (+
        b (length ws-first)
        ;; Apply initial offset within the word.
        (- pt-original (+ pt 1 (length ws-second)))
        )
       )
      )
    )
  )


(defun c-transpose-args-forward () (interactive) (c-transpose-args-direction t))
(defun c-transpose-args-backward () (interactive) (c-transpose-args-direction nil))

(evil-leader/set-key "l" '(lambda () (interactive) (c-transpose-args-forward)))
(evil-leader/set-key "h" '(lambda () (interactive) (c-transpose-args-backward)))

(provide 'wcx-evil)

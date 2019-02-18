;;; wcx-keybindings.el --- Custom keys
;;
;; Created: Wed Oct 22 11:26:05 2008
;;; Commentary:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

(global-set-key [?\C-c ?\C-x ?c] 'comment-or-uncomment-region)
(global-set-key [?\C-c ?\C-x ?w] 'whitespace-cleanup)
(global-set-key [M-return] 'expand-abbrev)

(defun scroll-one-line-up (&optional arg)
  (interactive "p")
  (scroll-up (or arg 1)))

(defun scroll-one-line-down (&optional arg)
  (interactive "p")
  (scroll-down (or arg 1)))

;; Expand Region
(use-package expand-region
  :ensure t
  :bind (([f4] . er/expand-region)))

(use-package smart-hungry-delete
  :ensure t
  :bind (("<backspace>" . smart-hungry-delete-backward-char)
         ("C-d" . smart-hungry-delete-forward-char))
  :defer nil ;; dont defer so we can add our functions to hooks
  :config (smart-hungry-delete-add-default-hooks))

;; Nav keys
(global-set-key [S-up] 'scroll-one-line-down)
(global-set-key [S-down] 'scroll-one-line-up)
(global-set-key [S-right] 'forward-word)
(global-set-key [S-left] 'backward-word)
(global-set-key [C-right] 'forward-sentence)
(global-set-key [C-left] 'backward-sentence)

;; Rebind M-x to another sets of keys after swapping Ctrl and Caps
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

;; Better backspace
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Macros
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [S-f5] 'edit-last-kbd-macro)
(global-set-key [f2] 'start-kbd-macro)
(global-set-key [(control f2)] 'end-kbd-macro)


;; Toggle menu-bar-mode
(global-set-key [C-f10] 'menu-bar-mode)

;; Temporarily show line-numbers when using Goto-line
(global-set-key [remap goto-line] 'goto-line-with-feedback)

(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))

;; Mouse nav
(global-set-key [mouse-8] 'scroll-up)
(global-set-key [mouse-9] 'scroll-down)

;; term
;;(global-set-key [f2] 'ansi-term)

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)

;; Rename current file, easy way
(defun rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: " filename)))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(global-set-key (kbd "C-x C-r") 'rename-current-buffer-file)


(use-package multiple-cursors
  :ensure t
  :bind (("C-#" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ([?\C-c ?m ?a] . mc/mark-all-like-this)))

(use-package rainbow-mode
  :ensure t
  :bind (([?\C-c ?\C-x ?r] . rainbow-mode)))

;; (use-package guide-key
;;   :ensure t
;;   :demand t
;;   :init
;;   (setq guide-key/guide-key-sequence '("C-c C-x" "C-c" "C-,"))
;;   :config
;;   (guide-key-mode t)
;;   :bind ([?\C-c ?\C-x ?k] . guide-key-mode))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config
  (which-key-mode))

(use-package symbol-overlay
  :ensure t
  :bind (([(f6)] . symbol-overlay-put)
         ;; ([(control f6 n)] . symbol-overlay-switch-forward)
         ;; ([(control f6 p)] . symbol-overlay-switch-backward)
         ([(shift f6 )] . symbol-overlay-rename)
         ))

(use-package goto-chg
  :ensure t
  :bind (([(control .)] . goto-last-change)))

(global-set-key [?\C-x ?\C-b] 'ibuffer)

(use-package ibuffer-vc
  :ensure t
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-auto-mode 1)
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic))))
  (setq ibuffer-formats
        '((mark modified read-only vc-status-mini " "
                (name 18 18 :left :elide)
                " "
                (size 9 -1 :right)
                " "
                (mode 16 16 :left :elide)
                " "
                (vc-status 16 16 :left)
                " "
                filename-and-process)))
  (setq ibuffer-expert t)
  (setq ibuffer-show-empty-filter-groups nil))

(use-package embrace
  :ensure t
  :bind ("C-M-," . embrace-commander))

;; Taken from https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org#inline
(global-set-key [remap move-beginning-of-line] 'me/beginning-of-line-dwim)

(defun me/beginning-of-line-dwim ()
  "Move point to first non-whitespace character, or beginning of line."
  (interactive "^")
  (let ((origin (point)))
    (beginning-of-line)
    (and (= origin (point))
         (back-to-indentation))))


(global-set-key [remap backward-paragraph] 'me/backward-paragraph-dwim)
(global-set-key [remap forward-paragraph] 'me/forward-paragraph-dwim)

(defun me/backward-paragraph-dwim ()
  "Move backward to start of paragraph."
  (interactive "^")
  (skip-chars-backward "\n")
  (unless (search-backward-regexp "\n[[:blank:]]*\n" nil t)
    (goto-char (point-min)))
  (skip-chars-forward "\n"))

(defun me/forward-paragraph-dwim ()
  "Move forward to start of next paragraph."
  (interactive "^")
  (skip-chars-forward "\n")
  (unless (search-forward-regexp "\n[[:blank:]]*\n" nil t)
    (goto-char (point-max)))
  (skip-chars-forward "\n"))

(use-package hydra
  :ensure t
  :bind
  ("C-c <tab>" . hydra-fold/body)
  ("C-c g" . hydra-magit/body)
  ("C-c ;" . hydra-projectile/body)
  :config (setq-default hydra-default-hint nil))

(defhydra hydra-fold (:color pink)
  "
^
^Fold^              ^Do^                ^Jump^              ^Toggle^
^────^──────────────^──^────────────────^────^──────────────^──────^────────────
_q_ quit            _f_ fold            _<_ previous        _<tab>_ current
^^                  _k_ kill            _>_ next            _S-<tab>_ all
^^                  _K_ kill all        ^^                  ^^
^^                  ^^                  ^^                  ^^
"
  ("q" nil)
  ("<tab>" vimish-fold-toggle)
  ("S-<tab>" vimish-fold-toggle-all)
  ("<" vimish-fold-previous-fold)
  (">" vimish-fold-next-fold)
  ("f" vimish-fold)
  ("k" vimish-fold-delete)
  ("K" vimish-fold-delete-all))

(defhydra hydra-magit (:color blue)
  "
^
^Magit^             ^Do^
^─────^─────────────^──^────────────────
_q_ quit            _b_ blame
^^                  _c_ clone
^^                  _i_ init
^^                  _s_ status
^^                  _h_ timemachine
^^                  ^^
"
  ("q" nil)
  ("b" magit-blame)
  ("c" magit-clone)
  ("i" magit-init)
  ("s" magit-status)
  ("h" git-timemachine))

(defhydra hydra-projectile (:color blue)
  "
^
^Projectile^        ^Buffers^           ^Find^              ^Search^
^──────────^────────^───────^───────────^────^──────────────^──────^────────────
_q_ quit            _b_ list            _d_ directory       _r_ replace
_i_ reset cache     _K_ kill all        _D_ root            _s_ ag
_m_ make            _S_ save all        _f_ file            ^^
^^                  ^^                  _p_ project         ^^
^^                  ^^                  ^^                  ^^
"
  ("q" nil)
  ("b" helm-projectile-switch-to-buffer)
  ("m" makefile-executor-execute-project-target)
  ("d" helm-projectile-find-dir)
  ("D" projectile-dired)
  ("f" helm-projectile-find-file)
  ("i" projectile-invalidate-cache :color red)
  ("K" projectile-kill-buffers)
  ("p" helm-projectile-switch-project)
  ("r" projectile-replace)
  ("s" helm-projectile-ag)
  ("S" projectile-save-project-buffers))

(defhydra hydra-undo-tree (:color yellow
                                  :hint nil
                                  )
  "
  _p_: undo  _n_: redo _s_: save _l_: load   "
  ("p"   undo-tree-undo)
  ("n"   undo-tree-redo)
  ("s"   undo-tree-save-history)
  ("l"   undo-tree-load-history)
  ("u"   undo-tree-visualize "visualize" :color blue)
  ("q"   nil "quit" :color blue))

;; Undo & Redo
(global-set-key [f3] 'undo) ;; or whatever

(provide 'wcx-keybindings)

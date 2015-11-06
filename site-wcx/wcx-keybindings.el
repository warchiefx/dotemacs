;;; wcx-keybindings.el --- Custom keys
;;
;; Created: Wed Oct 22 11:26:05 2008
;;; Commentary:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Code:

(global-set-key [?\C-c ?\C-x ?c] 'comment-or-uncomment-region)
(global-set-key [?\C-c ?\C-x ?w] 'whitespace-cleanup)
(global-set-key [M-return] 'expand-abbrev)
(global-set-key (quote [f8]) 'gnus)

(defun wcx/autopep8()
  (interactive)
  (py-autopep8))

(global-set-key [?\C-c ?\C-x ?a] 'wcx/autopep8)

(defun scroll-one-line-up (&optional arg)
  (interactive "p")
  (scroll-up (or arg 1)))

(defun scroll-one-line-down (&optional arg)
  (interactive "p")
  (scroll-down (or arg 1)))

;; Expand Region
(when (locate-library "expand-region")
  (global-set-key [f4] 'er/expand-region))

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
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

;; Macros
(global-set-key [f5] 'call-last-kbd-macro)
(global-set-key [S-f5] 'edit-last-kbd-macro)
(global-set-key [f2] 'start-kbd-macro)
(global-set-key [(control f2)] 'end-kbd-macro)

;; Undo & Redo
(global-set-key [f3] 'undo)

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

(when (locate-library "multiple-cursors")
  (load-library "multiple-cursors")
  (global-set-key (kbd "C-#") 'mc/edit-lines)
  (global-set-key [?\C-c ?m ?n] 'mc/mark-next-like-this)
  (global-set-key [?\C-c ?m ?p] 'mc/mark-previous-like-this)
  (global-set-key [?\C-c ?m ?a] 'mc/mark-all-like-this))

(when (locate-library "mark-more-like-this")
  (load-library "mark-more-like-this")

  (global-set-key (kbd "C-<") 'mark-previous-like-this)
  (global-set-key (kbd "C->") 'mark-next-like-this))

(when (locate-library "rainbow-mode")
  (load-library "rainbow-mode")
  (global-set-key [?\C-c ?\C-x ?r] 'rainbow-mode))

;;(when (locate-library "aggressive-indent")
;;  (load-library "aggressive-indent")
;;  (global-set-key [?\C-c ?\C-x ?i] 'global-aggressive-indent-mode))

(when (locate-library "pyvenv")
  (global-set-key [?\C-c ?\C-x ?v] 'pyvenv-workon))

(when (locate-library "guide-key")
  (load-library "guide-key")
  (setq guide-key/guide-key-sequence '("C-c p" "C-c C-x" "C-c" "C-c z"))
  (guide-key-mode 1)
  (global-set-key [?\C-c ?\C-x ?k] 'guide-key-mode))  ; Enable guide-key-mode

(when (locate-library "highlight-symbol")
  (require 'highlight-symbol)
  (global-set-key [f6] 'highlight-symbol-at-point)
  (global-set-key [(control f6)] 'highlight-symbol-next)
  (global-set-key [(shift f6)] 'highlight-symbol-prev)
  (global-set-key [(meta f6)] 'highlight-symbol-query-replace))

(when (locate-library "goto-chg")
  (require 'goto-chg)
  (global-set-key [(control .)] 'goto-last-change)
  ; M-. can conflict with etags tag search. But C-. can get overwritten
  ; by flyspell-auto-correct-word. And goto-last-change needs a really
  ; fast key.
  (global-set-key [(meta .)] 'goto-last-change))

(global-set-key [?\C-x ?\C-b] 'ibuffer)

(provide 'wcx-keybindings)

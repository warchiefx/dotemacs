;;; wcx-keybindings.el --- Custom keys
;; 
;; Filename: wcx-keybindings.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:26:05 2008
;; 
;; Last-Updated: Wed May  5 16:15:27 2010 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (quote [f6]) 'compile)
(global-set-key [?\C-c ?\C-x ?c] 'comment-or-uncomment-region)
(global-set-key [?\C-c ?\C-x ?w] 'whitespace-cleanup)
(global-set-key [M-return] 'expand-abbrev)
(global-set-key (quote [f8]) 'gnus)

(defun scroll-one-line-up (&optional arg)
  (interactive "p")
  (scroll-up (or arg 1)))

(defun scroll-one-line-down (&optional arg)
  (interactive "p")
  (scroll-down (or arg 1)))

;; Expand Region
(when (locate-library "expand-region")
  (global-set-key "\C-@" 'er/expand-region))

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
(global-set-key [f2] 'start-kbd-macro)
(global-set-key [f4] 'end-kbd-macro)

;; Undo & Redo
(global-set-key [f3] 'undo)

;; Toggle menu-bar-mode
(global-set-key [C-f10] 'menu-bar-mode)

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

(when (locate-library "guide-key")
  (load-library "guide-key")
  (setq guide-key/guide-key-sequence '("C-c p" "C-c C-x"))
  (guide-key-mode 1)
  (global-set-key [?\C-c ?\C-x ?k] 'guide-key-mode))  ; Enable guide-key-mode


(provide 'wcx-keybindings)

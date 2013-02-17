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

(provide 'wcx-keybindings)

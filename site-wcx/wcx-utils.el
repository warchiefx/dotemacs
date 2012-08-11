;;; wcx-utils.el --- Utility Functions and modules
;;
;; Filename: wcx-utils.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:43:19 2008
;;
;; Last-Updated: Wed Oct 22 16:03:00 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; When inserting ""s or ()s, insert the ending one right after.
(when (locate-library "pair-mode")
  (load-library "pair-mode")
  (global-set-key [?\C-c ?u ?p] 'pair-mode))

;; Extensions to info-mode
(when (locate-library "info+")
  (eval-after-load "info" '(require 'info+)))

;; Better dabbrev.
;; (when (locate-library "pabbrev")
;;   (load-library "pabbrev")
;;   (pabbrev-mode)
;;   (global-set-key [?\C-c ?u ?a] 'pabbrev-mode))

;; Remember mode
(add-to-list 'load-path (concat site-lisp-path "remember"))
(when (locate-library "remember")
  (require 'remember))

;; ----- Misc Stuff
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command
   (format "find %s -type f -name *.[ch] | etags -" dir-name)))

(defun ensure-mark ()
  ;; make sure mark is active
  ;; test if it is active, if it isn't, set it and activate it
  (and (not mark-active) (set-mark-command nil)))

(defun iwb ()
  "Indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(defun clone-buffer-and-narrow-to-function ()
  (interactive)
  (clone-indirect-buffer-other-window (which-function) 'pop-to-buffer)
  (mark-defun) ; works not only in emacs-lisp, but C++, Python, ...
  (narrow-to-region (mark) (point))
  (pop-mark)
  (other-window 1))
(define-key global-map (kbd "C-x 4 n") 'clone-buffer-and-narrow-to-function) ; or whatever key you prefer

(provide 'wcx-utils)

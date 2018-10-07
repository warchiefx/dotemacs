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


(defun executable-find (command)
  "Search for COMMAND in `exec-path' and return the absolute file name.
Return nil if COMMAND is not found anywhere in `exec-path'."
  ;; Use 1 rather than file-executable-p to better match the behavior of
  ;; call-process.
  (locate-file command exec-path exec-suffixes 1))


(provide 'wcx-utils)

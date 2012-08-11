;;; wcx-iswitchb.el --- iswitchb-mode configuration
;; 
;; Filename: wcx-iswitchb.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 14:02:21 2008
;; 
;; Last-Updated: Tue Oct 28 10:56:29 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Better buffer switcher
(when (locate-library "iswitchb")
  (require 'iswitchb)
  (iswitchb-mode 1)

  ;; Files to ignore
  (add-to-list 'iswitchb-buffer-ignore "^ ")
  (add-to-list 'iswitchb-buffer-ignore "*Messages*")
  (add-to-list 'iswitchb-buffer-ignore "*ECB")
  (add-to-list 'iswitchb-buffer-ignore "*Buffer")
  (add-to-list 'iswitchb-buffer-ignore "*Completions")
  (add-to-list 'iswitchb-buffer-ignore "*scratch*"))

;; (when (locate-library "filecache")
;;   (require 'filecache))

(provide 'wcx-iswitchb)
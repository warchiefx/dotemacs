;;; wcx-lua.el --- Lua-mode setup
;; 
;; Filename: wcx-lua.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 12:00:31 2008
;; 
;; Last-Updated: Wed Oct 22 12:00:56 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(when (locate-library "lua-mode")
  (setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
  (autoload 'lua-mode "lua-mode" "Lua editing mode." t))

(provide 'wcx-lua)
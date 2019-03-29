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


(use-package lua-mode
  :ensure t
  :mode "\\.lua\\'"
  :interpreter "lua"
  :config
  ;; (when (package-installed-p 'eglot)
  ;;   (add-to-list 'eglot-server-programs '(lua-mode . ("lua-lsp"))))
  )


(provide 'wcx-lua)

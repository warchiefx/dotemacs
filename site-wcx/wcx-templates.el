;;; wcx-templates.el --- Template/Snippets mechanisms
;; 
;; Filename: wcx-templates.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 12:03:11 2008
;; 
;; Last-Updated: Thu Oct 30 14:19:04 2008 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Code:
(when (locate-library "yasnippet")
  (add-hook 'nxml-mode-hook 'yas/minor-mode-on))

(provide 'wcx-templates)
;;; wcx-templates.el ends here

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
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  :diminish yas-minor-mode)

(use-package yasnippet-snippets
  :ensure t)

(provide 'wcx-templates)
;;; wcx-templates.el ends here

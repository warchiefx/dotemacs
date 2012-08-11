;;; wcx-scala.el --- Scala support
;; 
;; Filename: wcx-scala.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Thu Apr 23 17:22:15 2009
;; 
;; Last-Updated: Fri Apr 24 09:06:09 2009 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Fetch Scala-mode from: svn co http://lampsvn.epfl.ch/svn-repos/scala/scala-tool-support/trunk/src/emacs/ scala-mode

(setq scala-mode-path (concat site-lisp-path "scala-mode"))
(add-to-list 'load-path scala-mode-path)

(require 'scala-mode-auto)

(setq yas/scala-snippets-dir (concat scala-mode-path "/contrib/yasnippet/snippets"))
(yas/load-directory yas/scala-snippets-dir)

(add-hook 'scala-mode-hook
          '(lambda ()
             (yas/minor-mode-on)
             ))

(provide 'wcx-scala)
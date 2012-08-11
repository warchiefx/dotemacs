;;; wcx-anything.el --- Anything.el configuration
;;
;; Filename: wcx-anything.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Sat Oct 10 18:30:06 2009
;;
;; Last-Updated: Thu May 12 08:13:22 2011 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Now using the ELPA package
;; (add-to-list 'load-path (concat site-lisp-path "anything"))

(when (locate-library "anything")
  ;; (locate-library "anything-config"))
  (require 'anything-config)
  (require 'anything-extension)
  (require 'anything-match-plugin)
  (require 'anything-exuberant-ctags)
  ;; (require 'anything-ipython)
  ;; (require 'anything-complete)
  (global-set-key [C-f2] 'anything)

  ;; Custom sources
  (setq anything-sources
        '(anything-c-source-buffers+
          anything-c-source-occur
          anything-c-source-fixme
          anything-c-source-browse-code
          anything-c-source-files-in-current-dir+
          anything-c-source-google-suggest
          anything-c-source-recentf
          anything-c-source-file-name-history
          anything-c-source-locate
          anything-c-source-emacs-commands
          anything-c-source-ffap-guesser
          anything-c-source-ffap-line
          anything-c-source-complex-command-history
          anything-c-source-extended-command-history
          anything-c-source-bookmarks
          anything-c-source-org-headline
          anything-c-source-bbdb
          anything-c-source-calculation-result
          anything-c-source-buffer-not-found
          anything-c-source-semantic
          )))

(provide 'wcx-anything)

;;; wcx-gnus-nnrss.el --- Use gnus as an RSS reader
;; 
;; Filename: wcx-gnus-nnrss.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Feb 11 14:06:26 2009
;; 
;; Last-Updated: Wed Feb 11 14:34:42 2009 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'nnrss)

;; For more information: http://flash.metawaredesign.co.uk/2/.gnus

;; Gnus has built in support for RSS feeds, just hit "G R" and enter the feed
;; URL. Unfortunately Gnus will check RSS feeds everytime you check your email,
;; which is very impolite.
;;
;; To get around this, you set nnrss into local mode, which will fetch news
;; from locally stored RSS feeds.
(setq nnrss-use-local t)

(add-hook 'gnus-summary-mode-hook
          (lambda ()
            (if (string-match "^nnrss:.*" gnus-newsgroup-name)
                (progn
                  (make-local-variable 'gnus-show-threads)
                  (make-local-variable 'gnus-article-sort-functions)
                  (make-local-variable 'gnus-use-adaptive-scoring)
                  (make-local-variable 'gnus-use-scoring)
                  (make-local-variable 'gnus-score-find-score-files-function)
                  (make-local-variable 'gnus-summary-line-format)
                  (setq gnus-show-threads nil)
                  (setq gnus-article-sort-functions 'gnus-article-sort-by-date)
                  (setq gnus-use-adaptive-scoring nil)
                  (setq gnus-use-scoring t)
                  (setq gnus-score-find-score-files-function 'gnus-score-find-single)
                  (setq gnus-summary-line-format "%U%R%z%d %I%(%[ %s %]%)\n")))))

;; ;; Wait 2 hours between polls
;; (defvar my-nnrss-check-group-interval 7200
;;   "*Number of seconds between retrieval of RSS feeds.")

;; (defvar my-nnrss-check-group-time
;;   (- (time-to-seconds (current-time)) my-nnrss-check-group-interval)
;;   "Time of last RSS retrieval.")

;; ;; Calls an external script at the polling interval which downloads the feeds
;; ;; and stores them ready for checking. You generate this script by adding the
;; ;; feeds you want to check and running nnrss-generate-download-script in an
;; ;; empty buffer and saving it.
;; (defadvice nnrss-check-group (before my-nnrss-check-group activate)
;;   "Maybe call shell script to fetch RSS feeds.
;; Feeds are fetched every `my-nnrss-check-group-interval' seconds."
;;   (when (> (- (time-to-seconds (current-time))
;;               my-nnrss-check-group-time)
;;            my-nnrss-check-group-interval)
;;     (call-process "~/Apps/nnrss.sh")
;;     (setq my-nnrss-check-group-time (float-time))))

(provide 'wcx-gnus-nnrss)
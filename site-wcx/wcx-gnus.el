;;; wcx-gnus.el --- GNUS Configuration
;; 
;; Filename: wcx-gnus.el
;; Description: 
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:20:23 2008
;; 
;; Last-Updated: Sat Oct 10 19:59:59 2009 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load-paths
(add-to-list 'load-path (concat site-lisp-path "mailcrypt"))
(add-to-list 'load-path (concat site-lisp-path "bbdb"))

(require 'gnus-cite) 
  
(setq
 user-full-name "Ricardo Restituyo"
 user-mail-address "warchiefx@gmail.com"
 nnml-spool-file "/var/spool/mail/"
 display-time-mail-file (concat "/var/spool/mail/" (getenv "USER"))
 nnml-directory "~/.wcx-gnus/mail"
 message-default-charset `iso-8859-15
 gnus-select-method '(nnml "")
 gnus-signature-limit 500
 message-cite-function 'message-cite-original-without-signature)

;;  (setq gnus-secondary-select-methods
;;        '((nnimap "gmail IMAP"
;; 		 (nnimap-address "imap.gmail.com")
;; 		 (nnimap-server-port 993)
;; 		 (nnimap-authinfo-file "~/.authinfo")
;; 		 (nnimap-stream ssl))))

(add-to-list 'gnus-secondary-select-methods '(nnimap "gmail"
						     (nnimap-address "imap.gmail.com")
						     (nnimap-server-port 993)
                                                     (nnimap-authinfo-file "~/.authinfo.gpg")
						     (nnimap-stream ssl)))

;; Hide boring headers
(setq gnus-boring-article-headers
      '(empty long-to reply-to cc-list))

;; this puts the messages in several groups according to regexp
(setq nnmail-split-methods
      '(
	("Me" "^From.*warchiefx@gmail.com")
	("Me" "^From.*ricardo.restituyo@gmail.com")
	("Me" "^From.*ricardo@greenxolutions.com")
	
	("Asana" "^From.*@asana.com")
    ("Lesite.ca" "^To.*ricardo@lesite.ca")
    ("Codemera" "^To.*ricardo@codemera.com")
	("Inbox" "")))

(add-hook 'gnus-article-display-hook
	  '(lambda ()
	     (gnus-article-de-quoted-unreadable)
	     (gnus-article-emphasize)
	     (gnus-article-hide-boring-headers)
	     (gnus-article-hide-headers-if-wanted)
	     (gnus-article-show-pgp)
	     (gnus-article-highlight)
	     (gnus-article-highlight-citation)
	     ))
  
(setq gnus-message-archive-method
      '(nnfolder "archive"
		 (nnfolder-inhibit-expiry t)
		 (nnfolder-active-file "~/Mail/sent-mail/active")
		 (nnfolder-directory "~/Mail/sent-mail/")
		 (nnfolder-get-new-mail nil)))

(setq gnus-message-archive-group
      '((if (message-news-p)
	    "sent-news" 
	  (concat "sent-mail-" (format-time-string 
				"%Y-%m" (current-time))))))

(require 'smtpmail)

(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials (expand-file-name "~/.authinfo")
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

;; (setq message-send-mail-function 'smtpmail-send-it
;;       smtpmail-starttls-credentials '(("smtp.gmail.com" 25 nil nil))
;;       smtpmail-auth-credentials '(("smtp.gmail.com" 25 "warchiefx@gmail.com" nil))
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 25)


(setq starttls-use-gnutls t)
(setq starttls-gnutls-program "gnutls-cli")
(setq starttls-extra-arguments nil)

(when (locate-library "mailcrypt")
  (load-library "mailcrypt")
  (mc-setversion "gpg")
  (add-hook 'rmail-show-message-hook 'mc-install-read-mode)
  (add-hook 'gnus-show-message-hook 'mc-install-read-mode)
  (add-hook 'gnus-summary-mode-hook 'mc-install-read-mode)
  (add-hook 'message-mode-hook 'mc-install-write-mode)
  (add-hook 'news-reply-mode-hook 'mc-install-write-mode))

(when (locate-library "bbdb")
  (require 'bbdb)
  (bbdb-initialize 'gnus 'message))

;; Taken from http://emacs.wordpress.com/2007/10/07/gmail-envy/
(defvar *wcx-mails*
        "warchiefx@gmail.com\\|ricardo.restituyo@gmail.com")

(defun gnus-user-format-function-w (headers)
  (let ((to (gnus-extra-header 'To headers)))
    (if (string-match *wcx-mails* to)
        (if (string-match "," to) "~" "»")
        (if (or (string-match *wcx-mails*
                              (gnus-extra-header 'Cc headers))
                (string-match *wcx-mails*
                              (gnus-extra-header 'BCc headers)))
            "~"
            " "))))

(setq gnus-user-date-format-alist
      '(((gnus-seconds-today) . "Today, %H:%M")
        ((+ 86400 (gnus-seconds-today)) . "Yesterday, %H:%M")
        (604800 . "%A %H:%M") ;;that's one week
        ((gnus-seconds-month) . "%A %d")
        ((gnus-seconds-year) . "%B %d")
        (t . "%B %d '%y"))) ;;this one is used when no other does match

(setq gnus-summary-line-format
      (concat "%U%R %~(pad-right 2)t%* %uw %B%~(max-right 30)~(pad-right 30)n  "
              "%~(max-right 90)~(pad-right 90)s %-135=%&user-date;\n"))

(setq gnus-summary-mode-line-format "Gnus: %p [%A / Sc:%4z] %Z")

;; Scoring
(setq gnus-use-adaptive-scoring t)
(setq gnus-score-expiry-days 14)
(setq gnus-default-adaptive-score-alist
  '((gnus-unread-mark)
    (gnus-ticked-mark (from 4))
    (gnus-dormant-mark (from 5))
    (gnus-saved-mark (from 20) (subject 5))
    (gnus-del-mark (from -2) (subject -5))
    (gnus-read-mark (from 2) (subject 1))
    (gnus-killed-mark (from 0) (subject -3))))
    ;(gnus-killed-mark (from -1) (subject -3))))
    ;(gnus-kill-file-mark (from -9999)))
    ;(gnus-expirable-mark (from -1) (subject -1))
    ;(gnus-ancient-mark (subject -1))
    ;(gnus-low-score-mark (subject -1))
    ;(gnus-catchup-mark (subject -1))))

(setq gnus-score-decay-constant 1) ;default = 3
(setq gnus-score-decay-scale 0.03) ;default = 0.05

(setq gnus-decay-scores t) ;(gnus-decay-score 1000)

;; Misc options
(setq message-kill-buffer-on-exit t)
(add-hook 'message-mode-hook 'turn-on-auto-fill)
(add-hook 'message-sent-hook 'gnus-score-followup-article)
(add-hook 'message-sent-hook 'gnus-score-followup-thread)
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Only mails in these groups will expire, meaning they'll be deleted after a
;; week so long as I've read them.
(setq gnus-auto-expirable-newsgroups
      "nnrss:.*")

;; Stops sent emails appearing as new
(setq gnus-gcc-mark-as-read t)

;; GNUS registry
(require 'gnus-registry)
(gnus-registry-initialize)

;; Check mail every some minutes
(gnus-demon-add-handler 'gnus-group-get-news-news 2 t)
(gnus-demon-init)

;; Hooks
;; (defvar *gnus-current-polling-timer* nil)
;; (defvar wcx-gnus-polling-interval 300)
;; (defvar wcx-gnus-polling-function 'gnus-group-get-news-news)

;; (defun my-gnus-startup-hook ()
;;   (unless *gnus-current-polling-timer*
;;     (setq *gnus-current-polling-timer* (run-with-timer 
;;                                         wcx-gnus-polling-interval
;;                                         wcx-gnus-polling-interval
;;                                         wcx-gnus-polling-function))))

;; (defun my-gnus-shutdown-hook ()
;;   (when *gnus-current-polling-timer*
;;     (cancel-timer *gnus-current-polling-timer*)
;;     (setq *gnus-current-polling-timer* nil)))
    
;; (add-hook 'gnus-started-hook 'my-gnus-startup-hook)
;; (add-hook 'gnus-exit-gnus-hook 'my-gnus-shutdown-hook)

(provide 'wcx-gnus)
(provide 'wcx-bbdb)

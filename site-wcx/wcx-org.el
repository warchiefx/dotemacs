;;; wcx-org.el --- Org-mdoe setup
;;
;; Filename: wcx-org.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:34:26 2008
;;
;; Last-Updated: Thu Nov 05 11:38:14 2009 (-14400 -0400)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Org-mode setup
;; The following lines are always needed. Choose your own keys.

(use-package org
  :ensure org-plus-contrib
  :commands (wcx/org-get-clocked-time
             org
             org-capture
             org-mode)
  :bind (("C-c l" . org-store-link)
         ([f9] . org-agenda)
         ([?\C-c ?\C-x ?o] . org-clock-jump-to-current-clock)
         ([s-f12] . org-capture)
         ([f12] . org-cycle-agenda-files))
  :mode (("\\.org_archive\\'" . org-mode)
         ("\\.org\\'" . org-mode))

  :config
  (load-library "find-lisp")
  (setq org-agenda-files
        (find-lisp-find-files "~/gdrive/orgfiles" "\.org$"))

  (setq org-refile-targets '((org-agenda-files . (:maxlevel . 6))))
  (setq org-default-notes-file "~/gdrive/orgfiles/main.org")

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
  (setq org-todo-keywords '((sequence "TODO(t)" "OPTIONAL(o)" "EXECUTING(e!)" "FEEDBACK(k@/!)" "VERIFY(v!)" "BLOCKED(b@/!)" "|" "DONE(d!)" "CANCELLED(@)")
                            (sequence "INVESTIGATE" "READ" "READING" "|" "COMPLETED(c!)")
                            (sequence "DELEGATED(@/!)" "|" "DONE(D!)")
                            (sequence "FIX(f)" "FIXING(F!)" "INVESTIGATING" "STUCK(s@/!)" "SOLUTIONKNOWN(S@)" "|" "FIXED(x!)" "WONTFIX(n@/!)")))

  (setq org-log-done 'time)
  (setq org-time-clocksum-format "%d:%02d")
  ;; Setup remember-mode integration
  ;; (org-remember-insinuate)
  ;; (define-key global-map [?\C-c ?o ?r] 'org-remember)

  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  (setq org-export-with-sub-superscripts nil)

  (defun wcx/org-clocking-info-to-file ()
    (if (org-clock-is-active)
        (with-temp-file "~/Work/.clocking"
          ;; (message (org-clock-get-clock-string))
          (insert (wcx/org-get-clocked-time)))))

  (defun wcx/org-get-clocked-time ()
    (interactive)
    (if (org-clock-is-active)
        (let* ((clocked-time (org-clock-get-clocked-time))
               (h (floor clocked-time 60))
               (m (- clocked-time (* 60 h))))
          (format "%d:%02d [%s] %s"
                  h m (buffer-name (org-clocking-buffer)) org-clock-heading))))
  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sql . t))))

(use-package ox-qmd
  :after org
  :ensure t)

(use-package ox-gfm
  :after org
  :ensure t)

(use-package org-edna
  :ensure t
  :after org
  :config
  (org-edna-load))

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (use-package org-alert
;;   :ensure t
;;   :after org
;;   :config
;;   (setq alert-default-style 'libnotify)
;;   (setq org-alert-interval 7200)
;;   (setq org-alert-notification-title "Agenda")
;;   (org-alert-enable))

(provide 'wcx-org)

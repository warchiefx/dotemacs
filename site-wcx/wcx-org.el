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
  :ensure t
  :config
    (global-set-key "\C-cl" 'org-store-link)
  (global-set-key (quote [f9]) 'org-agenda)
  (global-set-key "\C-cb" 'org-ido-switchb)
  (global-set-key [?\C-c ?\C-x ?o] 'org-clock-jump-to-current-clock)


  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
  (setq org-todo-keywords '((sequence "TODO(t)" "OPTIONAL(o)" "EXECUTING(e!)" "FEEDBACK(k@/!)" "VERIFY(v!)" "|" "DONE(d!)" "CANCELLED(@)")
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

  ;; Keybindings
  (global-set-key [f12] 'org-cycle-agenda-files)

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

(provide 'wcx-org)

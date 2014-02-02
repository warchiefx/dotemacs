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

(when (locate-library "org")
  (load-library "org")
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key (quote [f11]) 'org-agenda)
  (global-set-key "\C-cb" 'org-iswitchb)
  (global-set-key [?\C-c ?\C-x ?o] 'org-clock-jump-to-current-clock)

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
  (setq org-todo-keywords '((sequence "OPTIONAL(o)" "TODO(t)" "EXECUTING(e!)" "FEEDBACK(k@/!)" "VERIFY(v!)" "|" "DONE(d!)" "DELEGATED(@/!)" "CANCELLED(@)")
                            (sequence "INVESTIGATE" "READ" "READING" "|" "COMPLETED(c!)")
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
          (let* ((clocked-time (org-clock-get-clocked-time))
                 (h (floor clocked-time 60))
                 (m (- clocked-time (* 60 h))))
            (insert (format "%d:%02d (%s)"
                            h m org-clock-heading)))
        )))
  (wcx/org-clocking-info-to-file)
  (add-hook 'org-clock-in-hook 'wcx/org-clocking-info-to-file)
  (add-hook 'org-clock-out-hook '(lambda ()
                                   ;; remove previous file
                                   (dired-delete-file "~/Work/.clocking")
                                   ))
  (add-hook 'org-clock-cancel-hook '(lambda ()
                                   ;; remove previous file
                                   (dired-delete-file "~/Work/.clocking")
                                   ))
  (add-hook 'display-time-hook 'wcx/org-clocking-info-to-file))

;; (when (locate-library "ox-reveal")
;;   (require 'org-reveal))

(provide 'wcx-org)

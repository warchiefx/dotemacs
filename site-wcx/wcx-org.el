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
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

  (global-set-key "\C-cl" 'org-store-link)
  (global-set-key (quote [f11]) 'org-agenda)
  (global-set-key "\C-cb" 'org-iswitchb)

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
  (setq org-todo-keywords '((sequence "OPTIONAL(o)" "TODO(t)" "EXECUTING(e!)" "FEEDBACK(k@/!)" "VERIFY(v!)" "|" "DONE(d!)" "DELEGATED(@/!)" "CANCELLED(@)")
                            (sequence "INVESTIGATE" "READ" "READING" "|" "COMPLETED(c!)")
                            (sequence "FIX(f)" "FIXING(F!)" "INVESTIGATING" "STUCK(s@/!)" "SOLUTIONKNOWN(S@)" "|" "FIXED(x!)" "WONTFIX(n@/!)")))

  (setq org-log-done 'time)
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
            (insert (format (concat org-time-clocksum-format " (%s)") 
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


;; From: http://emacs-fu.blogspot.com/2009/10/writing-presentations-with-org-mode-and.html
;; allow for export=>beamer by placing
;; #+LaTeX_CLASS: beamer in org files
;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; (add-to-list 'org-export-latex-classes
;;              '("beamer"
;;                "\\documentclass[11pt]{beamer}\n
;;       \\mode<presentation>\n
;;       \\usetheme{Antibes}\n
;;       \\usecolortheme{lily}\n
;;       \\beamertemplateballitem\n
;;       \\setbeameroption{show notes}
;;       \\usepackage[utf8]{inputenc}\n
;;       \\usepackage[T1]{fontenc}\n
;;       \\usepackage{hyperref}\n
;;       \\usepackage{color}
;;       \\usepackage{listings}
;;       \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
;;   frame=single,
;;   basicstyle=\\small,
;;   showspaces=false,showstringspaces=false,
;;   showtabs=false,
;;   keywordstyle=\\color{blue}\\bfseries,
;;   commentstyle=\\color{red},
;;   }\n
;;       \\usepackage{verbatim}\n
;;       \\institute{Miskatonic University, Astrology Dept.}\n
;;        \\subject{RMRF}\n"

;;                ("\\section{%s}" . "\\section*{%s}")

;;                ("\\begin{frame}[fragile]\\frametitle{%s}"
;;                 "\\end{frame}"
;;                 "\\begin{frame}[fragile]\\frametitle{%s}"
;;                 "\\end{frame}")))

(provide 'wcx-org)

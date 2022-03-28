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

(use-package org-contrib
  :pin nongnu)

(use-package org
  :pin gnu
  :commands (wcx/org-get-clocked-time
             org
             org-capture
             org-mode)
  :bind (("C-c l" . org-store-link)
         ([f9] . org-agenda)
         ([?\C-c ?\C-x ?o] . org-clock-jump-to-current-clock)
         ([C-f9] . org-capture)
         ([f12] . org-cycle-agenda-files))
  :mode (("\\.org_archive\\'" . org-mode)
         ("\\.org\\'" . org-mode))
  :hook (org-mode . org-indent-mode)

  :config
  (load-library "find-lisp")
  (setq org-agenda-files
        (append '("~/gdrive/orgfiles/main.org" "~/gdrive/orgfiles/readlater.org")
                (find-lisp-find-files "~/gdrive/orgfiles" "\.org$")))

  (setq org-refile-targets '((org-agenda-files . (:maxlevel . 3))))
  (setq org-default-notes-file "~/gdrive/orgfiles/main.org")

  (defun wcx/create-notes-file (target-dir)
    "Create an org file in ~/notes/."
    (interactive)
    (let* ((name (read-string "Project: "))
           (filename (replace-regexp-in-string "[ /]" "-" name)))
      (expand-file-name (format "%s.org"
                                filename) target-dir)))

  (setq org-capture-templates '(("t" "Todo" entry (file+headline "~/gdrive/orgfiles/main.org" "Tasks")
                                 "* TODO %?\n%U\n%a\n" :prepend t)
                                ("n" "Note" entry (file+headline "~/gdrive/orgfiles/main.org" "Notes")
                                 "* %? :NOTE:\n%U\n%a\n")
                                ("r" "Read Later" entry (file+headline "~/gdrive/orgfiles/readlater.org" "Read Later")
                                 "* TODO %? :LATER:\n" :prepend t)
                                ("m" "Meeting Minutes" entry (file+olp+datetree "~/gdrive/orgfiles/meetings.org")
                                 "* %? :MEETING:\n" :prepend t :tree-type month :empty-lines 1 :kill-buffer t)
                                ("p" "Project" entry (file (lambda () (funcall-interactively 'wcx/create-notes-file "~/gdrive/orgfiles/projects/")))
                                 "%[~/gdrive/orgfiles/templates/project.org]")
                                ("R" "Research Project" entry (file (lambda () (funcall-interactively 'wcx/create-notes-file "~/gdrive/orgfiles/research/")))
                                 "%[~/gdrive/orgfiles/templates/research.org]")
                                ))

  (setq org-tag-alist '((:startgroup)
                        ("BUG" . ?b) ("RESEARCH" . ?r) ("MGMT" . ?m)
                        ("NOTE" . ?t) ("SPEC" . ?c)
                        (:endgroup)
                        (:startgroup)
                        ("TRIVIAL" . ?T) ("TEDIOUS" . ?e) ("TODELEGATE" . ?d)
                        (:endgroup)
                        ("NICETOHAVE" . ?n)
                        (:startgroup)
                        ("SOON" . ?s) ("ONHOLD" . ?O) ("LATER" . ?l)
                        (:endgroup)
                        (:startgroup)
                        ("@home" . ?h) ("@office" . ?o)
                        (:endgroup)))

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise."
    (let (org-log-done org-log-states)   ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(x)"  "OPTIONAL(o)" "FEEDBACK(k@/!)" "VERIFY(v!)" "BLOCKED(b@/!)" "|" "DONE(d!)" "CANCELLED(@)")
                            (sequence "INVESTIGATE" "|" "DONE(d!)")
                            (sequence "DEFINE" "|" "DONE(d!)")
                            (sequence "DELEGATE(@/!)" "|" "DELEGATED(D@/!)")
                            (sequence "FIX(f)" "FIXING(F!)" "INVESTIGATING" "STUCK(s@/!)" "SOLUTIONKNOWN(S@)" "|" "FIXED(x!)" "WONTFIX(n@/!)")))

  (setq org-clock-into-drawer "CLOCKING")

  (setq org-log-done 'time)
  (setq org-time-clocksum-format "%d:%02d")
  ;; Setup remember-mode integration
  ;; (org-remember-insinuate)
  ;; (define-key global-map [?\C-c ?o ?r] 'org-remember)

  (setq org-clock-persist 'history)
  (org-clock-persistence-insinuate)
  (setq org-export-with-sub-superscripts nil)

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
   '((sql . t)))

  (when (package-installed-p 'major-mode-hydra)
    (major-mode-hydra-bind org-mode "Navigation"
      ("g" org-switchb "Open file")
      ("j" org-goto "Jump to heading")
      ("l" org-capture-goto-last-stored "Last Capture")
      ("a" org-agenda "Agenda")
      )
    (major-mode-hydra-bind org-mode "Operations"
      ("e" org-export-dispatch "Export")
      ("c" org-capture "Capture")
      ("A" org-archive-subtree-default "Archive" :color red)
      )
    (major-mode-hydra-bind org-mode "Clocking"
      ("t" org-timer-start "Start Timer")
      ("s" org-timer-stop "Stop Timer")
      ("r" org-timer-set-timer "Set Timer") ; This one requires you be in an orgmode doc, as it sets the timer for the header
      ("p" org-timer "Print Timer") ; output timer value to buffer
      ("w" (org-clock-in '(4)) "Clock-In") ; used with (org-clock-persistence-insinuate) (setq org-clock-persist t)
      ("o" org-clock-out "Clock-Out") ; you might also want (setq org-log-note-clock-out t)
      ("J" org-clock-goto "Clock Goto") ; global visit the clocked task
      ))

  (add-hook 'org-mode-hook (lambda ()
                             "Beautify Org Checkbox Symbol"
                             (push '("[ ]" .  "☐") prettify-symbols-alist)
                             (push '("[X]" . "☑" ) prettify-symbols-alist)
                             (push '("[-]" . "❍" ) prettify-symbols-alist)
                             (prettify-symbols-mode))))

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

(use-package org-super-agenda
  :ensure t
  :after org
  :config
  (org-super-agenda-mode)
  (setq org-super-agenda-groups
        '(;; Each group has an implicit boolean OR operator between its selectors.
          (:name "Today"  ; Optionally specify section name
                 :time-grid t  ; Items that appear on the time grid
                 :todo "TODAY")  ; Items that have this TODO keyword
          (:name "Important"
                 ;; Single arguments given alone
                 :tag "bills"
                 :priority "A")
          ;; Set order of multiple groups at once
          (:order-multi (2 (:name "Shopping in town"
                                  ;; Boolean AND group matches items that match all subgroups
                                  :and (:tag "shopping" :tag "@town"))
                           (:name "Food-related"
                                  ;; Multiple args given in list with implicit OR
                                  :tag ("food" "dinner"))
                           (:name "Personal"
                                  :habit t
                                  :tag "personal")
                           (:name "Space-related (non-moon-or-planet-related)"
                                  ;; Regexps match case-insensitively on the entire entry
                                  :and (:regexp ("space" "NASA")
                                                ;; Boolean NOT also has implicit OR between selectors
                                                :not (:regexp "moon" :tag "planet")))))
          ;; Groups supply their own section names when none are given
          (:todo "WAITING" :order 8)  ; Set order of this section
          (:todo ("SOMEDAY" "TO-READ" "CHECK" "TO-WATCH" "WATCHING")
                 ;; Show this group at the end of the agenda (since it has the
                 ;; highest number). If you specified this group last, items
                 ;; with these todo keywords that e.g. have priority A would be
                 ;; displayed in that group instead, because items are grouped
                 ;; out in the order the groups are listed.
                 :order 9)
          (:priority<= "B"
                       ;; Show this section after "Today" and "Important", because
                       ;; their order is unspecified, defaulting to 0. Sections
                       ;; are displayed lowest-number-first.
                       :order 1)
          ;; After the last group, the agenda will display items that didn't
          ;; match any of these groups, with the default order position of 99
          )))

;; (use-package org-bullets
;;   :ensure t
;;   :config
;;   (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; (use-package org-alert
;;   :ensure t
;;   :after org
;;   :config
;;   (setq alert-default-style 'libnotify)
;;   (setq org-alert-interval 7200)
;;   (setq org-alert-notification-title "Agenda")
;;   (org-alert-enable))

(provide 'wcx-org)

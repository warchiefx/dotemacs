;;; wcx-hydra.el --- Hydras for common workflows -*- lexical-binding: t -*-
;;; Commentary:
;; Top-level hydras bound under C-c. Major-mode-hydra (C-<f12>) hosts the
;; per-mode hydras defined in language modules.
;;; Code:

(use-package major-mode-hydra
  :ensure t
  :bind ("C-<f12>" . major-mode-hydra))

(use-package hydra
  :ensure t
  :bind (("C-c <tab>" . wcx/hydra-fold/body)
         ("C-c g"     . wcx/hydra-magit/body)
         ("C-c ;"     . wcx/hydra-projectile/body)
         ("C-c s"     . wcx/hydra-system/body)
         ("C-c w"     . wcx/hydra-windows/body))
  :config (setq-default hydra-default-hint nil))

(use-package qs
  :load-path "/Users/warchiefx/Work/xmonk/qs/editors/emacs"
  :commands (qs-def qs-ref qs-grep qs-callers qs-callees qs-callgraph qs-toggle-window)
  :config
  (qs-mode 1))

(declare-function wcx/deadgrep-dwim "wcx-generic")

(pretty-hydra-define wcx/hydra-qs
  (:title "Quick Search" :color teal :quit-key "q")
  ("Search"
   (("d" qs-def "definition")
    ("r" qs-ref "references")
    ("g" qs-grep "grep")
    ("R" wcx/deadgrep-dwim "ripgrep")
    ("t" qs-toggle-window "toggle"))
   "Call Graph"
   (("c" qs-callers "callers")
    ("C" qs-callees "callees")
    ("G" qs-callgraph "callgraph"))))

(pretty-hydra-define wcx/hydra-fold
  (:title "Fold" :color pink :quit-key "q")
  ("Do"
   (("f" vimish-fold              "fold")
    ("k" vimish-fold-delete       "kill")
    ("K" vimish-fold-delete-all   "kill all"))
   "Jump"
   (("<" vimish-fold-previous-fold "previous")
    (">" vimish-fold-next-fold     "next"))
   "Toggle"
   (("<tab>"   vimish-fold-toggle      "current")
    ("S-<tab>" vimish-fold-toggle-all  "all"))))

(pretty-hydra-define wcx/hydra-magit
  (:title "Git" :color teal :quit-key "q")
  ("Status"
   (("s" magit-status      "status")
    ("b" magit-blame       "blame")
    ("h" git-timemachine   "timemachine"))
   "Repo"
   (("c" magit-clone       "clone")
    ("i" magit-init        "init"))
   "Share"
   (("l" git-link          "git link"))))

(pretty-hydra-define wcx/hydra-projectile
  (:title "Projectile" :color teal :quit-key "q")
  ("Find"
   (("f" consult-projectile-find-file       "file")
    ("d" consult-projectile-find-dir        "directory")
    ("D" projectile-dired                   "root dired")
    ("p" consult-projectile-switch-project  "project"))
   "Buffers"
   (("b" consult-project-buffer             "list")
    ("K" projectile-kill-buffers            "kill all")
    ("S" projectile-save-project-buffers    "save all"))
   "Search"
   (("s" consult-ripgrep                    "ripgrep")
    ("r" projectile-replace                 "replace"))
   "Cache / Build"
   (("i" projectile-invalidate-cache         "reset cache" :color red)
    ("m" makefile-executor-execute-project-target "make"))))

(pretty-hydra-define wcx/hydra-system
  (:title "System" :color teal :quit-key "q")
  ("Packages"
   (("p" paradox-list-packages    "list")
    ("P" paradox-upgrade-packages "upgrade"))
   "Processes"
   (("s" list-processes           "list"))
   "Shell"
   (("e" (eshell t)               "eshell")
    ("t" term                     "term")
    ("T" ansi-term                "ansi-term")
    ("v" vterm                    "vterm"))
   "Search"
   (("f" wcx/hydra-qs/body        "qs search"))))

(pretty-hydra-define wcx/hydra-windows
  (:title "Windows" :color pink :quit-key "q")
  ("Resize"
   (("b" balance-windows               "balance")
    ("i" enlarge-window                "heighten")
    ("k" shrink-window                 "shorten")
    ("j" shrink-window-horizontally    "narrow")
    ("l" enlarge-window-horizontally   "widen"))
   "Text Zoom"
   (("-" text-scale-decrease           "out")
    ("+" text-scale-increase           "in")
    ("=" (text-scale-increase 0)       "reset"))))

(provide 'wcx-hydra)
;;; wcx-hydra.el ends here

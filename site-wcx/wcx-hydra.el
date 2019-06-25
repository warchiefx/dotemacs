(use-package major-mode-hydra
  :ensure t
  :bind
  ("C-<f12>" . major-mode-hydra))

(when (package-installed-p 'restclient)
  (major-mode-hydra-bind restclient-mode "Navigate"
    ("n" restclient-jump-next "next" :exit nil)
    ("p" restclient-jump-prev "previous" :exit nil)
    ("N" restclient-narrow-to-current "narrow")
    ("W" widen "widen")
    ("q" nil "quit"))
  (major-mode-hydra-bind restclient-mode "Send"
    ("s" restclient-http-send-current-stay-in-window "send" :exit nil)
    ("S" restclient-http-send-current "send and jump")
    ("r" restclient-http-send-current-raw "send raw"))
  (major-mode-hydra-bind restclient-mode "Misc"
    ("w" restclient-copy-curl-command "copy curl")
    ("m" restclient-mark-current "mark")
    ("q" nil "quit")))

(use-package hydra
  :ensure t
  :bind
  ("C-c <tab>" . hydra-fold/body)
  ("C-c g" . hydra-magit/body)
  ("C-c ;" . hydra-projectile/body)
  ("C-c f" . hydra-flycheck/body)
  ("C-c s" . hydra-system/body)
  ("C-c w" . hydra-windows/body)
  :config (setq-default hydra-default-hint nil))

(use-package use-package-hydra
  :ensure t)

(defhydra hydra-fold (:color pink)
  "
^
^Fold^              ^Do^                ^Jump^              ^Toggle^
^────^──────────────^──^────────────────^────^──────────────^──────^────────────
_q_ quit            _f_ fold            _<_ previous        _<tab>_ current
^^                  _k_ kill            _>_ next            _S-<tab>_ all
^^                  _K_ kill all        ^^                  ^^
^^                  ^^                  ^^                  ^^
"
  ("q" nil)
  ("<tab>" vimish-fold-toggle)
  ("S-<tab>" vimish-fold-toggle-all)
  ("<" vimish-fold-previous-fold)
  (">" vimish-fold-next-fold)
  ("f" vimish-fold)
  ("k" vimish-fold-delete)
  ("K" vimish-fold-delete-all))

(defhydra hydra-magit (:color blue)
  "
^
^Magit^             ^Do^
^─────^─────────────^──^────────────────
_q_ quit            _b_ blame
^^                  _c_ clone
^^                  _i_ init
^^                  _s_ status
^^                  _h_ timemachine
^^                  ^^
"
  ("q" nil)
  ("b" magit-blame)
  ("c" magit-clone)
  ("i" magit-init)
  ("s" magit-status)
  ("h" git-timemachine))

(defhydra hydra-projectile (:color blue)
  "
^
^Projectile^        ^Buffers^           ^Find^              ^Search^
^──────────^────────^───────^───────────^────^──────────────^──────^────────────
_q_ quit            _b_ list            _d_ directory       _r_ replace
_i_ reset cache     _K_ kill all        _D_ root            _s_ ag
_m_ make            _S_ save all        _f_ file            ^^
^^                  ^^                  _p_ project         ^^
^^                  ^^                  ^^                  ^^
"
  ("q" nil)
  ("b" helm-projectile-switch-to-buffer)
  ("m" makefile-executor-execute-project-target)
  ("d" helm-projectile-find-dir)
  ("D" projectile-dired)
  ("f" helm-projectile-find-file)
  ("i" projectile-invalidate-cache :color red)
  ("K" projectile-kill-buffers)
  ("p" helm-projectile-switch-project)
  ("r" projectile-replace)
  ("s" helm-projectile-ag)
  ("S" projectile-save-project-buffers))

(defhydra hydra-undo-tree (:color yellow
                                  :hint nil
                                  )
  "
  _p_: undo  _n_: redo _s_: save _l_: load   "
  ("p"   undo-tree-undo)
  ("n"   undo-tree-redo)
  ("s"   undo-tree-save-history)
  ("l"   undo-tree-load-history)
  ("u"   undo-tree-visualize "visualize" :color blue)
  ("q"   nil "quit" :color blue))

;; Taken from https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org#hydra
(defhydra hydra-flycheck (:color pink)
  "
^
^Flycheck^          ^Errors^            ^Checker^
^────────^──────────^──────^────────────^───────^───────────
_q_ quit            _<_ previous        _?_ describe
_m_ manual          _>_ next            _d_ disable
_v_ verify setup    _f_ check           _s_ select
^^                  _l_ list            ^^
^^                  ^^                  ^^
"
  ("q" nil)
  ("<" flycheck-previous-error)
  (">" flycheck-next-error)
  ("?" flycheck-describe-checker :color blue)
  ("d" flycheck-disable-checker :color blue)
  ("f" flycheck-buffer)
  ("l" flycheck-list-errors :color blue)
  ("m" flycheck-manual :color blue)
  ("s" flycheck-select-checker :color blue)
  ("v" flycheck-verify-setup :color blue))

(defhydra hydra-system (:color blue)
  "
^
^System^            ^Packages^          ^Processes^         ^Shell^
^──────^────────────^────────^──────────^─────────^─────────^─────^─────────────
_q_ quit            _p_ list            _s_ list            _e_ eshell
^^                  _P_ upgrade         ^^                  _t_ term
^^                  ^^                  ^^                  _T_ ansi-term
"
  ("q" nil)
  ("e" (eshell t))
  ("p" paradox-list-packages)
  ("P" paradox-upgrade-packages)
  ("s" list-processes)
  ("t" term)
  ("T" ansi-term))

(defhydra hydra-windows (:color pink)
  "
^
^Windows^           ^Window^            ^Zoom^
^───────^───────────^──────^────────────^────^──────────────
_q_ quit            _b_ balance         _-_ out
^^                  _i_ heighten        _+_ in
^^                  _j_ narrow          _=_ reset
^^                  _k_ lower           ^^
^^                  _l_ widen           ^^
^^                  ^^                  ^^
"
  ("q" nil)
  ("b" balance-windows)
  ("i" enlarge-window)
  ("j" shrink-window-horizontally)
  ("k" shrink-window)
  ("l" enlarge-window-horizontally)
  ("-" text-scale-decrease)
  ("+" text-scale-increase)
  ("=" (text-scale-increase 0)))

(provide 'wcx-hydra)

;;; wcx-flycheck.el -- Flycheck config

;;; Code:

(declare-function python-shell-calculate-exec-path "python")
(defvar wcx/checker)

(when (string-equal wcx/checker "flycheck")
  (defun flycheck-virtualenv-executable-find (executable)
    "Find an EXECUTABLE in the current virtualenv if any."
    (if (bound-and-true-p python-shell-virtualenv-root)
        (let ((exec-path (python-shell-calculate-exec-path)))
          (executable-find executable))
      (executable-find executable)))

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

  (use-package "flycheck"
    :defer t
    :hook (prog-mode . flycheck-mode)
    :bind (("C-c f" . hydra-flycheck/body))
    :config
    (setq-default
     flycheck-check-syntax-automatically '(save mode-enabled idle-change)
     flycheck-idle-change-delay 0.4
     flycheck-disabled-checkers '(emacs-lisp-checkdoc))
    (global-flycheck-mode 1)
    ;; (add-hook 'python-mode-hook (lambda ()
    ;;                              (setq flycheck-checker 'python-pylint
    ;;                                    flycheck-checker-error-threshold 900

    ;; :diminish flycheck-mode)
    )

  (use-package flycheck-posframe
    :after flycheck
    :config
    (flycheck-posframe-configure-pretty-defaults)
    (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode)))

(when (string-equal wcx/checker "flymake")
  (use-package flymake
    :hook (prog-mode . flymake-mode)
    :bind (("C-c f" . hydra-flymake/body)
           :map flymake-mode-map
                ([?\C-c ?\! ?c] . flymake-start)
                ([?\C-c ?\! ?l] . flymake-show-diagnostics-buffer)
                ([?\C-c ?\! ?n] . flymake-goto-next-error)
                ([?\C-c ?\! ?p] . flymake-goto-prev-error)
                )
    :config
    ;; (custom-set-faces
    ;;  '(flymake-errline ((((class color)) (:underline "red"))))
    ;;  '(flymake-warnline ((((class color)) (:underline "yellow")))))
    (setq flymake-start-on-flymake-mode t)

    (defun flymake--transform-mode-line-format (ret)
      "Change the output of `flymake--mode-line-format'."
      (setf (seq-elt (car ret) 1) " FM")
      ret)
    (advice-add #'flymake--mode-line-format
                :filter-return #'flymake--transform-mode-line-format))

  ;; Taken from https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org#hydra
  (defhydra hydra-flymake (:color pink)
    "
^
^Flymake^          ^Errors^            
^────────^──────────^──────^────────────
_q_ quit            _<_ previous        
^^                  _>_ next            
^^                  _f_ check          
^^                  _l_ list           
^^                  ^^                 
"
    ("q" nil)
    ("<" flymake-goto-prev-error)
    (">" flymake-goto-next-error)
    ("f" flymake-start)
    ("l" flymake-show-diagnostics-buffer :color blue))

  (use-package flymake-diagnostic-at-point
    :after flymake
    :preface
    (defun flymake-diagnostic-at-point-quick-peek (text)
      "Display the flymake diagnostic TEXT with `quick-peek'`."
      (quick-peek-show (concat flymake-diagnostic-at-point-error-prefix text)))
    :custom
    (flymake-diagnostic-at-point-timer-delay 0.1)
    (flymake-diagnostic-at-point-error-prefix "❌ ")
    (flymake-diagnostic-at-point-display-diagnostic-function 'flymake-diagnostic-at-point-display-popup) ;; or flymake-diagnostic-at-point-display-minibuffer
    :hook
    (flymake-mode . flymake-diagnostic-at-point-mode)))

(provide 'wcx-checking)
;;; wcx-flycheck ends here

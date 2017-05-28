(setq py-autopep8-options '("--max-line-length=120"))

(setq python-saved-check-command nil)

(use-package auto-virtualenv
  :ensure t
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'pyvenv-post-activate-hooks 'pyvenv-restart-python))

(use-package anaconda-mode
  :ensure t
  :defer t
  :config
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
  :diminish anaconda-mode
  :diminish eldoc-mode
  :diminish auto-revert-mode)

(use-package company-anaconda
  :ensure t
  :config
  (eval-after-load "company"
    '(progn
       (add-to-list 'company-backends 'company-anaconda))))

;; ipython support, also remove weird character on ipython prompt
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "--simple-prompt"))

(provide 'wcx-python)
;;; wcx-python.el ends here

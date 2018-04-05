(setq py-autopep8-options '("--max-line-length=120"))

(setq python-saved-check-command nil)

(use-package auto-virtualenv
  :ensure t
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'pyvenv-post-activate-hooks 'pyvenv-restart-python))

;; (use-package anaconda-mode
;;   :ensure t
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;;   :diminish anaconda-mode
;;   :diminish eldoc-mode
;;   :diminish auto-revert-mode)

;; (use-package company-anaconda
;;   :ensure t
;;   :config
;;   (add-to-list 'company-backends 'company-anaconda))

(use-package python-docstring
  :ensure t
  :config
  (python-docstring-install)
  :diminish python-docstring-mode)

;; ipython support, also remove weird character on ipython prompt
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "--simple-prompt"))


(defun wcx/autopep8()
  (interactive)
  (py-autopep8))

(use-package py-autopep8
  :ensure t
  :bind (([?\C-c ?\C-x ?a] . wcx/autopep8)))

(use-package pyvenv
  :ensure t
  :bind (([?\C-c ?\C-x ?v] . pyvenv-workon)))

(use-package pip-requirements
  :ensure t
  :preface
  (defun me/pip-requirements-ignore-case ()
    (setq-local completion-ignore-case t))
  :init (add-hook 'pip-requirements-mode-hook #'me/pip-requirements-ignore-case))

(provide 'wcx-python)
;;; wcx-python.el ends here

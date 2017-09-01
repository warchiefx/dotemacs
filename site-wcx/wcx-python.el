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
;;   :defer t
;;   :config
;;   (add-hook 'python-mode-hook 'anaconda-mode)
;;   (add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;;   :diminish anaconda-mode
;;   :diminish eldoc-mode
;;   :diminish auto-revert-mode)

(require 'package)
(add-to-list 'package-archives
             '("elpy" . "http://jorgenschaefer.github.io/packages/"))

(use-package elpy
  :ensure t
  :config
  ;; Disable flymake, switch it out for flycheck
  (when (require 'flycheck nil t)
    (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
    (add-hook 'elpy-mode-hook 'flycheck-mode))
  (elpy-use-cpython "python")
  (elpy-enable)
  :diminish highlight-indentation-mode)


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

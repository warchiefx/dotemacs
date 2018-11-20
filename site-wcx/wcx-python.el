(setq py-autopep8-options '("--max-line-length=120"))

(setq python-saved-check-command nil)


(defun wcx-restart-python ()
  (require 'wcx-utils)
  (set-variable 'ycmd-server-command `(,(executable-find "python3") ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
  (pyvenv-restart-python)
  (ycmd-restart-semantic-server))

(use-package auto-virtualenv
  :ensure t
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'pyvenv-post-activate-hooks 'wcx-restart-python))

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
;;

(use-package python-docstring
  :ensure t
  :config
  (python-docstring-install)
  :diminish python-docstring-mode)

;; ipython support, also remove weird character on ipython prompt
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "--simple-prompt"))


;; (defun wcx/autopep8()
;;   (interactive)
;;   (py-autopep8))

;; (use-package py-autopep8
;;   :ensure t
;;   :bind (([?\C-c ?\C-x ?a] . wcx/autopep8))
;;   :config
;;   (setq py-autopep8-options '("--max-line-length=120"))
;;   (add-hook 'python-mode-hook 'py-autopep8-enable-on-save))

(use-package blacken
  :ensure t
  :diminish blacken-mode
  :bind (([?\C-c ?\C-x ?a] . blacken-buffer)))

(use-package pyvenv
  :ensure t
  :bind (([?\C-c ?\C-x ?v] . pyvenv-workon)))

(use-package pip-requirements
  :ensure t
  :preface
  (defun me/pip-requirements-ignore-case ()
    (setq-local completion-ignore-case t))
  :init (add-hook 'pip-requirements-mode-hook #'me/pip-requirements-ignore-case))

(use-package python-pytest
  :ensure t
  :bind (("C-c C-x t" . python-pytest-popup)))

(use-package smart-dash
  :ensure t
  :config
  (add-hook 'python-mode-hook 'smart-dash-mode))

(use-package pipenv
  :ensure t
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-default)
  (setq pipenv-keymap-prefix (kbd "C-c C-o")))

(provide 'wcx-python)
;;; wcx-python.el ends here

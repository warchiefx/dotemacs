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

(use-package python-docstring
  :ensure t
  :config
  (python-docstring-install)
  :diminish python-docstring-mode)

;; ipython support, also remove weird character on ipython prompt
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython")
  (setq python-shell-interpreter-args "--simple-prompt"))

(use-package blacken
  :ensure t
  :diminish blacken-mode
  ;; :hook (python-mode . blacken-mode)
  :config
  ;; (setq blacken-line-length 100)
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
  :commands (python-pytest-popup)
  :bind (("C-c C-x t" . python-pytest-popup)))

(use-package smart-dash
  :defer t
  :hook (python-mode . smart-dash-mode))

(use-package pipenv
  :defer t
  :hook (python-mode . pipenv-mode)
  :diminish pipenv-mode
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-default)
  (setq pipenv-keymap-prefix (kbd "C-c C-o")))

(use-package py-isort
  :defer t
  :commands (py-isort-buffer py-isort-region))


(use-package python-mode
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :config
  (setq-default lsp-pyls-configuration-sources ["pylint"])
  (add-hook 'python-mode-hook (lambda ()
                               (semantic-mode 1)
                               (setq flycheck-checker 'python-pylint
                                     flycheck-checker-error-threshold 900
                                     flycheck-pylintrc "~/.pylintrc")))
  :mode-hydra
  ("Nav"
   (("n" python-nav-forward-defun "next-defun" :exit nil)
    ("p" python-nav-backward-defun "prev-defun" :exit nil))
   "Errors"
   (("<" flycheck-previous-error "prev" :exit nil)
    (">" flycheck-next-error "next" :exit nil)
    ("l" flycheck-list-errors "list"))
   "LSP"
   (("A" lsp-execute-code-action :exit nil)
    ("r" lsp-restart-workspace "restart"))
   ;; (("h" eglot-help-at-point :exit nil)
   ;;  ("A" eglot-code-actions :exit nil)
   ;;  ("r" eglot-reconnect "restart"))
   "Env"
   (("a" pipenv-activate "pipenv-activate" :exit nil)
    ("d" pipenv-deactivate "pipenv-deactivate" :exit nil)
    ("w" pyvenv-workon "workon...")
    ("s" run-python "pyshell")
    ("S" pipenv-shell "pipenv-shell")
    ("i" pipenv-install "pipenv-install"))
   "Tools"
   (("f" blacken-buffer "reformat")
    ("c" whitespace-cleanup "clean whitespace")
    ("i" py-isort-buffer "sort imports"))
   "Test"
   (("t" python-pytest-popup "pytest..."))))

(use-package ggtags
  :hook (python-mode . ggtags-mode))

(provide 'wcx-python)
;;; wcx-python.el ends here

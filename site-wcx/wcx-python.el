;; (use-package elpy
;;   :ensure t
;;   :config
;;   (elpy-enable)
;;   ;;(elpy-use-ipython)
;;   )

(setq py-autopep8-options '("--max-line-length=120"))

(setq python-saved-check-command nil)


;; Taken and adapted from: http://railscoder.net/emacs/elisp/ruby/2014/07/16/emacs-ruby-space-replace/
;; (defun kdt-python-method-space-replace ()
;;   "When pressing space while naming a defined method, insert an underscore"
;;   (interactive)
;;   (if (and (looking-back "def .+")
;;            (not (and
;;                  (looking-at ".*)$")
;;                  (looking-back "(.*"))))
;;       (insert "_")
;;     (insert " ")))

;; (eval-after-load 'elpy-mode
;;   '(progn
;;      (define-key elpy-mode-map (kbd "SPC") 'kdt-python-method-space-replace)))


;; (use-package py-smart-operator
;;   :config
;;   (add-hook 'python-mode-hook 'py-smart-operator-mode)
;;   )

(use-package auto-virtualenv
  :ensure t
  :config
  (add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)
  (add-hook 'projectile-after-switch-project-hook 'auto-virtualenv-set-virtualenv))

(use-package anaconda-mode
  :ensure t
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

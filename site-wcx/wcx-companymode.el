(use-package company
  :ensure t
  :demand t
  :diminish company-mode
  :config
  (setq-default
   ;; company-minimum-prefix-length 1
   company-tooltip-align-annotations t))

(use-package company-quickhelp
  :ensure t
  :after company
  :config
  (company-quickhelp-mode 1))

(use-package company-flx
  :ensure t
  :after company
  :config
  (setq company-flx-limit 400))

(use-package company-restclient
  :ensure t
  :config (add-to-list 'company-backends 'company-restclient))

(global-company-mode 1)

(use-package company-statistics
  :ensure t
  :config (company-statistics-mode 1))

;; (use-package company-etags
;;   :config
;;   (eval-after-load 'company-etags '(progn (add-to-list 'company-etags-modes 'web-mode)))
;;   (setq company-etags-everywhere '(php-mode html-mode web-mode nxml-mode)))

(use-package company-statistics
  :ensure t
  :config (company-statistics-mode))

(use-package ycmd
  :ensure t
  :diminish (ycmd-mode eldoc-mode)
  :config
  (require 'wcx-utils)
  (set-variable 'ycmd-server-command `(,(executable-find "python3") ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
  (add-hook 'after-init-hook #'global-ycmd-mode)
  (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))

(use-package company-ycmd
  :ensure t
  :config (company-ycmd-setup))

;; Only install this if flycheck is installed
(when (package-installed-p 'flycheck)
  (use-package flycheck-ycmd
    :ensure t
    :after flycheck
    :config (flycheck-ycmd-setup)))

(provide 'wcx-companymode)

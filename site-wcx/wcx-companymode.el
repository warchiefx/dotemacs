(use-package company
  :hook (prog-mode . company-mode)
  :diminish company-mode
  :init
  (setq company-idle-delay 0.4)
  :config
  (setq-default
   ;; company-minimum-prefix-length 1
   company-tooltip-align-annotations t))

(use-package company-quickhelp
  :after company
  :config
  (company-quickhelp-mode 1))

(use-package company-flx
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

;; (use-package ycmd
;;   :defer t
;;   :hook (ycmd-mode . ycmd-eldoc-setup)
;;   :diminish (ycmd-mode eldoc-mode)
;;   :config
;;   (require 'wcx-utils)
;;   (set-variable 'ycmd-server-command `(,(executable-find "python3") ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
;;   ;; (add-hook 'after-init-hook #'global-ycmd-mode)
;;   )

;; (use-package company-ycmd
;;   :after ycmd
;;   :defer t
;;   :config (company-ycmd-setup))

(provide 'wcx-companymode)

(use-package company
  :defer 30
  :hook (prog-mode . company-mode)
  :diminish company-mode
  :init
  (setq company-idle-delay 0.4)
  :config
  (setq-default
   ;; company-minimum-prefix-length 1
   company-tooltip-align-annotations t))

(use-package company-quickhelp
  :defer t
  :after company
  :config
  (company-quickhelp-mode 1))

(use-package company-flx
  :defer t
  :after company
  :config
  (setq company-flx-limit 400))

(use-package company-restclient
  :defer t
  :config (add-to-list 'company-backends 'company-restclient))

(use-package company-statistics
  :defer 35
  :hook (prog-mode . company-statistics-mode))

(provide 'wcx-companymode)

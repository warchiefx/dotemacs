(use-package company
  :ensure t
  :demand t
  :diminish company-mode
  :config
  (setq-default
   company-idle-delay .2
   company-minimum-prefix-length 1
   company-tooltip-align-annotations t))

(use-package company-quickhelp
  :ensure t
  :demand t)

(use-package company-restclient
  :ensure t
  :config (add-to-list 'company-backends 'company-restclient))

(global-company-mode 1)

(use-package company-tern
  :after company
  :config
  (add-to-list 'company-backends 'company-tern)
  (setq-default
   company-tern-meta-as-single-line t
   company-tern-property-marker " *"))

(provide 'wcx-companymode)

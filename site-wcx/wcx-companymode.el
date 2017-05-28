(use-package company
  :ensure t
  :demand t
  :diminish company-mode)

(use-package company-quickhelp
  :ensure t
  :demand t)

(use-package company-restclient
  :ensure t
  :config (add-to-list 'company-backends 'company-restclient))

(global-company-mode 1)


(provide 'wcx-companymode)

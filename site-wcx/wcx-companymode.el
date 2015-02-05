
(when (locate-library "company")
  (load-library "company")
  (add-hook 'after-init-hook 'global-company-mode))

(provide 'wcx-companymode)

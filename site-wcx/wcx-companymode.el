(use-package company
  :ensure t
  :demand t
  :diminish company-mode
  :config
  (setq-default
   company-idle-delay .2
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

(use-package company-tern
  :after company
  :config
  (add-to-list 'company-backends 'company-tern)
  (setq-default
   company-tern-meta-as-single-line t
   company-tern-property-marker " *"))

(use-package company-statistics
  :ensure t
  :config (company-statistics-mode))

;; (use-package ycmd
;;   :ensure t
;;   :diminish (ycmd-mode eldoc-mode)
;;   :config
;;   ; Remember to customize this variable for your environment
;;   ;; (set-variable 'ycmd-server-command '("python2" "/usr/share/vim/vimfiles/third_party/ycmd/ycmd"))
;;   (add-hook 'after-init-hook #'global-ycmd-mode)
;;   (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))

;; (use-package company-ycmd
;;   :ensure t
;;   :config (company-ycmd-setup))

;; ;; Only install this if flycheck is installed
;; (when (package-installed-p 'flycheck)
;;   (use-package flycheck-ycmd
;;     :ensure t
;;     :after flycheck
;;     :config (flycheck-ycmd-setup)))

;; /usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py

(provide 'wcx-companymode)

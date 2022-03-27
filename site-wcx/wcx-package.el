;;; wcx-package.el --- Package system setup
(require 'package)

; Workaround for missing url-insert-buffer-contents function
(load-library "url-handlers")

(setq package-enable-at-startup nil) ; dont do it immediately
(setq package-archives '(
             ("gnu"       . "http://elpa.gnu.org/packages/")
             ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
    (package-install 'diminish)
    (package-install 'quelpa)
    (package-install 'bind-key)

    (require 'use-package))

(use-package use-package-hydra
  :ensure t)

(use-package quelpa-use-package
  :ensure t)

(setq use-package-always-ensure t)
(setq use-package-expand-minimally t)

(require 'diminish)
(require 'bind-key)

;; Improved package manager
(use-package paradox
  :defer 10)

(provide 'wcx-package)

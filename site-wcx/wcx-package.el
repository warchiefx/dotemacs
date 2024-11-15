;;; wcx-package.el --- Package system setup
(require 'package)
(setq package-user-dir "~/.emacs.d/packages")

; Workaround for missing url-insert-buffer-contents function
(load-library "url-handlers")

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
;; https://github.com/jwiegley/use-package/issues/319#issuecomment-845214233
(assq-delete-all 'org package--builtins)
(assq-delete-all 'org package--builtin-versions)

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

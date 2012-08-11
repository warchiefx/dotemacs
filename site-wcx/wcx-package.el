;;; wcx-package.el --- Package system setup
(require 'package)
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(provide 'wcx-package)

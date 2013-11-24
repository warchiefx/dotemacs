;; Using auto-complete mode from https://github.com/m2ym/auto-complete

(when (locate-library "auto-complete")
  (require 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default)
  (global-auto-complete-mode t))

(provide 'wcx-auto-complete)
;;; wcx-auto-complete ends here

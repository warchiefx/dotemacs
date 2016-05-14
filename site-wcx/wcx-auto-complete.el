;; Using auto-complete mode from https://github.com/m2ym/auto-complete

(when (locate-library "auto-complete")
  (require 'auto-complete)
  (require 'auto-complete-config)
  (ac-config-default)
  (global-auto-complete-mode t)

  (global-set-key [M-return] 'auto-complete)

  ;; android specific settings
  ;; AndroidManifest.xml
  (defun ac-android-manifest-nxml-setup()
    (when (string= (buffer-name) "AndroidManifest.xml")
      (setq ac-sources '(ac-source-yasnippet
                         ac-source-abbrev
                         ac-source-dictionary
                         ac-source-words-in-same-mode-buffers))
      ((lambda () (auto-complete-mode 1)))))
  (add-hook 'nxml-mode-hook 'ac-android-manifest-nxml-setup))

(provide 'wcx-auto-complete)
;;; wcx-auto-complete ends here

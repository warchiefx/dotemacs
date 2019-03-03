(use-package torus
  :ensure t
  :config
  (setq torus-prefix-key "M-<f12>")

  ;; Range 0 -> 3
  ;; The bigger it is, the more bindings.
  (setq torus-optional-bindings 1)

  ;; Created if non existent
  (setq torus-dirname "~/.emacs.d/torus/")

  (setq torus-load-on-startup t)
  (setq torus-save-on-exit t)

  ;; Auto load & save torus
  (setq torus-autoread-file "~/.emacs.d/torus/last.el")
  (setq torus-autowrite-file torus-autoread-file)

  ;; or auto load & save list of toruses
  ;; (setq torus-autoread-file "~/.emacs.d/torus/last.meta.el")
  ;; (setq torus-autowrite-file torus-autoread-file)

  (setq torus-history-maximum-elements 30)

  (setq torus-maximum-horizontal-split 3)
  (setq torus-maximum-vertical-split 3)

  (torus-init)

  (torus-install-default-bindings))

(provide 'wcx-workgroups)

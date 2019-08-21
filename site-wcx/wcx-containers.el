(use-package dockerfile-mode
  :mode "\\Dockerfile\\'"
  :mode "\\dockerfile\\'"
  :mode-hydra
  ("Tools"
   (("d" docker "Docker Manager"))
   )
  :ensure t)

(use-package docker
  :ensure t)

(use-package yaml-mode
  :mode "\\.yml\\'"
  :mode-hydra
  ("Extra Tools"
   (("k" k8s-mode "Kubernetes mode")
    ("K" kubernetes-overview "Kubernetes manager"))
   )
  :ensure t)

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview))

;; If you want to pull in the Evil compatibility package.
(use-package kubernetes-evil
  :ensure t
  :after kubernetes)

(use-package k8s-mode
  :ensure t
  :mode-hydra
  ("Tools"
   (("k" kubernetes-overview "Kubernetes manager"))
   )
  :hook (k8s-mode . yas-minor-mode))

(provide 'wcx-containers)

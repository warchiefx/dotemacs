(use-package dockerfile-mode
  :mode "\\Dockerfile\\'"
  :mode "\\dockerfile\\'"
  :defer t
  :mode-hydra
  ("Tools"
   (("d" docker "Docker Manager"))
   ))

(use-package docker
  :defer t
  :commands (docker))

(use-package yaml-mode
  :mode "\\.yml\\'"
  :defer t
  :mode-hydra
  ("Extra Tools"
   (("k" k8s-mode "Kubernetes mode")
    ("K" kubernetes-overview "Kubernetes manager")
    ("d" docker "Docker Manager"))
   ))

(use-package kubernetes
  :defer t
  :commands (kubernetes-overview))

;; If you want to pull in the Evil compatibility package.
(use-package kubernetes-evil)

(use-package k8s-mode
  :defer t
  :mode-hydra
  ("Tools"
   (("k" kubernetes-overview "Kubernetes manager"))
   )
  :commands (k8s-mode)
  :hook (k8s-mode . yas-minor-mode))

(provide 'wcx-containers)


(when (locate-library "helm")
  (helm-mode 1)
  (global-set-key [C-f2] 'helm-mini))

(provide 'wcx-helm)

(when (locate-library "helm")
  (require 'helm-config)
  (require 'helm-c-moccur)
  (require 'helm-ls-git)
  (require 'helm-ls-hg)

  (helm-mode 0)
  (helm-adaptative-mode)

  (when (locate-library "helm-c-moccur")
    (load-library "helm-c-moccur"))
  (when (locate-library "helm-projectile")
    (load-library "helm-projectile"))
  (when (locate-library "helm-swoop")
    (require 'helm-swoop)
    (global-set-key [C-f1] 'helm-swoop)
    (global-set-key [C-S-f1] 'helm-swoop-back-to-last-point)

    ;; When doing isearch, hand the word over to helm-swoop
    (define-key isearch-mode-map [C-f1] 'helm-swoop-from-isearch))
  
  (defun wcx-helm ()
    (interactive)
    (helm :sources '(helm-c-source-dmoccur
                     helm-source-moccur
                     helm-source-buffers-list
                     '(when (projectile-project-p)
                        (helm-source-projectile-files-list))
                     helm-source-findutils
                     helm-source-recentf
                     )
          :buffer "*helm*"
          :prompt "> "))

  (global-set-key [f1] 'wcx-helm)
  (global-set-key [S-f1] 'helm-do-grep))

(provide 'wcx-helm)

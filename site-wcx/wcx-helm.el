(when (locate-library "helm")
  (helm-mode 1)

  (when (locate-library "helm-c-moccur")
    (load-library "helm-c-moccur"))
  (when (locate-library "helm-projectile")
    (load-library "helm-projectile"))

  (defun wcx-helm ()
    (interactive)
    (let ((default (thing-at-point 'symbol)))
      (helm
       :prompt "pattern: "
       :sources
       (append '(helm-source-buffers-list
                 (when (projectile-project-p)
                   helm-c-source-projectile-files-list)
                 helm-c-source-browse-code
                 helm-c-source-occur-by-moccur
                 helm-source-recentf
                 helm-source-files-in-current-dir
                 helm-source-pp-bookmarks
                 helm-source-buffer-not-found
                 )
               ))))

  (global-set-key [C-f2] 'wcx-helm))

(provide 'wcx-helm)

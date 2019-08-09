(use-package treemacs
  :ensure t
  :defer t
  :config
  (add-hook 'treemacs-mode-hook (lambda() (display-line-numbers-mode -1)))
  (progn
    (setq treemacs-collapse-dirs                 (if (executable-find "python3") 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-follow-delay             0.2
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             nil
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-desc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null (executable-find "python3"))))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t t"   . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)
        ([f8]        . treemacs)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

;; (use-package lsp-treemacs
;;   :after treemacs lsp-mode)

;; (use-package neotree
;;   :ensure t
;;   :config
;;   (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;;   (defun neotree-project-dir-toggle ()
;;     "Open NeoTree using the project root, using find-file-in-project,
;; or the current buffer directory."
;;     (interactive)
;;     (let ((project-dir
;;            (ignore-errors
;;            ;;; Pick one: projectile or find-file-in-project
;;                                         ; (projectile-project-root)
;;              (projectile-project-root)
;;              ))
;;           (file-name (buffer-file-name))
;;           (neo-smart-open t))
;;       (if (and (fboundp 'neo-global--window-exists-p)
;;                (neo-global--window-exists-p))
;;           (neotree-hide)
;;         (progn
;;           (neotree-show)
;;           (if project-dir
;;               (neotree-dir project-dir))
;;           (if file-name
;;               (neotree-find file-name))))))
;;   (defun my/neotree-hook (_unused)
;;     (setq-local display-line-numbers nil))
;;   (add-hook 'neo-after-create-hook 'my/neotree-hook)

;;   :bind (([f8] . neotree-project-dir-toggle)))

(provide 'wcx-filebrowser)

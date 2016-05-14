(use-package helm-projectile
  :defer t)

(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  ;;(require 'helm-c-moccur)
  (require 'helm-semantic)
  ;;(require 'helm-flycheck)
  (helm-mode 0)

  (setq
   helm-google-suggest-use-curl-p t
   helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
   helm-quick-update t ; do not display invisible candidates
   helm-idle-delay 0.01 ; be idle for this many seconds, before updating in delayed sources.
   helm-input-idle-delay 0.01 ; be idle for this many seconds, before updating candidate buffer
   helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

   helm-split-window-default-side 'other ;; open helm buffer in another window
   helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
   helm-buffers-favorite-modes (append helm-buffers-favorite-modes
                                       '(picture-mode artist-mode))
   helm-candidate-number-limit 200 ; limit the number of displayed canidates
   helm-M-x-requires-pattern 0     ; show all candidates when set to 0
   helm-boring-file-regexp-list
   '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
   helm-ff-file-name-history-use-recentf t
   helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                        ; when reaching top or bottom of source.
   ido-use-virtual-buffers t      ; Needed in helm-buffers-list
   helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non--nil
                                        ; useful in helm-mini that lists buffers
   )

  (when (locate-library "helm-c-moccur")
    (load-library "helm-c-moccur"))
  (when (locate-library "helm-projectile")
    (load-library "helm-projectile"))
  (when (locate-library "helm-swoop")
    (require 'helm-swoop)
    (global-set-key [C-f1] 'helm-swoop)
    (global-set-key [C-f5] 'helm-multi-swoop-all)
    (global-set-key [C-S-f1] 'helm-swoop-back-to-last-point)

    ;; When doing isearch, hand the word over to helm-swoop
    (define-key isearch-mode-map [C-f1] 'helm-swoop-from-isearch))

  (defun wcx-helm ()
    (interactive)
    (let ((srcs '(
                  helm-source-semantic
                  helm-source-buffers-list
                  helm-source-find-files
                  helm-source-file-name-history
                  ;;helm-source-recentf
                  helm-source-projectile-projects
                  ;;helm-source-flycheck
                  )))
      (if (projectile-project-p)
          (setq srcs (append srcs '(helm-source-projectile-files-list))))
      (helm :sources srcs
            :buffer "*helm*"
            :prompt "> ")))
  :bind (([f1] . wcx-helm)
         ([S-f1] . helm-do-grep)
         ("M-y" . helm-show-kill-ring))
  )


(provide 'wcx-helm)

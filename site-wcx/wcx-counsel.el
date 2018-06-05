(use-package ivy
  :ensure t
  :diminish (ivy-mode . "")             ; does not display ivy in the modeline
  :init
  (ivy-mode 1)                          ; enable ivy globally at startup
  :bind (:map ivy-minibuffer-map        ; bind in the ivy buffer
              ("RET" . ivy-alt-done)
              ("s-<"   . ivy-avy)
              ("s->"   . ivy-dispatching-done)
              ("s-+"   . ivy-call)
              ("s-!"   . ivy-immediate-done)
              ("s-["   . ivy-previous-history-element)
              ("s-]"   . ivy-next-history-element))
  :config
  (setq ivy-use-virtual-buffers t)       ; extend searching to bookmarks and
  (setq ivy-height 20)                   ; set height of the ivy window
  (setq ivy-count-format "[%d|%d] ")     ; count format, from the ivy help page
  (setq ivy-display-style 'fancy)
  (setq ivy-format-function 'ivy-format-function-arrow) ; Make highlight extend all the way to the right
  (setq ivy-re-builders-alist
        '((t . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  (setq ivy-initial-inputs-alist nil)

  (defvar evil-state-before-minibuffer-setup 'normal)

  (add-hook 'minibuffer-setup-hook
            (lambda () (setq evil-state-before-minibuffer-setup evil-state)
              (evil-insert-state)))

  (add-hook 'minibuffer-exit-hook (lambda ()
                                    (evil-change-state evil-state-before-minibuffer-setup)))

  (define-key evil-insert-state-map [escape]
    (lambda () (interactive) (evil-normal-state)
      (evil-escape)
      )))

(use-package counsel
  :ensure t
  :diminish (counsel-mode . "")
  :bind
  (("M-y" . counsel-yank-pop)
   :map ivy-minibuffer-map
   ("M-y" . ivy-next-line))
  :config
  (counsel-mode 1)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-<f1>") 'counsel-ag)
  (global-set-key (kbd "C-x l") 'counsel-locate))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode)
  (setq projectile-completion-system 'ivy))

(use-package smex
  :ensure t)


(use-package counsel-gtags
  :ensure t
  :config
  (counsel-gtags-mode)
  :bind (("<f1>" . counsel-gtags-find-symbol)))

(use-package swiper
  :ensure t
  :bind (([M-f1] . swiper)))

(use-package ivy-hydra
  :ensure t)

(provide 'wcx-counsel)

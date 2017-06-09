;;; wcx-evil.el --- Integrate EVIL vim compatibility

(use-package evil
  :ensure t
  :diminish undo-tree-mode
  :config
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map
    (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
  ;; Rebind ESC so it returns us to evil normal state.
  (global-set-key (kbd "<escape>") 'evil-normal-state)
  (setq evil-default-state 'normal)
  (evil-set-initial-state 'org-mode 'emacs)
  (turn-on-evil-mode))

(use-package evil-anzu
  :ensure t
  :after evil)

(use-package evil-matchit
  :ensure t
  :after evil)

(provide 'wcx-evil)

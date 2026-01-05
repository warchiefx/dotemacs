(require 'auth-source)

;; for eat terminal backend:
(use-package eat :ensure t)
;; for vterm terminal backend:
(use-package vterm :ensure t)
;; for slash commands popup
(use-package popup :ensure t)
;; install gemini-cli.el
(use-package gemini-cli :ensure t
  :vc (:url "https://github.com/linchen2chris/gemini-cli.el" :rev :newest)
  :config
    (gemini-cli-mode)
    (setq gemini-cli-terminal-backend 'vterm)
  :bind-keymap ("C-c c" . gemini-cli-command-map)) ;; or your preferred key

(use-package ai-code
  :config
  (ai-code-set-backend  'gemini) ;; use claude-code-ide as backend
  ;; Enable global keybinding for the main menu
  (global-set-key (kbd "C-c a") #'ai-code-menu)
  ;; Optional: Use vterm if you prefer, by default it is eat
  ;; Optional: Turn on auto-revert buffer, so that the AI code change automatically appears in the buffer
  (global-auto-revert-mode 1)
  (setq auto-revert-interval 1) ;; set to 1 second for faster update
  ;; Optional: Set up Magit integration for AI commands in Magit popups
  (with-eval-after-load 'magit
    (ai-code-magit-setup-transients)))

(add-to-list 'auto-mode-alist '("\\.mdc\\'" . markdown-mode))

(provide 'wcx-llm)

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

(use-package claude-code-ide
  :ensure t
  :vc (:url "https://github.com/manzaltu/claude-code-ide.el" :rev :newest)
  :bind ("C-c x" . claude-code-ide-menu) ; Set your favorite keybinding
  :config
  ;; Adjust the terminal initialization delay (default is 0.1 seconds)
  (setq claude-code-ide-terminal-initialization-delay 0.15)
  (claude-code-ide-emacs-tools-setup)) ; Optionally enable Emacs MCP tools

(use-package ai-code
  :ensure t
  :config
  (ai-code-set-backend  'claude-code-ide) ;; use claude-code-ide as backend
  (global-set-key (kbd "C-c a") #'ai-code-menu)
  ;; Auto-revert so AI-edited files refresh in their buffers. 1s polling
  ;; (the upstream suggestion) freezes Emacs every second across many open
  ;; buffers; 5s is plenty for human-perceived freshness, and we skip
  ;; remote files entirely so Tramp connections don't get hammered.
  (global-auto-revert-mode 1)
  (setq auto-revert-interval 5
        auto-revert-remote-files nil
        auto-revert-verbose nil)
  ;; Optional: Set up Magit integration for AI commands in Magit popups
  (with-eval-after-load 'magit
    (ai-code-magit-setup-transients)))

(add-to-list 'auto-mode-alist '("\\.mdc\\'" . markdown-mode))

(provide 'wcx-llm)

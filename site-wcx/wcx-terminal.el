(use-package sane-term
  :ensure t
  :commands sane-term
  :init
  ;; shell to use for sane-term
  (setq sane-term-shell-command "/usr/bin/zsh")
  ;; sane-term will create first term if none exist
  (setq sane-term-initial-create t)
  ;; `C-d' or `exit' will kill the term buffer.
  (setq sane-term-kill-on-exit t)
  ;; After killing a term buffer, not cycle to another.
  (setq sane-term-next-on-kill nil))

(use-package shell-pop
  :ensure t
  :bind (([f7] . shell-pop)
         ([shift f7] . sane-term-create)))

(use-package xterm-color
  :ensure t
  :init
  ;; comint install
  (progn (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
         (setq comint-output-filter-functions (remove 'ansi-color-process-output comint-output-filter-functions)))

  ;; comint uninstall
  (progn (remove-hook 'comint-preoutput-filter-functions 'xterm-color-filter)
         (add-to-list 'comint-output-filter-functions 'ansi-color-process-output)))

;; Setup eshell smart
(require 'eshell)
(require 'em-smart)
(setq eshell-where-to-jump 'begin)
(setq eshell-review-quick-commands nil)
(setq eshell-smart-space-goes-to-end t)

(setq eshell-history-size 1024)
(setq eshell-prompt-regexp "^[^#$]*[#$] ")

(load "em-hist")           ; So the history vars are defined
(if (boundp 'eshell-save-history-on-exit)
    (setq eshell-save-history-on-exit t)) ; Don't ask, just save
;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)
(if (boundp 'eshell-ask-to-save-history)
    (setq eshell-ask-to-save-history 'always)) ; For older(?) version
;(message "eshell-ask-to-save-history is %s" eshell-ask-to-save-history)

(defun eshell/ef (fname-regexp &rest dir) (ef fname-regexp default-directory))
(setenv "PAGER" "cat")


;;; ---- path manipulation

(defun pwd-repl-home (pwd)
  (interactive)
  (let* ((home (expand-file-name (getenv "HOME")))
   (home-len (length home)))
    (if (and
   (>= (length pwd) home-len)
   (equal home (substring pwd 0 home-len)))
  (concat "~" (substring pwd home-len))
      pwd)))

(defun curr-dir-git-branch-string (pwd)
  "Returns current git branch as a string, or the empty string if
PWD is not in a git repo (or the git command is not found)."
  (interactive)
  (when (and (eshell-search-path "git")
             (locate-dominating-file pwd ".git"))
    (let ((git-output (shell-command-to-string (concat "cd " pwd " && git branch | grep '\\*' | sed -e 's/^\\* //'"))))
      (propertize (concat "["
              (if (> (length git-output) 0)
                  (substring git-output 0 -1)
                "(no branch)")
              "]") 'face `(:foreground "gold3"))
      )))

(setq eshell-prompt-function
      (lambda ()
        (concat
         (propertize ((lambda (p-lst)
            (if (> (length p-lst) 3)
                (concat
                 (mapconcat (lambda (elm) (if (zerop (length elm)) ""
                                            (substring elm 0 1)))
                            (butlast p-lst 3)
                            "/")
                 "/"
                 (mapconcat (lambda (elm) elm)
                            (last p-lst 3)
                            "/"))
              (mapconcat (lambda (elm) elm)
                         p-lst
                         "/")))
          (split-string (pwd-repl-home (eshell/pwd)) "/")) 'face `(:foreground 'custom-documentation))
         (or (curr-dir-git-branch-string (eshell/pwd)))
         (propertize "# " 'face 'default))))

(add-hook 'eshell-mode-hook
            (lambda ()
              (add-to-list 'eshell-visual-commands "ssh")
              (add-to-list 'eshell-visual-commands "tail")
              (add-to-list 'eshell-visual-commands "top")))

(setq eshell-highlight-prompt nil)

;; (eshell/alias "ff" "find-file $1")
;; (eshell/alias "fw" "find-file-other-window $1")
;; (eshell/alias "fr" "find-file-other-frame $1")
;; (eshell/alias "emacs" "find-file $1")
;; (eshell/alias "gd" "magit-diff-unstaged")
;; (eshell/alias "gds" "magit-diff-staged")
;; (eshell/alias "d" "dired $1")

;; Better clear implementation
(defun eshell/clear ()
  "clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

;; Just call magit
(defun eshell/gst (&rest args)
    (magit-status (pop args) nil)
    (eshell/echo))   ;; The echo command suppresses output

;; Allow using C-d to delete characters
(defun ha/eshell-quit-or-delete-char (arg)
  (interactive "p")
  (if (and (eolp) (looking-back eshell-prompt-regexp))
      (progn
        (eshell-life-is-too-much) ; Why not? (eshell/exit)
        (ignore-errors
          (delete-window)))
    (delete-forward-char arg)))

(add-hook 'eshell-mode-hook
          (lambda ()
            (bind-keys :map eshell-mode-map
                       ("C-d" . ha/eshell-quit-or-delete-char))))

;; Better history browsing
(defun eshell-next-prompt (n)
  "Move to end of Nth next prompt in the buffer. See `eshell-prompt-regexp'."
  (interactive "p")
  (re-search-forward eshell-prompt-regexp nil t n)
  (when eshell-highlight-prompt
    (while (not (get-text-property (line-beginning-position) 'read-only) )
      (re-search-forward eshell-prompt-regexp nil t n)))
  (eshell-skip-prompt))

(defun eshell-previous-prompt (n)
  "Move to end of Nth previous prompt in the buffer. See `eshell-prompt-regexp'."
  (interactive "p")
  (backward-char)
  (eshell-next-prompt (- n)))

(defun eshell-insert-history ()
  "Displays the eshell history to select and insert back into your eshell."
  (interactive)
  (insert (ido-completing-read "Eshell history: "
                               (delete-dups
                                (ring-elements eshell-history-ring)))))

(add-hook 'eshell-mode-hook (lambda ()
    (define-key eshell-mode-map (kbd "M-S-P") 'eshell-previous-prompt)
    (define-key eshell-mode-map (kbd "M-S-N") 'eshell-next-prompt)
    (define-key eshell-mode-map (kbd "M-r") 'eshell-insert-history)))

(use-package esh-autosuggest
  :hook (eshell-mode . esh-autosuggest-mode)
  ;; If you have use-package-hook-name-suffix set to nil, uncomment and use the
  ;; line below instead:
  ;; :hook (eshell-mode-hook . esh-autosuggest-mode)
  :ensure t)

(provide 'wcx-terminal)

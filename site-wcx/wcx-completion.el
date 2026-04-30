;;; wcx-completion.el --- Minibuffer completion stack -*- lexical-binding: t -*-
;;; Commentary:
;; Modern minimalist completion: vertico (UI) + orderless (matching) +
;; marginalia (annotations) + consult (commands) + embark (actions) +
;; consult-projectile (project-aware variants).
;;
;; Replaces the older ivy/counsel/swiper stack. Concept-mapping:
;;   ivy-switch-buffer       -> consult-buffer
;;   counsel-M-x             -> execute-extended-command (vertico-enhanced)
;;   counsel-find-file       -> find-file (vertico-directory-enhanced)
;;   counsel-yank-pop        -> consult-yank-pop
;;   counsel-locate          -> consult-locate
;;   counsel-imenu / ivy-imenu-anywhere -> consult-imenu / consult-imenu-multi
;;   swiper / swiper-isearch -> consult-line
;;   counsel-projectile-*    -> consult-projectile-*
;;   ivy-dispatching-done    -> embark-act
;;; Code:

;; Better defaults for any minibuffer completion.
(use-package savehist
  :ensure nil
  :init (savehist-mode 1))

(use-package emacs
  :ensure nil
  :init
  ;; Hide commands that don't apply to the current mode.
  (setq read-extended-command-predicate #'command-completion-default-include-p)
  ;; Don't allow point in the prompt; tab completion through long paths.
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode))

;; ---------------------------------------------------------------------------
;; Vertico — minibuffer completion UI (replaces ivy)
;; ---------------------------------------------------------------------------

(use-package vertico
  :ensure t
  :init (vertico-mode 1)
  :custom
  (vertico-cycle t)
  (vertico-resize t)
  (vertico-count 20))

(use-package vertico-directory
  :ensure nil
  :after vertico
  :bind (:map vertico-map
              ("RET"   . vertico-directory-enter)
              ("DEL"   . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

;; ---------------------------------------------------------------------------
;; Orderless — flexible space-separated match patterns
;; ---------------------------------------------------------------------------

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides
   '((file (styles partial-completion))
     (eglot (styles orderless))
     (eglot-capf (styles orderless)))))

;; ---------------------------------------------------------------------------
;; Marginalia — annotations (file size, command docstring, …) in completions
;; ---------------------------------------------------------------------------

(use-package marginalia
  :ensure t
  :init (marginalia-mode 1)
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle)))

;; ---------------------------------------------------------------------------
;; Consult — replacements for counsel-*/swiper commands
;; ---------------------------------------------------------------------------

(use-package consult
  :ensure t
  :bind (;; C-x bindings (ctl-x-map)
         ("C-x b"   . consult-buffer)              ; was ivy-switch-buffer
         ("C-x 4 b" . consult-buffer-other-window)
         ("C-x p b" . consult-project-buffer)
         ("C-x r b" . consult-bookmark)
         ("C-x l"   . consult-locate)              ; was counsel-locate

         ;; M-g goto map
         ("M-g g"   . consult-goto-line)
         ("M-g M-g" . consult-goto-line)
         ("M-g i"   . consult-imenu)
         ("M-g I"   . consult-imenu-multi)         ; was ivy-imenu-anywhere
         ("M-g e"   . consult-flymake)             ; or M-x eglot diagnostics
         ("M-g o"   . consult-outline)

         ;; M-s search map
         ("M-s l"   . consult-line)
         ("M-s L"   . consult-line-multi)
         ("M-s r"   . consult-ripgrep)
         ("M-s f"   . consult-find)
         ("M-s d"   . consult-fd)
         ("M-s g"   . consult-grep)

         ;; Other useful commands
         ("M-y"     . consult-yank-pop)            ; was counsel-yank-pop
         ("M-i"     . consult-imenu-multi)         ; was ivy-imenu-anywhere
         ("M-<f1>"  . consult-line)                ; was swiper-isearch
         ("<f1>"    . consult-line-multi)          ; was counsel-gtags-find-symbol
         ("C-h I"   . consult-info)
         ("C-c r"   . consult-recent-file))
  :init
  ;; Faster preview, but stay polite over tramp.
  (setq register-preview-delay 0.2
        register-preview-function #'consult-register-format
        xref-show-xrefs-function       #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  (consult-customize
   consult-theme consult-buffer consult-recent-file
   consult-bookmark consult--source-bookmark
   consult-line consult-line-multi
   :preview-key '(:debounce 0.4 any)))

(use-package consult-projectile
  :ensure t
  :after (consult projectile)
  :bind (("s-<f1>" . consult-projectile-find-file)
         ("C-c P"  . consult-projectile)))

;; ---------------------------------------------------------------------------
;; Embark — act on the thing the minibuffer or buffer is showing
;; ---------------------------------------------------------------------------

(use-package embark
  :ensure t
  :bind (;; M-o is the traditional embark binding for ivy migrators (replaces
         ;; ivy-dispatching-done) and reaches Emacs.app reliably on macOS,
         ;; unlike C-, / C-. which can get eaten by the Cocoa input layer.
         ("M-o"   . embark-act)
         ("M-O"   . embark-dwim)
         ("C-h B" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command))

(use-package embark-consult
  :ensure t
  :after (embark consult)
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(provide 'wcx-completion)
;;; wcx-completion.el ends here

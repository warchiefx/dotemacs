;;; dotemacs.el --- Madness starts here

;;; Commentary:
;; WaRCHieFX's .emacs file, use at you own risk
;; --------------------------------------------

;;; Code:
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defvar wcx/lsp-provider "eglot")
(defvar wcx/checker "flycheck")

(setq load-prefer-newer t)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.1 nil 'invert-face 'mode-line)))

;; ----- Standard Loadpath
;; (setq site-lisp-path "~/.emacs.d/site-lisp/")
(setq site-wcx-path "~/.emacs.d/site-wcx/")
;; (add-to-list 'load-path site-lisp-path)
(add-to-list 'load-path site-wcx-path)

;; Move custom definitions to another place.
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

; Use the system clipboard
(setq x-select-enable-clipboard t)

(require 'wcx-package)

(unless (locate-library "diminish")
  (package-install "diminish"))

(when (locate-library "use-package")
  (use-package better-defaults :ensure t))

(use-package gcmh
  :ensure t
  :diminish
  :custom
  ;; Cap the deferred-GC heap. Without an upper bound, gcmh lets memory
  ;; grow until idle, then a single GC pause can lock Emacs for seconds.
  ;; 128MiB triggers GC during natural idle bursts instead.
  (gcmh-high-cons-threshold (* 128 1024 1024))
  (gcmh-idle-delay 'auto)
  :config
  (gcmh-mode 1))

(require 'benchmark)

;; Pull PATH and other env vars from the user's login shell *before* any
;; feature loads, so tools like cmake (vterm), language servers (eglot),
;; pyenv, node, npm-globals (e.g. openspec), etc. are findable when
;; Emacs.app is launched from the GUI.
;;
;; We deliberately keep the default ("-l" "-i") so both zprofile *and*
;; zshrc are sourced — NVM loads in zshrc, so without -i, anything under
;; ~/.nvm/versions/node/<ver>/bin (npm globals) is invisible to Emacs.
(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

; If debug-init is set, print module load times
(defmacro load-feature (name)
  `(if init-file-debug
       (message "Feature '%s' loaded in %.2fs" ,name
                (benchmark-elapse (require ,name)))
     (require ,name)))

;; Custom stuff
(load-feature 'wcx-generic)
(load-feature 'wcx-hydra)
(load-feature 'wcx-companymode)
(load-feature 'wcx-evil)
(load-feature 'wcx-keybindings)
(load-feature 'wcx-color-theme)
(load-feature 'wcx-modeline)
(load-feature 'wcx-terminal)

;; Tools
(load-feature 'wcx-org)
(load-feature 'wcx-markdown)
(load-feature 'wcx-filebrowser)
(load-feature 'wcx-git)
(load-feature 'wcx-templates)
(load-feature 'wcx-checking)
(load-feature 'wcx-projects)
(load-feature 'wcx-completion)
(load-feature 'wcx-containers)

;; Programming Modes
(load-feature 'wcx-java)
(load-feature 'wcx-python)
(load-feature 'wcx-webdev)
(load-feature 'wcx-lsp)
(load-feature 'wcx-llm)

;; Start emacs-server, for emacsclient usage.
(use-package server
  :ensure nil
  :config
  (set-default 'server-socket-dir "~/.config/emacs/server")
  (server-start)
  :hook (after-init . server-mode))

(prefer-coding-system 'utf-8)

(put 'upcase-region 'disabled nil)

(defmacro diminish-afterload (package-name mode)
  "After loading PACKAGE-NAME, diminish MODE."
  `(eval-after-load ,package-name
     '(diminish ,mode)))

(when (locate-library "diminish")
  (require 'diminish)
  
  ;;(diminish-afterload "magit" 'magit-auto-revert-mode)
  (diminish-afterload "guide-key" 'guide-key-mode)
  (diminish-afterload "whitespace-cleanup-mode" 'whitespace-cleanup-mode)
  (diminish-afterload "emmet-mode" 'emmet-mode)
  (diminish-afterload "auto-complete" 'auto-complete-mode)
  (diminish-afterload "auto-revert" 'auto-revert-mode)
  (diminish-afterload "autorevert" 'auto-revert-mode)
  (diminish-afterload "ggtags" 'ggtags-mode)
  (diminish-afterload "undo-tree" 'undo-tree-mode)
  (diminish-afterload "eldoc" 'eldoc-mode)
  (diminish-afterload "projectile" 'projectile-mode))


(defun display-startup-echo-area-message ()
  "Display startup echo area message."
  (message "Initialized in %s" (emacs-init-time)))

(provide '.emacs)
;;; .emacs ends here

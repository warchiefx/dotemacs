;;; dotemacs.el --- Madness starts here

;;; Commentary:
;; WaRCHieFX's .emacs file, use at you own risk
;; --------------------------------------------

;;; Code:
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(defvar wcx/lsp-provider "lsp-mode")
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
  :config
  (gcmh-mode 1))

(require 'benchmark)

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
(load-feature 'wcx-requirements)
;; (load-feature 'wcx-fonts)
;; (load-feature 'wcx-utils)
(load-feature 'wcx-keybindings)
;; (load-feature 'wcx-icicles)
;; (load-feature 'wcx-ido)
(load-feature 'wcx-color-theme)
(load-feature 'wcx-modeline)
(load-feature 'wcx-encryption)
(load-feature 'wcx-workgroups)
(load-feature 'wcx-debugger)
(load-feature 'wcx-terminal)

;; Tools
(load-feature 'wcx-org)
(load-feature 'wcx-markdown)
(load-feature 'wcx-filebrowser)
;; (load-feature 'wcx-w3m)
;; (load-feature 'wcx-gnus)
;; (load-feature 'wcx-wanderlust)
;; (load-feature 'wcx-gnus-nnrss)
;; (load-feature 'wcx-bbdb)
(load-feature 'wcx-tramp)
;; (load-feature 'wcx-svn)
(load-feature 'wcx-git)
;; (load-feature 'wcx-mercurial)
(load-feature 'wcx-templates)
(load-feature 'wcx-cedet)
;; (load-feature 'wcx-minimap)
(load-feature 'wcx-checking)
(load-feature 'wcx-projects)
;; (load-feature 'wcx-helm)
(load-feature 'wcx-counsel)
(load-feature 'wcx-containers)

;; Programming Modes
(load-feature 'wcx-java)
;; (load-feature 'wcx-malabar)
(load-feature 'wcx-python)
(load-feature 'wcx-webdev)
;; (load-feature 'wcx-slime)
(load-feature 'wcx-lua)
;; (load-feature 'wcx-go)
;; (load-feature 'wcx-scala)
;; (load-feature 'wcx-auto-complete)
(load-feature 'wcx-lsp)
(load-feature 'wcx-misc-prog)

;; Games
;; (require 'wcx-nethack)

;; ----- Make this file be recompiled after it's saved
(defun byte-compile-user-init-file ()
  "Byte-compile the user init file."
  (let ((byte-compile-warnings '(unresolved)))
    ;; in case compilation fails, don't leave the old .elc around:
    (if (file-exists-p (concat user-init-file ".elc"))
	(delete-file (concat user-init-file ".elc")))
    (byte-compile-file user-init-file)
    (message "%s compiled" user-init-file)
    ))
(defun my-emacs-lisp-mode-hook ()
  "Compile .emacs after it's saved."
  (when (equal buffer-file-name user-init-file)
    (add-hook 'after-save-hook 'byte-compile-user-init-file t t)))
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

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


(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(defun display-startup-echo-area-message ()
  "Display startup echo area message."
  (message "Initialized in %s" (emacs-init-time)))

(provide '.emacs)
;;; .emacs ends here

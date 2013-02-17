;;; wcx-python.el --- Python setup
;;
;; Filename: wcx-python.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:32:07 2008
;;
;; Last-Updated: Wed Oct  6 09:39:15 2010 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path (concat site-lisp-path "emacs-for-python"))
(add-to-list 'load-path (concat site-lisp-path "emacs-jedi"))

(when (locate-library "python-mode")
  (load-library "python-mode"))

;; (when (locate-library "epy-init")
;;   (load-library "epy-init")
;;   (require 'epy-setup)
;;   (epy-setup-ipython))

(require 'epy-setup)      ;; It will setup other loads, it is required!
;; (require 'epy-python)     ;; If you want the python facilities [optional]
(require 'epy-completion) ;; If you want the autocompletion settings [optional]
(require 'epy-editing)    ;; For configurations related to editing [optional]
;;(require 'epy-bindings)   ;; For my suggested keybindings [optional]
(require 'epy-nose)       ;; For nose integration

(setq python-saved-check-command nil)

;; (add-to-list 'load-path (concat site-lisp-path "Pymacs"))

;; (when (locate-library "pymacs")
;;   (load-library "pymacs")
;;   ;; pymacs
;;   (autoload 'pymacs-apply "pymacs")
;;   (autoload 'pymacs-call "pymacs")
;;   (autoload 'pymacs-eval "pymacs" nil t)
;;   (autoload 'pymacs-exec "pymacs" nil t)
;;   (autoload 'pymacs-load "pymacs" nil t)
;;   ;; ;;(eval-after-load "pymacs"
;;   ;; ;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))
;;   (pymacs-load "ropemacs" "rope-")
;;   (setq ropemacs-enable-autoimport t))

;; (setq
;;  python-shell-interpreter "ipython2"
;;  python-shell-interpreter-args ""
;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;  python-shell-completion-setup-code
;;  "from IPython.core.completerlib import module_completion"
;;  python-shell-completion-module-string-code
;;  "';'.join(module_completion('''%s'''))\n"
;;  python-shell-completion-string-code
;;  "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(when (locate-library "jedi")
  (autoload 'jedi:setup "jedi" nil t)
  (setq jedi:setup-keys t)
  (add-hook 'python-mode-hook 'jedi:setup))

;; Flymake setup
(when (locate-library "flymake-python-pyflakes")
  (require 'flymake-python-pyflakes)
  (add-hook 'python-mode-hook 'flymake-python-pyflakes-load))

(provide 'wcx-python)

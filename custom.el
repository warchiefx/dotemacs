;;; custom.el --- Custom settings
;;
;; Filename: custom.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Sun Dec  7 23:15:47 2008
;;
;; Last-Updated: Wed May 19 09:40:00 2010 (-14400 AST)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ----- Settings
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Info-additional-directory-list (quote ("~/.emacs.d/info")))
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(browse-url-browser-function (quote browse-url-default-browser))
 '(bsh-classpath (quote ("/usr/share/libreadline-java/lib/libreadline-java.jar")))
 '(bsh-jar "/usr/share/bsh/lib/bsh.jar")
 '(bsh-vm "/etc/java-config-2/current-system-vm/bin/java")
 '(byte-compile-warnings (quote (suspicious lexical)))
 '(c-default-style "k&r")
 '(case-fold-search t)
 '(column-number-mode t)
 '(company-auto-complete (quote company-explicit-action-p))
 '(compilation-scroll-output (quote first-error))
 '(compile-command "ant -s build.xml -emacs")
 '(current-language-environment "Latin-1")
 '(cursor-type (quote bar) t)
 '(custom-safe-themes (quote ("ebf6314f5c7c71034ffe2d67db489c6d868be3cf8cdba02e5a936808c5df75c8" "27470eddcaeb3507eca2760710cc7c43f1b53854372592a3afa008268bcf7a75" "5e1d1564b6a2435a2054aa345e81c89539a72c4cad8536cfe02583e0b7d5e2fa" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" "21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "71efabb175ea1cf5c9768f10dad62bb2606f41d110152f4ace675325d28df8bd" "c727f1d1459ff018a0a1be6da758f9dc32ad7333d965279ed91899bd63e067c2" "b7553781f4a831d5af6545f7a5967eb002c8daeee688c5cbf33bf27936ec18b3" "30fe7e72186c728bd7c3e1b8d67bc10b846119c45a0f35c972ed427c45bacc19" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "baed08a10ff9393ce578c3ea3e8fd4f8c86e595463a882c55f3bd617df7e5a45" "54d1bcf3fcf758af4812f98eb53b5d767f897442753e1aa468cfeb221f8734f9" "284aece21e57abcf7c7d5f273d2d17dc646b24cb1465fd054ad9dca3555aed1c" "36afe64261e1de73fcfadedf154e4bc2c9ec1969bde0c21798d31366897bc4d2" default)))
 '(default-input-method "latin-1-prefix")
 '(ecb-auto-activate nil)
 '(ecb-directories-menu-user-extension-function (quote ignore))
 '(ecb-gzip-setup (quote ("/bin/gzip" . other)))
 '(ecb-history-menu-user-extension-function (quote ignore))
 '(ecb-layout-name "left1")
 '(ecb-layout-window-sizes nil)
 '(ecb-methods-menu-user-extension-function (quote ignore))
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--mouse-2))
 '(ecb-sources-menu-user-extension-function (quote ignore))
 '(ecb-tar-setup (quote ("/bin/tar" . other)))
 '(ecb-tip-of-the-day nil)
 '(ecb-wget-setup (quote ("/usr/bin/wget" . other)))
 '(echo-keystrokes 0.01)
 '(fill-column 78)
 '(frame-title-format (quote ("%f - " user-real-login-name "@" system-name)) t)
 '(global-company-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(global-pabbrev-mode t)
 '(global-semantic-highlight-edits-mode t)
 '(global-semantic-stickyfunc-mode nil)
 '(gnus-asynchronous t)
 '(gnus-demon-timestep 300)
 '(gnus-gcc-mark-as-read t t)
 '(gnus-registry-install t)
 '(icicle-fuzzy-completion-flag nil)
 '(ido-auto-merge-work-directories-length nil)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-enable-prefix nil)
 '(ido-everywhere t)
 '(ido-ignore-extensions t)
 '(ido-max-prospects 8)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-filename-at-point (quote guess))
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries (quote ((t . right) (top . left))))
 '(indicate-empty-lines t)
 '(inhibit-startup-echo-area-message "warchiefx")
 '(inhibit-startup-screen t)
 '(jabber-account-list (quote (("warchiefx@gmail.com" (:network-server . "talk.google.com") (:connection-type . starttls)))))
 '(jabber-connection-ssl-program (quote openssl))
 '(jabber-connection-type (quote ssl))
 '(jabber-default-show "")
 '(jabber-default-status "Using emacs for gtalk :p")
 '(jabber-network-server "talk.google.com")
 '(jabber-nickname "WaRCHieFX")
 '(jabber-resource "Laptop-emacs")
 '(jabber-server "gmail.com")
 '(jabber-username "warchiefx")
 '(jedi:server-command (quote ("/home/warchiefx/.emacs.d/site-lisp/emacs-jedi/env/bin/python" "/home/warchiefx/.emacs.d/site-lisp/emacs-jedi/jediepcserver.py")))
 '(linum-format "  %d  ")
 '(mail-user-agent (quote gnus-user-agent))
 '(make-backup-files nil)
 '(mouse-drag-copy-region nil)
 '(nethack-use-tiles t)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files (quote ("~/Dropbox/log.org" "~/Dropbox/personal.org")))
 '(org-hide-leading-stars t)
 '(org-insert-mode-line-in-empty-file t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(puppet-indent-level tab-width)
 '(python-indent-offset 4)
 '(python-shell-interpreter "python2")
 '(read-mail-command (quote gnus))
 '(recentf-max-saved-items 75)
 '(require-final-newline t)
 '(ruby-indent-level tab-width)
 '(scroll-bar-mode nil)
 '(semantic-inhibit-functions nil)
 '(semantic-python-dependency-system-include-path (quote ("/usr/lib/python2.7/")))
 '(show-paren-delay 0)
 '(show-paren-mode t nil (paren))
 '(size-indication-mode t)
 '(slime-autodoc-use-multiline-p t)
 '(slime-complete-symbol*-fancy t)
 '(slime-complete-symbol-function (quote slime-fuzzy-complete-symbol))
 '(slime-highlight-suppressed-forms t)
 '(sml-modeline-borders nil)
 '(sml-modeline-len 20)
 '(sml-modeline-mode t)
 '(sml-modeline-numbers (quote line-numbers))
 '(sml/name-width 75)
 '(sml/prefix-regexp (quote (":\\(.*:\\)" "~/" "")))
 '(sml/replacer-regexp-list (quote (("^~/\\.emacs\\.d/" ":ED:") ("^/sudo:.*:" ":SU:") ("^~/Work/codemera/" ":CODEMERA:") ("^~/Work/lesite\\.ca/" ":LESITE:") ("^~/Work/caravanerepublique/" ":CARAVANE:") ("^~/Dropbox/" ":DROPBOX:") ("^~/Work/" ":WORK:"))))
 '(sml/show-battery nil)
 '(sml/show-client t)
 '(sml/show-time nil)
 '(sql-sqlite-program "sqlite3")
 '(tab-width 4)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(tramp-default-method "ftp")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(user-full-name "Ricardo Restituyo")
 '(user-mail-address "warchiefx@gmail.com")
 '(virtualenv-workon-starts-python nil)
 '(w3m-home-page "about:blank")
 '(w3m-use-cookies t)
 '(x-select-enable-clipboard t)
 '(x-select-enable-primary nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-indicator-added ((t (:inherit diff-added :foreground "green"))))
 '(diff-indicator-removed ((t (:inherit diff-removed :foreground "red"))))
 '(minimap-font-face ((t (:height 30 :family "Inconsolata"))))
 '(mode-line ((t (:foreground "#030303" :background "#a0d115" :box nil))))
 '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil))))
 '(sml-modeline-vis-face ((t (:inherit region :background "black")))))

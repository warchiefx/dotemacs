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
 '(android-mode-builder (quote maven))
 '(android-mode-key-prefix "\\C-c \\C-a")
 '(android-mode-sdk-dir "~/Apps/android-sdk")
 '(auto-hscroll-mode nil)
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(browse-url-browser-function (quote browse-url-generic))
 '(browse-url-generic-program "google-chrome-stable")
 '(bsh-classpath
   (quote
    ("/usr/share/libreadline-java/lib/libreadline-java.jar")))
 '(bsh-jar "/usr/share/bsh/lib/bsh.jar")
 '(bsh-vm "/etc/java-config-2/current-system-vm/bin/java")
 '(byte-compile-warnings (quote (suspicious lexical)))
 '(c-default-style "k&r")
 '(case-fold-search t)
 '(column-number-mode t)
 '(company-auto-complete (quote company-explicit-action-p))
 '(company-frontends
   (quote
    (company-pseudo-tooltip-unless-just-one-frontend company-echo-metadata-frontend company-preview-if-just-one-frontend)))
 '(company-show-numbers t)
 '(company-transformers (quote (company-sort-by-backend-importance)))
 '(compilation-scroll-output (quote first-error))
 '(compile-command "ant -s build.xml -emacs")
 '(current-language-environment "Latin-1")
 '(cursor-type (quote bar))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("505f50addd1b07066c8ea2c1a33f09f7e26b906eea2164210b668e61fdce30b4" "07abcde0f93da98524789bfce10018157e03d540563cb1aa3e5adc29887778f8" "763ec64e70865901709b9927b0bef397a7b6a90fcff9c13c82a51f1678f118e7" "b7e38c2b835e8b46cb51beb222ec85310a2b63135d4abbca44ecf533706fa6aa" "405b0ac2ac4667c5dab77b36e3dd87a603ea4717914e30fcf334983f79cfd87e" "e97dbbb2b1c42b8588e16523824bc0cb3a21b91eefd6502879cf5baa1fa32e10" "4ab86c7682db09485a6e046ee0a6c45b5462f514c89844f4ed8b329aa1708067" "d9b0d5c7077ddad798e9749d0629e86b925c2e146641b24130edd8f82cd0cf5d" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "d4e9f95acd51433b776f1127143bbc7d0f1d41112d547e5b7a9a506be369dc39" "49de25b465bc3c2498bcd4c1575fa0090bd56fc79cdb49b919b49eaea17ee1dd" "f688f52498f2d02dda635d873c0b1ce661201173c6b0e4c3e452d45d846fe2d8" "919469423e232db3cc35f6a94134051dd8a5a95d5cbb2a9b3c519e371a069615" "870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "224742c7512296b01bcdc353a49b3de3709f6f3d4e63042be1c2c347569c8c99" "84880085294d6190d47e6392ed50ff242326d064f783e502201eae4fd76564f6" "790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "0aca3a26459bbb43a77f34bc22851c05c0a5d70d3230cbcdbda4fec20fef77e6" "1fab355c4c92964546ab511838e3f9f5437f4e68d9d1d073ab8e36e51b26ca6a" "3ed645b3c08080a43a2a15e5768b893c27f6a02ca3282576e3bc09f3d9fa3aaa" "fbb449ba8147e2914a9bebc2d6a210b8927313a6c1b70764a7f7c61a9bc04b90" "b8b5c353e73470377f2111fddb0ea652d35ce98e0a27a5c592d2ab9f66855106" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "9eb5269753c507a2b48d74228b32dcfbb3d1dbfd30c66c0efed8218d28b8f0dc" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "12722541c8998f056b761bf63a92216aaf4610e4eb1afe7991842a31fa28b6d8" "ba9be9caf9aa91eb34cf11ad9e8c61e54db68d2d474f99a52ba7e87097fa27f5" "90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" "bac3f5378bc938e96315059cd0488d6ef7a365bae73dac2ff6698960df90552d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "2a12e95e9ee6ed57592e7df12f3f028205575e9b3affdb5e6fa589421c618136" "806d8c827b214f5f60348114bd27c6dcb5d19047f7ac482ad61e8077a6c5ea60" "1934bf7e1713bf706a9cb36cc6a002741773aa42910ca429df194d007ee05c67" "784d5ee4d33befba6a21702ead67f98346770be7cc17ab64952ae3866a403743" "b21bf64c01dc3a34bc56fff9310d2382aa47ba6bc3e0f4a7f5af857cd03a7ef7" "696927ed40057050d219989dd473cc08fab27995e4febd6cf14429a448364bc6" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" "5ae4d52977a13212da7ec2f6932b6449f7d7c07b3cb01085f018c0d4a7f38cec" "bc89fda3d232a3daa4eb3a9f87d6ffe1272fea46e4cf86686d9e8078e4209e2c" "2fa2edc14dbb434fa1a08262c088a337fc4bb3efc12c89fdb9a288620b58c6f0" "f3d2144fed1adb27794a45e61166e98820ab0bbf3cc7ea708e4bf4b57447ee27" "5e6c2e2116c7a72ae0668390f92504fd0b77524cedd387582648b1aa1c582f59" "22558263b5a17ccb3544cca562fc070496eac03263a26f338f17761a4b223ad5" "68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "636ecbf1091fbc99d95526d7a3a4810d1ccb58997e58bd3184863821303553f3" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "e57e7b19da7b4cd0e5512d5e9bc20d31c9cf50112c462de15a76bce0ea3c5ef5" "d7f1c86b425e148be505c689fc157d96323682c947b29ef00cf57b4e4e46e6c7" "9562e9eb5fd01677ac6b76b66f9a81338991fa9d270270802eeae5232c8da0a6" "0387cbee7d97362282bb951306113eab92bee32150bfcfc8edae17e8e876aec5" "e3e2db3b5acd2028f7f83581f9609e1e7369df20414ab53c9b2161e2eca08675" "1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" "9f42bccce1e13fa5017eb8718574db099e85358b9f424db78e7318f86d1be08f" "1f3269f865292502f3dd577c3412110264ef3b89d8688aa5d649b4f496c780dc" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "fe6330ecf168de137bb5eddbf9faae1ec123787b5489c14fa5fa627de1d9f82b" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(default-input-method "latin-1-prefix")
 '(display-time-mode nil)
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
 '(electric-pair-inhibit-predicate (quote ignore))
 '(electric-pair-mode t)
 '(elpy-modules
   (quote
    (elpy-module-eldoc elpy-module-pyvenv elpy-module-sane-defaults)))
 '(erc-away-timestamp-format "<%h:%M>")
 '(exec-path
   (quote
    ("/usr/local/sbin" "/usr/local/bin" "/usr/bin" "/opt/java/bin" "/opt/java/db/bin" "/opt/java/jre/bin" "/usr/bin/vendor_perl" "/usr/bin/core_perl" "/usr/lib/emacs/24.3/x86_64-unknown-linux-gnu" "/usr/share/git/remote-helpers")))
 '(fill-column 78)
 '(flycheck-display-errors-function nil)
 '(flycheck-flake8-maximum-line-length 125)
 '(flycheck-flake8rc "~/.flake8rc")
 '(frame-title-format (quote ("%f - " user-real-login-name "@" system-name)) t)
 '(global-font-lock-mode t nil (font-lock))
 '(global-pabbrev-mode t)
 '(global-semantic-highlight-edits-mode nil)
 '(global-semantic-stickyfunc-mode nil)
 '(global-yascroll-bar-mode t)
 '(gnus-asynchronous t)
 '(gnus-demon-timestep 300)
 '(gnus-gcc-mark-as-read t t)
 '(gnus-registry-install t)
 '(gui-select-enable-clipboard t)
 '(helm-adaptive-mode t nil (helm-adaptive))
 '(helm-scroll-amount 4)
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
 '(linum-format "  %d  ")
 '(magit-push-always-verify nil)
 '(mail-user-agent (quote gnus-user-agent))
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mouse-drag-copy-region nil)
 '(nethack-use-tiles t)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files
   (quote
    ("/home/warchiefx/Dropbox/Work/orgfiles/goodbed.org" "~/Dropbox/log.org" "~/Dropbox/personal.org" "/home/warchiefx/Dropbox/Work/orgfiles/azul.com.do.org" "/home/warchiefx/Dropbox/Work/orgfiles/caedro.org" "/home/warchiefx/Dropbox/Work/orgfiles/codemera.org" "/home/warchiefx/Dropbox/Work/orgfiles/coworking.org" "/home/warchiefx/Dropbox/Work/orgfiles/cto_stuff.org" "/home/warchiefx/Dropbox/Work/orgfiles/garnier_ecommerce.org" "/home/warchiefx/Dropbox/Work/orgfiles/imprimela.org" "/home/warchiefx/Dropbox/Work/orgfiles/ion8.org" "/home/warchiefx/Dropbox/Work/orgfiles/lesite.ca.org" "/home/warchiefx/Dropbox/Work/orgfiles/mesuma.org" "/home/warchiefx/Dropbox/Work/orgfiles/mgt.org" "/home/warchiefx/Dropbox/Work/orgfiles/mimetro.org" "/home/warchiefx/Dropbox/Work/orgfiles/nerdot.org" "/home/warchiefx/Dropbox/Work/orgfiles/projects.org" "/home/warchiefx/Dropbox/Work/orgfiles/pymes_do.org" "/home/warchiefx/Dropbox/Work/orgfiles/sirecine.org" "/home/warchiefx/Dropbox/Work/orgfiles/solucionalo.org" "/home/warchiefx/Dropbox/Work/orgfiles/solutions_engine.org" "/home/warchiefx/Dropbox/Work/orgfiles/sportrfid-design.org" "/home/warchiefx/Dropbox/Work/orgfiles/sportrfid.org" "/home/warchiefx/Dropbox/Work/orgfiles/whipcode.org")))
 '(org-hide-leading-stars t)
 '(org-insert-mode-line-in-empty-file t)
 '(org-src-fontify-natively t)
 '(org-trello-current-prefix-keybinding "C-c o" nil (org-trello))
 '(org-trello-files (quote ("/home/warchiefx/Dropbox/orgfiles/Trello")) nil (org-trello))
 '(org-trello-input-completion-mechanism (quote helm) nil (org-trello))
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (darkokai-theme paganini-theme embrace danneskjold-theme mustard-theme ac-anaconda ac-emmet badwolf-theme flatland-theme tao-theme ibuffer-vc ibuffer-projectile anaconda-mode company-anaconda auto-virtualenv org-trello codesearch projectile-codesearch helm-codesearch idea-darkula-theme aurora-theme material-theme code-library vimish-fold zeal-at-point company-go company-jedi company-quickhelp company-restclient company-web go-complete quasi-monochrome-theme cbm ox-gfm magit-gitflow magit common-lisp-snippets elpy odersky-theme
                    (symbol-value
                     (quote t))
                    (symbol-value
                     (quote t))
                    (symbol-value
                     (quote t))
                    (symbol-value
                     (quote t))
                    (symbol-value
                     (quote t))
                    (symbol-value
                     (quote t))
                    yascroll yaml-mode yagist workgroups2 whitespace-cleanup-mode wgrep web-mode w3m virtualenv use-package ucs-utils toggle-quotes textmate tern-auto-complete tabulated-list switch-window string-utils soft-charcoal-theme smooth-scroll smex smart-shift smart-mode-line-powerline-theme seti-theme save-packages sass-mode restclient rainbow-mode pyvirtualenv pyvenv python-pep8 py-autopep8 pony-mode pip-requirements pep8 paredit paradox ox-reveal otp org-projectile nose nginx-mode nav-flash multiple-cursors monky mongo minimap markdown-mode mark-multiple mark-more-like-this malabar-mode lua-mode loccur less-css-mode kurecolor jedi iedit idomenu ido-ubiquitous hungry-delete highlight-symbol highlight-parentheses highlight-indentation hideshowvis helm-themes helm-swoop helm-pydoc helm-projectile helm-mt helm-flycheck helm-c-moccur guide-key-tip gruvbox-theme gruber-darker-theme groovy-mode graphviz-dot-mode goto-last-change go-snippets go-projectile go-autocomplete git-timemachine git-commit gh fuzzy frame-tag flycheck-color-mode-line flx-ido firecode-theme find-file-in-project fastnav expand-region exec-path-from-shell evil-numbers evil emmet-mode emacsd-tile ecb-snapshot dropdown-list dired+ csv-mode color-theme-sanityinc-tomorrow color-theme color-file-completion coffee-mode button-lock autopair auto-indent-mode auto-dim-other-buffers angular-snippets android-mode all aggressive-indent adaptive-wrap ac-js2 abl-mode)))
 '(paradox-automatically-star t)
 '(paradox-github-token "82ab00370c54d392703cf9d0d7f32486c3e28e66")
 '(puppet-indent-level tab-width)
 '(python-indent-offset 4)
 '(python-shell-interpreter "python2")
 '(read-mail-command (quote gnus))
 '(recentf-max-saved-items 75)
 '(require-final-newline t)
 '(ruby-indent-level tab-width)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 1)
 '(select-enable-primary nil)
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
 '(sml/active-background-color "#0a0a0a")
 '(sml/active-foreground-color "#aaaaaa")
 '(sml/inactive-background-color "#00000")
 '(sml/inactive-foreground-color "#aaaaaa")
 '(sml/name-width 75)
 '(sml/prefix-regexp (quote (":\\(.*:\\)" "~/" "")))
 '(sml/replacer-regexp-list
   (quote
    (("^~/\\.emacs\\.d/" ":ED:")
     ("^/sudo:.*:" ":SU:")
     ("^~/Work/codemera/" ":CODEMERA:")
     ("^~/Work/lesite\\.ca/" ":LESITE:")
     ("^~/Work/caravanerepublique/" ":CARAVANE:")
     ("^~/Dropbox/" ":DROPBOX:")
     ("^~/Work/" ":WORK:")
     ("^~/Work/ion8/" ":ION8:"))))
 '(sml/show-battery nil)
 '(sml/show-client t)
 '(sml/show-time nil)
 '(sml/use-projectile-p (quote before-prefixes))
 '(sql-sqlite-program "sqlite3")
 '(tab-width 4)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(tramp-default-method "ssh")
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(user-full-name "Ricardo Restituyo")
 '(user-mail-address "ricardo@codemera.com")
 '(virtualenv-workon-starts-python nil)
 '(w3m-home-page "about:blank")
 '(w3m-use-cookies t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-candidate-face ((t (:background "black" :foreground "gainsboro"))))
 '(ac-candidate-mouse-face ((t (:background "dim gray" :foreground "white smoke"))))
 '(company-preview-common ((t (:background "dim gray" :foreground "orange"))))
 '(company-scrollbar-bg ((t (:inherit company-tooltip :background "gray50"))))
 '(company-scrollbar-fg ((t (:background "gray90"))))
 '(company-tooltip ((t (:background "black" :foreground "gray90"))))
 '(company-tooltip-annotation ((t (:inherit company-tooltip :background "black" :foreground "dark orange" :weight normal))))
 '(company-tooltip-annotation-selection ((t nil)))
 '(company-tooltip-selection ((t (:inherit company-tooltip :background "gray20"))))
 '(diff-indicator-added ((t (:inherit diff-added :foreground "green"))))
 '(diff-indicator-removed ((t (:inherit diff-removed :foreground "red"))))
 '(info-menu ((t (:foreground "deep sky blue"))))
 '(minimap-font-face ((t (:height 30 :family "Inconsolata"))) t)
 '(mode-line-highlight ((t (:foreground "#b294bb" :box nil :weight bold))))
 '(sml-modeline-vis-face ((t (:inherit region :background "black"))) t)
 '(sml/filename ((t (:inherit (font-lock-function-name-face sml/global) :foreground "gold2" :weight bold))))
 '(sml/global ((t (:inherit sml/active_foreground_color))))
 '(which-func ((t (:foreground "deep sky blue")))))

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
 '(Info-additional-directory-list '("~/.emacs.d/info"))
 '(all-the-icons-ivy-buffer-commands '(ivy-switch-buffer-other-window))
 '(android-mode-builder 'maven)
 '(android-mode-key-prefix "\\C-c \\C-a")
 '(android-mode-sdk-dir "~/Apps/android-sdk")
 '(ansi-term-color-vector
   [unspecified "#1e1e1e" "#cf6a4c" "#8f9d6a" "#f9ee98" "#7587a6" "#9b859d"
                "#7587a6" "#a7a7a7"] t)
 '(auto-hscroll-mode 'current-line)
 '(auto-save-default nil)
 '(beacon-color "#eab4484b8035")
 '(browse-url-browser-function 'browse-url-default-browser)
 '(browse-url-generic-program "google-chrome-stable")
 '(bsh-classpath '("/usr/share/libreadline-java/lib/libreadline-java.jar"))
 '(bsh-jar "/usr/share/bsh/lib/bsh.jar")
 '(bsh-vm "/etc/java-config-2/current-system-vm/bin/java")
 '(byte-compile-warnings '(suspicious lexical))
 '(c-default-style "k&r")
 '(case-fold-search t)
 '(column-number-mode t)
 '(company-frontends
   '(company-pseudo-tooltip-unless-just-one-frontend
     company-echo-metadata-frontend company-preview-if-just-one-frontend))
 '(company-gtags-modes '(prog-mode jde-mode python-mode))
 '(company-show-numbers t)
 '(company-show-quick-access t)
 '(company-transformers '(company-sort-by-backend-importance))
 '(compilation-message-face 'default)
 '(compilation-scroll-output 'first-error)
 '(compile-command "ant -s build.xml -emacs")
 '(connection-local-criteria-alist
   '(((:application tramp :protocol "kubernetes")
      tramp-kubernetes-connection-local-default-profile)
     ((:application tramp :machine "tartarus")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :protocol "flatpak")
      tramp-container-connection-local-default-flatpak-profile
      tramp-flatpak-connection-local-default-profile)
     ((:application tramp :machine "localhost")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp :machine "tartarus.local")
      tramp-connection-local-darwin-ps-profile)
     ((:application tramp) tramp-connection-local-default-system-profile
      tramp-connection-local-default-shell-profile)
     ((:application eshell) eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((tramp-flatpak-connection-local-default-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin"
                         "/usr/local/sbin" "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin"
                         "/usr/contrib/bin" "/opt/bin" "/opt/sbin"
                         "/opt/local/bin"))
     (tramp-kubernetes-connection-local-default-profile
      (tramp-config-check . tramp-kubernetes--current-context-data)
      (tramp-extra-expand-args 97
                               (tramp-kubernetes--container
                                (car tramp-current-connection))
                               104
                               (tramp-kubernetes--pod
                                (car tramp-current-connection))
                               120
                               (tramp-kubernetes--context-namespace
                                (car tramp-current-connection))))
     (tramp-container-connection-local-default-flatpak-profile
      (tramp-remote-path "/app/bin" tramp-default-remote-path "/bin"
                         "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin"
                         "/usr/local/sbin" "/local/bin" "/local/freeware/bin"
                         "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin"
                         "/usr/contrib/bin" "/opt/bin" "/opt/sbin"
                         "/opt/local/bin"))
     (tramp-connection-local-darwin-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,uid,user,gid,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "state=abcde" "-o"
                                        "ppid,pgid,sess,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etime,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number) (euid . number)
                                          (user . string) (egid . number)
                                          (comm . 52) (state . 5)
                                          (ppid . number) (pgrp . number)
                                          (sess . number) (ttname . string)
                                          (tpgid . number) (minflt . number)
                                          (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number) (nice . number)
                                          (vsize . number) (rss . number)
                                          (etime . tramp-ps-time)
                                          (pcpu . number) (pmem . number)
                                          (args)))
     (tramp-connection-local-busybox-ps-profile
      (tramp-process-attributes-ps-args "-o"
                                        "pid,user,group,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o" "stat=abcde" "-o"
                                        "ppid,pgid,tty,time,nice,etime,args")
      (tramp-process-attributes-ps-format (pid . number) (user . string)
                                          (group . string) (comm . 52)
                                          (state . 5) (ppid . number)
                                          (pgrp . number) (ttname . string)
                                          (time . tramp-ps-time)
                                          (nice . number)
                                          (etime . tramp-ps-time) (args)))
     (tramp-connection-local-bsd-ps-profile
      (tramp-process-attributes-ps-args "-acxww" "-o"
                                        "pid,euid,user,egid,egroup,comm=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                        "-o"
                                        "state,ppid,pgid,sid,tty,tpgid,minflt,majflt,time,pri,nice,vsz,rss,etimes,pcpu,pmem,args")
      (tramp-process-attributes-ps-format (pid . number) (euid . number)
                                          (user . string) (egid . number)
                                          (group . string) (comm . 52)
                                          (state . string) (ppid . number)
                                          (pgrp . number) (sess . number)
                                          (ttname . string) (tpgid . number)
                                          (minflt . number) (majflt . number)
                                          (time . tramp-ps-time)
                                          (pri . number) (nice . number)
                                          (vsize . number) (rss . number)
                                          (etime . number) (pcpu . number)
                                          (pmem . number) (args)))
     (tramp-connection-local-default-shell-profile
      (shell-file-name . "/bin/sh") (shell-command-switch . "-c"))
     (tramp-connection-local-default-system-profile (path-separator . ":")
                                                    (null-device . "/dev/null"))
     (eshell-connection-default-profile (eshell-path-env-list))))
 '(current-language-environment "Latin-1")
 '(cursor-type 'bar)
 '(custom-safe-themes
   '("d2ab3d4f005a9ad4fb789a8f65606c72f30ce9d281a9e42da55f7f4b9ef5bfc6"
     "daa27dcbe26a280a9425ee90dc7458d85bd540482b93e9fa94d4f43327128077"
     "e4a702e262c3e3501dfe25091621fe12cd63c7845221687e36a79e17cf3a67e0"
     "a6920ee8b55c441ada9a19a44e9048be3bfb1338d06fc41bce3819ac22e4b5a1"
     "74e2ed63173b47d6dc9a82a9a8a6a9048d89760df18bc7033c5f91ff4d083e37"
     "c95813797eb70f520f9245b349ff087600e2bd211a681c7a5602d039c91a6428"
     "e266d44fa3b75406394b979a3addc9b7f202348099cfde69e74ee6432f781336"
     "d516f1e3e5504c26b1123caa311476dc66d26d379539d12f9f4ed51f10629df3"
     "249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b"
     "3c7a784b90f7abebb213869a21e84da462c26a1fda7e5bd0ffebf6ba12dbd041"
     "31605bf42c0b72b5841bc940975078ffb87ddbbbaf3649445ba3ce7aa34baac3"
     "a4395e069de3314001de4e139d6a3b1a83dcf9c3fdc68ee7b13eef6c2cba4ae3"
     "d9a28a009cda74d1d53b1fbd050f31af7a1a105aa2d53738e9aa2515908cac4c"
     "0c6a36393d5782839b88e4bf932f20155cb4321242ce75dc587b4f564cb63d90"
     "8f54cfa3f010d83d782fbcdc3a34cdc9dfe23c8515d87ba22d410c033160ad7e"
     "620b9018d9504f79344c8ef3983ea4e83d209b46920f425240889d582be35881"
     "2a5bcdd4c85d7381239dde5e31ec1aa5d8f1e419175a866c9f0c237e02fbc12a"
     "a70b47c87e9b0940f6fece46656200acbfbc55e129f03178de8f50934ac89f58"
     "a7928e99b48819aac3203355cbffac9b825df50d2b3347ceeec1e7f6b592c647"
     "53993d7dc1db7619da530eb121aaae11c57eaf2a2d6476df4652e6f0bd1df740"
     "0eb3c0868ff890b0c4ee138069ce2a8936a8a69ba150efa6bfb9fb7c05af5ec3"
     "1728dfd9560bff76a7dc6c3f61e9f4d3e6ef9d017a83a841c117bd9bebe18613"
     "a9d67f7c030b3fa6e58e4580438759942185951e9438dd45f2c668c8d7ab2caf"
     "7d4340a89c1f576d1b5dec57635ab93cdc006524bda486b66d01a6f70cffb08e"
     "886fe9a7e4f5194f1c9b1438955a9776ff849f9e2f2bbb4fa7ed8879cdca0631"
     default))
 '(deadgrep-executable "/opt/homebrew/bin/rg")
 '(default-input-method "latin-1-prefix")
 '(display-line-numbers nil)
 '(display-time-mode nil)
 '(dumb-jump-selector 'ivy)
 '(ecb-auto-activate nil)
 '(ecb-directories-menu-user-extension-function 'ignore)
 '(ecb-gzip-setup '("/bin/gzip" . other))
 '(ecb-history-menu-user-extension-function 'ignore)
 '(ecb-layout-name "left1")
 '(ecb-layout-window-sizes nil)
 '(ecb-methods-menu-user-extension-function 'ignore)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons 'mouse-1--mouse-2)
 '(ecb-sources-menu-user-extension-function 'ignore)
 '(ecb-tar-setup '("/bin/tar" . other))
 '(ecb-tip-of-the-day nil)
 '(ecb-wget-setup '("/usr/bin/wget" . other))
 '(echo-keystrokes 0.01)
 '(eldoc-idle-delay 1)
 '(electric-pair-inhibit-predicate 'ignore)
 '(electric-pair-mode t)
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-pyvenv
                         elpy-module-highlight-indentation
                         elpy-module-yasnippet elpy-module-django
                         elpy-module-sane-defaults))
 '(elpy-syntax-check-command "pylint")
 '(elpy-test-runner 'elpy-test-pytest-runner)
 '(erc-away-timestamp-format "<%h:%M>")
 '(evil-collection-company-use-tng nil)
 '(evil-emacs-state-cursor '("#E57373" hbar) t)
 '(evil-insert-state-cursor '("#E57373" bar) t)
 '(evil-normal-state-cursor '("#FFEE58" box) t)
 '(evil-visual-state-cursor '("#C5E1A5" box) t)
 '(exec-path
   '("/usr/local/sbin" "/usr/local/bin" "/usr/bin" "/opt/java/bin"
     "/opt/java/db/bin" "/opt/java/jre/bin" "/usr/bin/vendor_perl"
     "/usr/bin/core_perl" "/usr/lib/emacs/24.3/x86_64-unknown-linux-gnu"
     "/usr/share/git/remote-helpers"))
 '(eyebrowse-switch-back-and-forth t)
 '(eyebrowse-wrap-around t)
 '(fill-column 78)
 '(flycheck-checker-error-threshold 500)
 '(flycheck-checkers
   '(ada-gnat asciidoctor asciidoc bazel-buildifier c/c++-clang c/c++-gcc
              c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint
              coq css-csslint css-stylelint cuda-nvcc cwl d-dmd
              dockerfile-hadolint emacs-lisp emacs-lisp-checkdoc erlang-rebar3
              erlang eruby-erubis eruby-ruumba fortran-gfortran go-gofmt
              go-golint go-vet go-build go-test go-errcheck go-unconvert
              go-staticcheck groovy haml handlebars haskell-stack-ghc
              haskell-ghc haskell-hlint html-tidy javascript-eslint
              javascript-jshint javascript-standard json-jsonlint
              json-python-json json-jq jsonnet less less-stylelint llvm-llc
              lua-luacheck lua markdown-markdownlint-cli markdown-mdl nix
              nix-linter opam perl perl-perlcritic php php-phpmd php-phpcs
              processing proselint protobuf-protoc protobuf-prototool pug
              puppet-parser puppet-lint python-pylint python-flake8
              python-pycompile python-mypy r-lintr racket rpm-rpmlint
              rst-sphinx rst ruby-rubocop ruby-reek ruby-rubylint ruby
              ruby-jruby rust-cargo rust rust-clippy scala scala-scalastyle
              scheme-chicken scss-lint scss-stylelint sass/scss-sass-lint sass
              scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck
              slim slim-lint sql-sqlint systemd-analyze tcl-nagelfar terraform
              terraform-tflint tex-chktex tex-lacheck texinfo textlint
              typescript-tslint verilog-verilator vhdl-ghdl xml-xmlstarlet
              xml-xmllint yaml-jsyaml yaml-ruby))
 '(flycheck-executable-find 'flycheck-virtualenv-executable-find)
 '(flycheck-flake8-maximum-line-length 125)
 '(flycheck-flake8rc "~/.flake8rc")
 '(frame-background-mode 'light)
 '(frame-title-format '("%f - " user-real-login-name "@" system-name) t)
 '(ggtags-global-ignore-case t)
 '(global-font-lock-mode t nil (font-lock))
 '(global-nlinum-mode nil)
 '(global-pabbrev-mode t)
 '(global-semantic-highlight-edits-mode nil)
 '(global-semantic-stickyfunc-mode nil)
 '(global-yascroll-bar-mode t)
 '(gnus-asynchronous t)
 '(gnus-demon-timestep 300)
 '(gnus-gcc-mark-as-read t)
 '(gnus-registry-install t)
 '(gui-select-enable-clipboard t)
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-prefix-key "\20")
 '(helm-gtags-suggested-key-mapping t)
 '(helm-minibuffer-history-key "M-p")
 '(helm-projectile-sources-list
   '(helm-source-semantic helm-source-projectile-buffers-list
                          helm-source-projectile-files-list
                          helm-source-projectile-projects
                          helm-source-gtags-select))
 '(helm-scroll-amount 4)
 '(highlight-changes-colors '("#ff8eff" "#ab7eff"))
 '(highlight-indent-guides-auto-enabled t nil nil "Customized with use-package highlight-indent-guides")
 '(highlight-indent-guides-method 'character nil nil "Customized with use-package highlight-indent-guides")
 '(highlight-indent-guides-responsive t)
 '(highlight-symbol-colors
   '("#FFEE58" "#C5E1A5" "#80DEEA" "#64B5F6" "#E1BEE7" "#FFCC80"))
 '(highlight-symbol-foreground-color "#E0E0E0")
 '(icicle-fuzzy-completion-flag nil)
 '(ido-auto-merge-work-directories-length nil)
 '(ido-create-new-buffer 'always)
 '(ido-enable-flex-matching t)
 '(ido-enable-prefix nil)
 '(ido-ignore-extensions t)
 '(ido-max-prospects 8)
 '(ido-mode 'both nil (ido))
 '(ido-use-filename-at-point 'guess)
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries '((t . right) (top . left)))
 '(indicate-empty-lines t)
 '(inhibit-startup-echo-area-message "warchiefx")
 '(inhibit-startup-screen t)
 '(linum-format "  %d  ")
 '(lsp-enable-symbol-highlighting nil)
 '(lsp-flycheck-live-reporting t)
 '(lsp-headerline-breadcrumb-enable nil)
 '(lsp-ui-doc-delay 0.5)
 '(lsp-ui-doc-use-webkit nil)
 '(lsp-ui-flycheck-enable t)
 '(lsp-ui-flycheck-live-reporting t)
 '(lsp-ui-imenu-enable t)
 '(lsp-ui-peek-enable nil)
 '(lsp-ui-sideline-show-hover nil)
 '(lsp-ui-sideline-show-symbol nil)
 '(mac-mouse-wheel-smooth-scroll nil)
 '(madhat2r-theme-custom-colors
   '((act1 . "#000000") (act2 . "#000000") (border . "#000000")
     (act1-term . "#000000") (act2-term . "#000000") (border-term . "#000000")))
 '(magit-diff-use-overlays nil)
 '(magit-push-always-verify nil)
 '(mail-user-agent 'gnus-user-agent)
 '(major-mode-hydra-invisible-quit-key "q")
 '(make-backup-files nil)
 '(markdown-command "pandoc")
 '(mouse-drag-copy-region nil)
 '(nethack-use-tiles t)
 '(nlinum-highlight-current-line t)
 '(ns-alternate-modifier 'meta)
 '(ns-command-modifier 'control)
 '(ns-control-modifier 'super)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files
   '("~/gdrive/orgfiles/main.org" "/home/rrestituyo/gdrive/orgfiles/personal.org"
     "/home/rrestituyo/gdrive/orgfiles/research/collins-muggins.org"
     "/home/rrestituyo/gdrive/orgfiles/research/residentialremedies.org"
     "/home/rrestituyo/gdrive/orgfiles/research/richpoorer.org"
     "/home/rrestituyo/gdrive/orgfiles/research/ion8-crm.org"
     "/home/rrestituyo/gdrive/orgfiles/research/sternlaw.org"
     "/home/rrestituyo/gdrive/orgfiles/research/eblingroup-highrise-migration.org"
     "/home/rrestituyo/gdrive/orgfiles/research/quiz-webapp.org"
     "/home/rrestituyo/gdrive/orgfiles/research/partsdept-creator-app.org"
     "/home/rrestituyo/gdrive/orgfiles/research/clio-matter-groups.org"
     "/home/rrestituyo/gdrive/orgfiles/research/avantgarde.org"
     "/home/rrestituyo/gdrive/orgfiles/research/nbps.org"
     "/home/rrestituyo/gdrive/orgfiles/research/goodcounsel.org"
     "/home/rrestituyo/gdrive/orgfiles/research/oxyhealth.org"
     "/home/rrestituyo/gdrive/orgfiles/research/hsar.org"
     "/home/rrestituyo/gdrive/orgfiles/research/asonahores.org"
     "/home/rrestituyo/gdrive/orgfiles/research/sunrisenv.org"
     "/home/rrestituyo/gdrive/orgfiles/research/bufete-garrido-corporan.org"
     "/home/rrestituyo/gdrive/orgfiles/research/ion8-toggl-setup.org"
     "/home/rrestituyo/gdrive/orgfiles/research/teco-shopify.org"
     "/home/rrestituyo/gdrive/orgfiles/research/highgate.org"
     "/home/rrestituyo/gdrive/orgfiles/research/cto_roles.org"
     "/home/rrestituyo/gdrive/orgfiles/research/aisleinsight.org"
     "/home/rrestituyo/gdrive/orgfiles/research/webtolead.org"
     "/home/rrestituyo/gdrive/orgfiles/research/avantgarde-middleware.org"
     "/home/rrestituyo/gdrive/orgfiles/research/clio-ringcentral.org"
     "/home/rrestituyo/gdrive/orgfiles/research/71env.org"
     "/home/rrestituyo/gdrive/orgfiles/research/ion8-summit.org"
     "/home/rrestituyo/gdrive/orgfiles/research/clio-zoho-integration.org"
     "/home/rrestituyo/gdrive/orgfiles/research/clio-pclaw.org"
     "/home/rrestituyo/gdrive/orgfiles/research/pandadocbooks.org"
     "/home/rrestituyo/gdrive/orgfiles/research/pacmachinery.org"
     "/home/rrestituyo/gdrive/orgfiles/research/bluecoding-odoo-dev.org"
     "/home/rrestituyo/gdrive/orgfiles/research/dannlaw.org"
     "/home/rrestituyo/gdrive/orgfiles/research/abbyy-clio.org"
     "/home/rrestituyo/gdrive/orgfiles/research/matysek.org"
     "/home/rrestituyo/gdrive/orgfiles/research/conceptflooring.org"
     "/home/rrestituyo/gdrive/orgfiles/research/oxyhealth-creator-app.org"
     "/home/rrestituyo/gdrive/orgfiles/research/goodbed-migration.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vc-interviews.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vc-hiring.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vc-meetings.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vivialconnect-oauth.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vivialconnect.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vc-overview-notes.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vc-hiring-Moises.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vivial.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vivialconnect-billing.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vivialconnect-international.org"
     "/home/rrestituyo/gdrive/orgfiles/work/vivial/vc-routing.org"
     "/home/rrestituyo/gdrive/orgfiles/notes/new-hire-briefing-packet.org"
     "/home/rrestituyo/gdrive/orgfiles/notes/bontix.org"
     "/home/rrestituyo/gdrive/orgfiles/notes/answeringlegal-pipefy.org"
     "/home/rrestituyo/gdrive/orgfiles/templates/vivial-hiring.org"))
 '(org-clock-into-drawer t)
 '(org-enforce-todo-dependencies t)
 '(org-export-with-smart-quotes nil)
 '(org-export-with-toc nil)
 '(org-hide-leading-stars t)
 '(org-insert-mode-line-in-empty-file t)
 '(org-jira-serv-alist
   '((Localvox url https://localvox.atlassian.net username rrestituyo@vivial.net
               host https://localvox.atlassian.net)))
 '(org-md-headline-style 'atx)
 '(org-src-fontify-natively t)
 '(package-check-signature nil)
 '(package-selected-packages
   '(add-node-modules-path all-the-icons auto-compile auto-virtualenv
                           autodisass-java-bytecode better-defaults blacken
                           comment-tags company-flx company-quickhelp
                           company-restclient company-statistics consult-dir
                           counsel-gtags counsel-projectile coverlay
                           crontab-mode csv-mode dashboard deadgrep diff-hl
                           diminish docker dockerfile-mode doom-themes
                           dumb-jump electric-operator embrace emmet-mode
                           esh-autosuggest evil-anzu evil-args evil-collection
                           evil-commentary evil-escape evil-exchange
                           evil-goggles evil-indent-plus evil-leader
                           evil-matchit evil-multiedit evil-numbers evil-org
                           evil-space evil-surround evil-tutor
                           evil-vimish-fold exato exec-path-from-shell
                           flycheck-posframe frame-tag gcmh ggtags gist
                           git-link git-timemachine groovy-imports groovy-mode
                           helm-projectile ibuffer-vc ido-completing-read+
                           ido-vertical-mode imenu-anywhere ivy-hydra iwindow
                           jade-mode jest-test-mode jq-mode k8s-mode
                           kanagawa-themes kaolin-themes keychain-environment
                           kubernetes-evil lsp-ivy lsp-java lsp-pyright lsp-ui
                           lua-mode magit-delta magit-gitflow magit-org-todos
                           major-mode-hydra makefile-executor meghanada
                           multiple-cursors nord-theme nswbuff org-contrib
                           org-edna org-super-agenda ox-gfm ox-qmd paradox
                           pip-requirements pipenv popper prettier-js py-isort
                           python-docstring python-mode python-pytest
                           quelpa-use-package rainbow-delimiters rainbow-mode
                           react-snippets realgud rjsx-mode sass-mode
                           scss-mode shackle shell-pop skewer-mode smart-dash
                           smart-shift smartparens smex spaceline
                           switch-window symbol-overlay tide treemacs-evil
                           treemacs-icons-dired treemacs-magit
                           treemacs-projectile typescript-mode undo-fu
                           use-package-hydra verb web-mode which-key-posframe
                           whitespace-cleanup-mode yascroll yasnippet-snippets
                           zeal-at-point))
 '(paradox-automatically-star t)
 '(paradox-github-token "e63cdb71589f2da70b3fa5aec892bb7f5fd4e4b1")
 '(puppet-indent-level tab-width)
 '(python-indent-offset 4)
 '(python-shell-interpreter "python2")
 '(read-mail-command 'gnus)
 '(realgud:ipdb-command-name "~/.scripts/ipdb")
 '(realgud:pdb-command-name "~/scripts/pdb")
 '(recentf-max-saved-items 75)
 '(require-final-newline t)
 '(restclient-inhibit-cookies t)
 '(ruby-indent-level tab-width)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 1)
 '(select-enable-primary nil)
 '(semantic-inhibit-functions nil)
 '(semantic-python-dependency-system-include-path '("/usr/lib/python2.7/"))
 '(shell-pop-shell-type '("eshell" "*eshell*" (lambda nil (eshell))))
 '(shell-pop-universal-key nil)
 '(show-paren-mode t)
 '(slime-autodoc-use-multiline-p t)
 '(slime-complete-symbol*-fancy t)
 '(slime-complete-symbol-function 'slime-fuzzy-complete-symbol)
 '(slime-highlight-suppressed-forms t)
 '(sml-modeline-borders nil)
 '(sml-modeline-len 20)
 '(sml-modeline-mode t)
 '(sml-modeline-numbers 'line-numbers)
 '(sml/active-background-color "#0a0a0a")
 '(sml/active-foreground-color "#aaaaaa")
 '(sml/inactive-background-color "#00000")
 '(sml/inactive-foreground-color "#aaaaaa")
 '(sml/name-width 75)
 '(sml/prefix-regexp '(":\\(.*:\\)" "~/" ""))
 '(sml/replacer-regexp-list
   '(("^~/\\.emacs\\.d/" ":ED:") ("^/sudo:.*:" ":SU:")
     ("^~/Work/codemera/" ":CODEMERA:") ("^~/Work/lesite\\.ca/" ":LESITE:")
     ("^~/Work/caravanerepublique/" ":CARAVANE:") ("^~/Dropbox/" ":DROPBOX:")
     ("^~/gdrive/" ":DRIVE:") ("^~/Work/" ":WORK:") ("^~/Work/ion8/" ":ION8:")))
 '(sml/show-battery nil)
 '(sml/show-client t)
 '(sml/show-time nil)
 '(sml/use-projectile-p 'before-prefixes)
 '(sml/vc-mode-show-backend t)
 '(spaceline-all-the-icons-clock-always-visible nil)
 '(spaceline-all-the-icons-hide-long-buffer-path t)
 '(spaceline-all-the-icons-icon-set-flycheck-slim 'solid)
 '(spaceline-all-the-icons-icon-set-git-ahead 'commit)
 '(spaceline-all-the-icons-icon-set-git-stats 'arrows)
 '(spaceline-all-the-icons-icon-set-modified 'toggle)
 '(spaceline-all-the-icons-icon-set-window-numbering 'solid)
 '(spaceline-all-the-icons-separator-type 'none)
 '(spaceline-all-the-icons-slim-render t)
 '(sql-sqlite-program "sqlite3")
 '(tab-width 4)
 '(tabbar-background-color "#353335333533")
 '(text-mode-hook '(turn-on-auto-fill text-mode-hook-identify))
 '(torus-display-tab-bar nil)
 '(torus-load-on-startup nil)
 '(tramp-default-method "ssh")
 '(tramp-encoding-shell "/bin/bash")
 '(uniquify-buffer-name-style 'forward nil (uniquify))
 '(user-full-name "Ricardo Restituyo")
 '(user-mail-address "ricardo@vivial.net")
 '(virtualenv-workon-starts-python nil)
 '(w3m-home-page "about:blank")
 '(w3m-use-cookies t)
 '(warning-suppress-types '((emacs)))
 '(zoom-ignored-buffer-name-regexps nil)
 '(zoom-ignored-major-modes '(flycheck-error-list-mode))
 '(zoom-size 'size-callback))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-change-face ((t (:inherit diff-removed))))
 '(evil-goggles-delete-face ((t (:inherit diff-removed))))
 '(evil-goggles-paste-face ((t (:inherit diff-added))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit 'diff-refine-added))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit 'diff-changed))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit 'diff-refine-removed))))
 '(evil-goggles-yank-face ((t (:inherit diff-changed))))
 '(lsp-ui-doc-header ((t (:inherit (font-lock-string-face italic)))) t)
 '(spacebar-active ((t (:inherit font-lock-keyword-face :weight bold))))
 '(yascroll:thumb-fringe ((t (:background "dim gray" :foreground "dim gray"))))
 '(yascroll:thumb-text-area ((t (:background "dim gray")))))

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
 '(browse-url-browser-function (quote browse-url-default-browser))
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
 '(company-frontends
   (quote
    (company-pseudo-tooltip-unless-just-one-frontend company-echo-metadata-frontend company-preview-if-just-one-frontend)))
 '(company-gtags-modes (quote (prog-mode jde-mode python-mode)))
 '(company-show-numbers t)
 '(company-transformers (quote (company-sort-by-backend-importance)))
 '(compilation-scroll-output (quote first-error))
 '(compile-command "ant -s build.xml -emacs")
 '(current-language-environment "Latin-1")
 '(cursor-type (quote bar))
 '(custom-safe-themes
   (quote
    ("891debfe489c769383717cc7d0020244a8d62ce6f076b2c42dd1465b7c94204d" "086970da368bb95e42fd4ddac3149e84ce5f165e90dfc6ce6baceae30cf581ef" "9fcac3986e3550baac55dc6175195a4c7537e8aa082043dcbe3f93f548a3a1e0" "65d4e1535e8fa5d40b9a95d30ed0e95b3bac2b905e905f4397e0425a51addc55" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "08e47c1b4faf013eadb945fd15748fe4bc98435c75c0e3014541ecdb5adf7196" "b23dbe539cffb25891752772d81fc76133aa73a769a409bfee8547cefc218cf4" "3d20cf0dbc6465a02c468abf2d9b8c17e88b20fbc05a04205a829285da28799d" "9a58c408a001318ce9b4eab64c620c8e8ebd55d4c52327e354f24d298fb6978f" "e6370c4899d463555a6aecf2da2700e2e039f93273212ce1836e9f94ad4af278" "8303919c775cbf64f8722e6c4711543dbe7b0bc77b45c96c7ddee10cd144b201" "a866134130e4393c0cad0b4f1a5b0dd580584d9cf921617eee3fd54b6f09ac37" "748d0e2ffdaf95015a539dcc95ab888283284ad7b076963760422cbe5e21903a" "0be964eabe93f09be5a943679ced8d98e08fe7a92b01bf24478e56eee7b6b21d" "77bddca0879cb3b0ecdf071d9635c818827c57d69164291cb27268ae324efa84" "4a7abcca7cfa2ccdf4d7804f1162dd0353ce766b1277e8ee2ac7ee27bfbb408f" "10e3d04d524c42b71496e6c2e770c8e18b153fcfcc838947094dad8e5aa02cef" "9d7dec75aaaf0fae4baa52f1c5f0dbedfe49741a964dcb172c80e69bee4fff5a" "2f9216992371bcc9bc26bca11698d9c778ef4609ad94f86e4810607bf0fde82e" "355e1c0eb7cd20794e983b4c6f5c0c978a85b159d6aadb2fae15faa25fb344e5" "80050f721c3abddb96e775a5dd2517dd8f93f71349e8f300f7240ab18827e616" "ec1f36cafbd9a2997a0c3a7f1f0d1c3cd3ca2695f4b545b21a2199986a74e628" "649ca960922e2176a451db44624bc4dbcd282bc1660d2621793145232f688836" "315eb1a60d4aa4262023e945d78b10f30314d6c66e2c0c2b8bc289481b51073b" "27c8980581e09d3473b23650da38e9e2118b3334544283b8f2fc2ace2f9bd076" "1d6160242b8ceea56167adc4b0575ab754eb45188b7dffead4ac7cd8d6328584" "d507c9e58cb0eb8508e15c8fedc2d4e0b119123fab0546c5fd30cadd3705ac86" "9f569b5e066dd6ca90b3578ff46659bc09a8764e81adf6265626d7dc0fac2a64" "2016cdf6b11ed21f40a2246ca86d8c97ee77208bf1739467f8b00d1c0d1adc70" "fe8ec36f96b6e49f6f5910c18327df423d7e805ed71a506d1168f7ca49495b2b" "4182c491b5cc235ba5f27d3c1804fc9f11f51bf56fb6d961f94788be034179ad" "37bdda288337f95acabe21ae0e60ac5b6850dd2d57bc9ecf4c11d6c83999b4fa" "6570843991e40121f854432826e9fd175aec6bd382ef217b2c0c46da37f3af18" "6f11ad991da959fa8de046f7f8271b22d3a97ee7b6eca62c81d5a917790a45d9" "611e38c2deae6dcda8c5ac9dd903a356c5de5b62477469133c89b2785eb7a14d" "b378249b7f647796b186c70f61eaaee7aa1bd123681d5ca8c44d3ca8875e1b70" "b81bfd85aed18e4341dbf4d461ed42d75ec78820a60ce86730fc17fc949389b2" "3b31ebd74082c6a3043dfd8112069163978330e21cfc9e6ff2c9798dfd6d6505" "12e2aee98f651031d10fd58af76250fa8cab6f28b3e88f03b88b7524c9278549" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" "f67652440b66223b66a4d3e9c0ddeddbf4a6560182fa38693bdc4d940ce43a2e" "5310b88333fc64c0cb34a27f42fa55ce371438a55f02ac7a4b93519d148bd03d" "a9a3997a39f1a0771b99329bb628a49d3584c7d270506d9d005becc4f5349b84" "174f0d373e7d8ef3c16e8abd9e7d47e6e9d78f82a12ea6fd0a6c491432397f0f" "60d7012347f50194c99b61ece509bec3029cb60fce4c683d50e84ebd6e4e930c" "8c17f8aabb1adcbc3399823467479936e72f12a9c592cc61267ac0ac8eea9a9e" "b571f92c9bfaf4a28cb64ae4b4cdbda95241cd62cf07d942be44dc8f46c491f4" "227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" "63b822ccd7a1928a7cbc88037dddf7b74b2f8a507e1bccd7281f20646f72cd0a" "e91ca866d6cbb79786e314e0466f4f1b8892b72e77ed702e53bf7565e0dfd469" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "6bde11b304427c7821b72a06a60e8d079b8f7ae10b407d8af37ed5e5d59b1324" "243bd9824b2a2203c4cf22e306e4fba73f9e6d6f0b032176876980da471bdca5" "0e0c37ee89f0213ce31205e9ae8bce1f93c9bcd81b1bcda0233061bb02c357a8" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "1e67765ecb4e53df20a96fb708a8601f6d7c8f02edb09d16c838e465ebe7f51b" "09462faba803c7d1ef2691d16053f8d3130d2972fb1ec72d1e33ac37702ee109" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" "505f50addd1b07066c8ea2c1a33f09f7e26b906eea2164210b668e61fdce30b4" "07abcde0f93da98524789bfce10018157e03d540563cb1aa3e5adc29887778f8" "763ec64e70865901709b9927b0bef397a7b6a90fcff9c13c82a51f1678f118e7" "b7e38c2b835e8b46cb51beb222ec85310a2b63135d4abbca44ecf533706fa6aa" "405b0ac2ac4667c5dab77b36e3dd87a603ea4717914e30fcf334983f79cfd87e" "e97dbbb2b1c42b8588e16523824bc0cb3a21b91eefd6502879cf5baa1fa32e10" "4ab86c7682db09485a6e046ee0a6c45b5462f514c89844f4ed8b329aa1708067" "d9b0d5c7077ddad798e9749d0629e86b925c2e146641b24130edd8f82cd0cf5d" "a2e7b508533d46b701ad3b055e7c708323fb110b6676a8be458a758dd8f24e27" "40bc0ac47a9bd5b8db7304f8ef628d71e2798135935eb450483db0dbbfff8b11" "603a9c7f3ca3253cb68584cb26c408afcf4e674d7db86badcfe649dd3c538656" "d4e9f95acd51433b776f1127143bbc7d0f1d41112d547e5b7a9a506be369dc39" "49de25b465bc3c2498bcd4c1575fa0090bd56fc79cdb49b919b49eaea17ee1dd" "f688f52498f2d02dda635d873c0b1ce661201173c6b0e4c3e452d45d846fe2d8" "919469423e232db3cc35f6a94134051dd8a5a95d5cbb2a9b3c519e371a069615" "870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "224742c7512296b01bcdc353a49b3de3709f6f3d4e63042be1c2c347569c8c99" "84880085294d6190d47e6392ed50ff242326d064f783e502201eae4fd76564f6" "790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "0aca3a26459bbb43a77f34bc22851c05c0a5d70d3230cbcdbda4fec20fef77e6" "1fab355c4c92964546ab511838e3f9f5437f4e68d9d1d073ab8e36e51b26ca6a" "3ed645b3c08080a43a2a15e5768b893c27f6a02ca3282576e3bc09f3d9fa3aaa" "fbb449ba8147e2914a9bebc2d6a210b8927313a6c1b70764a7f7c61a9bc04b90" "b8b5c353e73470377f2111fddb0ea652d35ce98e0a27a5c592d2ab9f66855106" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "9eb5269753c507a2b48d74228b32dcfbb3d1dbfd30c66c0efed8218d28b8f0dc" "5a0eee1070a4fc64268f008a4c7abfda32d912118e080e18c3c865ef864d1bea" "12722541c8998f056b761bf63a92216aaf4610e4eb1afe7991842a31fa28b6d8" "ba9be9caf9aa91eb34cf11ad9e8c61e54db68d2d474f99a52ba7e87097fa27f5" "90d329edc17c6f4e43dbc67709067ccd6c0a3caa355f305de2041755986548f2" "bac3f5378bc938e96315059cd0488d6ef7a365bae73dac2ff6698960df90552d" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "2a12e95e9ee6ed57592e7df12f3f028205575e9b3affdb5e6fa589421c618136" "806d8c827b214f5f60348114bd27c6dcb5d19047f7ac482ad61e8077a6c5ea60" "1934bf7e1713bf706a9cb36cc6a002741773aa42910ca429df194d007ee05c67" "784d5ee4d33befba6a21702ead67f98346770be7cc17ab64952ae3866a403743" "b21bf64c01dc3a34bc56fff9310d2382aa47ba6bc3e0f4a7f5af857cd03a7ef7" "696927ed40057050d219989dd473cc08fab27995e4febd6cf14429a448364bc6" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "025354235e98db5e7fd9c1a74622ff53ad31b7bde537d290ff68d85665213d85" "5ae4d52977a13212da7ec2f6932b6449f7d7c07b3cb01085f018c0d4a7f38cec" "bc89fda3d232a3daa4eb3a9f87d6ffe1272fea46e4cf86686d9e8078e4209e2c" "2fa2edc14dbb434fa1a08262c088a337fc4bb3efc12c89fdb9a288620b58c6f0" "f3d2144fed1adb27794a45e61166e98820ab0bbf3cc7ea708e4bf4b57447ee27" "5e6c2e2116c7a72ae0668390f92504fd0b77524cedd387582648b1aa1c582f59" "22558263b5a17ccb3544cca562fc070496eac03263a26f338f17761a4b223ad5" "68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "dd4db38519d2ad7eb9e2f30bc03fba61a7af49a185edfd44e020aa5345e3dca7" "636ecbf1091fbc99d95526d7a3a4810d1ccb58997e58bd3184863821303553f3" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "e57e7b19da7b4cd0e5512d5e9bc20d31c9cf50112c462de15a76bce0ea3c5ef5" "d7f1c86b425e148be505c689fc157d96323682c947b29ef00cf57b4e4e46e6c7" "9562e9eb5fd01677ac6b76b66f9a81338991fa9d270270802eeae5232c8da0a6" "0387cbee7d97362282bb951306113eab92bee32150bfcfc8edae17e8e876aec5" "e3e2db3b5acd2028f7f83581f9609e1e7369df20414ab53c9b2161e2eca08675" "1177fe4645eb8db34ee151ce45518e47cc4595c3e72c55dc07df03ab353ad132" "9f42bccce1e13fa5017eb8718574db099e85358b9f424db78e7318f86d1be08f" "1f3269f865292502f3dd577c3412110264ef3b89d8688aa5d649b4f496c780dc" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "fe6330ecf168de137bb5eddbf9faae1ec123787b5489c14fa5fa627de1d9f82b" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
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
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(elpy-syntax-check-command "pylint")
 '(elpy-test-runner (quote elpy-test-pytest-runner))
 '(erc-away-timestamp-format "<%h:%M>")
 '(evil-collection-setup-minibuffer t)
 '(exec-path
   (quote
    ("/usr/local/sbin" "/usr/local/bin" "/usr/bin" "/opt/java/bin" "/opt/java/db/bin" "/opt/java/jre/bin" "/usr/bin/vendor_perl" "/usr/bin/core_perl" "/usr/lib/emacs/24.3/x86_64-unknown-linux-gnu" "/usr/share/git/remote-helpers")))
 '(fill-column 78)
 '(flycheck-executable-find (quote flycheck-virtualenv-executable-find))
 '(flycheck-flake8-maximum-line-length 125)
 '(flycheck-flake8rc "~/.flake8rc")
 '(frame-title-format (quote ("%f - " user-real-login-name "@" system-name)) t)
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
 '(helm-gtags-path-style (quote relative))
 '(helm-gtags-prefix-key "")
 '(helm-gtags-suggested-key-mapping t)
 '(helm-projectile-sources-list
   (quote
    (helm-source-semantic helm-source-projectile-buffers-list helm-source-projectile-files-list helm-source-projectile-projects helm-source-gtags-select)))
 '(helm-scroll-amount 4)
 '(icicle-fuzzy-completion-flag nil)
 '(ido-auto-merge-work-directories-length nil)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-enable-prefix nil)
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
 '(markdown-command "pandoc")
 '(mouse-drag-copy-region nil)
 '(nethack-use-tiles t)
 '(nlinum-highlight-current-line t)
 '(nxml-auto-insert-xml-declaration-flag t)
 '(nxml-bind-meta-tab-to-complete-flag t)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files nil)
 '(org-clock-into-drawer t)
 '(org-enforce-todo-dependencies t)
 '(org-export-with-smart-quotes nil)
 '(org-export-with-toc nil)
 '(org-hide-leading-stars t)
 '(org-insert-mode-line-in-empty-file t)
 '(org-jira-serv-alist
   (quote
    ((Localvox url https://localvox\.atlassian\.net username rrestituyo@vivial\.net host https://localvox\.atlassian\.net))))
 '(org-md-headline-style (quote atx))
 '(org-src-fontify-natively t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(package-selected-packages
   (quote
    (magithub evil-collection one-dark-molokai indium tooltip-help evil-org evil-org-mode kaolin-themes evil-args zoom nord-theme zerodark-theme distinguished-theme ujelly-theme dracula-theme noctilux-theme spacegray-theme flycheck-pos-tip persp-mode flycheck-popup-tip helm-dash himp org-jira company-meghanada meghanada google-c-style autodisass-java-bytecode flycheck-ycmd company-ycmd ycmd vc-git company-flx "use-package" treemacs treemacs-evil evil-vimish-fold evil-tutor evil-space evil-goggles evil-nerd-commenter evil-leader evil-tabs evil-surround evil-escape evil-matchit evil-anzu smart-hungry-delete org-plus-contrib helm-descbinds helm-ag vimish-fold company-dabbrev diff-hl kaolin-theme python-docstring python-docstring-mode org-alert org-notify org-edna smart-mode-line spacemacs-theme gist rfringe ido-uniquitous goto-chg company helm projectile flycheck yasnippet ox-md xterm-color sanityinc-tomorrow-themes sanityinc-themes sanityinc guide-key "use-package" "use-package" "use-package" "use-package" "use-package" company-tern rjsx-mode anzu anzu-mode shell-pop sane-term molokai-theme kotlin-mode dakrone-light-theme csv nlinum persp-mode-projectile-bridge neotree spaceline-all-the-icons better-defaults spaceline atom-one-dark-theme fixmee doom-theme doom-themes symbol-overlay ein realgud wanderlust ido-vertical-mode sexy-monochrome-theme po-mode hamburger-menu jade erlang darkokai-theme paganini-theme embrace danneskjold-theme mustard-theme ac-anaconda ac-emmet badwolf-theme flatland-theme tao-theme ibuffer-vc ibuffer-projectile anaconda-mode company-anaconda auto-virtualenv org-trello codesearch projectile-codesearch helm-codesearch idea-darkula-theme aurora-theme material-theme code-library zeal-at-point company-go company-jedi company-quickhelp company-restclient company-web go-complete quasi-monochrome-theme cbm ox-gfm magit-gitflow magit common-lisp-snippets elpy odersky-theme
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
 '(realgud:ipdb-command-name "~/.scripts/ipdb")
 '(realgud:pdb-command-name "~/scripts/pdb")
 '(recentf-max-saved-items 75)
 '(require-final-newline t)
 '(ruby-indent-level tab-width)
 '(scroll-bar-mode nil)
 '(scroll-conservatively 1)
 '(select-enable-primary nil)
 '(semantic-inhibit-functions nil)
 '(semantic-python-dependency-system-include-path (quote ("/usr/lib/python2.7/")))
 '(shell-pop-shell-type (quote ("eshell" "*eshell*" (lambda nil (eshell)))))
 '(shell-pop-universal-key nil)
 '(show-paren-delay 0)
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
     ("^~/gdrive/" ":DRIVE:")
     ("^~/Work/" ":WORK:")
     ("^~/Work/ion8/" ":ION8:"))))
 '(sml/show-battery nil)
 '(sml/show-client t)
 '(sml/show-time nil)
 '(sml/use-projectile-p (quote before-prefixes))
 '(spaceline-all-the-icons-clock-always-visible nil)
 '(spaceline-all-the-icons-hide-long-buffer-path t)
 '(spaceline-all-the-icons-icon-set-flycheck-slim (quote solid))
 '(spaceline-all-the-icons-icon-set-git-ahead (quote commit))
 '(spaceline-all-the-icons-icon-set-git-stats (quote arrows))
 '(spaceline-all-the-icons-icon-set-modified (quote toggle))
 '(spaceline-all-the-icons-icon-set-window-numbering (quote solid))
 '(spaceline-all-the-icons-separator-type (quote none))
 '(spaceline-all-the-icons-slim-render nil)
 '(sql-sqlite-program "sqlite3")
 '(tab-width 4)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tramp-default-method "ssh")
 '(tramp-encoding-shell "/bin/bash")
 '(user-full-name "Ricardo Restituyo")
 '(user-mail-address "ricardo@codemera.com")
 '(virtualenv-workon-starts-python nil)
 '(w3m-home-page "about:blank")
 '(w3m-use-cookies t)
 '(ycmd-server-command
   (quote
    ("python2" "/home/rrestituyo/Work/youcompleteme/ycmd/ycmd")))
 '(zoom-ignored-buffer-name-regexps nil)
 '(zoom-ignored-major-modes (quote (flycheck-error-list-mode)))
 '(zoom-size (quote size-callback)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(evil-goggles-delete-face ((t (:inherit (quote diff-removed)))))
 '(evil-goggles-paste-face ((t (:inherit (quote diff-added)))))
 '(evil-goggles-undo-redo-add-face ((t (:inherit (quote diff-refine-added)))))
 '(evil-goggles-undo-redo-change-face ((t (:inherit (quote diff-changed)))))
 '(evil-goggles-undo-redo-remove-face ((t (:inherit (quote diff-refine-removed)))))
 '(evil-goggles-yank-face ((t (:inherit (quote diff-changed)))))
 '(spaceline-python-venv ((t (:foreground "light gray"))))
 '(yascroll:thumb-fringe ((t (:background "dim gray" :foreground "dim gray"))))
 '(yascroll:thumb-text-area ((t (:background "dim gray")))))

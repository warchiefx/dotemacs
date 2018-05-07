(use-package company
  :ensure t
  :demand t
  :diminish company-mode
  :config
  (setq-default
   ;; company-minimum-prefix-length 1
   company-tooltip-align-annotations t))

(use-package company-quickhelp
  :ensure t
  :after company
  :config
  (company-quickhelp-mode 1))

(use-package company-flx
  :ensure t
  :after company
  :config
  (setq company-flx-limit 400))

(use-package company-restclient
  :ensure t
  :config (add-to-list 'company-backends 'company-restclient))

(global-company-mode 1)

(use-package company-statistics
  :ensure t
  :config (company-statistics-mode 1))

(use-package company-etags
  :config
  (eval-after-load 'company-etags '(progn (add-to-list 'company-etags-modes 'web-mode)))
  (setq company-etags-everywhere '(php-mode html-mode web-mode nxml-mode)))

(use-package company-statistics
  :ensure t
  :config (company-statistics-mode))

(use-package ycmd
  :ensure t
  :diminish (ycmd-mode eldoc-mode)
  :config
  ; Remember to customize this variable for your environment
  (set-variable 'ycmd-server-command `("python" ,(file-truename "~/.emacs.d/ycmd/ycmd/")))
  (add-hook 'after-init-hook #'global-ycmd-mode)
  (add-hook 'ycmd-mode-hook 'ycmd-eldoc-setup))

(use-package company-ycmd
  :ensure t
  :config (company-ycmd-setup))

;; Only install this if flycheck is installed
(when (package-installed-p 'flycheck)
  (use-package flycheck-ycmd
    :ensure t
    :after flycheck
    :config (flycheck-ycmd-setup)))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode)
  :config
  ;; Follow these instructions first: https://github.com/sebastiencs/company-box/wiki/icons
  (require 'icons-in-terminal)
  (setq company-box-icons-unknown 'fa_question_circle)

  (setq company-box-icons-elisp
        '((fa_tag :face font-lock-function-name-face) ;; Function
          (fa_cog :face font-lock-variable-name-face) ;; Variable
          (fa_cube :face font-lock-constant-face) ;; Feature
          (md_color_lens :face font-lock-doc-face))) ;; Face

  (setq company-box-icons-yasnippet 'fa_bookmark)

  (setq company-box-icons-lsp
        '((1 . fa_text_height) ;; Text
          (2 . (fa_tags :face font-lock-function-name-face)) ;; Method
          (3 . (fa_tag :face font-lock-function-name-face)) ;; Function
          (4 . (fa_tag :face font-lock-function-name-face)) ;; Constructor
          (5 . (fa_cog :foreground "#FF9800")) ;; Field
          (6 . (fa_cog :foreground "#FF9800")) ;; Variable
          (7 . (fa_cube :foreground "#7C4DFF")) ;; Class
          (8 . (fa_cube :foreground "#7C4DFF")) ;; Interface
          (9 . (fa_cube :foreground "#7C4DFF")) ;; Module
          (10 . (fa_cog :foreground "#FF9800")) ;; Property
          (11 . md_settings_system_daydream) ;; Unit
          (12 . (fa_cog :foreground "#FF9800")) ;; Value
          (13 . (md_storage :face font-lock-type-face)) ;; Enum
          (14 . (md_closed_caption :foreground "#009688")) ;; Keyword
          (15 . md_closed_caption) ;; Snippet
          (16 . (md_color_lens :face font-lock-doc-face)) ;; Color
          (17 . fa_file_text_o) ;; File
          (18 . md_refresh) ;; Reference
          (19 . fa_folder_open) ;; Folder
          (20 . (md_closed_caption :foreground "#009688")) ;; EnumMember
          (21 . (fa_square :face font-lock-constant-face)) ;; Constant
          (22 . (fa_cube :face font-lock-type-face)) ;; Struct
          (23 . fa_calendar) ;; Event
          (24 . fa_square_o) ;; Operator
          (25 . fa_arrows)) ;; TypeParameter
        ))


;; /usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py

(provide 'wcx-companymode)

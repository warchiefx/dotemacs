(use-package js2-mode
  :ensure t
  :interpreter (("node" . js2-mode))
  :bind (:map js2-mode-map ("C-c C-p" . js2-print-json-path))
  :mode "\\.\\(js\\|json\\|mjs\\|node\\)$"
  :config
  (add-hook 'js-mode-hook 'js2-minor-mode)
  (setq js2-basic-offset 2
        js2-highlight-level 4
        js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil))

(use-package js2-refactor
  :defer t
  :diminish js2-refactor-mode
  :commands js2-refactor-mode
  :ensure t
  :init
  (add-hook 'js2-mode-hook #'js2-refactor-mode)
  :config
  (js2r-add-keybindings-with-prefix "C-c C-m"))

(use-package rjsx-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode)))

(use-package tern
  :diminish tern-mode
  :ensure t
  :config
  (add-hook 'js2-mode-hook 'tern-mode)
  (add-hook 'web-mode-hook 'tern-mode)
  (add-hook 'rjsx-mode-hook 'tern-mode))

(use-package company-tern
  :ensure t
  :config
  (add-to-list 'company-backends 'company-tern))

(use-package skewer-mode
  :ensure t
  :config
  (skewer-setup)
  (add-hook 'web-mode-hook 'skewer-mode)
  :diminish skewer-mode)

(use-package web-mode
  :ensure t
  :mode "\\.\\(html\\|hbs\\)$"
  :init
  (dolist (hook '(emmet-mode))
    (add-hook 'web-mode-hook hook))
  :config
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-pairing nil
        web-mode-enable-auto-closing t
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t)
  (add-hook 'web-mode-before-auto-complete-hooks
            '(lambda ()
               (let ((web-mode-cur-language (web-mode-language-at-pos)))
                 (if (string= web-mode-cur-language "css")
                     (setq emmet-use-css-transform t)
                   (setq emmet-use-css-transform nil))))))

(use-package emmet-mode
  :diminish emmet-mode
  :ensure t
  :init
  (dolist (hook '(sgml-mode-hook css-mode-hook kolon-mode-hook web-mode-hook))
    (add-hook hook 'emmet-mode))
  (setq emmet-expand-jsx-className? t))


(mapc (lambda (mode)
        (if (package-installed-p mode)
            t
          (if (assoc mode package-archive-contents)
              (package-install mode)
            (progn
              (package-refresh-contents)
              (package-install mode)))))
      '(jade-mode scss-mode sass-mode))

(use-package react-snippets
  :ensure t)

(use-package prettier-js
  :ensure t
  :diminish prettier-js-mode
  :config
  (add-hook 'js2-mode-hook 'prettier-js-mode)
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (setq prettier-js-args '(
                           "--trailing-comma" "all"
                           "--bracket-spacing" "false"
                           )))

(use-package ggtags
  :ensure t
  :config
  (add-hook 'js2-mode-hook (lambda () (ggtags-mode 1)))
  (add-hook 'js-mode-hook (lambda () (ggtags-mode 1)))
  (add-hook 'rjsx-mode-hook (lambda () (ggtags-mode 1)))
  (add-hook 'web-mode-hook (lambda () (ggtags-mode 1))))

(use-package indium
  :ensure t
  :config
  (add-hook 'rjsx-mode-hook #'indium-interaction-mode))

(provide 'wcx-webdev)

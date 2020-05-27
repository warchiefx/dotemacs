(use-package js2-mode
  :defer t
  :interpreter (("node" . js2-mode))
  :bind (:map js2-mode-map ("C-c C-p" . js2-print-json-path))
  :mode "\\.\\(js\\|json\\|mjs\\|node\\)$"
  :hook (js-mode . js2-minor-mode)
  :config
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
  :defer t
  :mode "\\.\\jsx\\$")

(use-package tern
  :diminish tern-mode
  :defer t
  :hook ((js2-mode web-mode rjsx-mode) . tern-mode))

;; (use-package company-tern
;;   :config
;;   (add-to-list 'company-backends 'company-tern))

(use-package skewer-mode
  :defer t
  :hook (web-mode . skewer-mode)
  :config
  (skewer-setup)
  :diminish skewer-mode)

(use-package web-mode
  :defer t
  :mode "\\.\\(html\\|hbs\\)$"
  :hook (web-mode . emmet-mode)
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
  :after web-mode
  :defer t
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

(use-package react-snippets)

(use-package prettier-js
  :diminish prettier-js-mode
  :hook ((js2-mode rjsx-mode) . prettier-js-mode)
  :config
  (setq prettier-js-args '(
                           "--trailing-comma" "all"
                           "--bracket-spacing" "false"
                           )))

(use-package ggtags
  :hook ((js2-mode js-mode rjsx-mode web-mode) . (lambda () (ggtags-mode 1))))

(use-package indium
  :hook (rjsx-mode . indium-interaction-mode))

(use-package restclient
  :defer t
  :mode ("\\.http\\'" . restclient-mode)
  :mode-hydra
  (restclient-mode
   ("Nav"
    (("n" restclient-jump-next "next" :exit nil)
     ("p" restclient-jump-prev "previous" :exit nil)
     ("N" restclient-narrow-to-current "narrow")
     ("W" widen "widen")
     ("q" nil "quit"))
    "Send"
    (("s" restclient-http-send-current-stay-in-window "send" :exit nil)
     ("S" restclient-http-send-current "send and jump")
     ("r" restclient-http-send-current-raw "send raw"))
    "Misc"
    (("w" restclient-copy-curl-command "copy curl")
     ("m" restclient-mark-current "mark")
     ("q" nil "quit")))))

(use-package verb
  :defer t
  :mode ("\\.verb\\'" . verb-mode)
  :mode-hydra
  (verb-mode
   ("Send"
    (("s" verb-send-request-on-point "Send")
     ("o" verb-send-request-on-point-other-window "Send (other window)")
     ("q" nil "quit"))
    "Cleanup"
    (("k" verb-auto-kill-response-buffers "Kill buffers"))
    "Nav"
    (("a" outline-show-all "Show all" :exit nil)
     ("p" outline-previous-visible-heading "Prev" :exit nil)
     ("n" outline-next-visible-heading "Next" :exit nil)
     ("c" verb-cycle "Cycle" :exit nil)
     ("e" verb-export-request-on-point "Export...")))
   ))

(provide 'wcx-webdev)

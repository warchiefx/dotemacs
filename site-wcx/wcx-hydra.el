(use-package major-mode-hydra
  :ensure t
  :bind
  ("C-<f12>" . major-mode-hydra))

(when (package-installed-p 'restclient)
  (major-mode-hydra-bind restclient-mode "Navigate"
    ("n" restclient-jump-next "next" :exit nil)
    ("p" restclient-jump-prev "previous" :exit nil)
    ("N" restclient-narrow-to-current "narrow")
    ("W" widen "widen")
    ("q" nil "quit"))
  (major-mode-hydra-bind restclient-mode "Send"
    ("s" restclient-http-send-current-stay-in-window "send" :exit nil)
    ("S" restclient-http-send-current "send and jump")
    ("r" restclient-http-send-current-raw "send raw"))
  (major-mode-hydra-bind restclient-mode "Misc"
    ("w" restclient-copy-curl-command "copy curl")
    ("m" restclient-mark-current "mark")
    ("q" nil "quit")))


(provide 'wcx-hydra)

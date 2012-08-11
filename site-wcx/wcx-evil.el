;;; wcx-evil.el --- Integrate EVIL vim compatibility

(add-to-list 'load-path (concat site-lisp-path "evil"))
(when (locate-library "evil")
  (require 'evil)
  (evil-mode 1))

(provide 'wcx-evil)

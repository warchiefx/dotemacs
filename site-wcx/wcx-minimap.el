;(add-to-list 'load-path (concat site-lisp-path "minimap"))

(when (locate-library "minimap")
  (load-library "minimap")

  (global-set-key [?\C-c ?m ?c] 'minimap-create)
  (global-set-key [?\C-c ?m ?k] 'minimap-kill))

(provide 'wcx-minimap)


(add-to-list 'load-path (concat site-lisp-path "jinja2"))

(when (locate-library "jinja2-mode")
  (load-library "jinja2-mode"))

(provide 'wcx-jinja2)

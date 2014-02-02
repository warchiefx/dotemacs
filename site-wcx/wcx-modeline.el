

;; (add-to-list 'load-path (concat site-lisp-path "emacs-powerline"))
;; (when (locate-library "powerline")
;;   (load-library "powerline")
;;   (setq powerline-arrow-shape 'arrow)   ;; the default
;;   (custom-set-faces
;;    '(mode-line ((t (:foreground "#030303" :background "#a0d115" :box nil))))
;;    '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
;;   )

(when (locate-library "smart-mode-line")
  (load-library "smart-mode-line")
  (setq sml/override-theme nil)
  (eval-after-load "wcx-color-theme"
    '(sml/setup)))


(provide 'wcx-modeline)

;;; wcx-modeline.el -- Modeline customization
;;; Commentary:
;;; Code:

(when (locate-library "smart-mode-line")
  (load-library "smart-mode-line")
  (setq sml/override-theme nil)
  (eval-after-load "wcx-color-theme"
    '(sml/setup)
    )
  (sml/apply-theme 'dark)
  )


(provide 'wcx-modeline)
;;; wcx-modeline.el ends here

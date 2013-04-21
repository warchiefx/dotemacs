;; wcx-color-theme.el --- Color themes
;;
;; Filename: wcx-color-theme.el
;; Description:
;; Author: Ricardo Restituyo
;; Email: warchiefx@gmail.com
;; Created: Wed Oct 22 11:51:19 2008
;;
;; Last-Updated: Wed Mar 24 10:45:39 2010 (-14400 -0400)
;;           By: Ricardo Restituyo
;; Version: $Id$
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; http://www.emacswiki.org/cgi-bin/wiki.pl?ColorTheme
(when (locate-library "color-theme")
  (load-library "color-theme")
  (setq color-theme-is-global t)
  ;; (color-theme-pok-wob)
  ;; (color-theme-charcoal-black)
  ;; (color-theme-dark-laptop)
  ;; (color-theme-late-night)
  ;; (color-theme-midnight)

  (defun color-theme-wcx-dark ()
    "WCX Color Theme, adapted from djbc"
    (interactive)
    (color-theme-install
     '(color-theme-wcx-dark
       ((foreground-color . "#bbbbbb")
        (background-color . "black")
        (background-mode . dark))
       (bold ((t (:bold t))))
       (bold-italic ((t (:italic t :bold t))))
       (default ((t (nil))))

       (font-lock-builtin-face ((t (:bold t :foreground "#A6E22A"))))
       (font-lock-comment-face ((t (:bold t :foreground "#888888"))))
       (font-lock-comment-delimiter-face ((t (:foreground "#666666"))))
       (font-lock-constant-face ((t (:bold t :foreground "#197b6e"))))
       (font-lock-doc-string-face ((t (:foreground "#3041c4"))))
       (font-lock-doc-face ((t (:foreground "gray"))))
       (font-lock-reference-face ((t (:foreground "white"))))
       (font-lock-function-name-face ((t (:foreground "#356da0"))))
       (font-lock-keyword-face ((t (:bold t :foreground "#bcf0f1"))))
       (font-lock-preprocessor-face ((t (:foreground "#e3ea94"))))
       (font-lock-string-face ((t (:foreground "#54BE0D"))))
       (font-lock-type-face ((t (:bold t :foreground "#364498"))))
       (font-lock-variable-name-face ((t (:foreground "#7685de"))))
       (font-lock-warning-face ((t (:bold t :italic nil
                                          :foreground "yellow"))))
       (hl-line ((t (:background "#112233"))))
       (mode-line ((t (:foreground "#ffffff" :background "#333333"))))
       (region ((t (:foreground nil :background "#555555"))))
       (show-paren-match-face ((t (:bold t :foreground "#ffffff"
                                         :background "#050505")))))))
  (provide 'color-theme-wcx-dark)
  ;; (color-theme-wcx-dark)
  )

(defun wcx-color-theme ()
  (interactive)
  (color-theme-install
   '(wcx-color-theme
     ((background-color . "#000000")
      (background-mode . light)
      (border-color . "#1a1a1a")
      (cursor-color . "#5c0003")
      (foreground-color . "#f7f7f7")
      (mouse-color . "black"))
     (fringe ((t (:background "#1a1a1a"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#000000"))))
     (region ((t (:background "#333333"))))
     (font-lock-builtin-face ((t (:foreground "#25b51c"))))
     (font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-keyword-face ((t (:foreground "#8cdc5b"))))
     (font-lock-string-face ((t (:foreground "#7598f0"))))
     (font-lock-type-face ((t (:foreground"#cb9a06"))))
     (font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'wcx-color-theme)
;;(wcx-color-theme)

(defun wcx-color-theme-3 ()
  (interactive)
  (color-theme-install
   '(wcx-color-theme-3
      ((background-color . "#010101")
      (background-mode . light)
      (border-color . "#303030")
      (cursor-color . "#ffffff")
      (foreground-color . "#f2f2f2")
      (mouse-color . "black"))
     (fringe ((t (:background "#303030"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#020202"))))
     (region ((t (:background "#383838"))))
     (font-lock-builtin-face ((t (:foreground "#6bb3ff"))))
     (font-lock-comment-face ((t (:foreground "#677689"))))
     (font-lock-function-name-face ((t (:foreground "#8abde0"))))
     (font-lock-keyword-face ((t (:foreground "#a0d115"))))
     (font-lock-string-face ((t (:foreground "#cb9a06"))))
     (font-lock-type-face ((t (:foreground"#8d49ee"))))
     (font-lock-variable-name-face ((t (:foreground "#999999"))))
     (minibuffer-prompt ((t (:foreground "#d02f11" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'wcx-color-theme-3)

;; http://log.coffeesounds.com/bespin-theme-from-emacs , with a dark background.
(defun color-theme-bespin ()
  (interactive)
  (color-theme-install
   '(color-theme-bespin
     ((background-color . "#111111")
      (foreground-color . "#BAAE9E")
      (cursor-color . "#A7A7A7"))
     (default ((t (nil))))
     (modeline ((t (:background "white" :foreground "black" :box (:line-width 1 :style released-button))))) ;
     (font-lock-builtin-face ((t (:foreground "#A6E22A")))) ;
     (font-lock-comment-face ((t (:italic t :foreground "#888888"))));
     (font-lock-constant-face ((t (:foreground "#DDF2A4")))) ;
     (font-lock-doc-string-face ((t (:foreground "#5EA6EA")))) ;
     (font-lock-string-face ((t (:foreground "#54BE0D")))) ;
     (font-lock-function-name-face ((t (:foreground "#937121" :italic t)))) ;
     (font-lock-keyword-face ((t (:bold :foreground "#5EA6EA")))) ;
     (font-lock-type-face ((t (:bold t :foreground "#89BDFF"))))
     (font-lock-variable-name-face ((t (:foreground "#7587A6" :bold t))));
     (font-lock-warning-face ((t (:bold t :foreground "#F9EE98"))))
     (highlight-80+ ((t (:background "#F9EE98"))))
     (hl-line ((t (:background "#1A1A1A"))))
     (region ((t (:background "#1a1a1a"))))
     (ido-subdir ((t (:foreground "#F1266F"))))
     )))
;; (color-theme-bespin)
(provide 'color-theme-bespin)

;; (load-theme 'monokai)
;; (load-theme 'zenburn)
(wcx-color-theme-3)
;;(color-theme-sanityinc-tomorrow-night)
;; (color-theme-sanityinc-solarized-light)

;;(load-theme 'tango-2)
;;(load-theme 'zen-and-art)


(provide 'wcx-color-theme)

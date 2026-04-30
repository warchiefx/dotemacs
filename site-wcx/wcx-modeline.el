;;; wcx-modeline.el --- Modeline (doom-modeline) -*- lexical-binding: t -*-
;;; Commentary:
;; Single modeline implementation. The previous version had four packages
;; (smart-mode-line, spaceline, simple-modeline, doom-modeline) plus a
;; large telephone-line custom layout — they fought each other at frame
;; creation, which produced the format flicker.
;;
;; Run `M-x nerd-icons-install-fonts' once if the segment glyphs render
;; as boxes; doom-modeline switched from all-the-icons to nerd-icons
;; upstream.
;;; Code:

(use-package nerd-icons
  :ensure t)

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-height 28)
  (doom-modeline-bar-width 3)
  (doom-modeline-buffer-file-name-style 'relative-from-project)
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon t)
  (doom-modeline-major-mode-color-icon t)
  (doom-modeline-buffer-state-icon t)
  (doom-modeline-buffer-modification-icon t)
  (doom-modeline-minor-modes nil)        ; respects diminish/delight
  (doom-modeline-enable-word-count nil)
  (doom-modeline-buffer-encoding nil)
  (doom-modeline-vcs-max-length 18)
  (doom-modeline-checker-simple-format nil)
  (doom-modeline-env-version t)          ; show Python/Node version when active
  (doom-modeline-github nil)
  (doom-modeline-modal-icon t)           ; evil state indicator
  (find-file-visit-truename t)
  (inhibit-compacting-font-caches t))

(provide 'wcx-modeline)
;;; wcx-modeline.el ends here

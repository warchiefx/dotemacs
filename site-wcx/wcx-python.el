(when (locate-library "elpy")
  (load-library "elpy")
  (elpy-enable)
  (elpy-use-ipython))

(setq py-autopep8-options '("--max-line-length=120"))

(setq python-saved-check-command nil)


;; Taken and adapted from: http://railscoder.net/emacs/elisp/ruby/2014/07/16/emacs-ruby-space-replace/
(defun kdt-python-method-space-replace ()
  "When pressing space while naming a defined method, insert an underscore"
  (interactive)
  (if (and (looking-back "def .+")
           (not (and
                 (looking-at ".*)$")
                 (looking-back "(.*"))))
      (insert "_")
    (insert " ")))

(eval-after-load 'elpy-mode
  '(progn
     (define-key elpy-mode-map (kbd "SPC") 'kdt-python-method-space-replace)))

;; Standard Jedi.el setting
(when (locate-library "jedi")
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t))

(provide 'wcx-python)
;;; wcx-python.el ends here

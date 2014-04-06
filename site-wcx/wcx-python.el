(when (locate-library "elpy")
  (load-library "elpy")
  (elpy-enable)
  (elpy-clean-modeline)
  (elpy-use-ipython))

(setq py-autopep8-options '("--max-line-length=120"))

(setq python-saved-check-command nil)

(provide 'wcx-python)
;;; wcx-python.el ends here

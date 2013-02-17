
(when (locate-library "monky")
  (require 'monky)
  (setq monky-process-type 'cmdserver)
  (global-set-key [?\C-c ?\C-x ?m] 'monky-status))

(provide 'wcx-mercurial)

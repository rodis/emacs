;;; package --- popwin configuration

;;; Commentary:
(require 'popwin)

;;; Code:
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config
      '(("*Help*" :height 30)
        ("*Completions*" :noselect t)
        ("*Occur*" :stick t)
        ("*Browse code*")
))

(provide 'rds-popwin)
;;; rds-popwin ends here
